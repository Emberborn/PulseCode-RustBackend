use std::process::Command;
use std::{
    fs,
    path::{Path, PathBuf},
    sync::atomic::{AtomicU64, Ordering},
    time::{SystemTime, UNIX_EPOCH},
};

fn run_pulsec(args: &[&str]) -> std::process::Output {
    Command::new(env!("CARGO_BIN_EXE_pulsec"))
        .args(args)
        .output()
        .expect("run pulsec")
}

fn norm(bytes: &[u8]) -> String {
    String::from_utf8_lossy(bytes).replace('\r', "")
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

fn create_fake_wix_cli(root: &Path) -> PathBuf {
    let script = root.join("fake_wix.cmd");
    let body = "@echo off\r\n\
if \"%1\"==\"--version\" (\r\n\
  echo 6.0.2-fake\r\n\
  exit /b 0\r\n\
)\r\n\
if \"%1\"==\"build\" goto build\r\n\
exit /b 2\r\n\
\r\n\
:build\r\n\
set OUT=\r\n\
:loop\r\n\
if \"%1\"==\"\" goto done\r\n\
if \"%1\"==\"-o\" (\r\n\
  set OUT=%2\r\n\
)\r\n\
shift\r\n\
goto loop\r\n\
\r\n\
:done\r\n\
if \"%OUT%\"==\"\" exit /b 3\r\n\
copy /Y NUL \"%OUT%\" >NUL\r\n\
exit /b 0\r\n";
    fs::write(&script, body).expect("write fake wix");
    script
}

fn create_fake_signtool_cli(root: &Path) -> PathBuf {
    let script = root.join("fake_signtool.cmd");
    let body = "@echo off\r\n\
if \"%1\"==\"/?\" (\r\n\
  echo SignTool Fake 10.0\r\n\
  exit /b 0\r\n\
)\r\n\
if /I \"%1\"==\"sign\" (\r\n\
  echo Successfully signed\r\n\
  exit /b 0\r\n\
)\r\n\
exit /b 2\r\n";
    fs::write(&script, body).expect("write fake signtool");
    script
}

fn real_wix_cli() -> Option<PathBuf> {
    let candidates = [
        r"C:\Program Files\WiX Toolset v6.0\bin\wix.exe",
        r"C:\Program Files\WiX Toolset v6\bin\wix.exe",
        r"C:\Program Files (x86)\WiX Toolset v6.0\bin\wix.exe",
        r"C:\Program Files (x86)\WiX Toolset v6\bin\wix.exe",
    ];
    candidates
        .iter()
        .map(PathBuf::from)
        .find(|path| path.exists())
}

fn run_process(program: &str, args: &[&str]) -> std::process::Output {
    Command::new(program)
        .args(args)
        .output()
        .expect("run process")
}

fn wait_until_missing(path: &Path, attempts: usize, sleep_ms: u64) {
    for _ in 0..attempts {
        if !path.exists() {
            return;
        }
        std::thread::sleep(std::time::Duration::from_millis(sleep_ms));
    }
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
    assert!(stdout.contains("package"));
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
        "Usage: pulsec build [<entry.pulse>] [--project-root <dir>] [--source-root <dir>] [--profile <debug|release>] [--target <native-x64>] [--packaging-mode <staged|msi>] [--output-mode <fat|shared>] [--runtime-debug-allocator <on|off>] [--runtime-cycle-collector <on|off>] [--out-dir <dir>] [--linker <path>] [--assembler <path>] [--wix <path>] [--signtool <path>] [--msi]\n"
    );

    let test = run_pulsec(&["test", "--help"]);
    assert!(test.status.success());
    assert_eq!(
        norm(&test.stdout),
        "Usage: pulsec test [--project-root <dir>] [--source-root <dir>] [--strict-package|--friendly]\n"
    );

    let package = run_pulsec(&["package", "--help"]);
    assert!(package.status.success());
    assert_eq!(
        norm(&package.stdout),
        "Usage: pulsec package [<entry.pulse>] [--project-root <dir>] [--source-root <dir>] [--profile <debug|release>] [--target <native-x64>] [--packaging-mode <staged|msi>] [--output-mode <fat|shared>] [--runtime-debug-allocator <on|off>] [--runtime-cycle-collector <on|off>] [--out-dir <dir>] [--staging-dir <dir>] [--linker <path>] [--assembler <path>] [--wix <path>] [--signtool <path>] [--msi]\n"
    );
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
    let tests_keep = project.join("src").join("test").join("pulse").join(".gitkeep");
    assert!(manifest.exists(), "missing manifest '{}'", manifest.display());
    assert!(entry.exists(), "missing entry '{}'", entry.display());
    assert!(tests_keep.exists(), "missing tests placeholder");

    let manifest_text = read(&manifest).replace('\r', "");
    assert!(manifest_text.contains("[package]\nname = \"hello_app\""));
    assert!(manifest_text.contains("main_pulse = \"src/main/pulse\""));
    assert!(manifest_text.contains("entry = \"app/main/Main.pulse\""));
    assert!(manifest_text.contains("target = \"native-x64\""));
    assert!(manifest_text.contains("packaging_mode = \"staged\""));
    assert!(manifest_text.contains("output_mode = \"fat\""));
    assert!(manifest_text.contains("output_entry = \"main\""));
    assert!(manifest_text.contains("publisher = \"PulseCode\""));
    assert!(manifest_text.contains("identifier = \"com.pulse.hello_app\""));
    assert_eq!(
        read(&entry).replace('\r', ""),
        "package app.main;\nimport com.pulse.lang.IO;\n\nclass Main {\n    public static void main() {\n        IO.println(\"hello_app online\");\n    }\n}\n"
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
    assert!(manifest.exists(), "missing manifest '{}'", manifest.display());
    assert!(entry.exists(), "missing entry '{}'", entry.display());
    assert!(library.exists(), "missing library '{}'", library.display());

    let manifest_text = read(&manifest).replace('\r', "");
    assert!(manifest_text.contains("[package]\nname = \"core_lib\""));
    assert!(manifest_text.contains("entry = \"lib/core/Main.pulse\""));
    assert!(manifest_text.contains("target = \"native-x64\""));
    assert!(manifest_text.contains("packaging_mode = \"staged\""));
    assert!(manifest_text.contains("publisher = \"PulseCode\""));
    assert!(manifest_text.contains("identifier = \"com.pulse.core_lib\""));
    assert_eq!(
        read(&entry).replace('\r', ""),
        "package lib.core;\nimport com.pulse.lang.IO;\n\nclass Main {\n    public static void main() {\n        IO.println(Library.versionCode());\n    }\n}\n"
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
    assert!(stdout.contains("Build mode: profile=release"));
    assert!(stdout.contains("project_mode=manifest"));
    assert!(stdout.contains("output_dir="));
    assert!(stdout.contains("\\build\\distro\\release"));
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

    let manifest_release = run_pulsec(&["build", "--project-root", project.to_str().expect("utf8")]);
    assert!(
        manifest_release.status.success(),
        "release profile build should succeed\nstdout:\n{}\nstderr:\n{}",
        norm(&manifest_release.stdout),
        norm(&manifest_release.stderr)
    );
    let release_stdout = norm(&manifest_release.stdout);
    assert!(release_stdout.contains("Build mode: profile=release"));
    assert!(release_stdout.contains("project_mode=manifest"));
    assert!(release_stdout.contains("\\artifact_out"));

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
    assert!(override_stdout.contains("Build mode: profile=debug"));
    assert!(override_stdout.contains("project_mode=manifest"));
    assert!(override_stdout.contains("\\cli_out"));
}

#[test]
fn lock_d1_04_build_direct_mode_default_profile_and_status_summary_are_stable() {
    let root = unique_temp_root();
    let src = root.join("src");
    fs::create_dir_all(src.join("app").join("main")).expect("create dirs");
    let entry = src.join("app").join("main").join("Main.pulse");
    fs::write(
        &entry,
        "package app.main;\nimport com.pulse.lang.IO;\nclass Main {\n    public static void main() {\n        IO.println(\"direct_mode_ok\");\n    }\n}\n",
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
    assert!(stdout.contains("Build mode: profile=release"));
    assert!(stdout.contains("project_mode=direct"));
    assert!(stdout.contains("source_root="));
    assert!(stdout.contains("output_dir="));
    assert!(stdout.contains("\\build"));
    assert!(!stdout.contains("\\build\\debug"));
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
    assert!(stdout.contains("Build mode: profile=release"));
    assert!(stdout.contains("project_mode=direct"));
    assert!(stdout.contains("output_dir="));
    assert!(stdout.contains("\\build\\distro\\release"));
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
        "package app.tests;\nimport com.pulse.lang.IO;\nclass SmokeTest {\n    public static void main() {\n        IO.println(\"ok\");\n    }\n}\n",
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
fn lock_d1_06_package_staged_baseline_is_deterministic() {
    let root = unique_temp_root();
    let project_name = "package_stage";
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

    let output = run_pulsec(&["package", "--project-root", project.to_str().expect("utf8")]);
    if !command_supports_backend_artifacts(&output) {
        return;
    }
    let stdout = norm(&output.stdout);
    assert!(stdout.contains("Package summary: mode=staged status=ready"));
    assert!(stdout.contains("Package report:"));

    let report = project
        .join("build")
        .join("distro")
        .join("package")
        .join("package.report.txt");
    assert!(report.exists(), "missing package report '{}'", report.display());
    let content = read(&report);
    assert!(content.contains("schema=pulsec.package.report.v1"));
    assert!(content.contains("mode=staged"));
    assert!(content.contains("status=ready"));
    assert!(content.contains("entrypoint=package"));
    assert!(content.contains("layout_root="));
}

#[test]
fn lock_d1_06_build_msi_and_package_msi_share_entrypoint_contract() {
    let root = unique_temp_root();
    let project_name = "package_msi_contract";
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
    let fake_wix = create_fake_wix_cli(&project);

    let package_msi = run_pulsec(&[
        "package",
        "--project-root",
        project.to_str().expect("utf8"),
        "--msi",
        "--wix",
        fake_wix.to_str().expect("wix utf8"),
    ]);
    assert!(package_msi.status.success(), "package --msi should succeed with fake wix");
    let package_stdout = norm(&package_msi.stdout);
    let package_stderr = norm(&package_msi.stderr);
    assert!(package_stdout.contains("Package summary: mode=msi status=ready"));
    assert!(package_stdout.contains("MSI artifact:"));
    assert_eq!(package_stderr, "");
    assert_no_ansi(&package_stderr);

    let build_msi = run_pulsec(&[
        "build",
        "--project-root",
        project.to_str().expect("utf8"),
        "--msi",
        "--wix",
        fake_wix.to_str().expect("wix utf8"),
    ]);
    assert!(build_msi.status.success(), "build --msi should succeed with fake wix");
    let build_stdout = norm(&build_msi.stdout);
    let build_stderr = norm(&build_msi.stderr);
    assert!(build_stdout.contains("Build IR ready:"));
    assert!(build_stdout.contains("Package summary: mode=msi status=ready"));
    assert!(build_stdout.contains("MSI artifact:"));
    assert_eq!(build_stderr, "");
    assert_no_ansi(&build_stderr);

    let report = project
        .join("build")
        .join("distro")
        .join("package")
        .join("package.report.txt");
    assert!(report.exists(), "missing msi package report '{}'", report.display());
    let report_text = read(&report);
    assert!(report_text.contains("mode=msi"));
    assert!(report_text.contains("status=ready"));
    assert!(report_text.contains("msi_output="));
    assert!(report_text.contains("entrypoint=build --msi"));
}

#[test]
fn lock_d3_01_packaging_uses_build_output_as_staging_root() {
    let root = unique_temp_root();
    let project_name = "package_pipeline_contract";
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

    let output = run_pulsec(&["package", "--project-root", project.to_str().expect("utf8")]);
    if !command_supports_backend_artifacts(&output) {
        return;
    }

    let report = project
        .join("build")
        .join("distro")
        .join("package")
        .join("package.report.txt");
    assert!(report.exists(), "missing package report '{}'", report.display());
    let stdout = norm(&output.stdout);
    assert!(stdout.contains("staging_dir="));
    assert!(stdout.contains("build\\staging"));
}

#[test]
fn lock_d3_02_package_layout_is_deterministic_for_app_template() {
    let root = unique_temp_root();
    let project_name = "package_layout_app";
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

    let output = run_pulsec(&["package", "--project-root", project.to_str().expect("utf8")]);
    if !command_supports_backend_artifacts(&output) {
        return;
    }

    let stage_root = project.join("build").join("staging");
    assert!(stage_root.join("bin").join("launch.txt").exists());
    assert!(stage_root.join("assets").exists());
    assert!(stage_root.join("icons").exists());
    assert!(stage_root.join("licenses").exists());
    assert!(stage_root.join("docs").exists());
    assert!(stage_root.join("config").exists());
    assert!(stage_root.join("data").exists());
    assert!(stage_root.join("metadata").join("build.config.plan.json").exists());
    assert!(stage_root.join("metadata").join("native.plan.json").exists());
    assert!(stage_root.join("metadata").join("pulsec.ir.txt").exists());
    assert!(stage_root.join("logs").join("native.link.txt").exists());
    assert!(stage_root.join("obj").join("main.obj").exists());
}

#[test]
fn lock_d3_02_package_layout_is_deterministic_for_lib_template() {
    let root = unique_temp_root();
    let project_name = "package_layout_lib";
    let new_output = run_pulsec(&[
        "new",
        project_name,
        "--template",
        "lib",
        "--path",
        root.to_str().expect("root utf8"),
    ]);
    assert!(new_output.status.success(), "scaffold should succeed");
    let project = root.join(project_name);

    let output = run_pulsec(&["package", "--project-root", project.to_str().expect("utf8")]);
    if !command_supports_backend_artifacts(&output) {
        return;
    }

    let stage_root = project.join("build").join("staging");
    assert!(stage_root.join("bin").join("launch.txt").exists());
    assert!(stage_root.join("assets").exists());
    assert!(stage_root.join("icons").exists());
    assert!(stage_root.join("licenses").exists());
    assert!(stage_root.join("docs").exists());
    assert!(stage_root.join("config").exists());
    assert!(stage_root.join("data").exists());
    assert!(stage_root.join("metadata").join("build.config.plan.json").exists());
    assert!(stage_root.join("logs").join("native.link.txt").exists());
    assert!(stage_root.join("obj").join("main.obj").exists());
}

#[test]
fn lock_d3_03_manifest_payloads_are_staged_into_windows_layout() {
    let root = unique_temp_root();
    let project_name = "package_payloads";
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

    fs::create_dir_all(project.join("config")).expect("mkdir config");
    fs::create_dir_all(project.join("data")).expect("mkdir data");
    fs::create_dir_all(project.join("libs")).expect("mkdir libs");
    fs::create_dir_all(project.join("src").join("main").join("resources")).expect("mkdir resources");
    fs::write(project.join("LICENSE-CUSTOM.txt"), "custom license\n").expect("write license");
    fs::write(project.join("README-CUSTOM.md"), "# custom readme\n").expect("write readme");
    fs::write(project.join("config").join("app.conf"), "name=payload\n").expect("write config");
    fs::write(project.join("data").join("seed.json"), "{ \"seed\": 1 }\n").expect("write data");
    fs::write(project.join("libs").join("runtime.dll"), "dll\n").expect("write lib");
    fs::write(
        project.join("src").join("main").join("resources").join("icon.ico"),
        "icon\n",
    )
    .expect("write icon");
    fs::write(
        project
            .join("src")
            .join("main")
            .join("resources")
            .join("extra.asset"),
        "asset\n",
    )
    .expect("write asset");

    let manifest_path = project.join("pulsec.toml");
    let manifest = read(&manifest_path)
        .replace("license = \"LICENSE\"", "license = \"LICENSE-CUSTOM.txt\"")
        .replace("readme = \"README.md\"", "readme = \"README-CUSTOM.md\"")
        .replace("config = \"src/main/resources/config\"", "config = \"config\"")
        .replace("data = \"src/main/resources/data\"", "data = \"data\"")
        .replace("libraries = \"build/distro/libraries\"", "libraries = \"libs\"");
    fs::write(&manifest_path, manifest).expect("write manifest");

    let output = run_pulsec(&["package", "--project-root", project.to_str().expect("utf8")]);
    assert!(
        output.status.success(),
        "package should succeed\nstdout:\n{}\nstderr:\n{}",
        norm(&output.stdout),
        norm(&output.stderr)
    );

    let stage_root = project.join("build").join("staging");
    assert!(stage_root.join("licenses").join("LICENSE-CUSTOM.txt").exists());
    assert!(stage_root.join("docs").join("README-CUSTOM.md").exists());
    assert!(stage_root.join("config").join("app.conf").exists());
    assert!(stage_root.join("data").join("seed.json").exists());
    assert!(stage_root.join("bin").join("runtime.dll").exists());
    assert!(stage_root.join("icons").join("icon.ico").exists());
    assert!(stage_root.join("assets").join("extra.asset").exists());
}

#[test]
fn lock_d3_04_package_reuses_test_fixture_corpus_as_gate() {
    let root = unique_temp_root();
    let project_name = "package_test_gate_ok";
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
    fs::create_dir_all(&test_dir).expect("mkdir tests");
    fs::write(
        test_dir.join("SmokeTest.pulse"),
        "package app.tests;\nclass SmokeTest { public static void main() {} }\n",
    )
    .expect("write test");

    let output = run_pulsec(&["package", "--project-root", project.to_str().expect("utf8")]);
    assert!(
        output.status.success(),
        "package should succeed\nstdout:\n{}\nstderr:\n{}",
        norm(&output.stdout),
        norm(&output.stderr)
    );
    let report = read(
        &project
            .join("build")
            .join("distro")
            .join("package")
            .join("package.report.txt"),
    );
    assert!(report.contains("tests_total=1"));
    assert!(report.contains("tests_failed=0"));
}

#[test]
fn lock_d3_04_package_fails_when_fixture_tests_fail() {
    let root = unique_temp_root();
    let project_name = "package_test_gate_fail";
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
    fs::create_dir_all(&test_dir).expect("mkdir tests");
    fs::write(
        test_dir.join("BrokenTest.pulse"),
        "package app.tests;\nimport app.missing.Util;\nclass BrokenTest { public static void main() {} }\n",
    )
    .expect("write broken test");

    let output = run_pulsec(&["package", "--project-root", project.to_str().expect("utf8")]);
    assert_eq!(output.status.code(), Some(1));
    let stderr = norm(&output.stderr);
    assert!(stderr.contains("Packaging test gate failed"));
    assert!(stderr.contains("error[PULSEC:E_PACKAGE_FAILED]:"));
    assert!(stderr.contains("diag.code=PULSEC:E_PACKAGE_FAILED"));
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
    assert!(
        artifacts
            .join("artifact_stamp_app-0.1.0.exe")
            .exists()
    );
    assert!(!artifacts.join("artifact_stamp_app-0.1.0-pulsec.ir.txt").exists());
    assert!(!artifacts.join("artifact_stamp_app-0.1.0-native.plan.json").exists());
    assert!(!artifacts.join("artifact_stamp_app-0.1.0-native.link.txt").exists());
    assert!(!artifacts.join("artifact_stamp_app-0.1.0-build.config.plan.json").exists());
    assert!(!artifacts.join("stamp.txt").exists());
}

#[test]
fn lock_d3_05_package_emits_stamped_report_and_stage_metadata() {
    let root = unique_temp_root();
    let project_name = "package_stamp_app";
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

    let output = run_pulsec(&["package", "--project-root", project.to_str().expect("utf8")]);
    assert!(
        output.status.success(),
        "package should succeed\nstdout:\n{}\nstderr:\n{}",
        norm(&output.stdout),
        norm(&output.stderr)
    );
    let stdout = norm(&output.stdout);
    assert!(stdout.contains("artifact_stamp=package_stamp_app-0.1.0-release"));

    let report_root = project.join("build").join("distro").join("package");
    let canonical_report = report_root.join("package.report.txt");
    let stamped_report = report_root.join("package.package_stamp_app-0.1.0-release.report.txt");
    assert!(canonical_report.exists());
    assert!(stamped_report.exists());
    let canonical_text = read(&canonical_report);
    let stamped_text = read(&stamped_report);
    assert_eq!(canonical_text, stamped_text);
    assert!(canonical_text.contains("package_name=package_stamp_app"));
    assert!(canonical_text.contains("package_version=0.1.0"));
    assert!(canonical_text.contains("artifact_stamp=package_stamp_app-0.1.0-release"));

    let stage_stamp = read(
        &project
            .join("build")
            .join("staging")
            .join("metadata")
            .join("artifact.stamp.txt"),
    );
    assert!(stage_stamp.contains("schema=pulsec.artifact.stamp.v1"));
    assert!(stage_stamp.contains("name=package_stamp_app"));
    assert!(stage_stamp.contains("version=0.1.0"));
    assert!(stage_stamp.contains("profile=release"));
    assert!(stage_stamp.contains("stamp=package_stamp_app-0.1.0-release"));
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
        "[package]\nname = \"manifest_v1_ok\"\nversion = \"1.0.0\"\n\n[sources]\nmain_pulse = \"src/main/pulse\"\nmain_resources = \"src/main/resources\"\ntest_pulse = \"src/test/pulse\"\ntest_resources = \"src/test/resources\"\napi_pulse = \"src/api/pulse\"\napi_resources = \"src/api/resources\"\ndocs = \"docs\"\nlibraries = \"libraries\"\nentry = \"app/main/Main.pulse\"\n\n[build]\nprofile = \"debug\"\nout_dir = \"build/distro/debug\"\nasm_dir = \"build/asm\"\ngenerated_dir = \"build/generated\"\nassets_dir = \"build/assets\"\nsanity_dir = \"build/sanity\"\ntmp_dir = \"build/tmp\"\ndistro_dir = \"build/distro\"\n\n[toolchain]\nlinker = \"C:/toolchain/link.exe\"\n\n[package.metadata]\npublisher = \"Pulse Labs\"\nidentifier = \"com.pulse.manifest_v1_ok\"\n",
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
        project.join("build").join("staging"),
        project.join("build").join("distro"),
        project.join("build").join("distro").join("libraries"),
        project.join("build").join("distro").join("package"),
    ] {
        assert!(path.exists(), "missing default layout path '{}'", path.display());
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
    assert!(stdout.contains("\\build\\distro\\release"));
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
        project.join("code").join("main").join("app").join("core").join("Main.pulse"),
        "package app.core;\nclass Main { public static void main() {} }\n",
    )
    .expect("write main");
    fs::write(
        project.join("code").join("tests").join("app").join("tests").join("Smoke.pulse"),
        "package app.tests;\nclass Smoke { public static void main() {} }\n",
    )
    .expect("write test");

    let check = run_pulsec(&["check", "--project-root", project.to_str().expect("utf8")]);
    assert!(check.status.success(), "check should respect main_pulse override");

    let test = run_pulsec(&["test", "--project-root", project.to_str().expect("utf8")]);
    assert!(test.status.success(), "test should respect test_pulse override");
    assert!(norm(&test.stdout).contains("code\\tests"));

    let build = run_pulsec(&["build", "--project-root", project.to_str().expect("utf8")]);
    assert!(build.status.success(), "build should respect build dir overrides");
    let stdout = norm(&build.stdout);
    assert!(stdout.contains("\\out\\distro\\debug"));
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
        "[build]\nprofile = \"release\"\ntarget = \"native-x64\"\npackaging_mode = \"staged\"\noutput_mode = \"fat\"\noutput_entry = \"main\"\nruntime_debug_allocator = \"off\"\nruntime_cycle_collector = \"on\"\nasm_dir = \"build/asm\"\ngenerated_dir = \"build/generated\"\nassets_dir = \"build/assets\"\nsanity_dir = \"build/sanity\"\ntmp_dir = \"build/tmp\"\ndistro_dir = \"build/distro\"",
        "[build]\nprofile = \"release\"\ntarget = \"native-x64\"\npackaging_mode = \"staged\"\noutput_mode = \"shared\"\noutput_entry = \"launcher\"\nruntime_debug_allocator = \"on\"\nruntime_cycle_collector = \"off\"\nasm_dir = \"build/asm\"\ngenerated_dir = \"build/generated\"\nassets_dir = \"build/assets\"\nsanity_dir = \"build/sanity\"\ntmp_dir = \"build/tmp\"\ndistro_dir = \"build/distro\"",
    ).replace(
        "[toolchain]\n",
        "[toolchain]\nlinker = \"C:/tools/link.exe\"\nassembler = \"C:/tools/ml64.exe\"\nwix = \"C:/tools/wix.exe\"\n",
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
    assert!(stdout.contains("Build mode: profile=release target=native-x64") || norm(&build.stderr).contains("diag.code=PULSEC:E_BUILD_FAILED"));
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
    assert!(plan.exists(), "missing build config plan '{}'", plan.display());
    let plan_text = read(&plan);
    assert!(plan_text.contains("\"schema\": \"pulsec.build.config.v1\""));
    assert!(plan_text.contains("\"profile\": \"release\""));
    assert!(plan_text.contains("\"target\": \"native-x64\""));
    assert!(plan_text.contains("\"packaging_mode\": \"staged\""));
    assert!(plan_text.contains("\"mode\": \"shared\""));
    assert!(plan_text.contains("\"entry\": \"launcher\""));
    assert!(plan_text.contains("\"debug_allocator\": \"on\""));
    assert!(plan_text.contains("\"cycle_collector\": \"off\""));
    assert!(plan_text.contains("\"linker\": \"C:/tools/link.exe\""));
    assert!(plan_text.contains("\"assembler\": \"C:/tools/ml64.exe\""));
    assert!(plan_text.contains("\"wix\": \"C:/tools/wix.exe\""));

    let native_plan = project
        .join("build")
        .join("tmp")
        .join("backend")
        .join("release")
        .join("native.plan.json");
    assert!(native_plan.exists(), "missing native plan '{}'", native_plan.display());
    let native_plan_text = read(&native_plan);
    assert!(native_plan_text.contains("\"outputs\": {"));
    assert!(native_plan_text.contains("\"shared_boundary\": {"));
    assert!(native_plan_text.contains("\"schema\": \"pulsec.shared_boundary.v1\""));
    assert!(native_plan_text.contains("\"participants\": {"));
    assert!(native_plan_text.contains("\"app\": \"app_executable\""));
    assert!(native_plan_text.contains("\"runtime\": \"shared_runtime_library\""));
    assert!(native_plan_text.contains("\"ownership_boundary\": {"));
    assert!(native_plan_text.contains("\"cross_boundary_access\": \"procedure_imports_and_lookup_metadata_only\""));
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
    assert!(native_plan_text.contains(&format!(
        "\"version\": \"{}\"",
        env!("CARGO_PKG_VERSION")
    )));
    assert!(native_plan_text.contains("\"link_plan\": {"));
    assert!(native_plan_text.contains("\"shared_runtime_abi\": {"));
    assert!(native_plan_text.contains("\"schema\": \"pulsec.shared_runtime.abi.v1\""));
    assert!(native_plan_text.contains("\"mode\": \"shared\""));
    assert!(native_plan_text.contains("\"compatibility\": {"));
    assert!(native_plan_text.contains("\"runtime_abi_schema\": \"pulsec.runtime.abi.v1\""));
    assert!(native_plan_text.contains("\"runtime_abi_version\": 2"));
    assert!(native_plan_text.contains("\"object_model_abi_schema\": \"pulsec.object_model.abi.v1\""));
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
    assert!(native_plan_text.contains("\"weak_symbols\": [\"rt_weak_next\", \"rt_weak_free_head\", \"rt_weak_generation\"]"));
    assert!(native_plan_text.contains("\"container_registry_symbols\": [\"rt_arr_*\", \"rt_list_*\", \"rt_map_*\", \"rt_str_*\"]"));
    assert!(native_plan_text.contains("\"user_field_storage_runtime_dependency\": \"removed_in_e2_06\""));
    assert!(native_plan_text.contains("\"pulsec_rt_init\""));
    assert!(native_plan_text.contains("\"pulsec_rt_objectNew\""));
    assert!(native_plan_text.contains("\"pulsec_rt_arcRetain\""));
    assert!(native_plan_text.contains("\"pulsec_rt_dispatchNullReceiverPanic\""));
    assert!(native_plan_text.contains("\"pulsec_std_com_pulse_lang_IO_println\""));
    assert!(native_plan_text.contains("\"user_field_storage_imports\": \"removed_in_e2_06\""));
    assert!(native_plan_text.contains("\"init_sequence\": [\"startup_entry\", \"pulsec_rt_init\", \"app_entry\", \"pulsec_rt_shutdown\", \"ExitProcess\"]"));
    assert!(native_plan_text.contains("\"startup_objects\": [{ \"path\": \""));
    assert!(native_plan_text.contains("Startup.obj"));
    assert!(native_plan_text.contains("\"app_owned_objects\": ["));
    assert!(native_plan_text.contains("\"runtime_owned_objects\": [{ \"path\": \""));
    assert!(native_plan_text.contains("IO.obj"));
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
        "[build]\nprofile = \"release\"\ntarget = \"native-x64\"\npackaging_mode = \"staged\"\noutput_mode = \"fat\"\noutput_entry = \"main\"\nruntime_debug_allocator = \"off\"\nruntime_cycle_collector = \"on\"\nasm_dir = \"build/asm\"\ngenerated_dir = \"build/generated\"\nassets_dir = \"build/assets\"\nsanity_dir = \"build/sanity\"\ntmp_dir = \"build/tmp\"\ndistro_dir = \"build/distro\"",
        "[build]\nprofile = \"release\"\ntarget = \"native-x64\"\npackaging_mode = \"msi\"\noutput_mode = \"fat\"\noutput_entry = \"main\"\nruntime_debug_allocator = \"off\"\nruntime_cycle_collector = \"on\"\nasm_dir = \"build/asm\"\ngenerated_dir = \"build/generated\"\nassets_dir = \"build/assets\"\nsanity_dir = \"build/sanity\"\ntmp_dir = \"build/tmp\"\ndistro_dir = \"build/distro\"",
    );
    fs::write(&manifest_path, manifest).expect("write manifest");

    let build = run_pulsec(&[
        "build",
        "--project-root",
        project.to_str().expect("utf8"),
        "--profile",
        "debug",
        "--packaging-mode",
        "staged",
        "--runtime-debug-allocator",
        "on",
        "--runtime-cycle-collector",
        "off",
        "--wix",
        "C:/override/wix.exe",
    ]);
    assert!(build.status.success(), "build should succeed");
    let plan = project
        .join("build")
        .join("distro")
        .join("debug")
        .join("build_config_override-0.1.0-build.config.plan.json");
    let plan_text = read(&plan);
    assert!(plan_text.contains("\"profile\": \"debug\""));
    assert!(plan_text.contains("\"packaging_mode\": \"staged\""));
    assert!(plan_text.contains("\"debug_allocator\": \"on\""));
    assert!(plan_text.contains("\"cycle_collector\": \"off\""));
    assert!(plan_text.contains("\"wix\": \"C:/override/wix.exe\""));

    let native_plan = project
        .join("build")
        .join("distro")
        .join("debug")
        .join("build_config_override-0.1.0-native.plan.json");
    assert!(native_plan.exists(), "missing native plan '{}'", native_plan.display());
    let native_plan_text = read(&native_plan);
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
        "[build]\nprofile = \"release\"\ntarget = \"native-x64\"\npackaging_mode = \"staged\"\noutput_mode = \"fat\"\noutput_entry = \"main\"\nruntime_debug_allocator = \"off\"\nruntime_cycle_collector = \"on\"\nasm_dir = \"build/asm\"\ngenerated_dir = \"build/generated\"\nassets_dir = \"build/assets\"\nsanity_dir = \"build/sanity\"\ntmp_dir = \"build/tmp\"\ndistro_dir = \"build/distro\"",
        "[build]\nprofile = \"release\"\ntarget = \"native-x64\"\npackaging_mode = \"staged\"\noutput_mode = \"shared\"\noutput_entry = \"main\"\nruntime_debug_allocator = \"off\"\nruntime_cycle_collector = \"on\"\nasm_dir = \"build/asm\"\ngenerated_dir = \"build/generated\"\nassets_dir = \"build/assets\"\nsanity_dir = \"build/sanity\"\ntmp_dir = \"build/tmp\"\ndistro_dir = \"build/distro\"",
    );
    fs::write(&manifest_path, manifest).expect("write manifest");

    let release_build = run_pulsec(&["build", "--project-root", project.to_str().expect("utf8")]);
    if !release_build.status.success() && !command_supports_backend_artifacts(&release_build) {
        return;
    }
    assert!(release_build.status.success(), "shared release build should succeed");

    let release_dir = project.join("build").join("distro").join("release");
    let release_bin = release_dir.join("bin");
    let version = env!("CARGO_PKG_VERSION");
    assert!(release_bin.join("shared_artifact_lock-0.1.0.exe").exists());
    assert!(release_bin.join("launch.txt").exists());
    assert!(release_bin.join(format!("pulsecore-{version}.dll")).exists());
    assert!(release_bin.join(format!("pulsecore-{version}.lib")).exists());
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
    assert!(debug_build.status.success(), "shared debug build should succeed");

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
        assert!(debug_metadata.join(file).exists(), "missing shared debug artifact '{}'", debug_metadata.join(file).display());
    }
    assert!(!debug_dir.join("shared_artifact_lock-0.1.0-native.plan.json").exists());
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
    let fat_resources = fat_project
        .join("src")
        .join("main")
        .join("resources");
    fs::create_dir_all(fat_resources.join("images")).expect("create fat resources");
    fs::write(fat_resources.join("payload.txt"), "payload").expect("write fat payload");
    fs::write(fat_resources.join("images").join("icon.txt"), "icon").expect("write fat icon");

    let fat_release = run_pulsec(&["build", "--project-root", fat_project.to_str().expect("utf8")]);
    assert!(fat_release.status.success(), "fat release build should succeed");
    let fat_release_dir = fat_project.join("build").join("distro").join("release");
    assert!(fat_release_dir.join("fat_parity_artifacts-0.1.0.exe").exists());
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
    assert!(fat_debug_dir.join("fat_parity_artifacts-0.1.0.exe").exists());
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
    assert!(shared_new.status.success(), "shared scaffold should succeed");
    let shared_project = root.join(shared_project_name);
    let shared_manifest_path = shared_project.join("pulsec.toml");
    let shared_manifest = read(&shared_manifest_path).replace(
        "output_mode = \"fat\"",
        "output_mode = \"shared\"",
    );
    fs::write(&shared_manifest_path, shared_manifest).expect("write shared manifest");
    let shared_resources = shared_project
        .join("src")
        .join("main")
        .join("resources");
    fs::create_dir_all(shared_resources.join("images")).expect("create shared resources");
    fs::write(shared_resources.join("payload.txt"), "payload").expect("write shared payload");
    fs::write(shared_resources.join("images").join("icon.txt"), "icon").expect("write shared icon");

    let shared_release =
        run_pulsec(&["build", "--project-root", shared_project.to_str().expect("utf8")]);
    if !shared_release.status.success() && !command_supports_backend_artifacts(&shared_release) {
        return;
    }
    assert!(shared_release.status.success(), "shared release build should succeed");
    let shared_release_dir = shared_project.join("build").join("distro").join("release");
    let shared_release_bin = shared_release_dir.join("bin");
    let version = env!("CARGO_PKG_VERSION");
    assert!(shared_release_bin.join("shared_parity_artifacts-0.1.0.exe").exists());
    assert!(shared_release_bin.join("launch.txt").exists());
    assert!(shared_release_bin.join("payload.txt").exists());
    assert!(shared_release_bin.join("images").join("icon.txt").exists());
    assert!(shared_release_bin.join(format!("pulsecore-{version}.dll")).exists());
    assert!(shared_release_bin.join(format!("pulsecore-{version}.lib")).exists());
    assert!(!shared_release_dir.join("metadata").exists());
    assert!(!shared_release_dir.join("shared_parity_artifacts-0.1.0.exe").exists());

    let shared_debug = run_pulsec(&[
        "build",
        "--project-root",
        shared_project.to_str().expect("utf8"),
        "--profile",
        "debug",
    ]);
    assert!(shared_debug.status.success(), "shared debug build should succeed");
    let shared_debug_dir = shared_project.join("build").join("distro").join("debug");
    let shared_debug_bin = shared_debug_dir.join("bin");
    let shared_debug_metadata = shared_debug_dir.join("metadata");
    assert!(shared_debug_bin.join("shared_parity_artifacts-0.1.0.exe").exists());
    assert!(shared_debug_bin.join("launch.txt").exists());
    assert!(shared_debug_bin.join("payload.txt").exists());
    assert!(shared_debug_bin.join("images").join("icon.txt").exists());
    assert!(shared_debug_bin.join(format!("pulsecore-{version}.dll")).exists());
    assert!(shared_debug_bin.join(format!("pulsecore-{version}.lib")).exists());
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
    assert!(stderr.contains("[build].output_entry is required when [build].output_mode is 'shared'"));
    assert!(
        !project.join("build").join("distro").join("release").exists(),
        "invalid shared profile request must not publish distro output"
    );
}

#[test]
fn lock_d2_04_invalid_target_or_runtime_toggle_is_rejected() {
    let root = unique_temp_root();
    let project = root.join("bad_build_config");
    fs::create_dir_all(project.join("src").join("main").join("pulse").join("app").join("main"))
        .expect("mkdir");
    fs::write(
        project.join("src").join("main").join("pulse").join("app").join("main").join("Main.pulse"),
        "package app.main;\nclass Main { public static void main() {} }\n",
    )
    .expect("write source");
    fs::write(
        project.join("pulsec.toml"),
        "[package]\nname = \"bad_build_config\"\nversion = \"1.0.0\"\n\n[sources]\nmain_pulse = \"src/main/pulse\"\nentry = \"app/main/Main.pulse\"\n\n[build]\nprofile = \"debug\"\ntarget = \"native-arm64\"\noutput_mode = \"fat_binary\"\nruntime_debug_allocator = \"maybe\"\n",
    )
    .expect("write manifest");

    let build = run_pulsec(&["build", "--project-root", project.to_str().expect("utf8")]);
    assert_eq!(build.status.code(), Some(2));
    let stderr = norm(&build.stderr);
    assert!(stderr.contains("Manifest validation error"));
    assert!(
        stderr.contains("[build].target must be 'native-x64'")
            || stderr.contains("[build].runtime_debug_allocator must be 'on' or 'off'")
            || stderr.contains("[build].output_mode must be 'fat' or 'shared'")
    );
    assert!(stderr.contains("diag.code=PULSEC:E_USAGE"));
}

#[test]
fn lock_d2_05_msi_packaging_requires_manifest_metadata() {
    let root = unique_temp_root();
    let project_name = "msi_metadata_required";
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
        .replace("publisher = \"PulseCode\"", "publisher = \"\"")
        .replace("identifier = \"com.pulse.msi_metadata_required\"", "identifier = \"\"")
        .replace("install_scope = \"per-user\"", "install_scope = \"\"")
        .replace("entrypoints = \"app.main.Main\"", "entrypoints = \"\"")
        .replace("icons = \"src/main/resources/icon.ico\"", "icons = \"\"")
        .replace("assets = \"src/main/resources\"", "assets = \"\"");
    fs::write(&manifest_path, manifest).expect("write manifest");

    let output = run_pulsec(&[
        "package",
        "--project-root",
        project.to_str().expect("utf8"),
        "--msi",
    ]);
    assert_eq!(output.status.code(), Some(1));
    let stderr = norm(&output.stderr);
    assert!(stderr.contains("error[PULSEC:E_PACKAGE_FAILED]:"));
    assert!(stderr.contains("Packaging metadata validation failed for MSI: missing"));
    assert!(stderr.contains("[package.metadata].publisher"));
    assert!(stderr.contains("[package.metadata].identifier"));
    assert!(stderr.contains("[package.metadata].install_scope"));
    assert!(stderr.contains("[package.metadata].entrypoints"));
    assert!(stderr.contains("[package.metadata].icons"));
    assert!(stderr.contains("[package.metadata].assets"));
    assert!(stderr.contains("diag.code=PULSEC:E_PACKAGE_FAILED"));
}

#[test]
fn lock_d2_05_msi_packaging_rejects_invalid_install_scope() {
    let root = unique_temp_root();
    let project_name = "msi_invalid_scope";
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
    let manifest = read(&manifest_path).replace("install_scope = \"per-user\"", "install_scope = \"system\"");
    fs::write(&manifest_path, manifest).expect("write manifest");

    let output = run_pulsec(&[
        "package",
        "--project-root",
        project.to_str().expect("utf8"),
        "--msi",
    ]);
    assert_eq!(output.status.code(), Some(1));
    let stderr = norm(&output.stderr);
    assert!(stderr.contains("error[PULSEC:E_PACKAGE_FAILED]:"));
    assert!(
        stderr.contains("[package.metadata].install_scope must be 'per-user' or 'per-machine'")
    );
    assert!(stderr.contains("diag.code=PULSEC:E_PACKAGE_FAILED"));
}

#[test]
fn lock_d4_01_msi_backend_contract_emits_wix_boundary_and_template() {
    let root = unique_temp_root();
    let project_name = "msi_backend_contract";
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
    let fake_wix = create_fake_wix_cli(&project);

    let output = run_pulsec(&[
        "package",
        "--project-root",
        project.to_str().expect("utf8"),
        "--msi",
        "--wix",
        fake_wix.to_str().expect("wix utf8"),
    ]);
    assert!(output.status.success());

    let package_root = project.join("build").join("distro").join("package");
    let report = read(&package_root.join("package.report.txt"));
    assert!(report.contains("mode=msi"));
    assert!(report.contains("status=ready"));
    assert!(report.contains("msi_backend=wix"));
    assert!(report.contains("msi_upgrade_policy=in_place"));
    assert!(report.contains("msi_tool_status="));
    assert!(report.contains("msi_contract="));
    assert!(report.contains("msi_template_stub="));
    assert!(report.contains("msi_output="));

    let contract = package_root.join("msi.backend.contract.txt");
    let wxs = package_root.join("msi.template.stub.wxs");
    assert!(contract.exists(), "missing contract '{}'", contract.display());
    assert!(wxs.exists(), "missing template '{}'", wxs.display());

    let contract_text = read(&contract);
    assert!(contract_text.contains("schema=pulsec.msi.backend.contract.v1"));
    assert!(contract_text.contains("backend=wix"));
    assert!(contract_text.contains("backend_version_contract=v6"));
    assert!(contract_text.contains("upgrade_policy=in_place"));
    assert!(contract_text.contains("status="));

    let wxs_text = read(&wxs);
    assert!(wxs_text.contains("schema=pulsec.msi.template.stub.v1"));
    assert!(wxs_text.contains("http://wixtoolset.org/schemas/v4/wxs"));
}

#[test]
fn lock_d4_02_msi_template_translates_manifest_metadata_and_layout_policy() {
    let root = unique_temp_root();
    let project_name = "msi_template_translate";
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
    let fake_wix = create_fake_wix_cli(&project);

    let manifest_path = project.join("pulsec.toml");
    let manifest = read(&manifest_path)
        .replace("publisher = \"PulseCode\"", "publisher = \"Acme Studio\"")
        .replace(
            "identifier = \"com.pulse.msi_template_translate\"",
            "identifier = \"com.acme.template\"",
        )
        .replace("install_scope = \"per-user\"", "install_scope = \"per-machine\"")
        .replace("entrypoints = \"app.main.Main\"", "entrypoints = \"app.main.Main,app.main.Admin\"");
    fs::write(&manifest_path, manifest).expect("write manifest");

    let output = run_pulsec(&[
        "package",
        "--project-root",
        project.to_str().expect("utf8"),
        "--msi",
        "--wix",
        fake_wix.to_str().expect("wix utf8"),
    ]);
    assert!(output.status.success());

    let package_root = project.join("build").join("distro").join("package");
    let contract = read(&package_root.join("msi.backend.contract.txt"));
    assert!(contract.contains("publisher=Acme Studio"));
    assert!(contract.contains("identifier=com.acme.template"));
    assert!(contract.contains("install_scope=per-machine"));
    assert!(contract.contains("install_root=ProgramFiles64Folder"));
    assert!(contract.contains("shortcut_directory=ProgramMenuFolder"));
    assert!(contract.contains("entrypoints=app.main.Main,app.main.Admin"));
    assert!(contract.contains("primary_entrypoint=app.main.Main"));
    assert!(contract.contains("upgrade_code={"));

    let wxs = read(&package_root.join("msi.template.stub.wxs"));
    assert!(wxs.contains("publisher=Acme Studio"));
    assert!(wxs.contains("identifier=com.acme.template"));
    assert!(wxs.contains("install_scope=per-machine"));
    assert!(wxs.contains("entrypoints=app.main.Main,app.main.Admin"));
    assert!(wxs.contains("primary_entrypoint=app.main.Main"));
    assert!(wxs.contains("Manufacturer=\"Acme Studio\""));
    assert!(wxs.contains("Version=\"0.1.0\""));
    assert!(wxs.contains("StandardDirectory Id=\"ProgramFiles64Folder\""));
    assert!(wxs.contains("Directory=\"ProgramMenuFolder\""));
}

#[test]
fn lock_d4_03_package_msi_generates_artifact_with_wix_override() {
    let root = unique_temp_root();
    let project_name = "msi_generate";
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
    let fake_wix = create_fake_wix_cli(&project);

    let output = run_pulsec(&[
        "package",
        "--project-root",
        project.to_str().expect("utf8"),
        "--msi",
        "--wix",
        fake_wix.to_str().expect("wix utf8"),
    ]);
    assert!(
        output.status.success(),
        "package --msi should succeed\nstdout:\n{}\nstderr:\n{}",
        norm(&output.stdout),
        norm(&output.stderr)
    );
    let stdout = norm(&output.stdout);
    assert!(stdout.contains("Package summary: mode=msi status=ready"));
    assert!(stdout.contains("MSI artifact:"));

    let package_root = project.join("build").join("distro").join("package");
    let report = read(&package_root.join("package.report.txt"));
    assert!(report.contains("mode=msi"));
    assert!(report.contains("status=ready"));
    assert!(report.contains("msi_output="));
    assert!(report.contains("msi_build_log="));
    assert!(!report.contains("msi_error="));

    let msi_path = package_root.join("msi_generate-0.1.0-release.msi");
    assert!(msi_path.exists(), "missing msi artifact '{}'", msi_path.display());
    let build_log = package_root.join("msi.build.log.txt");
    assert!(build_log.exists(), "missing msi build log '{}'", build_log.display());
}

#[test]
fn lock_d4_04_msi_lifecycle_contract_locks_upgrade_and_side_by_side_policy() {
    let root = unique_temp_root();
    let project_name = "msi_lifecycle";
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
    let fake_wix = create_fake_wix_cli(&project);

    let v1_manifest_path = project.join("pulsec.toml");
    let v1_manifest = read(&v1_manifest_path)
        .replace("identifier = \"com.pulse.msi_lifecycle\"", "identifier = \"com.acme.lifecycle\"")
        .replace("install_scope = \"per-user\"", "install_scope = \"per-machine\"");
    fs::write(&v1_manifest_path, v1_manifest).expect("write v1 manifest");

    let output_v1 = run_pulsec(&[
        "package",
        "--project-root",
        project.to_str().expect("utf8"),
        "--msi",
        "--wix",
        fake_wix.to_str().expect("wix utf8"),
    ]);
    assert!(output_v1.status.success());
    let contract_v1 =
        read(&project.join("build").join("distro").join("package").join("msi.backend.contract.txt"));
    let upgrade_v1 = contract_v1
        .lines()
        .find(|line| line.starts_with("upgrade_code="))
        .expect("upgrade code v1");
    let product_v1 = contract_v1
        .lines()
        .find(|line| line.starts_with("product_code="))
        .expect("product code v1");
    assert!(contract_v1.contains("upgrade_behavior=major_upgrade_replace_existing"));
    assert!(contract_v1.contains("downgrade_policy=blocked"));
    assert!(contract_v1.contains("side_by_side_policy=forbid_same_identifier_same_scope"));
    assert!(contract_v1.contains("cross_scope_policy=allow_per_user_and_per_machine"));
    assert!(contract_v1.contains("uninstall_behavior=remove_install_folder_and_shortcuts"));

    let v2_manifest = read(&v1_manifest_path).replace("version = \"0.1.0\"", "version = \"0.2.0\"");
    fs::write(&v1_manifest_path, v2_manifest).expect("write v2 manifest");

    let output_v2 = run_pulsec(&[
        "package",
        "--project-root",
        project.to_str().expect("utf8"),
        "--msi",
        "--wix",
        fake_wix.to_str().expect("wix utf8"),
    ]);
    assert!(output_v2.status.success());
    let contract_v2 =
        read(&project.join("build").join("distro").join("package").join("msi.backend.contract.txt"));
    let upgrade_v2 = contract_v2
        .lines()
        .find(|line| line.starts_with("upgrade_code="))
        .expect("upgrade code v2");
    let product_v2 = contract_v2
        .lines()
        .find(|line| line.starts_with("product_code="))
        .expect("product code v2");

    assert_eq!(upgrade_v1, upgrade_v2, "upgrade code must stay stable across versions");
    assert_ne!(product_v1, product_v2, "product code must change across versions");

    let wxs = read(&project.join("build").join("distro").join("package").join("msi.template.stub.wxs"));
    assert!(wxs.contains("MajorUpgrade DowngradeErrorMessage="));
    assert!(wxs.contains("side_by_side_policy=forbid_same_identifier_same_scope"));
    assert!(wxs.contains("cross_scope_policy=allow_per_user_and_per_machine"));
    assert!(wxs.contains("RemoveFolder Id=\"RemoveInstallFolder\""));
}

#[test]
fn lock_d4_05_real_msi_roundtrip_validates_and_uninstalls_when_tooling_is_available() {
    let Some(wix) = real_wix_cli() else {
        return;
    };
    let root = unique_temp_root();
    let project_name = "msi_roundtrip";
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

    let output = run_pulsec(&[
        "package",
        "--project-root",
        project.to_str().expect("utf8"),
        "--msi",
        "--wix",
        wix.to_str().expect("wix utf8"),
    ]);
    assert!(
        output.status.success(),
        "real package --msi should succeed\nstdout:\n{}\nstderr:\n{}",
        norm(&output.stdout),
        norm(&output.stderr)
    );

    let package_root = project.join("build").join("distro").join("package");
    let msi_path = package_root.join("msi_roundtrip-0.1.0-release.msi");
    assert!(msi_path.exists(), "missing msi '{}'", msi_path.display());

    let validate = run_process(
        wix.to_str().expect("wix utf8"),
        &["msi", "validate", msi_path.to_str().expect("msi utf8")],
    );
    assert!(
        validate.status.success(),
        "wix msi validate failed\nstdout:\n{}\nstderr:\n{}",
        norm(&validate.stdout),
        norm(&validate.stderr)
    );

    let installed_exe = PathBuf::from(&std::env::var("LOCALAPPDATA").expect("LOCALAPPDATA"))
        .join(project_name)
        .join(format!("{project_name}-0.1.0.exe"));
    let install_dir = installed_exe.parent().expect("install dir");
    if install_dir.exists() {
        fs::remove_dir_all(install_dir).expect("cleanup prior install dir");
    }
    let shortcut = PathBuf::from(&std::env::var("USERPROFILE").expect("USERPROFILE"))
        .join("Desktop")
        .join(format!("{project_name}.lnk"));
    if shortcut.exists() {
        fs::remove_file(&shortcut).expect("cleanup prior shortcut");
    }

    let install_log = package_root.join("msiexec.install.log.txt");
    let install = run_process(
        "msiexec.exe",
        &[
            "/i",
            msi_path.to_str().expect("msi utf8"),
            "/qn",
            "/L*V",
            install_log.to_str().expect("log utf8"),
        ],
    );
    assert_eq!(install.status.code(), Some(0), "silent install should succeed");
    assert!(installed_exe.exists(), "installed exe missing '{}'", installed_exe.display());
    assert!(shortcut.exists(), "desktop shortcut missing '{}'", shortcut.display());

    let uninstall_log = package_root.join("msiexec.uninstall.log.txt");
    let uninstall = run_process(
        "msiexec.exe",
        &[
            "/x",
            msi_path.to_str().expect("msi utf8"),
            "/qn",
            "/L*V",
            uninstall_log.to_str().expect("log utf8"),
        ],
    );
    assert_eq!(uninstall.status.code(), Some(0), "silent uninstall should succeed");
    assert!(
        !installed_exe.exists(),
        "installed exe should be removed after uninstall '{}'",
        installed_exe.display()
    );
    assert!(
        !shortcut.exists(),
        "desktop shortcut should be removed after uninstall '{}'",
        shortcut.display()
    );
}

#[test]
fn lock_e3_10_shared_msi_template_includes_runtime_payloads() {
    let root = unique_temp_root();
    let project_name = "msi_shared_payloads";
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
    let manifest = read(&manifest_path).replace("output_mode = \"fat\"", "output_mode = \"shared\"");
    fs::write(&manifest_path, manifest).expect("write shared manifest");
    let resources = project.join("src").join("main").join("resources");
    fs::create_dir_all(resources.join("images")).expect("create resource dirs");
    fs::write(resources.join("payload.txt"), "payload").expect("write payload");
    fs::write(resources.join("images").join("icon.txt"), "icon").expect("write icon");
    let fake_wix = create_fake_wix_cli(&project);

    let output = run_pulsec(&[
        "package",
        "--project-root",
        project.to_str().expect("utf8"),
        "--msi",
        "--wix",
        fake_wix.to_str().expect("wix utf8"),
    ]);
    assert!(output.status.success(), "shared package --msi should succeed");

    let package_root = project.join("build").join("distro").join("package");
    let contract = read(&package_root.join("msi.backend.contract.txt"));
    let wxs = read(&package_root.join("msi.template.stub.wxs"));
    let version = env!("CARGO_PKG_VERSION");
    assert!(contract.contains("staged_payload_count="));
    assert!(wxs.contains("staged_payload_count="));
    assert!(wxs.contains(&format!("pulsecore-{version}.dll")));
    assert!(wxs.contains("payload.txt"));
    assert!(wxs.contains("images\\icon.txt") || wxs.contains("images/icon.txt"));
}

#[test]
fn lock_e3_10_real_msi_fat_and_shared_installs_are_runnable_with_expected_payloads() {
    let Some(wix) = real_wix_cli() else {
        return;
    };
    let root = unique_temp_root();
    let version = env!("CARGO_PKG_VERSION");

    for mode in ["fat", "shared"] {
        let project_name = format!("msi_{}_parity", mode);
        let new_output = run_pulsec(&[
            "new",
            &project_name,
            "--template",
            "app",
            "--path",
            root.to_str().expect("root utf8"),
        ]);
        assert!(new_output.status.success(), "scaffold should succeed for {}", mode);
        let project = root.join(&project_name);
        let resources = project.join("src").join("main").join("resources");
        fs::create_dir_all(resources.join("images")).expect("create resource dirs");
        fs::write(resources.join("payload.txt"), "payload").expect("write payload");
        fs::write(resources.join("images").join("icon.txt"), "icon").expect("write icon");
        if mode == "shared" {
            let manifest_path = project.join("pulsec.toml");
            let manifest =
                read(&manifest_path).replace("output_mode = \"fat\"", "output_mode = \"shared\"");
            fs::write(&manifest_path, manifest).expect("write shared manifest");
        }

        let package = run_pulsec(&[
            "package",
            "--project-root",
            project.to_str().expect("utf8"),
            "--msi",
            "--wix",
            wix.to_str().expect("wix utf8"),
        ]);
        assert!(
            package.status.success(),
            "{} package --msi should succeed\nstdout:\n{}\nstderr:\n{}",
            mode,
            norm(&package.stdout),
            norm(&package.stderr)
        );

        let package_root = project.join("build").join("distro").join("package");
        let msi_path = package_root.join(format!("{project_name}-0.1.0-release.msi"));
        assert!(msi_path.exists(), "missing msi '{}'", msi_path.display());
        let validate = run_process(
            wix.to_str().expect("wix utf8"),
            &["msi", "validate", msi_path.to_str().expect("msi utf8")],
        );
        assert!(
            validate.status.success(),
            "{} wix msi validate failed\nstdout:\n{}\nstderr:\n{}",
            mode,
            norm(&validate.stdout),
            norm(&validate.stderr)
        );

        let install_dir = PathBuf::from(&std::env::var("LOCALAPPDATA").expect("LOCALAPPDATA"))
            .join(&project_name);
        if install_dir.exists() {
            fs::remove_dir_all(&install_dir).expect("cleanup prior install dir");
        }
        let shortcut = PathBuf::from(&std::env::var("USERPROFILE").expect("USERPROFILE"))
            .join("Desktop")
            .join(format!("{project_name}.lnk"));
        if shortcut.exists() {
            fs::remove_file(&shortcut).expect("cleanup prior shortcut");
        }

        let install = run_process(
            "msiexec.exe",
            &["/i", msi_path.to_str().expect("msi utf8"), "/qn"],
        );
        assert_eq!(
            install.status.code(),
            Some(0),
            "{} silent install should succeed",
            mode
        );

        let installed_exe = install_dir.join(format!("{project_name}-0.1.0.exe"));
        assert!(installed_exe.exists(), "installed exe missing '{}'", installed_exe.display());
        assert!(install_dir.join("payload.txt").exists(), "installed payload missing for {}", mode);
        assert!(
            install_dir.join("images").join("icon.txt").exists(),
            "installed nested payload missing for {}",
            mode
        );
        if mode == "shared" {
            assert!(
                install_dir.join(format!("pulsecore-{version}.dll")).exists(),
                "installed shared runtime dll missing"
            );
        }

        let expected_exe = if mode == "shared" {
            project
                .join("build")
                .join("distro")
                .join("release")
                .join("bin")
                .join(format!("{project_name}-0.1.0.exe"))
        } else {
            project
                .join("build")
                .join("distro")
                .join("release")
                .join(format!("{project_name}-0.1.0.exe"))
        };
        let expected_run = Command::new(&expected_exe).output().expect("run release exe");
        assert!(expected_run.status.success(), "release exe should run for {}", mode);
        let installed_run = Command::new(&installed_exe).output().expect("run installed exe");
        assert!(installed_run.status.success(), "installed exe should run for {}", mode);
        assert_eq!(norm(&installed_run.stdout), norm(&expected_run.stdout));

        let uninstall = run_process(
            "msiexec.exe",
            &["/x", msi_path.to_str().expect("msi utf8"), "/qn"],
        );
        assert_eq!(
            uninstall.status.code(),
            Some(0),
            "{} uninstall should succeed",
            mode
        );
        let _ = shortcut;
    }
}

#[test]
fn lock_d4_05_real_msi_repair_and_upgrade_behave_predictably_when_tooling_is_available() {
    let Some(wix) = real_wix_cli() else {
        return;
    };
    let root = unique_temp_root();
    let project_name = "msi_upgrade";
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
    let unique_suffix = root
        .file_name()
        .and_then(|s| s.to_str())
        .unwrap_or("lock");
    let unique_identifier = format!("com.pulse.{project_name}.{unique_suffix}");
    let manifest = read(&manifest_path).replace(
        "identifier = \"com.pulse.msi_upgrade\"",
        &format!("identifier = \"{unique_identifier}\""),
    );
    fs::write(&manifest_path, manifest).expect("write unique identifier");

    let package_v1 = run_pulsec(&[
        "package",
        "--project-root",
        project.to_str().expect("utf8"),
        "--msi",
        "--wix",
        wix.to_str().expect("wix utf8"),
    ]);
    assert!(package_v1.status.success(), "v1 package should succeed");

    let package_root = project.join("build").join("distro").join("package");
    let msi_v1 = package_root.join("msi_upgrade-0.1.0-release.msi");
    let installed_exe = PathBuf::from(&std::env::var("LOCALAPPDATA").expect("LOCALAPPDATA"))
        .join(project_name)
        .join(format!("{project_name}-0.1.0.exe"));
    let install_dir = installed_exe.parent().expect("install dir");
    if install_dir.exists() {
        fs::remove_dir_all(install_dir).expect("cleanup prior install dir");
    }

    let install_v1 = run_process(
        "msiexec.exe",
        &["/i", msi_v1.to_str().expect("msi utf8"), "/qn"],
    );
    assert_eq!(install_v1.status.code(), Some(0), "v1 install should succeed");
    assert!(installed_exe.exists(), "v1 installed exe missing");

    fs::remove_file(&installed_exe).expect("delete installed exe before repair");
    assert!(!installed_exe.exists(), "installed exe should be deleted before repair");
    let repair = run_process(
        "msiexec.exe",
        &["/fa", msi_v1.to_str().expect("msi utf8"), "/qn"],
    );
    assert_eq!(repair.status.code(), Some(0), "repair should succeed");
    assert!(installed_exe.exists(), "repair should restore installed exe");

    let manifest_v2 = read(&manifest_path).replace("version = \"0.1.0\"", "version = \"0.2.0\"");
    fs::write(&manifest_path, manifest_v2).expect("write v2 manifest");

    let package_v2 = run_pulsec(&[
        "package",
        "--project-root",
        project.to_str().expect("utf8"),
        "--msi",
        "--wix",
        wix.to_str().expect("wix utf8"),
    ]);
    assert!(package_v2.status.success(), "v2 package should succeed");

    let msi_v2 = package_root.join("msi_upgrade-0.2.0-release.msi");
    let upgrade = run_process(
        "msiexec.exe",
        &["/i", msi_v2.to_str().expect("msi utf8"), "/qn"],
    );
    assert_eq!(upgrade.status.code(), Some(0), "upgrade install should succeed");
    let installed_exe_v2 = PathBuf::from(&std::env::var("LOCALAPPDATA").expect("LOCALAPPDATA"))
        .join(project_name)
        .join(format!("{project_name}-0.2.0.exe"));
    assert!(
        installed_exe_v2.exists(),
        "v2 installed exe should exist after upgrade"
    );

    let uninstall = run_process(
        "msiexec.exe",
        &["/x", msi_v2.to_str().expect("msi utf8"), "/qn"],
    );
    assert_eq!(uninstall.status.code(), Some(0), "post-upgrade uninstall should succeed");
    assert!(
        !installed_exe_v2.exists(),
        "installed exe should be removed after uninstall"
    );
}

#[test]
fn lock_e3_11_real_msi_fat_and_shared_repair_upgrade_and_uninstall_parity_are_stable() {
    let Some(wix) = real_wix_cli() else {
        return;
    };
    let root = unique_temp_root();
    let version = env!("CARGO_PKG_VERSION");

    for mode in ["fat", "shared"] {
        let project_name = format!("msi_{}_lifecycle_parity", mode);
        let new_output = run_pulsec(&[
            "new",
            &project_name,
            "--template",
            "app",
            "--path",
            root.to_str().expect("root utf8"),
        ]);
        assert!(new_output.status.success(), "scaffold should succeed for {}", mode);
        let project = root.join(&project_name);
        let resources = project.join("src").join("main").join("resources");
        fs::create_dir_all(resources.join("images")).expect("create resource dirs");
        fs::write(resources.join("payload.txt"), "payload").expect("write payload");
        fs::write(resources.join("images").join("icon.txt"), "icon").expect("write icon");
        if mode == "shared" {
            let manifest_path = project.join("pulsec.toml");
            let manifest =
                read(&manifest_path).replace("output_mode = \"fat\"", "output_mode = \"shared\"");
            fs::write(&manifest_path, manifest).expect("write shared manifest");
        }

        let package_v1 = run_pulsec(&[
            "package",
            "--project-root",
            project.to_str().expect("utf8"),
            "--msi",
            "--wix",
            wix.to_str().expect("wix utf8"),
        ]);
        assert!(package_v1.status.success(), "v1 package should succeed for {}", mode);
        let package_root = project.join("build").join("distro").join("package");
        let msi_v1 = package_root.join(format!("{project_name}-0.1.0-release.msi"));
        let install_dir = PathBuf::from(&std::env::var("LOCALAPPDATA").expect("LOCALAPPDATA"))
            .join(&project_name);
        if install_dir.exists() {
            fs::remove_dir_all(&install_dir).expect("cleanup prior install dir");
        }

        let install_v1 = run_process(
            "msiexec.exe",
            &["/i", msi_v1.to_str().expect("msi utf8"), "/qn"],
        );
        assert_eq!(install_v1.status.code(), Some(0), "v1 install should succeed for {}", mode);

        let installed_exe_v1 = install_dir.join(format!("{project_name}-0.1.0.exe"));
        let installed_payload = install_dir.join("payload.txt");
        let installed_nested_payload = install_dir.join("images").join("icon.txt");
        assert!(installed_exe_v1.exists(), "v1 exe missing for {}", mode);
        assert!(installed_payload.exists(), "v1 payload missing for {}", mode);
        assert!(
            installed_nested_payload.exists(),
            "v1 nested payload missing for {}",
            mode
        );
        let shared_runtime_dll = install_dir.join(format!("pulsecore-{version}.dll"));
        if mode == "shared" {
            assert!(shared_runtime_dll.exists(), "v1 shared runtime dll missing");
        }

        fs::remove_file(&installed_exe_v1).expect("delete v1 exe before repair");
        if mode == "shared" {
            fs::remove_file(&shared_runtime_dll).expect("delete shared dll before repair");
        }
        let repair = run_process(
            "msiexec.exe",
            &["/fa", msi_v1.to_str().expect("msi utf8"), "/qn"],
        );
        assert_eq!(repair.status.code(), Some(0), "repair should succeed for {}", mode);
        assert!(installed_exe_v1.exists(), "repair should restore exe for {}", mode);
        if mode == "shared" {
            assert!(shared_runtime_dll.exists(), "repair should restore shared dll");
        }

        let manifest_path = project.join("pulsec.toml");
        let manifest_v2 = read(&manifest_path).replace("version = \"0.1.0\"", "version = \"0.2.0\"");
        fs::write(&manifest_path, manifest_v2).expect("write v2 manifest");
        let package_v2 = run_pulsec(&[
            "package",
            "--project-root",
            project.to_str().expect("utf8"),
            "--msi",
            "--wix",
            wix.to_str().expect("wix utf8"),
        ]);
        assert!(package_v2.status.success(), "v2 package should succeed for {}", mode);
        let msi_v2 = package_root.join(format!("{project_name}-0.2.0-release.msi"));
        let upgrade = run_process(
            "msiexec.exe",
            &["/i", msi_v2.to_str().expect("msi utf8"), "/qn"],
        );
        assert_eq!(upgrade.status.code(), Some(0), "upgrade should succeed for {}", mode);
        let installed_exe_v2 = install_dir.join(format!("{project_name}-0.2.0.exe"));
        assert!(installed_exe_v2.exists(), "v2 exe missing for {}", mode);
        let installed_run = Command::new(&installed_exe_v2).output().expect("run v2 installed exe");
        assert!(installed_run.status.success(), "v2 installed exe should run for {}", mode);
        if mode == "shared" {
            assert!(shared_runtime_dll.exists(), "shared dll should remain present after upgrade");
        }

        let uninstall = run_process(
            "msiexec.exe",
            &["/x", msi_v2.to_str().expect("msi utf8"), "/qn"],
        );
        assert_eq!(uninstall.status.code(), Some(0), "uninstall should succeed for {}", mode);
        wait_until_missing(&installed_exe_v2, 15, 200);
        wait_until_missing(&installed_payload, 15, 200);
        wait_until_missing(&installed_nested_payload, 15, 200);
        assert!(!installed_exe_v2.exists(), "v2 exe should be removed for {}", mode);
        assert!(!installed_payload.exists(), "payload should be removed for {}", mode);
        assert!(
            !installed_nested_payload.exists(),
            "nested payload should be removed for {}",
            mode
        );
        if mode == "shared" {
            wait_until_missing(&shared_runtime_dll, 15, 200);
            assert!(!shared_runtime_dll.exists(), "shared dll should be removed on uninstall");
        }
    }
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
    let fat_release = run_pulsec(&["build", "--project-root", fat_project.to_str().expect("utf8")]);
    assert!(fat_release.status.success(), "fat release build should succeed");
    let fat_release_dir = fat_project.join("build").join("distro").join("release");
    assert!(fat_release_dir.join("fat_parity_snapshot-0.1.0.exe").exists());
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
    assert!(shared_new.status.success(), "shared scaffold should succeed");
    let shared_project = root.join(shared_project_name);
    let shared_manifest_path = shared_project.join("pulsec.toml");
    let shared_manifest =
        read(&shared_manifest_path).replace("output_mode = \"fat\"", "output_mode = \"shared\"");
    fs::write(&shared_manifest_path, shared_manifest).expect("write shared manifest");
    let shared_release =
        run_pulsec(&["build", "--project-root", shared_project.to_str().expect("utf8")]);
    if !shared_release.status.success() && !command_supports_backend_artifacts(&shared_release) {
        return;
    }
    assert!(shared_release.status.success(), "shared release build should succeed");
    let shared_release_dir = shared_project.join("build").join("distro").join("release");
    assert!(shared_release_dir.join("bin").exists());
    assert!(!shared_release_dir.join("metadata").exists());
    assert!(!shared_release_dir.join("shared_parity_snapshot-0.1.0.exe").exists());
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
    assert!(diag_new.status.success(), "shared diag scaffold should succeed");
    let diag_project = root.join(missing_payload_project_name);
    let diag_manifest_path = diag_project.join("pulsec.toml");
    let diag_manifest =
        read(&diag_manifest_path).replace("output_mode = \"fat\"", "output_mode = \"shared\"");
    fs::write(&diag_manifest_path, diag_manifest).expect("write diag manifest");
    let diag_build =
        run_pulsec(&["build", "--project-root", diag_project.to_str().expect("utf8")]);
    if !diag_build.status.success() && !command_supports_backend_artifacts(&diag_build) {
        return;
    }
    assert!(diag_build.status.success(), "shared diag build should succeed");
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
fn lock_d4_06_release_package_surfaces_explicit_unsigned_policy() {
    let root = unique_temp_root();
    let project_name = "msi_unsigned_policy";
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
    let fake_wix = create_fake_wix_cli(&project);

    let output = run_pulsec(&[
        "package",
        "--project-root",
        project.to_str().expect("utf8"),
        "--msi",
        "--wix",
        fake_wix.to_str().expect("wix utf8"),
    ]);
    assert!(output.status.success(), "unsigned release package should still succeed");

    let package_root = project.join("build").join("distro").join("package");
    let report = read(&package_root.join("package.report.txt"));
    assert!(report.contains("status=ready"));
    assert!(report.contains("signing_status=unsigned"));
    assert!(report.contains("signing_backend=none"));
    assert!(report.contains("signing_policy=release_optional_unsigned_fallback"));
    assert!(report.contains("signing_reason=policy_explicit_unsigned"));
    assert!(report.contains("signing_plan="));
    assert!(report.contains("signing_log=<none>"));

    let plan = read(&package_root.join("signing.plan.txt"));
    assert!(plan.contains("schema=pulsec.signing.plan.v1"));
    assert!(plan.contains("signing_mode=unsigned"));
    assert!(plan.contains("signing_status=unsigned"));
    assert!(plan.contains("signing_reason=policy_explicit_unsigned"));
}

#[test]
fn lock_d4_06_release_package_runs_signtool_hook_when_configured() {
    let root = unique_temp_root();
    let project_name = "msi_signtool";
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
    let fake_wix = create_fake_wix_cli(&project);
    let fake_signtool = create_fake_signtool_cli(&project);

    let manifest_path = project.join("pulsec.toml");
    let manifest = read(&manifest_path).replace(
        "signing_mode = \"unsigned\"",
        "signing_mode = \"signtool\"\nsigning_subject = \"Pulse Labs\"\nsigning_timestamp_url = \"https://timestamp.acme.test\"",
    );
    fs::write(&manifest_path, manifest).expect("write manifest");

    let output = run_pulsec(&[
        "package",
        "--project-root",
        project.to_str().expect("utf8"),
        "--msi",
        "--wix",
        fake_wix.to_str().expect("wix utf8"),
        "--signtool",
        fake_signtool.to_str().expect("signtool utf8"),
    ]);
    assert!(
        output.status.success(),
        "signtool-backed release package should succeed\nstdout:\n{}\nstderr:\n{}",
        norm(&output.stdout),
        norm(&output.stderr)
    );

    let package_root = project.join("build").join("distro").join("package");
    let report = read(&package_root.join("package.report.txt"));
    assert!(report.contains("signing_status=signed"));
    assert!(report.contains("signing_backend=signtool"));
    assert!(report.contains("signing_reason=signtool_success"));
    assert!(report.contains("signing_tool_status=available"));
    assert!(report.contains("signing_log="));

    let plan = read(&package_root.join("signing.plan.txt"));
    assert!(plan.contains("signing_mode=signtool"));
    assert!(plan.contains("signing_subject=Pulse Labs"));
    assert!(plan.contains("signing_timestamp_url=https://timestamp.acme.test"));
    assert!(plan.contains("signing_status=signed"));

    let log = read(&package_root.join("signing.log.txt"));
    assert!(log.contains("schema=pulsec.signing.log.v1"));
    assert!(log.contains("Successfully signed"));
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
    assert!(stderr.contains("[build].output_entry is required when [build].output_mode is 'shared'"));
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
    fs::write(workspace_root.join("pulsec.toml"), workspace_manifest).expect("write workspace manifest");

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
            "package app.tests;\nimport com.pulse.lang.IO;\nclass SmokeTest { public static void main() { IO.println(\"ok\"); } }\n",
        )
        .expect("write smoke test");
    }
    (root, workspace_root, app_a, app_b)
}

#[test]
fn lock_d2_06_workspace_check_runs_all_members() {
    let (_root, workspace_root, _app_a, _app_b) = create_workspace_fixture();
    let output = run_pulsec(&["check", "--project-root", workspace_root.to_str().expect("utf8")]);
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
    let output = run_pulsec(&["build", "--project-root", workspace_root.to_str().expect("utf8")]);
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
    let output = run_pulsec(&["test", "--project-root", workspace_root.to_str().expect("utf8")]);
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

#[test]
fn lock_d2_06_workspace_package_runs_all_members() {
    let (_root, workspace_root, _app_a, _app_b) = create_workspace_fixture();
    let output = run_pulsec(&["package", "--project-root", workspace_root.to_str().expect("utf8")]);
    assert!(
        output.status.success(),
        "workspace package should succeed\nstdout:\n{}\nstderr:\n{}",
        norm(&output.stdout),
        norm(&output.stderr)
    );
    let stdout = norm(&output.stdout);
    assert!(stdout.contains("Workspace package:"));
    assert!(stdout.matches("[PASS]").count() >= 2);
    assert!(stdout.contains("app_a"));
    assert!(stdout.contains("app_b"));
    assert!(stdout.contains("Workspace package summary: failed=0 total=2"));
}
