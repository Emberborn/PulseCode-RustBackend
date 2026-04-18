use super::target_model::default_target_id;
use super::*;
use std::collections::hash_map::DefaultHasher;
use std::hash::{Hash, Hasher};
use std::time::{Duration, Instant, SystemTime, UNIX_EPOCH};

fn build_resolution_timing_enabled() -> bool {
    env::var_os("PULSEC_TIMING_BUILD_RESOLUTION").is_some()
}

fn emit_build_resolution_timing(label: &str, started_at: Instant) {
    if build_resolution_timing_enabled() {
        eprintln!(
            "[timing][build-resolution] {}: {} ms",
            label,
            started_at.elapsed().as_millis()
        );
    }
}

fn adk_build_bridge_workspace_root() -> PathBuf {
    Path::new(env!("CARGO_MANIFEST_DIR"))
        .parent()
        .and_then(|path| path.parent())
        .unwrap_or_else(|| Path::new("."))
        .to_path_buf()
}

struct AuthorBuildBridgeLock {
    path: PathBuf,
}

const AUTHOR_BUILD_BRIDGE_LOCK_INFO_FILE: &str = "owner.txt";
const AUTHOR_BUILD_BRIDGE_LOCK_POLL_INTERVAL: Duration = Duration::from_millis(10);
const AUTHOR_BUILD_BRIDGE_LOCK_ORPHANED_INFO_GRACE: Duration = Duration::from_secs(1);
const AUTHOR_BUILD_BRIDGE_LOCK_STALE_AFTER: Duration = Duration::from_secs(30);

impl Drop for AuthorBuildBridgeLock {
    fn drop(&mut self) {
        let _ = fs::remove_dir_all(&self.path);
    }
}

pub(super) fn split_optional_entry_arg(args: &[String]) -> (Option<&str>, &[String]) {
    if args.is_empty() {
        return (None, args);
    }
    if args[0].starts_with("--") {
        (None, args)
    } else {
        (Some(args[0].as_str()), &args[1..])
    }
}

#[derive(Debug, Clone)]
pub(super) struct CheckInvocation {
    pub(super) entry_path: String,
    pub(super) source_root: Option<String>,
    pub(super) used_manifest: bool,
    pub(super) adklib_enabled: bool,
}

#[derive(Debug, Clone)]
pub(super) struct BuildInvocation {
    pub(super) entry_path: String,
    pub(super) source_root: Option<String>,
    pub(super) build_root: PathBuf,
    pub(super) output_root: PathBuf,
    pub(super) main_aden_root: PathBuf,
    pub(super) main_resources_root: PathBuf,
    pub(super) build_asm_dir: PathBuf,
    pub(super) build_generated_dir: PathBuf,
    pub(super) build_assets_dir: PathBuf,
    pub(super) build_sanity_dir: PathBuf,
    pub(super) build_tmp_dir: PathBuf,
    pub(super) profile: String,
    pub(super) target: String,
    pub(super) output_mode: String,
    pub(super) output_entry: String,
    pub(super) runtime_debug_allocator: String,
    pub(super) runtime_cycle_collector: String,
    pub(super) assembler: Option<String>,
    pub(super) linker: Option<String>,
    pub(super) package_name: Option<String>,
    pub(super) package_version: Option<String>,
    pub(super) used_manifest: bool,
    pub(super) adklib_enabled: bool,
}

#[derive(Debug, Clone)]
pub(super) struct TestInvocation {
    pub(super) project_root: PathBuf,
    pub(super) source_root: PathBuf,
    pub(super) tests_root: PathBuf,
    pub(super) used_manifest: bool,
    pub(super) adklib_enabled: bool,
}

#[derive(Debug, Clone)]
pub(super) struct BuildRun {
    pub(super) resolved: BuildInvocation,
    pub(super) files_loaded: usize,
    pub(super) artifact: BackendArtifact,
    pub(super) build_config_plan_path: PathBuf,
}

#[derive(Debug, Clone)]
pub(super) struct ManifestSources {
    pub(super) root: String,
    pub(super) main_aden: Option<String>,
    pub(super) main_resources: Option<String>,
    pub(super) test_aden: Option<String>,
    pub(super) test_resources: Option<String>,
    pub(super) api_aden: Option<String>,
    pub(super) api_resources: Option<String>,
    pub(super) docs: Option<String>,
    pub(super) libraries: Option<String>,
    pub(super) entry: Option<String>,
}

#[derive(Debug, Clone)]
pub(super) struct ManifestBuild {
    pub(super) profile: Option<String>,
    pub(super) target: Option<String>,
    pub(super) output_mode: Option<String>,
    pub(super) output_entry: Option<String>,
    pub(super) runtime_debug_allocator: Option<String>,
    pub(super) runtime_cycle_collector: Option<String>,
    pub(super) out_dir: Option<String>,
    pub(super) asm_dir: Option<String>,
    pub(super) generated_dir: Option<String>,
    pub(super) assets_dir: Option<String>,
    pub(super) sanity_dir: Option<String>,
    pub(super) tmp_dir: Option<String>,
    pub(super) distro_dir: Option<String>,
}

#[derive(Debug, Clone)]
pub(super) struct ManifestToolchain {
    pub(super) linker: Option<String>,
    pub(super) assembler: Option<String>,
}

#[derive(Debug, Clone)]
pub(super) struct ManifestPackage {
    pub(super) name: String,
    pub(super) version: String,
}

#[derive(Debug, Clone)]
pub(super) struct ManifestWorkspace {
    pub(super) members: Vec<String>,
}

#[derive(Debug, Clone)]
pub(super) struct ManifestAdklib {
    pub(super) enabled: bool,
}

#[derive(Debug, Clone)]
pub(super) struct ManifestConfig {
    pub(super) package: Option<ManifestPackage>,
    pub(super) workspace: Option<ManifestWorkspace>,
    pub(super) adklib: Option<ManifestAdklib>,
    pub(super) sources: ManifestSources,
    pub(super) build: ManifestBuild,
    pub(super) toolchain: ManifestToolchain,
}

#[derive(Debug, Clone)]
pub(super) struct WorkspaceContext {
    pub(super) root: PathBuf,
    pub(super) member_roots: Vec<PathBuf>,
}

pub(super) fn normalize_output_mode(raw: &str) -> Option<&'static str> {
    match raw {
        "fat" | "single_exe" => Some("fat"),
        "shared" | "exe_with_dlls" => Some("shared"),
        _ => None,
    }
}

fn resolve_build_invocation_via_adklib(
    entry_arg: Option<&str>,
    flags: &CliFlags,
) -> Result<BuildInvocation, String> {
    let total_started_at = Instant::now();
    let direct_source_root_override = flags.source_root.clone();
    let direct_entry_override = if let Some(entry) = entry_arg {
        Some(entry.to_string())
    } else if let Some(src_root) = direct_source_root_override.as_ref() {
        discover_entry_from_source_root(Path::new(src_root))?.map(|path| path.display().to_string())
    } else {
        None
    };
    let cache_root = adk_build_bridge_cache_root();
    let bridge_lock_started_at = Instant::now();
    let _lock = acquire_adk_build_bridge_lock(&cache_root)?;
    emit_build_resolution_timing("bridge lock wait", bridge_lock_started_at);
    let exe = resolve_cached_adk_build_bridge_runner(&cache_root)?;
    emit_build_resolution_timing("bridge resolve cached runner", bridge_lock_started_at);
    let request_text = emit_build_invocation_bridge_request(
        &bridge_start_path(entry_arg, flags)?,
        flags.project_root.as_deref(),
        direct_source_root_override.as_deref(),
        direct_entry_override.as_deref(),
        flags.profile.as_deref(),
        flags.target.as_deref(),
        flags.output_mode.as_deref(),
        flags.runtime_debug_allocator.as_deref(),
        flags.runtime_cycle_collector.as_deref(),
        flags.out_dir.as_deref(),
        flags.assembler.as_deref(),
        flags.linker.as_deref(),
    );
    let run_started_at = Instant::now();
    let bridge_result = run_adk_build_bridge_request_inner(&cache_root, &exe, &request_text)
        .and_then(|stdout| parse_build_invocation_bridge_output(&stdout));
    emit_build_resolution_timing("bridge exe run", run_started_at);
    emit_build_resolution_timing("bridge total", total_started_at);
    bridge_result
}

fn bridge_start_path(entry_arg: Option<&str>, flags: &CliFlags) -> Result<String, String> {
    if let Some(root) = &flags.project_root {
        return Ok(root.clone());
    }
    if let Some(entry) = entry_arg {
        return Ok(entry.to_string());
    }
    env::current_dir()
        .map(|path| path.display().to_string())
        .map_err(|e| format!("Failed to resolve current directory for adk bridge: {e}"))
}

fn emit_build_invocation_bridge_source() -> String {
    let debug_prelude = if env::var_os("PULSEC_DEBUG_AUTHOR_BRIDGE").is_some() {
        r#"
                IO.print("bridge:before_resolve\n");
        "#
    } else {
        ""
    };
    let debug_after_resolve = if env::var_os("PULSEC_DEBUG_AUTHOR_BRIDGE").is_some() {
        r#"
                IO.print("bridge:after_resolve\n");
        "#
    } else {
        ""
    };
    let debug_request = if env::var_os("PULSEC_DEBUG_AUTHOR_BRIDGE").is_some() {
        r#"
                IO.print("bridge:request=");
                IO.print(request);
                IO.print("\n");
        "#
    } else {
        ""
    };
    let debug_after_render = if env::var_os("PULSEC_DEBUG_AUTHOR_BRIDGE").is_some() {
        r#"
                IO.print("bridge:after_render\n");
        "#
    } else {
        ""
    };
    format!(
        r#"
        package bridge.internal;

        import adk.build.BuildInvocation;
        import adk.build.BuildInvocationBridge;
        import adk.build.BuildLayout;
        import adk.build.BuildPipelineExecutionBridge;
        import adk.build.BuildPipelineExecutionProvider;
        import adk.build.BuildPipelineExecutionResult;
        import adk.build.BuildPublishedArtifact;
        import adk.build.BuildPublishedArtifactBridge;
        import adk.build.BuildPublicationPlan;
        import adk.build.BuildPublicationPlanBridge;
        import adk.build.BuildSummaryWriter;
        import adk.build.WorkspaceBuildMemberResult;
        import adk.build.WorkspaceBuildExecutionBridge;
        import adk.build.WorkspaceBuildExecutionProvider;
        import adk.build.WorkspaceBuildExecutionResult;
        import adk.build.WorkspaceBuildResult;
        import adk.build.BuildPublicationWriter;
        import adk.build.BuildInvocationResolver;
        import adk.project.CheckInvocationBridge;
        import adk.project.ProjectDiscovery;
        import adk.project.ProjectDiscoveryBridge;
        import adk.project.ProjectInvocationResolver;
        import adk.project.TestInvocationBridge;
        import adk.project.WorkspaceContext;
        import adk.project.WorkspaceContextBridge;
        import adk.compiler.CheckResult;
        import adk.compiler.BuildCoreExecutionBridge;
        import adk.compiler.BuildCoreExecutionProvider;
        import adk.compiler.BuildCoreExecutionResult;
        import adk.compiler.CheckExecutionBridge;
        import adk.compiler.CheckExecutionProvider;
        import adk.compiler.CheckExecutionResult;
        import adk.compiler.CheckSummaryWriter;
        import adk.compiler.TestDiagnosticWriter;
        import adk.compiler.TestDiscoveryResult;
        import adk.compiler.TestExecutionResult;
        import adk.compiler.TestExecutionWriter;
        import adk.compiler.TestFileExecutionBridge;
        import adk.compiler.TestFileExecutionProvider;
        import adk.compiler.TestFileExecutionResult;
        import adk.compiler.TestResult;
        import adk.compiler.TestSummaryWriter;
        import adk.compiler.WorkspaceCheckExecutionBridge;
        import adk.compiler.WorkspaceCheckExecutionProvider;
        import adk.compiler.WorkspaceCheckExecutionResult;
        import adk.compiler.WorkspaceCheckMemberResult;
        import adk.compiler.WorkspaceCheckResult;
        import adk.compiler.WorkspaceTestExecutionBridge;
        import adk.compiler.WorkspaceTestExecutionProvider;
        import adk.compiler.WorkspaceTestExecutionResult;
        import adk.compiler.WorkspaceTestResult;
        import adk.toolchain.ToolchainCandidateBridge;
        import adk.toolchain.ToolchainCandidatePlan;
        import adk.toolchain.ToolchainConfig;
        import adk.toolchain.ToolchainDiscoveryBridge;
        import adk.toolchain.ToolchainDiscoveryPlan;
        import adk.toolchain.ToolchainDiscoveryResolver;
        import adk.toolchain.ToolchainDiscoveryResult;
        import adk.toolchain.ToolchainDiscoveryResultBridge;
        import adk.toolchain.ToolchainHostFilesystem;
        import adk.toolchain.ToolchainProcessResultBridge;
        import aden.collections.ArrayList;
        import aden.lang.IO;
        import aden.lang.Integer;
        import aden.lang.System;
        import aden.process.ProcessEnvironment;
        import aden.process.ProcessEnvironmentVariable;
        import aden.process.ProcessPlan;
        import aden.process.ProcessResult;
        import aden.process.Processes;

        class Main {{
            public static void main() {{
                {debug_prelude}
                String mode = Main.readLine();
                if (mode == null) {{
                    mode = "";
                }}
                if (mode.equals("build")) {{
                    String request = Main.readLines(12);
                    {debug_request}
                    BuildInvocation invocation = BuildInvocationResolver.resolveBuildInvocation(
                        Main.readValue(request, 0),
                        Main.readValue(request, 1),
                        Main.readValue(request, 2),
                        Main.readValue(request, 3),
                        Main.readValue(request, 4),
                        Main.readValue(request, 5),
                        Main.readValue(request, 6),
                        Main.readValue(request, 7),
                        Main.readValue(request, 8),
                        Main.readValue(request, 9),
                        Main.readValue(request, 10),
                        Main.readValue(request, 11)
                    );
                    {debug_after_resolve}
                    String text = BuildInvocationBridge.toBridgeText(invocation);
                    {debug_after_render}
                    IO.print(text);
                    return;
                }}
                if (mode.equals("project-resolve-check-invocation")) {{
                    IO.print(Main.resolveProjectCheckInvocationBridgeText(Main.readLines(3)));
                    return;
                }}
                if (mode.equals("project-resolve-test-invocation")) {{
                    IO.print(Main.resolveProjectTestInvocationBridgeText(Main.readLines(2)));
                    return;
                }}
                if (mode.equals("project-discover-test-files")) {{
                    IO.print(ProjectDiscoveryBridge.toBridgeText(
                        ProjectDiscovery.discoverTestFiles(Main.readValue(Main.readLines(1), 0))
                    ));
                    return;
                }}
                if (mode.equals("project-resolve-workspace-context")) {{
                    WorkspaceContext context = ProjectDiscovery.resolveWorkspaceContext(
                        Main.readValue(Main.readLines(1), 0)
                    );
                    if (context != null) {{
                        IO.print(WorkspaceContextBridge.toBridgeText(context));
                    }}
                    return;
                }}
                if (mode.equals("toolchain-discovery")) {{
                    ToolchainDiscoveryPlan plan = ToolchainDiscoveryResolver.planWindowsDiscovery();
                    String text = ToolchainDiscoveryBridge.toBridgeText(plan);
                    IO.print(text);
                    return;
                }}
                if (mode.equals("toolchain-probe")) {{
                    ToolchainDiscoveryPlan plan = ToolchainDiscoveryResolver.planWindowsDiscovery();
                    ToolchainDiscoveryResult result = ToolchainDiscoveryResolver.probeWindowsDiscovery(plan);
                    String text = ToolchainDiscoveryResultBridge.toBridgeText(result);
                    IO.print(text);
                    return;
                }}
                if (mode.equals("toolchain-probe-custom")) {{
                    String request = Main.readLines(5);
                    ToolchainDiscoveryPlan plan = new ToolchainDiscoveryPlan(
                        Main.parseLines(Main.readValue(request, 0)),
                        Main.readValue(request, 1),
                        Main.readValue(request, 2),
                        Main.parseLines(Main.readValue(request, 3)),
                        Main.readValue(request, 4)
                    );
                    ToolchainDiscoveryResult result = ToolchainDiscoveryResolver.probeWindowsDiscovery(plan);
                    String text = ToolchainDiscoveryResultBridge.toBridgeText(result);
                    IO.print(text);
                    return;
                }}
                if (mode.equals("toolchain-candidates")) {{
                    String request = Main.readLines(3);
                    ToolchainCandidatePlan plan = ToolchainDiscoveryResolver.planCandidates(
                        Main.readValue(request, 0),
                        Main.readValue(request, 1),
                        Main.readValue(request, 2)
                    );
                    String text = ToolchainCandidateBridge.toBridgeText(plan);
                    IO.print(text);
                    return;
                }}
                if (mode.equals("toolchain-write-response-file")) {{
                    String request = Main.readLines(2);
                    int argumentCount = Main.parseCount(Main.readValue(request, 1));
                    ArrayList<String> arguments = new ArrayList<String>();
                    int argumentIndex = 0;
                    while (argumentIndex < argumentCount) {{
                        arguments.add(Main.decodeValue(Main.readLine()));
                        argumentIndex = argumentIndex + 1;
                    }}
                    String writtenPath = ToolchainHostFilesystem.writeResponseFile(
                        Main.readValue(request, 0),
                        arguments
                    );
                    IO.print(writtenPath);
                    return;
                }}
                if (mode.equals("toolchain-execute-process")) {{
                    String request = Main.readLines(7);
                    int overrideCount = Main.parseCount(Main.readValue(request, 5));
                    int argumentCount = Main.parseCount(Main.readValue(request, 6));
                    ArrayList<ProcessEnvironmentVariable> overrides =
                        new ArrayList<ProcessEnvironmentVariable>();
                    int overrideIndex = 0;
                    while (overrideIndex < overrideCount) {{
                        String name = Main.decodeValue(Main.readLine());
                        String value = Main.decodeValue(Main.readLine());
                        overrides.add(new ProcessEnvironmentVariable(name, value));
                        overrideIndex = overrideIndex + 1;
                    }}
                    ArrayList<String> arguments = new ArrayList<String>();
                    int argumentIndex = 0;
                    while (argumentIndex < argumentCount) {{
                        arguments.add(Main.decodeValue(Main.readLine()));
                        argumentIndex = argumentIndex + 1;
                    }}
                    ProcessPlan process = new ProcessPlan(
                        Main.readValue(request, 0),
                        Main.readValue(request, 1),
                        arguments,
                        new ProcessEnvironment(
                            Main.readValue(request, 4).equals("true"),
                            overrides
                        )
                    );
                    ProcessResult result = Processes.execute(
                        process,
                        Main.readValue(request, 2),
                        Main.readValue(request, 3)
                    );
                    IO.print(ToolchainProcessResultBridge.toBridgeText(result));
                    return;
                }}
                if (mode.equals("build-write-launch-metadata")) {{
                    String request = Main.readLines(7);
                    String writtenPath = BuildPublicationWriter.writeSharedRuntimeLookupMetadata(
                        Main.readValue(request, 0),
                        Main.readValue(request, 1),
                        Main.readValue(request, 2),
                        Main.readValue(request, 3),
                        Main.readValue(request, 4),
                        Main.readValue(request, 5),
                        Main.readValue(request, 6)
                    );
                    if (writtenPath != null) {{
                        IO.print(writtenPath);
                    }}
                    return;
                }}
                if (mode.equals("build-write-artifact-stamp")) {{
                    String request = Main.readLines(5);
                    String writtenPath = BuildPublicationWriter.writeArtifactStamp(
                        Main.readValue(request, 0),
                        Main.readValue(request, 1),
                        Main.readValue(request, 2),
                        Main.readValue(request, 3),
                        Main.readValue(request, 4)
                    );
                    if (writtenPath != null) {{
                        IO.print(writtenPath);
                    }}
                    return;
                }}
                if (mode.equals("build-copy-file")) {{
                    String request = Main.readLines(2);
                    String writtenPath = BuildPublicationWriter.copyFile(
                        Main.readValue(request, 0),
                        Main.readValue(request, 1)
                    );
                    if (writtenPath != null) {{
                        IO.print(writtenPath);
                    }}
                    return;
                }}
                if (mode.equals("build-copy-recursive")) {{
                    String request = Main.readLines(2);
                    String writtenPath = BuildPublicationWriter.copyRecursive(
                        Main.readValue(request, 0),
                        Main.readValue(request, 1)
                    );
                    if (writtenPath != null) {{
                        IO.print(writtenPath);
                    }}
                    return;
                }}
                if (mode.equals("build-copy-recursive-extension")) {{
                    String request = Main.readLines(3);
                    String writtenPath = BuildPublicationWriter.copyRecursiveMatchingExtension(
                        Main.readValue(request, 0),
                        Main.readValue(request, 1),
                        Main.readValue(request, 2)
                    );
                    if (writtenPath != null) {{
                        IO.print(writtenPath);
                    }}
                    return;
                }}
                if (mode.equals("build-materialize-layout")) {{
                    String request = Main.readLines(11);
                    String writtenPath = BuildPublicationWriter.materializeBuildLayout(
                        Main.readValue(request, 0),
                        Main.readValue(request, 1),
                        Main.readValue(request, 2),
                        Main.readValue(request, 3),
                        Main.readValue(request, 4),
                        Main.readValue(request, 5),
                        Main.readValue(request, 6),
                        Main.readValue(request, 7),
                        Main.readValue(request, 8),
                        Main.readValue(request, 9),
                        Main.readValue(request, 10)
                    );
                    if (writtenPath != null) {{
                        IO.print(writtenPath);
                    }}
                    return;
                }}
                if (mode.equals("build-publication-plan")) {{
                    String request = Main.readLines(19);
                    BuildPublicationPlan plan = BuildPublicationWriter.resolvePublicationPlan(
                        Main.readValue(request, 0),
                        Main.readValue(request, 1),
                        Main.readValue(request, 2),
                        Main.readValue(request, 3),
                        Main.readValue(request, 4),
                        Main.readValue(request, 5),
                        Main.readValue(request, 6),
                        Main.readValue(request, 7),
                        Main.readValue(request, 8),
                        Main.readValue(request, 9),
                        Main.readValue(request, 10),
                        Main.readValue(request, 11),
                        Main.readValue(request, 12),
                        Main.readValue(request, 13),
                        Main.readValue(request, 14),
                        Main.readValue(request, 15),
                        Main.readValue(request, 16),
                        Main.readValue(request, 17).equals("true"),
                        Main.readValue(request, 18).equals("true")
                    );
                    IO.print(BuildPublicationPlanBridge.toBridgeText(plan));
                    return;
                }}
                if (mode.equals("build-write-config-plan")) {{
                    String request = Main.readLines(41);
                    String writtenPath = BuildPublicationWriter.writeBuildConfigPlan(
                        Main.readValue(request, 0),
                        Main.readValue(request, 1),
                        Main.readValue(request, 2),
                        Main.readValue(request, 3),
                        Main.readValue(request, 4),
                        Main.readValue(request, 5),
                        Main.readValue(request, 6),
                        Main.readValue(request, 7),
                        Main.readValue(request, 8),
                        Main.readValue(request, 9),
                        Main.readValue(request, 10),
                        Main.readValue(request, 11),
                        Main.readValue(request, 12),
                        Main.readValue(request, 13),
                        Main.readValue(request, 14),
                        Main.readValue(request, 15),
                        Main.readValue(request, 16),
                        Main.readValue(request, 17),
                        Main.readValue(request, 18),
                        Main.readValue(request, 19),
                        Main.readValue(request, 20),
                        Main.readValue(request, 21),
                        Main.readValue(request, 22),
                        Main.readValue(request, 23),
                        Main.readValue(request, 24),
                        Main.readValue(request, 25),
                        Main.readValue(request, 26),
                        Main.readValue(request, 27),
                        Main.readValue(request, 28),
                        Main.readValue(request, 29),
                        Main.readValue(request, 30),
                        Main.readValue(request, 31),
                        Main.readValue(request, 32),
                        Main.readValue(request, 33),
                        Main.readValue(request, 34),
                        Main.readValue(request, 35),
                        Main.readValue(request, 36),
                        Main.readValue(request, 37),
                        Main.readValue(request, 38),
                        Main.readValue(request, 39),
                        Main.readValue(request, 40)
                    );
                    if (writtenPath != null) {{
                        IO.print(writtenPath);
                    }}
                    return;
                }}
                if (mode.equals("build-publish-artifacts")) {{
                    String request = Main.readLines(22);
                    BuildPublishedArtifact published = BuildPublicationWriter.publishArtifacts(
                        Main.readValue(request, 0),
                        Main.readValue(request, 1),
                        Main.readValue(request, 2),
                        Main.readValue(request, 3),
                        Main.readValue(request, 4),
                        Main.readValue(request, 5),
                        Main.readValue(request, 6),
                        Main.readValue(request, 7),
                        Main.readValue(request, 8),
                        Main.readValue(request, 9).equals("true"),
                        Main.readValue(request, 10).equals("true"),
                        Main.readValue(request, 11).equals("true"),
                        Main.readValue(request, 12),
                        Main.readValue(request, 13),
                        Main.readValue(request, 14),
                        Main.readValue(request, 15),
                        Main.readValue(request, 16),
                        Main.readValue(request, 17),
                        Main.readValue(request, 18),
                        Main.readValue(request, 19),
                        Main.readValue(request, 20),
                        Main.readValue(request, 21)
                    );
                    if (published != null) {{
                        IO.print(BuildPublishedArtifactBridge.toBridgeText(published));
                    }}
                    return;
                }}
                if (mode.equals("build-finalize-artifacts")) {{
                    String request = Main.readLines(53);
                    String text = BuildPublicationWriter.finalizeBuildBridgeText(
                        Main.readValue(request, 0),
                        Main.readValue(request, 1),
                        Main.readValue(request, 2),
                        Main.readValue(request, 3),
                        Main.readValue(request, 4),
                        Main.readValue(request, 5),
                        Main.readValue(request, 6),
                        Main.readValue(request, 7),
                        Main.readValue(request, 8),
                        Main.readValue(request, 9),
                        Main.readValue(request, 10),
                        Main.readValue(request, 11),
                        Main.readValue(request, 12),
                        Main.readValue(request, 13),
                        Main.readValue(request, 14),
                        Main.readValue(request, 15),
                        Main.readValue(request, 16),
                        Main.readValue(request, 17),
                        Main.readValue(request, 18),
                        Main.readValue(request, 19),
                        Main.readValue(request, 20),
                        Main.readValue(request, 21),
                        Main.readValue(request, 22),
                        Main.readValue(request, 23),
                        Main.readValue(request, 24),
                        Main.readValue(request, 25),
                        Main.readValue(request, 26),
                        Main.readValue(request, 27).equals("true"),
                        Main.readValue(request, 28).equals("true"),
                        Main.readValue(request, 29),
                        Main.readValue(request, 30),
                        Main.readValue(request, 31),
                        Main.readValue(request, 32),
                        Main.readValue(request, 33),
                        Main.readValue(request, 34),
                        Main.readValue(request, 35),
                        Main.readValue(request, 36),
                        Main.readValue(request, 37),
                        Main.readValue(request, 38),
                        Main.readValue(request, 39),
                        Main.readValue(request, 40),
                        Main.readValue(request, 41),
                        Main.readValue(request, 42),
                        Main.readValue(request, 43),
                        Main.readValue(request, 44),
                        Main.readValue(request, 45),
                        Main.readValue(request, 46),
                        Main.readValue(request, 47),
                        Main.readValue(request, 48),
                        Main.readValue(request, 49),
                        Main.readValue(request, 50),
                        Main.readValue(request, 51),
                        Main.readValue(request, 52)
                    );
                    if (text != null) {{
                        IO.print(text);
                    }}
                    return;
                }}
                if (mode.equals("build-render-summary")) {{
                    String request = Main.readLines(22);
                    String text = BuildSummaryWriter.renderBuildSummary(
                        Main.parseCount(Main.readValue(request, 0)),
                        Main.parseCount(Main.readValue(request, 1)),
                        Main.parseCount(Main.readValue(request, 2)),
                        Main.parseCount(Main.readValue(request, 3)),
                        Main.readValue(request, 4),
                        Main.readValue(request, 5),
                        Main.readValue(request, 6),
                        Main.readValue(request, 7),
                        Main.readValue(request, 8),
                        Main.readValue(request, 9),
                        Main.readValue(request, 10).equals("true"),
                        Main.readValue(request, 11),
                        Main.readValue(request, 12),
                        Main.readValue(request, 13),
                        Main.readValue(request, 14),
                        Main.readValue(request, 15),
                        Main.readValue(request, 16),
                        Main.readValue(request, 17),
                        Main.readValue(request, 18),
                        Main.readValue(request, 19),
                        Main.readValue(request, 20),
                        Main.readValue(request, 21)
                    );
                    IO.print(text);
                    return;
                }}
                if (mode.equals("build-execute-pipeline")) {{
                    IO.print(Main.executeBuildPipeline(Main.readLines(25)));
                    return;
                }}
                if (mode.equals("build-execute-workspace")) {{
                    IO.print(Main.executeWorkspaceBuild(Main.readLines(10)));
                    return;
                }}
                if (mode.equals("build-render-workspace-start")) {{
                    IO.print(Main.renderBuildWorkspaceStart(Main.readLines(2)));
                    return;
                }}
                if (mode.equals("build-render-workspace-member")) {{
                    IO.print(Main.renderBuildWorkspaceMember(Main.readLines(3)));
                    return;
                }}
                if (mode.equals("build-render-workspace-summary")) {{
                    IO.print(Main.renderBuildWorkspaceSummary(Main.readLines(2)));
                    return;
                }}
                if (mode.equals("build-render-workspace-failed")) {{
                    IO.print(Main.renderBuildWorkspaceFailure(Main.readLines(3)));
                    return;
                }}
                if (mode.equals("compiler-render-workspace-check-start")) {{
                    IO.print(Main.renderCompilerWorkspaceCheckStart(Main.readLines(3)));
                    return;
                }}
                if (mode.equals("compiler-render-workspace-check-pass")) {{
                    String request = Main.readLines(3);
                    IO.print(CheckSummaryWriter.renderWorkspaceCheckPass(
                        Main.readValue(request, 0),
                        Main.readValue(request, 1),
                        Main.parseCount(Main.readValue(request, 2))
                    ));
                    return;
                }}
                if (mode.equals("compiler-render-workspace-check-member")) {{
                    IO.print(Main.renderCompilerWorkspaceCheckMember(Main.readLines(4)));
                    return;
                }}
                if (mode.equals("compiler-render-workspace-check-summary")) {{
                    IO.print(Main.renderCompilerWorkspaceCheckSummary(Main.readLines(3)));
                    return;
                }}
                if (mode.equals("compiler-render-workspace-check-failed")) {{
                    IO.print(Main.renderCompilerWorkspaceCheckFailure(Main.readLines(5)));
                    return;
                }}
                if (mode.equals("compiler-render-check-result")) {{
                    IO.print(Main.renderCompilerCheckResult(Main.readLines(9)));
                    return;
                }}
                if (mode.equals("compiler-execute-check")) {{
                    IO.print(Main.executeCompilerCheck(Main.readLines(5)));
                    return;
                }}
                if (mode.equals("compiler-execute-workspace-check")) {{
                    IO.print(Main.executeCompilerWorkspaceCheck(Main.readLines(3)));
                    return;
                }}
                if (mode.equals("compiler-execute-build-core")) {{
                    IO.print(Main.executeCompilerBuildCore(Main.readLines(10)));
                    return;
                }}
                if (mode.equals("compiler-execute-test-file")) {{
                    IO.print(Main.executeCompilerTestFile(Main.readLines(5)));
                    return;
                }}
                if (mode.equals("compiler-execute-workspace-test")) {{
                    IO.print(Main.executeCompilerWorkspaceTest(Main.readLines(3)));
                    return;
                }}
                if (mode.equals("compiler-render-test-discovery")) {{
                    IO.print(Main.renderCompilerTestDiscoveryResult(Main.readLines(10)));
                    return;
                }}
                if (mode.equals("compiler-render-test-summary")) {{
                    IO.print(Main.renderCompilerTestResult(Main.readLines(5)));
                    return;
                }}
                if (mode.equals("compiler-render-test-execution")) {{
                    IO.print(Main.renderCompilerTestExecutionResult(Main.readLines(5)));
                    return;
                }}
                if (mode.equals("compiler-render-workspace-test-start")) {{
                    IO.print(Main.renderCompilerWorkspaceTestStart(Main.readLines(3)));
                    return;
                }}
                if (mode.equals("compiler-render-workspace-member-discovery")) {{
                    IO.print(Main.renderCompilerWorkspaceMemberDiscovery(Main.readLines(10)));
                    return;
                }}
                if (mode.equals("compiler-render-tests-failed")) {{
                    IO.print(Main.renderCompilerTestsFailed(Main.readLines(5)));
                    return;
                }}
                if (mode.equals("compiler-render-workspace-test-summary")) {{
                    IO.print(Main.renderCompilerWorkspaceTestSummary(Main.readLines(4)));
                    return;
                }}
                if (mode.equals("compiler-render-workspace-tests-failed")) {{
                    IO.print(Main.renderCompilerWorkspaceTestsFailed(Main.readLines(6)));
                    return;
                }}
                IO.print("error=1:unknown bridge mode ");
                IO.print(mode);
                return;
            }}

            private static String readLine() {{
                String line = System.in.readLine();
                if (line != null && line.endsWith("\r")) {{
                    return line.substring(0, line.length() - 1);
                }}
                return line;
            }}

            private static String renderCompilerCheckResult(String request) {{
                CheckResult result;
                if ("true".equals(Main.readValue(request, 0))) {{
                    result = CheckResult.success(
                        Main.readValue(request, 1),
                        Main.parseCount(Main.readValue(request, 2)),
                        Main.parseCount(Main.readValue(request, 3)),
                        Main.parseCount(Main.readValue(request, 4)),
                        Main.readValue(request, 5),
                        Main.readValue(request, 6),
                        Main.readValue(request, 7),
                        Main.readValue(request, 8)
                    );
                }} else {{
                    result = CheckResult.failure(
                        Main.readValue(request, 5),
                        Main.readValue(request, 7),
                        Main.readValue(request, 8)
                    );
                }}
                return CheckSummaryWriter.renderCheckResult(result);
            }}

            private static String executeBuildPipeline(String request) {{
                BuildInvocation invocation = new BuildInvocation(
                    aden.io.Path.parent(Main.readValue(request, 3)),
                    Main.readValue(request, 1),
                    Main.readValue(request, 2),
                    Main.readValue(request, 5),
                    Main.readValue(request, 6),
                    Main.readValue(request, 4),
                    new BuildLayout(
                        Main.readValue(request, 3),
                        Main.readValue(request, 7),
                        Main.readValue(request, 8),
                        Main.readValue(request, 9),
                        Main.readValue(request, 10),
                        Main.readValue(request, 11),
                        aden.io.Path.resolve(Main.readValue(request, 3), "distro")
                    ),
                    Main.readValue(request, 12),
                    Main.readValue(request, 14),
                    Main.readValue(request, 15),
                    Main.readValue(request, 16),
                    Main.readValue(request, 17),
                    Main.readValue(request, 18),
                    new ToolchainConfig(
                        Main.readValue(request, 19),
                        Main.readValue(request, 20)
                    ),
                    Main.readValue(request, 21),
                    Main.readValue(request, 22),
                    "true".equals(Main.readValue(request, 23)),
                    "true".equals(Main.readValue(request, 24))
                );
                BuildPipelineExecutionResult result = BuildPipelineExecutionProvider.execute(
                    Main.readValue(request, 0),
                    invocation,
                    "true".equals(Main.readValue(request, 13))
                );
                return BuildPipelineExecutionBridge.toBridgeText(result);
            }}

            private static String executeWorkspaceBuild(String request) {{
                WorkspaceBuildExecutionResult result = WorkspaceBuildExecutionProvider.execute(
                    Main.readValue(request, 0),
                    Main.readValue(request, 1),
                    Main.readValue(request, 2),
                    Main.readValue(request, 3),
                    Main.readValue(request, 4),
                    Main.readValue(request, 5),
                    Main.readValue(request, 6),
                    Main.readValue(request, 7),
                    Main.readValue(request, 8),
                    Main.readValue(request, 9)
                );
                return WorkspaceBuildExecutionBridge.toBridgeText(result);
            }}

            private static String executeCompilerCheck(String request) {{
                CheckExecutionResult result = CheckExecutionProvider.execute(
                    Main.readValue(request, 0),
                    Main.readValue(request, 1),
                    Main.readValue(request, 2),
                    "true".equals(Main.readValue(request, 3)),
                    "true".equals(Main.readValue(request, 4))
                );
                return CheckExecutionBridge.toBridgeText(result);
            }}

            private static String executeCompilerWorkspaceCheck(String request) {{
                WorkspaceCheckExecutionResult result = WorkspaceCheckExecutionProvider.execute(
                    Main.readValue(request, 0),
                    Main.readValue(request, 1),
                    "true".equals(Main.readValue(request, 2))
                );
                return WorkspaceCheckExecutionBridge.toBridgeText(result);
            }}

            private static String executeCompilerBuildCore(String request) {{
                BuildCoreExecutionResult result = BuildCoreExecutionProvider.execute(
                    Main.readValue(request, 0),
                    Main.readValue(request, 1),
                    Main.readValue(request, 2),
                    "true".equals(Main.readValue(request, 3)),
                    Main.readValue(request, 4),
                    Main.readValue(request, 5),
                    Main.readValue(request, 6),
                    Main.readValue(request, 7),
                    "true".equals(Main.readValue(request, 8)),
                    Main.readValue(request, 9)
                );
                return BuildCoreExecutionBridge.toBridgeText(result);
            }}

            private static String executeCompilerTestFile(String request) {{
                TestFileExecutionResult result = TestFileExecutionProvider.execute(
                    Main.readValue(request, 0),
                    Main.readValue(request, 1),
                    Main.readValue(request, 2),
                    "true".equals(Main.readValue(request, 3)),
                    "true".equals(Main.readValue(request, 4))
                );
                return TestFileExecutionBridge.toBridgeText(result);
            }}

            private static String executeCompilerWorkspaceTest(String request) {{
                WorkspaceTestExecutionResult result = WorkspaceTestExecutionProvider.execute(
                    Main.readValue(request, 0),
                    Main.readValue(request, 1),
                    "true".equals(Main.readValue(request, 2))
                );
                return WorkspaceTestExecutionBridge.toBridgeText(result);
            }}

            private static String renderBuildWorkspaceStart(String request) {{
                return BuildSummaryWriter.renderWorkspaceBuildStart(
                    new WorkspaceBuildResult(
                        Main.readValue(request, 0),
                        Main.parseCount(Main.readValue(request, 1)),
                        0
                    )
                );
            }}

            private static String renderBuildWorkspaceMember(String request) {{
                WorkspaceBuildMemberResult result;
                if ("true".equals(Main.readValue(request, 0))) {{
                    result = WorkspaceBuildMemberResult.success(Main.readValue(request, 1));
                }} else {{
                    result = WorkspaceBuildMemberResult.failure(
                        Main.readValue(request, 1),
                        Main.readValue(request, 2)
                    );
                }}
                return BuildSummaryWriter.renderWorkspaceBuildMemberResult(result);
            }}

            private static String renderBuildWorkspaceSummary(String request) {{
                return BuildSummaryWriter.renderWorkspaceBuildSummary(
                    new WorkspaceBuildResult(
                        "<workspace>",
                        Main.parseCount(Main.readValue(request, 1)),
                        Main.parseCount(Main.readValue(request, 0))
                    )
                );
            }}

            private static String renderBuildWorkspaceFailure(String request) {{
                return BuildSummaryWriter.renderWorkspaceBuildFailure(
                    new WorkspaceBuildResult(
                        Main.readValue(request, 0),
                        Main.parseCount(Main.readValue(request, 1)),
                        Main.parseCount(Main.readValue(request, 2))
                    )
                );
            }}

            private static String renderCompilerWorkspaceCheckStart(String request) {{
                return CheckSummaryWriter.renderWorkspaceCheckStartResult(
                    new WorkspaceCheckResult(
                        Main.readValue(request, 0),
                        Main.parseCount(Main.readValue(request, 1)),
                        Main.readValue(request, 2),
                        0,
                        0
                    )
                );
            }}

            private static String renderCompilerWorkspaceCheckSummary(String request) {{
                return CheckSummaryWriter.renderWorkspaceCheckSummaryResult(
                    new WorkspaceCheckResult(
                        "<workspace>",
                        Main.parseCount(Main.readValue(request, 2)),
                        "friendly",
                        Main.parseCount(Main.readValue(request, 0)),
                        Main.parseCount(Main.readValue(request, 1))
                    )
                );
            }}

            private static String renderCompilerWorkspaceCheckMember(String request) {{
                WorkspaceCheckMemberResult result;
                if ("true".equals(Main.readValue(request, 0))) {{
                    result = WorkspaceCheckMemberResult.success(
                        Main.readValue(request, 1),
                        Main.readValue(request, 2),
                        Main.parseCount(Main.readValue(request, 3))
                    );
                }} else {{
                    result = WorkspaceCheckMemberResult.failure(
                        Main.readValue(request, 1),
                        Main.readValue(request, 3)
                    );
                }}
                return CheckSummaryWriter.renderWorkspaceCheckMemberResult(result);
            }}

            private static String renderCompilerWorkspaceCheckFailure(String request) {{
                return CheckSummaryWriter.renderWorkspaceCheckFailure(
                    new WorkspaceCheckResult(
                        Main.readValue(request, 0),
                        Main.parseCount(Main.readValue(request, 1)),
                        Main.readValue(request, 2),
                        Main.parseCount(Main.readValue(request, 3)),
                        Main.parseCount(Main.readValue(request, 4))
                    )
                );
            }}

            private static String resolveProjectCheckInvocationBridgeText(String request) {{
                return CheckInvocationBridge.toBridgeText(
                    ProjectInvocationResolver.resolveCheckInvocation(
                        Main.readValue(request, 0),
                        Main.readValue(request, 1),
                        Main.readValue(request, 2)
                    )
                );
            }}

            private static String resolveProjectTestInvocationBridgeText(String request) {{
                return TestInvocationBridge.toBridgeText(
                    ProjectInvocationResolver.resolveTestInvocation(
                        Main.readValue(request, 0),
                        Main.readValue(request, 1)
                    )
                );
            }}

            private static String renderCompilerTestDiscoveryResult(String request) {{
                TestDiscoveryResult result;
                if ("true".equals(Main.readValue(request, 0))) {{
                    if ("true".equals(Main.readValue(request, 1))) {{
                        result = TestDiscoveryResult.workspaceMemberSuccess(
                            Main.readValue(request, 4),
                            Main.readValue(request, 5),
                            Main.readValue(request, 6),
                            Main.parseCount(Main.readValue(request, 7))
                        );
                    }} else {{
                        result = TestDiscoveryResult.success(
                            Main.readValue(request, 2),
                            Main.readValue(request, 3),
                            Main.readValue(request, 5),
                            Main.readValue(request, 6),
                            Main.parseCount(Main.readValue(request, 7))
                        );
                    }}
                    return TestSummaryWriter.renderTestDiscoveryResult(result);
                }}
                if ("true".equals(Main.readValue(request, 8))) {{
                    if ("true".equals(Main.readValue(request, 1))) {{
                        result = TestDiscoveryResult.workspaceMemberNoTestsFound(
                            Main.readValue(request, 4),
                            Main.readValue(request, 5)
                        );
                    }} else {{
                        result = TestDiscoveryResult.noTestsFound(Main.readValue(request, 5));
                    }}
                }} else {{
                    result = TestDiscoveryResult.failure(Main.readValue(request, 9));
                }}
                return TestDiagnosticWriter.renderTestDiscoveryResult(result);
            }}

            private static String renderCompilerTestResult(String request) {{
                return TestSummaryWriter.renderTestResult(
                    new TestResult(
                        "true".equals(Main.readValue(request, 0)),
                        Main.readValue(request, 1),
                        Main.parseCount(Main.readValue(request, 2)),
                        Main.parseCount(Main.readValue(request, 3)),
                        Main.parseCount(Main.readValue(request, 4))
                    )
                );
            }}

            private static String renderCompilerTestExecutionResult(String request) {{
                TestExecutionResult result;
                boolean workspace = "true".equals(Main.readValue(request, 0));
                boolean success = "true".equals(Main.readValue(request, 1));
                if (workspace) {{
                    if (success) {{
                        result = TestExecutionResult.workspacePass(
                            Main.readValue(request, 2),
                            Main.readValue(request, 3)
                        );
                    }} else {{
                        result = TestExecutionResult.workspaceFail(
                            Main.readValue(request, 2),
                            Main.readValue(request, 3),
                            Main.readValue(request, 4)
                        );
                    }}
                }} else if (success) {{
                    result = TestExecutionResult.pass(Main.readValue(request, 3));
                }} else {{
                    result = TestExecutionResult.fail(
                        Main.readValue(request, 3),
                        Main.readValue(request, 4)
                    );
                }}
                return TestExecutionWriter.renderTestExecutionResult(result);
            }}

            private static String renderCompilerWorkspaceTestStart(String request) {{
                return TestSummaryWriter.renderWorkspaceTestStartResult(
                    new WorkspaceTestResult(
                        Main.readValue(request, 0),
                        Main.parseCount(Main.readValue(request, 1)),
                        Main.readValue(request, 2),
                        0,
                        0,
                        0
                    )
                );
            }}

            private static String renderCompilerWorkspaceTestSummary(String request) {{
                return TestSummaryWriter.renderWorkspaceTestSummaryResult(
                    new WorkspaceTestResult(
                        "<workspace>",
                        0,
                        Main.readValue(request, 0),
                        Main.parseCount(Main.readValue(request, 1)),
                        Main.parseCount(Main.readValue(request, 2)),
                        Main.parseCount(Main.readValue(request, 3))
                    )
                );
            }}

            private static String renderCompilerWorkspaceMemberDiscovery(String request) {{
                return TestSummaryWriter.renderTestDiscoveryResult(
                    TestDiscoveryResult.workspaceMemberSuccess(
                        Main.readValue(request, 4),
                        Main.readValue(request, 5),
                        Main.readValue(request, 6),
                        Main.parseCount(Main.readValue(request, 7))
                    )
                );
            }}

            private static String renderCompilerTestsFailed(String request) {{
                return TestDiagnosticWriter.renderTestsFailed(
                    new TestResult(
                        "true".equals(Main.readValue(request, 0)),
                        Main.readValue(request, 1),
                        Main.parseCount(Main.readValue(request, 2)),
                        Main.parseCount(Main.readValue(request, 3)),
                        Main.parseCount(Main.readValue(request, 4))
                    )
                );
            }}

            private static String renderCompilerWorkspaceTestsFailed(String request) {{
                return TestDiagnosticWriter.renderWorkspaceTestsFailed(
                    new WorkspaceTestResult(
                        Main.readValue(request, 0),
                        Main.parseCount(Main.readValue(request, 1)),
                        Main.readValue(request, 2),
                        Main.parseCount(Main.readValue(request, 3)),
                        Main.parseCount(Main.readValue(request, 4)),
                        Main.parseCount(Main.readValue(request, 5))
                    )
                );
            }}

            private static String readLines(int count) {{
                String request = "";
                int index = 0;
                while (index < count) {{
                    String line = Main.readLine();
                    if (line == null) {{
                        line = "";
                    }}
                    request = request.concat(line);
                    request = request.concat("\n");
                    index = index + 1;
                }}
                return request;
            }}

            private static String readValue(String request, int index) {{
                String[] lines = request.split("\n");
                if (index < 0 || index >= lines.length) {{
                    return null;
                }}
                String line = lines[index];
                if (line.endsWith("\r")) {{
                    line = line.substring(0, line.length() - 1);
                }}
                return Main.decodeValue(line);
            }}

            private static String decodeValue(String encoded) {{
                int separator = encoded.indexOf(':');
                if (separator < 0) {{
                    return null;
                }}
                String present = encoded.substring(0, separator);
                if (present.equals("0")) {{
                    return null;
                }}
                return Main.unescape(encoded.substring(separator + 1));
            }}

            private static ArrayList<String> parseLines(String value) {{
                ArrayList<String> out = new ArrayList<String>();
                if (value == null || value.isEmpty()) {{
                    return out;
                }}
                String[] lines = value.split("\n");
                int index = 0;
                while (index < lines.length) {{
                    String line = lines[index];
                    if (line != null && line.endsWith("\r")) {{
                        line = line.substring(0, line.length() - 1);
                    }}
                    if (line != null && !line.isEmpty()) {{
                        out.add(line);
                    }}
                    index = index + 1;
                }}
                return out;
            }}

            private static int parseCount(String value) {{
                if (value == null || value.isEmpty()) {{
                    return 0;
                }}
                return Integer.intValue(Integer.parse(value));
            }}

            private static String unescape(String value) {{
                String out = "";
                int index = 0;
                while (index < value.length()) {{
                    char ch = value.charAt(index);
                    if (ch != '\\' || (index + 1) >= value.length()) {{
                        out = out.concat(String.valueOf(ch));
                        index = index + 1;
                        continue;
                    }}
                    char escaped = value.charAt(index + 1);
                    if (escaped == 'n') {{
                        out = out.concat("\n");
                    }} else if (escaped == 'r') {{
                        out = out.concat("\r");
                    }} else if (escaped == '\\') {{
                        out = out.concat("\\");
                    }} else {{
                        out = out.concat("\\");
                        out = out.concat(String.valueOf(escaped));
                    }}
                    index = index + 2;
                }}
                return out;
            }}
        }}
        "#,
        debug_prelude = debug_prelude,
        debug_request = debug_request,
        debug_after_resolve = debug_after_resolve,
        debug_after_render = debug_after_render,
    )
}

fn emit_build_invocation_bridge_request(
    start_path: &str,
    project_root_override: Option<&str>,
    source_root_override: Option<&str>,
    entry_path_override: Option<&str>,
    profile_override: Option<&str>,
    target_override: Option<&str>,
    output_mode_override: Option<&str>,
    runtime_debug_allocator_override: Option<&str>,
    runtime_cycle_collector_override: Option<&str>,
    out_dir_override: Option<&str>,
    assembler_override: Option<&str>,
    linker_override: Option<&str>,
) -> String {
    let mut out = String::new();
    out.push_str("build\n");
    append_bridge_request_value(&mut out, "startPath", Some(start_path));
    append_bridge_request_value(&mut out, "projectRootOverride", project_root_override);
    append_bridge_request_value(&mut out, "sourceRootOverride", source_root_override);
    append_bridge_request_value(&mut out, "entryPathOverride", entry_path_override);
    append_bridge_request_value(&mut out, "profileOverride", profile_override);
    append_bridge_request_value(&mut out, "targetOverride", target_override);
    append_bridge_request_value(&mut out, "outputModeOverride", output_mode_override);
    append_bridge_request_value(
        &mut out,
        "runtimeDebugAllocatorOverride",
        runtime_debug_allocator_override,
    );
    append_bridge_request_value(
        &mut out,
        "runtimeCycleCollectorOverride",
        runtime_cycle_collector_override,
    );
    append_bridge_request_value(&mut out, "outDirOverride", out_dir_override);
    append_bridge_request_value(&mut out, "assemblerOverride", assembler_override);
    append_bridge_request_value(&mut out, "linkerOverride", linker_override);
    out
}

pub(crate) fn append_bridge_request_value(out: &mut String, _key: &str, value: Option<&str>) {
    match value {
        Some(value) => {
            out.push_str("1:");
            out.push_str(&escape_bridge_value(&normalize_bridge_path(value)));
        }
        None => out.push_str("0:"),
    }
    out.push('\n');
}

pub(crate) fn append_bridge_request_raw_value(out: &mut String, value: Option<&str>) {
    match value {
        Some(value) => {
            out.push_str("1:");
            out.push_str(&escape_bridge_value(value));
        }
        None => out.push_str("0:"),
    }
    out.push('\n');
}

fn escape_bridge_value(value: &str) -> String {
    let mut out = String::with_capacity(value.len());
    for ch in value.chars() {
        match ch {
            '\\' => out.push_str("\\\\"),
            '\n' => out.push_str("\\n"),
            '\r' => out.push_str("\\r"),
            _ => out.push(ch),
        }
    }
    out
}

pub(crate) fn normalize_bridge_path(value: &str) -> String {
    value.replace('\\', "/")
}

fn parse_build_invocation_bridge_output(text: &str) -> Result<BuildInvocation, String> {
    let values = parse_bridge_keyed_values(text)?;

    Ok(BuildInvocation {
        entry_path: required_bridge_value(&values, "entryPath")?,
        source_root: Some(required_bridge_value(&values, "sourceRoot")?),
        build_root: PathBuf::from(required_bridge_value(&values, "buildRoot")?),
        output_root: PathBuf::from(required_bridge_value(&values, "outputRoot")?),
        main_aden_root: PathBuf::from(required_bridge_value(&values, "mainAdenRoot")?),
        main_resources_root: PathBuf::from(required_bridge_value(&values, "mainResourcesRoot")?),
        build_asm_dir: PathBuf::from(required_bridge_value(&values, "asmRoot")?),
        build_generated_dir: PathBuf::from(required_bridge_value(&values, "generatedRoot")?),
        build_assets_dir: PathBuf::from(required_bridge_value(&values, "assetsRoot")?),
        build_sanity_dir: PathBuf::from(required_bridge_value(&values, "sanityRoot")?),
        build_tmp_dir: PathBuf::from(required_bridge_value(&values, "tmpRoot")?),
        profile: required_bridge_value(&values, "profile")?,
        target: required_bridge_value(&values, "target")?,
        output_mode: required_bridge_value(&values, "outputMode")?,
        output_entry: required_bridge_value(&values, "outputEntry")?,
        runtime_debug_allocator: required_bridge_value(&values, "runtimeDebugAllocator")?,
        runtime_cycle_collector: required_bridge_value(&values, "runtimeCycleCollector")?,
        assembler: optional_bridge_value(&values, "assembler"),
        linker: optional_bridge_value(&values, "linker"),
        package_name: optional_bridge_value(&values, "packageName"),
        package_version: optional_bridge_value(&values, "packageVersion"),
        used_manifest: parse_bridge_bool(&values, "usedManifest")?,
        adklib_enabled: parse_bridge_bool(&values, "adklibEnabled")?,
    })
}

pub(crate) fn parse_bridge_keyed_values(
    text: &str,
) -> Result<HashMap<String, Option<String>>, String> {
    let mut values = HashMap::new();
    for line in text.lines() {
        if line.trim().is_empty() {
            continue;
        }
        let (key, raw) = line
            .split_once('=')
            .ok_or_else(|| format!("invalid adk bridge line '{}'", line))?;
        let (present, encoded) = raw
            .split_once(':')
            .ok_or_else(|| format!("invalid adk bridge value '{}'", line))?;
        let value = match present {
            "0" => None,
            "1" => Some(unescape_bridge_value(encoded)?),
            _ => return Err(format!("invalid adk bridge presence tag '{}'", present)),
        };
        values.insert(key.to_string(), value);
    }
    Ok(values)
}

fn required_bridge_value(
    values: &HashMap<String, Option<String>>,
    key: &str,
) -> Result<String, String> {
    values
        .get(key)
        .ok_or_else(|| format!("adk bridge missing key '{}'", key))?
        .clone()
        .ok_or_else(|| format!("adk bridge key '{}' must not be null", key))
}

fn optional_bridge_value(values: &HashMap<String, Option<String>>, key: &str) -> Option<String> {
    values.get(key).cloned().flatten()
}

fn parse_bridge_bool(values: &HashMap<String, Option<String>>, key: &str) -> Result<bool, String> {
    match required_bridge_value(values, key)?.as_str() {
        "true" => Ok(true),
        "false" => Ok(false),
        other => Err(format!(
            "adk bridge key '{}' has invalid boolean '{}'",
            key, other
        )),
    }
}

fn unescape_bridge_value(value: &str) -> Result<String, String> {
    let mut out = String::with_capacity(value.len());
    let mut chars = value.chars();
    while let Some(ch) = chars.next() {
        if ch != '\\' {
            out.push(ch);
            continue;
        }
        match chars.next() {
            Some('n') => out.push('\n'),
            Some('r') => out.push('\r'),
            Some('\\') => out.push('\\'),
            Some(other) => {
                out.push('\\');
                out.push(other);
            }
            None => return Err("adk bridge ended inside escape sequence".to_string()),
        }
    }
    Ok(out)
}

fn adk_build_bridge_cache_root() -> PathBuf {
    adk_build_bridge_workspace_root()
        .join("target")
        .join("adk_build_bridge")
}

fn run_adk_build_bridge_request_inner(
    cache_root: &Path,
    exe: &Path,
    request_text: &str,
) -> Result<String, String> {
    let mut child = std::process::Command::new(exe)
        .current_dir(adk_build_bridge_workspace_root())
        .stdin(std::process::Stdio::piped())
        .stdout(std::process::Stdio::piped())
        .stderr(std::process::Stdio::piped())
        .spawn()
        .map_err(|e| format!("failed to run adk build bridge: {e}"))?;
    {
        use std::io::Write;
        let stdin = child
            .stdin
            .as_mut()
            .ok_or_else(|| "adk build bridge stdin unavailable".to_string())?;
        stdin
            .write_all(request_text.as_bytes())
            .map_err(|e| format!("failed to write adk build bridge request: {e}"))?;
    }
    let output = child
        .wait_with_output()
        .map_err(|e| format!("failed to collect adk build bridge output: {e}"))?;
    if output.status.success() {
        Ok(String::from_utf8_lossy(&output.stdout).into_owned())
    } else {
        Err(format!(
            "adk build bridge failed with status {:?} at {}\nstdout:\n{}\nstderr:\n{}",
            output.status.code(),
            cache_root.display(),
            String::from_utf8_lossy(&output.stdout),
            String::from_utf8_lossy(&output.stderr)
        ))
    }
}

pub(crate) fn run_adk_build_bridge_request(request_text: &str) -> Result<String, String> {
    let cache_root = adk_build_bridge_cache_root();
    let _lock = acquire_adk_build_bridge_lock(&cache_root)?;
    let exe = resolve_cached_adk_build_bridge_runner(&cache_root)?;
    run_adk_build_bridge_request_inner(&cache_root, &exe, request_text)
}

fn hash_bridge_source_tree(hasher: &mut DefaultHasher, root: &Path, extension: &str) {
    let mut entries = match fs::read_dir(root) {
        Ok(entries) => entries.flatten().collect::<Vec<_>>(),
        Err(_) => return,
    };
    entries.sort_by_key(|entry| entry.path());
    for entry in entries {
        let path = entry.path();
        if path.is_dir() {
            hash_bridge_source_tree(hasher, &path, extension);
            continue;
        }
        if path.extension().and_then(|value| value.to_str()) != Some(extension) {
            continue;
        }
        path.display().to_string().hash(hasher);
        if let Ok(metadata) = fs::metadata(&path) {
            metadata.len().hash(hasher);
            metadata
                .modified()
                .ok()
                .and_then(|time| time.duration_since(std::time::UNIX_EPOCH).ok())
                .map(|duration| duration.as_nanos())
                .unwrap_or_default()
                .hash(hasher);
        }
    }
}

fn current_adk_build_bridge_input_fingerprint() -> String {
    let workspace_root = adk_build_bridge_workspace_root();
    let mut hasher = DefaultHasher::new();
    hash_bridge_source_tree(
        &mut hasher,
        &workspace_root.join("crates").join("adenc-cli").join("src"),
        "rs",
    );
    hash_bridge_source_tree(
        &mut hasher,
        &workspace_root
            .join("crates")
            .join("adenc-core")
            .join("src"),
        "rs",
    );
    hash_bridge_source_tree(
        &mut hasher,
        &workspace_root.join("stdlib").join("src"),
        "aden",
    );
    format!("{:016x}", hasher.finish())
}

fn adk_build_bridge_stamp(_cache_root: &Path) -> String {
    let source = emit_build_invocation_bridge_source();
    let mut hasher = DefaultHasher::new();
    source.hash(&mut hasher);
    format!(
        "source={:016x}\ninputs={}\n",
        hasher.finish(),
        current_adk_build_bridge_input_fingerprint()
    )
}

fn adk_build_bridge_build_dir(cache_root: &Path, expected_stamp: &str) -> PathBuf {
    let mut hasher = DefaultHasher::new();
    expected_stamp.hash(&mut hasher);
    cache_root
        .join("builds")
        .join(format!("{:016x}", hasher.finish()))
}

fn adk_build_bridge_lock_info_path(lock_path: &Path) -> PathBuf {
    lock_path.join(AUTHOR_BUILD_BRIDGE_LOCK_INFO_FILE)
}

fn current_unix_millis() -> u128 {
    SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .unwrap_or_default()
        .as_millis()
}

fn write_adk_build_bridge_lock_info(lock_path: &Path) -> Result<(), String> {
    fs::write(
        adk_build_bridge_lock_info_path(lock_path),
        format!(
            "pid={}\nstarted_ms={}\n",
            std::process::id(),
            current_unix_millis()
        ),
    )
    .map_err(|err| format!("Failed to write adk bridge lock owner info: {err}"))
}

fn adk_build_bridge_lock_age(path: &Path) -> Result<Option<Duration>, String> {
    let metadata = match fs::metadata(path) {
        Ok(metadata) => metadata,
        Err(err) if err.kind() == std::io::ErrorKind::NotFound => return Ok(None),
        Err(err) if err.kind() == std::io::ErrorKind::PermissionDenied => return Ok(None),
        Err(err) => {
            return Err(format!(
                "Failed to stat adk bridge lock '{}': {err}",
                path.display()
            ))
        }
    };
    let modified = metadata.modified().or_else(|_| metadata.created()).ok();
    Ok(modified.and_then(|time| SystemTime::now().duration_since(time).ok()))
}

fn adk_build_bridge_lock_started_at(lock_path: &Path) -> Result<Option<u128>, String> {
    let info_path = adk_build_bridge_lock_info_path(lock_path);
    let text = match fs::read_to_string(&info_path) {
        Ok(text) => text,
        Err(err) if err.kind() == std::io::ErrorKind::NotFound => return Ok(None),
        Err(err) if err.kind() == std::io::ErrorKind::PermissionDenied => return Ok(None),
        Err(err) => {
            return Err(format!(
                "Failed to read adk bridge lock owner info '{}': {err}",
                info_path.display()
            ))
        }
    };
    for line in text.lines() {
        if let Some(value) = line.strip_prefix("started_ms=") {
            let parsed = value.parse::<u128>().map_err(|err| {
                format!(
                    "Invalid adk bridge lock owner info '{}': {err}",
                    info_path.display()
                )
            })?;
            return Ok(Some(parsed));
        }
    }
    Ok(None)
}

fn remove_adk_build_bridge_lock(lock_path: &Path) -> Result<(), String> {
    match fs::remove_dir_all(lock_path) {
        Ok(()) => Ok(()),
        Err(err) if err.kind() == std::io::ErrorKind::PermissionDenied => Ok(()),
        Err(err) => Err(format!(
            "Failed to remove stale adk bridge lock '{}': {err}",
            lock_path.display()
        )),
    }
}

fn reclaim_stale_adk_build_bridge_lock(lock_path: &Path) -> Result<bool, String> {
    if !lock_path.exists() {
        return Ok(false);
    }
    let now_ms = current_unix_millis();
    if let Some(started_ms) = adk_build_bridge_lock_started_at(lock_path)? {
        if now_ms.saturating_sub(started_ms) >= AUTHOR_BUILD_BRIDGE_LOCK_STALE_AFTER.as_millis() {
            remove_adk_build_bridge_lock(lock_path)?;
            return Ok(true);
        }
        return Ok(false);
    }
    if let Some(age) = adk_build_bridge_lock_age(lock_path)? {
        if age >= AUTHOR_BUILD_BRIDGE_LOCK_ORPHANED_INFO_GRACE {
            remove_adk_build_bridge_lock(lock_path)?;
            return Ok(true);
        }
    }
    Ok(false)
}

fn acquire_adk_build_bridge_lock(cache_root: &Path) -> Result<AuthorBuildBridgeLock, String> {
    fs::create_dir_all(cache_root)
        .map_err(|e| format!("Failed to create adk bridge cache dir: {e}"))?;
    let lock_path = cache_root.join("lock");
    for _ in 0..10_000 {
        match fs::create_dir(&lock_path) {
            Ok(()) => {
                if let Err(err) = write_adk_build_bridge_lock_info(&lock_path) {
                    let _ = fs::remove_dir_all(&lock_path);
                    return Err(err);
                }
                return Ok(AuthorBuildBridgeLock { path: lock_path });
            }
            Err(err) if err.kind() == std::io::ErrorKind::AlreadyExists => {
                if reclaim_stale_adk_build_bridge_lock(&lock_path)? {
                    continue;
                }
                std::thread::sleep(AUTHOR_BUILD_BRIDGE_LOCK_POLL_INTERVAL);
            }
            Err(err) => return Err(format!("Failed to acquire adk bridge lock: {err}")),
        }
    }
    Err("Timed out waiting for adk bridge lock".to_string())
}

fn ensure_adk_build_bridge_runner(cache_root: &Path) -> Result<PathBuf, String> {
    let expected_stamp = adk_build_bridge_stamp(cache_root);
    let stamp_path = cache_root.join("stamp.txt");
    let build_dir = adk_build_bridge_build_dir(cache_root, &expected_stamp);
    let exe_path = build_dir.join("main.exe");
    if exe_path.exists()
        && fs::read_to_string(&stamp_path)
            .map(|text| text == expected_stamp)
            .unwrap_or(false)
    {
        return Ok(exe_path);
    }

    let src_root = cache_root.join("src");
    let entry = src_root.join("bridge/internal/Main.aden");
    fs::create_dir_all(
        entry
            .parent()
            .ok_or_else(|| "missing bridge parent".to_string())?,
    )
    .map_err(|e| format!("Failed to create adk bridge source root: {e}"))?;
    fs::write(&entry, emit_build_invocation_bridge_source())
        .map_err(|e| format!("Failed to write adk bridge source: {e}"))?;

    let check_started_at = Instant::now();
    let result = check_project_with_adklib(
        entry
            .to_str()
            .ok_or_else(|| "adk bridge entry path must be utf-8".to_string())?,
        Some(
            src_root
                .to_str()
                .ok_or_else(|| "adk bridge source root must be utf-8".to_string())?,
        ),
        true,
        true,
    )?;
    emit_build_resolution_timing(
        "bridge compile check_project_with_adklib",
        check_started_at,
    );
    if result.class_contexts.len() != result.merged.classes.len() {
        return Err(format!(
            "adk bridge class context mismatch: {} contexts for {} classes",
            result.class_contexts.len(),
            result.merged.classes.len()
        ));
    }
    let ir_started_at = Instant::now();
    let ir = lower_to_ir_with_contexts(&result.merged, &result.class_contexts)
        .map_err(|e| format!("adk bridge IR lowering failed: {e}"))?;
    emit_build_resolution_timing("bridge compile lower_to_ir", ir_started_at);
    let backend = RustHostBootstrapBackend {
        linker_override: None,
        target_id: default_target_id().to_string(),
        output_mode: "fat".to_string(),
        output_entry: "main".to_string(),
        emit_statement_trace_metadata: false,
    };
    let out_dir = build_dir;
    let cached_exe_path = out_dir.join("main.exe");
    let emit_started_at = Instant::now();
    let artifact = match emit_adk_build_bridge_with_retry(&backend, &ir, &out_dir) {
        Ok(artifact) => artifact,
        Err(_err) if wait_for_adk_build_bridge_exe(&cached_exe_path) => {
            emit_build_resolution_timing("bridge compile backend emit", emit_started_at);
            fs::write(&stamp_path, expected_stamp)
                .map_err(|e| format!("Failed to write adk bridge stamp: {e}"))?;
            return Ok(cached_exe_path);
        }
        Err(err) => return Err(format!("adk bridge backend emit failed: {err}")),
    };
    emit_build_resolution_timing("bridge compile backend emit", emit_started_at);
    let built_exe = artifact
        .exe_path
        .ok_or_else(|| "adk bridge did not produce an executable".to_string())?;
    fs::write(&stamp_path, expected_stamp)
        .map_err(|e| format!("Failed to write adk bridge stamp: {e}"))?;
    Ok(built_exe)
}

fn emit_adk_build_bridge_with_retry(
    backend: &RustHostBootstrapBackend,
    ir: &adenc_core::intermediate::IrProgram,
    out_dir: &Path,
) -> Result<crate::backend::BackendArtifact, String> {
    let mut last_err = None;
    let max_attempts = 40usize;
    for attempt in 0..max_attempts {
        match backend.emit(ir, out_dir) {
            Ok(artifact) => return Ok(artifact),
            Err(err) => {
                let text = err.to_string();
                if attempt + 1 < max_attempts && is_transient_adk_bridge_output_lock_error(&text)
                {
                    std::thread::sleep(Duration::from_millis(1_000));
                    last_err = Some(text);
                    continue;
                }
                return Err(text);
            }
        }
    }
    Err(last_err.unwrap_or_else(|| "unknown adk bridge emit failure".to_string()))
}

fn wait_for_adk_build_bridge_exe(path: &Path) -> bool {
    if adk_build_bridge_link_completed(path) || path.exists() {
        return true;
    }
    for _ in 0..120 {
        std::thread::sleep(Duration::from_millis(250));
        if adk_build_bridge_link_completed(path) || path.exists() {
            return true;
        }
    }
    false
}

fn adk_build_bridge_link_completed(exe_path: &Path) -> bool {
    let Some(parent) = exe_path.parent() else {
        return false;
    };
    let report_path = parent.join("native.link.txt");
    fs::read_to_string(report_path)
        .map(|text| text.contains("status=linked"))
        .unwrap_or(false)
}

fn is_transient_adk_bridge_output_lock_error(err: &str) -> bool {
    let normalized = err.to_ascii_lowercase();
    let locked_output = normalized.contains("main.exe")
        || normalized.contains(".obj")
        || normalized.contains("\\obj\\")
        || normalized.contains("/obj/");
    locked_output
        && (normalized.contains("permission denied") || normalized.contains("cannot open file"))
}

fn resolve_cached_adk_build_bridge_runner(cache_root: &Path) -> Result<PathBuf, String> {
    let expected_stamp = adk_build_bridge_stamp(cache_root);
    let stamp_path = cache_root.join("stamp.txt");
    let exe_path = adk_build_bridge_build_dir(cache_root, &expected_stamp).join("main.exe");
    if exe_path.exists()
        && fs::read_to_string(&stamp_path)
            .map(|text| text == expected_stamp)
            .unwrap_or(false)
    {
        return Ok(exe_path);
    }
    Err(format!(
        "adk build bridge cache is missing or stale at '{}'; run 'aden __prewarm-adk-build-bridge' first",
        cache_root.display()
    ))
}

pub(crate) fn prewarm_adk_build_bridge_runner() -> Result<PathBuf, String> {
    let total_started_at = Instant::now();
    let cache_root = adk_build_bridge_cache_root();
    let lock_started_at = Instant::now();
    let _lock = acquire_adk_build_bridge_lock(&cache_root)?;
    emit_build_resolution_timing("bridge lock wait", lock_started_at);
    let ensure_started_at = Instant::now();
    let mut last_err = None;
    let mut exe = None;
    for _ in 0..20 {
        match ensure_adk_build_bridge_runner(&cache_root) {
            Ok(found) => {
                exe = Some(found);
                break;
            }
            Err(err) => {
                if let Ok(found) = resolve_cached_adk_build_bridge_runner(&cache_root) {
                    exe = Some(found);
                    break;
                }
                if is_transient_adk_bridge_output_lock_error(&err) {
                    last_err = Some(err);
                    std::thread::sleep(Duration::from_millis(500));
                    continue;
                }
                return Err(err);
            }
        }
    }
    let exe = exe.ok_or_else(|| {
        last_err.unwrap_or_else(|| "adk build bridge prewarm failed".to_string())
    })?;
    emit_build_resolution_timing("bridge ensure runner", ensure_started_at);
    emit_build_resolution_timing("bridge prewarm total", total_started_at);
    Ok(exe)
}

pub(super) fn resolve_check_invocation(
    entry_arg: Option<&str>,
    flags: &CliFlags,
) -> Result<CheckInvocation, String> {
    if let Ok(invocation) = resolve_check_invocation_via_adklib(entry_arg, flags) {
        return Ok(invocation);
    }
    resolve_check_invocation_fallback(entry_arg, flags)
}

fn resolve_check_invocation_via_adklib(
    entry_arg: Option<&str>,
    flags: &CliFlags,
) -> Result<CheckInvocation, String> {
    let request = emit_project_check_invocation_bridge_request(
        &bridge_start_path(entry_arg, flags)?,
        flags.source_root.as_deref(),
        entry_arg,
    );
    let stdout = run_adk_build_bridge_request(&request)?;
    parse_check_invocation_bridge_output(&stdout)
}

fn resolve_check_invocation_fallback(
    entry_arg: Option<&str>,
    flags: &CliFlags,
) -> Result<CheckInvocation, String> {
    let mut used_manifest = false;
    let mut adklib_enabled = false;
    let manifest_info = find_and_load_manifest_for_check(entry_arg, flags)?;
    let mut source_root = flags.source_root.clone();
    let mut entry_path = entry_arg.map(|s| s.to_string());

    if let Some((manifest_path, manifest_config)) = manifest_info {
        used_manifest = true;
        adklib_enabled = manifest_config
            .adklib
            .as_ref()
            .map(|cfg| cfg.enabled)
            .unwrap_or(false);
        let _manifest_identity = manifest_config
            .package
            .as_ref()
            .map(|pkg| (&pkg.name, &pkg.version));
        let project_root = manifest_path
            .parent()
            .ok_or_else(|| format!("Invalid manifest path '{}'", manifest_path.display()))?;
        if source_root.is_none() {
            let main_aden = manifest_config
                .sources
                .main_aden
                .clone()
                .unwrap_or_else(|| manifest_config.sources.root.clone());
            source_root = Some(project_root.join(main_aden).display().to_string());
        }
        if entry_path.is_none() {
            if let Some(entry_rel) = manifest_config.sources.entry {
                let src_root = PathBuf::from(
                    source_root
                        .as_ref()
                        .ok_or_else(|| "Internal error: source root missing".to_string())?,
                );
                entry_path = Some(src_root.join(entry_rel).display().to_string());
            }
        }
    }

    if entry_path.is_none() {
        if let Some(src) = &source_root {
            if let Some(discovered) = discover_entry_from_source_root(Path::new(src))? {
                entry_path = Some(discovered.display().to_string());
            }
        }
    }

    let Some(entry_path) = entry_path else {
        return Err(
            "Missing entry file for 'check'. Provide <entry.aden> or set [sources].entry in aden.toml"
                .to_string(),
        );
    };

    Ok(CheckInvocation {
        entry_path,
        source_root,
        used_manifest,
        adklib_enabled,
    })
}

fn emit_project_check_invocation_bridge_request(
    start_path: &str,
    source_root_override: Option<&str>,
    entry_path_override: Option<&str>,
) -> String {
    let mut out = String::new();
    out.push_str("project-resolve-check-invocation\n");
    append_bridge_request_raw_value(&mut out, Some(start_path));
    append_bridge_request_raw_value(&mut out, source_root_override);
    append_bridge_request_raw_value(&mut out, entry_path_override);
    out
}

fn parse_check_invocation_bridge_output(text: &str) -> Result<CheckInvocation, String> {
    let values = parse_bridge_keyed_values(text)?;
    Ok(CheckInvocation {
        entry_path: required_bridge_value(&values, "entryPath")?,
        source_root: optional_bridge_value(&values, "sourceRoot"),
        used_manifest: parse_bridge_bool(&values, "usedManifest")?,
        adklib_enabled: parse_bridge_bool(&values, "adklibEnabled")?,
    })
}

pub(super) fn resolve_build_invocation(
    entry_arg: Option<&str>,
    flags: &CliFlags,
) -> Result<BuildInvocation, String> {
    let bridge_attempt_started_at = Instant::now();
    match resolve_build_invocation_via_adklib(entry_arg, flags) {
        Ok(invocation) => {
            emit_build_resolution_timing("adklib bridge selected", bridge_attempt_started_at);
            Ok(invocation)
        }
        Err(err) => {
            emit_build_resolution_timing("adklib bridge failed", bridge_attempt_started_at);
            if build_resolution_timing_enabled() {
                eprintln!("[timing][build-resolution] bridge failure: {err}");
            }
            let fallback_started_at = Instant::now();
            let resolved = resolve_build_invocation_fallback(entry_arg, flags);
            emit_build_resolution_timing("fallback total", fallback_started_at);
            resolved
        }
    }
}

fn resolve_build_invocation_fallback(
    entry_arg: Option<&str>,
    flags: &CliFlags,
) -> Result<BuildInvocation, String> {
    let manifest_info = find_and_load_manifest_for_check(entry_arg, flags)?;
    let mut used_manifest = false;
    let mut project_root: Option<PathBuf> = None;
    let mut source_root = flags.source_root.clone();
    let mut entry_path = entry_arg.map(|s| s.to_string());
    let mut manifest_profile: Option<String> = None;
    let mut manifest_target: Option<String> = None;
    let mut manifest_output_mode: Option<String> = None;
    let mut manifest_output_entry: Option<String> = None;
    let mut manifest_runtime_debug_allocator: Option<String> = None;
    let mut manifest_runtime_cycle_collector: Option<String> = None;
    let mut manifest_out_dir: Option<String> = None;
    let mut manifest_linker: Option<String> = None;
    let mut manifest_assembler: Option<String> = None;
    let mut manifest_main_resources: Option<String> = None;
    let mut manifest_asm_dir: Option<String> = None;
    let mut manifest_generated_dir: Option<String> = None;
    let mut manifest_assets_dir: Option<String> = None;
    let mut manifest_sanity_dir: Option<String> = None;
    let mut manifest_tmp_dir: Option<String> = None;
    let mut manifest_distro_dir: Option<String> = None;
    let mut package_name: Option<String> = None;
    let mut package_version: Option<String> = None;
    let mut adklib_enabled = false;

    if let Some((manifest_path, manifest_config)) = manifest_info {
        used_manifest = true;
        adklib_enabled = manifest_config
            .adklib
            .as_ref()
            .map(|cfg| cfg.enabled)
            .unwrap_or(false);
        let _manifest_identity = (
            manifest_config
                .package
                .as_ref()
                .map(|pkg| (&pkg.name, &pkg.version)),
            manifest_config.sources.test_resources.as_deref(),
            manifest_config.sources.api_aden.as_deref(),
            manifest_config.sources.api_resources.as_deref(),
            manifest_config.sources.docs.as_deref(),
            manifest_config.sources.libraries.as_deref(),
        );
        if let Some(package) = manifest_config.package.as_ref() {
            package_name = Some(package.name.clone());
            package_version = Some(package.version.clone());
        }
        let root = manifest_path
            .parent()
            .ok_or_else(|| format!("Invalid manifest path '{}'", manifest_path.display()))?
            .to_path_buf();
        project_root = Some(root.clone());
        manifest_profile = manifest_config.build.profile;
        manifest_target = manifest_config.build.target;
        manifest_output_mode = manifest_config.build.output_mode;
        manifest_output_entry = manifest_config.build.output_entry;
        manifest_runtime_debug_allocator = manifest_config.build.runtime_debug_allocator;
        manifest_runtime_cycle_collector = manifest_config.build.runtime_cycle_collector;
        manifest_out_dir = manifest_config.build.out_dir;
        manifest_linker = manifest_config.toolchain.linker;
        manifest_assembler = manifest_config.toolchain.assembler;
        let manifest_main_aden = manifest_config
            .sources
            .main_aden
            .clone()
            .or_else(|| Some(manifest_config.sources.root.clone()));
        manifest_main_resources = manifest_config.sources.main_resources.clone();
        manifest_asm_dir = manifest_config.build.asm_dir.clone();
        manifest_generated_dir = manifest_config.build.generated_dir.clone();
        manifest_assets_dir = manifest_config.build.assets_dir.clone();
        manifest_sanity_dir = manifest_config.build.sanity_dir.clone();
        manifest_tmp_dir = manifest_config.build.tmp_dir.clone();
        manifest_distro_dir = manifest_config.build.distro_dir.clone();

        if source_root.is_none() {
            let main_aden = manifest_main_aden.unwrap_or_else(|| "src/main/aden".to_string());
            source_root = Some(root.join(main_aden).display().to_string());
        }
        if entry_path.is_none() {
            if let Some(entry_rel) = manifest_config.sources.entry {
                let src_root = PathBuf::from(
                    source_root
                        .as_ref()
                        .ok_or_else(|| "Internal error: source root missing".to_string())?,
                );
                entry_path = Some(src_root.join(entry_rel).display().to_string());
            }
        }
    }

    let profile = if let Some(cli_profile) = &flags.profile {
        cli_profile.clone()
    } else if let Some(manifest_profile) = manifest_profile {
        match manifest_profile.as_str() {
            "debug" | "release" => manifest_profile,
            _ => return Err("Manifest [build].profile must be 'debug' or 'release'".to_string()),
        }
    } else {
        "release".to_string()
    };
    let target = flags
        .target
        .clone()
        .or(manifest_target)
        .unwrap_or_else(|| default_target_id().to_string());
    let output_mode = flags
        .output_mode
        .clone()
        .or(manifest_output_mode)
        .unwrap_or_else(|| "fat".to_string());
    let output_entry = manifest_output_entry.unwrap_or_else(|| "main".to_string());
    let runtime_debug_allocator = flags
        .runtime_debug_allocator
        .clone()
        .or(manifest_runtime_debug_allocator)
        .unwrap_or_else(|| "off".to_string());
    let runtime_cycle_collector = flags
        .runtime_cycle_collector
        .clone()
        .or(manifest_runtime_cycle_collector)
        .unwrap_or_else(|| "on".to_string());

    let base_root = if let Some(root) = project_root.clone() {
        root
    } else if let Some(root) = &flags.project_root {
        PathBuf::from(root)
    } else if let Some(src) = &source_root {
        canonical_existing_path(Path::new(src))
            .ok()
            .and_then(|p| p.parent().map(|parent| parent.to_path_buf()))
            .or_else(|| {
                absolutize(Path::new(src))
                    .and_then(|p| p.parent().map(|parent| parent.to_path_buf()))
            })
            .unwrap_or_else(|| env::current_dir().unwrap_or_else(|_| PathBuf::from(".")))
    } else {
        env::current_dir().unwrap_or_else(|_| PathBuf::from("."))
    };
    let project_root = project_root.unwrap_or_else(|| base_root.clone());

    if source_root.is_none() {
        source_root = Some(project_root.join("src/main/aden").display().to_string());
    }
    if entry_path.is_none() {
        if let Some(src) = &source_root {
            if let Some(discovered) = discover_entry_from_source_root(Path::new(src))? {
                entry_path = Some(discovered.display().to_string());
            }
        }
    }
    let Some(entry_path) = entry_path else {
        return Err(
            "Missing entry file for 'build'. Provide <entry.aden> or set [sources].entry in aden.toml"
                .to_string(),
        );
    };

    let configured_out_dir = flags.out_dir.clone().or(manifest_out_dir.clone());
    let output_root = if let Some(out_dir) = configured_out_dir {
        let out_path = PathBuf::from(out_dir);
        if out_path.is_absolute() {
            out_path
        } else {
            base_root.join(out_path)
        }
    } else if used_manifest || flags.profile.is_some() {
        let distro_rel = manifest_distro_dir
            .clone()
            .unwrap_or_else(|| "build/distro".to_string());
        base_root.join(distro_rel).join(&profile)
    } else {
        // Preserve direct-mode artifact layout used by fixture suites.
        base_root.join("build")
    };
    let build_root = base_root.join("build");

    let main_aden_root = source_root
        .as_ref()
        .map(PathBuf::from)
        .unwrap_or_else(|| resolve_layout_path(&project_root, None, "src/main/aden"));
    let main_resources_root = resolve_layout_path(
        &project_root,
        manifest_main_resources.as_deref(),
        "src/main/resources",
    );
    let build_asm_dir =
        resolve_layout_path(&project_root, manifest_asm_dir.as_deref(), "build/asm");
    let build_generated_dir = resolve_layout_path(
        &project_root,
        manifest_generated_dir.as_deref(),
        "build/generated",
    );
    let build_assets_dir = resolve_layout_path(
        &project_root,
        manifest_assets_dir.as_deref(),
        "build/assets",
    );
    let build_sanity_dir = resolve_layout_path(
        &project_root,
        manifest_sanity_dir.as_deref(),
        "build/sanity",
    );
    let build_tmp_dir =
        resolve_layout_path(&project_root, manifest_tmp_dir.as_deref(), "build/tmp");

    Ok(BuildInvocation {
        entry_path,
        source_root,
        build_root,
        output_root,
        main_aden_root,
        main_resources_root,
        build_asm_dir,
        build_generated_dir,
        build_assets_dir,
        build_sanity_dir,
        build_tmp_dir,
        profile,
        target,
        output_mode: normalize_output_mode(&output_mode)
            .ok_or_else(|| "Manifest [build].output_mode must be 'fat' or 'shared'".to_string())?
            .to_string(),
        output_entry,
        runtime_debug_allocator,
        runtime_cycle_collector,
        assembler: flags.assembler.clone().or(manifest_assembler),
        linker: flags.linker.clone().or(manifest_linker),
        package_name,
        package_version,
        used_manifest,
        adklib_enabled,
    })
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::sync::OnceLock;

    fn ensure_adk_build_bridge_ready_for_tests() {
        static READY: OnceLock<()> = OnceLock::new();
        READY.get_or_init(|| {
            prewarm_adk_build_bridge_runner().expect("prewarm adk build bridge for tests");
        });
    }
    use std::sync::atomic::{AtomicU64, Ordering};
    use std::time::{SystemTime, UNIX_EPOCH};

    fn unique_temp_root() -> PathBuf {
        static NEXT_ID: AtomicU64 = AtomicU64::new(1);
        let nanos = SystemTime::now()
            .duration_since(UNIX_EPOCH)
            .expect("system time")
            .as_nanos();
        let id = NEXT_ID.fetch_add(1, Ordering::Relaxed);
        let root = std::env::temp_dir().join(format!(
            "adenc_config_resolve_{}_{}_{}",
            std::process::id(),
            nanos,
            id
        ));
        fs::create_dir_all(&root).expect("create temp root");
        root
    }

    fn write_file(path: &Path, contents: &str) {
        if let Some(parent) = path.parent() {
            fs::create_dir_all(parent).expect("create parent");
        }
        fs::write(path, contents).expect("write file");
    }

    fn path_text(path: &Path) -> String {
        path.display()
            .to_string()
            .replace("\\\\?\\", "")
            .replace('\\', "/")
    }

    fn default_flags(project_root: &Path) -> CliFlags {
        CliFlags {
            strict_package: true,
            friendly: false,
            selfhost_provider: false,
            project_root: Some(project_root.display().to_string()),
            source_root: None,
            profile: None,
            target: None,
            output_mode: None,
            runtime_debug_allocator: None,
            runtime_cycle_collector: None,
            out_dir: None,
            assembler: None,
            linker: None,
        }
    }

    #[test]
    fn adk_build_bridge_lock_reclaims_stale_owner_directory() {
        let cache_root = unique_temp_root();
        let lock_path = cache_root.join("lock");
        fs::create_dir_all(&lock_path).expect("create stale lock dir");
        fs::write(
            adk_build_bridge_lock_info_path(&lock_path),
            format!(
                "pid=1\nstarted_ms={}\n",
                current_unix_millis()
                    .saturating_sub(AUTHOR_BUILD_BRIDGE_LOCK_STALE_AFTER.as_millis() + 1)
            ),
        )
        .expect("write stale lock info");

        let lock = acquire_adk_build_bridge_lock(&cache_root).expect("recover stale lock");
        assert!(adk_build_bridge_lock_info_path(&lock.path).exists());
        drop(lock);

        let _ = fs::remove_dir_all(cache_root);
    }

    #[test]
    fn resolve_build_invocation_direct_mode_anchors_source_root_under_project_root() {
        ensure_adk_build_bridge_ready_for_tests();
        let root = unique_temp_root();
        let entry = root.join("src/main/aden/app/core/Main.aden");
        write_file(
            &entry,
            r#"
            package app.core;
            class Main {
                public static void main() {
                }
            }
            "#,
        );

        let resolved =
            resolve_build_invocation(None, &default_flags(&root)).expect("resolve direct build");
        let expected_source_root = path_text(&root.join("src/main/aden"));
        let expected_entry = path_text(&entry);

        assert_eq!(
            resolved
                .source_root
                .as_deref()
                .map(|value| value.replace('\\', "/")),
            Some(expected_source_root)
        );
        assert_eq!(resolved.entry_path.replace('\\', "/"), expected_entry);
        assert_eq!(resolved.build_root, root.join("build"));

        let _ = fs::remove_dir_all(root);
    }

    #[test]
    fn resolve_build_invocation_via_adklib_bridge_executes_direct_mode() {
        ensure_adk_build_bridge_ready_for_tests();
        let root = unique_temp_root();
        let entry = root.join("src/main/aden/app/core/Main.aden");
        write_file(
            &entry,
            r#"
            package app.core;
            class Main {
                public static void main() {
                }
            }
            "#,
        );

        let resolved = resolve_build_invocation_via_adklib(None, &default_flags(&root))
            .expect("resolve direct build through adklib bridge");

        assert_eq!(
            resolved
                .source_root
                .as_deref()
                .map(|value| value.replace('\\', "/")),
            Some(path_text(&root.join("src/main/aden")))
        );
        assert_eq!(resolved.entry_path.replace('\\', "/"), path_text(&entry));
        assert!(!resolved.used_manifest);
        assert!(!resolved.adklib_enabled);

        let _ = fs::remove_dir_all(root);
    }

    #[test]
    fn resolve_build_invocation_via_adklib_bridge_honors_project_root_manifest() {
        ensure_adk_build_bridge_ready_for_tests();
        let root = unique_temp_root();
        write_file(
            &root.join("aden.toml"),
            r#"
            [package]
            name = "demo"
            version = "0.1.0"

            [sources]
            main_aden = "src/main/aden"
            entry = "app/core/Main.aden"

            [adklib]
            enabled = true
            "#,
        );
        let entry = root.join("src/main/aden/app/core/Main.aden");
        write_file(
            &entry,
            r#"
            package app.core;
            import adk.build.BuildInvocationResolver;
            class Main {
                public static void main() {
                }
            }
            "#,
        );

        let resolved = resolve_build_invocation_via_adklib(None, &default_flags(&root))
            .expect("resolve manifest-backed build through adklib bridge");

        assert!(resolved.used_manifest);
        assert!(resolved.adklib_enabled);
        assert_eq!(
            resolved
                .source_root
                .as_deref()
                .map(|value| value.replace('\\', "/")),
            Some(path_text(&root.join("src/main/aden")))
        );
        assert_eq!(resolved.entry_path.replace('\\', "/"), path_text(&entry));

        let _ = fs::remove_dir_all(root);
    }

    #[test]
    fn resolve_build_invocation_manifest_follows_adk_build_output_mode_and_toolchain_precedence()
    {
        ensure_adk_build_bridge_ready_for_tests();
        let root = unique_temp_root();
        write_file(
            &root.join("aden.toml"),
            r#"
            [package]
            name = "demo"
            version = "0.1.0"

            [sources]
            main_aden = "src/main/aden"
            entry = "app/core/Main.aden"

            [build]
            profile = "debug"
            output_mode = "single_exe"

            [toolchain]
            assembler = "manifest-asm"
            linker = "manifest-link"
            "#,
        );
        let entry = root.join("src/main/aden/app/core/Main.aden");
        write_file(
            &entry,
            r#"
            package app.core;
            class Main {
                public static void main() {
                }
            }
            "#,
        );
        let mut flags = default_flags(&root);
        flags.assembler = Some("cli-asm".to_string());
        flags.linker = Some("cli-link".to_string());

        let resolved =
            resolve_build_invocation(None, &flags).expect("resolve manifest-backed build");

        assert_eq!(resolved.output_mode, "fat");
        assert_eq!(resolved.assembler.as_deref(), Some("cli-asm"));
        assert_eq!(resolved.linker.as_deref(), Some("cli-link"));
        assert_eq!(resolved.profile, "debug");
        assert!(
            path_text(&resolved.build_root).ends_with("/build"),
            "unexpected build root: {}",
            path_text(&resolved.build_root)
        );
        assert!(
            path_text(&resolved.build_asm_dir).ends_with("/build/asm"),
            "unexpected asm dir: {}",
            path_text(&resolved.build_asm_dir)
        );

        let _ = fs::remove_dir_all(root);
    }
}
