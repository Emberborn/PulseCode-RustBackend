mod common;
// Target-neutral CLI, manifest, scaffold, and build-plan surface locks.

use std::{
    fs,
    path::{Path, PathBuf},
    sync::atomic::{AtomicU64, Ordering},
    time::{SystemTime, UNIX_EPOCH},
};

fn run_pulsec(args: &[&str]) -> std::process::Output {
    common::pulsec_command()
        .args(args)
        .output()
        .expect("run pulsec")
}

fn norm(bytes: &[u8]) -> String {
    String::from_utf8_lossy(bytes).replace('\r', "")
}

fn norm_slashes(value: &str) -> String {
    value.replace('\\', "/")
}

fn command_supports_backend_artifacts(output: &std::process::Output) -> bool {
    if output.status.success() {
        return true;
    }

    let stderr = norm(&output.stderr);
    if stderr.contains("Compile error: backend emit failed:")
        || stderr.contains("Failed to link shared runtime/app artifacts;")
    {
        return false;
    }

    panic!(
        "command failed\nstdout:\n{}\nstderr:\n{}",
        norm(&output.stdout),
        stderr
    );
}

fn assert_no_ansi(text: &str) {
    assert!(
        !text.contains("\u{1b}["),
        "output must remain colorless/ansi-free\n{}",
        text
    );
}

fn unique_temp_root() -> PathBuf {
    static NEXT_ID: AtomicU64 = AtomicU64::new(1);
    let nanos = SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .expect("system time")
        .as_nanos();
    let id = NEXT_ID.fetch_add(1, Ordering::Relaxed);
    let root = std::env::temp_dir().join(format!(
        "pulsec_stage_lock_d_{}_{}_{}",
        std::process::id(),
        nanos,
        id
    ));
    fs::create_dir_all(&root).expect("create temp root");
    root
}

fn read(path: &Path) -> String {
    fs::read_to_string(path).expect("read text file")
}

#[test]
fn lock_d1_01_help_contract_lists_commands_and_exit_policy() {
    let output = run_pulsec(&["help"]);
    assert!(output.status.success(), "help should succeed");
    let stdout = norm(&output.stdout);
    assert!(stdout.contains("PulseCode CLI"));
    assert!(stdout.contains("new"));
    assert!(stdout.contains("check"));
    assert!(stdout.contains("build"));
    assert!(stdout.contains("test"));
    assert!(stdout.contains("help"));
    assert!(stdout.contains("version"));
    assert!(stdout.contains("0 success"));
    assert!(stdout.contains("1 command failed"));
    assert!(stdout.contains("2 command/argument usage error"));
    assert!(stdout.contains("3 command not implemented"));
    assert_no_ansi(&stdout);
}

#[test]
fn lock_d1_01_version_contract_is_stable() {
    let output = run_pulsec(&["version"]);
    assert!(output.status.success(), "version should succeed");
    let stdout = norm(&output.stdout);
    assert_eq!(stdout, "pulsec 0.1.0\n");
}

#[test]
fn lock_d1_01_missing_command_is_usage_error() {
    let output = run_pulsec(&[]);
    assert_eq!(output.status.code(), Some(2));
    let stderr = norm(&output.stderr);
    assert!(stderr.contains("error[PULSEC:E_USAGE]: missing command"));
    assert!(stderr.contains("diag.code=PULSEC:E_USAGE"));
    assert!(stderr.contains("hint: run 'pulsec help' to see available commands"));
    assert!(stderr.contains("Usage:"));
    assert!(stderr.contains("pulsec <command> [arguments] [flags]"));
    assert_no_ansi(&stderr);
}

#[test]
fn lock_d1_01_unknown_command_is_usage_error() {
    let output = run_pulsec(&["compile"]);
    assert_eq!(output.status.code(), Some(2));
    let stderr = norm(&output.stderr);
    assert!(stderr.contains("error[PULSEC:E_USAGE]: Unknown command 'compile'"));
    assert!(stderr.contains("diag.code=PULSEC:E_USAGE"));
    assert!(stderr.contains("Unknown command 'compile'"));
    assert!(stderr.contains("Use 'pulsec <command> --help'"));
    assert_no_ansi(&stderr);
}

#[test]
fn lock_d1_01_command_specific_help_contract_is_stable() {
    let check = run_pulsec(&["check", "--help"]);
    assert!(check.status.success());
    assert_eq!(
        norm(&check.stdout),
        "Usage: pulsec check [<entry.pulse>] [--project-root <dir>] [--source-root <dir>] [--strict-package|--friendly]\n"
    );

    let build = run_pulsec(&["build", "--help"]);
    assert!(build.status.success());
    assert_eq!(
        norm(&build.stdout),
        "Usage: pulsec build [<entry.pulse>] [--project-root <dir>] [--source-root <dir>] [--profile <debug|release>] [--target <windows-x64|pulseos-x64|linux-x64|macos-arm64>] [--output-mode <fat|shared>] [--runtime-debug-allocator <on|off>] [--runtime-cycle-collector <on|off>] [--out-dir <dir>] [--linker <path>] [--assembler <path>]\n"
    );

    let test = run_pulsec(&["test", "--help"]);
    assert!(test.status.success());
    assert_eq!(
        norm(&test.stdout),
        "Usage: pulsec test [--project-root <dir>] [--source-root <dir>] [--strict-package|--friendly]\n"
    );

    let package = run_pulsec(&["package", "--help"]);
    assert_eq!(package.status.code(), Some(2));
    let package_stderr = norm(&package.stderr);
    assert!(package_stderr.contains("Unknown command 'package'"));
}

#[test]
fn lock_d1_02_new_app_scaffold_is_deterministic_and_buildable() {
    let root = unique_temp_root();
    let project_name = "hello_app";
    let output = run_pulsec(&[
        "new",
        project_name,
        "--template",
        "app",
        "--path",
        root.to_str().expect("root utf8"),
    ]);
    assert!(
        output.status.success(),
        "new app should succeed\nstdout:\n{}\nstderr:\n{}",
        norm(&output.stdout),
        norm(&output.stderr)
    );

    let project = root.join(project_name);
    let manifest = project.join("pulsec.toml");
    let entry = project
        .join("src")
        .join("main")
        .join("pulse")
        .join("app")
        .join("main")
        .join("Main.pulse");
    let tests_keep = project
        .join("src")
        .join("test")
        .join("pulse")
        .join(".gitkeep");
    assert!(
        manifest.exists(),
        "missing manifest '{}'",
        manifest.display()
    );
    assert!(entry.exists(), "missing entry '{}'", entry.display());
    assert!(tests_keep.exists(), "missing tests placeholder");

    let manifest_text = read(&manifest).replace('\r', "");
    assert!(manifest_text.contains("[package]\nname = \"hello_app\""));
    assert!(manifest_text.contains("main_pulse = \"src/main/pulse\""));
    assert!(manifest_text.contains("entry = \"app/main/Main.pulse\""));
    assert!(manifest_text.contains("target = \"windows-x64\""));
    assert!(manifest_text.contains("output_mode = \"fat\""));
    assert!(manifest_text.contains("output_entry = \"main\""));
    assert_eq!(
        read(&entry).replace('\r', ""),
        "package app.main;\nimport pulse.lang.IO;\n\nclass Main {\n    public static void main() {\n        IO.println(\"hello_app online\");\n    }\n}\n"
    );

    let check = run_pulsec(&[
        "check",
        entry.to_str().expect("entry utf8"),
        "--source-root",
        project
            .join("src")
            .join("main")
            .join("pulse")
            .to_str()
            .expect("src utf8"),
        "--strict-package",
    ]);
    assert!(
        check.status.success(),
        "scaffolded app check failed\nstdout:\n{}\nstderr:\n{}",
        norm(&check.stdout),
        norm(&check.stderr)
    );

    let build = run_pulsec(&[
        "build",
        entry.to_str().expect("entry utf8"),
        "--source-root",
        project
            .join("src")
            .join("main")
            .join("pulse")
            .to_str()
            .expect("src utf8"),
        "--strict-package",
    ]);
    assert!(
        build.status.success(),
        "scaffolded app build failed\nstdout:\n{}\nstderr:\n{}",
        norm(&build.stdout),
        norm(&build.stderr)
    );
}

#[test]
fn lock_d1_02_new_lib_scaffold_is_deterministic_and_checkable() {
    let root = unique_temp_root();
    let project_name = "core_lib";
    let output = run_pulsec(&[
        "new",
        project_name,
        "--template",
        "lib",
        "--path",
        root.to_str().expect("root utf8"),
    ]);
    assert!(
        output.status.success(),
        "new lib should succeed\nstdout:\n{}\nstderr:\n{}",
        norm(&output.stdout),
        norm(&output.stderr)
    );

    let project = root.join(project_name);
    let manifest = project.join("pulsec.toml");
    let entry = project
        .join("src")
        .join("main")
        .join("pulse")
        .join("lib")
        .join("core")
        .join("Main.pulse");
    let library = project
        .join("src")
        .join("main")
        .join("pulse")
        .join("lib")
        .join("core")
        .join("Library.pulse");
    assert!(
        manifest.exists(),
        "missing manifest '{}'",
        manifest.display()
    );
    assert!(entry.exists(), "missing entry '{}'", entry.display());
    assert!(library.exists(), "missing library '{}'", library.display());

    let manifest_text = read(&manifest).replace('\r', "");
    assert!(manifest_text.contains("[package]\nname = \"core_lib\""));
    assert!(manifest_text.contains("entry = \"lib/core/Main.pulse\""));
    assert!(manifest_text.contains("target = \"windows-x64\""));
    assert_eq!(
        read(&entry).replace('\r', ""),
        "package lib.core;\nimport pulse.lang.IO;\n\nclass Main {\n    public static void main() {\n        IO.println(Library.versionCode());\n    }\n}\n"
    );
    assert_eq!(
        read(&library).replace('\r', ""),
        "package lib.core;\n\nclass Library {\n    public static int versionCode() {\n        return 1;\n    }\n}\n"
    );

    let check = run_pulsec(&[
        "check",
        entry.to_str().expect("entry utf8"),
        "--source-root",
        project
            .join("src")
            .join("main")
            .join("pulse")
            .to_str()
            .expect("src utf8"),
        "--strict-package",
    ]);
    assert!(
        check.status.success(),
        "scaffolded lib check failed\nstdout:\n{}\nstderr:\n{}",
        norm(&check.stdout),
        norm(&check.stderr)
    );
}

#[test]
fn lock_d1_02_new_rejects_existing_target_dir() {
    let root = unique_temp_root();
    let project_name = "already_there";
    let project = root.join(project_name);
    fs::create_dir_all(&project).expect("create existing dir");

    let output = run_pulsec(&[
        "new",
        project_name,
        "--path",
        root.to_str().expect("root utf8"),
    ]);
    assert_eq!(output.status.code(), Some(1));
    let stderr = norm(&output.stderr);
    assert!(stderr.contains("Scaffold error:"));
    assert!(stderr.contains("already exists"));
}

#[test]
fn lock_d1_03_check_manifest_project_mode_resolves_entry_and_source_root() {
    let root = unique_temp_root();
    let project_name = "manifest_check";
    let new_output = run_pulsec(&[
        "new",
        project_name,
        "--template",
        "app",
        "--path",
        root.to_str().expect("root utf8"),
    ]);
    assert!(new_output.status.success(), "scaffold should succeed");
    let project = root.join(project_name);

    let check = run_pulsec(&["check", "--project-root", project.to_str().expect("utf8")]);
    assert!(
        check.status.success(),
        "project-mode check should succeed\nstdout:\n{}\nstderr:\n{}",
        norm(&check.stdout),
        norm(&check.stderr)
    );
    let stdout = norm(&check.stdout);
    assert!(stdout.contains("OK:"));
    assert!(stdout.contains("Check summary: mode=friendly project_mode=manifest"));
    assert!(stdout.contains("entry="));
    assert!(stdout.contains("source_root="));
}

#[test]
fn lock_d1_03_check_strict_and_friendly_modes_are_deterministic() {
    let root = unique_temp_root();
    let project = root.join("mode_demo");
    let src = project.join("src");
    fs::create_dir_all(src.join("app").join("bad")).expect("create dirs");
    fs::write(
        project.join("pulsec.toml"),
        "[package]\nname = \"mode_demo\"\nversion = \"0.1.0\"\n\n[sources]\nroot = \"src\"\nentry = \"app/bad/Main.pulse\"\n",
    )
    .expect("write manifest");
    fs::write(
        src.join("app").join("bad").join("Main.pulse"),
        "package app.main;\nclass Main {\n    public static void main() {\n    }\n}\n",
    )
    .expect("write source");

    let friendly = run_pulsec(&[
        "check",
        "--project-root",
        project.to_str().expect("utf8"),
        "--friendly",
    ]);
    assert!(
        friendly.status.success(),
        "friendly mode should allow package-layout warning\nstdout:\n{}\nstderr:\n{}",
        norm(&friendly.stdout),
        norm(&friendly.stderr)
    );
    assert!(norm(&friendly.stdout).contains("Check summary: mode=friendly"));

    let strict = run_pulsec(&[
        "check",
        "--project-root",
        project.to_str().expect("utf8"),
        "--strict-package",
    ]);
    assert_eq!(strict.status.code(), Some(1));
    let stderr = norm(&strict.stderr);
    assert!(stderr.contains("Check FAILED: mode=strict"));
    assert!(stderr.contains("Package layout error"));
}

#[test]
fn lock_d1_03_check_failure_summary_includes_context() {
    let root = unique_temp_root();
    let project = root.join("failure_demo");
    let src = project.join("src");
    fs::create_dir_all(src.join("app").join("main")).expect("create dirs");
    fs::write(
        project.join("pulsec.toml"),
        "[package]\nname = \"failure_demo\"\nversion = \"0.1.0\"\n\n[sources]\nroot = \"src\"\nentry = \"app/main/Main.pulse\"\n",
    )
    .expect("write manifest");
    fs::write(
        src.join("app").join("main").join("Main.pulse"),
        "package app.main;\nimport app.missing.Util;\nclass Main {\n    public static void main() {\n    }\n}\n",
    )
    .expect("write source");

    let output = run_pulsec(&["check", "--project-root", project.to_str().expect("utf8")]);
    assert_eq!(output.status.code(), Some(1));
    let stderr = norm(&output.stderr);
    assert!(stderr.contains("Check FAILED: mode=friendly"));
    assert!(stderr.contains("error[PULSEC:E_CHECK_FAILED]: Compile error:"));
    assert!(stderr.contains("diag.code=PULSEC:E_CHECK_FAILED"));
    assert!(stderr.contains("hint: re-run with '--friendly'"));
    assert!(stderr.contains("Compile error: Import 'app.missing.Util'"));
    assert_no_ansi(&stderr);
}

#[test]
fn lock_d1_04_build_manifest_project_mode_defaults_to_release_profile() {
    let root = unique_temp_root();
    let project_name = "build_manifest";
    let new_output = run_pulsec(&[
        "new",
        project_name,
        "--template",
        "app",
        "--path",
        root.to_str().expect("root utf8"),
    ]);
    assert!(new_output.status.success(), "scaffold should succeed");
    let project = root.join(project_name);

    let build = run_pulsec(&["build", "--project-root", project.to_str().expect("utf8")]);
    assert!(
        build.status.success(),
        "manifest-mode build should succeed\nstdout:\n{}\nstderr:\n{}",
        norm(&build.stdout),
        norm(&build.stderr)
    );
    let stdout = norm(&build.stdout);
    let stdout_paths = norm_slashes(&stdout);
    assert!(stdout.contains("Build mode: profile=release"));
    assert!(stdout.contains("project_mode=manifest"));
    assert!(stdout.contains("output_dir="));
    assert!(stdout_paths.contains("/build/distro/release"));
    assert!(stdout.contains("Native plan:"));
}

#[test]
fn lock_d1_04_build_manifest_profile_and_cli_out_dir_are_honored() {
    let root = unique_temp_root();
    let project_name = "build_profiles";
    let new_output = run_pulsec(&[
        "new",
        project_name,
        "--template",
        "app",
        "--path",
        root.to_str().expect("root utf8"),
    ]);
    assert!(new_output.status.success(), "scaffold should succeed");
    let project = root.join(project_name);
    let manifest_path = project.join("pulsec.toml");
    let mut manifest = read(&manifest_path);
    manifest = manifest.replace(
        "[build]\nprofile = \"release\"",
        "[build]\nprofile = \"release\"\nout_dir = \"artifact_out\"",
    );
    fs::write(&manifest_path, manifest).expect("rewrite manifest");

    let manifest_release =
        run_pulsec(&["build", "--project-root", project.to_str().expect("utf8")]);
    assert!(
        manifest_release.status.success(),
        "release profile build should succeed\nstdout:\n{}\nstderr:\n{}",
        norm(&manifest_release.stdout),
        norm(&manifest_release.stderr)
    );
    let release_stdout = norm(&manifest_release.stdout);
    let release_stdout_paths = norm_slashes(&release_stdout);
    assert!(release_stdout.contains("Build mode: profile=release"));
    assert!(release_stdout.contains("project_mode=manifest"));
    assert!(release_stdout_paths.contains("/artifact_out"));

    let cli_override = run_pulsec(&[
        "build",
        "--project-root",
        project.to_str().expect("utf8"),
        "--profile",
        "debug",
        "--out-dir",
        "cli_out",
    ]);
    assert!(
        cli_override.status.success(),
        "cli override build should succeed\nstdout:\n{}\nstderr:\n{}",
        norm(&cli_override.stdout),
        norm(&cli_override.stderr)
    );
    let override_stdout = norm(&cli_override.stdout);
    let override_stdout_paths = norm_slashes(&override_stdout);
    assert!(override_stdout.contains("Build mode: profile=debug"));
    assert!(override_stdout.contains("project_mode=manifest"));
    assert!(override_stdout_paths.contains("/cli_out"));
}

#[test]
fn lock_d1_04_build_direct_mode_default_profile_and_status_summary_are_stable() {
    let root = unique_temp_root();
    let src = root.join("src");
    fs::create_dir_all(src.join("app").join("main")).expect("create dirs");
    let entry = src.join("app").join("main").join("Main.pulse");
    fs::write(
        &entry,
        "package app.main;\nimport pulse.lang.IO;\nclass Main {\n    public static void main() {\n        IO.println(\"direct_mode_ok\");\n    }\n}\n",
    )
    .expect("write source");

    let output = run_pulsec(&[
        "build",
        entry.to_str().expect("entry utf8"),
        "--source-root",
        src.to_str().expect("src utf8"),
        "--strict-package",
    ]);
    assert!(
        output.status.success(),
        "direct build should succeed\nstdout:\n{}\nstderr:\n{}",
        norm(&output.stdout),
        norm(&output.stderr)
    );

    let stdout = norm(&output.stdout);
    let stdout_paths = norm_slashes(&stdout);
    assert!(stdout.contains("Build mode: profile=release"));
    assert!(stdout.contains("project_mode=direct"));
    assert!(stdout.contains("source_root="));
    assert!(stdout.contains("output_dir="));
    assert!(stdout_paths.contains("/build"));
    assert!(!stdout_paths.contains("/build/debug"));
    assert!(stdout.contains("Build IR ready:"));
    assert!(stdout.contains("IR artifact:"));
    assert!(stdout.contains("Native plan:"));
    assert!(stdout.contains("Object scaffold:"));
    assert!(stdout.contains("Link report:"));
    assert!(stdout.contains("Entry codegen:"));
    assert!(stdout.contains("Executable:"));
}

#[test]
fn lock_d1_04_build_direct_mode_release_profile_routes_to_profile_output_dir() {
    let root = unique_temp_root();
    let src = root.join("src");
    fs::create_dir_all(src.join("app").join("main")).expect("create dirs");
    let entry = src.join("app").join("main").join("Main.pulse");
    fs::write(
        &entry,
        "package app.main;\nclass Main {\n    public static void main() {\n    }\n}\n",
    )
    .expect("write source");

    let output = run_pulsec(&[
        "build",
        entry.to_str().expect("entry utf8"),
        "--source-root",
        src.to_str().expect("src utf8"),
        "--strict-package",
        "--profile",
        "release",
    ]);
    assert!(
        output.status.success(),
        "release profile build should succeed\nstdout:\n{}\nstderr:\n{}",
        norm(&output.stdout),
        norm(&output.stderr)
    );
    let stdout = norm(&output.stdout);
    let stdout_paths = norm_slashes(&stdout);
    assert!(stdout.contains("Build mode: profile=release"));
    assert!(stdout.contains("project_mode=direct"));
    assert!(stdout.contains("output_dir="));
    assert!(stdout_paths.contains("/build/distro/release"));
}

#[test]
fn lock_d1_05_test_discovers_and_reports_passing_project_tests() {
    let root = unique_temp_root();
    let project_name = "test_cmd_pass";
    let new_output = run_pulsec(&[
        "new",
        project_name,
        "--template",
        "app",
        "--path",
        root.to_str().expect("root utf8"),
    ]);
    assert!(new_output.status.success(), "scaffold should succeed");
    let project = root.join(project_name);
    let test_dir = project
        .join("src")
        .join("test")
        .join("pulse")
        .join("app")
        .join("tests");
    fs::create_dir_all(&test_dir).expect("create test dir");
    fs::write(
        test_dir.join("SmokeTest.pulse"),
        "package app.tests;\nimport pulse.lang.IO;\nclass SmokeTest {\n    public static void main() {\n        IO.println(\"ok\");\n    }\n}\n",
    )
    .expect("write test source");

    let output = run_pulsec(&["test", "--project-root", project.to_str().expect("utf8")]);
    assert!(
        output.status.success(),
        "test command should succeed\nstdout:\n{}\nstderr:\n{}",
        norm(&output.stdout),
        norm(&output.stderr)
    );
    let stdout = norm(&output.stdout);
    assert!(stdout.contains("Test discovery: project_mode=manifest"));
    assert!(stdout.contains("[PASS] app\\tests\\SmokeTest.pulse"));
    assert!(stdout.contains("Test summary: mode=friendly passed=1 failed=0 total=1"));
}

#[test]
fn lock_d1_05_test_reports_failures_and_exits_non_zero() {
    let root = unique_temp_root();
    let project_name = "test_cmd_fail";
    let new_output = run_pulsec(&[
        "new",
        project_name,
        "--template",
        "app",
        "--path",
        root.to_str().expect("root utf8"),
    ]);
    assert!(new_output.status.success(), "scaffold should succeed");
    let project = root.join(project_name);
    let test_dir = project
        .join("src")
        .join("test")
        .join("pulse")
        .join("app")
        .join("tests");
    fs::create_dir_all(&test_dir).expect("create test dir");
    fs::write(
        test_dir.join("BrokenTest.pulse"),
        "package app.tests;\nimport app.missing.Util;\nclass BrokenTest {\n    public static void main() {\n    }\n}\n",
    )
    .expect("write broken test source");

    let output = run_pulsec(&["test", "--project-root", project.to_str().expect("utf8")]);
    assert_eq!(output.status.code(), Some(1));
    let stdout = norm(&output.stdout);
    let stderr = norm(&output.stderr);
    assert!(stdout.contains("Test discovery: project_mode=manifest"));
    assert!(stdout.contains("Test summary: mode=friendly passed=0 failed=1 total=1"));
    assert!(stderr.contains("[FAIL] app\\tests\\BrokenTest.pulse :: Import 'app.missing.Util'"));
}

#[test]
fn lock_d1_05_test_no_files_is_deterministic_failure() {
    let root = unique_temp_root();
    let project_name = "test_cmd_empty";
    let new_output = run_pulsec(&[
        "new",
        project_name,
        "--template",
        "app",
        "--path",
        root.to_str().expect("root utf8"),
    ]);
    assert!(new_output.status.success(), "scaffold should succeed");
    let project = root.join(project_name);
    fs::remove_file(
        project
            .join("src")
            .join("test")
            .join("pulse")
            .join(".gitkeep"),
    )
    .expect("remove gitkeep");

    let output = run_pulsec(&["test", "--project-root", project.to_str().expect("utf8")]);
    assert_eq!(output.status.code(), Some(1));
    let stderr = norm(&output.stderr);
    assert!(stderr.contains("error[PULSEC:E_TEST_FAILED]:"));
    assert!(stderr.contains("diag.code=PULSEC:E_TEST_FAILED"));
    assert!(stderr.contains("hint: add .pulse files under tests/"));
    assert!(stderr.contains("Test discovery failed: no .pulse tests found under"));
    assert_no_ansi(&stderr);
}

#[test]
fn lock_d3_05_build_emits_stamped_artifact_bundle() {
    let root = unique_temp_root();
    let project_name = "artifact_stamp_app";
    let new_output = run_pulsec(&[
        "new",
        project_name,
        "--template",
        "app",
        "--path",
        root.to_str().expect("root utf8"),
    ]);
    assert!(new_output.status.success(), "scaffold should succeed");
    let project = root.join(project_name);

    let output = run_pulsec(&["build", "--project-root", project.to_str().expect("utf8")]);
    assert!(
        output.status.success(),
        "build should succeed\nstdout:\n{}\nstderr:\n{}",
        norm(&output.stdout),
        norm(&output.stderr)
    );
    let stdout = norm(&output.stdout);
    assert!(stdout.contains("Artifact stamp: artifact_stamp_app-0.1.0-release"));

    let artifacts = project.join("build").join("distro").join("release");
    assert!(artifacts.join("artifact_stamp_app-0.1.0.exe").exists());
    assert!(!artifacts
        .join("artifact_stamp_app-0.1.0-pulsec.ir.txt")
        .exists());
    assert!(!artifacts
        .join("artifact_stamp_app-0.1.0-native.plan.json")
        .exists());
    assert!(!artifacts
        .join("artifact_stamp_app-0.1.0-native.link.txt")
        .exists());
    assert!(!artifacts
        .join("artifact_stamp_app-0.1.0-build.config.plan.json")
        .exists());
    assert!(!artifacts.join("stamp.txt").exists());
}

#[test]
fn lock_d1_07_diagnostic_envelope_is_machine_readable_and_actionable() {
    let output = run_pulsec(&["check"]);
    assert_eq!(output.status.code(), Some(2));
    let stderr = norm(&output.stderr);
    assert!(stderr.contains("error[PULSEC:E_USAGE]:"));
    assert!(stderr.contains("diag.code=PULSEC:E_USAGE"));
    assert!(stderr.contains("hint: provide <entry.pulse> or set [sources].entry in pulsec.toml"));
    assert_no_ansi(&stderr);
}

#[test]
fn lock_d1_07_diagnostics_remain_colorless_across_failure_paths() {
    let root = unique_temp_root();
    let project_name = "diag_colorless";
    let new_output = run_pulsec(&[
        "new",
        project_name,
        "--template",
        "app",
        "--path",
        root.to_str().expect("root utf8"),
    ]);
    assert!(new_output.status.success(), "scaffold should succeed");
    let project = root.join(project_name);
    let broken_test = project
        .join("src")
        .join("test")
        .join("pulse")
        .join("app")
        .join("tests")
        .join("Broken.pulse");
    fs::create_dir_all(broken_test.parent().expect("test parent")).expect("mkdir");
    fs::write(
        &broken_test,
        "package app.tests;\nimport app.missing.Util;\nclass Broken { public static void main() {} }\n",
    )
    .expect("write broken test");
    let output = run_pulsec(&["test", "--project-root", project.to_str().expect("utf8")]);
    assert_eq!(output.status.code(), Some(1));
    let stderr = norm(&output.stderr);
    assert!(stderr.contains("error[PULSEC:E_TEST_FAILED]: one or more tests failed"));
    assert!(stderr.contains("diag.code=PULSEC:E_TEST_FAILED"));
    assert!(stderr.contains("hint: review [FAIL] diagnostics above and re-run the test command"));
    assert_no_ansi(&stderr);
}

#[test]
fn lock_d2_01_manifest_v1_schema_accepts_documented_sections() {
    let root = unique_temp_root();
    let project = root.join("manifest_v1_ok");
    fs::create_dir_all(
        project
            .join("src")
            .join("main")
            .join("pulse")
            .join("app")
            .join("main"),
    )
    .expect("create src");
    fs::write(
        project.join("pulsec.toml"),
        "[package]\nname = \"manifest_v1_ok\"\nversion = \"1.0.0\"\n\n[authorlib]\nenabled = true\n\n[sources]\nmain_pulse = \"src/main/pulse\"\nmain_resources = \"src/main/resources\"\ntest_pulse = \"src/test/pulse\"\ntest_resources = \"src/test/resources\"\napi_pulse = \"src/api/pulse\"\napi_resources = \"src/api/resources\"\ndocs = \"docs\"\nlibraries = \"libraries\"\nentry = \"app/main/Main.pulse\"\n\n[build]\nprofile = \"debug\"\nout_dir = \"build/distro/debug\"\nasm_dir = \"build/asm\"\ngenerated_dir = \"build/generated\"\nassets_dir = \"build/assets\"\nsanity_dir = \"build/sanity\"\ntmp_dir = \"build/tmp\"\ndistro_dir = \"build/distro\"\n\n[toolchain]\nlinker = \"C:/toolchain/link.exe\"\nassembler = \"C:/toolchain/ml64.exe\"\n",
    )
    .expect("write manifest");
    fs::write(
        project
            .join("src")
            .join("main")
            .join("pulse")
            .join("app")
            .join("main")
            .join("Main.pulse"),
        "package app.main;\nclass Main { public static void main() {} }\n",
    )
    .expect("write source");
    let output = run_pulsec(&["check", "--project-root", project.to_str().expect("utf8")]);
    assert!(
        output.status.success(),
        "manifest v1 project should pass check\nstdout:\n{}\nstderr:\n{}",
        norm(&output.stdout),
        norm(&output.stderr)
    );
}

#[test]
fn lock_d2_01_manifest_v1_rejects_unknown_sections_and_keys() {
    let root = unique_temp_root();
    let project = root.join("manifest_v1_bad_schema");
    fs::create_dir_all(
        project
            .join("src")
            .join("main")
            .join("pulse")
            .join("app")
            .join("main"),
    )
    .expect("create src");
    fs::write(
        project
            .join("src")
            .join("main")
            .join("pulse")
            .join("app")
            .join("main")
            .join("Main.pulse"),
        "package app.main;\nclass Main { public static void main() {} }\n",
    )
    .expect("write source");
    fs::write(
        project.join("pulsec.toml"),
        "[package]\nname = \"manifest_v1_bad_schema\"\nversion = \"1.0.0\"\nedition = \"2026\"\n\n[sources]\nmain_pulse = \"src/main/pulse\"\nentry = \"app/main/Main.pulse\"\n\n[workspace_bad]\nmembers = \"app\"\n",
    )
    .expect("write bad manifest");
    let output = run_pulsec(&["check", "--project-root", project.to_str().expect("utf8")]);
    assert_eq!(output.status.code(), Some(2));
    let stderr = norm(&output.stderr);
    assert!(stderr.contains("error[PULSEC:E_USAGE]:"));
    assert!(
        stderr.contains("unknown key 'edition' in [package]")
            || stderr.contains("unknown section '[workspace_bad]'")
    );
}

#[test]
fn lock_d2_01_manifest_v1_rejects_missing_package_name_or_version() {
    let root = unique_temp_root();
    let project = root.join("manifest_v1_missing_required");
    fs::create_dir_all(
        project
            .join("src")
            .join("main")
            .join("pulse")
            .join("app")
            .join("main"),
    )
    .expect("create src");
    fs::write(
        project
            .join("src")
            .join("main")
            .join("pulse")
            .join("app")
            .join("main")
            .join("Main.pulse"),
        "package app.main;\nclass Main { public static void main() {} }\n",
    )
    .expect("write source");
    fs::write(
        project.join("pulsec.toml"),
        "[package]\nname = \"\"\n\n[sources]\nmain_pulse = \"src/main/pulse\"\nentry = \"app/main/Main.pulse\"\n",
    )
    .expect("write invalid manifest");
    let output = run_pulsec(&["check", "--project-root", project.to_str().expect("utf8")]);
    assert_eq!(output.status.code(), Some(2));
    let stderr = norm(&output.stderr);
    assert!(stderr.contains("Manifest validation error"));
    assert!(stderr.contains("[package].name") || stderr.contains("[package].version"));
    assert!(stderr.contains("diag.code=PULSEC:E_USAGE"));
}

#[test]
fn lock_d2_01_authorlib_opt_in_enables_author_imports() {
    let root = unique_temp_root();
    let project = root.join("authorlib_enabled_ok");
    fs::create_dir_all(
        project
            .join("src")
            .join("main")
            .join("pulse")
            .join("app")
            .join("main"),
    )
    .expect("create src");
    fs::write(
        project.join("pulsec.toml"),
        "[package]\nname = \"authorlib_enabled_ok\"\nversion = \"1.0.0\"\n\n[authorlib]\nenabled = true\n\n[sources]\nmain_pulse = \"src/main/pulse\"\nentry = \"app/main/Main.pulse\"\n",
    )
    .expect("write manifest");
    fs::write(
        project
            .join("src")
            .join("main")
            .join("pulse")
            .join("app")
            .join("main")
            .join("Main.pulse"),
        "package app.main;\nimport author.project.ProjectLayout;\nclass Main { public static void main() { ProjectLayout layout = ProjectLayout.defaults(\".\"); } }\n",
    )
    .expect("write source");
    let output = run_pulsec(&["check", "--project-root", project.to_str().expect("utf8")]);
    assert!(
        output.status.success(),
        "authorlib-enabled project should pass check\nstdout:\n{}\nstderr:\n{}",
        norm(&output.stdout),
        norm(&output.stderr)
    );
}

#[test]
fn lock_d2_02_project_model_defaults_follow_gradle_layout() {
    let root = unique_temp_root();
    let project_name = "layout_defaults";
    let new_output = run_pulsec(&[
        "new",
        project_name,
        "--template",
        "app",
        "--path",
        root.to_str().expect("root utf8"),
    ]);
    assert!(new_output.status.success(), "scaffold should succeed");
    let project = root.join(project_name);

    for path in [
        project.join("src").join("main").join("pulse"),
        project.join("src").join("main").join("resources"),
        project.join("src").join("test").join("pulse"),
        project.join("src").join("test").join("resources"),
        project.join("src").join("api").join("pulse"),
        project.join("src").join("api").join("resources"),
        project.join("docs"),
        project.join("libraries"),
        project.join("build").join("asm"),
        project.join("build").join("generated"),
        project.join("build").join("assets"),
        project.join("build").join("sanity"),
        project.join("build").join("tmp"),
        project.join("build").join("distro"),
        project.join("build").join("distro").join("libraries"),
    ] {
        assert!(
            path.exists(),
            "missing default layout path '{}'",
            path.display()
        );
    }

    let test_file = project
        .join("src")
        .join("test")
        .join("pulse")
        .join("app")
        .join("tests")
        .join("Smoke.pulse");
    fs::create_dir_all(test_file.parent().expect("test parent")).expect("mkdir");
    fs::write(
        &test_file,
        "package app.tests;\nclass Smoke { public static void main() {} }\n",
    )
    .expect("write test");
    let test_output = run_pulsec(&["test", "--project-root", project.to_str().expect("utf8")]);
    assert!(
        test_output.status.success(),
        "test command should detect src/test/pulse\nstdout:\n{}\nstderr:\n{}",
        norm(&test_output.stdout),
        norm(&test_output.stderr)
    );
    assert!(norm(&test_output.stdout).contains("src\\test\\pulse"));

    let build_output = run_pulsec(&["build", "--project-root", project.to_str().expect("utf8")]);
    assert!(
        build_output.status.success(),
        "build should succeed\nstdout:\n{}\nstderr:\n{}",
        norm(&build_output.stdout),
        norm(&build_output.stderr)
    );
    let stdout = norm(&build_output.stdout);
    let stdout_paths = norm_slashes(&stdout);
    assert!(stdout_paths.contains("/build/distro/release"));
    assert!(project.join("build").join("asm").exists());
    assert!(project.join("build").join("generated").exists());
    assert!(project.join("build").join("assets").exists());
    assert!(project.join("build").join("sanity").exists());
    assert!(project.join("build").join("tmp").exists());
}

#[test]
fn lock_d2_03_layout_overrides_are_respected() {
    let root = unique_temp_root();
    let project = root.join("layout_override");
    fs::create_dir_all(project.join("code").join("main").join("app").join("core"))
        .expect("mkdir main");
    fs::create_dir_all(project.join("code").join("tests").join("app").join("tests"))
        .expect("mkdir tests");
    fs::write(
        project.join("pulsec.toml"),
        "[package]\nname = \"layout_override\"\nversion = \"1.0.0\"\n\n[sources]\nmain_pulse = \"code/main\"\ntest_pulse = \"code/tests\"\nmain_resources = \"res/main\"\ntest_resources = \"res/tests\"\napi_pulse = \"api/main\"\napi_resources = \"api/res\"\ndocs = \"documentation\"\nlibraries = \"deps\"\nentry = \"app/core/Main.pulse\"\n\n[build]\nprofile = \"debug\"\nasm_dir = \"out/asm\"\ngenerated_dir = \"out/generated\"\nassets_dir = \"out/assets\"\nsanity_dir = \"out/sanity\"\ntmp_dir = \"out/tmp\"\ndistro_dir = \"out/distro\"\n",
    )
    .expect("write manifest");
    fs::write(
        project
            .join("code")
            .join("main")
            .join("app")
            .join("core")
            .join("Main.pulse"),
        "package app.core;\nclass Main { public static void main() {} }\n",
    )
    .expect("write main");
    fs::write(
        project
            .join("code")
            .join("tests")
            .join("app")
            .join("tests")
            .join("Smoke.pulse"),
        "package app.tests;\nclass Smoke { public static void main() {} }\n",
    )
    .expect("write test");

    let check = run_pulsec(&["check", "--project-root", project.to_str().expect("utf8")]);
    assert!(
        check.status.success(),
        "check should respect main_pulse override"
    );

    let test = run_pulsec(&["test", "--project-root", project.to_str().expect("utf8")]);
    assert!(
        test.status.success(),
        "test should respect test_pulse override"
    );
    assert!(norm(&test.stdout).contains("code\\tests"));

    let build = run_pulsec(&["build", "--project-root", project.to_str().expect("utf8")]);
    assert!(
        build.status.success(),
        "build should respect build dir overrides"
    );
    let stdout = norm(&build.stdout);
    let stdout_paths = norm_slashes(&stdout);
    assert!(stdout_paths.contains("/out/distro/debug"));
    assert!(project.join("out").join("asm").exists());
    assert!(project.join("out").join("generated").exists());
    assert!(project.join("out").join("assets").exists());
    assert!(project.join("out").join("sanity").exists());
    assert!(project.join("out").join("tmp").exists());
}

#[test]
fn lock_d2_03_empty_layout_override_is_rejected() {
    let root = unique_temp_root();
    let project = root.join("layout_override_bad");
    fs::create_dir_all(&project).expect("create project");
    fs::write(
        project.join("pulsec.toml"),
        "[package]\nname = \"layout_override_bad\"\nversion = \"1.0.0\"\n\n[sources]\nmain_pulse = \"\"\nentry = \"app/core/Main.pulse\"\n",
    )
    .expect("write manifest");
    let output = run_pulsec(&["check", "--project-root", project.to_str().expect("utf8")]);
    assert_eq!(output.status.code(), Some(2));
    let stderr = norm(&output.stderr);
    assert!(stderr.contains("Manifest validation error"));
    assert!(stderr.contains("[sources].main_pulse cannot be empty"));
}

#[test]
fn lock_d2_04_build_config_plan_surfaces_resolved_target_profile_and_runtime_toggles() {
    let root = unique_temp_root();
    let project_name = "build_config_plan";
    let new_output = run_pulsec(&[
        "new",
        project_name,
        "--template",
        "app",
        "--path",
        root.to_str().expect("root utf8"),
    ]);
    assert!(new_output.status.success(), "scaffold should succeed");
    let project = root.join(project_name);
    let manifest_path = project.join("pulsec.toml");
    let manifest = read(&manifest_path).replace(
        "[build]\nprofile = \"release\"\ntarget = \"windows-x64\"\noutput_mode = \"fat\"\noutput_entry = \"main\"\nruntime_debug_allocator = \"off\"\nruntime_cycle_collector = \"on\"\nasm_dir = \"build/asm\"\ngenerated_dir = \"build/generated\"\nassets_dir = \"build/assets\"\nsanity_dir = \"build/sanity\"\ntmp_dir = \"build/tmp\"\ndistro_dir = \"build/distro\"",
        "[build]\nprofile = \"release\"\ntarget = \"pulseos-x64\"\noutput_mode = \"shared\"\noutput_entry = \"launcher\"\nruntime_debug_allocator = \"on\"\nruntime_cycle_collector = \"off\"\nasm_dir = \"build/asm\"\ngenerated_dir = \"build/generated\"\nassets_dir = \"build/assets\"\nsanity_dir = \"build/sanity\"\ntmp_dir = \"build/tmp\"\ndistro_dir = \"build/distro\"",
    ).replace(
        "[toolchain]\n",
        "[toolchain]\nlinker = \"C:/tools/link.exe\"\nassembler = \"C:/tools/ml64.exe\"\n",
    );
    fs::write(&manifest_path, manifest).expect("write manifest");

    let build = run_pulsec(&["build", "--project-root", project.to_str().expect("utf8")]);
    if !build.status.success() && !command_supports_backend_artifacts(&build) {
        return;
    }
    assert!(
        build.status.success(),
        "build should succeed once backend artifacts are available\nstdout:\n{}\nstderr:\n{}",
        norm(&build.stdout),
        norm(&build.stderr)
    );
    let stdout = norm(&build.stdout);
    assert!(
        stdout.contains("Build mode: profile=release target=pulseos-x64")
            || norm(&build.stderr).contains("diag.code=PULSEC:E_BUILD_FAILED")
    );
    if build.status.success() {
        assert!(stdout.contains("output_mode=shared"));
        assert!(stdout.contains("output_entry=launcher"));
        assert!(stdout.contains("runtime_debug_allocator=on"));
        assert!(stdout.contains("runtime_cycle_collector=off"));
        assert!(stdout.contains("Build config plan:"));
    }

    let plan = project
        .join("build")
        .join("tmp")
        .join("build_config_plan-0.1.0-build.config.plan.json");
    assert!(
        plan.exists(),
        "missing build config plan '{}'",
        plan.display()
    );
    let plan_text = read(&plan);
    assert!(plan_text.contains("\"schema\": \"pulsec.build.config.v1\""));
    assert!(plan_text.contains("\"profile\": \"release\""));
    assert!(plan_text.contains("\"target\": \"pulseos-x64\""));
    assert!(plan_text.contains("\"target_adapter\": {"));
    assert!(plan_text.contains("\"requested\": {"));
    assert!(plan_text.contains("\"lane_name\": \"pulseos-x64-first-slice\""));
    assert!(plan_text.contains("\"lane_kind\": \"first-slice-contract\""));
    assert!(plan_text.contains("\"bootstrap_status\": \"not-bootstrap\""));
    assert!(plan_text.contains("\"strategic_status\": \"immediate-target\""));
    assert!(plan_text.contains("\"adapter_status\": \"contract-defined\""));
    assert!(plan_text.contains("\"active\": {"));
    assert!(plan_text.contains("\"target_id\": \"windows-x64\""));
    assert!(plan_text.contains("\"lane_name\": \"windows-x64-host-bootstrap\""));
    assert!(plan_text.contains("\"lane_kind\": \"host-bootstrap\""));
    assert!(plan_text.contains("\"bootstrap_status\": \"current-host-bootstrap\""));
    assert!(plan_text.contains(
        "\"resolution\": \"selected-target-not-yet-implemented-using-windows-host-bootstrap\""
    ));
    assert!(plan_text.contains("\"artifact_family\": {"));
    assert!(plan_text.contains("\"id\": \"windows-pe-coff-shared-runtime\""));
    assert!(plan_text.contains("\"runtime_abi_family\": {"));
    assert!(plan_text.contains("\"id\": \"pulsec-runtime-abi-v2-shared-windows-bootstrap\""));
    assert!(plan_text.contains("\"mode\": \"shared\""));
    assert!(plan_text.contains("\"entry\": \"launcher\""));
    assert!(plan_text.contains("\"debug_allocator\": \"on\""));
    assert!(plan_text.contains("\"cycle_collector\": \"off\""));
    assert!(plan_text.contains("\"linker\": \"C:/tools/link.exe\""));
    assert!(plan_text.contains("\"assembler\": \"C:/tools/ml64.exe\""));

    let native_plan = project
        .join("build")
        .join("tmp")
        .join("backend")
        .join("release")
        .join("native.plan.json");
    assert!(
        native_plan.exists(),
        "missing native plan '{}'",
        native_plan.display()
    );
    let native_plan_text = read(&native_plan);
    assert!(native_plan_text.contains("\"target_adapter\": {"));
    assert!(native_plan_text.contains("\"requested\": {"));
    assert!(native_plan_text.contains("\"lane_name\": \"pulseos-x64-first-slice\""));
    assert!(native_plan_text.contains("\"adapter_status\": \"contract-defined\""));
    assert!(native_plan_text.contains("\"active\": {"));
    assert!(native_plan_text.contains("\"lane_name\": \"windows-x64-host-bootstrap\""));
    assert!(native_plan_text.contains(
        "\"resolution\": \"selected-target-not-yet-implemented-using-windows-host-bootstrap\""
    ));
    assert!(native_plan_text.contains("\"artifact_family\": {"));
    assert!(native_plan_text.contains("\"id\": \"windows-pe-coff-shared-runtime\""));
    assert!(native_plan_text.contains("\"runtime_abi_family\": {"));
    assert!(native_plan_text.contains("\"id\": \"pulsec-runtime-abi-v2-shared-windows-bootstrap\""));
    assert!(native_plan_text.contains("\"outputs\": {"));
    assert!(native_plan_text.contains("\"shared_boundary\": {"));
    assert!(native_plan_text.contains("\"schema\": \"pulsec.shared_boundary.v1\""));
    assert!(native_plan_text.contains("\"participants\": {"));
    assert!(native_plan_text.contains("\"app\": \"app_executable\""));
    assert!(native_plan_text.contains("\"runtime\": \"shared_runtime_library\""));
    assert!(native_plan_text.contains("\"ownership_boundary\": {"));
    assert!(native_plan_text
        .contains("\"cross_boundary_access\": \"procedure_imports_and_lookup_metadata_only\""));
    assert!(native_plan_text.contains("\"import_boundary\": {"));
    assert!(native_plan_text.contains("\"app_import_kind\": \"import_library\""));
    assert!(native_plan_text.contains("\"runtime_visibility\": \"minimal_versioned_abi\""));
    assert!(native_plan_text.contains("\"runtime_private_data_imports\": \"forbidden\""));
    assert!(native_plan_text.contains("\"mode\": \"shared\""));
    assert!(native_plan_text.contains("\"entrypoint\": \"launcher\""));
    assert!(native_plan_text.contains("\"id\": \"app_executable\""));
    assert!(native_plan_text.contains("\"id\": \"runtime_library\""));
    assert!(native_plan_text.contains("\"kind\": \"dll\""));
    assert!(native_plan_text.contains("\"id\": \"runtime_import_library\""));
    assert!(native_plan_text.contains("\"kind\": \"import_lib\""));
    assert!(native_plan_text.contains("\"id\": \"runtime_lookup_metadata\""));
    assert!(native_plan_text.contains("\"runtime_lookup_metadata\": {"));
    assert!(native_plan_text.contains("\"schema\": \"pulsec.shared_runtime.lookup.v1\""));
    assert!(native_plan_text.contains("\"lookup_policy\": \"relative-sibling-runtime\""));
    assert!(native_plan_text.contains("\"launch_descriptor\": \"bin/launch.txt\""));
    assert!(native_plan_text.contains("\"runtime_library\": \"pulsecore-"));
    assert!(native_plan_text.contains("\"runtime_import_library\": \"pulsecore-"));
    assert!(native_plan_text.contains("\"launch_descriptor\": \"staging/bin/launch.txt\""));
    assert!(native_plan_text.contains("\"runtime_library\": \"pulsecore-"));
    assert!(native_plan_text.contains("\"runtime_import_library\": \"pulsecore-"));
    assert!(native_plan_text.contains("\"base_name\": \"pulsecore\""));
    assert!(native_plan_text.contains(&format!(
        "\"file_name\": \"pulsecore-{}.dll\"",
        env!("CARGO_PKG_VERSION")
    )));
    assert!(native_plan_text.contains(&format!(
        "\"file_name\": \"pulsecore-{}.lib\"",
        env!("CARGO_PKG_VERSION")
    )));
    assert!(native_plan_text.contains("\"version_source\": \"pulsec_toolchain_semver\""));
    assert!(native_plan_text.contains(&format!("\"version\": \"{}\"", env!("CARGO_PKG_VERSION"))));
    assert!(native_plan_text.contains("\"link_plan\": {"));
    assert!(native_plan_text.contains("\"shared_runtime_abi\": {"));
    assert!(native_plan_text.contains("\"schema\": \"pulsec.shared_runtime.abi.v1\""));
    assert!(native_plan_text.contains("\"mode\": \"shared\""));
    assert!(native_plan_text.contains("\"compatibility\": {"));
    assert!(native_plan_text.contains("\"runtime_abi_schema\": \"pulsec.runtime.abi.v1\""));
    assert!(native_plan_text.contains("\"runtime_abi_version\": 2"));
    assert!(
        native_plan_text.contains("\"object_model_abi_schema\": \"pulsec.object_model.abi.v1\"")
    );
    assert!(native_plan_text.contains("\"object_model_abi_version\": 1"));
    assert!(native_plan_text.contains("\"version_source\": \"pulsec_toolchain_semver\""));
    assert!(native_plan_text.contains("\"mismatch_policy\": \"deterministic-fail-fast\""));
    assert!(native_plan_text.contains("\"kind\": \"procedure_only\""));
    assert!(native_plan_text.contains("\"exports\": {"));
    assert!(native_plan_text.contains("\"visibility\": \"minimal_versioned_abi\""));
    assert!(native_plan_text.contains("\"forbidden_private_export_patterns\": [\"rt_*\", \"pulsec_rt_obj_*\", \"pulsec_rt_class_*\"]"));
    assert!(native_plan_text.contains("\"runtime_state_layout\": {"));
    assert!(native_plan_text.contains("\"schema\": \"pulsec.shared_runtime.state_layout.v1\""));
    assert!(native_plan_text.contains("\"metadata_state\": \"runtime_library_storage\""));
    assert!(native_plan_text.contains("\"allocator_state\": \"runtime_library_storage\""));
    assert!(native_plan_text.contains("\"object_metadata_symbols\": [\"pulsec_rt_obj_counter\", \"pulsec_rt_obj_class_ids\", \"pulsec_rt_obj_class_ids_init\", \"pulsec_rt_obj_class_ids_heap_owned\"]"));
    assert!(native_plan_text.contains("\"allocator_symbols\": [\"rt_handle_next\", \"rt_slot_capacity\", \"rt_arc_free_head\", \"rt_arc_free_next_tbl\", \"rt_arc_heap_owned\"]"));
    assert!(native_plan_text.contains("\"arc_symbols\": [\"rt_arc_refcounts_tbl\", \"rt_arc_kinds_tbl\", \"rt_arc_flags_tbl\", \"rt_arc_meta_tbl\", \"rt_arc_generation_tbl\"]"));
    assert!(native_plan_text.contains(
        "\"weak_symbols\": [\"rt_weak_next\", \"rt_weak_free_head\", \"rt_weak_generation\"]"
    ));
    assert!(native_plan_text.contains(
        "\"container_registry_symbols\": [\"rt_arr_*\", \"rt_list_*\", \"rt_map_*\", \"rt_str_*\"]"
    ));
    assert!(native_plan_text
        .contains("\"user_field_storage_runtime_dependency\": \"removed_in_e2_06\""));
    assert!(native_plan_text.contains("\"pulsec_rt_init\""));
    assert!(native_plan_text.contains("\"pulsec_rt_objectNew\""));
    assert!(native_plan_text.contains("\"pulsec_rt_arcRetain\""));
    assert!(native_plan_text.contains("\"pulsec_rt_dispatchNullReceiverPanic\""));
    assert!(native_plan_text.contains("\"user_field_storage_imports\": \"removed_in_e2_06\""));
    assert!(native_plan_text.contains("\"init_sequence\": [\"startup_entry\", \"pulsec_rt_init\", \"app_entry\", \"pulsec_rt_shutdown\", \"ExitProcess\"]"));
    assert!(native_plan_text.contains("\"startup_objects\": [{ \"path\": \""));
    assert!(native_plan_text.contains("Startup.obj"));
    assert!(native_plan_text.contains("\"app_owned_objects\": ["));
    assert!(native_plan_text.contains("\"runtime_owned_objects\": [{ \"path\": \""));
    assert!(native_plan_text.contains("StdlibRuntime.obj"));
    assert!(native_plan_text.contains("\"owner\": \"app_executable\""));
    assert!(native_plan_text.contains("\"owner\": \"shared_runtime_candidate\""));
    assert!(native_plan_text.contains(
        "\"id\": \"app_executable\", \"consumes\": [\"startup_objects\", \"app_owned_objects\", \"runtime_import_library\", \"system_inputs\"], \"linkage_kind\": \"import_library\", \"runtime_load\": \"peer_runtime_library\""
    ));
    assert!(native_plan_text.contains(&format!(
        "\"runtime_artifact\": \"pulsecore-{}.dll\"",
        env!("CARGO_PKG_VERSION")
    )));
    assert!(native_plan_text.contains(&format!(
        "\"import_artifact\": \"pulsecore-{}.lib\"",
        env!("CARGO_PKG_VERSION")
    )));
    assert!(native_plan_text.contains(
        "\"id\": \"runtime_library\", \"consumes\": [\"runtime_owned_objects\", \"system_inputs\"], \"linkage_kind\": \"shared_runtime_library\""
    ));

    let link_report = project
        .join("build")
        .join("tmp")
        .join("backend")
        .join("release")
        .join("native.link.txt");
    if link_report.exists() {
        let link_report_text = read(&link_report);
        assert!(link_report_text.contains("startup_object="));
        assert!(link_report_text.contains("Startup.obj"));
        assert!(link_report_text.contains(
            "startup_bootstrap=mainCRTStartup->pulsec_rt_init->app_entry->pulsec_rt_shutdown->ExitProcess"
        ));
    }
}

#[test]
fn lock_d2_04_cli_overrides_take_precedence_over_manifest() {
    let root = unique_temp_root();
    let project_name = "build_config_override";
    let new_output = run_pulsec(&[
        "new",
        project_name,
        "--template",
        "app",
        "--path",
        root.to_str().expect("root utf8"),
    ]);
    assert!(new_output.status.success(), "scaffold should succeed");
    let project = root.join(project_name);
    let manifest_path = project.join("pulsec.toml");
    let manifest = read(&manifest_path).replace(
        "[build]\nprofile = \"release\"\ntarget = \"windows-x64\"\noutput_mode = \"fat\"\noutput_entry = \"main\"\nruntime_debug_allocator = \"off\"\nruntime_cycle_collector = \"on\"\nasm_dir = \"build/asm\"\ngenerated_dir = \"build/generated\"\nassets_dir = \"build/assets\"\nsanity_dir = \"build/sanity\"\ntmp_dir = \"build/tmp\"\ndistro_dir = \"build/distro\"",
        "[build]\nprofile = \"release\"\ntarget = \"windows-x64\"\noutput_mode = \"fat\"\noutput_entry = \"main\"\nruntime_debug_allocator = \"off\"\nruntime_cycle_collector = \"on\"\nasm_dir = \"build/asm\"\ngenerated_dir = \"build/generated\"\nassets_dir = \"build/assets\"\nsanity_dir = \"build/sanity\"\ntmp_dir = \"build/tmp\"\ndistro_dir = \"build/distro\"",
    );
    fs::write(&manifest_path, manifest).expect("write manifest");

    let build = run_pulsec(&[
        "build",
        "--project-root",
        project.to_str().expect("utf8"),
        "--target",
        "pulseos-x64",
        "--profile",
        "debug",
        "--runtime-debug-allocator",
        "on",
        "--runtime-cycle-collector",
        "off",
    ]);
    if !build.status.success() && !command_supports_backend_artifacts(&build) {
        return;
    }
    assert!(build.status.success(), "build should succeed");
    let plan = project
        .join("build")
        .join("distro")
        .join("debug")
        .join("build_config_override-0.1.0-build.config.plan.json");
    let plan_text = read(&plan);
    assert!(plan_text.contains("\"profile\": \"debug\""));
    assert!(plan_text.contains("\"target\": \"pulseos-x64\""));
    assert!(plan_text.contains("\"target_adapter\": {"));
    assert!(plan_text.contains("\"lane_name\": \"pulseos-x64-first-slice\""));
    assert!(plan_text.contains("\"lane_kind\": \"first-slice-contract\""));
    assert!(plan_text.contains(
        "\"resolution\": \"selected-target-not-yet-implemented-using-windows-host-bootstrap\""
    ));
    assert!(plan_text.contains("\"artifact_family\": {"));
    assert!(plan_text.contains("\"id\": \"windows-pe-coff-fat-executable\""));
    assert!(plan_text.contains("\"runtime_abi_family\": {"));
    assert!(plan_text.contains("\"id\": \"pulsec-runtime-abi-v2-embedded-windows-bootstrap\""));
    assert!(plan_text.contains("\"debug_allocator\": \"on\""));
    assert!(plan_text.contains("\"cycle_collector\": \"off\""));

    let native_plan = project
        .join("build")
        .join("distro")
        .join("debug")
        .join("build_config_override-0.1.0-native.plan.json");
    assert!(
        native_plan.exists(),
        "missing native plan '{}'",
        native_plan.display()
    );
    let native_plan_text = read(&native_plan);
    assert!(native_plan_text.contains("\"target_adapter\": {"));
    assert!(native_plan_text.contains("\"lane_name\": \"pulseos-x64-first-slice\""));
    assert!(native_plan_text.contains("\"lane_name\": \"windows-x64-host-bootstrap\""));
    assert!(native_plan_text.contains(
        "\"resolution\": \"selected-target-not-yet-implemented-using-windows-host-bootstrap\""
    ));
    assert!(native_plan_text.contains("\"artifact_family\": {"));
    assert!(native_plan_text.contains("\"id\": \"windows-pe-coff-fat-executable\""));
    assert!(native_plan_text.contains("\"runtime_abi_family\": {"));
    assert!(
        native_plan_text.contains("\"id\": \"pulsec-runtime-abi-v2-embedded-windows-bootstrap\"")
    );
    assert!(native_plan_text.contains("\"outputs\": {"));
    assert!(native_plan_text.contains("\"mode\": \"fat\""));
    assert!(native_plan_text.contains("\"entrypoint\": \"main\""));
    assert!(native_plan_text.contains("\"id\": \"app_executable\""));
    assert!(native_plan_text.contains("\"id\": \"runtime_payload\""));
    assert!(native_plan_text.contains("\"kind\": \"embedded\""));
}

#[test]
fn lock_e1_16_shared_artifacts_and_publication_layout_are_deterministic() {
    let root = unique_temp_root();
    let project_name = "shared_artifact_lock";
    let new_output = run_pulsec(&[
        "new",
        project_name,
        "--template",
        "app",
        "--path",
        root.to_str().expect("root utf8"),
    ]);
    assert!(new_output.status.success(), "scaffold should succeed");
    let project = root.join(project_name);
    let manifest_path = project.join("pulsec.toml");
    let manifest = read(&manifest_path).replace(
        "[build]\nprofile = \"release\"\ntarget = \"windows-x64\"\noutput_mode = \"fat\"\noutput_entry = \"main\"\nruntime_debug_allocator = \"off\"\nruntime_cycle_collector = \"on\"\nasm_dir = \"build/asm\"\ngenerated_dir = \"build/generated\"\nassets_dir = \"build/assets\"\nsanity_dir = \"build/sanity\"\ntmp_dir = \"build/tmp\"\ndistro_dir = \"build/distro\"",
        "[build]\nprofile = \"release\"\ntarget = \"windows-x64\"\noutput_mode = \"shared\"\noutput_entry = \"main\"\nruntime_debug_allocator = \"off\"\nruntime_cycle_collector = \"on\"\nasm_dir = \"build/asm\"\ngenerated_dir = \"build/generated\"\nassets_dir = \"build/assets\"\nsanity_dir = \"build/sanity\"\ntmp_dir = \"build/tmp\"\ndistro_dir = \"build/distro\"",
    );
    fs::write(&manifest_path, manifest).expect("write manifest");

    let release_build = run_pulsec(&["build", "--project-root", project.to_str().expect("utf8")]);
    if !release_build.status.success() && !command_supports_backend_artifacts(&release_build) {
        return;
    }
    assert!(
        release_build.status.success(),
        "shared release build should succeed"
    );

    let release_dir = project.join("build").join("distro").join("release");
    let release_bin = release_dir.join("bin");
    let version = env!("CARGO_PKG_VERSION");
    assert!(release_bin.join("shared_artifact_lock-0.1.0.exe").exists());
    assert!(release_bin.join("launch.txt").exists());
    assert!(release_bin
        .join(format!("pulsecore-{version}.dll"))
        .exists());
    assert!(release_bin
        .join(format!("pulsecore-{version}.lib"))
        .exists());
    assert!(!release_dir.join("metadata").exists());
    assert!(!release_dir.join("shared_artifact_lock-0.1.0.exe").exists());

    let release_launch = read(&release_bin.join("launch.txt"));
    assert!(release_launch.contains("schema=pulsec.shared.launch.v1"));
    assert!(release_launch.contains("runtime_abi_schema=pulsec.runtime.abi.v1"));
    assert!(release_launch.contains("runtime_abi_version=2"));
    assert!(release_launch.contains("object_model_abi_schema=pulsec.object_model.abi.v1"));
    assert!(release_launch.contains("object_model_abi_version=1"));
    assert!(release_launch.contains("mismatch_policy=deterministic-fail-fast"));
    assert!(release_launch.contains("missing_runtime_policy=deterministic-fail-fast"));
    assert!(release_launch.contains("missing_import_policy=deterministic-fail-fast"));
    assert!(release_launch.contains("required_runtime_imports=pulsec_rt_init"));
    assert!(release_launch.contains("runtime_library=pulsecore-"));
    assert!(release_launch.contains("runtime_import_library=pulsecore-"));

    let debug_build = run_pulsec(&[
        "build",
        "--project-root",
        project.to_str().expect("utf8"),
        "--profile",
        "debug",
    ]);
    assert!(
        debug_build.status.success(),
        "shared debug build should succeed"
    );

    let debug_dir = project.join("build").join("distro").join("debug");
    let debug_bin = debug_dir.join("bin");
    let debug_metadata = debug_dir.join("metadata");
    assert!(debug_bin.join("shared_artifact_lock-0.1.0.exe").exists());
    assert!(debug_bin.join("launch.txt").exists());
    assert!(debug_bin.join(format!("pulsecore-{version}.dll")).exists());
    assert!(debug_bin.join(format!("pulsecore-{version}.lib")).exists());
    for file in [
        "shared_artifact_lock-0.1.0-build.config.plan.json",
        "shared_artifact_lock-0.1.0-native.link.txt",
        "shared_artifact_lock-0.1.0-native.plan.json",
        "shared_artifact_lock-0.1.0-pulsec.ir.txt",
        "stamp.txt",
    ] {
        assert!(
            debug_metadata.join(file).exists(),
            "missing shared debug artifact '{}'",
            debug_metadata.join(file).display()
        );
    }
    assert!(!debug_dir
        .join("shared_artifact_lock-0.1.0-native.plan.json")
        .exists());
}

#[test]
fn lock_e3_08_fat_and_shared_artifact_publication_parity_rules_are_explicit() {
    let root = unique_temp_root();

    let fat_project_name = "fat_parity_artifacts";
    let fat_new = run_pulsec(&[
        "new",
        fat_project_name,
        "--template",
        "app",
        "--path",
        root.to_str().expect("root utf8"),
    ]);
    assert!(fat_new.status.success(), "fat scaffold should succeed");
    let fat_project = root.join(fat_project_name);
    let fat_resources = fat_project.join("src").join("main").join("resources");
    fs::create_dir_all(fat_resources.join("images")).expect("create fat resources");
    fs::write(fat_resources.join("payload.txt"), "payload").expect("write fat payload");
    fs::write(fat_resources.join("images").join("icon.txt"), "icon").expect("write fat icon");

    let fat_release = run_pulsec(&[
        "build",
        "--project-root",
        fat_project.to_str().expect("utf8"),
    ]);
    assert!(
        fat_release.status.success(),
        "fat release build should succeed"
    );
    let fat_release_dir = fat_project.join("build").join("distro").join("release");
    assert!(fat_release_dir
        .join("fat_parity_artifacts-0.1.0.exe")
        .exists());
    assert!(fat_release_dir.join("payload.txt").exists());
    assert!(fat_release_dir.join("images").join("icon.txt").exists());
    for file in [
        "fat_parity_artifacts-0.1.0-build.config.plan.json",
        "fat_parity_artifacts-0.1.0-native.link.txt",
        "fat_parity_artifacts-0.1.0-native.plan.json",
        "fat_parity_artifacts-0.1.0-pulsec.ir.txt",
        "stamp.txt",
    ] {
        assert!(
            !fat_release_dir.join(file).exists(),
            "fat release must remain runnable-payload only for '{file}'"
        );
    }

    let fat_debug = run_pulsec(&[
        "build",
        "--project-root",
        fat_project.to_str().expect("utf8"),
        "--profile",
        "debug",
    ]);
    assert!(fat_debug.status.success(), "fat debug build should succeed");
    let fat_debug_dir = fat_project.join("build").join("distro").join("debug");
    assert!(fat_debug_dir
        .join("fat_parity_artifacts-0.1.0.exe")
        .exists());
    assert!(fat_debug_dir.join("payload.txt").exists());
    assert!(fat_debug_dir.join("images").join("icon.txt").exists());
    for file in [
        "fat_parity_artifacts-0.1.0-build.config.plan.json",
        "fat_parity_artifacts-0.1.0-native.link.txt",
        "fat_parity_artifacts-0.1.0-native.plan.json",
        "fat_parity_artifacts-0.1.0-pulsec.ir.txt",
        "stamp.txt",
    ] {
        assert!(
            fat_debug_dir.join(file).exists(),
            "fat debug must publish diagnostic '{file}'"
        );
    }

    let shared_project_name = "shared_parity_artifacts";
    let shared_new = run_pulsec(&[
        "new",
        shared_project_name,
        "--template",
        "app",
        "--path",
        root.to_str().expect("root utf8"),
    ]);
    assert!(
        shared_new.status.success(),
        "shared scaffold should succeed"
    );
    let shared_project = root.join(shared_project_name);
    let shared_manifest_path = shared_project.join("pulsec.toml");
    let shared_manifest =
        read(&shared_manifest_path).replace("output_mode = \"fat\"", "output_mode = \"shared\"");
    fs::write(&shared_manifest_path, shared_manifest).expect("write shared manifest");
    let shared_resources = shared_project.join("src").join("main").join("resources");
    fs::create_dir_all(shared_resources.join("images")).expect("create shared resources");
    fs::write(shared_resources.join("payload.txt"), "payload").expect("write shared payload");
    fs::write(shared_resources.join("images").join("icon.txt"), "icon").expect("write shared icon");

    let shared_release = run_pulsec(&[
        "build",
        "--project-root",
        shared_project.to_str().expect("utf8"),
    ]);
    if !shared_release.status.success() && !command_supports_backend_artifacts(&shared_release) {
        return;
    }
    assert!(
        shared_release.status.success(),
        "shared release build should succeed"
    );
    let shared_release_dir = shared_project.join("build").join("distro").join("release");
    let shared_release_bin = shared_release_dir.join("bin");
    let version = env!("CARGO_PKG_VERSION");
    assert!(shared_release_bin
        .join("shared_parity_artifacts-0.1.0.exe")
        .exists());
    assert!(shared_release_bin.join("launch.txt").exists());
    assert!(shared_release_bin.join("payload.txt").exists());
    assert!(shared_release_bin.join("images").join("icon.txt").exists());
    assert!(shared_release_bin
        .join(format!("pulsecore-{version}.dll"))
        .exists());
    assert!(shared_release_bin
        .join(format!("pulsecore-{version}.lib"))
        .exists());
    assert!(!shared_release_dir.join("metadata").exists());
    assert!(!shared_release_dir
        .join("shared_parity_artifacts-0.1.0.exe")
        .exists());

    let shared_debug = run_pulsec(&[
        "build",
        "--project-root",
        shared_project.to_str().expect("utf8"),
        "--profile",
        "debug",
    ]);
    assert!(
        shared_debug.status.success(),
        "shared debug build should succeed"
    );
    let shared_debug_dir = shared_project.join("build").join("distro").join("debug");
    let shared_debug_bin = shared_debug_dir.join("bin");
    let shared_debug_metadata = shared_debug_dir.join("metadata");
    assert!(shared_debug_bin
        .join("shared_parity_artifacts-0.1.0.exe")
        .exists());
    assert!(shared_debug_bin.join("launch.txt").exists());
    assert!(shared_debug_bin.join("payload.txt").exists());
    assert!(shared_debug_bin.join("images").join("icon.txt").exists());
    assert!(shared_debug_bin
        .join(format!("pulsecore-{version}.dll"))
        .exists());
    assert!(shared_debug_bin
        .join(format!("pulsecore-{version}.lib"))
        .exists());
    for file in [
        "shared_parity_artifacts-0.1.0-build.config.plan.json",
        "shared_parity_artifacts-0.1.0-native.link.txt",
        "shared_parity_artifacts-0.1.0-native.plan.json",
        "shared_parity_artifacts-0.1.0-pulsec.ir.txt",
        "stamp.txt",
    ] {
        assert!(
            shared_debug_metadata.join(file).exists(),
            "shared debug must publish diagnostic '{file}' under metadata/"
        );
        assert!(
            !shared_debug_dir.join(file).exists(),
            "shared debug diagnostic '{file}' must not publish at profile root"
        );
    }
}

#[test]
fn lock_e1_18_shared_profile_request_requires_output_entry_and_fails_deterministically() {
    let root = unique_temp_root();
    let project_name = "shared_missing_entry";
    let new_output = run_pulsec(&[
        "new",
        project_name,
        "--template",
        "app",
        "--path",
        root.to_str().expect("root utf8"),
    ]);
    assert!(new_output.status.success(), "scaffold should succeed");
    let project = root.join(project_name);
    let manifest_path = project.join("pulsec.toml");
    let manifest = read(&manifest_path)
        .replace("output_mode = \"fat\"", "output_mode = \"shared\"")
        .replace("output_entry = \"main\"\n", "");
    fs::write(&manifest_path, manifest).expect("write manifest");

    let output = run_pulsec(&["build", "--project-root", project.to_str().expect("utf8")]);
    assert_eq!(output.status.code(), Some(2));
    let stderr = norm(&output.stderr);
    assert!(stderr.contains("Manifest validation error"));
    assert!(
        stderr.contains("[build].output_entry is required when [build].output_mode is 'shared'")
    );
    assert!(
        !project
            .join("build")
            .join("distro")
            .join("release")
            .exists(),
        "invalid shared profile request must not publish distro output"
    );
}

#[test]
fn lock_d2_04_invalid_target_or_runtime_toggle_is_rejected() {
    let root = unique_temp_root();
    let project = root.join("bad_build_config");
    fs::create_dir_all(
        project
            .join("src")
            .join("main")
            .join("pulse")
            .join("app")
            .join("main"),
    )
    .expect("mkdir");
    fs::write(
        project
            .join("src")
            .join("main")
            .join("pulse")
            .join("app")
            .join("main")
            .join("Main.pulse"),
        "package app.main;\nclass Main { public static void main() {} }\n",
    )
    .expect("write source");
    fs::write(
        project.join("pulsec.toml"),
        "[package]\nname = \"bad_build_config\"\nversion = \"1.0.0\"\n\n[sources]\nmain_pulse = \"src/main/pulse\"\nentry = \"app/main/Main.pulse\"\n\n[build]\nprofile = \"debug\"\ntarget = \"native-x64\"\noutput_mode = \"fat_binary\"\nruntime_debug_allocator = \"maybe\"\n",
    )
    .expect("write manifest");

    let build = run_pulsec(&["build", "--project-root", project.to_str().expect("utf8")]);
    assert_eq!(build.status.code(), Some(2));
    let stderr = norm(&build.stderr);
    assert!(stderr.contains("Manifest validation error"));
    assert!(
        stderr.contains("[build].target must be one of: windows-x64, pulseos-x64, linux-x64, macos-arm64")
            || stderr.contains("[build].runtime_debug_allocator must be 'on' or 'off'")
            || stderr.contains("[build].output_mode must be 'fat' or 'shared'")
    );
    assert!(stderr.contains("diag.code=PULSEC:E_USAGE"));
}

#[test]
fn lock_e3_13_supported_fat_shared_differences_and_shared_only_diagnostics_are_snapshot_locked() {
    let root = unique_temp_root();

    let fat_project_name = "fat_parity_snapshot";
    let fat_new = run_pulsec(&[
        "new",
        fat_project_name,
        "--template",
        "app",
        "--path",
        root.to_str().expect("root utf8"),
    ]);
    assert!(fat_new.status.success(), "fat scaffold should succeed");
    let fat_project = root.join(fat_project_name);
    let fat_release = run_pulsec(&[
        "build",
        "--project-root",
        fat_project.to_str().expect("utf8"),
    ]);
    assert!(
        fat_release.status.success(),
        "fat release build should succeed"
    );
    let fat_release_dir = fat_project.join("build").join("distro").join("release");
    assert!(fat_release_dir
        .join("fat_parity_snapshot-0.1.0.exe")
        .exists());
    assert!(!fat_release_dir.join("bin").exists());
    assert!(!fat_release_dir.join("lib").exists());
    assert!(!fat_release_dir.join("metadata").exists());

    let shared_project_name = "shared_parity_snapshot";
    let shared_new = run_pulsec(&[
        "new",
        shared_project_name,
        "--template",
        "app",
        "--path",
        root.to_str().expect("root utf8"),
    ]);
    assert!(
        shared_new.status.success(),
        "shared scaffold should succeed"
    );
    let shared_project = root.join(shared_project_name);
    let shared_manifest_path = shared_project.join("pulsec.toml");
    let shared_manifest =
        read(&shared_manifest_path).replace("output_mode = \"fat\"", "output_mode = \"shared\"");
    fs::write(&shared_manifest_path, shared_manifest).expect("write shared manifest");
    let shared_release = run_pulsec(&[
        "build",
        "--project-root",
        shared_project.to_str().expect("utf8"),
    ]);
    if !shared_release.status.success() && !command_supports_backend_artifacts(&shared_release) {
        return;
    }
    assert!(
        shared_release.status.success(),
        "shared release build should succeed"
    );
    let shared_release_dir = shared_project.join("build").join("distro").join("release");
    assert!(shared_release_dir.join("bin").exists());
    assert!(!shared_release_dir.join("metadata").exists());
    assert!(!shared_release_dir
        .join("shared_parity_snapshot-0.1.0.exe")
        .exists());
    let launch = read(&shared_release_dir.join("bin").join("launch.txt"));
    assert!(launch.contains("schema=pulsec.shared.launch.v1"));
    assert!(launch.contains("missing_runtime_policy=deterministic-fail-fast"));
    assert!(launch.contains("missing_import_policy=deterministic-fail-fast"));
    assert!(launch.contains("runtime_library=pulsecore-"));

    let missing_payload_project_name = "shared_only_diag_snapshot";
    let diag_new = run_pulsec(&[
        "new",
        missing_payload_project_name,
        "--template",
        "app",
        "--path",
        root.to_str().expect("root utf8"),
    ]);
    assert!(
        diag_new.status.success(),
        "shared diag scaffold should succeed"
    );
    let diag_project = root.join(missing_payload_project_name);
    let diag_manifest_path = diag_project.join("pulsec.toml");
    let diag_manifest =
        read(&diag_manifest_path).replace("output_mode = \"fat\"", "output_mode = \"shared\"");
    fs::write(&diag_manifest_path, diag_manifest).expect("write diag manifest");
    let diag_build = run_pulsec(&[
        "build",
        "--project-root",
        diag_project.to_str().expect("utf8"),
    ]);
    if !diag_build.status.success() && !command_supports_backend_artifacts(&diag_build) {
        return;
    }
    assert!(
        diag_build.status.success(),
        "shared diag build should succeed"
    );
    let launch_path = diag_project
        .join("build")
        .join("distro")
        .join("release")
        .join("bin")
        .join("launch.txt");
    let launch_text = read(&launch_path);
    assert!(launch_text.contains("mode=shared"));
    assert!(launch_text.contains("missing_runtime_policy=deterministic-fail-fast"));
    assert!(launch_text.contains("required_runtime_imports=pulsec_rt_init"));
}

#[test]
fn lock_d2_05_split_output_requires_build_output_entry() {
    let root = unique_temp_root();
    let project_name = "split_output_requires_entry";
    let new_output = run_pulsec(&[
        "new",
        project_name,
        "--template",
        "app",
        "--path",
        root.to_str().expect("root utf8"),
    ]);
    assert!(new_output.status.success(), "scaffold should succeed");
    let project = root.join(project_name);
    let manifest_path = project.join("pulsec.toml");
    let manifest = read(&manifest_path)
        .replace("output_mode = \"fat\"", "output_mode = \"shared\"")
        .replace("output_entry = \"main\"\n", "");
    fs::write(&manifest_path, manifest).expect("write manifest");

    let build = run_pulsec(&["build", "--project-root", project.to_str().expect("utf8")]);
    assert_eq!(build.status.code(), Some(2));
    let stderr = norm(&build.stderr);
    assert!(
        stderr.contains("[build].output_entry is required when [build].output_mode is 'shared'")
    );
    assert!(stderr.contains("diag.code=PULSEC:E_USAGE"));
}

fn create_workspace_fixture() -> (PathBuf, PathBuf, PathBuf, PathBuf) {
    let root = unique_temp_root();
    let workspace_root = root.join("workspace");
    fs::create_dir_all(&workspace_root).expect("create workspace root");

    let new_a = run_pulsec(&[
        "new",
        "app_a",
        "--template",
        "app",
        "--path",
        workspace_root.to_str().expect("workspace utf8"),
    ]);
    assert!(new_a.status.success(), "scaffold app_a should succeed");
    let new_b = run_pulsec(&[
        "new",
        "app_b",
        "--template",
        "app",
        "--path",
        workspace_root.to_str().expect("workspace utf8"),
    ]);
    assert!(new_b.status.success(), "scaffold app_b should succeed");

    let workspace_manifest = "[workspace]\nmembers = \"app_a, app_b\"\n";
    fs::write(workspace_root.join("pulsec.toml"), workspace_manifest)
        .expect("write workspace manifest");

    let app_a = workspace_root.join("app_a");
    let app_b = workspace_root.join("app_b");
    for app in [&app_a, &app_b] {
        let test_file = app
            .join("src")
            .join("test")
            .join("pulse")
            .join("app")
            .join("tests")
            .join("SmokeTest.pulse");
        if let Some(parent) = test_file.parent() {
            fs::create_dir_all(parent).expect("mkdir tests");
        }
        fs::write(
            &test_file,
            "package app.tests;\nimport pulse.lang.IO;\nclass SmokeTest { public static void main() { IO.println(\"ok\"); } }\n",
        )
        .expect("write smoke test");
    }
    (root, workspace_root, app_a, app_b)
}

#[test]
fn lock_d2_06_workspace_check_runs_all_members() {
    let (_root, workspace_root, _app_a, _app_b) = create_workspace_fixture();
    let output = run_pulsec(&[
        "check",
        "--project-root",
        workspace_root.to_str().expect("utf8"),
    ]);
    assert!(
        output.status.success(),
        "workspace check should succeed\nstdout:\n{}\nstderr:\n{}",
        norm(&output.stdout),
        norm(&output.stderr)
    );
    let stdout = norm(&output.stdout);
    assert!(stdout.contains("Workspace check:"));
    assert!(stdout.matches("[PASS]").count() >= 2);
    assert!(stdout.contains("app_a"));
    assert!(stdout.contains("app_b"));
    assert!(stdout.contains("Workspace check summary: passed=2 failed=0 total=2"));
}

#[test]
fn lock_d2_06_workspace_build_runs_all_members() {
    let (_root, workspace_root, _app_a, _app_b) = create_workspace_fixture();
    let output = run_pulsec(&[
        "build",
        "--project-root",
        workspace_root.to_str().expect("utf8"),
    ]);
    assert!(
        output.status.success(),
        "workspace build should succeed\nstdout:\n{}\nstderr:\n{}",
        norm(&output.stdout),
        norm(&output.stderr)
    );
    let stdout = norm(&output.stdout);
    assert!(stdout.contains("Workspace build:"));
    assert!(stdout.matches("[PASS]").count() >= 2);
    assert!(stdout.contains("app_a"));
    assert!(stdout.contains("app_b"));
    assert!(stdout.contains("Workspace build summary: failed=0 total=2"));
}

#[test]
fn lock_d2_06_workspace_test_runs_member_test_fixtures() {
    let (_root, workspace_root, _app_a, _app_b) = create_workspace_fixture();
    let output = run_pulsec(&[
        "test",
        "--project-root",
        workspace_root.to_str().expect("utf8"),
    ]);
    assert!(
        output.status.success(),
        "workspace test should succeed\nstdout:\n{}\nstderr:\n{}",
        norm(&output.stdout),
        norm(&output.stderr)
    );
    let stdout = norm(&output.stdout);
    assert!(stdout.contains("Workspace test:"));
    assert!(stdout.matches("Member test discovery:").count() >= 2);
    assert!(stdout.contains("app_a"));
    assert!(stdout.contains("app_b"));
    assert!(stdout.contains("Workspace test summary: mode=friendly passed=2 failed=0 total=2"));
}

