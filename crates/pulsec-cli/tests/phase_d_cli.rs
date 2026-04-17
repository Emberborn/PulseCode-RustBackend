mod common;
// Target-neutral project lifecycle/publication coverage. This uses the current
// host/bootstrap lane only as a transport for portable workflow assertions.

use std::fs;
use std::path::{Path, PathBuf};
use std::process::Command;
use std::sync::atomic::{AtomicU64, Ordering};
use std::time::{SystemTime, UNIX_EPOCH};

fn run_pulsec(args: &[&str]) -> std::process::Output {
    common::pulsec_command()
        .args(args)
        .output()
        .expect("run pulsec")
}

fn norm(bytes: &[u8]) -> String {
    String::from_utf8_lossy(bytes).replace('\r', "")
}

fn unique_temp_root() -> PathBuf {
    static NEXT_ID: AtomicU64 = AtomicU64::new(1);
    let nanos = SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .expect("system time")
        .as_nanos();
    let id = NEXT_ID.fetch_add(1, Ordering::Relaxed);
    let root = std::env::temp_dir().join(format!(
        "pulsec_phase_d_cli_{}_{}_{}",
        std::process::id(),
        nanos,
        id
    ));
    fs::create_dir_all(&root).expect("create temp root");
    root
}

fn fixture_root(name: &str) -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("tests")
        .join("fixtures")
        .join(name)
}

fn copy_dir_recursive(src: &Path, dst: &Path) {
    fs::create_dir_all(dst).expect("create destination dir");
    for entry in fs::read_dir(src).expect("read source dir").flatten() {
        let src_path = entry.path();
        let dst_path = dst.join(entry.file_name());
        if src_path.is_dir() {
            copy_dir_recursive(&src_path, &dst_path);
        } else {
            fs::copy(&src_path, &dst_path).expect("copy file");
        }
    }
}

fn replace_manifest_entry(project: &Path, entry: &str) {
    let manifest_path = project.join("pulsec.toml");
    let manifest = fs::read_to_string(&manifest_path)
        .expect("read manifest")
        .replace(
            "entry = \"app/main/Main.pulse\"",
            &format!("entry = \"{}\"", entry),
        );
    fs::write(&manifest_path, manifest).expect("write manifest");
}

fn write_resource_file(project: &Path, relative: &str, content: &str) {
    let path = project
        .join("src")
        .join("main")
        .join("resources")
        .join(relative);
    if let Some(parent) = path.parent() {
        fs::create_dir_all(parent).expect("create resource dir");
    }
    fs::write(path, content).expect("write resource");
}

fn set_manifest_output_mode(project: &Path, mode: &str) {
    let manifest_path = project.join("pulsec.toml");
    let manifest = fs::read_to_string(&manifest_path)
        .expect("read manifest")
        .replace(
            "output_mode = \"fat\"",
            &format!("output_mode = \"{}\"", mode),
        );
    fs::write(&manifest_path, manifest).expect("write manifest");
}

fn assert_no_pdb_files(root: &Path) {
    if !root.exists() {
        return;
    }
    for entry in fs::read_dir(root).expect("read dir").flatten() {
        let path = entry.path();
        if path.is_dir() {
            assert_no_pdb_files(&path);
        } else {
            let ext = path
                .extension()
                .and_then(|ext| ext.to_str())
                .unwrap_or_default()
                .to_ascii_lowercase();
            assert_ne!(ext, "pdb", "unexpected pdb artifact '{}'", path.display());
        }
    }
}

fn install_runtime_mix_fixture(project: &Path) {
    let main_root = project.join("src").join("main").join("pulse");
    let test_root = project.join("src").join("test").join("pulse");
    let _ = fs::remove_dir_all(main_root.join("app").join("main"));
    copy_dir_recursive(
        &fixture_root("runtime_mix")
            .join("src")
            .join("app")
            .join("runtime"),
        &main_root.join("app").join("runtime"),
    );
    replace_manifest_entry(project, "app/runtime/Main.pulse");
    let smoke = test_root
        .join("app")
        .join("runtime")
        .join("LifecycleSmokeTest.pulse");
    if let Some(parent) = smoke.parent() {
        fs::create_dir_all(parent).expect("create test dir");
    }
    fs::write(
        smoke,
        "package app.runtime.tests;\nimport static pulse.lang.IO.*;\nclass LifecycleSmokeTest { public static void main() { println(\"runtime_test_ok\"); } }\n",
    )
    .expect("write smoke test");
}

fn install_object_interface_mix_fixture(project: &Path) {
    let main_root = project.join("src").join("main").join("pulse");
    let test_root = project.join("src").join("test").join("pulse");
    let _ = fs::remove_dir_all(main_root.join("app").join("main"));
    copy_dir_recursive(
        &fixture_root("object_interface_mix")
            .join("src")
            .join("app")
            .join("mixed"),
        &main_root.join("app").join("mixed"),
    );
    replace_manifest_entry(project, "app/mixed/Main.pulse");
    let smoke = test_root
        .join("app")
        .join("mixed")
        .join("LifecycleSmokeTest.pulse");
    if let Some(parent) = smoke.parent() {
        fs::create_dir_all(parent).expect("create test dir");
    }
    fs::write(
        smoke,
        "package app.mixed.tests;\nimport pulse.lang.IO;\nclass LifecycleSmokeTest { public static void main() { IO.println(\"mixed_test_ok\"); } }\n",
    )
    .expect("write smoke test");
}

#[test]
fn d5_02_cli_project_lifecycle_runs_end_to_end_on_real_fixture_project() {
    let root = unique_temp_root();
    let project_name = "runtime_lifecycle";
    let new_output = run_pulsec(&[
        "new",
        project_name,
        "--template",
        "app",
        "--path",
        root.to_str().expect("root utf8"),
    ]);
    assert!(
        new_output.status.success(),
        "new should succeed\nstdout:\n{}\nstderr:\n{}",
        norm(&new_output.stdout),
        norm(&new_output.stderr)
    );

    let project = root.join(project_name);
    install_runtime_mix_fixture(&project);
    write_resource_file(&project, "payload.txt", "payload");
    write_resource_file(&project, "images/icon.txt", "icon");

    let check = run_pulsec(&["check", "--project-root", project.to_str().expect("utf8")]);
    assert!(
        check.status.success(),
        "check should succeed\nstdout:\n{}\nstderr:\n{}",
        norm(&check.stdout),
        norm(&check.stderr)
    );
    assert!(norm(&check.stdout).contains("OK:"));

    let build = run_pulsec(&["build", "--project-root", project.to_str().expect("utf8")]);
    assert!(
        build.status.success(),
        "build should succeed\nstdout:\n{}\nstderr:\n{}",
        norm(&build.stdout),
        norm(&build.stderr)
    );
    let build_stdout = norm(&build.stdout);
    assert!(build_stdout.contains("Build mode: profile=release"));
    assert!(build_stdout.contains("project_mode=manifest"));
    let exe = project
        .join("build")
        .join("distro")
        .join("release")
        .join("runtime_lifecycle-0.1.0.exe");
    let asm_dir = project.join("build").join("asm");
    let generated_dir = project.join("build").join("generated");
    let build_assets_dir = project.join("build").join("assets");
    let release_dir = project.join("build").join("distro").join("release");
    assert!(exe.exists(), "missing exe '{}'", exe.display());
    assert!(
        asm_dir
            .join("app")
            .join("runtime")
            .join("Main.asm")
            .exists(),
        "missing asm copy '{}'",
        asm_dir
            .join("app")
            .join("runtime")
            .join("Main.asm")
            .display()
    );
    assert!(
        !asm_dir.join("pulsec.ir.txt").exists(),
        "ir should not be copied into asm dir"
    );
    assert!(
        generated_dir
            .join("app")
            .join("runtime")
            .join("Main.obj")
            .exists(),
        "missing generated obj '{}'",
        generated_dir
            .join("app")
            .join("runtime")
            .join("Main.obj")
            .display()
    );
    assert!(
        !generated_dir
            .join("app")
            .join("runtime")
            .join("Main.asm")
            .exists(),
        "asm should not be copied into generated dir"
    );
    assert!(
        build_assets_dir.join("payload.txt").exists(),
        "missing copied build asset '{}'",
        build_assets_dir.join("payload.txt").display()
    );
    assert!(
        !build_assets_dir.join("resources").exists(),
        "build assets dir should not wrap contents in a resources folder"
    );
    assert!(
        release_dir.join("payload.txt").exists(),
        "missing published release resource '{}'",
        release_dir.join("payload.txt").display()
    );
    assert!(
        release_dir.join("images").join("icon.txt").exists(),
        "missing published release resource '{}'",
        release_dir.join("images").join("icon.txt").display()
    );
    assert!(
        !release_dir.join("resources").exists(),
        "release dir should not wrap contents in a resources folder"
    );
    assert!(
        !release_dir
            .join("runtime_lifecycle-0.1.0-build.config.plan.json")
            .exists(),
        "release dir should not publish build config diagnostics"
    );
    assert!(
        !release_dir
            .join("runtime_lifecycle-0.1.0-native.link.txt")
            .exists(),
        "release dir should not publish link diagnostics"
    );
    assert!(
        !release_dir
            .join("runtime_lifecycle-0.1.0-native.plan.json")
            .exists(),
        "release dir should not publish native plan diagnostics"
    );
    assert!(
        !release_dir
            .join("runtime_lifecycle-0.1.0-pulsec.ir.txt")
            .exists(),
        "release dir should not publish ir diagnostics"
    );
    assert!(
        !release_dir.join("stamp.txt").exists(),
        "release dir should not publish stamp metadata"
    );
    let run = Command::new(&exe).output().expect("run exe");
    assert!(run.status.success(), "exe failed");
    assert_eq!(norm(&run.stdout), "runtime_mix_ok\n");

    let test = run_pulsec(&["test", "--project-root", project.to_str().expect("utf8")]);
    assert!(
        test.status.success(),
        "test should succeed\nstdout:\n{}\nstderr:\n{}",
        norm(&test.stdout),
        norm(&test.stderr)
    );
    let test_stdout = norm(&test.stdout);
    assert!(test_stdout.contains("Test discovery:"));
    assert!(test_stdout.contains("passed=1 failed=0 total=1"));
}

#[test]
fn e1_11_shared_profile_build_publishes_bin_lib_and_metadata_layout() {
    let root = unique_temp_root();
    let project_name = "shared_layout";
    let new_output = run_pulsec(&[
        "new",
        project_name,
        "--template",
        "app",
        "--path",
        root.to_str().expect("root utf8"),
    ]);
    assert!(
        new_output.status.success(),
        "new should succeed\nstdout:\n{}\nstderr:\n{}",
        norm(&new_output.stdout),
        norm(&new_output.stderr)
    );

    let project = root.join(project_name);
    install_runtime_mix_fixture(&project);
    write_resource_file(&project, "payload.txt", "payload");
    write_resource_file(&project, "images/icon.txt", "icon");
    set_manifest_output_mode(&project, "shared");

    let release_build = run_pulsec(&["build", "--project-root", project.to_str().expect("utf8")]);
    assert!(
        release_build.status.success(),
        "shared release build should succeed\nstdout:\n{}\nstderr:\n{}",
        norm(&release_build.stdout),
        norm(&release_build.stderr)
    );

    let release_dir = project.join("build").join("distro").join("release");
    let release_bin = release_dir.join("bin");
    let release_exe = release_bin.join("shared_layout-0.1.0.exe");
    let release_launch = release_bin.join("launch.txt");
    assert!(release_bin.exists(), "missing shared release bin dir");
    assert!(
        release_exe.exists(),
        "missing shared release exe '{}'",
        release_exe.display()
    );
    assert!(
        release_launch.exists(),
        "missing shared release launch metadata"
    );
    assert!(
        release_bin.join("payload.txt").exists(),
        "missing shared release payload '{}' ",
        release_bin.join("payload.txt").display()
    );
    assert!(
        release_bin.join("images").join("icon.txt").exists(),
        "missing shared release nested payload '{}'",
        release_bin.join("images").join("icon.txt").display()
    );
    assert!(
        !release_dir.join("shared_layout-0.1.0.exe").exists(),
        "shared release exe should not be published at profile root"
    );
    let version = env!("CARGO_PKG_VERSION");
    assert!(
        release_bin
            .join(format!("pulsecore-{version}.dll"))
            .exists(),
        "missing shared release runtime library"
    );
    assert!(
        release_bin
            .join(format!("pulsecore-{version}.lib"))
            .exists(),
        "missing shared release import library"
    );
    let release_launch_text = norm(&fs::read(release_launch).expect("read shared release launch"));
    assert!(release_launch_text.contains("schema=pulsec.shared.launch.v1"));
    assert!(release_launch_text.contains("mode=shared"));
    assert!(release_launch_text.contains("runtime_load=peer_runtime_library"));
    assert!(release_launch_text.contains("lookup_policy=relative-sibling-runtime"));
    assert!(release_launch_text.contains("runtime_abi_schema=pulsec.runtime.abi.v1"));
    assert!(release_launch_text.contains("runtime_abi_version=2"));
    assert!(release_launch_text.contains("object_model_abi_schema=pulsec.object_model.abi.v1"));
    assert!(release_launch_text.contains("object_model_abi_version=1"));
    assert!(release_launch_text.contains("mismatch_policy=deterministic-fail-fast"));
    assert!(release_launch_text.contains("missing_runtime_policy=deterministic-fail-fast"));
    assert!(release_launch_text.contains("missing_import_policy=deterministic-fail-fast"));
    assert!(release_launch_text.contains("runtime_abi_mismatch_message=Runtime ABI mismatch"));
    assert!(
        release_launch_text.contains("object_model_abi_mismatch_message=Object model ABI mismatch")
    );
    assert!(release_launch_text.contains("required_runtime_imports=pulsec_rt_init"));
    assert!(release_launch_text.contains("runtime_library=pulsecore-"));
    assert!(release_launch_text.contains(".dll"));
    assert!(release_launch_text.contains("runtime_import_library=pulsecore-"));
    assert!(release_launch_text.contains(".lib"));
    let release_run = Command::new(&release_exe)
        .output()
        .expect("run shared release exe");
    assert!(release_run.status.success(), "shared release exe failed");
    assert_eq!(norm(&release_run.stdout), "runtime_mix_ok\n");

    let debug_build = run_pulsec(&[
        "build",
        "--project-root",
        project.to_str().expect("utf8"),
        "--profile",
        "debug",
    ]);
    assert!(
        debug_build.status.success(),
        "shared debug build should succeed\nstdout:\n{}\nstderr:\n{}",
        norm(&debug_build.stdout),
        norm(&debug_build.stderr)
    );

    let debug_dir = project.join("build").join("distro").join("debug");
    let debug_bin = debug_dir.join("bin");
    let debug_metadata = debug_dir.join("metadata");
    let debug_exe = debug_bin.join("shared_layout-0.1.0.exe");
    let debug_launch = debug_bin.join("launch.txt");
    assert!(debug_bin.exists(), "missing shared debug bin dir");
    assert!(debug_metadata.exists(), "missing shared debug metadata dir");
    assert!(
        debug_exe.exists(),
        "missing shared debug exe '{}'",
        debug_exe.display()
    );
    assert!(
        debug_launch.exists(),
        "missing shared debug launch metadata"
    );
    assert!(
        debug_bin.join("payload.txt").exists(),
        "missing shared debug payload"
    );
    assert!(
        debug_bin.join(format!("pulsecore-{version}.dll")).exists(),
        "missing shared debug runtime library"
    );
    assert!(
        debug_bin.join(format!("pulsecore-{version}.lib")).exists(),
        "missing shared debug import library"
    );
    let debug_launch_text = norm(&fs::read(&debug_launch).expect("read shared debug launch"));
    assert!(debug_launch_text.contains("mismatch_policy=deterministic-fail-fast"));
    assert!(debug_launch_text.contains("missing_runtime_policy=deterministic-fail-fast"));
    assert!(debug_launch_text.contains("missing_import_policy=deterministic-fail-fast"));
    for file in [
        "shared_layout-0.1.0-build.config.plan.json",
        "shared_layout-0.1.0-native.link.txt",
        "shared_layout-0.1.0-native.plan.json",
        "shared_layout-0.1.0-pulsec.ir.txt",
        "stamp.txt",
    ] {
        assert!(
            debug_metadata.join(file).exists(),
            "missing shared debug metadata '{}'",
            debug_metadata.join(file).display()
        );
    }
    assert!(
        !debug_dir.join("stamp.txt").exists(),
        "shared debug stamp should live under metadata"
    );
    let debug_launch_text = norm(&fs::read(&debug_launch).expect("read shared debug launch"));
    assert!(debug_launch_text.contains("schema=pulsec.shared.launch.v1"));
    assert!(debug_launch_text.contains("runtime_library=pulsecore-"));
    assert!(debug_launch_text.contains("runtime_import_library=pulsecore-"));
    let debug_run = Command::new(&debug_exe)
        .output()
        .expect("run shared debug exe");
    assert!(debug_run.status.success(), "shared debug exe failed");
    assert_eq!(norm(&debug_run.stdout), "runtime_mix_ok\n");
}

#[test]
fn e1_13_shared_profile_debug_release_publication_rules_are_locked() {
    let root = unique_temp_root();
    let project_name = "shared_profile_rules";
    let new_output = run_pulsec(&[
        "new",
        project_name,
        "--template",
        "app",
        "--path",
        root.to_str().expect("root utf8"),
    ]);
    assert!(
        new_output.status.success(),
        "new should succeed\nstdout:\n{}\nstderr:\n{}",
        norm(&new_output.stdout),
        norm(&new_output.stderr)
    );

    let project = root.join(project_name);
    install_runtime_mix_fixture(&project);
    write_resource_file(&project, "payload.txt", "payload");
    set_manifest_output_mode(&project, "shared");

    let release_build = run_pulsec(&["build", "--project-root", project.to_str().expect("utf8")]);
    assert!(
        release_build.status.success(),
        "shared release build should succeed"
    );

    let release_dir = project.join("build").join("distro").join("release");
    assert!(
        release_dir.join("bin").exists(),
        "missing shared release bin dir"
    );
    assert!(
        !release_dir.join("metadata").exists(),
        "shared release must not publish debug metadata dir"
    );
    for file in [
        "shared_profile_rules-0.1.0-build.config.plan.json",
        "shared_profile_rules-0.1.0-native.link.txt",
        "shared_profile_rules-0.1.0-native.plan.json",
        "shared_profile_rules-0.1.0-pulsec.ir.txt",
        "stamp.txt",
    ] {
        assert!(
            !release_dir.join(file).exists(),
            "shared release must not publish debug diagnostic '{}'",
            release_dir.join(file).display()
        );
    }
    assert_no_pdb_files(&release_dir);

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
    let debug_metadata = debug_dir.join("metadata");
    assert!(
        debug_dir.join("bin").exists(),
        "missing shared debug bin dir"
    );
    assert!(debug_metadata.exists(), "missing shared debug metadata dir");
    for file in [
        "shared_profile_rules-0.1.0-build.config.plan.json",
        "shared_profile_rules-0.1.0-native.link.txt",
        "shared_profile_rules-0.1.0-native.plan.json",
        "shared_profile_rules-0.1.0-pulsec.ir.txt",
        "stamp.txt",
    ] {
        assert!(
            debug_metadata.join(file).exists(),
            "shared debug must publish metadata '{}'",
            debug_metadata.join(file).display()
        );
    }
    assert!(
        !debug_dir
            .join("shared_profile_rules-0.1.0-build.config.plan.json")
            .exists(),
        "shared debug metadata must stay under metadata/"
    );
    assert_no_pdb_files(&debug_dir);
}

#[test]
fn e3_07_debug_release_behavior_and_developer_visible_outputs_are_locked_for_fat_and_shared() {
    let root = unique_temp_root();

    let fat_new = run_pulsec(&[
        "new",
        "fat_profile_parity",
        "--template",
        "app",
        "--path",
        root.to_str().expect("root utf8"),
    ]);
    assert!(
        fat_new.status.success(),
        "fat project scaffold should succeed"
    );
    let fat_project = root.join("fat_profile_parity");
    install_runtime_mix_fixture(&fat_project);
    write_resource_file(&fat_project, "payload.txt", "payload");

    let shared_new = run_pulsec(&[
        "new",
        "shared_profile_parity",
        "--template",
        "app",
        "--path",
        root.to_str().expect("root utf8"),
    ]);
    assert!(
        shared_new.status.success(),
        "shared project scaffold should succeed"
    );
    let shared_project = root.join("shared_profile_parity");
    install_runtime_mix_fixture(&shared_project);
    write_resource_file(&shared_project, "payload.txt", "payload");
    set_manifest_output_mode(&shared_project, "shared");

    let fat_release = run_pulsec(&[
        "build",
        "--project-root",
        fat_project.to_str().expect("utf8"),
    ]);
    assert!(
        fat_release.status.success(),
        "fat release build should succeed"
    );
    let fat_release_exe = fat_project
        .join("build")
        .join("distro")
        .join("release")
        .join("fat_profile_parity-0.1.0.exe");
    assert!(fat_release_exe.exists(), "missing fat release exe");
    assert_eq!(
        norm(
            &Command::new(&fat_release_exe)
                .output()
                .expect("run fat release exe")
                .stdout
        ),
        "runtime_mix_ok\n"
    );
    let fat_release_dir = fat_project.join("build").join("distro").join("release");
    assert!(!fat_release_dir
        .join("fat_profile_parity-0.1.0-native.link.txt")
        .exists());
    assert!(!fat_release_dir
        .join("fat_profile_parity-0.1.0-native.plan.json")
        .exists());
    assert!(!fat_release_dir
        .join("fat_profile_parity-0.1.0-pulsec.ir.txt")
        .exists());
    assert!(!fat_release_dir.join("stamp.txt").exists());

    let fat_debug = run_pulsec(&[
        "build",
        "--project-root",
        fat_project.to_str().expect("utf8"),
        "--profile",
        "debug",
    ]);
    assert!(fat_debug.status.success(), "fat debug build should succeed");
    let fat_debug_dir = fat_project.join("build").join("distro").join("debug");
    let fat_debug_exe = fat_debug_dir.join("fat_profile_parity-0.1.0.exe");
    assert!(fat_debug_exe.exists(), "missing fat debug exe");
    assert_eq!(
        norm(
            &Command::new(&fat_debug_exe)
                .output()
                .expect("run fat debug exe")
                .stdout
        ),
        "runtime_mix_ok\n"
    );
    for file in [
        "fat_profile_parity-0.1.0-build.config.plan.json",
        "fat_profile_parity-0.1.0-native.link.txt",
        "fat_profile_parity-0.1.0-native.plan.json",
        "fat_profile_parity-0.1.0-pulsec.ir.txt",
        "stamp.txt",
    ] {
        assert!(
            fat_debug_dir.join(file).exists(),
            "missing fat debug diagnostic '{file}'"
        );
    }

    let shared_release = run_pulsec(&[
        "build",
        "--project-root",
        shared_project.to_str().expect("utf8"),
    ]);
    assert!(
        shared_release.status.success(),
        "shared release build should succeed"
    );
    let shared_release_dir = shared_project.join("build").join("distro").join("release");
    let shared_release_exe = shared_release_dir
        .join("bin")
        .join("shared_profile_parity-0.1.0.exe");
    assert!(shared_release_exe.exists(), "missing shared release exe");
    assert_eq!(
        norm(
            &Command::new(&shared_release_exe)
                .output()
                .expect("run shared release exe")
                .stdout
        ),
        "runtime_mix_ok\n"
    );
    assert!(shared_release_dir.join("bin").join("payload.txt").exists());
    assert!(!shared_release_dir.join("metadata").exists());

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
    let shared_debug_exe = shared_debug_dir
        .join("bin")
        .join("shared_profile_parity-0.1.0.exe");
    assert!(shared_debug_exe.exists(), "missing shared debug exe");
    assert_eq!(
        norm(
            &Command::new(&shared_debug_exe)
                .output()
                .expect("run shared debug exe")
                .stdout
        ),
        "runtime_mix_ok\n"
    );
    let shared_metadata = shared_debug_dir.join("metadata");
    assert!(shared_metadata.exists(), "missing shared debug metadata");
    for file in [
        "shared_profile_parity-0.1.0-build.config.plan.json",
        "shared_profile_parity-0.1.0-native.link.txt",
        "shared_profile_parity-0.1.0-native.plan.json",
        "shared_profile_parity-0.1.0-pulsec.ir.txt",
        "stamp.txt",
    ] {
        assert!(
            shared_metadata.join(file).exists(),
            "missing shared debug diagnostic '{file}'"
        );
    }
}

#[test]
fn d5_02_cli_workspace_lifecycle_runs_on_real_fixture_members() {
    let root = unique_temp_root();
    let workspace_root = root.join("fixture_workspace");
    fs::create_dir_all(&workspace_root).expect("mkdir workspace");

    let runtime_new = run_pulsec(&[
        "new",
        "runtime_app",
        "--template",
        "app",
        "--path",
        workspace_root.to_str().expect("workspace utf8"),
    ]);
    assert!(
        runtime_new.status.success(),
        "runtime app scaffold must succeed"
    );
    let battle_new = run_pulsec(&[
        "new",
        "battle_app",
        "--template",
        "app",
        "--path",
        workspace_root.to_str().expect("workspace utf8"),
    ]);
    assert!(
        battle_new.status.success(),
        "battle app scaffold must succeed"
    );

    install_runtime_mix_fixture(&workspace_root.join("runtime_app"));
    install_object_interface_mix_fixture(&workspace_root.join("battle_app"));
    fs::write(
        workspace_root.join("pulsec.toml"),
        "[workspace]\nmembers = \"runtime_app, battle_app\"\n",
    )
    .expect("write workspace manifest");

    let check = run_pulsec(&[
        "check",
        "--project-root",
        workspace_root.to_str().expect("workspace utf8"),
    ]);
    assert!(
        check.status.success(),
        "workspace check should succeed\nstdout:\n{}\nstderr:\n{}",
        norm(&check.stdout),
        norm(&check.stderr)
    );
    let check_stdout = norm(&check.stdout);
    assert!(check_stdout.contains("Workspace check:"));
    assert!(check_stdout.contains("runtime_app"));
    assert!(check_stdout.contains("battle_app"));
    assert!(check_stdout.contains("passed=2 failed=0 total=2"));

    let build = run_pulsec(&[
        "build",
        "--project-root",
        workspace_root.to_str().expect("workspace utf8"),
    ]);
    assert!(
        build.status.success(),
        "workspace build should succeed\nstdout:\n{}\nstderr:\n{}",
        norm(&build.stdout),
        norm(&build.stderr)
    );
    let build_stdout = norm(&build.stdout);
    assert!(build_stdout.contains("Workspace build:"));
    assert!(build_stdout.contains("runtime_app"));
    assert!(build_stdout.contains("battle_app"));
    assert!(build_stdout.contains("failed=0 total=2"));

    let test = run_pulsec(&[
        "test",
        "--project-root",
        workspace_root.to_str().expect("workspace utf8"),
    ]);
    assert!(
        test.status.success(),
        "workspace test should succeed\nstdout:\n{}\nstderr:\n{}",
        norm(&test.stdout),
        norm(&test.stderr)
    );
    let test_stdout = norm(&test.stdout);
    assert!(test_stdout.contains("Workspace test:"));
    assert!(test_stdout.contains("runtime_app"));
    assert!(test_stdout.contains("battle_app"));
    assert!(test_stdout.contains("passed=2 failed=0 total=2"));
}
