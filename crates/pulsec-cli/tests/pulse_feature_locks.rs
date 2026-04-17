mod common;
use pulsec_core::check;
use std::fs;
use std::path::{Path, PathBuf};
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
        "pulsec_feature_lock_{}_{}_{}",
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

fn run_pulsec(args: &[&str]) -> std::process::Output {
    common::pulsec_command()
        .args(args)
        .output()
        .expect("run pulsec")
}

fn run_exe(path: &Path) -> std::process::Output {
    std::process::Command::new(path)
        .output()
        .expect("run built exe")
}

#[test]
fn lock_pulse_feature_01_implicit_prelude_contract_resolves_without_imports() {
    let src = r#"
        package app.core;

        class Main {
            public static void main() {
                List values = new ArrayList();
                Collection base = values;
                int n = Math.abs(-7);
                IO.println(n);
                IO.println(base.size());
            }
        }
    "#;

    check(src).expect(
        "implicit prelude/default import contract should remain usable without explicit imports",
    );
}

#[test]
fn lock_pulse_feature_02_authorlib_never_enters_implicit_prelude() {
    let src = r#"
        package app.core;

        class Main {
            public static void main() {
                ProjectLayout layout = ProjectLayout.defaults(".");
            }
        }
    "#;

    let err = check(src).expect_err("authorlib should never resolve through the implicit prelude");
    assert!(err.to_string().contains("Unknown type 'ProjectLayout'"));
}

#[test]
fn lock_pulse_feature_03_authorlib_opt_in_resolves_project_models() {
    let root = unique_temp_root();
    let src_root = root.join("src").join("main").join("pulse");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &root.join("pulsec.toml"),
        r#"
[package]
name = "author-models"
version = "0.1.0"

[sources]
main_pulse = "src/main/pulse"
entry = "app/core/Main.pulse"

[authorlib]
enabled = true
"#,
    );
    write_file(
        &entry,
        r#"
        package app.core;

        import author.build.BuildLayout;
        import author.build.BuildConfig;
        import author.build.BuildInvocation;
        import author.build.BuildInvocationResolver;
        import author.build.BuildPublishedArtifact;
        import author.build.BuildPublishedArtifactBridge;
        import author.build.BuildPublicationPlan;
        import author.build.BuildPublicationPlanBridge;
        import author.build.BuildSummaryWriter;
        import author.build.BuildPublicationWriter;
        import author.build.WorkspaceBuildMemberResult;
        import author.build.WorkspaceBuildResult;
        import author.compiler.CheckResult;
        import author.compiler.CheckSummaryWriter;
        import author.compiler.TestDiscoveryResult;
        import author.compiler.TestExecutionResult;
        import author.compiler.TestExecutionWriter;
        import author.compiler.TestResult;
        import author.compiler.TestDiagnosticWriter;
        import author.compiler.TestSummaryWriter;
        import author.compiler.WorkspaceCheckMemberResult;
        import author.compiler.WorkspaceCheckResult;
        import author.compiler.WorkspaceTestResult;
        import author.project.ManifestPackage;
        import author.project.AuthorlibConfig;
        import author.project.CheckInvocation;
        import author.project.CheckInvocationBridge;
        import author.project.ProjectDiscoveryBridge;
        import author.project.ProjectDiscovery;
        import author.project.ProjectInvocationResolver;
        import author.project.ProjectLayout;
        import author.project.ProjectLayoutResolver;
        import author.project.ProjectManifest;
        import author.project.ProjectManifestParser;
        import author.project.ProjectSources;
        import author.project.TestInvocation;
        import author.project.TestInvocationBridge;
        import author.project.WorkspaceContext;
        import author.project.WorkspaceContextBridge;
        import author.project.WorkspaceManifest;
        import author.toolchain.ToolchainCandidateBridge;
        import author.toolchain.ToolchainCandidatePlan;
        import author.toolchain.ToolchainCommandPlan;
        import author.toolchain.ToolchainConfig;
        import author.toolchain.ToolchainConfigResolver;
        import author.toolchain.ToolchainDiscoveryBridge;
        import author.toolchain.ToolchainDiscoveryPlan;
        import author.toolchain.ToolchainDiscoveryResult;
        import author.toolchain.ToolchainDiscoveryResultBridge;
        import author.toolchain.ToolchainDiscoveryResolver;
        import author.toolchain.ToolchainHostFilesystem;
        import author.toolchain.ToolchainProcessResultBridge;
        import author.toolchain.ToolchainResolver;
        import pulse.collections.ArrayList;
        import pulse.collections.List;
        import pulse.io.Files;
        import pulse.io.HostFiles;
        import pulse.io.Path;
        import pulse.process.ProcessEnvironment;
        import pulse.process.ProcessEnvironmentVariable;
        import pulse.process.ProcessPlan;
        import pulse.process.ProcessResult;
        import pulse.process.Processes;
        import pulse.rt.Intrinsics;

        class Main {
            public static void main() {
                ManifestPackage pkg = new ManifestPackage("demo", "1.2.3");
                ProjectLayout layout = ProjectLayout.defaults("workspace/demo");
                ProjectSources sources = ProjectSources.defaults("workspace/demo");
                BuildLayout build = BuildLayout.defaults("workspace/demo");
                BuildConfig buildConfig = BuildConfig.defaults("workspace/demo");
                ArrayList<String> members = new ArrayList<String>();
                members.add("apps/demo");
                members.add("libs/shared");
                members.add("apps/demo");
                WorkspaceManifest workspace = new WorkspaceManifest(members);
                AuthorlibConfig authorlib = new AuthorlibConfig(true);
                ProjectManifest manifest = new ProjectManifest(pkg, sources, build, workspace, authorlib);
                ProjectManifest scaffold = ProjectManifest.scaffold("workspace/demo", "demo");
                ProjectManifestParser parser = new ProjectManifestParser("workspace/demo");
                ProjectLayoutResolver resolver = new ProjectLayoutResolver("workspace/demo");
                ToolchainConfig manifestToolchain = new ToolchainConfig("manifest-link", "manifest-asm");
                ToolchainConfig resolvedToolchain = ToolchainConfigResolver.resolve(
                    manifestToolchain,
                    "cli-asm",
                    null
                );
                ToolchainCandidatePlan toolchainPlan = ToolchainDiscoveryResolver.planCandidates(
                    null,
                    "C:/env/link.exe",
                    "C:/vs/link.exe\nC:/VS/LINK.EXE\n"
                );
                ToolchainDiscoveryPlan discoveryPlan = ToolchainDiscoveryResolver.planWindowsDiscovery();
                String probeRoot = Files.createTempDirectory("toolchain_probe_lock");
                String vsRoot = Path.resolve(probeRoot, "vs");
                String kitsRoot = Path.resolve(probeRoot, "kits");
                String linkPath = Path.resolve(
                    vsRoot,
                    "2022/Community/VC/Tools/MSVC/14.40.0/bin/Hostx64/x64/link.exe"
                );
                String kernel32Path = Path.resolve(
                    kitsRoot,
                    "10.0.26100.0/um/x64/kernel32.lib"
                );
                Files.createDirectories(Path.parent(linkPath));
                Files.createDirectories(Path.parent(kernel32Path));
                Files.writeString(linkPath, "");
                Files.writeString(kernel32Path, "");
                ArrayList<String> probeVsRoots = new ArrayList<String>();
                probeVsRoots.add(vsRoot);
                ArrayList<String> probeSdkRoots = new ArrayList<String>();
                probeSdkRoots.add(kitsRoot);
                ToolchainDiscoveryResult probeResult = ToolchainDiscoveryResolver.probeWindowsDiscovery(
                    new ToolchainDiscoveryPlan(
                        probeVsRoots,
                        "VC/Tools/MSVC",
                        "bin/Hostx64/x64/link.exe",
                        probeSdkRoots,
                        "um/x64/kernel32.lib"
                    )
                );
                ArrayList<String> extraInputs = new ArrayList<String>();
                extraInputs.add("obj/runtime/StdlibRuntime.obj");
                extraInputs.add("kernel32.lib");
                ArrayList<ProcessEnvironmentVariable> baseEnv = new ArrayList<ProcessEnvironmentVariable>();
                baseEnv.add(new ProcessEnvironmentVariable("PATH", "C:/base"));
                baseEnv.add(new ProcessEnvironmentVariable("LIB", "C:/libs"));
                ArrayList<ProcessEnvironmentVariable> overrideEnv = new ArrayList<ProcessEnvironmentVariable>();
                overrideEnv.add(new ProcessEnvironmentVariable("path", "C:/override"));
                overrideEnv.add(new ProcessEnvironmentVariable("INCLUDE", "C:/include"));
                String responseFilePath = Path.resolve(probeRoot, "build/native_exe_link.rsp");
                ArrayList<String> responseArgs = new ArrayList<String>();
                responseArgs.add("/NOLOGO");
                responseArgs.add("/OUT:build/main.exe");
                responseArgs.add("obj/app/core/Main.obj");
                String writtenResponsePath = ToolchainHostFilesystem.writeResponseFile(
                    responseFilePath,
                    responseArgs
                );
                String artifactBaseName = BuildPublicationWriter.artifactBaseName("demo", "1.2.3");
                String artifactStamp = BuildPublicationWriter.artifactStamp("demo", "1.2.3", "debug");
                String publicationRoot = Path.resolve(probeRoot, "publication");
                String publicationSource = Path.resolve(publicationRoot, "source.txt");
                String publicationCopy = Path.resolve(publicationRoot, "copied/output.txt");
                String publicationTreeSource = Path.resolve(publicationRoot, "tree");
                String publicationTreeChild = Path.resolve(publicationTreeSource, "nested/value.txt");
                String publicationTreeCopy = Path.resolve(publicationRoot, "tree-copy");
                String filteredSource = Path.resolve(publicationRoot, "filtered");
                String filteredAsm = Path.resolve(filteredSource, "nested/Main.asm");
                String filteredObj = Path.resolve(filteredSource, "nested/Main.obj");
                String filteredTxt = Path.resolve(filteredSource, "nested/ignore.txt");
                String filteredAsmCopy = Path.resolve(publicationRoot, "filtered-asm");
                String filteredObjCopy = Path.resolve(publicationRoot, "filtered-obj");
                String layoutRoot = Path.resolve(publicationRoot, "layout");
                String layoutAsmRoot = Path.resolve(layoutRoot, "asm");
                String layoutGeneratedRoot = Path.resolve(layoutRoot, "generated");
                String layoutAssetsRoot = Path.resolve(layoutRoot, "assets");
                String layoutSanityRoot = Path.resolve(layoutRoot, "sanity");
                String layoutTmpRoot = Path.resolve(layoutRoot, "tmp");
                String emittedObjRoot = Path.resolve(publicationRoot, "emitted-obj");
                String emittedAsm = Path.resolve(emittedObjRoot, "app/core/Main.asm");
                String emittedObj = Path.resolve(emittedObjRoot, "app/core/Main.obj");
                String emittedNoise = Path.resolve(emittedObjRoot, "app/core/ignore.txt");
                String siblingAsm = Path.resolve(publicationRoot, "main.asm");
                String layoutResourcesRoot = Path.resolve(publicationRoot, "resources");
                String layoutResourceFile = Path.resolve(layoutResourcesRoot, "data.txt");
                String layoutPulseRoot = Path.resolve(publicationRoot, "main-pulse");
                String layoutPulseFile = Path.resolve(layoutPulseRoot, "app/core/Main.pulse");
                String publishedObjectTarget = Path.resolve(layoutGeneratedRoot, "app/core/Main.obj");
                String configPlanPath = Path.resolve(publicationRoot, "metadata/build.config.plan.json");
                HostFiles.writeAllText(publicationSource, "artifact");
                HostFiles.writeAllText(publicationTreeChild, "tree");
                HostFiles.writeAllText(filteredAsm, "asm");
                HostFiles.writeAllText(filteredObj, "obj");
                HostFiles.writeAllText(filteredTxt, "txt");
                HostFiles.writeAllText(emittedAsm, "asm");
                HostFiles.writeAllText(emittedObj, "obj");
                HostFiles.writeAllText(emittedNoise, "noise");
                HostFiles.writeAllText(siblingAsm, "sibling");
                HostFiles.writeAllText(layoutResourceFile, "resource");
                HostFiles.writeAllText(layoutPulseFile, "pulse");
                String copiedFile = BuildPublicationWriter.copyFile(publicationSource, publicationCopy);
                String copiedTree = BuildPublicationWriter.copyRecursive(
                    publicationTreeSource,
                    publicationTreeCopy
                );
                String copiedAsmTree = BuildPublicationWriter.copyRecursiveMatchingExtension(
                    filteredSource,
                    filteredAsmCopy,
                    "asm"
                );
                String copiedObjTree = BuildPublicationWriter.copyRecursiveMatchingExtension(
                    filteredSource,
                    filteredObjCopy,
                    ".obj"
                );
                BuildPublicationPlan publicationPlan = BuildPublicationWriter.resolvePublicationPlan(
                    "workspace/demo/build",
                    "workspace/demo/build/distro/debug",
                    "workspace/demo/build/generated",
                    "workspace/demo/build/assets",
                    "workspace/demo/build/tmp",
                    "debug",
                    "shared",
                    "demo",
                    "1.2.3",
                    "workspace/demo/build/tmp/backend/debug",
                    "workspace/demo/build/tmp/backend/debug/main.ir.txt",
                    "workspace/demo/build/tmp/backend/debug/native.plan.json",
                    "workspace/demo/build/tmp/backend/debug/native.link.txt",
                    "workspace/demo/build/tmp/backend/debug/obj/app/core/Main.obj",
                    "workspace/demo/build/tmp/backend/debug/demo.exe",
                    "workspace/demo/build/tmp/backend/debug/pulsecore.dll",
                    "workspace/demo/build/tmp/backend/debug/pulsecore.lib",
                    true,
                    true
                );
                boolean ensuredLayoutRoots = BuildPublicationWriter.ensureLayoutRoots(
                    layoutAsmRoot,
                    layoutGeneratedRoot,
                    layoutAssetsRoot,
                    layoutSanityRoot,
                    layoutTmpRoot
                );
                String materializedLayout = BuildPublicationWriter.materializeBuildLayout(
                    layoutAsmRoot,
                    layoutGeneratedRoot,
                    layoutAssetsRoot,
                    layoutSanityRoot,
                    layoutTmpRoot,
                    emittedObjRoot,
                    siblingAsm,
                    emittedObj,
                    publishedObjectTarget,
                    layoutResourcesRoot,
                    layoutPulseRoot
                );
                String writtenConfigPlan = BuildPublicationWriter.writeBuildConfigPlan(
                    configPlanPath,
                    "debug",
                    "windows-x64",
                    "windows-x64",
                    "windows",
                    "x64",
                    "supported",
                    "windows-x64",
                    "host-bootstrap",
                    "bootstrap-host",
                    "active",
                    "windows-x64",
                    "windows-x64",
                    "windows",
                    "x64",
                    "supported",
                    "windows-x64",
                    "host-bootstrap",
                    "bootstrap-host",
                    "active",
                    "windows-x64",
                    "exact",
                    "windows-x64",
                    "active",
                    "pulsec.runtime.abi.v1",
                    "active",
                    "shared",
                    "main",
                    "off",
                    "on",
                    "link.exe",
                    "ml64.exe",
                    layoutAsmRoot,
                    layoutGeneratedRoot,
                    layoutAssetsRoot,
                    layoutSanityRoot,
                    layoutTmpRoot,
                    "workspace/demo/build/distro/debug",
                    "workspace/demo/build/distro/debug/demo-native.plan.json",
                    "workspace/demo/build/distro/debug/demo.ir.txt",
                    publishedObjectTarget
                );
                String summaryText = BuildSummaryWriter.renderBuildSummary(
                    12,
                    34,
                    5,
                    7,
                    "debug",
                    "windows-x64",
                    "shared",
                    "main",
                    "off",
                    "on",
                    true,
                    "workspace/demo/src/main/pulse",
                    "workspace/demo/build/distro/debug",
                    "workspace/demo/build/distro/debug/demo.ir.txt",
                    "workspace/demo/build/distro/debug/demo-native.plan.json",
                    publishedObjectTarget,
                    "workspace/demo/build/distro/debug/demo-native.link.txt",
                    configPlanPath,
                    "demo",
                    "1.2.3",
                    "masm-split-stdlib",
                    "workspace/demo/build/distro/debug/bin/demo.exe"
                );
                String workspaceBuildStartText =
                    BuildSummaryWriter.renderWorkspaceBuildStart(
                        new WorkspaceBuildResult("workspace", 2, 0)
                    );
                String workspaceBuildMemberPassText =
                    BuildSummaryWriter.renderWorkspaceBuildMemberResult(
                        WorkspaceBuildMemberResult.success("workspace/demo")
                    );
                String workspaceBuildMemberFailText =
                    BuildSummaryWriter.renderWorkspaceBuildMemberResult(
                        WorkspaceBuildMemberResult.failure("workspace/shared", "link failed")
                    );
                String workspaceBuildSummaryText =
                    BuildSummaryWriter.renderWorkspaceBuildSummary(
                        new WorkspaceBuildResult("workspace", 2, 1)
                    );
                String workspaceBuildFailureText =
                    BuildSummaryWriter.renderWorkspaceBuildFailure(
                        new WorkspaceBuildResult("workspace", 2, 1)
                    );
                String checkOkText = CheckSummaryWriter.renderCheckResult(
                    CheckResult.success(
                        "demo",
                        2,
                        3,
                        4,
                        "friendly",
                        "manifest",
                        "workspace/demo/src/main/pulse/app/core/Main.pulse",
                        "workspace/demo/src/main/pulse"
                    )
                );
                String checkFailText = CheckSummaryWriter.renderCheckResult(
                    CheckResult.failure(
                        "strict",
                        "workspace/demo/src/main/pulse/app/core/Main.pulse",
                        "workspace/demo/src/main/pulse"
                    )
                );
                String workspaceCheckMemberPassText =
                    CheckSummaryWriter.renderWorkspaceCheckMemberResult(
                        WorkspaceCheckMemberResult.success("workspace/demo", "demo", 4)
                    );
                String workspaceCheckMemberFailText =
                    CheckSummaryWriter.renderWorkspaceCheckMemberResult(
                        WorkspaceCheckMemberResult.failure("workspace/shared", "missing entry")
                    );
                String workspaceCheckText = CheckSummaryWriter.renderWorkspaceCheckSummary(2, 1, 3);
                String workspaceCheckStartText =
                    CheckSummaryWriter.renderWorkspaceCheckStartResult(
                        new WorkspaceCheckResult("workspace", 2, "friendly", 0, 0)
                    );
                String workspaceCheckFailureText =
                    CheckSummaryWriter.renderWorkspaceCheckFailure(
                        new WorkspaceCheckResult("workspace", 2, "friendly", 1, 1)
                    );
                String testDiscoveryText = TestSummaryWriter.renderTestDiscoveryResult(
                    TestDiscoveryResult.success(
                        "manifest",
                        "workspace/demo",
                        "workspace/demo/tests",
                        "workspace/demo/src/main/pulse",
                        2
                    )
                );
                String testSummaryText = TestSummaryWriter.renderTestResult(
                    new TestResult(false, "friendly", 2, 0, 2)
                );
                String testExecutionPassText =
                    TestExecutionWriter.renderTestExecutionResult(
                        TestExecutionResult.pass("demo/AlphaTest")
                    );
                String testExecutionFailText =
                    TestExecutionWriter.renderTestExecutionResult(
                        TestExecutionResult.fail("demo/BetaTest", "compile error")
                    );
                String workspaceTestStartText = TestSummaryWriter.renderWorkspaceTestStart(
                    "workspace",
                    2,
                    "friendly"
                );
                String workspaceMemberDiscoveryText =
                    TestSummaryWriter.renderTestDiscoveryResult(
                        TestDiscoveryResult.workspaceMemberSuccess(
                            "workspace/demo",
                            "workspace/demo/tests",
                            "workspace/demo/src/main/pulse",
                            1
                        )
                    );
                String workspaceTestSummaryText =
                    TestSummaryWriter.renderWorkspaceTestSummaryResult(
                        new WorkspaceTestResult("workspace", 2, "friendly", 2, 0, 2)
                    );
                String workspaceTestExecutionPassText =
                    TestExecutionWriter.renderTestExecutionResult(
                        TestExecutionResult.workspacePass("workspace/demo", "demo/AlphaTest")
                    );
                String workspaceTestExecutionFailText =
                    TestExecutionWriter.renderTestExecutionResult(
                        TestExecutionResult.workspaceFail(
                            "workspace/demo",
                            "demo/BetaTest",
                            "compile error"
                        )
                    );
                String testDiscoveryFailureText =
                    TestDiagnosticWriter.renderTestDiscoveryResult(
                        TestDiscoveryResult.failure("missing tests root")
                    );
                String testNoFilesText =
                    TestDiagnosticWriter.renderTestDiscoveryResult(
                        TestDiscoveryResult.noTestsFound("workspace/demo/tests")
                    );
                String workspaceMemberNoTestsText =
                    TestDiagnosticWriter.renderTestDiscoveryResult(
                        TestDiscoveryResult.workspaceMemberNoTestsFound(
                            "workspace/demo",
                            "workspace/demo/tests"
                        )
                    );
                String workspaceTestsFailedText =
                    TestDiagnosticWriter.renderTestsFailed(
                        new TestResult(true, "friendly", 0, 1, 1)
                    );
                String testsFailedText =
                    TestDiagnosticWriter.renderTestsFailed(
                        new TestResult(false, "friendly", 0, 1, 1)
                    );
                BuildPublishedArtifact publishedArtifact = BuildPublicationWriter.publishArtifacts(
                    "workspace/demo/build/tmp/backend/debug/main.ir.txt",
                    "workspace/demo/build/tmp/backend/debug/native.plan.json",
                    "workspace/demo/build/tmp/backend/debug/native.link.txt",
                    emittedObj,
                    "workspace/demo/build/tmp/backend/debug/demo.exe",
                    "workspace/demo/build/tmp/backend/debug/pulsecore.dll",
                    "workspace/demo/build/tmp/backend/debug/pulsecore.lib",
                    layoutAssetsRoot,
                    "debug",
                    publicationPlan.publishProfileLayout(),
                    publicationPlan.publishDebugDiagnostics(),
                    publicationPlan.sharedProfileLayout(),
                    publicationPlan.artifactStamp(),
                    publicationPlan.publishedIrPath(),
                    publicationPlan.publishedNativePlanPath(),
                    publicationPlan.publishedLinkReportPath(),
                    publicationPlan.publishedObjectPath(),
                    publicationPlan.publishedExecutablePath(),
                    publicationPlan.publishedRuntimeLibraryPath(),
                    publicationPlan.publishedRuntimeImportLibraryPath(),
                    publicationPlan.publishedAssetsRoot(),
                    publicationPlan.sharedLaunchMetadataPath()
                );
                String finalizationText = BuildPublicationWriter.finalizeBuildBridgeText(
                    "workspace/demo/build",
                    "workspace/demo/build/distro/debug",
                    layoutAsmRoot,
                    layoutGeneratedRoot,
                    layoutAssetsRoot,
                    layoutSanityRoot,
                    layoutTmpRoot,
                    layoutResourcesRoot,
                    layoutPulseRoot,
                    "debug",
                    "windows-x64",
                    "shared",
                    "main",
                    "off",
                    "on",
                    "demo",
                    "1.2.3",
                    "link.exe",
                    "ml64.exe",
                    "workspace/demo/build/tmp/backend/debug",
                    "workspace/demo/build/tmp/backend/debug/main.ir.txt",
                    "workspace/demo/build/tmp/backend/debug/native.plan.json",
                    "workspace/demo/build/tmp/backend/debug/native.link.txt",
                    emittedObj,
                    "workspace/demo/build/tmp/backend/debug/demo.exe",
                    "workspace/demo/build/tmp/backend/debug/pulsecore.dll",
                    "workspace/demo/build/tmp/backend/debug/pulsecore.lib",
                    true,
                    true,
                    "windows-x64",
                    "windows",
                    "x64",
                    "supported",
                    "windows-x64",
                    "host-bootstrap",
                    "bootstrap-host",
                    "active",
                    "windows-x64",
                    "windows-x64",
                    "windows",
                    "x64",
                    "supported",
                    "windows-x64",
                    "host-bootstrap",
                    "bootstrap-host",
                    "active",
                    "windows-x64",
                    "exact",
                    "windows-x64",
                    "active",
                    "pulsec.runtime.abi.v1",
                    "active",
                    "workspace/demo/build/distro/debug"
                );
                ToolchainCommandPlan exePlan = ToolchainResolver.planWindowsExecutableLinkCommand(
                    "link.exe",
                    "mainCRTStartup",
                    "build/main.exe",
                    "obj/runtime/Startup.obj",
                    extraInputs
                );
                ProcessEnvironment mergedEnvironment = ToolchainResolver.mergeEnvironment(
                    new ProcessEnvironment(true, baseEnv),
                    overrideEnv
                );
                ProcessPlan linkProcess = ToolchainResolver.planResponseFileProcess(
                    "link.exe",
                    "build",
                    "build/native_exe_link.rsp",
                    mergedEnvironment
                );
                ProcessPlan masmProcess = ToolchainResolver.planWindowsMasmAssembleProcess(
                    "ml64.exe",
                    "build",
                    "build/main.asm",
                    "build/main.obj",
                    ProcessEnvironment.defaults()
                );
                String processCaptureRoot = Path.resolve(probeRoot, "capture");
                String workspaceRoot = Path.resolve(probeRoot, "workspace/root");
                String workspaceManifestPath = Path.resolve(workspaceRoot, "pulsec.toml");
                String workspaceDemoManifestPath = Path.resolve(
                    workspaceRoot,
                    "apps/demo/pulsec.toml"
                );
                String workspaceSharedManifestPath = Path.resolve(
                    workspaceRoot,
                    "libs/shared/pulsec.toml"
                );
                ArrayList<String> processArgs = new ArrayList<String>();
                processArgs.add("/d");
                processArgs.add("/c");
                processArgs.add("echo pulse_toolchain_process_ok");
                ProcessResult processResult = Processes.execute(
                    new ProcessPlan(
                        "cmd.exe",
                        null,
                        processArgs,
                        ProcessEnvironment.defaults()
                    ),
                    processCaptureRoot,
                    "tool"
                );
                Files.createDirectories(Path.parent(workspaceDemoManifestPath));
                Files.createDirectories(Path.parent(workspaceSharedManifestPath));
                HostFiles.writeAllText(
                    workspaceManifestPath,
                    "[workspace]\n"
                    + "members = \"apps/demo, libs/shared\"\n"
                );
                HostFiles.writeAllText(
                    workspaceDemoManifestPath,
                    "[package]\n"
                    + "name = \"demo\"\n"
                    + "version = \"1.0.0\"\n"
                );
                HostFiles.writeAllText(
                    workspaceSharedManifestPath,
                    "[package]\n"
                    + "name = \"shared\"\n"
                    + "version = \"1.0.0\"\n"
                );
                ProjectManifest parsedManifest = parser.parse(
                    "[package]\n"
                    + "name = \"demo\"\n"
                    + "version = \"1.2.3\"\n"
                    + "\n"
                    + "[sources]\n"
                    + "main_pulse = \"src/main/pulse\"\n"
                    + "entry = \"app/core/Main.pulse\"\n"
                    + "\n"
                    + "[build]\n"
                    + "profile = \"debug\"\n"
                    + "target = \"windows-x64\"\n"
                    + "output_mode = \"single_exe\"\n"
                    + "out_dir = \"build/distro/debug\"\n"
                    + "asm_dir = \"build/asm\"\n"
                    + "generated_dir = \"build/generated\"\n"
                    + "assets_dir = \"build/assets\"\n"
                    + "sanity_dir = \"build/sanity\"\n"
                    + "tmp_dir = \"build/tmp\"\n"
                    + "\n"
                    + "[authorlib]\n"
                    + "enabled = true\n"
                );
                WorkspaceManifest parsedWorkspace =
                    ProjectManifestParser.parseWorkspaceMembers("apps/demo, libs/shared, apps/demo");
                List<String> resolvedMembers = ProjectManifestParser.resolveWorkspaceMemberRoots(
                    "workspace",
                    parsedWorkspace
                );
                WorkspaceContext workspaceContext = ProjectDiscovery.resolveWorkspaceContext(
                    workspaceRoot
                );
                String noManifest = ProjectDiscovery.findManifestPath("workspace/unknown");
                CheckInvocation checkInvocation = ProjectInvocationResolver.resolveCheckInvocation(
                    "workspace/demo/src/main/pulse/app/core",
                    null,
                    null
                );
                TestInvocation testInvocation = ProjectInvocationResolver.resolveTestInvocation(
                    "workspace/demo/src/main/pulse/app/core",
                    null
                );
                String checkInvocationText = CheckInvocationBridge.toBridgeText(checkInvocation);
                String testInvocationText = TestInvocationBridge.toBridgeText(testInvocation);
                String discoveredTestsText = ProjectDiscoveryBridge.toBridgeText(
                    ProjectDiscovery.discoverTestFiles("workspace/demo/src/test/pulse")
                );
                String workspaceContextText = WorkspaceContextBridge.toBridgeText(workspaceContext);
                BuildInvocation buildInvocation = BuildInvocationResolver.resolveBuildInvocation(
                    "workspace/demo/src/main/pulse/app/core",
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null
                );

                boolean ok = pkg.name().equals("demo")
                    && pkg.version().equals("1.2.3")
                    && layout.mainPulseRoot().equals("workspace/demo/src/main/pulse")
                    && sources.entry().equals("app/main/Main.pulse")
                    && build.generatedRoot().equals("workspace/demo/build/generated")
                    && buildConfig.outputMode().equals("fat")
                    && workspace.size() == 2
                    && workspace.contains("apps/demo")
                    && workspace.contains("libs/shared")
                    && manifest.workspace().size() == 2
                    && manifest.authorlib().enabled()
                    && manifest.authorlibEnabled()
                    && parser.projectRoot().equals("workspace/demo")
                    && parsedManifest.packageInfo().name().equals("demo")
                    && parsedManifest.packageInfo().version().equals("1.2.3")
                    && parsedManifest.sources().entry().equals("app/core/Main.pulse")
                    && parsedManifest.build().buildRoot().equals("workspace/demo/build")
                    && parsedManifest.build().distroRoot().equals("workspace/demo/build/distro/debug")
                    && parsedManifest.buildConfig().profile().equals("debug")
                    && parsedManifest.buildConfig().target().equals("windows-x64")
                    && parsedManifest.buildConfig().outputMode().equals("fat")
                    && parsedManifest.buildConfig().outDir().equals("workspace/demo/build/distro/debug")
                    && parsedManifest.toolchain().linker() == null
                    && resolvedToolchain.linker().equals("manifest-link")
                    && resolvedToolchain.assembler().equals("cli-asm")
                    && toolchainPlan.linkerCandidates().size() == 1
                    && toolchainPlan.linkerCandidates().getString(0).equals("C:/env/link.exe")
                    && toolchainPlan.assemblerCandidates().size() == 3
                    && toolchainPlan.assemblerCandidates().getString(0).equals("C:/env/ml64.exe")
                    && toolchainPlan.assemblerCandidates().getString(1).equals("C:/vs/ml64.exe")
                    && toolchainPlan.assemblerCandidates().getString(2).equals("ml64.exe")
                    && ToolchainCandidateBridge.toBridgeText(toolchainPlan)
                        .contains("linkerCandidates=1:C:/env/link.exe")
                    && discoveryPlan.visualStudioRoots().size() == 2
                    && discoveryPlan.visualStudioRoots().getString(0)
                        .equals("C:/Program Files/Microsoft Visual Studio")
                    && discoveryPlan.visualStudioRoots().getString(1)
                        .equals("C:/Program Files (x86)/Microsoft Visual Studio")
                    && discoveryPlan.visualStudioToolRootRelativePath().equals("VC/Tools/MSVC")
                    && discoveryPlan.visualStudioLinkerRelativePath().equals("bin/Hostx64/x64/link.exe")
                    && discoveryPlan.windowsSdkLibRoots().size() == 1
                    && discoveryPlan.windowsSdkLibRoots().getString(0)
                        .equals("C:/Program Files (x86)/Windows Kits/10/Lib")
                    && discoveryPlan.windowsSdkKernel32RelativePath().equals("um/x64/kernel32.lib")
                    && probeResult.visualStudioLinkers().size() == 1
                    && probeResult.visualStudioLinkers().getString(0).equals(linkPath)
                    && probeResult.kernel32LibPath().equals(kernel32Path)
                    && ToolchainDiscoveryBridge.toBridgeText(discoveryPlan)
                        .contains("visualStudioToolRootRelativePath=1:VC/Tools/MSVC")
                    && ToolchainDiscoveryResultBridge.toBridgeText(probeResult)
                        .contains("kernel32LibPath=1:")
                    && writtenResponsePath.equals(responseFilePath)
                    && artifactBaseName.equals("demo-1.2.3")
                    && artifactStamp.equals("demo-1.2.3-debug")
                    && copiedFile != null
                    && copiedTree != null
                    && copiedAsmTree != null
                    && copiedObjTree != null
                    && publicationPlan.artifactBaseName().equals("demo-1.2.3")
                    && publicationPlan.artifactStamp().equals("demo-1.2.3-debug")
                    && publicationPlan.sharedProfileLayout()
                    && publicationPlan.publishedIrPath()
                        .equals("workspace/demo/build/distro/debug/metadata/demo-1.2.3-pulsec.ir.txt")
                    && publicationPlan.publishedNativePlanPath()
                        .equals("workspace/demo/build/distro/debug/metadata/demo-1.2.3-native.plan.json")
                    && publicationPlan.publishedLinkReportPath()
                        .equals("workspace/demo/build/distro/debug/metadata/demo-1.2.3-native.link.txt")
                    && publicationPlan.publishedObjectPath()
                        .equals("workspace/demo/build/generated/app/core/Main.obj")
                    && publicationPlan.publishedExecutablePath()
                        .equals("workspace/demo/build/distro/debug/bin/demo-1.2.3.exe")
                    && publicationPlan.publishedRuntimeLibraryPath()
                        .equals("workspace/demo/build/distro/debug/bin/pulsecore.dll")
                    && publicationPlan.publishedRuntimeImportLibraryPath()
                        .equals("workspace/demo/build/distro/debug/bin/pulsecore.lib")
                    && publicationPlan.sharedLaunchMetadataPath()
                        .equals("workspace/demo/build/distro/debug/bin/launch.txt")
                    && publicationPlan.artifactStampPath()
                        .equals("workspace/demo/build/distro/debug/metadata/stamp.txt")
                    && publicationPlan.buildConfigPlanPath()
                        .equals("workspace/demo/build/distro/debug/metadata/demo-1.2.3-build.config.plan.json")
                    && BuildPublicationPlanBridge.toBridgeText(publicationPlan)
                        .contains("sharedLaunchMetadataPath=1:workspace/demo/build/distro/debug/bin/launch.txt")
                    && ensuredLayoutRoots
                    && materializedLayout.equals(layoutSanityRoot)
                    && HostFiles.readAllText(Path.resolve(layoutAsmRoot, "app/core/Main.asm"))
                        .equals("asm")
                    && HostFiles.readAllText(Path.resolve(layoutAsmRoot, "main.asm"))
                        .equals("sibling")
                    && HostFiles.readAllText(Path.resolve(layoutGeneratedRoot, "app/core/Main.obj"))
                        .equals("obj")
                    && HostFiles.readAllText(Path.resolve(layoutGeneratedRoot, "app/core/ignore.txt"))
                        == null
                    && HostFiles.readAllText(Path.resolve(layoutAssetsRoot, "data.txt"))
                        .equals("resource")
                    && HostFiles.readAllText(Path.resolve(layoutSanityRoot, "src_main_pulse/app/core/Main.pulse"))
                        .equals("pulse")
                    && writtenConfigPlan.equals(configPlanPath)
                    && summaryText.contains("Build IR ready: classes=12 methods=34 fields=5 files=7")
                    && summaryText.contains("Build mode: profile=debug target=windows-x64 output_mode=shared")
                    && summaryText.contains("Build config plan: " + configPlanPath)
                    && summaryText.contains("Artifact stamp: demo-1.2.3-debug")
                    && summaryText.contains("Entry codegen: masm-split-stdlib")
                    && summaryText.contains("Executable: workspace/demo/build/distro/debug/bin/demo.exe")
                    && workspaceBuildStartText.equals(
                        "Workspace build: root=workspace members=2"
                    )
                    && workspaceBuildMemberPassText.equals("[PASS] workspace/demo")
                    && workspaceBuildMemberFailText.equals(
                        "[FAIL] workspace/shared :: link failed"
                    )
                    && workspaceBuildSummaryText.equals(
                        "Workspace build summary: failed=1 total=2"
                    )
                    && workspaceBuildFailureText.equals(
                        "one or more workspace members failed build"
                    )
                    && checkOkText.contains("OK: package=demo imports=2 classes=3 files=4")
                    && checkOkText.contains("Check summary: mode=friendly project_mode=manifest")
                    && checkFailText.equals(
                        "Check FAILED: mode=strict entry=workspace/demo/src/main/pulse/app/core/Main.pulse source_root=workspace/demo/src/main/pulse"
                    )
                    && workspaceCheckStartText.equals(
                        "Workspace check: root=workspace members=2 mode=friendly"
                    )
                    && workspaceCheckMemberPassText.equals(
                        "[PASS] workspace/demo package=demo files=4"
                    )
                    && workspaceCheckMemberFailText.equals(
                        "[FAIL] workspace/shared :: missing entry"
                    )
                    && workspaceCheckText.equals(
                        "Workspace check summary: passed=2 failed=1 total=3"
                    )
                    && workspaceCheckFailureText.equals(
                        "one or more workspace members failed check"
                    )
                    && testDiscoveryText.equals(
                        "Test discovery: project_mode=manifest project_root=workspace/demo tests_root=workspace/demo/tests source_root=workspace/demo/src/main/pulse count=2"
                    )
                    && testSummaryText.equals(
                        "Test summary: mode=friendly passed=2 failed=0 total=2"
                    )
                    && testExecutionPassText.equals("[PASS] demo/AlphaTest")
                    && testExecutionFailText.equals(
                        "[FAIL] demo/BetaTest :: compile error"
                    )
                    && workspaceTestStartText.equals(
                        "Workspace test: root=workspace members=2 mode=friendly"
                    )
                    && workspaceMemberDiscoveryText.equals(
                        "Member test discovery: member=workspace/demo tests_root=workspace/demo/tests source_root=workspace/demo/src/main/pulse count=1"
                    )
                    && workspaceTestSummaryText.equals(
                        "Workspace test summary: mode=friendly passed=2 failed=0 total=2"
                    )
                    && workspaceTestExecutionPassText.equals(
                        "[PASS] workspace/demo::demo/AlphaTest"
                    )
                    && workspaceTestExecutionFailText.equals(
                        "[FAIL] workspace/demo::demo/BetaTest :: compile error"
                    )
                    && testDiscoveryFailureText.equals(
                        "Test discovery failed: missing tests root"
                    )
                    && testNoFilesText.equals(
                        "Test discovery failed: no .pulse tests found under 'workspace/demo/tests'"
                    )
                    && workspaceMemberNoTestsText.equals(
                        "[FAIL] workspace/demo :: no .pulse tests found under 'workspace/demo/tests'"
                    )
                    && workspaceTestsFailedText.equals("one or more workspace tests failed")
                    && testsFailedText.equals("one or more tests failed")
                    && publishedArtifact.irPath()
                        .equals("workspace/demo/build/distro/debug/metadata/demo-1.2.3-pulsec.ir.txt")
                    && publishedArtifact.nativePlanPath()
                        .equals("workspace/demo/build/distro/debug/metadata/demo-1.2.3-native.plan.json")
                    && publishedArtifact.linkReportPath()
                        .equals("workspace/demo/build/distro/debug/metadata/demo-1.2.3-native.link.txt")
                    && publishedArtifact.objectPath()
                        .equals("workspace/demo/build/generated/app/core/Main.obj")
                    && publishedArtifact.executablePath()
                        .equals("workspace/demo/build/distro/debug/bin/demo-1.2.3.exe")
                    && publishedArtifact.runtimeLibraryPath()
                        .equals("workspace/demo/build/distro/debug/bin/pulsecore.dll")
                    && publishedArtifact.runtimeImportLibraryPath()
                        .equals("workspace/demo/build/distro/debug/bin/pulsecore.lib")
                    && BuildPublishedArtifactBridge.toBridgeText(publishedArtifact)
                        .contains("runtimeImportLibraryPath=1:workspace/demo/build/distro/debug/bin/pulsecore.lib")
                    && finalizationText.contains("buildConfigPlanPath=1:" + configPlanPath)
                    && finalizationText.contains(
                        "objectPath=1:workspace/demo/build/generated/app/core/Main.obj"
                    )
                    && finalizationText.contains(
                        "runtimeImportLibraryPath=1:workspace/demo/build/distro/debug/bin/pulsecore.lib"
                    )
                    && HostFiles.readAllText(configPlanPath).contains("\"target\": \"windows-x64\"")
                    && HostFiles.readAllText(configPlanPath).contains("\"assembler\": \"ml64.exe\"")
                    && HostFiles.readAllText(publicationCopy).equals("artifact")
                    && HostFiles.readAllText(Path.resolve(publicationTreeCopy, "nested/value.txt"))
                        .equals("tree")
                    && HostFiles.readAllText(Path.resolve(filteredAsmCopy, "nested/Main.asm"))
                        .equals("asm")
                    && HostFiles.readAllText(Path.resolve(filteredAsmCopy, "nested/Main.obj"))
                        == null
                    && HostFiles.readAllText(Path.resolve(filteredObjCopy, "nested/Main.obj"))
                        .equals("obj")
                    && HostFiles.readAllText(Path.resolve(filteredObjCopy, "nested/ignore.txt"))
                        == null
                    && Intrinsics.hostReadAllText(responseFilePath).equals(
                        "\"/NOLOGO\"\n"
                        + "\"/OUT:build/main.exe\"\n"
                        + "\"obj/app/core/Main.obj\"\n"
                    )
                    && exePlan.responseFileStem().equals("native_exe_link")
                    && exePlan.arguments().getString(0).equals("/NOLOGO")
                    && exePlan.arguments().getString(2).equals("/ENTRY:mainCRTStartup")
                    && exePlan.arguments().getString(6).equals("/OUT:build/main.exe")
                    && exePlan.arguments().getString(7).equals("obj/runtime/Startup.obj")
                    && exePlan.arguments().getString(9).equals("kernel32.lib")
                    && ToolchainResolver.responseFileArgument("build/native_exe_link.rsp")
                        .equals("@build/native_exe_link.rsp")
                    && mergedEnvironment.inheritParentEnvironment()
                    && mergedEnvironment.overrides().size() == 3
                    && mergedEnvironment.overrides().get(0).name().equals("LIB")
                    && mergedEnvironment.overrides().get(1).name().equals("path")
                    && mergedEnvironment.overrides().get(2).name().equals("INCLUDE")
                    && linkProcess.executable().equals("link.exe")
                    && linkProcess.workingDirectory().equals("build")
                    && linkProcess.arguments().size() == 1
                    && linkProcess.arguments().getString(0).equals("@build/native_exe_link.rsp")
                    && linkProcess.environment().equals(mergedEnvironment)
                    && masmProcess.executable().equals("ml64.exe")
                    && masmProcess.arguments().size() == 4
                    && masmProcess.arguments().getString(0).equals("/c")
                    && masmProcess.arguments().getString(2).equals("/Fobuild/main.obj")
                    && masmProcess.arguments().getString(3).equals("build/main.asm")
                    && masmProcess.environment().equals(ProcessEnvironment.defaults())
                    && processResult.success()
                    && processResult.stdoutText().contains("pulse_toolchain_process_ok")
                    && processResult.stderrText().isEmpty()
                    && ToolchainProcessResultBridge.toBridgeText(processResult)
                        .contains("exitCode=1:0")
                    && parsedWorkspace.contains("libs/shared")
                    && resolvedMembers.size() == 2
                    && workspaceContext.rootPath().endsWith("workspace/root")
                    && workspaceContext.memberCount() == 2
                    && workspaceContext.memberRoots().getString(0).endsWith("workspace/root/apps/demo")
                    && workspaceContext.memberRoots().getString(1).endsWith("workspace/root/libs/shared")
                    && workspaceContextText.contains("rootPath=1:")
                    && workspaceContextText.contains("count=1:2")
                    && resolvedMembers.getString(0).equals("workspace/apps/demo")
                    && resolvedMembers.getString(1).equals("workspace/libs/shared")
                    && noManifest == null
                    && checkInvocation.usedManifest()
                    && !checkInvocation.authorlibEnabled()
                    && checkInvocation.entryPath().equals("workspace/demo/src/main/pulse/app/core/Main.pulse")
                    && checkInvocationText.contains("entryPath=1:workspace/demo/src/main/pulse/app/core/Main.pulse")
                    && checkInvocationText.contains("usedManifest=1:true")
                    && testInvocation.projectRoot().equals("workspace/demo")
                    && testInvocation.testsRoot().equals("workspace/demo/src/test/pulse")
                    && testInvocationText.contains("projectRoot=1:workspace/demo")
                    && testInvocationText.contains("testsRoot=1:workspace/demo/src/test/pulse")
                    && discoveredTestsText.equals("count=1:0\n")
                    && buildInvocation.usedManifest()
                    && buildInvocation.outputRoot().equals("workspace/demo/build/distro/debug")
                    && buildInvocation.mainResourcesRoot().equals("workspace/demo/src/main/resources")
                    && buildInvocation.profile().equals("debug")
                    && buildInvocation.target().equals("windows-x64")
                    && buildInvocation.outputMode().equals("fat")
                    && buildInvocation.outputEntry().equals("main")
                    && buildInvocation.runtimeDebugAllocator().equals("off")
                    && buildInvocation.runtimeCycleCollector().equals("on")
                    && buildInvocation.toolchain().equals(ToolchainConfig.defaults())
                    && resolver.mainPulseRoot(manifest).equals("workspace/demo/src/main/pulse")
                    && resolver.testPulseRoot(manifest).equals("workspace/demo/src/test/pulse")
                    && resolver.mainResourcesRoot(manifest).equals("workspace/demo/src/main/resources")
                    && resolver.entryPath(manifest).equals("workspace/demo/src/main/pulse/app/main/Main.pulse")
                    && resolver.buildLayout(manifest).generatedRoot().equals("workspace/demo/build/generated")
                    && scaffold.packageInfo().version().equals("0.1.0");

                if (!ok) {
                    pulse.lang.IO.println("broken");
                }
            }
        }
    "#,
    );

    let output = run_pulsec(&[
        "check",
        "--project-root",
        root.to_str().expect("root utf8"),
        "--strict-package",
    ]);
    assert!(
        output.status.success(),
        "expected authorlib-enabled check success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );
}

#[test]
fn lock_pulse_feature_04_authorlib_project_models_require_opt_in() {
    let root = unique_temp_root();
    let src_root = root.join("src").join("main").join("pulse");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &root.join("pulsec.toml"),
        r#"
[package]
name = "author-models"
version = "0.1.0"

[sources]
main_pulse = "src/main/pulse"
entry = "app/core/Main.pulse"
"#,
    );
    write_file(
        &entry,
        r#"
        package app.core;

        import author.project.ProjectManifest;

        class Main {
            public static void main() {
                ProjectManifest manifest = ProjectManifest.scaffold("workspace/demo", "demo");
            }
        }
    "#,
    );

    let output = run_pulsec(&[
        "check",
        "--project-root",
        root.to_str().expect("root utf8"),
        "--strict-package",
    ]);
    assert!(
        !output.status.success(),
        "expected authorlib-gated check failure"
    );
    let stderr = String::from_utf8_lossy(&output.stderr);
    assert!(
        stderr.contains("Import 'author.*' requires [authorlib].enabled = true in pulsec.toml"),
        "expected authorlib gating error\nstderr:\n{}",
        stderr
    );
}

#[test]
fn lock_pulse_feature_05_public_process_api_resolves_without_authorlib_opt_in() {
    let root = unique_temp_root();
    let src_root = root.join("src").join("main").join("pulse");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &root.join("pulsec.toml"),
        r#"
[package]
name = "public-process"
version = "0.1.0"

[sources]
main_pulse = "src/main/pulse"
entry = "app/core/Main.pulse"
"#,
    );
    write_file(
        &entry,
        r#"
        package app.core;

        import pulse.collections.ArrayList;
        import pulse.io.HostFiles;
        import pulse.process.ProcessEnvironment;
        import pulse.process.ProcessEnvironmentVariable;
        import pulse.process.ProcessPlan;
        import pulse.process.ProcessResult;
        import pulse.process.Processes;

        class Main {
            public static void main() {
                ArrayList<ProcessEnvironmentVariable> overrides =
                    new ArrayList<ProcessEnvironmentVariable>();
                overrides.add(new ProcessEnvironmentVariable("PULSE_LOCK", "ok"));

                ArrayList<String> arguments = new ArrayList<String>();
                arguments.add("/d");
                arguments.add("/c");
                arguments.add("echo public_process_ok");

                ProcessResult result = Processes.execute(
                    new ProcessPlan(
                        "cmd.exe",
                        null,
                        arguments,
                        new ProcessEnvironment(true, overrides)
                    ),
                    "tmp/public_process_lock",
                    "process"
                );
                boolean hostFilesVisible = HostFiles.exists("tmp")
                    || !HostFiles.createDirectories("tmp/public_process_lock")
                    || HostFiles.isDirectory("tmp/public_process_lock")
                    || HostFiles.writeAllText("tmp/public_process_lock/probe.txt", "ok")
                    || HostFiles.readAllText("tmp/public_process_lock/probe.txt") == null;

                if (!result.success() || !hostFilesVisible) {
                    pulse.lang.IO.println("broken");
                }
            }
        }
    "#,
    );

    let output = run_pulsec(&[
        "check",
        "--project-root",
        root.to_str().expect("root utf8"),
        "--strict-package",
    ]);
    assert!(
        output.status.success(),
        "expected public process api check success without authorlib opt-in\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );
}

#[test]
fn lock_pulse_feature_06_public_host_files_copy_executes_without_authorlib_opt_in() {
    let root = unique_temp_root();
    let src_root = root.join("src").join("main").join("pulse");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &root.join("pulsec.toml"),
        r#"
[package]
name = "public-host-files"
version = "0.1.0"

[sources]
main_pulse = "src/main/pulse"
entry = "app/core/Main.pulse"
"#,
    );
    write_file(
        &entry,
        r#"
        package app.core;

        import pulse.io.HostFiles;
        import pulse.io.Path;

        class Main {
            public static void main() {
                String root = "tmp/public_host_files_lock";
                String source = Path.resolve(root, "source");
                String nested = Path.resolve(source, "nested");
                String destination = Path.resolve(root, "destination");
                String singleSource = Path.resolve(root, "single.txt");
                String singleCopy = Path.resolve(root, "copied/single.txt");
                HostFiles.createDirectories(nested);
                HostFiles.writeAllText(Path.resolve(source, "alpha.txt"), "alpha");
                HostFiles.writeAllText(Path.resolve(nested, "beta.txt"), "beta");
                HostFiles.writeAllText(singleSource, "single");

                boolean copiedSingle = HostFiles.copy(singleSource, singleCopy);
                boolean copiedTree = HostFiles.copyRecursive(source, destination);
                String alpha = HostFiles.readAllText(Path.resolve(destination, "alpha.txt"));
                String beta = HostFiles.readAllText(Path.resolve(destination, "nested/beta.txt"));
                String single = HostFiles.readAllText(singleCopy);

                if (copiedSingle && copiedTree
                    && "alpha".equals(alpha)
                    && "beta".equals(beta)
                    && "single".equals(single)) {
                    pulse.lang.IO.println("host_copy_ok");
                    return;
                }

                pulse.lang.IO.println("host_copy_broken");
            }
        }
    "#,
    );

    let build = run_pulsec(&[
        "build",
        "--project-root",
        root.to_str().expect("root utf8"),
        "--strict-package",
    ]);
    assert!(
        build.status.success(),
        "expected public host files build success without authorlib opt-in\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&build.stdout),
        String::from_utf8_lossy(&build.stderr)
    );

    let exe = root
        .join("build")
        .join("distro")
        .join("release")
        .join("public-host-files-0.1.0.exe");
    let output = run_exe(&exe);
    let stdout = String::from_utf8_lossy(&output.stdout);
    let stderr = String::from_utf8_lossy(&output.stderr);
    assert!(
        output.status.success(),
        "expected public host files exe success\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
    assert!(
        stdout.contains("host_copy_ok"),
        "expected host copy success output\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
}

#[test]
fn lock_pulse_feature_07_public_interop_api_executes_without_authorlib_opt_in() {
    let root = unique_temp_root();
    let src_root = root.join("src").join("main").join("pulse");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &root.join("pulsec.toml"),
        r#"
[package]
name = "public-interop"
version = "0.1.0"

[sources]
main_pulse = "src/main/pulse"
entry = "app/core/Main.pulse"
"#,
    );
    write_file(
        &entry,
        r#"
        package app.core;

        import pulse.interop.NativeCalls;
        import pulse.interop.NativeLibrary;
        import pulse.interop.NativeSymbol;

        class Main {
            public static void main() {
                NativeLibrary kernel = NativeLibrary.openRequired("kernel32.dll");
                NativeSymbol getCurrentProcessId = kernel.resolveRequired("GetCurrentProcessId");
                NativeSymbol getTickCount64 = kernel.resolveRequired("GetTickCount64");

                int pid = NativeCalls.callInt0(getCurrentProcessId);
                long ticks = NativeCalls.callLong0(getTickCount64);
                boolean closed = kernel.close();

                if (pid > 0 && ticks > 0L && closed) {
                    pulse.lang.IO.println("interop_ok");
                    return;
                }

                pulse.lang.IO.println("interop_broken");
            }
        }
    "#,
    );

    let build = run_pulsec(&[
        "build",
        "--project-root",
        root.to_str().expect("root utf8"),
        "--strict-package",
    ]);
    assert!(
        build.status.success(),
        "expected public interop build success without authorlib opt-in\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&build.stdout),
        String::from_utf8_lossy(&build.stderr)
    );

    let exe = root
        .join("build")
        .join("distro")
        .join("release")
        .join("public-interop-0.1.0.exe");
    let output = run_exe(&exe);
    let stdout = String::from_utf8_lossy(&output.stdout);
    let stderr = String::from_utf8_lossy(&output.stderr);
    assert!(
        output.status.success(),
        "expected public interop exe success\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
    assert!(
        stdout.contains("interop_ok"),
        "expected interop success output\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
}
