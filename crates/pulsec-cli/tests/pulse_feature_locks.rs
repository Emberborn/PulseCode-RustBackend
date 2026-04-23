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
        import author.compiler.BuildCoreExecutionBridge;
        import author.compiler.BuildCoreExecutionProvider;
        import author.compiler.BuildCoreExecutionResult;
        import author.compiler.CheckExecutionBridge;
        import author.compiler.CheckExecutionProvider;
        import author.compiler.CheckExecutionResult;
        import author.compiler.CheckResult;
        import author.compiler.CheckSummaryWriter;
        import author.compiler.TestDiscoveryResult;
        import author.compiler.TestExecutionResult;
        import author.compiler.TestExecutionWriter;
        import author.compiler.TestFileExecutionBridge;
        import author.compiler.TestFileExecutionProvider;
        import author.compiler.TestFileExecutionResult;
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
                CheckExecutionResult checkExecOk = CheckExecutionResult.success("demo", 2, 3, 4);
                String checkExecBridge = CheckExecutionBridge.toBridgeText(checkExecOk);
                CheckExecutionResult parsedCheckExec =
                    CheckExecutionBridge.fromBridgeText(checkExecBridge);
                CheckExecutionResult checkExecFail =
                    CheckExecutionBridge.fromBridgeText(
                        CheckExecutionBridge.toBridgeText(
                            CheckExecutionResult.failure("compile exploded")
                        )
                    );
                BuildCoreExecutionResult buildCoreOk = BuildCoreExecutionResult.success(
                    4,
                    3,
                    10,
                    2,
                    "tmp/pulsec.ir.txt",
                    "tmp/native.plan.json",
                    "tmp/main.obj",
                    "tmp/main.exe",
                    "tmp/pulsecore.dll",
                    "tmp/pulsecore.lib",
                    "tmp/native.link.txt",
                    "masm-split-stdlib"
                );
                BuildCoreExecutionResult parsedBuildCore =
                    BuildCoreExecutionBridge.fromBridgeText(
                        BuildCoreExecutionBridge.toBridgeText(buildCoreOk)
                    );
                BuildCoreExecutionResult buildCoreFail =
                    BuildCoreExecutionBridge.fromBridgeText(
                        BuildCoreExecutionBridge.toBridgeText(
                            BuildCoreExecutionResult.failure("backend emit failed")
                        )
                    );
                TestFileExecutionResult testFileExecOk =
                    TestFileExecutionResult.success(5);
                TestFileExecutionResult parsedTestFileExec =
                    TestFileExecutionBridge.fromBridgeText(
                        TestFileExecutionBridge.toBridgeText(testFileExecOk)
                    );
                TestFileExecutionResult testFileExecFail =
                    TestFileExecutionBridge.fromBridgeText(
                        TestFileExecutionBridge.toBridgeText(
                            TestFileExecutionResult.failure("test compile exploded")
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
                    && parsedCheckExec.success()
                    && parsedCheckExec.packageName().equals("demo")
                    && parsedCheckExec.filesLoaded() == 4
                    && checkExecFail.detail().equals("compile exploded")
                    && parsedBuildCore.success()
                    && parsedBuildCore.filesLoaded() == 4
                    && parsedBuildCore.objectPath().equals("tmp/main.obj")
                    && parsedBuildCore.entryCodegen().equals("masm-split-stdlib")
                    && buildCoreFail.detail().equals("backend emit failed")
                    && parsedTestFileExec.success()
                    && parsedTestFileExec.filesLoaded() == 5
                    && testFileExecFail.detail().equals("test compile exploded")
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
fn lock_pulse_feature_13_thread_utility_floor_executes_without_full_thread_lifecycle() {
    let root = unique_temp_root();
    let src_root = root.join("src").join("main").join("pulse");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &root.join("pulsec.toml"),
        r#"
[package]
name = "thread-utility-floor"
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

        class Main {
            public static void main() {
                Thread.sleep(1L);
                boolean yielded = Thread.yieldNow();
                long threadId = Thread.currentThreadId();
                if (threadId <= 0L) {
                    System.exit(7);
                }
                if (yielded) {
                    Thread.sleep(0L);
                } else {
                    Thread.sleep(0L);
                }
                System.exit(0);
            }
        }
    "#,
    );

    let build = run_pulsec(&["build", "--project-root", root.to_str().expect("root str")]);
    assert!(
        build.status.success(),
        "expected build success, stderr={}",
        String::from_utf8_lossy(&build.stderr)
    );

    let exe = root
        .join("build")
        .join("distro")
        .join("release")
        .join("thread-utility-floor-0.1.0.exe");
    let run = run_exe(&exe);
    assert!(
        run.status.success(),
        "expected run success, stderr={}",
        String::from_utf8_lossy(&run.stderr)
    );
}

#[test]
fn lock_pulse_feature_14_host_sync_floor_executes_without_full_monitor_language_support() {
    let root = unique_temp_root();
    let src_root = root.join("src").join("main").join("pulse");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &root.join("pulsec.toml"),
        r#"
[package]
name = "host-sync-floor"
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

        import pulse.concurrent.Event;
        import pulse.concurrent.Mutex;

        class Main {
            public static void main() {
                Event ready = Event.createManualReset(false);
                if (ready.waitOne(0L)) {
                    System.exit(10);
                }
                ready.set();
                if (!ready.waitOne(0L)) {
                    System.exit(11);
                }
                ready.reset();
                if (ready.waitOne(0L)) {
                    System.exit(12);
                }

                Mutex gate = Mutex.create();
                if (!gate.tryLock(0L)) {
                    System.exit(13);
                }
                gate.unlock();
                gate.lock();
                gate.unlock();

                ready.close();
                gate.close();
                System.exit(0);
            }
        }
    "#,
    );

    let build = run_pulsec(&["build", "--project-root", root.to_str().expect("root str")]);
    assert!(
        build.status.success(),
        "expected build success, stderr={}",
        String::from_utf8_lossy(&build.stderr)
    );

    let exe = root
        .join("build")
        .join("distro")
        .join("release")
        .join("host-sync-floor-0.1.0.exe");
    let run = run_exe(&exe);
    assert!(
        run.status.success(),
        "expected run success, stderr={}",
        String::from_utf8_lossy(&run.stderr)
    );
}

#[test]
fn lock_pulse_feature_15_host_atomic_floor_executes_without_full_memory_model_keywords() {
    let root = unique_temp_root();
    let src_root = root.join("src").join("main").join("pulse");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &root.join("pulsec.toml"),
        r#"
[package]
name = "host-atomic-floor"
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

        import pulse.concurrent.AtomicInt;
        import pulse.concurrent.AtomicLong;

        class Main {
            public static void main() {
                AtomicInt ai = AtomicInt.create(7);
                if (ai.get() != 7) {
                    System.exit(20);
                }
                if (ai.compareAndSet(8, 1)) {
                    System.exit(21);
                }
                if (!ai.compareAndSet(7, 9)) {
                    System.exit(22);
                }
                if (ai.getAndAdd(5) != 9) {
                    System.exit(23);
                }
                if (ai.addAndGet(2) != 16) {
                    System.exit(24);
                }
                if (ai.getAndSet(3) != 16) {
                    System.exit(25);
                }
                if (ai.incrementAndGet() != 4) {
                    System.exit(26);
                }

                AtomicLong al = AtomicLong.create(100L);
                if (al.get() != 100L) {
                    System.exit(27);
                }
                if (al.compareAndSet(101L, 1L)) {
                    System.exit(28);
                }
                if (!al.compareAndSet(100L, 120L)) {
                    System.exit(29);
                }
                if (al.getAndAdd(5L) != 120L) {
                    System.exit(30);
                }
                if (al.addAndGet(7L) != 132L) {
                    System.exit(31);
                }
                if (al.getAndSet(1L) != 132L) {
                    System.exit(32);
                }
                if (al.incrementAndGet() != 2L) {
                    System.exit(33);
                }

                ai.close();
                al.close();
                System.exit(0);
            }
        }
    "#,
    );

    let build = run_pulsec(&["build", "--project-root", root.to_str().expect("root str")]);
    assert!(
        build.status.success(),
        "expected build success, stderr={}",
        String::from_utf8_lossy(&build.stderr)
    );

    let exe = root
        .join("build")
        .join("distro")
        .join("release")
        .join("host-atomic-floor-0.1.0.exe");
    let run = run_exe(&exe);
    assert!(
        run.status.success(),
        "expected run success, stderr={}",
        String::from_utf8_lossy(&run.stderr)
    );
}

#[test]
fn lock_pulse_feature_16_host_permit_and_latch_floor_executes_without_monitor_keywords() {
    let root = unique_temp_root();
    let src_root = root.join("src").join("main").join("pulse");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &root.join("pulsec.toml"),
        r#"
[package]
name = "host-permit-floor"
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

        import pulse.concurrent.CountDownLatch;
        import pulse.concurrent.Semaphore;

        class Main {
            public static void main() {
                Semaphore permits = Semaphore.create(0, 3);
                if (permits.tryAcquire(0L)) {
                    System.exit(40);
                }
                permits.release(2);
                if (!permits.tryAcquire(0L)) {
                    System.exit(41);
                }
                if (!permits.tryAcquire(0L)) {
                    System.exit(42);
                }
                if (permits.tryAcquire(0L)) {
                    System.exit(43);
                }

                CountDownLatch latch = CountDownLatch.create(2);
                if (latch.await(0L)) {
                    System.exit(44);
                }
                latch.countDown();
                if (latch.await(0L)) {
                    System.exit(45);
                }
                latch.countDown();
                if (!latch.await(0L)) {
                    System.exit(46);
                }
                if (latch.currentCount() != 0) {
                    System.exit(47);
                }

                permits.close();
                latch.close();
                System.exit(0);
            }
        }
    "#,
    );

    let build = run_pulsec(&["build", "--project-root", root.to_str().expect("root str")]);
    assert!(
        build.status.success(),
        "expected build success, stderr={}",
        String::from_utf8_lossy(&build.stderr)
    );

    let exe = root
        .join("build")
        .join("distro")
        .join("release")
        .join("host-permit-floor-0.1.0.exe");
    let run = run_exe(&exe);
    assert!(
        run.status.success(),
        "expected run success, stderr={}",
        String::from_utf8_lossy(&run.stderr)
    );
}

#[test]
fn lock_pulse_feature_17_monitor_ownership_floor_executes_before_synchronized_lowering_exists() {
    let root = unique_temp_root();
    let src_root = root.join("src").join("main").join("pulse");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &root.join("pulsec.toml"),
        r#"
[package]
name = "monitor-ownership-floor"
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

        import pulse.concurrent.Monitor;

        class Main {
            public static void main() {
                Monitor gate = Monitor.create();
                if (gate.isHeldByCurrentThread()) {
                    System.exit(50);
                }
                if (gate.holdCount() != 0) {
                    System.exit(51);
                }

                gate.enter();
                if (!gate.isHeldByCurrentThread()) {
                    System.exit(52);
                }
                if (gate.holdCount() != 1) {
                    System.exit(53);
                }

                if (!gate.tryEnter(0L)) {
                    System.exit(54);
                }
                if (gate.holdCount() != 2) {
                    System.exit(55);
                }

                gate.exit();
                if (gate.holdCount() != 1) {
                    System.exit(56);
                }
                if (!gate.isHeldByCurrentThread()) {
                    System.exit(57);
                }

                gate.exit();
                if (gate.isHeldByCurrentThread()) {
                    System.exit(58);
                }
                if (gate.holdCount() != 0) {
                    System.exit(59);
                }

                if (!gate.tryEnter(0L)) {
                    System.exit(60);
                }
                if (gate.holdCount() != 1) {
                    System.exit(61);
                }
                gate.exit();

                gate.close();
                System.exit(0);
            }
        }
    "#,
    );

    let build = run_pulsec(&["build", "--project-root", root.to_str().expect("root str")]);
    assert!(
        build.status.success(),
        "expected build success, stderr={}",
        String::from_utf8_lossy(&build.stderr)
    );

    let exe = root
        .join("build")
        .join("distro")
        .join("release")
        .join("monitor-ownership-floor-0.1.0.exe");
    let run = run_exe(&exe);
    assert!(
        run.status.success(),
        "expected run success, stderr={}",
        String::from_utf8_lossy(&run.stderr)
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

#[test]
fn lock_pulse_feature_08_public_interop_memory_and_utf8_surface_executes_without_authorlib_opt_in() {
    let root = unique_temp_root();
    let src_root = root.join("src").join("main").join("pulse");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &root.join("pulsec.toml"),
        r#"
[package]
name = "public-interop-memory"
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

        import pulse.interop.NativeBuffer;
        import pulse.interop.NativeByteSpan;
        import pulse.interop.NativeCalls;
        import pulse.interop.NativeLibrary;
        import pulse.interop.NativePointer;
        import pulse.interop.NativeSymbol;
        import pulse.interop.NativeUtf8String;
        import pulse.io.ResourceScope;

        class Main {
            public static void main() {
                ResourceScope scope = new ResourceScope();
                NativeLibrary kernel = NativeLibrary.openRequired("kernel32.dll");

                NativeSymbol lstrlenA = kernel.resolveRequired("lstrlenA");
                NativeSymbol lstrcpyA = kernel.resolveRequired("lstrcpyA");

                NativeUtf8String text = NativeUtf8String.encode("interop_buffer_ok");
                scope.add(text);

                NativeBuffer buffer = NativeBuffer.allocate(text.byteLength() + 1);
                NativeBuffer scratch = NativeBuffer.allocate(24);
                scope.add(buffer);
                scope.add(scratch);

                int encodedLength = NativeCalls.callInt1(lstrlenA, text.pointer());
                NativePointer copied = NativeCalls.callPointer2(
                    lstrcpyA,
                    buffer.pointer(),
                    text.pointer()
                );
                String roundTrip = NativeUtf8String.decodeNullTerminated(buffer.pointer());
                NativeByteSpan bytes = buffer.view(0, text.byteLength());
                int firstByte = bytes.getByte(0);
                String borrowedRoundTrip = bytes.decodeUtf8();

                buffer.setByte(0, (int) 'I');
                String mutated = NativeUtf8String.decodeNullTerminated(buffer.pointer());

                scratch.pointer().writeLong(8, 123456789L);
                long marker = scratch.pointer().readLong(8);

                scope.close();
                boolean closed = kernel.close();

                if (encodedLength == text.byteLength()
                    && !copied.isNull()
                    && "interop_buffer_ok".equals(roundTrip)
                    && "interop_buffer_ok".equals(borrowedRoundTrip)
                    && firstByte == (int) 'i'
                    && "Interop_buffer_ok".equals(mutated)
                    && marker == 123456789L
                    && closed) {
                    pulse.lang.IO.println("interop_memory_ok");
                    return;
                }

                pulse.lang.IO.println("interop_memory_broken");
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
        "expected public interop memory build success without authorlib opt-in\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&build.stdout),
        String::from_utf8_lossy(&build.stderr)
    );

    let exe = root
        .join("build")
        .join("distro")
        .join("release")
        .join("public-interop-memory-0.1.0.exe");
    let output = run_exe(&exe);
    let stdout = String::from_utf8_lossy(&output.stdout);
    let stderr = String::from_utf8_lossy(&output.stderr);
    assert!(
        output.status.success(),
        "expected public interop memory exe success\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
    assert!(
        stdout.contains("interop_memory_ok"),
        "expected interop memory success output\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
}

#[test]
fn lock_pulse_feature_09_public_interop_ownership_modes_execute_without_authorlib_opt_in() {
    let root = unique_temp_root();
    let src_root = root.join("src").join("main").join("pulse");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &root.join("pulsec.toml"),
        r#"
[package]
name = "public-interop-ownership"
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

        import pulse.interop.NativeBuffer;
        import pulse.interop.NativeLibrary;
        import pulse.interop.NativeOwnership;
        import pulse.interop.NativeUtf8String;
        import pulse.io.ResourceScope;

        class Main {
            public static void main() {
                ResourceScope scope = new ResourceScope();
                NativeUtf8String text = NativeUtf8String.encode("ownership_ok");
                scope.add(text);

                NativeBuffer adopted = NativeBuffer.allocate(16);
                NativeBuffer borrowed = NativeBuffer.borrow(text.pointer(), text.byteLength());
                NativeBuffer manual = NativeBuffer.manual(text.pointer(), text.byteLength());
                scope.add(adopted);

                NativeLibrary kernel = NativeLibrary.openRequired("kernel32.dll");
                NativeLibrary borrowedKernel = NativeLibrary.borrow("kernel32.dll", kernel.rawHandle());
                NativeLibrary manualKernel = NativeLibrary.manual("kernel32.dll", kernel.rawHandle());

                borrowed.close();
                manual.close();

                String roundTrip = NativeUtf8String.decodeNullTerminated(text.pointer());
                boolean ok =
                    adopted.ownershipMode() == NativeOwnership.ADOPTED
                    && borrowed.ownershipMode() == NativeOwnership.BORROWED
                    && manual.ownershipMode() == NativeOwnership.MANUAL
                    && borrowed.isOpen() == false
                    && manual.isOpen() == false
                    && "ownership_ok".equals(roundTrip)
                    && kernel.ownershipMode() == NativeOwnership.ADOPTED
                    && borrowedKernel.ownershipMode() == NativeOwnership.BORROWED
                    && manualKernel.ownershipMode() == NativeOwnership.MANUAL
                    && borrowedKernel.close() == false
                    && manualKernel.close() == false
                    && kernel.isOpen();

                scope.close();
                boolean closed = kernel.close();

                if (ok && closed) {
                    pulse.lang.IO.println("interop_ownership_ok");
                    return;
                }

                pulse.lang.IO.println("interop_ownership_broken");
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
        "expected public interop ownership build success without authorlib opt-in\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&build.stdout),
        String::from_utf8_lossy(&build.stderr)
    );

    let exe = root
        .join("build")
        .join("distro")
        .join("release")
        .join("public-interop-ownership-0.1.0.exe");
    let output = run_exe(&exe);
    let stdout = String::from_utf8_lossy(&output.stdout);
    let stderr = String::from_utf8_lossy(&output.stderr);
    assert!(
        output.status.success(),
        "expected public interop ownership exe success\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
    assert!(
        stdout.contains("interop_ownership_ok"),
        "expected interop ownership success output\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
}

#[test]
fn lock_pulse_feature_10_public_interop_argument_and_loader_helpers_execute_without_authorlib_opt_in() {
    let root = unique_temp_root();
    let src_root = root.join("src").join("main").join("pulse");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &root.join("pulsec.toml"),
        r#"
[package]
name = "public-interop-args"
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

        import pulse.interop.NativeArgument;
        import pulse.interop.NativeBuffer;
        import pulse.interop.NativeCalls;
        import pulse.interop.NativeLibrary;
        import pulse.interop.NativeOwnership;
        import pulse.interop.NativePointer;
        import pulse.interop.NativeSymbol;
        import pulse.interop.NativeUtf8String;
        import pulse.io.ResourceScope;

        class Main {
            public static void main() {
                ResourceScope scope = new ResourceScope();
                NativeLibrary kernel = NativeLibrary.lookupLoadedRequired("kernel32.dll");
                NativeLibrary self = NativeLibrary.lookupSelfRequired();

                NativeSymbol lstrlenA = kernel.resolveRequired("lstrlenA");
                NativeSymbol lstrcpyA = kernel.resolveRequired("lstrcpyA");
                NativeSymbol getCurrentProcessId = kernel.resolveRequired("GetCurrentProcessId");

                NativeUtf8String text = NativeUtf8String.encode("interop_args_ok");
                NativeBuffer copy = NativeBuffer.allocate(text.byteLength() + 1);
                scope.add(text);
                scope.add(copy);

                int copiedLength = NativeCalls.callInt1(
                    lstrlenA,
                    NativeArgument.ofUtf8String(text)
                );
                NativePointer copiedPointer = NativeCalls.callPointer2(
                    lstrcpyA,
                    NativeArgument.ofBuffer(copy),
                    NativeArgument.ofUtf8String(text)
                );
                String copiedText = NativeUtf8String.decodeNullTerminated(copy.pointer());
                int pid = NativeCalls.asInt(NativeCalls.callLong0(getCurrentProcessId));

                boolean ok =
                    copiedLength == text.byteLength()
                    && !copiedPointer.isNull()
                    && "interop_args_ok".equals(copiedText)
                    && pid > 0
                    && kernel.ownershipMode() == NativeOwnership.BORROWED
                    && self.ownershipMode() == NativeOwnership.BORROWED
                    && self.isOpen()
                    && !kernel.close()
                    && !self.close();

                scope.close();

                if (ok) {
                    pulse.lang.IO.println("interop_args_ok");
                    return;
                }

                pulse.lang.IO.println("interop_args_broken");
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
        "expected public interop argument/loader helper build success without authorlib opt-in\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&build.stdout),
        String::from_utf8_lossy(&build.stderr)
    );

    let exe = root
        .join("build")
        .join("distro")
        .join("release")
        .join("public-interop-args-0.1.0.exe");
    let output = run_exe(&exe);
    let stdout = String::from_utf8_lossy(&output.stdout);
    let stderr = String::from_utf8_lossy(&output.stderr);
    assert!(
        output.status.success(),
        "expected public interop argument/loader helper exe success\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
    assert!(
        stdout.contains("interop_args_ok"),
        "expected interop argument/loader helper success output\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
}

#[test]
fn lock_pulse_feature_11_public_interop_function_pointer_surface_executes_without_authorlib_opt_in(
) {
    let root = unique_temp_root();
    let src_root = root.join("src").join("main").join("pulse");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &root.join("pulsec.toml"),
        r#"
[package]
name = "public-interop-function-pointers"
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

        import pulse.interop.NativeArgument;
        import pulse.interop.NativeBuffer;
        import pulse.interop.NativeCalls;
        import pulse.interop.NativeFunction;
        import pulse.interop.NativeLibrary;
        import pulse.interop.NativeOwnership;
        import pulse.interop.NativePointer;
        import pulse.interop.NativeUtf8String;
        import pulse.io.ResourceScope;

        class Main {
            public static void main() {
                ResourceScope scope = new ResourceScope();
                NativeLibrary kernel = NativeLibrary.lookupLoadedRequired("kernel32.dll");
                NativeFunction getProcAddress = kernel.resolveFunctionRequired("GetProcAddress");
                NativeFunction getCurrentProcessId = kernel.resolveFunctionRequired("GetCurrentProcessId");
                NativeFunction getModuleHandleExA = kernel.resolveFunctionRequired("GetModuleHandleExA");
                NativeUtf8String tickName = NativeUtf8String.encode("GetTickCount64");
                NativeBuffer moduleOut = NativeBuffer.allocate(8);
                scope.add(tickName);
                scope.add(moduleOut);

                int pid = NativeCalls.asInt(NativeCalls.callLong0(getCurrentProcessId));
                NativePointer tickPointer = NativeCalls.asPointer(
                    NativeCalls.callLong2(
                        getProcAddress,
                        NativeArgument.ofLong(kernel.rawHandle()),
                        NativeArgument.ofUtf8String(tickName)
                    )
                );
                NativeFunction getTickCount64 = NativeFunction.fromPointer(tickPointer, "GetTickCount64");
                long ticks = NativeCalls.callLong0(getTickCount64);
                boolean resolvedModule = NativeCalls.asBoolean(
                    NativeCalls.callLong3(
                        getModuleHandleExA,
                        NativeArgument.ofInt(4),
                        NativeArgument.ofFunction(getCurrentProcessId),
                        NativeArgument.ofBuffer(moduleOut)
                    )
                );
                long moduleHandle = moduleOut.pointer().readLong(0);

                boolean ok =
                    pid > 0
                    && ticks > 0L
                    && !tickPointer.isNull()
                    && resolvedModule
                    && moduleHandle == kernel.rawHandle()
                    && kernel.ownershipMode() == NativeOwnership.BORROWED
                    && getCurrentProcessId.isAvailable()
                    && getCurrentProcessId.pointer().rawAddress() == getCurrentProcessId.address()
                    && "GetCurrentProcessId".equals(getCurrentProcessId.name())
                    && kernel.resolveRequired("GetCurrentProcessId").asFunction().address() == getCurrentProcessId.address()
                    && !kernel.close();

                scope.close();

                if (ok) {
                    pulse.lang.IO.println("interop_function_pointer_ok");
                    return;
                }

                pulse.lang.IO.println("interop_function_pointer_broken");
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
        "expected public interop function-pointer build success without authorlib opt-in\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&build.stdout),
        String::from_utf8_lossy(&build.stderr)
    );

    let exe = root
        .join("build")
        .join("distro")
        .join("release")
        .join("public-interop-function-pointers-0.1.0.exe");
    let output = run_exe(&exe);
    let stdout = String::from_utf8_lossy(&output.stdout);
    let stderr = String::from_utf8_lossy(&output.stderr);
    assert!(
        output.status.success(),
        "expected public interop function-pointer exe success\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
    assert!(
        stdout.contains("interop_function_pointer_ok"),
        "expected interop function-pointer success output\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
}

#[test]
fn lock_pulse_feature_12_public_interop_callbacks_execute_without_authorlib_opt_in() {
    let root = unique_temp_root();
    let src_root = root.join("src").join("main").join("pulse");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &root.join("pulsec.toml"),
        r#"
[package]
name = "public-interop-callbacks"
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

        import pulse.interop.NativeArgument;
        import pulse.interop.NativeBuffer;
        import pulse.interop.NativeCallback2;
        import pulse.interop.NativeCallbackHandle;
        import pulse.interop.NativeCalls;
        import pulse.interop.NativeLibrary;
        import pulse.interop.NativePointer;

        class SortComparator implements NativeCallback2 {
            public static int calls = 0;

            public long invoke(long leftAddress, long rightAddress) {
                SortComparator.calls = SortComparator.calls + 1;
                long left = NativePointer.fromRaw(leftAddress).readLong(0);
                long right = NativePointer.fromRaw(rightAddress).readLong(0);
                if (left < right) {
                    return -1L;
                }
                if (left > right) {
                    return 1L;
                }
                return 0L;
            }
        }

        class Main {
            public static void main() {
                NativeLibrary crt = NativeLibrary.openRequired("msvcrt.dll");
                NativeBuffer values = NativeBuffer.allocate(24);
                NativeCallbackHandle comparator = NativeCallbackHandle.create(new SortComparator());
                values.pointer().writeLong(0, 7L);
                values.pointer().writeLong(8, 1L);
                values.pointer().writeLong(16, 4L);

                NativeCalls.callLong4(
                    crt.resolveFunctionRequired("qsort"),
                    NativeArgument.ofBuffer(values),
                    NativeArgument.ofLong(3L),
                    NativeArgument.ofLong(8L),
                    NativeArgument.ofFunction(comparator.function())
                );

                long first = values.pointer().readLong(0);
                long second = values.pointer().readLong(8);
                long third = values.pointer().readLong(16);
                boolean closedComparator = comparator.close();
                values.close();
                boolean closedLibrary = crt.close();

                if (first == 1L
                    && second == 4L
                    && third == 7L
                    && SortComparator.calls > 0
                    && closedComparator
                    && closedLibrary) {
                    pulse.lang.IO.println("interop_callback_ok");
                    return;
                }

                pulse.lang.IO.println("interop_callback_broken");
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
        "expected public interop callback build success without authorlib opt-in\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&build.stdout),
        String::from_utf8_lossy(&build.stderr)
    );

    let exe = root
        .join("build")
        .join("distro")
        .join("release")
        .join("public-interop-callbacks-0.1.0.exe");
    let output = run_exe(&exe);
    let stdout = String::from_utf8_lossy(&output.stdout);
    let stderr = String::from_utf8_lossy(&output.stderr);
    assert!(
        output.status.success(),
        "expected public interop callback exe success\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
    assert!(
        stdout.contains("interop_callback_ok"),
        "expected interop callback success output\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
}

#[test]
fn lock_pulse_feature_18_synchronized_statement_executes_via_monitor_floor() {
    let root = unique_temp_root();
    let src_root = root.join("src").join("main").join("pulse");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &root.join("pulsec.toml"),
        r#"
[package]
name = "synchronized-monitor-floor"
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

        import pulse.concurrent.Monitor;

        class Main {
            public static void main() {
                Monitor gate = Monitor.create();
                boolean ok = false;
                boolean broken = false;

                synchronized (gate) {
                    if (!gate.isHeldByCurrentThread() || gate.holdCount() != 1) {
                        broken = true;
                    }

                    synchronized (gate) {
                        if (!gate.isHeldByCurrentThread() || gate.holdCount() != 2) {
                            broken = true;
                        }
                    }

                    ok =
                        !broken
                        && gate.isHeldByCurrentThread()
                        && gate.holdCount() == 1;
                }

                if (!broken && ok && !gate.isHeldByCurrentThread() && gate.holdCount() == 0) {
                    pulse.lang.IO.println("sync_ok");
                    gate.close();
                    return;
                }

                pulse.lang.IO.println("sync_broken");
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
        "expected synchronized monitor-floor build success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&build.stdout),
        String::from_utf8_lossy(&build.stderr)
    );

    let exe = root
        .join("build")
        .join("distro")
        .join("release")
        .join("synchronized-monitor-floor-0.1.0.exe");
    let output = run_exe(&exe);
    let stdout = String::from_utf8_lossy(&output.stdout);
    let stderr = String::from_utf8_lossy(&output.stderr);
    assert!(
        output.status.success(),
        "expected synchronized monitor-floor exe success\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
    assert!(
        stdout.contains("sync_ok"),
        "expected synchronized monitor-floor success output\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
}

#[test]
fn lock_pulse_feature_19_synchronized_methods_execute_without_return_workarounds() {
    let root = unique_temp_root();
    let src_root = root.join("src").join("main").join("pulse");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &root.join("pulsec.toml"),
        r#"
[package]
name = "synchronized-method-floor"
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

        class Counter {
            private int value;

            public Counter() {
                this.value = 0;
            }

            public synchronized int next() {
                this.value = this.value + 1;
                return this.value;
            }
        }

        class Singleton {
            private static Singleton instance = null;

            public static synchronized Singleton getInstance() {
                if (Singleton.instance == null) {
                    Singleton.instance = new Singleton();
                }
                return Singleton.instance;
            }
        }

        class Main {
            public static void main() {
                Counter counter = new Counter();
                int first = counter.next();
                int second = counter.next();
                Singleton left = Singleton.getInstance();
                Singleton right = Singleton.getInstance();

                if (first == 1 && second == 2 && left == right) {
                    pulse.lang.IO.println("sync_method_ok");
                    return;
                }

                pulse.lang.IO.println("sync_method_broken");
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
        "expected synchronized method-floor build success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&build.stdout),
        String::from_utf8_lossy(&build.stderr)
    );

    let exe = root
        .join("build")
        .join("distro")
        .join("release")
        .join("synchronized-method-floor-0.1.0.exe");
    let output = run_exe(&exe);
    let stdout = String::from_utf8_lossy(&output.stdout);
    let stderr = String::from_utf8_lossy(&output.stderr);
    assert!(
        output.status.success(),
        "expected synchronized method-floor exe success\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
    assert!(
        stdout.contains("sync_method_ok"),
        "expected synchronized method-floor success output\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
}

#[test]
fn lock_pulse_feature_20_monitor_wait_notify_floor_releases_and_reacquires_without_thread_object_model() {
    let root = unique_temp_root();
    let src_root = root.join("src").join("main").join("pulse");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &root.join("pulsec.toml"),
        r#"
[package]
name = "monitor-wait-notify-floor"
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
        import pulse.concurrent.Monitor;

        class Main {
            public static void main() {
                Monitor gate = Monitor.create();

                gate.enter();
                gate.enter();
                if (!gate.isHeldByCurrentThread() || gate.holdCount() != 2) {
                    System.exit(80);
                }
                if (gate.waitingCount() != 0) {
                    System.exit(81);
                }

                boolean notified = gate.wait(0L);
                if (notified) {
                    System.exit(82);
                }
                if (!gate.isHeldByCurrentThread() || gate.holdCount() != 2) {
                    System.exit(83);
                }
                if (gate.waitingCount() != 0) {
                    System.exit(84);
                }

                gate.notify();
                gate.notifyAll();

                gate.exit();
                gate.exit();
                if (gate.isHeldByCurrentThread() || gate.holdCount() != 0) {
                    System.exit(85);
                }

                gate.close();
                pulse.lang.IO.println("monitor_wait_notify_ok");
            }
        }
    "#,
    );

    let build = run_pulsec(&[
        "build",
        "--project-root",
        root.to_string_lossy().as_ref(),
        "--strict-package",
    ]);
    assert!(
        build.status.success(),
        "expected monitor-wait-notify-floor build success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&build.stdout),
        String::from_utf8_lossy(&build.stderr)
    );

    let exe = root
        .join("build")
        .join("distro")
        .join("release")
        .join("monitor-wait-notify-floor-0.1.0.exe");
    let output = run_exe(&exe);
    let stdout = String::from_utf8_lossy(&output.stdout);
    let stderr = String::from_utf8_lossy(&output.stderr);
    assert!(
        output.status.success(),
        "expected monitor-wait-notify-floor exe success\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
    assert!(
        stdout.contains("monitor_wait_notify_ok"),
        "expected monitor-wait-notify-floor success output\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
}

#[test]
fn lock_pulse_feature_21_thread_lifecycle_floor_executes_start_join_and_cooperative_interrupt() {
    let root = unique_temp_root();
    let src_root = root.join("src").join("main").join("pulse");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &root.join("pulsec.toml"),
        r#"
[package]
name = "thread-lifecycle-floor"
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
        import pulse.concurrent.AtomicInt;
        import pulse.lang.Runnable;
        import pulse.lang.Thread;

        class InterruptWorker implements Runnable {
            public Thread owner;
            private AtomicInt seen;

            public InterruptWorker(AtomicInt seen) {
                this.owner = null;
                this.seen = seen;
            }

            public void run() {
                this.seen.set(1);
                while (!this.owner.isInterrupted()) {
                    Thread.sleep(1L);
                }
                this.seen.set(2);
            }
        }

        class Main {
            public static void main() {
                AtomicInt seen = AtomicInt.create(0);
                InterruptWorker worker = new InterruptWorker(seen);
                Thread thread = new Thread(worker);
                worker.owner = thread;

                thread.start();
                int spins = 0;
                while (seen.get() != 1 && spins < 200) {
                    Thread.sleep(1L);
                    spins = spins + 1;
                }
                if (seen.get() != 1 || !thread.hasStarted() || !thread.isAlive()) {
                    System.exit(90);
                }

                thread.interrupt();
                if (!thread.join(2000L)) {
                    System.exit(91);
                }
                if (thread.isAlive() || seen.get() != 2 || thread.threadId() <= 0L) {
                    System.exit(92);
                }

                thread.close();
                seen.close();
                pulse.lang.IO.println("thread_lifecycle_ok");
            }
        }
    "#,
    );

    let build = run_pulsec(&[
        "build",
        "--project-root",
        root.to_string_lossy().as_ref(),
        "--strict-package",
    ]);
    assert!(
        build.status.success(),
        "expected thread-lifecycle-floor build success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&build.stdout),
        String::from_utf8_lossy(&build.stderr)
    );

    let exe = root
        .join("build")
        .join("distro")
        .join("release")
        .join("thread-lifecycle-floor-0.1.0.exe");
    let output = run_exe(&exe);
    let stdout = String::from_utf8_lossy(&output.stdout);
    let stderr = String::from_utf8_lossy(&output.stderr);
    assert!(
        output.status.success(),
        "expected thread-lifecycle-floor exe success\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
    assert!(
        stdout.contains("thread_lifecycle_ok"),
        "expected thread-lifecycle-floor success output\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
}

#[test]
fn lock_pulse_feature_22_cross_thread_monitor_notify_wakes_waiting_thread() {
    let root = unique_temp_root();
    let src_root = root.join("src").join("main").join("pulse");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &root.join("pulsec.toml"),
        r#"
[package]
name = "cross-thread-monitor-notify"
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
        import pulse.concurrent.AtomicInt;
        import pulse.concurrent.Monitor;
        import pulse.lang.Runnable;
        import pulse.lang.Thread;

        class Notifier implements Runnable {
            private Monitor gate;
            private AtomicInt state;

            public Notifier(Monitor gate, AtomicInt state) {
                this.gate = gate;
                this.state = state;
            }

            public void run() {
                Thread.sleep(10L);
                synchronized (this.gate) {
                    this.state.set(1);
                    this.gate.notifyAll();
                }
            }
        }

        class Main {
            public static void main() {
                Monitor gate = Monitor.create();
                AtomicInt state = AtomicInt.create(0);
                Thread notifier = new Thread(new Notifier(gate, state));

                notifier.start();
                synchronized (gate) {
                    while (state.get() == 0) {
                        boolean woke = gate.wait(2000L);
                        if (!woke && state.get() == 0) {
                            System.exit(100);
                        }
                    }
                }

                if (state.get() != 1) {
                    System.exit(101);
                }
                if (!notifier.join(2000L)) {
                    System.exit(102);
                }

                notifier.close();
                state.close();
                gate.close();
                pulse.lang.IO.println("cross_thread_notify_ok");
            }
        }
    "#,
    );

    let build = run_pulsec(&[
        "build",
        "--project-root",
        root.to_string_lossy().as_ref(),
        "--strict-package",
    ]);
    assert!(
        build.status.success(),
        "expected cross-thread-monitor-notify build success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&build.stdout),
        String::from_utf8_lossy(&build.stderr)
    );

    let exe = root
        .join("build")
        .join("distro")
        .join("release")
        .join("cross-thread-monitor-notify-0.1.0.exe");
    let output = run_exe(&exe);
    let stdout = String::from_utf8_lossy(&output.stdout);
    let stderr = String::from_utf8_lossy(&output.stderr);
    assert!(
        output.status.success(),
        "expected cross-thread-monitor-notify exe success\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
    assert!(
        stdout.contains("cross_thread_notify_ok"),
        "expected cross-thread-monitor-notify success output\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
}

#[test]
fn lock_pulse_feature_23_atomic_boolean_floor_executes_without_reference_atomic_claims() {
    let root = unique_temp_root();
    let src_root = root.join("src").join("main").join("pulse");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &root.join("pulsec.toml"),
        r#"
[package]
name = "atomic-boolean-floor"
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
        import pulse.concurrent.AtomicBoolean;

        class Main {
            public static void main() {
                AtomicBoolean flag = AtomicBoolean.create(false);
                if (flag.get()) {
                    System.exit(110);
                }
                if (!flag.compareAndSet(false, true)) {
                    System.exit(111);
                }
                if (!flag.get()) {
                    System.exit(112);
                }
                if (flag.compareAndSet(false, true)) {
                    System.exit(113);
                }
                if (!flag.getAndSet(false)) {
                    System.exit(114);
                }
                if (flag.get()) {
                    System.exit(115);
                }

                flag.close();
                pulse.lang.IO.println("atomic_boolean_ok");
            }
        }
    "#,
    );

    let build = run_pulsec(&[
        "build",
        "--project-root",
        root.to_string_lossy().as_ref(),
        "--strict-package",
    ]);
    assert!(
        build.status.success(),
        "expected atomic-boolean-floor build success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&build.stdout),
        String::from_utf8_lossy(&build.stderr)
    );

    let exe = root
        .join("build")
        .join("distro")
        .join("release")
        .join("atomic-boolean-floor-0.1.0.exe");
    let output = run_exe(&exe);
    let stdout = String::from_utf8_lossy(&output.stdout);
    let stderr = String::from_utf8_lossy(&output.stderr);
    assert!(
        output.status.success(),
        "expected atomic-boolean-floor exe success\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
    assert!(
        stdout.contains("atomic_boolean_ok"),
        "expected atomic-boolean-floor success output\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
}

#[test]
fn lock_pulse_feature_24_atomic_reference_publication_floor_executes_with_explicit_reference_handoff() {
    let root = unique_temp_root();
    let src_root = root.join("src").join("main").join("pulse");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &root.join("pulsec.toml"),
        r#"
[package]
name = "atomic-reference-floor"
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
        import pulse.concurrent.AtomicReference;
        import pulse.lang.Runnable;
        import pulse.lang.Thread;

        class BoxValue {
            public int value;

            public BoxValue(int value) {
                this.value = value;
            }
        }

        class Publisher implements Runnable {
            private AtomicReference<BoxValue> slot;

            public Publisher(AtomicReference<BoxValue> slot) {
                this.slot = slot;
            }

            public void run() {
                this.slot.set(new BoxValue(77));
            }
        }

        class Main {
            public static void main() {
                AtomicReference<BoxValue> slot = AtomicReference.create(null);
                Thread publisher = new Thread(new Publisher(slot));
                publisher.start();

                BoxValue seen = null;
                int spins = 0;
                while (seen == null && spins < 500) {
                    seen = slot.get();
                    if (seen == null) {
                        Thread.sleep(1L);
                        spins = spins + 1;
                    }
                }
                publisher.join(2000L);
                if (seen == null || seen.value != 77) {
                    System.exit(120);
                }

                BoxValue previous = slot.getAndSet(new BoxValue(88));
                if (previous == null || previous.value != 77) {
                    System.exit(121);
                }

                BoxValue current = slot.get();
                if (current == null || current.value != 88) {
                    System.exit(122);
                }

                if (!slot.compareAndSet(current, new BoxValue(99))) {
                    System.exit(123);
                }

                current = slot.get();
                if (current == null || current.value != 99) {
                    System.exit(124);
                }

                slot.close();
                pulse.lang.IO.println("atomic_reference_ok");
            }
        }
    "#,
    );

    let build = run_pulsec(&[
        "build",
        "--project-root",
        root.to_string_lossy().as_ref(),
        "--strict-package",
    ]);
    assert!(
        build.status.success(),
        "expected atomic-reference-floor build success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&build.stdout),
        String::from_utf8_lossy(&build.stderr)
    );

    let exe = root
        .join("build")
        .join("distro")
        .join("release")
        .join("atomic-reference-floor-0.1.0.exe");
    let output = run_exe(&exe);
    let stdout = String::from_utf8_lossy(&output.stdout);
    let stderr = String::from_utf8_lossy(&output.stderr);
    assert!(
        output.status.success(),
        "expected atomic-reference-floor exe success\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
    assert!(
        stdout.contains("atomic_reference_ok"),
        "expected atomic-reference-floor success output\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
}

#[test]
fn lock_pulse_feature_25_runtime_memory_floor_executes_weak_and_cycle_across_threads() {
    let root = unique_temp_root();
    let src_root = root.join("src").join("main").join("pulse");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &root.join("pulsec.toml"),
        r#"
[package]
name = "runtime-memory-floor"
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

        import pulse.concurrent.AtomicInt;
        import pulse.concurrent.AtomicReference;
        import pulse.concurrent.Event;
        import pulse.lang.Runnable;
        import pulse.lang.Thread;
        import pulse.memory.Memory;

        class RuntimeMemoryWorker implements Runnable {
            private long weak;
            private AtomicReference<String> published;
            private AtomicInt status;
            private Event ready;

            public RuntimeMemoryWorker(
                long weak,
                AtomicReference<String> published,
                AtomicInt status,
                Event ready
            ) {
                this.weak = weak;
                this.published = published;
                this.status = status;
                this.ready = ready;
            }

            public void run() {
                String observed = Memory.weakGet(this.weak);
                int tick = Memory.cycleTick();
                if (observed != null
                    && "runtime_memory_floor".equals(observed)
                    && tick >= 0) {
                    this.published.set(observed);
                    this.status.set(1);
                } else {
                    this.status.set(-1);
                }
                this.ready.set();
            }
        }

        class Main {
            public static void main() {
                String source = "runtime_memory_floor";
                long weak = Memory.weakNew(source);
                AtomicReference<String> published = AtomicReference.create(null);
                AtomicInt status = AtomicInt.create(0);
                Event ready = Event.createManualReset(false);
                RuntimeMemoryWorker target =
                    new RuntimeMemoryWorker(weak, published, status, ready);
                Thread worker = new Thread(target);

                worker.start();
                boolean signaled = ready.waitOne(2000L);
                worker.join();
                String observed = published.get();
                int young = Memory.cycleYoungPass();
                int full = Memory.cycleFullPass();
                Memory.weakClear(weak);

                if (signaled
                    && status.get() == 1
                    && "runtime_memory_floor".equals(observed)
                    && young >= 0
                    && full >= 0) {
                    pulse.lang.IO.println("runtime_memory_ok");
                    return;
                }

                pulse.lang.IO.println("runtime_memory_broken");
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
        "expected runtime-memory-floor build success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&build.stdout),
        String::from_utf8_lossy(&build.stderr)
    );

    let exe = root
        .join("build")
        .join("distro")
        .join("release")
        .join("runtime-memory-floor-0.1.0.exe");
    let output = run_exe(&exe);
    let stdout = String::from_utf8_lossy(&output.stdout);
    let stderr = String::from_utf8_lossy(&output.stderr);
    assert!(
        output.status.success(),
        "expected runtime-memory-floor exe success\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
    assert!(
        stdout.contains("runtime_memory_ok"),
        "expected runtime-memory-floor success output\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
}

#[test]
fn lock_pulse_feature_26_executor_future_baseline_executes_submission_result_failure_and_shutdown() {
    let root = unique_temp_root();
    let src_root = root.join("src").join("main").join("pulse");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &root.join("pulsec.toml"),
        r#"
[package]
name = "executor-future-floor"
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

        import pulse.concurrent.AtomicInt;
        import pulse.concurrent.Callable;
        import pulse.concurrent.ExecutionException;
        import pulse.concurrent.Executors;
        import pulse.concurrent.Future;
        import pulse.concurrent.ThreadPerTaskExecutor;
        import pulse.lang.IllegalStateException;
        import pulse.lang.Runnable;

        class GreetingCallable implements Callable<String> {
            private String value;

            public GreetingCallable(String value) {
                this.value = value;
            }

            public String call() {
                return this.value;
            }
        }

        class CountingRunnable implements Runnable {
            private AtomicInt counter;

            public CountingRunnable(AtomicInt counter) {
                this.counter = counter;
            }

            public void run() {
                this.counter.incrementAndGet();
            }
        }

        class FailingCallable implements Callable<Object> {
            public Object call() {
                throw new IllegalStateException("executor failure");
            }
        }

        class Main {
            public static void main() {
                ThreadPerTaskExecutor executor = Executors.newThreadPerTaskExecutor();
                AtomicInt counter = AtomicInt.create(0);
                Future<String> greeting = executor.submit(new GreetingCallable("executor_future_floor"));
                Future<Object> completion = executor.submit(new CountingRunnable(counter));
                Future<Object> failure = executor.submit(new FailingCallable());

                String observed = (String) greeting.get();
                completion.get();

                boolean sawFailure = false;
                try {
                    failure.get();
                } catch (ExecutionException ex) {
                    sawFailure =
                        ex.getCause() != null
                        && ex.getCause() instanceof IllegalStateException;
                }

                executor.shutdown();
                boolean terminated = executor.awaitTermination(2000L);

                greeting.close();
                completion.close();
                failure.close();
                executor.close();

                if ("executor_future_floor".equals(observed)
                    && counter.get() == 1
                    && sawFailure
                    && terminated) {
                    pulse.lang.IO.println("executor_future_ok");
                    return;
                }

                pulse.lang.IO.println("executor_future_broken");
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
        "expected executor-future-floor build success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&build.stdout),
        String::from_utf8_lossy(&build.stderr)
    );

    let exe = root
        .join("build")
        .join("distro")
        .join("release")
        .join("executor-future-floor-0.1.0.exe");
    let output = run_exe(&exe);
    let stdout = String::from_utf8_lossy(&output.stdout);
    let stderr = String::from_utf8_lossy(&output.stderr);
    assert!(
        output.status.success(),
        "expected executor-future-floor exe success\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
    assert!(
        stdout.contains("executor_future_ok"),
        "expected executor-future-floor success output\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
}

#[test]
fn lock_pulse_feature_27_scheduled_and_completable_future_baseline_executes_delayed_and_chained_work() {
    let root = unique_temp_root();
    let src_root = root.join("src").join("main").join("pulse");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &root.join("pulsec.toml"),
        r#"
[package]
name = "scheduled-completable-floor"
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

        import pulse.concurrent.Callable;
        import pulse.concurrent.CompletableFuture;
        import pulse.concurrent.CompletionFunction;
        import pulse.concurrent.Executors;
        import pulse.concurrent.ScheduledFuture;
        import pulse.concurrent.ScheduledThreadPerTaskExecutor;
        import pulse.concurrent.ThreadPerTaskExecutor;
        import pulse.lang.Runnable;

        class DelayedCallable implements Callable<String> {
            public String call() {
                return "delayed_future_floor";
            }
        }

        class SeedCallable implements Callable<String> {
            public String call() {
                return "seed";
            }
        }

        class AppendFunction implements CompletionFunction<String, String> {
            public String apply(String value) {
                return value.concat("_mapped");
            }
        }

        class MarkerRunnable implements Runnable {
            private StringBuilder sink;

            public MarkerRunnable(StringBuilder sink) {
                this.sink = sink;
            }

            public void run() {
                this.sink.append("_ran");
            }
        }

        class Main {
            public static void main() {
                ScheduledThreadPerTaskExecutor scheduler =
                    Executors.newScheduledThreadPerTaskExecutor();
                ThreadPerTaskExecutor executor =
                    Executors.newThreadPerTaskExecutor();
                ScheduledFuture<String> delayed =
                    scheduler.schedule(new DelayedCallable(), 50L);
                String delayedValue = (String) delayed.get();

                CompletableFuture<String> seed =
                    CompletableFuture.supplyAsync(new SeedCallable(), executor);
                CompletableFuture<String> mapped =
                    seed.thenApplyAsync(new AppendFunction(), executor);
                StringBuilder sink = new StringBuilder(mapped.get());
                CompletableFuture<Object> after =
                    mapped.thenRunAsync(new MarkerRunnable(sink), executor);
                after.get();

                scheduler.shutdown();
                executor.shutdown();
                boolean schedulerDone = scheduler.awaitTermination(2000L);
                boolean executorDone = executor.awaitTermination(2000L);

                delayed.close();
                seed.close();
                mapped.close();
                after.close();
                scheduler.close();
                executor.close();

                if ("delayed_future_floor".equals(delayedValue)
                    && "seed_mapped_ran".equals(sink.toString())
                    && schedulerDone
                    && executorDone) {
                    pulse.lang.IO.println("scheduled_completable_ok");
                    return;
                }

                pulse.lang.IO.println("scheduled_completable_broken");
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
        "expected scheduled-completable-floor build success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&build.stdout),
        String::from_utf8_lossy(&build.stderr)
    );

    let exe = root
        .join("build")
        .join("distro")
        .join("release")
        .join("scheduled-completable-floor-0.1.0.exe");
    let output = run_exe(&exe);
    let stdout = String::from_utf8_lossy(&output.stdout);
    let stderr = String::from_utf8_lossy(&output.stderr);
    assert!(
        output.status.success(),
        "expected scheduled-completable-floor exe success\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
    assert!(
        stdout.contains("scheduled_completable_ok"),
        "expected scheduled-completable-floor success output\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
}

#[test]
fn lock_pulse_feature_28_concurrent_collection_baseline_executes_map_and_copy_on_write_list() {
    let root = unique_temp_root();
    let src_root = root.join("src").join("main").join("pulse");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &root.join("pulsec.toml"),
        r#"
[package]
name = "concurrent-collections-floor"
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

        import pulse.concurrent.ConcurrentHashMap;
        import pulse.concurrent.CopyOnWriteArrayList;
        import pulse.lang.Iterator;
        import pulse.lang.Runnable;
        import pulse.lang.Thread;

        class MapWriter implements Runnable {
            private ConcurrentHashMap<String, String> map;

            public MapWriter(ConcurrentHashMap<String, String> map) {
                this.map = map;
            }

            public void run() {
                this.map.put("worker", "done");
            }
        }

        class Main {
            public static void main() {
                ConcurrentHashMap<String, String> map =
                    new ConcurrentHashMap<String, String>();
                CopyOnWriteArrayList<String> values =
                    new CopyOnWriteArrayList<String>();
                values.add("seed");

                Thread writer = new Thread(new MapWriter(map));
                writer.start();
                writer.join(2000L);

                if (!"done".equals(map.get("worker"))
                    || !map.containsKey("worker")
                    || map.size() != 1) {
                    System.exit(170);
                }

                values.add(map.get("worker"));
                Iterator snapshot = values.iterator();
                values.add("after");

                int seen = 0;
                while (snapshot.hasNext()) {
                    snapshot.next();
                    seen = seen + 1;
                }

                if (seen != 2
                    || values.size() != 3
                    || !"seed".equals(values.getFirst())
                    || !"after".equals(values.getLast())
                    || !values.contains("done")
                    || map.keySet().size() != 1
                    || map.values().size() != 1) {
                    System.exit(171);
                }

                pulse.lang.IO.println("concurrent_collections_ok");
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
        "expected concurrent-collections-floor build success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&build.stdout),
        String::from_utf8_lossy(&build.stderr)
    );

    let exe = root
        .join("build")
        .join("distro")
        .join("release")
        .join("concurrent-collections-floor-0.1.0.exe");
    let output = run_exe(&exe);
    let stdout = String::from_utf8_lossy(&output.stdout);
    let stderr = String::from_utf8_lossy(&output.stderr);
    assert!(
        output.status.success(),
        "expected concurrent-collections-floor exe success\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
    assert!(
        stdout.contains("concurrent_collections_ok"),
        "expected concurrent-collections-floor success output\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
}

#[test]
fn lock_pulse_feature_29_blocking_queue_and_deque_baseline_executes_cross_thread_handoff() {
    let root = unique_temp_root();
    let src_root = root.join("src").join("main").join("pulse");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &root.join("pulsec.toml"),
        r#"
[package]
name = "blocking-collections-floor"
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

        import pulse.concurrent.LinkedBlockingDeque;
        import pulse.concurrent.LinkedBlockingQueue;
        import pulse.lang.Runnable;
        import pulse.lang.Thread;

        class QueueProducer implements Runnable {
            private LinkedBlockingQueue<String> queue;

            public QueueProducer(LinkedBlockingQueue<String> queue) {
                this.queue = queue;
            }

            public void run() {
                Thread.sleep(50L);
                this.queue.put("queue_ready");
            }
        }

        class Main {
            public static void main() {
                LinkedBlockingQueue<String> queue =
                    new LinkedBlockingQueue<String>();
                Thread producer = new Thread(new QueueProducer(queue));
                producer.start();
                String queueValue = queue.take();
                producer.join(2000L);

                LinkedBlockingDeque<String> deque =
                    new LinkedBlockingDeque<String>();
                deque.putFirst("front");
                deque.putLast("back");
                String first = deque.takeFirst();
                String last = deque.takeLast();
                String empty = deque.pollFirst(20L);

                if (!"queue_ready".equals(queueValue)
                    || !"front".equals(first)
                    || !"back".equals(last)
                    || empty != null
                    || !queue.isEmpty()
                    || !deque.isEmpty()) {
                    System.exit(180);
                }

                pulse.lang.IO.println("blocking_collections_ok");
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
        "expected blocking-collections-floor build success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&build.stdout),
        String::from_utf8_lossy(&build.stderr)
    );

    let exe = root
        .join("build")
        .join("distro")
        .join("release")
        .join("blocking-collections-floor-0.1.0.exe");
    let output = run_exe(&exe);
    let stdout = String::from_utf8_lossy(&output.stdout);
    let stderr = String::from_utf8_lossy(&output.stderr);
    assert!(
        output.status.success(),
        "expected blocking-collections-floor exe success\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
    assert!(
        stdout.contains("blocking_collections_ok"),
        "expected blocking-collections-floor success output\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
}

#[test]
fn lock_pulse_feature_30_completable_future_recovery_accept_and_compose_baseline_executes() {
    let root = unique_temp_root();
    let src_root = root.join("src").join("main").join("pulse");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &root.join("pulsec.toml"),
        r#"
[package]
name = "completable-future-depth-floor"
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

        import pulse.concurrent.Callable;
        import pulse.concurrent.CompletableFuture;
        import pulse.concurrent.CompletionConsumer;
        import pulse.concurrent.CompletionFunction;
        import pulse.concurrent.Executors;
        import pulse.concurrent.ThreadPerTaskExecutor;
        import pulse.lang.IllegalStateException;

        class SeedCallable implements Callable<String> {
            public String call() {
                return "seed";
            }
        }

        class FailureMapper implements CompletionFunction<IllegalStateException, String> {
            public String apply(IllegalStateException value) {
                return value.getMessage().concat("_recovered");
            }
        }

        class SinkConsumer implements CompletionConsumer<String> {
            private StringBuilder sink;

            public SinkConsumer(StringBuilder sink) {
                this.sink = sink;
            }

            public void accept(String value) {
                this.sink.append(value);
            }
        }

        class ComposeMapper implements CompletionFunction<String, CompletableFuture<String>> {
            private ThreadPerTaskExecutor executor;

            public ComposeMapper(ThreadPerTaskExecutor executor) {
                this.executor = executor;
            }

            public CompletableFuture<String> apply(String value) {
                CompletableFuture<String> next = CompletableFuture.supplyAsync(
                    new SuffixCallable(value),
                    this.executor
                );
                return next;
            }
        }

        class SuffixCallable implements Callable<String> {
            private String value;

            public SuffixCallable(String value) {
                this.value = value;
            }

            public String call() {
                return this.value.concat("_composed");
            }
        }

        class Main {
            public static void main() {
                ThreadPerTaskExecutor executor =
                    Executors.newThreadPerTaskExecutor();
                StringBuilder sink = new StringBuilder();

                CompletableFuture<String> failed =
                    new CompletableFuture<String>();
                failed.completeExceptionally(
                    new IllegalStateException("boom")
                );
                CompletableFuture<String> recovered =
                    failed.exceptionallyAsync(new FailureMapper(), executor);
                CompletableFuture<Object> accepted =
                    recovered.thenAcceptAsync(new SinkConsumer(sink), executor);

                CompletableFuture<String> seeded =
                    CompletableFuture.supplyAsync(new SeedCallable(), executor);
                CompletableFuture<String> composed =
                    seeded.thenComposeAsync(
                        new ComposeMapper(executor),
                        executor
                    );

                accepted.get();
                String recoveredValue = recovered.get();
                String composedValue = composed.get();

                executor.shutdown();
                boolean done = executor.awaitTermination(2000L);

                failed.close();
                recovered.close();
                accepted.close();
                seeded.close();
                composed.close();
                executor.close();

                if ("boom_recovered".equals(recoveredValue)
                    && "boom_recovered".equals(sink.toString())
                    && "seed_composed".equals(composedValue)
                    && done) {
                    pulse.lang.IO.println("completable_future_depth_ok");
                    return;
                }

                pulse.lang.IO.println("completable_future_depth_broken");
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
        "expected completable-future-depth-floor build success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&build.stdout),
        String::from_utf8_lossy(&build.stderr)
    );

    let exe = root
        .join("build")
        .join("distro")
        .join("release")
        .join("completable-future-depth-floor-0.1.0.exe");
    let output = run_exe(&exe);
    let stdout = String::from_utf8_lossy(&output.stdout);
    let stderr = String::from_utf8_lossy(&output.stderr);
    assert!(
        output.status.success(),
        "expected completable-future-depth-floor exe success\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
    assert!(
        stdout.contains("completable_future_depth_ok"),
        "expected completable-future-depth-floor success output\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
}

#[test]
fn lock_pulse_feature_31_periodic_scheduling_and_extended_completion_stage_execute() {
    let root = unique_temp_root();
    let src_root = root.join("src").join("main").join("pulse");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &root.join("pulsec.toml"),
        r#"
[package]
name = "periodic-completion-stage-floor"
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

        import pulse.concurrent.AtomicInt;
        import pulse.concurrent.Callable;
        import pulse.concurrent.CompletableFuture;
        import pulse.concurrent.CompletionBiConsumer;
        import pulse.concurrent.CompletionBiFunction;
        import pulse.concurrent.Executors;
        import pulse.concurrent.ScheduledFuture;
        import pulse.concurrent.ScheduledThreadPerTaskExecutor;
        import pulse.concurrent.ThreadPerTaskExecutor;
        import pulse.concurrent.Event;
        import pulse.concurrent.ExecutionException;
        import pulse.lang.IllegalStateException;
        import pulse.lang.Runnable;
        import pulse.lang.Thread;
        import pulse.lang.Throwable;

        class PeriodicCounter implements Runnable {
            private AtomicInt counter;
            private Event reached;
            private int stopAt;
            private long pauseMillis;

            public PeriodicCounter(
                AtomicInt counter,
                Event reached,
                int stopAt,
                long pauseMillis
            ) {
                this.counter = counter;
                this.reached = reached;
                this.stopAt = stopAt;
                this.pauseMillis = pauseMillis;
            }

            public void run() {
                int value = this.counter.incrementAndGet();
                if (this.pauseMillis > 0L) {
                    Thread.sleep(this.pauseMillis);
                }
                if (value >= this.stopAt) {
                    this.reached.set();
                }
            }
        }

        class Joiner implements CompletionBiFunction<String, String, String> {
            public String apply(String left, String right) {
                return left.concat("_").concat(right);
            }
        }

        class OutcomeHandler implements CompletionBiFunction<String, Throwable, String> {
            public String apply(String value, Throwable failure) {
                if (failure == null) {
                    return value.concat("_handled");
                }
                if (failure instanceof ExecutionException) {
                    Throwable cause = ((ExecutionException) failure).getCause();
                    if (cause != null) {
                        return "handled_".concat(cause.getMessage());
                    }
                }
                return "handled_failure";
            }
        }

        class Observer implements CompletionBiConsumer<String, Throwable> {
            private StringBuilder sink;

            public Observer(StringBuilder sink) {
                this.sink = sink;
            }

            public void accept(String value, Throwable failure) {
                if (failure != null) {
                    this.sink.append("failed");
                    return;
                }
                this.sink.append(value);
            }
        }

        class Main {
            public static void main() {
                ScheduledThreadPerTaskExecutor scheduler =
                    Executors.newScheduledThreadPerTaskExecutor();
                ThreadPerTaskExecutor executor =
                    Executors.newThreadPerTaskExecutor();

                AtomicInt fixedRateCount = AtomicInt.create(0);
                Event fixedRateReached = Event.createManualReset(false);
                ScheduledFuture<Object> fixedRate =
                    scheduler.scheduleAtFixedRate(
                        new PeriodicCounter(fixedRateCount, fixedRateReached, 3, 0L),
                        10L,
                        20L
                    );

                AtomicInt fixedDelayCount = AtomicInt.create(0);
                Event fixedDelayReached = Event.createManualReset(false);
                ScheduledFuture<Object> fixedDelay =
                    scheduler.scheduleWithFixedDelay(
                        new PeriodicCounter(fixedDelayCount, fixedDelayReached, 2, 15L),
                        10L,
                        20L
                    );

                boolean fixedRateReady = fixedRateReached.waitOne(2000L);
                boolean fixedDelayReady = fixedDelayReached.waitOne(2000L);
                boolean fixedRateCancelled = fixedRate.cancel(false);
                boolean fixedDelayCancelled = fixedDelay.cancel(false);
                boolean fixedRateDone = fixedRate.await(2000L);
                boolean fixedDelayDone = fixedDelay.await(2000L);

                CompletableFuture<String> left =
                    CompletableFuture.completedFuture("left");
                CompletableFuture<String> right =
                    CompletableFuture.completedFuture("right");
                CompletableFuture<String> combined =
                    left.thenCombineAsync(right, new Joiner(), executor);
                StringBuilder observed = new StringBuilder();
                CompletableFuture<String> mirrored =
                    combined.whenCompleteAsync(new Observer(observed), executor);

                CompletableFuture<String> failed =
                    new CompletableFuture<String>();
                failed.completeExceptionally(
                    new IllegalStateException("boom")
                );
                CompletableFuture<String> handled =
                    failed.handleAsync(new OutcomeHandler(), executor);

                String combinedValue = combined.get();
                String mirroredValue = mirrored.get();
                String handledValue = handled.get();

                scheduler.shutdown();
                executor.shutdown();
                boolean schedulerDone = scheduler.awaitTermination(2000L);
                boolean executorDone = executor.awaitTermination(2000L);

                fixedRate.close();
                fixedDelay.close();
                left.close();
                right.close();
                combined.close();
                mirrored.close();
                failed.close();
                handled.close();
                scheduler.close();
                executor.close();

                if (fixedRateReady
                    && fixedDelayReady
                    && fixedRateCancelled
                    && fixedDelayCancelled
                    && fixedRateDone
                    && fixedDelayDone
                    && fixedRateCount.get() >= 3
                    && fixedDelayCount.get() >= 2
                    && "left_right".equals(combinedValue)
                    && "left_right".equals(mirroredValue)
                    && "left_right".equals(observed.toString())
                    && "handled_boom".equals(handledValue)
                    && schedulerDone
                    && executorDone) {
                    pulse.lang.IO.println("periodic_completion_stage_ok");
                    return;
                }

                pulse.lang.IO.println("periodic_completion_stage_broken");
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
        "expected periodic-completion-stage-floor build success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&build.stdout),
        String::from_utf8_lossy(&build.stderr)
    );

    let exe = root
        .join("build")
        .join("distro")
        .join("release")
        .join("periodic-completion-stage-floor-0.1.0.exe");
    let output = run_exe(&exe);
    let stdout = String::from_utf8_lossy(&output.stdout);
    let stderr = String::from_utf8_lossy(&output.stderr);
    assert!(
        output.status.success(),
        "expected periodic-completion-stage-floor exe success\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
    assert!(
        stdout.contains("periodic_completion_stage_ok"),
        "expected periodic-completion-stage-floor success output\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
}

#[test]
fn lock_pulse_feature_32_completion_stage_both_either_and_aggregate_baseline_executes() {
    let root = unique_temp_root();
    let src_root = root.join("src").join("main").join("pulse");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &root.join("pulsec.toml"),
        r#"
[package]
name = "completion-stage-breadth-floor"
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
        import pulse.concurrent.Callable;
        import pulse.concurrent.CompletableFuture;
        import pulse.concurrent.CompletionConsumer;
        import pulse.concurrent.CompletionFunction;
        import pulse.concurrent.Executors;
        import pulse.concurrent.ThreadPerTaskExecutor;
        import pulse.lang.Runnable;
        import pulse.lang.Thread;

        class SlowCallable implements Callable<String> {
            private String value;
            private long delayMillis;

            public SlowCallable(String value, long delayMillis) {
                this.value = value;
                this.delayMillis = delayMillis;
            }

            public String call() {
                Thread.sleep(this.delayMillis);
                return this.value;
            }
        }

        class JoinMapper implements CompletionFunction<String, String> {
            public String apply(String value) {
                return value.concat("_winner");
            }
        }

        class WinnerConsumer implements CompletionConsumer<String> {
            private StringBuilder sink;

            public WinnerConsumer(StringBuilder sink) {
                this.sink = sink;
            }

            public void accept(String value) {
                this.sink.append(value);
            }
        }

        class MarkerRunnable implements Runnable {
            private StringBuilder sink;
            private String marker;

            public MarkerRunnable(StringBuilder sink, String marker) {
                this.sink = sink;
                this.marker = marker;
            }

            public void run() {
                this.sink.append(this.marker);
            }
        }

        class Main {
            public static void main() {
                ThreadPerTaskExecutor executor =
                    Executors.newThreadPerTaskExecutor();

                CompletableFuture<String> left =
                    CompletableFuture.supplyAsync(new SlowCallable("left", 60L), executor);
                CompletableFuture<String> right =
                    CompletableFuture.supplyAsync(new SlowCallable("right", 10L), executor);

                StringBuilder afterBothSink = new StringBuilder();
                CompletableFuture<Object> afterBoth =
                    left.runAfterBothAsync(
                        right,
                        new MarkerRunnable(afterBothSink, "_both"),
                        executor
                    );

                CompletableFuture<String> eitherApplied =
                    left.applyToEitherAsync(right, new JoinMapper(), executor);

                StringBuilder eitherAcceptedSink = new StringBuilder();
                CompletableFuture<Object> eitherAccepted =
                    left.acceptEitherAsync(
                        right,
                        new WinnerConsumer(eitherAcceptedSink),
                        executor
                    );

                StringBuilder afterEitherSink = new StringBuilder();
                CompletableFuture<Object> afterEither =
                    left.runAfterEitherAsync(
                        right,
                        new MarkerRunnable(afterEitherSink, "_either"),
                        executor
                    );

                ArrayList<CompletableFuture> allInputs =
                    new ArrayList<CompletableFuture>();
                allInputs.add(
                    CompletableFuture.supplyAsync(
                        new SlowCallable("all_one", 20L),
                        executor
                    )
                );
                allInputs.add(
                    CompletableFuture.supplyAsync(
                        new SlowCallable("all_two", 30L),
                        executor
                    )
                );
                CompletableFuture<Object> all =
                    CompletableFuture.allOfAsync(allInputs, executor);

                ArrayList<CompletableFuture> anyInputs =
                    new ArrayList<CompletableFuture>();
                anyInputs.add(
                    CompletableFuture.supplyAsync(
                        new SlowCallable("slow_any", 60L),
                        executor
                    )
                );
                anyInputs.add(
                    CompletableFuture.supplyAsync(
                        new SlowCallable("fast_any", 10L),
                        executor
                    )
                );
                CompletableFuture<Object> any =
                    CompletableFuture.anyOfAsync(anyInputs, executor);

                afterBoth.get();
                String eitherAppliedValue = eitherApplied.get();
                eitherAccepted.get();
                afterEither.get();
                all.get();
                String anyValue = (String) any.get();

                executor.shutdown();
                boolean done = executor.awaitTermination(2000L);

                left.close();
                right.close();
                afterBoth.close();
                eitherApplied.close();
                eitherAccepted.close();
                afterEither.close();
                allInputs.get(0).close();
                allInputs.get(1).close();
                anyInputs.get(0).close();
                anyInputs.get(1).close();
                all.close();
                any.close();
                executor.close();

                if ("right_winner".equals(eitherAppliedValue)
                    && "right".equals(eitherAcceptedSink.toString())
                    && "_either".equals(afterEitherSink.toString())
                    && "_both".equals(afterBothSink.toString())
                    && "fast_any".equals(anyValue)
                    && done) {
                    pulse.lang.IO.println("completion_stage_breadth_ok");
                    return;
                }

                pulse.lang.IO.println("completion_stage_breadth_broken");
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
        "expected completion-stage-breadth-floor build success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&build.stdout),
        String::from_utf8_lossy(&build.stderr)
    );

    let exe = root
        .join("build")
        .join("distro")
        .join("release")
        .join("completion-stage-breadth-floor-0.1.0.exe");
    let output = run_exe(&exe);
    let stdout = String::from_utf8_lossy(&output.stdout);
    let stderr = String::from_utf8_lossy(&output.stderr);
    assert!(
        output.status.success(),
        "expected completion-stage-breadth-floor exe success\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
    assert!(
        stdout.contains("completion_stage_breadth_ok"),
        "expected completion-stage-breadth-floor success output\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
}

#[test]
fn lock_pulse_feature_33_fixed_and_single_thread_executor_baseline_executes() {
    let root = unique_temp_root();
    let src_root = root.join("src").join("main").join("pulse");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &root.join("pulsec.toml"),
        r#"
[package]
name = "fixed-single-executor-floor"
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

        import pulse.concurrent.AtomicInt;
        import pulse.concurrent.Callable;
        import pulse.concurrent.Executors;
        import pulse.concurrent.FixedThreadPoolExecutor;
        import pulse.concurrent.Future;
        import pulse.lang.Runnable;
        import pulse.lang.Thread;

        class WorkCallable implements Callable<String> {
            private AtomicInt counter;
            private String value;

            public WorkCallable(AtomicInt counter, String value) {
                this.counter = counter;
                this.value = value;
            }

            public String call() {
                int seen = this.counter.incrementAndGet();
                Thread.sleep(20L);
                return this.value.concat("_").concat(String.valueOf(seen));
            }
        }

        class AppendRunnable implements Runnable {
            private StringBuilder sink;
            private String value;

            public AppendRunnable(StringBuilder sink, String value) {
                this.sink = sink;
                this.value = value;
            }

            public void run() {
                this.sink.append(this.value);
            }
        }

        class Main {
            public static void main() {
                FixedThreadPoolExecutor fixed =
                    Executors.newFixedThreadPool(2);
                AtomicInt counter = AtomicInt.create(0);

                Future<String> first =
                    fixed.submit(new WorkCallable(counter, "a"));
                Future<String> second =
                    fixed.submit(new WorkCallable(counter, "b"));
                Future<String> third =
                    fixed.submit(new WorkCallable(counter, "c"));

                String one = first.get();
                String two = second.get();
                String three = third.get();

                fixed.shutdown();
                boolean fixedDone = fixed.awaitTermination(2000L);

                FixedThreadPoolExecutor single =
                    Executors.newSingleThreadExecutor();
                StringBuilder ordered = new StringBuilder();
                Future<Object> r1 = single.submit(new AppendRunnable(ordered, "x"));
                Future<Object> r2 = single.submit(new AppendRunnable(ordered, "y"));
                Future<Object> r3 = single.submit(new AppendRunnable(ordered, "z"));

                r1.get();
                r2.get();
                r3.get();

                single.shutdown();
                boolean singleDone = single.awaitTermination(2000L);

                first.close();
                second.close();
                third.close();
                r1.close();
                r2.close();
                r3.close();
                fixed.close();
                single.close();

                if (counter.get() == 3
                    && one.startsWith("a_")
                    && two.startsWith("b_")
                    && three.startsWith("c_")
                    && fixedDone
                    && singleDone
                    && "xyz".equals(ordered.toString())) {
                    pulse.lang.IO.println("fixed_single_executor_ok");
                    return;
                }

                pulse.lang.IO.println("fixed_single_executor_broken");
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
        "expected fixed-single-executor-floor build success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&build.stdout),
        String::from_utf8_lossy(&build.stderr)
    );

    let exe = root
        .join("build")
        .join("distro")
        .join("release")
        .join("fixed-single-executor-floor-0.1.0.exe");
    let output = run_exe(&exe);
    let stdout = String::from_utf8_lossy(&output.stdout);
    let stderr = String::from_utf8_lossy(&output.stderr);
    assert!(
        output.status.success(),
        "expected fixed-single-executor-floor exe success\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
    assert!(
        stdout.contains("fixed_single_executor_ok"),
        "expected fixed-single-executor-floor success output\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
}

#[test]
fn lock_pulse_feature_34_executor_bulk_submission_baseline_executes() {
    let root = unique_temp_root();
    let src_root = root.join("src").join("main").join("pulse");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &root.join("pulsec.toml"),
        r#"
[package]
name = "executor-bulk-submission-floor"
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
        import pulse.collections.List;
        import pulse.concurrent.Callable;
        import pulse.concurrent.Executors;
        import pulse.concurrent.FixedThreadPoolExecutor;
        import pulse.concurrent.Future;
        import pulse.lang.IllegalStateException;
        import pulse.lang.Thread;

        class DelayedCallable implements Callable<String> {
            private String value;
            private long delayMillis;
            private boolean fail;

            public DelayedCallable(String value, long delayMillis, boolean fail) {
                this.value = value;
                this.delayMillis = delayMillis;
                this.fail = fail;
            }

            public String call() {
                Thread.sleep(this.delayMillis);
                if (this.fail) {
                    throw new IllegalStateException(this.value);
                }
                return this.value;
            }
        }

        class Main {
            public static void main() {
                FixedThreadPoolExecutor executor =
                    Executors.newFixedThreadPool(3);

                ArrayList<Callable<String>> allTasks =
                    new ArrayList<Callable<String>>();
                allTasks.add(new DelayedCallable("one", 10L, false));
                allTasks.add(new DelayedCallable("two", 20L, false));
                allTasks.add(new DelayedCallable("three", 30L, false));

                List<Future<String>> futures = executor.invokeAll(allTasks);
                String joined =
                    futures.get(0).get()
                        .concat("_")
                        .concat(futures.get(1).get())
                        .concat("_")
                        .concat(futures.get(2).get());

                ArrayList<Callable<String>> anyTasks =
                    new ArrayList<Callable<String>>();
                anyTasks.add(new DelayedCallable("slow", 50L, false));
                anyTasks.add(new DelayedCallable("boom", 10L, true));
                anyTasks.add(new DelayedCallable("winner", 20L, false));

                String any = executor.invokeAny(anyTasks);

                executor.shutdown();
                boolean done = executor.awaitTermination(2000L);

                futures.get(0).close();
                futures.get(1).close();
                futures.get(2).close();
                executor.close();

                if ("one_two_three".equals(joined)
                    && "winner".equals(any)
                    && done) {
                    pulse.lang.IO.println("executor_bulk_submission_ok");
                    return;
                }

                pulse.lang.IO.println("executor_bulk_submission_broken");
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
        "expected executor-bulk-submission-floor build success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&build.stdout),
        String::from_utf8_lossy(&build.stderr)
    );

    let exe = root
        .join("build")
        .join("distro")
        .join("release")
        .join("executor-bulk-submission-floor-0.1.0.exe");
    let output = run_exe(&exe);
    let stdout = String::from_utf8_lossy(&output.stdout);
    let stderr = String::from_utf8_lossy(&output.stderr);
    assert!(
        output.status.success(),
        "expected executor-bulk-submission-floor exe success\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
    assert!(
        stdout.contains("executor_bulk_submission_ok"),
        "expected executor-bulk-submission-floor success output\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
}

#[test]
fn lock_pulse_feature_35_scheduled_thread_pool_baseline_executes_without_dedicated_timer_threads() {
    let root = unique_temp_root();
    let src_root = root.join("src").join("main").join("pulse");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &root.join("pulsec.toml"),
        r#"
[package]
name = "scheduled-thread-pool-floor"
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

        import pulse.concurrent.AtomicInt;
        import pulse.concurrent.AtomicReference;
        import pulse.concurrent.Callable;
        import pulse.concurrent.Executors;
        import pulse.concurrent.ScheduledFuture;
        import pulse.concurrent.ScheduledThreadPoolExecutor;
        import pulse.lang.Runnable;
        import pulse.lang.StringBuilder;

        class DelayedCallable implements Callable<String> {
            private String value;

            public DelayedCallable(String value) {
                this.value = value;
            }

            public String call() {
                return this.value;
            }
        }

        class CountingRunnable implements Runnable {
            private AtomicInt counter;
            private int target;
            private StringBuilder sink;
            private String token;
            private AtomicReference<ScheduledFuture<Object>> handle;

            public CountingRunnable(
                AtomicInt counter,
                int target,
                StringBuilder sink,
                String token,
                AtomicReference<ScheduledFuture<Object>> handle
            ) {
                this.counter = counter;
                this.target = target;
                this.sink = sink;
                this.token = token;
                this.handle = handle;
            }

            public void run() {
                int seen = this.counter.incrementAndGet();
                this.sink.append(this.token);
                if (seen >= this.target) {
                    this.handle.get().cancel(false);
                }
            }
        }

        class Main {
            public static void main() {
                ScheduledThreadPoolExecutor scheduler =
                    Executors.newScheduledThreadPool(2);

                ScheduledFuture<String> first =
                    scheduler.schedule(new DelayedCallable("first"), 40L);
                ScheduledFuture<String> second =
                    scheduler.schedule(new DelayedCallable("second"), 10L);

                AtomicInt fixedRateCount = AtomicInt.create(0);
                AtomicInt fixedDelayCount = AtomicInt.create(0);
                StringBuilder sink = new StringBuilder();

                AtomicReference<ScheduledFuture<Object>> fixedRateHandle =
                    AtomicReference.create(null);
                AtomicReference<ScheduledFuture<Object>> fixedDelayHandle =
                    AtomicReference.create(null);

                ScheduledFuture<Object> fixedRate =
                    scheduler.scheduleAtFixedRate(
                        new CountingRunnable(
                            fixedRateCount,
                            3,
                            sink,
                            "R",
                            fixedRateHandle
                        ),
                        5L,
                        15L
                    );
                fixedRateHandle.set(fixedRate);

                ScheduledFuture<Object> fixedDelay =
                    scheduler.scheduleWithFixedDelay(
                        new CountingRunnable(
                            fixedDelayCount,
                            2,
                            sink,
                            "D",
                            fixedDelayHandle
                        ),
                        5L,
                        20L
                    );
                fixedDelayHandle.set(fixedDelay);

                String firstValue = first.get();
                String secondValue = second.get();
                boolean fixedRateDone = fixedRate.await(2000L);
                boolean fixedDelayDone = fixedDelay.await(2000L);

                scheduler.shutdown();
                boolean schedulerDone = scheduler.awaitTermination(2000L);

                first.close();
                second.close();
                fixedRate.close();
                fixedDelay.close();
                fixedRateHandle.close();
                fixedDelayHandle.close();
                scheduler.close();

                if ("first".equals(firstValue)
                    && "second".equals(secondValue)
                    && fixedRateDone
                    && fixedDelayDone
                    && fixedRateCount.get() >= 3
                    && fixedDelayCount.get() >= 2
                    && sink.toString().contains("R")
                    && sink.toString().contains("D")
                    && schedulerDone) {
                    pulse.lang.IO.println("scheduled_thread_pool_ok");
                    return;
                }

                pulse.lang.IO.println("scheduled_thread_pool_broken");
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
        "expected scheduled-thread-pool-floor build success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&build.stdout),
        String::from_utf8_lossy(&build.stderr)
    );

    let exe = root
        .join("build")
        .join("distro")
        .join("release")
        .join("scheduled-thread-pool-floor-0.1.0.exe");
    let output = run_exe(&exe);
    let stdout = String::from_utf8_lossy(&output.stdout);
    let stderr = String::from_utf8_lossy(&output.stderr);
    assert!(
        output.status.success(),
        "expected scheduled-thread-pool-floor exe success\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
    assert!(
        stdout.contains("scheduled_thread_pool_ok"),
        "expected scheduled-thread-pool-floor success output\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
}

#[test]
fn lock_pulse_feature_36_fork_join_work_stealing_baseline_executes_recursive_tasks() {
    let root = unique_temp_root();
    let src_root = root.join("src").join("main").join("pulse");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &root.join("pulsec.toml"),
        r#"
[package]
name = "fork-join-floor"
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

        import pulse.concurrent.AtomicInt;
        import pulse.concurrent.Callable;
        import pulse.concurrent.Executors;
        import pulse.concurrent.ForkJoinPool;
        import pulse.concurrent.Future;
        import pulse.concurrent.RecursiveAction;
        import pulse.concurrent.RecursiveTask;
        import pulse.lang.Thread;

        class TokenTask extends RecursiveTask<String> {
            private ForkJoinPool pool;
            private String token;
            private int depth;

            public TokenTask(ForkJoinPool pool, String token, int depth) {
                this.pool = pool;
                this.token = token;
                this.depth = depth;
            }

            protected String compute() {
                if (this.depth <= 0) {
                    Thread.sleep(5L);
                    return this.token;
                }

                TokenTask left =
                    new TokenTask(this.pool, this.token.concat("L"), this.depth - 1);
                TokenTask right =
                    new TokenTask(this.pool, this.token.concat("R"), this.depth - 1);

                left.fork(this.pool);
                String rightValue = right.compute();
                String leftValue = left.join();
                left.close();

                return leftValue.concat("|").concat(rightValue);
            }
        }

        class LeafAction extends RecursiveAction {
            private ForkJoinPool pool;
            private AtomicInt counter;
            private int depth;

            public LeafAction(ForkJoinPool pool, AtomicInt counter, int depth) {
                this.pool = pool;
                this.counter = counter;
                this.depth = depth;
            }

            protected void computeAction() {
                if (this.depth <= 0) {
                    this.counter.incrementAndGet();
                    return;
                }

                LeafAction left =
                    new LeafAction(this.pool, this.counter, this.depth - 1);
                LeafAction right =
                    new LeafAction(this.pool, this.counter, this.depth - 1);

                left.fork(this.pool);
                right.computeAction();
                left.join();
                left.close();
            }
        }

        class SubmittedCallable implements Callable<String> {
            public String call() {
                return "submitted";
            }
        }

        class Main {
            public static void main() {
                ForkJoinPool pool = Executors.newWorkStealingPool(4);

                TokenTask root = new TokenTask(pool, "R", 3);
                String joined = pool.invoke(root);

                AtomicInt leaves = AtomicInt.create(0);
                LeafAction action = new LeafAction(pool, leaves, 4);
                pool.invoke(action);

                Future<String> submitted = pool.submit(new SubmittedCallable());
                String submittedValue = submitted.get();

                pool.shutdown();
                boolean done = pool.awaitTermination(2000L);

                root.close();
                action.close();
                submitted.close();
                pool.close();

                if (joined.contains("RLLL")
                    && joined.contains("RRRR")
                    && leaves.get() == 16
                    && "submitted".equals(submittedValue)
                    && done) {
                    pulse.lang.IO.println("fork_join_ok");
                    return;
                }

                pulse.lang.IO.println("fork_join_broken");
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
        "expected fork-join-floor build success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&build.stdout),
        String::from_utf8_lossy(&build.stderr)
    );

    let exe = root
        .join("build")
        .join("distro")
        .join("release")
        .join("fork-join-floor-0.1.0.exe");
    let output = run_exe(&exe);
    let stdout = String::from_utf8_lossy(&output.stdout);
    let stderr = String::from_utf8_lossy(&output.stderr);
    assert!(
        output.status.success(),
        "expected fork-join-floor exe success\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
    assert!(
        stdout.contains("fork_join_ok"),
        "expected fork-join-floor success output\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
}

#[test]
fn lock_pulse_feature_37_broader_concurrent_collection_family_executes() {
    let root = unique_temp_root();
    let src_root = root.join("src").join("main").join("pulse");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &root.join("pulsec.toml"),
        r#"
[package]
name = "broader-concurrent-collections-floor"
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

        import pulse.concurrent.ConcurrentHashSet;
        import pulse.concurrent.ConcurrentLinkedDeque;
        import pulse.concurrent.ConcurrentLinkedQueue;
        import pulse.lang.Iterator;
        import pulse.lang.Runnable;
        import pulse.lang.Thread;

        class CollectionWriter implements Runnable {
            private ConcurrentHashSet<String> set;
            private ConcurrentLinkedQueue<String> queue;
            private ConcurrentLinkedDeque<String> deque;

            public CollectionWriter(
                ConcurrentHashSet<String> set,
                ConcurrentLinkedQueue<String> queue,
                ConcurrentLinkedDeque<String> deque
            ) {
                this.set = set;
                this.queue = queue;
                this.deque = deque;
            }

            public void run() {
                this.set.add("worker");
                this.queue.offer("tail");
                this.deque.addFirst("front");
            }
        }

        class Main {
            public static void main() {
                ConcurrentHashSet<String> set =
                    new ConcurrentHashSet<String>();
                ConcurrentLinkedQueue<String> queue =
                    new ConcurrentLinkedQueue<String>();
                ConcurrentLinkedDeque<String> deque =
                    new ConcurrentLinkedDeque<String>();

                set.add("seed");
                queue.offer("head");
                deque.addLast("back");

                Thread writer = new Thread(
                    new CollectionWriter(set, queue, deque)
                );
                writer.start();
                writer.join(2000L);

                Iterator setSnapshot = set.iterator();
                set.add("after");
                int seen = 0;
                while (setSnapshot.hasNext()) {
                    setSnapshot.next();
                    seen = seen + 1;
                }

                String firstQueue = queue.poll();
                String secondQueue = queue.remove();
                String emptyQueue = queue.peek();

                String firstDeque = deque.removeFirst();
                String lastDeque = deque.removeLast();
                String emptyDeque = deque.peekFirst();

                if (seen != 2
                    || set.size() != 3
                    || !set.contains("seed")
                    || !set.contains("worker")
                    || !set.contains("after")
                    || !"head".equals(firstQueue)
                    || !"tail".equals(secondQueue)
                    || emptyQueue != null
                    || !"front".equals(firstDeque)
                    || !"back".equals(lastDeque)
                    || emptyDeque != null
                    || !queue.isEmpty()
                    || !deque.isEmpty()) {
                    System.exit(260);
                }

                pulse.lang.IO.println("broader_concurrent_collections_ok");
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
        "expected broader-concurrent-collections-floor build success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&build.stdout),
        String::from_utf8_lossy(&build.stderr)
    );

    let exe = root
        .join("build")
        .join("distro")
        .join("release")
        .join("broader-concurrent-collections-floor-0.1.0.exe");
    let output = run_exe(&exe);
    let stdout = String::from_utf8_lossy(&output.stdout);
    let stderr = String::from_utf8_lossy(&output.stderr);
    assert!(
        output.status.success(),
        "expected broader-concurrent-collections-floor exe success\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
    assert!(
        stdout.contains("broader_concurrent_collections_ok"),
        "expected broader-concurrent-collections-floor success output\nstdout:\n{}\nstderr:\n{}",
        stdout,
        stderr
    );
}
