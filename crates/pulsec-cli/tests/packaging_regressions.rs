use std::fs;
use std::path::{Path, PathBuf};
use std::process::Command;
use std::sync::atomic::{AtomicU64, Ordering};
use std::time::{SystemTime, UNIX_EPOCH};

fn run_pulsec(args: &[&str]) -> std::process::Output {
    Command::new(env!("CARGO_BIN_EXE_pulsec"))
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
        "pulsec_packaging_regressions_{}_{}_{}",
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

fn create_fake_wix_failure_cli(root: &Path) -> PathBuf {
    let script = root.join("fake_wix_fail.cmd");
    let body = "@echo off\r\n\
if \"%1\"==\"--version\" (\r\n\
  echo 6.0.2-fake\r\n\
  exit /b 0\r\n\
)\r\n\
if \"%1\"==\"build\" (\r\n\
  echo wix build failure 1>&2\r\n\
  exit /b 9\r\n\
)\r\n\
exit /b 2\r\n";
    fs::write(&script, body).expect("write fake wix fail");
    script
}

fn create_fake_signtool_failure_cli(root: &Path) -> PathBuf {
    let script = root.join("fake_signtool_fail.cmd");
    let body = "@echo off\r\n\
if \"%1\"==\"/?\" (\r\n\
  echo SignTool Fake 10.0\r\n\
  exit /b 0\r\n\
)\r\n\
if /I \"%1\"==\"sign\" (\r\n\
  echo signing failed 1>&2\r\n\
  exit /b 7\r\n\
)\r\n\
exit /b 2\r\n";
    fs::write(&script, body).expect("write fake signtool fail");
    script
}

fn scaffold_app(root: &Path, project_name: &str) -> PathBuf {
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
        "scaffold should succeed\nstdout:\n{}\nstderr:\n{}",
        norm(&output.stdout),
        norm(&output.stderr)
    );
    root.join(project_name)
}

fn write_resource_file(project: &Path, relative: &str, content: &str) {
    let path = project.join("src").join("main").join("resources").join(relative);
    if let Some(parent) = path.parent() {
        fs::create_dir_all(parent).expect("create resource dir");
    }
    fs::write(path, content).expect("write resource");
}

fn set_manifest_output_mode(project: &Path, mode: &str) {
    let manifest_path = project.join("pulsec.toml");
    let manifest = read(&manifest_path).replace(
        "output_mode = \"fat\"",
        &format!("output_mode = \"{}\"", mode),
    );
    fs::write(&manifest_path, manifest).expect("write manifest");
}

#[test]
fn d5_03_staged_package_snapshot_is_stable_for_app_project() {
    let root = unique_temp_root();
    let project = scaffold_app(&root, "package_snapshot");
    write_resource_file(&project, "payload.txt", "payload");

    let output = run_pulsec(&["package", "--project-root", project.to_str().expect("utf8")]);
    assert!(
        output.status.success(),
        "package should succeed\nstdout:\n{}\nstderr:\n{}",
        norm(&output.stdout),
        norm(&output.stderr)
    );

    let stage_root = project.join("build").join("staging");
    for rel in [
        "bin",
        "assets",
        "icons",
        "licenses",
        "docs",
        "config",
        "data",
        "metadata",
        "logs",
        "obj",
    ] {
        assert!(
            stage_root.join(rel).exists(),
            "missing staged path '{}'",
            stage_root.join(rel).display()
        );
    }

    let report_root = project.join("build").join("distro").join("package");
    let report = read(&report_root.join("package.report.txt"));
    let stamp = read(&stage_root.join("metadata").join("artifact.stamp.txt"));
    let signing_plan = read(&report_root.join("signing.plan.txt"));
    assert!(
        stage_root.join("assets").join("payload.txt").exists(),
        "missing flattened staged asset '{}'",
        stage_root.join("assets").join("payload.txt").display()
    );
    assert!(
        !stage_root.join("assets").join("resources").exists(),
        "staged assets should contain resource contents, not a top-level resources directory"
    );
    assert!(report.contains("schema=pulsec.package.report.v1"));
    assert!(report.contains("mode=staged"));
    assert!(report.contains("status=ready"));
    assert!(report.contains("signing_status=unsigned"));
    assert!(report.contains("signing_reason=policy_explicit_unsigned"));
    assert!(stamp.contains("schema=pulsec.artifact.stamp.v1"));
    assert!(stamp.contains("name=package_snapshot"));
    assert!(stamp.contains("version=0.1.0"));
    assert!(signing_plan.contains("schema=pulsec.signing.plan.v1"));
    assert!(signing_plan.contains("signing_status=unsigned"));
    assert!(signing_plan.contains("signing_target="));
}

#[test]
fn d5_03_msi_failure_emits_stable_report_and_build_log() {
    let root = unique_temp_root();
    let project = scaffold_app(&root, "package_msi_fail");
    let fake_wix = create_fake_wix_failure_cli(&project);

    let output = run_pulsec(&[
        "package",
        "--project-root",
        project.to_str().expect("utf8"),
        "--msi",
        "--wix",
        fake_wix.to_str().expect("wix utf8"),
    ]);
    assert_eq!(output.status.code(), Some(1));
    let stderr = norm(&output.stderr);
    assert!(stderr.contains("error[PULSEC:E_PACKAGE_FAILED]:"));
    assert!(stderr.contains("MSI generation failed:"));
    assert!(stderr.contains("diag.code=PULSEC:E_PACKAGE_FAILED"));

    let report_root = project.join("build").join("distro").join("package");
    let report = read(&report_root.join("package.report.txt"));
    let msi_log = read(&report_root.join("msi.build.log.txt"));
    let signing_plan = read(&report_root.join("signing.plan.txt"));
    assert!(report.contains("mode=msi"));
    assert!(report.contains("status=failed"));
    assert!(report.contains("msi_backend=wix"));
    assert!(report.contains("msi_tool_status=available"));
    assert!(report.contains("msi_output=<none>"));
    assert!(report.contains("msi_build_log="));
    assert!(report.contains("msi_error=WiX build failed"));
    assert!(msi_log.contains("schema=pulsec.msi.build.log.v1"));
    assert!(msi_log.contains("status="));
    assert!(msi_log.contains("[stderr]"));
    assert!(msi_log.contains("wix build failure"));
    assert!(signing_plan.contains("signing_status=unsigned"));
    assert!(signing_plan.contains("signing_reason=no_signable_artifact"));
}

#[test]
fn d5_03_release_signing_failure_is_deterministic_and_logged() {
    let root = unique_temp_root();
    let project = scaffold_app(&root, "package_sign_fail");
    let manifest_path = project.join("pulsec.toml");
    let manifest = read(&manifest_path).replace(
        "signing_mode = \"unsigned\"",
        "signing_mode = \"signtool\"\nsigning_subject = \"Pulse Labs\"\nsigning_timestamp_url = \"https://timestamp.acme.test\"",
    );
    fs::write(&manifest_path, manifest).expect("write manifest");
    let fake_signtool = create_fake_signtool_failure_cli(&project);

    let output = run_pulsec(&[
        "package",
        "--project-root",
        project.to_str().expect("utf8"),
        "--signtool",
        fake_signtool.to_str().expect("signtool utf8"),
    ]);
    assert_eq!(output.status.code(), Some(1));
    let stderr = norm(&output.stderr);
    assert!(stderr.contains("error[PULSEC:E_PACKAGE_FAILED]:"));
    assert!(stderr.contains("Signing failed:"));
    assert!(stderr.contains("diag.code=PULSEC:E_PACKAGE_FAILED"));

    let report_root = project.join("build").join("distro").join("package");
    let report = read(&report_root.join("package.report.txt"));
    let signing_plan = read(&report_root.join("signing.plan.txt"));
    let signing_log = read(&report_root.join("signing.log.txt"));
    assert!(report.contains("status=failed"));
    assert!(report.contains("mode=staged"));
    assert!(report.contains("signing_status=failed"));
    assert!(report.contains("signing_backend=signtool"));
    assert!(report.contains("signing_reason=signtool_failed"));
    assert!(report.contains("signing_log="));
    assert!(signing_plan.contains("signing_status=failed"));
    assert!(signing_plan.contains("signing_error=SignTool returned"));
    assert!(signing_log.contains("schema=pulsec.signing.log.v1"));
    assert!(signing_log.contains("signing failed"));
}

#[test]
fn e1_12_shared_package_staging_reuses_shared_build_outputs_consistently() {
    let root = unique_temp_root();
    let project = scaffold_app(&root, "shared_package_snapshot");
    write_resource_file(&project, "payload.txt", "payload");
    write_resource_file(&project, "images/icon.txt", "icon");
    set_manifest_output_mode(&project, "shared");

    let output = run_pulsec(&["package", "--project-root", project.to_str().expect("utf8")]);
    assert!(
        output.status.success(),
        "shared package should succeed\nstdout:\n{}\nstderr:\n{}",
        norm(&output.stdout),
        norm(&output.stderr)
    );

    let stage_root = project.join("build").join("staging");
    let bin_dir = stage_root.join("bin");
    let version = env!("CARGO_PKG_VERSION");
    assert!(
        bin_dir.join("shared_package_snapshot-0.1.0.exe").exists(),
        "missing staged shared executable"
    );
    assert!(
        bin_dir.join("payload.txt").exists(),
        "missing staged shared payload"
    );
    assert!(
        bin_dir.join("images").join("icon.txt").exists(),
        "missing staged shared nested payload"
    );
    assert!(
        bin_dir.join(format!("pulsecore-{version}.dll")).exists(),
        "missing staged shared runtime library"
    );
    assert!(
        bin_dir.join(format!("pulsecore-{version}.lib")).exists(),
        "missing staged shared import library"
    );

    let launch = read(&bin_dir.join("launch.txt"));
    assert!(launch.contains("schema=pulsec.shared.launch.v1"));
    assert!(launch.contains("mode=shared"));
    assert!(launch.contains("runtime_load=peer_runtime_library"));
    assert!(launch.contains("lookup_policy=relative-sibling-runtime"));
    assert!(launch.contains("runtime_abi_schema=pulsec.runtime.abi.v1"));
    assert!(launch.contains("runtime_abi_version=2"));
    assert!(launch.contains("object_model_abi_schema=pulsec.object_model.abi.v1"));
    assert!(launch.contains("object_model_abi_version=1"));
    assert!(launch.contains("mismatch_policy=deterministic-fail-fast"));
    assert!(launch.contains("missing_runtime_policy=deterministic-fail-fast"));
    assert!(launch.contains("missing_import_policy=deterministic-fail-fast"));
    assert!(launch.contains("required_runtime_imports=pulsec_rt_init"));
    assert!(launch.contains("runtime_library=pulsecore-"));
    assert!(launch.contains(".dll"));
    assert!(launch.contains("runtime_import_library=pulsecore-"));
    assert!(launch.contains(".lib"));
    assert!(launch.contains("shared_package_snapshot-0.1.0.exe"));
}

#[test]
fn e3_09_fat_and_shared_staging_outputs_satisfy_the_same_product_expectations() {
    let root = unique_temp_root();

    let fat_project = scaffold_app(&root, "fat_stage_parity");
    write_resource_file(&fat_project, "payload.txt", "payload");
    write_resource_file(&fat_project, "images/icon.txt", "icon");
    let fat_output = run_pulsec(&["package", "--project-root", fat_project.to_str().expect("utf8")]);
    assert!(
        fat_output.status.success(),
        "fat package should succeed\nstdout:\n{}\nstderr:\n{}",
        norm(&fat_output.stdout),
        norm(&fat_output.stderr)
    );

    let fat_stage = fat_project.join("build").join("staging");
    assert!(fat_stage.join("bin").join("fat_stage_parity-0.1.0.exe").exists());
    assert!(fat_stage.join("assets").join("payload.txt").exists());
    assert!(fat_stage.join("assets").join("images").join("icon.txt").exists());
    assert!(fat_stage.join("bin").join("launch.txt").exists());
    assert!(fat_stage.join("metadata").join("build.config.plan.json").exists());
    assert!(fat_stage.join("metadata").join("native.plan.json").exists());
    assert!(fat_stage.join("metadata").join("pulsec.ir.txt").exists());
    assert!(fat_stage.join("metadata").join("artifact.stamp.txt").exists());
    assert!(fat_stage.join("logs").join("native.link.txt").exists());
    assert!(fat_stage.join("obj").join("main.obj").exists());

    let shared_project = scaffold_app(&root, "shared_stage_parity");
    write_resource_file(&shared_project, "payload.txt", "payload");
    write_resource_file(&shared_project, "images/icon.txt", "icon");
    set_manifest_output_mode(&shared_project, "shared");
    let shared_output =
        run_pulsec(&["package", "--project-root", shared_project.to_str().expect("utf8")]);
    assert!(
        shared_output.status.success(),
        "shared package should succeed\nstdout:\n{}\nstderr:\n{}",
        norm(&shared_output.stdout),
        norm(&shared_output.stderr)
    );

    let shared_stage = shared_project.join("build").join("staging");
    let version = env!("CARGO_PKG_VERSION");
    assert!(shared_stage.join("bin").join("shared_stage_parity-0.1.0.exe").exists());
    assert!(shared_stage.join("bin").join("payload.txt").exists());
    assert!(shared_stage.join("bin").join("images").join("icon.txt").exists());
    assert!(shared_stage.join("bin").join("launch.txt").exists());
    assert!(
        shared_stage
            .join("bin")
            .join(format!("pulsecore-{version}.dll"))
            .exists()
    );
    assert!(
        shared_stage
            .join("bin")
            .join(format!("pulsecore-{version}.lib"))
            .exists()
    );
    assert!(shared_stage.join("metadata").join("build.config.plan.json").exists());
    assert!(shared_stage.join("metadata").join("native.plan.json").exists());
    assert!(shared_stage.join("metadata").join("pulsec.ir.txt").exists());
    assert!(shared_stage.join("metadata").join("artifact.stamp.txt").exists());
    assert!(shared_stage.join("logs").join("native.link.txt").exists());
    assert!(shared_stage.join("obj").join("main.obj").exists());

    let shared_launch = read(&shared_stage.join("bin").join("launch.txt"));
    assert!(shared_launch.contains("schema=pulsec.shared.launch.v1"));
    assert!(shared_launch.contains("runtime_library=pulsecore-"));
    assert!(shared_launch.contains("runtime_import_library=pulsecore-"));
}
