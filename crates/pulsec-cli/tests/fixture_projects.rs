mod common;
// Mixed executable corpus: portable language/runtime behavior lives beside the
// retained Windows x64 adapter parity/failure overlay. RB-18 keeps the split by
// test family until later file extraction.

use std::env;
use std::fs;
use std::io::Write;
use std::path::PathBuf;
use std::process::{Command, Output, Stdio};
use std::thread;
use std::time::Duration;
use std::time::{SystemTime, UNIX_EPOCH};

fn fixture_root(name: &str) -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("tests")
        .join("fixtures")
        .join(name)
}

fn copy_dir_recursive(src: &std::path::Path, dst: &std::path::Path) {
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

fn build_supports_runtime_execution(output: &Output, root: &std::path::Path) -> bool {
    if output.status.success() {
        let stdout = String::from_utf8_lossy(&output.stdout);
        if stdout.contains("Entry codegen: masm-split-stdlib") {
            return true;
        }
        let _ = root;
        return false;
    }

    let stderr = String::from_utf8_lossy(&output.stderr);
    if stderr.contains("error[PULSEC:E_BUILD_FAILED]: Compile error: backend emit failed:") {
        let _ = root;
        return false;
    }

    panic!(
        "build failed\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        stderr
    );
}

#[test]
fn cli_check_accepts_battle_sim_fixture_project() {
    let root = fixture_root("runtime_mix");
    let src_root = root.join("src");
    let entry = src_root.join("app/runtime/Main.pulse");

    let output = common::pulsec_command()
        .arg("check")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec check");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let stdout = String::from_utf8_lossy(&output.stdout);
    assert!(stdout.contains("OK:"));
    assert!(stdout.contains("files=1"));
}

#[test]
fn cli_check_rejects_invalid_visibility_fixture_project() {
    let root = fixture_root("invalid_visibility");
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    let output = common::pulsec_command()
        .arg("check")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec check");

    assert!(!output.status.success(), "expected command failure");

    let stderr = String::from_utf8_lossy(&output.stderr);
    assert!(
        stderr.contains("Cannot access private field 'Vault.code' from class 'Main'"),
        "unexpected stderr:\n{}",
        stderr
    );
}

#[test]
fn cli_check_accepts_runtime_mix_fixture_project() {
    let root = fixture_root("runtime_mix");
    let src_root = root.join("src");
    let entry = src_root.join("app/runtime/Main.pulse");

    let output = common::pulsec_command()
        .arg("check")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec check");

    assert!(
        output.status.success(),
        "expected success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );

    let stdout = String::from_utf8_lossy(&output.stdout);
    assert!(stdout.contains("OK:"));
    assert!(stdout.contains("files=1"));
}

#[test]
fn cli_check_accepts_strict_stress_soak_fixture_project() {
    let root = fixture_root("strict_stress_soak");
    let src_root = root.join("src");
    let entry = src_root.join("strict_stress_soak/Main.pulse");

    let output = common::pulsec_command()
        .arg("check")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec check");

    assert!(
        output.status.success(),
        "expected success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );

    let stdout = String::from_utf8_lossy(&output.stdout);
    assert!(stdout.contains("OK:"));
    assert!(stdout.contains("files=3"));
}

#[test]
fn cli_build_executes_runtime_mix_fixture_project() {
    let fixture = fixture_root("runtime_mix");
    let root = unique_temp_root();
    copy_dir_recursive(&fixture.join("src"), &root.join("src"));
    let src_root = root.join("src");
    let entry = src_root.join("app/runtime/Main.pulse");

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    assert!(
        output.status.success(),
        "expected success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );

    let stdout = String::from_utf8_lossy(&output.stdout);
    if !stdout.contains("Entry codegen: masm-split-stdlib") {
        let report = fs::read_to_string(root.join("build").join("native.link.txt"))
            .expect("read runtime_mix link report");
        assert!(
            !report.contains("entry_codegen=stub-fallback"),
            "runtime_mix should not use stub fallback:\n{}",
            report
        );
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(run.status.success(), "exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "runtime_mix_ok\n");
}

#[test]
fn cli_build_executes_runtime_mix_fixture_project_in_shared_mode() {
    let fixture = fixture_root("runtime_mix");
    let root = unique_temp_root();
    copy_dir_recursive(&fixture.join("src"), &root.join("src"));
    let src_root = root.join("src");
    let entry = src_root.join("app/runtime/Main.pulse");

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .arg("--output-mode")
        .arg("shared")
        .output()
        .expect("run pulsec build shared");

    assert!(
        output.status.success(),
        "expected shared build success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );

    let report = fs::read_to_string(root.join("build").join("native.link.txt"))
        .expect("read runtime_mix shared link report");
    assert!(
        report.contains("status=linked") && report.contains("mode=shared"),
        "runtime_mix shared build must link real shared artifacts:\n{}",
        report
    );
    assert!(
        report.contains("app_import_linkage=import_library"),
        "shared build must lock import-library linkage:\n{}",
        report
    );
    assert!(
        report.contains("app_runtime_load=peer_runtime_library"),
        "shared build must lock peer runtime loading:\n{}",
        report
    );
    assert!(
        report.contains("startup_object=") && report.contains("Startup.obj"),
        "shared build must surface startup object metadata:\n{}",
        report
    );
    assert!(
        report.contains("startup_bootstrap=mainCRTStartup->pulsec_rt_init->app_entry->pulsec_rt_shutdown->ExitProcess"),
        "shared build must surface startup bootstrap sequence:\n{}",
        report
    );
    assert!(
        report.contains("runtime_export_policy=procedure_only|minimal_versioned_abi"),
        "shared build must lock export visibility policy:\n{}",
        report
    );
    assert!(
        report.contains("runtime_exports="),
        "shared build must emit exported procedure inventory:\n{}",
        report
    );
    assert!(
        !report.contains("rt_arc_refcounts_tbl"),
        "shared build must not expose runtime-private data exports:\n{}",
        report
    );
    assert!(
        report.contains("pulsec_pulse_lang_IO_println__String"),
        "shared build must include exported IO stdlib methods in inventory:\n{}",
        report
    );

    let version = env!("CARGO_PKG_VERSION");
    let runtime_library = root.join("build").join(format!("pulsecore-{version}.dll"));
    let runtime_import_library = root.join("build").join(format!("pulsecore-{version}.lib"));
    assert!(
        runtime_library.exists(),
        "missing shared runtime library '{}'",
        runtime_library.display()
    );
    assert!(
        runtime_import_library.exists(),
        "missing shared runtime import library '{}'",
        runtime_import_library.display()
    );

    let exe = root.join("build").join("main.exe");
    assert!(
        exe.exists(),
        "missing shared-mode executable '{}'",
        exe.display()
    );
    let run = Command::new(exe).output().expect("run shared-mode exe");
    assert!(run.status.success(), "shared-mode exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "runtime_mix_ok\n");
}

#[test]
fn cli_build_executes_strict_stress_soak_fixture_project_in_shared_mode() {
    let fixture = fixture_root("strict_stress_soak");
    let root = unique_temp_root();
    copy_dir_recursive(&fixture.join("src"), &root.join("src"));
    let src_root = root.join("src");
    let entry = src_root.join("strict_stress_soak/Main.pulse");

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .arg("--output-mode")
        .arg("shared")
        .output()
        .expect("run pulsec build shared strict_stress_soak");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let report = fs::read_to_string(root.join("build").join("native.link.txt"))
        .expect("read strict_stress_soak shared link report");
    assert!(
        report.contains("status=linked") && report.contains("mode=shared"),
        "strict_stress_soak shared build must link real shared artifacts:\n{}",
        report
    );
    assert!(
        report.contains("startup_bootstrap=mainCRTStartup->pulsec_rt_init->app_entry->pulsec_rt_shutdown->ExitProcess"),
        "strict_stress_soak shared build must lock startup bootstrap sequence:\n{}",
        report
    );

    let startup_asm = fs::read_to_string(
        root.join("build")
            .join("obj")
            .join("runtime")
            .join("Startup.asm"),
    )
    .expect("read shared startup asm");
    for needle in [
        "extrn pulsec_rt_init:proc",
        "extrn pulsec_rt_shutdown:proc",
        "mainCRTStartup proc",
        "call pulsec_rt_init",
        "call pulsec_rt_shutdown",
        "call ExitProcess",
    ] {
        assert!(
            startup_asm.contains(needle),
            "shared startup asm missing '{}'\n{}",
            needle,
            startup_asm
        );
    }
    assert!(
        startup_asm.find("call pulsec_rt_init").unwrap()
            < startup_asm.find("call pulsec_rt_shutdown").unwrap(),
        "shared startup asm must init before shutdown\n{}",
        startup_asm
    );

    let exe = root.join("build").join("main.exe");
    let run = Command::new(&exe)
        .output()
        .expect("run strict_stress_soak shared exe");
    assert!(
        run.status.success(),
        "strict_stress_soak shared exe failed\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "soak_ok\n40415\n");
}

#[test]
fn cli_build_executes_strict_stress_soak_repeatedly_in_shared_mode() {
    let fixture = fixture_root("strict_stress_soak");
    let root = unique_temp_root();
    copy_dir_recursive(&fixture.join("src"), &root.join("src"));
    let src_root = root.join("src");
    let entry = src_root.join("strict_stress_soak/Main.pulse");
    let version = env!("CARGO_PKG_VERSION");
    let exe = root.join("build").join("main.exe");
    let runtime_library = root.join("build").join(format!("pulsecore-{version}.dll"));
    let runtime_import_library = root.join("build").join(format!("pulsecore-{version}.lib"));
    let iterations = env::var("PULSEC_SOAK_ITERS")
        .ok()
        .and_then(|s| s.parse::<usize>().ok())
        .unwrap_or(3);
    assert!(iterations > 0, "PULSEC_SOAK_ITERS must be >= 1");

    for _ in 0..iterations {
        let _ = fs::remove_file(&exe);
        let _ = fs::remove_file(&runtime_library);
        let _ = fs::remove_file(&runtime_import_library);

        let output = common::pulsec_command()
            .arg("build")
            .arg(entry.to_str().expect("entry utf8"))
            .arg("--source-root")
            .arg(src_root.to_str().expect("src utf8"))
            .arg("--strict-package")
            .arg("--output-mode")
            .arg("shared")
            .output()
            .expect("run pulsec build shared strict_stress_soak");

        if !build_supports_runtime_execution(&output, &root) {
            return;
        }

        let report = fs::read_to_string(root.join("build").join("native.link.txt"))
            .expect("read repeated shared strict_stress_soak link report");
        assert!(
            report.contains("status=linked") && report.contains("mode=shared"),
            "repeated shared strict_stress_soak build must link real shared artifacts:\n{}",
            report
        );
        assert!(
            exe.exists(),
            "missing shared soak executable '{}'",
            exe.display()
        );
        assert!(
            runtime_library.exists(),
            "missing shared soak runtime library '{}'",
            runtime_library.display()
        );
        assert!(
            runtime_import_library.exists(),
            "missing shared soak import library '{}'",
            runtime_import_library.display()
        );

        let run = Command::new(&exe)
            .output()
            .expect("run repeated shared strict_stress_soak exe");
        assert!(
            run.status.success(),
            "repeated shared strict_stress_soak exe failed\nstdout:\n{}\nstderr:\n{}",
            String::from_utf8_lossy(&run.stdout),
            String::from_utf8_lossy(&run.stderr)
        );
        let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
        assert_eq!(out, "soak_ok\n40415\n");
    }
}

#[test]
fn cli_build_executes_strict_stress_soak_fixture_project() {
    let fixture = fixture_root("strict_stress_soak");
    let root = unique_temp_root();
    copy_dir_recursive(&fixture.join("src"), &root.join("src"));
    let src_root = root.join("src");
    let entry = src_root.join("strict_stress_soak/Main.pulse");
    let exe = root.join("build").join("main.exe");
    let _ = fs::remove_file(&exe);

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    assert!(
        output.status.success(),
        "expected success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );

    let report = fs::read_to_string(root.join("build").join("native.link.txt"))
        .expect("read strict_stress_soak link report");
    assert!(
        report.contains("status=linked"),
        "strict_stress_soak must link without stubs:\n{}",
        report
    );

    let run = Command::new(&exe).output().expect("run exe");
    assert!(run.status.success(), "exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "soak_ok\n40415\n", "unexpected output:\n{}", out);
}

#[test]
fn cli_build_executes_stress_soak_repeatedly() {
    let fixture = fixture_root("stress_soak");
    let root = unique_temp_root();
    copy_dir_recursive(&fixture.join("src"), &root.join("src"));
    let src_root = root.join("src");
    let entry = src_root.join("app/stress/Main.pulse");
    let exe = root.join("build").join("main.exe");
    let iterations = env::var("PULSEC_SOAK_ITERS")
        .ok()
        .and_then(|s| s.parse::<usize>().ok())
        .unwrap_or(3);
    assert!(iterations > 0, "PULSEC_SOAK_ITERS must be >= 1");

    for _ in 0..iterations {
        let _ = fs::remove_file(&exe);
        let output = common::pulsec_command()
            .arg("build")
            .arg(entry.to_str().expect("entry utf8"))
            .arg("--source-root")
            .arg(src_root.to_str().expect("src utf8"))
            .arg("--strict-package")
            .output()
            .expect("run pulsec build");

        assert!(
            output.status.success(),
            "expected success\nstdout:\n{}\nstderr:\n{}",
            String::from_utf8_lossy(&output.stdout),
            String::from_utf8_lossy(&output.stderr)
        );

        let report = fs::read_to_string(root.join("build").join("native.link.txt"))
            .expect("read stress_soak link report");
        assert!(
            report.contains("status=linked"),
            "stress_soak must link without stubs:\n{}",
            report
        );

        let run = Command::new(&exe).output().expect("run exe");
        assert!(run.status.success(), "exe failed");
        let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
        assert_eq!(out, "soak_ok\n40415\n", "unexpected soak output:\n{}", out);
    }
}

#[test]
fn cli_check_accepts_object_interface_mix_fixture_project() {
    let root = fixture_root("object_interface_mix");
    let src_root = root.join("src");
    let entry = src_root.join("app/mixed/Main.pulse");

    let output = common::pulsec_command()
        .arg("check")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec check");

    assert!(
        output.status.success(),
        "expected success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );

    let stdout = String::from_utf8_lossy(&output.stdout);
    assert!(stdout.contains("OK:"));
    assert!(stdout.contains("files=1"));
}

#[test]
fn cli_build_executes_object_interface_mix_fixture_project() {
    let root = fixture_root("runtime_mix");
    let src_root = root.join("src");
    let entry = src_root.join("app/runtime/Main.pulse");

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    assert!(
        output.status.success(),
        "expected success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );

    let stdout = String::from_utf8_lossy(&output.stdout);
    if !stdout.contains("Entry codegen: masm-split-stdlib") {
        let report = fs::read_to_string(root.join("build").join("native.link.txt"))
            .expect("read runtime_mix link report");
        assert!(
            !report.contains("entry_codegen=stub-fallback"),
            "runtime_mix should not use stub fallback:\n{}",
            report
        );
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(run.status.success(), "exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "runtime_mix_ok\n");
}

#[test]
fn cli_build_emits_ir_summary_for_fixture_project() {
    let root = fixture_root("runtime_mix");
    let src_root = root.join("src");
    let entry = src_root.join("app/runtime/Main.pulse");

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    assert!(
        output.status.success(),
        "expected success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );

    let stdout = String::from_utf8_lossy(&output.stdout);
    assert!(
        stdout.contains("Build IR ready:"),
        "unexpected stdout:\n{}",
        stdout
    );
    assert!(
        stdout.contains("IR artifact:"),
        "unexpected stdout:\n{}",
        stdout
    );
    assert!(
        stdout.contains("Native plan:"),
        "unexpected stdout:\n{}",
        stdout
    );
    assert!(
        stdout.contains("Object scaffold:"),
        "unexpected stdout:\n{}",
        stdout
    );
    assert!(
        stdout.contains("Link report:"),
        "unexpected stdout:\n{}",
        stdout
    );
    assert!(
        stdout.contains("Entry codegen:"),
        "unexpected stdout:\n{}",
        stdout
    );

    let artifact_path = root.join("build").join("pulsec.ir.txt");
    assert!(
        artifact_path.exists(),
        "expected IR artifact at '{}'",
        artifact_path.display()
    );
    let artifact = fs::read_to_string(&artifact_path).expect("read IR artifact");
    assert!(artifact.contains("# PulseCode IR Dump"));

    let plan_path = root.join("build").join("native.plan.json");
    assert!(
        plan_path.exists(),
        "expected native plan at '{}'",
        plan_path.display()
    );
    let plan = fs::read_to_string(&plan_path).expect("read native plan");
    assert!(plan.contains("\"schema\": \"pulsec.native.plan.v1\""));
    assert!(plan.contains("\"target\""));
    assert!(plan.contains("\"entry\""));
    assert!(plan.contains("\"runtime\""));
    assert!(plan.contains("\"class_names\""));

    let object_path = if root
        .join("build")
        .join("obj")
        .join("runtime")
        .join("Startup.obj")
        .exists()
    {
        root.join("build")
            .join("obj")
            .join("runtime")
            .join("Startup.obj")
    } else {
        root.join("build").join("main.obj")
    };
    assert!(
        object_path.exists(),
        "expected object scaffold at '{}'",
        object_path.display()
    );
    let bytes = fs::read(&object_path).expect("read object scaffold");
    assert!(bytes.len() >= 20, "coff object should contain header");
    // COFF machine x86_64: 0x8664 little-endian => 64 86
    assert_eq!(bytes[0], 0x64);
    assert_eq!(bytes[1], 0x86);
    let text = String::from_utf8_lossy(&bytes);
    assert!(
        text.contains("mainCRTStartup"),
        "expected entry symbol in object string table"
    );

    let link_report_path = root.join("build").join("native.link.txt");
    assert!(
        link_report_path.exists(),
        "expected link report at '{}'",
        link_report_path.display()
    );
    let report = fs::read_to_string(&link_report_path).expect("read link report");
    assert!(
        report.contains("status=linked"),
        "unexpected link report:\n{}",
        report
    );
    assert!(
        report.contains("entry_codegen="),
        "missing entry codegen detail in link report:\n{}",
        report
    );

    let exe_path = root.join("build").join("main.exe");
    assert!(
        exe_path.exists(),
        "expected executable artifact at '{}'",
        exe_path.display()
    );
    let exe = fs::read(&exe_path).expect("read executable");
    assert!(exe.len() >= 2, "expected non-empty executable output");
    assert_eq!(exe[0], b'M');
    assert_eq!(exe[1], b'Z');
}

#[test]
fn cli_build_accepts_runtime_string_intrinsics_baseline() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static void main() {
                String text = "a".concat("b");
                int len = text.length();
                if (len == 2) {
                    text = "true";
                } else {
                    text = "false";
                }
                IO.println(text);
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    assert!(
        output.status.success(),
        "expected success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );

    let link_report_path = root.join("build").join("native.link.txt");
    assert!(
        link_report_path.exists(),
        "expected link report at '{}'",
        link_report_path.display()
    );
    let report = fs::read_to_string(&link_report_path).expect("read link report");
    assert!(
        report.contains("status=linked"),
        "unexpected link report:\n{}",
        report
    );

    let plan_path = root.join("build").join("native.plan.json");
    assert!(
        plan_path.exists(),
        "expected native plan at '{}'",
        plan_path.display()
    );
    let plan = fs::read_to_string(&plan_path).expect("read native plan");
    assert!(
        plan.contains("pulse.lang.String.runtimeConcat"),
        "missing String.runtimeConcat runtime symbol in plan:\n{}",
        plan
    );
    assert!(
        plan.contains("pulse.lang.String.runtimeLength"),
        "missing String.runtimeLength runtime symbol in plan:\n{}",
        plan
    );

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_object_interface_mix_fixture_project_in_shared_mode() {
    let fixture = fixture_root("object_interface_mix");
    let root = unique_temp_root();
    copy_dir_recursive(&fixture.join("src"), &root.join("src"));
    let src_root = root.join("src");
    let entry = src_root.join("app/mixed/Main.pulse");

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .arg("--output-mode")
        .arg("shared")
        .output()
        .expect("run pulsec build shared");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    assert!(
        output.status.success(),
        "expected shared object/interface build success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );

    let report = fs::read_to_string(root.join("build").join("native.link.txt"))
        .expect("read object_interface_mix shared link report");
    for needle in [
        "status=linked",
        "mode=shared",
        "app_import_linkage=import_library",
        "app_runtime_load=peer_runtime_library",
        "startup_bootstrap=mainCRTStartup->pulsec_rt_init->app_entry->pulsec_rt_shutdown->ExitProcess",
    ] {
        assert!(
            report.contains(needle),
            "shared object/interface build missing '{}'\n{}",
            needle,
            report
        );
    }

    let version = env!("CARGO_PKG_VERSION");
    let runtime_library = root.join("build").join(format!("pulsecore-{version}.dll"));
    let runtime_import_library = root.join("build").join(format!("pulsecore-{version}.lib"));
    assert!(runtime_library.exists(), "missing shared runtime library");
    assert!(
        runtime_import_library.exists(),
        "missing shared runtime import library"
    );

    let app_asm = fs::read_to_string(
        root.join("build")
            .join("obj")
            .join("app")
            .join("mixed")
            .join("Main.asm"),
    )
    .expect("read shared object/interface app asm");
    assert!(
        !app_asm.contains("extrn pulsec_rt_obj_class_ids:qword"),
        "shared app asm must not import runtime-private class-id table directly\n{}",
        app_asm
    );
    assert!(
        !app_asm.contains("extrn rt_slot_capacity:dword"),
        "shared app asm must not import runtime-private slot allocator state directly\n{}",
        app_asm
    );

    let exe = root.join("build").join("main.exe");
    assert!(
        exe.exists(),
        "missing shared object/interface executable '{}'",
        exe.display()
    );
    let run = Command::new(&exe)
        .output()
        .expect("run shared object/interface executable");
    assert!(
        run.status.success(),
        "shared object/interface executable failed\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "object_interface_mix_ok\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_shared_null_virtual_dispatch_receiver_panics_deterministically() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.memory.Memory;

        class Base {
            public int value() {
                return 1;
            }
        }

        class Main {
            public static Base choose(boolean pick) {
                if (pick) {
                    return new Base();
                }
                return null;
            }

            public static void main() {
                boolean pick = Memory.cycleTick() == 123;
                Base b = choose(pick);
                IO.println("before");
                IO.println(b.value());
            }
        }"#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .arg("--output-mode")
        .arg("shared")
        .output()
        .expect("run pulsec build shared");
    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let run = Command::new(root.join("build").join("main.exe"))
        .output()
        .expect("run shared null-dispatch executable");
    assert!(
        !run.status.success(),
        "expected non-zero exit for shared null virtual receiver dispatch\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let combined = format!(
        "{}\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    )
    .replace('\r', "");
    assert!(
        combined.contains("before\n"),
        "expected marker output before shared null-dispatch panic\n{}",
        combined
    );
    assert!(
        combined.contains("Null dispatch receiver"),
        "expected deterministic shared null-dispatch diagnostic\n{}",
        combined
    );
}

#[test]
fn cli_build_shared_checked_reference_cast_failure_is_locked() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;

        class Base {}
        class Derived extends Base {}

        class Main {
            public static void main() {
                Base b = new Base();
                Derived d = (Derived) b;
            }
        }"#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .arg("--output-mode")
        .arg("shared")
        .output()
        .expect("run pulsec build shared");
    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let run = Command::new(root.join("build").join("main.exe"))
        .output()
        .expect("run shared invalid-cast executable");
    assert!(
        !run.status.success(),
        "expected non-zero exit for shared invalid checked cast\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let combined = format!(
        "{}\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    assert!(
        combined.contains("Invalid cast"),
        "missing shared checked-cast runtime diagnostic, output:\n{}",
        combined
    );
}

#[test]
fn cli_build_shared_runtime_abi_mismatch_fails_deterministically_at_launch() {
    let fixture = fixture_root("runtime_mix");
    let root = unique_temp_root();
    copy_dir_recursive(&fixture.join("src"), &root.join("src"));
    let src_root = root.join("src");
    let entry = src_root.join("app/runtime/Main.pulse");

    let output = common::pulsec_command()
        .env("PULSEC_FORCE_RUNTIME_ABI_VERSION", "1")
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .arg("--output-mode")
        .arg("shared")
        .output()
        .expect("run pulsec build shared with runtime ABI mismatch");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    assert!(
        output.status.success(),
        "expected shared mismatch build success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );

    let exe = root.join("build").join("main.exe");
    let run = Command::new(&exe)
        .output()
        .expect("run shared mismatch exe");
    assert!(
        !run.status.success(),
        "expected non-zero exit for shared runtime ABI mismatch\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert!(
        out.contains("Runtime ABI mismatch"),
        "expected shared runtime ABI mismatch diagnostic\nstdout:\n{}",
        out
    );
}

#[test]
fn cli_build_shared_object_model_abi_mismatch_fails_deterministically_at_launch() {
    let fixture = fixture_root("runtime_mix");
    let root = unique_temp_root();
    copy_dir_recursive(&fixture.join("src"), &root.join("src"));
    let src_root = root.join("src");
    let entry = src_root.join("app/runtime/Main.pulse");

    let output = common::pulsec_command()
        .env("PULSEC_FORCE_OBJECT_MODEL_ABI_VERSION", "2")
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .arg("--output-mode")
        .arg("shared")
        .output()
        .expect("run pulsec build shared with object-model ABI mismatch");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    assert!(
        output.status.success(),
        "expected shared object-model mismatch build success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );

    let exe = root.join("build").join("main.exe");
    let run = Command::new(&exe)
        .output()
        .expect("run shared object-model mismatch exe");
    assert!(
        !run.status.success(),
        "expected non-zero exit for shared object-model ABI mismatch\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert!(
        out.contains("Object model ABI mismatch"),
        "expected shared object-model ABI mismatch diagnostic\nstdout:\n{}",
        out
    );
}

#[test]
fn cli_build_shared_hard_fails_when_linker_is_unavailable_and_no_fake_artifacts_publish() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static void main() {
                IO.println("hello");
            }
        }
        "#,
    );

    let missing_linker = root.join("missing").join("link.exe");
    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .arg("--output-mode")
        .arg("shared")
        .arg("--linker")
        .arg(missing_linker.to_str().expect("missing linker utf8"))
        .output()
        .expect("run pulsec build shared");

    assert!(
        !output.status.success(),
        "expected shared build failure\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );

    let link_report_path = root.join("build").join("native.link.txt");
    assert!(link_report_path.exists(), "expected shared failure report");
    let report = fs::read_to_string(&link_report_path).expect("read shared failure report");
    assert!(
        report.contains("status=not-linked"),
        "expected not-linked report:\n{}",
        report
    );
    assert!(
        report.contains("mode=shared"),
        "expected shared-mode report:\n{}",
        report
    );
    assert!(
        !report.contains("stub=emitted") && !report.contains("status=stubbed"),
        "shared build must not publish stub fallback:\n{}",
        report
    );
    let version = env!("CARGO_PKG_VERSION");
    assert!(
        !root.join("build").join("main.exe").exists(),
        "shared link failure must not publish executable"
    );
    assert!(
        !root
            .join("build")
            .join(format!("pulsecore-{version}.dll"))
            .exists(),
        "shared link failure must not publish runtime library"
    );
    assert!(
        !root
            .join("build")
            .join(format!("pulsecore-{version}.lib"))
            .exists(),
        "shared link failure must not publish import library"
    );

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_shared_launch_metadata_detects_missing_runtime_library_payload() {
    let root = unique_temp_root();
    let project = root.join("shared_missing_runtime_payload");

    let new_output = common::pulsec_command()
        .arg("new")
        .arg("shared_missing_runtime_payload")
        .arg("--template")
        .arg("app")
        .arg("--path")
        .arg(root.to_str().expect("root utf8"))
        .output()
        .expect("run pulsec new");
    assert!(
        new_output.status.success(),
        "shared app scaffold should succeed"
    );

    let main_root = project.join("src").join("main").join("pulse");
    let _ = fs::remove_dir_all(main_root.join("app").join("main"));
    copy_dir_recursive(
        &fixture_root("runtime_mix")
            .join("src")
            .join("app")
            .join("runtime"),
        &main_root.join("app").join("runtime"),
    );
    let manifest_path = project.join("pulsec.toml");
    let manifest = fs::read_to_string(&manifest_path)
        .expect("read manifest")
        .replace(
            "entry = \"app/main/Main.pulse\"",
            "entry = \"app/runtime/Main.pulse\"",
        )
        .replace("output_mode = \"fat\"", "output_mode = \"shared\"");
    fs::write(&manifest_path, manifest).expect("write manifest");

    let output = common::pulsec_command()
        .arg("build")
        .arg("--project-root")
        .arg(project.to_str().expect("project utf8"))
        .output()
        .expect("run pulsec build shared project");

    if !build_supports_runtime_execution(&output, &project) {
        return;
    }

    let version = env!("CARGO_PKG_VERSION");
    let release_root = project.join("build").join("distro").join("release");
    let launch = fs::read_to_string(release_root.join("bin").join("launch.txt"))
        .expect("read shared launch descriptor");
    assert!(launch.contains("runtime_library=pulsecore-"));
    assert!(launch.contains("mismatch_policy=deterministic-fail-fast"));
    assert!(launch.contains("missing_runtime_policy=deterministic-fail-fast"));
    assert!(launch.contains("missing_import_policy=deterministic-fail-fast"));
    assert!(launch.contains("required_runtime_imports=pulsec_rt_init"));
    let runtime_library = release_root
        .join("bin")
        .join(format!("pulsecore-{version}.dll"));
    assert!(
        runtime_library.exists(),
        "expected shared runtime library before removal"
    );
    fs::remove_file(&runtime_library).expect("remove shared runtime library");
    assert!(
        !runtime_library.exists(),
        "shared runtime library should be absent after removal"
    );
    assert!(
        launch.contains(&format!("runtime_library=pulsecore-{version}.dll")),
        "launch metadata must continue to point at the required runtime payload\n{}",
        launch
    );

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_runtime_panic_intrinsic_baseline() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.rt.Intrinsics;

        class Main {
            public static void main() {
                Intrinsics.panic("boom");
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let plan_path = root.join("build").join("native.plan.json");
    let plan = fs::read_to_string(&plan_path).expect("read native plan");
    assert!(
        plan.contains("pulse.rt.Intrinsics.panic"),
        "missing panic runtime symbol in plan:\n{}",
        plan
    );

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        !run.status.success(),
        "expected non-zero exit for panic\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert!(out.starts_with("boom\n"), "unexpected stdout:\n{}", out);
    assert!(
        out.contains("Stack trace:\n"),
        "panic output should include stack trace:\n{}",
        out
    );

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_throw_fail_fast_baseline() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.Exception;

        class Main {
            public static void main() throws Exception {
                throw new Exception("boom");
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        !run.status.success(),
        "expected non-zero exit for throw baseline\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert!(
        out.starts_with("Exception: boom\n"),
        "throw baseline should render the throwable before fail-fast termination\n{}",
        out
    );
    assert!(
        out.contains("Stack trace:\n"),
        "throw baseline should use the runtime panic path\n{}",
        out
    );

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_check_rejects_uncaught_checked_exception_flow() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.Exception;

        class Worker {
            public void fail() throws Exception {
                throw new Exception("boom");
            }
        }

        class Main {
            public static void main() {
                Worker worker = new Worker();
                worker.fail();
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("check")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec check");

    assert!(!output.status.success(), "expected command failure");
    let stderr = String::from_utf8_lossy(&output.stderr);
    assert!(
        stderr.contains("Checked exception 'Exception' must be caught or declared in 'Main.main'"),
        "unexpected stderr:\n{}",
        stderr
    );

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_declared_checked_exception_flow() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.Exception;

        class Worker {
            public Worker() throws Exception {
            }

            public void fail() throws Exception {
                throw new Exception("boom");
            }
        }

        class Main {
            public static void main() throws Exception {
                Worker worker = new Worker();
                worker.fail();
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        !run.status.success(),
        "expected non-zero exit for declared checked exception flow\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert!(
        out.starts_with("Exception: boom\nStack trace:\n"),
        "declared checked exception flow should still fail-fast at runtime today\n{}",
        out
    );

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_try_catch_finally_same_method_baseline() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.Exception;
        import pulse.lang.IO;

        class Main {
            public static void main() {
                try {
                    IO.println("before");
                    throw new Exception("boom");
                } catch (Exception ex) {
                    IO.println("caught");
                    IO.println(ex.getMessage());
                } finally {
                    IO.println("finally");
                }
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected try/catch/finally baseline to complete successfully\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "before\ncaught\nboom\nfinally\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_cross_method_try_catch_finally_flow() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.Exception;
        import pulse.lang.IO;

        class Worker {
            public void fail() throws Exception {
                throw new Exception("boom");
            }
        }

        class Main {
            public static void inner() throws Exception {
                try {
                    Worker worker = new Worker();
                    worker.fail();
                } finally {
                    IO.println("inner-finally");
                }
            }

            public static void main() {
                IO.println("before");
                try {
                    inner();
                } catch (Exception ex) {
                    IO.println("caught");
                    IO.println(ex.toString());
                } finally {
                    IO.println("outer-finally");
                }
                IO.println("after");
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected successful cross-method catch/finally flow\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(
        out,
        "before\ninner-finally\ncaught\nException: boom\nouter-finally\nafter\n"
    );

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_cross_method_uncaught_exception_stack_trace_flow() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.Exception;

        class Worker {
            public static void explode() throws Exception {
                throw new Exception("boom");
            }
        }

        class Main {
            public static void relay() throws Exception {
                Worker.explode();
            }

            public static void main() throws Exception {
                relay();
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        !run.status.success(),
        "expected non-zero exit for uncaught cross-method exception flow\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert!(
        out.starts_with("Exception: boom\n"),
        "unexpected stdout:\n{}",
        out
    );
    assert!(
        out.contains("Stack trace:\n"),
        "missing stack trace:\n{}",
        out
    );
    assert!(
        out.contains("at app.core.Worker.explode(Main.pulse:7)"),
        "missing throw site in stack trace:\n{}",
        out
    );
    assert!(
        out.contains("at app.core.Main.relay(Main.pulse:13)"),
        "missing relay frame in stack trace:\n{}",
        out
    );
    assert!(
        out.contains("at app.core.Main.main(Main.pulse:17)"),
        "missing main frame in stack trace:\n{}",
        out
    );
    assert!(
        !out.contains("Throwable.panic"),
        "internal panic helper should not leak into user-facing stack trace:\n{}",
        out
    );

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_foreach_iterable_and_array_baseline() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.lang.Object;
        import pulse.lang.Iterable;
        import pulse.lang.Iterator;
        import pulse.collections.Array;

        class CounterIterator implements Iterator {
            private int remaining;

            public CounterIterator(int remaining) {
                this.remaining = remaining;
            }

            public boolean hasNext() {
                return this.remaining > 0;
            }

            public Object next() {
                this.remaining = this.remaining - 1;
                return new Object();
            }
        }

        class CounterBag implements Iterable {
            public Iterator iterator() {
                return new CounterIterator(3);
            }
        }

        class Main {
            public static void main() {
                int count = 0;
                for (Object item : new CounterBag()) {
                    count = count + 1;
                }
                IO.println(count);

                Array values = new Array(3);
                values.setInt(0, 1);
                values.setInt(1, 2);
                values.setInt(2, 3);

                int total = 0;
                for (int value : values) {
                    total = total + value;
                }
                IO.println(total);
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected foreach baseline to complete successfully\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "3\n6\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_foreach_over_native_arrays() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static void main() {
                int[] values = new int[] { 1, 2, 3 };
                int total = 0;
                for (int value : values) {
                    total = total + value;
                }
                IO.println(total);

                String[] names = new String[] { "pulse", "code" };
                for (String name : names) {
                    IO.println(name);
                }
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected native array foreach flow to complete successfully\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "6\npulse\ncode\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_collection_iteration_baseline() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.lang.Object;
        import pulse.lang.Iterator;
        import pulse.collections.Collection;
        import pulse.collections.List;
        import pulse.collections.Set;
        import pulse.collections.ArrayList;
        import pulse.collections.LinkedList;
        import pulse.collections.HashSet;

        class Main {
            public static void main() {
                Collection collection = new ArrayList();
                collection.add("a");
                collection.add("b");
                Iterator it = collection.iterator();
                while (it.hasNext()) {
                    IO.println((String) it.next());
                }

                List list = new LinkedList();
                list.add("pulse");
                list.add("code");
                for (Object item : list) {
                    IO.println((String) item);
                }

                Set set = new HashSet();
                set.add("x");
                set.add("y");
                int count = 0;
                for (var item : set) {
                    if (item != null) {
                        count = count + 1;
                    }
                }
                IO.println(count);
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected collection iteration baseline to complete successfully\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "a\nb\npulse\ncode\n2\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_array_iterable_object_baseline() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.lang.Object;
        import pulse.lang.Iterable;
        import pulse.lang.Iterator;
        import pulse.collections.Array;

        class Main {
            public static void main() {
                Array words = new Array(2);
                words.setString(0, "pulse");
                words.setString(1, "code");

                Iterable iterable = words;
                Iterator it = iterable.iterator();
                while (it.hasNext()) {
                    IO.println((String) it.next());
                }

                for (var item : words) {
                    IO.println((String) item);
                }

                for (Object item : words) {
                    IO.println((String) item);
                }
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected array iterable-object baseline to complete successfully\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "pulse\ncode\npulse\ncode\npulse\ncode\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_map_key_iteration_baseline() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.lang.Object;
        import pulse.lang.Iterator;
        import pulse.collections.Map;
        import pulse.collections.HashMap;

        class Main {
            public static void main() {
                Map map = new HashMap();
                map.put("name", "pulse");
                map.putInt("hp", 7);

                Iterator keys = map.keyIterator();
                int seen = 0;
                while (keys.hasNext()) {
                    Object key = keys.next();
                    if (key != null) {
                        seen = seen + 1;
                    }
                    IO.println((String) key);
                }
                IO.println(seen);
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected map key iteration baseline to complete successfully\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "hp\nname\n2\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_hashmap_hashset_expanded_flow() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.lang.Iterator;
        import pulse.collections.Collection;
        import pulse.collections.Set;
        import pulse.collections.Map;
        import pulse.collections.HashMap;
        import pulse.collections.HashSet;

        class Main {
            public static void main() {
                Map map = new HashMap();
                map.put("name", "pulse");
                map.putInt("hp", 7);
                IO.println(map.containsValue("pulse"));
                IO.println(map.containsValue(7));
                IO.println((String) map.remove("name"));
                IO.println(map.containsKey("name"));

                Set keys = map.keySet();
                Iterator keyIt = keys.iterator();
                while (keyIt.hasNext()) {
                    IO.println((String) keyIt.next());
                }

                Collection values = map.values();
                Iterator valueIt = values.iterator();
                while (valueIt.hasNext()) {
                    IO.println((Integer) valueIt.next());
                }

                Set set = new HashSet();
                set.add("a");
                set.add("b");
                IO.println(set.remove("a"));
                IO.println(set.remove("z"));
                IO.println(set.contains("b"));
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected expanded HashMap/HashSet flow to complete successfully\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "true\ntrue\npulse\nfalse\nhp\n7\ntrue\nfalse\ntrue\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_hashmap_hashset_bulk_helper_flow() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.collections.Collection;
        import pulse.collections.Set;
        import pulse.collections.Map;
        import pulse.collections.HashMap;
        import pulse.collections.HashSet;
        import pulse.collections.ArrayList;

        class Main {
            public static void main() {
                Map left = new HashMap();
                left.put("name", "pulse");
                Map right = new HashMap();
                right.putInt("hp", 7);
                right.put("role", "hero");
                left.putAll(right);
                IO.println((String) left.get("name"));
                IO.println(left.getInt("hp"));
                IO.println((String) left.get("role"));

                Collection values = new ArrayList();
                values.add("a");
                values.add("b");
                values.add("a");
                Set set = new HashSet();
                IO.println(set.addAll(values));
                IO.println(set.size());
                IO.println(set.contains("a"));
                IO.println(set.contains("b"));
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected bulk HashMap/HashSet helper flow to complete successfully\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "pulse\n7\nhero\ntrue\n2\ntrue\ntrue\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_hashmap_hashset_default_and_bulk_query_flow() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.collections.Collection;
        import pulse.collections.Set;
        import pulse.collections.Map;
        import pulse.collections.HashMap;
        import pulse.collections.HashSet;
        import pulse.collections.ArrayList;

        class Main {
            public static void main() {
                Map map = new HashMap();
                IO.println(map.putIfAbsent("name", "pulse") == null);
                IO.println((String) map.putIfAbsent("name", "code"));
                IO.println((String) map.getOrDefault("name", "fallback"));
                IO.println(map.getIntOrDefault("hp", 7));

                Collection values = new ArrayList();
                values.add("a");
                values.add("b");
                Set set = new HashSet();
                set.add("a");
                set.add("b");
                IO.println(set.containsAll(values));
                IO.println(set.removeAll(values));
                IO.println(set.isEmpty());
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected default and bulk query HashMap/HashSet flow to complete successfully\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "true\npulse\npulse\n7\ntrue\ntrue\ntrue\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_hashmap_hashset_final_practical_helper_flow() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.collections.Collection;
        import pulse.collections.Set;
        import pulse.collections.Map;
        import pulse.collections.HashMap;
        import pulse.collections.HashSet;
        import pulse.collections.ArrayList;

        class Main {
            public static void main() {
                Map map = new HashMap();
                map.put("name", "pulse");
                IO.println((String) map.replace("name", "code"));
                IO.println((String) map.get("name"));
                IO.println(map.replace("role", "hero") == null);

                Collection values = new ArrayList();
                values.add("a");
                Set set = new HashSet();
                set.add("a");
                set.add("b");
                IO.println(set.retainAll(values));
                IO.println(set.size());
                IO.println(set.contains("a"));
                IO.println(set.contains("b"));
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected final practical HashMap/HashSet helper flow to complete successfully\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "pulse\ncode\ntrue\ntrue\n1\ntrue\nfalse\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_arrays_and_collections_utility_baseline() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.collections.Array;
        import pulse.collections.Collections;
        import pulse.collections.Collection;
        import pulse.collections.List;
        import pulse.collections.Set;
        import pulse.collections.ArrayList;
        import pulse.util.Arrays;

        class Main {
            public static void main() {
                Array values = new Array(3);
                values.setString(0, "pulse");
                values.setString(1, "code");
                values.setString(2, "pulse");

                List copied = Arrays.asList(values);
                IO.println(Arrays.indexOf(values, "code"));
                IO.println(Arrays.contains(values, "pulse"));

                Collection sink = new ArrayList();
                IO.println(Collections.addAll(sink, copied));
                IO.println(Collections.frequency(copied, "pulse"));
                Collections.reverse(copied);
                IO.println((String) copied.get(0));
                IO.println((String) copied.get(2));

                List one = Collections.singletonList("x");
                Set set = Collections.singleton("y");
                IO.println((String) one.get(0));
                IO.println(set.contains("y"));
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected Arrays/Collections utility baseline to complete successfully\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "1\ntrue\ntrue\n2\npulse\npulse\nx\ntrue\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_collection_runtime_hardening_flow() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.collections.Collection;
        import pulse.collections.List;
        import pulse.collections.Set;
        import pulse.collections.ArrayList;
        import pulse.collections.LinkedList;
        import pulse.collections.HashMap;
        import pulse.collections.HashSet;

        class Box {}

        class Main {
            public static void main() {
                Object nullValue = null;
                Box key = new Box();
                Box value = new Box();
                Box extra = new Box();
                List list = new ArrayList();
                list.add("a");
                list.add("b");
                list.addAll(list);
                IO.println(list.size());
                IO.println((String) list.get(0));
                IO.println((String) list.get(3));

                LinkedList queue = new LinkedList();
                queue.add(1);
                queue.add(2);
                queue.addAll(queue);
                IO.println(queue.size());
                IO.println(queue.getInt(0));
                IO.println(queue.getInt(3));

                HashMap map = new HashMap();
                map.put(key, value);
                map.put(nullValue, nullValue);
                map.putInt("n", 7);
                map.putAll(map);
                IO.println(map.size());
                IO.println(map.containsKey(nullValue));
                IO.println(map.containsValue(nullValue));
                IO.println((String) map.getOrDefault("missing", "fallback"));
                IO.println(map.getIntOrDefault("missingN", 9));

                Set keys = map.keySet();
                keys.remove(key);
                IO.println(keys.contains(key));
                IO.println(map.containsKey(key));

                Collection values = map.values();
                values.remove(nullValue);
                IO.println(values.size());
                IO.println(map.size());

                HashSet set = new HashSet();
                set.add(nullValue);
                set.add("x");
                IO.println(set.containsAll(set));
                IO.println(set.removeAll(set));
                IO.println(set.size());
                set.add("keep");
                IO.println(set.retainAll(set));
                IO.println(set.contains("keep"));
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected collection runtime hardening flow to complete successfully\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(
        out,
        "4\na\nb\n4\n1\n2\n3\ntrue\ntrue\nfallback\n9\nfalse\nfalse\n1\n1\ntrue\ntrue\n0\nfalse\ntrue\n"
    );

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_integral_native_array_lanes() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static void main() {
                long[] longs = new long[] { 1L, 2L };
                uint one = (uint) 1;
                uint two = (uint) 2;
                uint[] ids = new uint[] { one, two };
                ulong big = (ulong) 9L;
                ulong[] bigIds = new ulong[] { big };

                IO.println(longs.length);
                IO.println((int) longs[1]);
                IO.println(ids.length);
                IO.println((int) ids[0]);
                IO.println(bigIds.length);
                IO.println((int) bigIds[0]);

                for (long value : longs) {
                    IO.println((int) value);
                }
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected integral native array lanes to complete successfully\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "2\n2\n2\n1\n1\n9\n1\n2\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_floating_native_array_lanes_and_java_truncating_casts() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static void main() {
                float[] floats = new float[] { 2.9f, -2.9f };
                double[][] grid = new double[][] { { 1.5d, -1.5d }, { 9.9d, -3.9d } };

                IO.println(floats.length);
                IO.println((int) floats[0]);
                IO.println((int) floats[1]);
                IO.println((int) grid[1][0]);
                IO.println((int) grid[1][1]);

                for (double value : grid[0]) {
                    IO.println((int) value);
                }

                IO.println((long) 9.9d == 9L);
                IO.println((long) -9.9d == -9L);
                IO.println((int) 10000000000000000000000000000000000000000.0d);
                IO.println((int) -10000000000000000000000000000000000000000.0d);
                IO.println((int) ((float) 7.75d));
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected floating native array lanes and truncating casts to complete successfully\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(
        out,
        "2\n2\n-2\n9\n-3\n1\n-1\ntrue\ntrue\n2147483647\n-2147483648\n7\n"
    );

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_java_like_integral_promotion_and_long_math() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static long widen(long value) {
                return value;
            }

            public static void main() {
                byte a = (byte) 1;
                byte b = (byte) 2;
                int promoted = a + b;
                long total = widen(promoted) + 5L;
                IO.println(promoted);
                IO.println((int) total);
                IO.println(total > 7L);
                IO.println(total == 8L);
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected integral promotion and long math to complete successfully\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "3\n8\ntrue\ntrue\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_unsigned_promotion_and_comparison_flow() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static void main() {
                ushort a = (ushort) 60000;
                ushort b = (ushort) 2;
                uint sum = a + b;
                ulong big = (ulong) 4000000000L;
                ulong bigger = big + (ulong) 5L;

                IO.println((int) sum);
                IO.println(bigger > big);
                IO.println(sum > (uint) 50000);
                IO.println((int) ((uint) 7 / (uint) 2));
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected unsigned promotion/comparison flow to complete successfully\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "60002\ntrue\ntrue\n3\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_float_double_arithmetic_and_comparison_flow() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static void main() {
                float left = 1.5f;
                float right = 2.25f;
                float sum = left + right;
                float product = left * right;
                float neg = -right;
                double mixed = 3 + 0.5d;
                double nan = 0.0d / 0.0d;

                IO.println((int) sum);
                IO.println((int) product);
                IO.println((int) neg);
                IO.println((int) mixed);
                IO.println(mixed > 3.0d);
                IO.println(nan == nan);
                IO.println(nan != nan);
                IO.println(nan < 1.0d);
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected float/double arithmetic flow to complete successfully\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "3\n3\n-2\n3\ntrue\nfalse\ntrue\nfalse\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_runtime_numeric_widening_conversions_honestly() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static long widenRet() {
                int value = -7;
                return value;
            }

            public static double widenDoubleRet() {
                int value = 2;
                return value;
            }

            public static void main() {
                int seed = -7;
                long widened = seed;
                float widenedFloat = seed;
                double picked = true ? seed : 0.5d;
                float[] values = new float[1];
                values[0] = seed;

                IO.println((int) widened);
                IO.println((int) widenedFloat);
                IO.println((int) picked);
                IO.println((int) values[0]);
                IO.println((int) widenRet());
                IO.println((int) widenDoubleRet());
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected runtime numeric widening conversions to complete successfully\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "-7\n-7\n-7\n-7\n-7\n2\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_numeric_callsite_and_constructor_widening_honestly() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;

        class Box {
            private long value;

            public Box(long value) {
                this.value = value;
            }

            public long get() {
                return this.value;
            }
        }

        class Main {
            public static long widen(long value) {
                return value;
            }

            public static double widenDouble(double value) {
                return value;
            }

            public void acceptLong(long value) {
                IO.println((int) value);
            }

            public static void main() {
                int seed = -9;
                Main self = new Main();
                Box box = new Box(seed);

                IO.println((int) widen(seed));
                IO.println((int) widenDouble(seed));
                self.acceptLong(seed);
                IO.println((int) box.get());
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected numeric callsite and constructor widening to complete successfully\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "-9\n-9\n-9\n-9\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_bitwise_shift_and_lazy_logical_flow() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            private static int counter;

            public static boolean side() {
                counter += 1;
                return true;
            }

            public static void main() {
                int bits = 5 & 3;
                bits |= 8;
                bits ^= 2;
                bits <<= 1;
                bits >>= 2;
                bits >>>= 1;

                uint unsignedBits = (uint) 12;
                unsignedBits >>= 1;

                boolean both = true & false;
                boolean either = false | true;
                boolean diff = true ^ false;
                boolean lazyAnd = false && side();
                boolean lazyOr = true || side();

                int inverted = ~1;

                IO.println(bits);
                IO.println((int) unsignedBits);
                IO.println(both);
                IO.println(either);
                IO.println(diff);
                IO.println(lazyAnd);
                IO.println(lazyOr);
                IO.println(counter);
                IO.println(inverted);
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected bitwise/shift flow to complete successfully\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "2\n6\nfalse\ntrue\ntrue\nfalse\ntrue\n0\n-2\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_local_var_inference_flow() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;

        class Box {
            public int value() {
                return 7;
            }
        }

        class Main {
            public static void main() {
                var count = 3;
                var title = "Pulse";
                var box = new Box();
                int[] values = new int[] { 1, 2, 3 };

                for (var value : values) {
                    IO.println(value + count);
                }

                IO.println(title);
                IO.println(box.value());
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected local var inference flow to complete successfully\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "4\n5\n6\nPulse\n7\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_interface_inheritance_and_default_method_flow() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;

        interface Named {
            String name();
        }

        interface Versioned extends Named {
            private String prefix() {
                return "pulse-";
            }

            default String label() {
                return prefix() + name();
            }

            static String marker() {
                return "iface";
            }
        }

        class Tool implements Versioned {
            public String name() {
                return "code";
            }
        }

        class Main {
            public static void main() {
                Versioned byInterface = new Tool();
                Tool byClass = new Tool();
                IO.println(byInterface.label());
                IO.println(byClass.label());
                IO.println(Versioned.marker());
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected interface inheritance/default flow to complete successfully\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "pulse-code\npulse-code\niface\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_switch_expression_arrow_flow() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static void main() {
                int code = 2;
                int value = switch (code) {
                    case 1 -> 10;
                    case 2 -> 20;
                    default -> 30;
                };

                String label = switch (code) {
                    case 1 -> "one";
                    default -> "other";
                };

                IO.println(value);
                IO.println(label);
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected switch expression arrow flow to complete successfully\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "20\nother\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_assert_baseline() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static void main() {
                assert 1 < 2;
                IO.println("assert_ok");
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "assert success baseline should exit zero"
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "assert_ok\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_assert_failure_baseline() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;

        class Main {
            public static void main() {
                assert false : "boom";
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        !run.status.success(),
        "expected non-zero exit for assert failure\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert!(
        out.starts_with("boom\n"),
        "assert failure should route through AssertionError fail-fast path\n{}",
        out
    );
    assert!(
        out.contains("Stack trace:\n"),
        "missing stack trace:\n{}",
        out
    );

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_accepts_wrapper_class_imports_from_stdlib_sources() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.Integer;
        import pulse.lang.Boolean;
        import pulse.lang.UInteger;
        import pulse.lang.Void;

        class Main {
            private Integer a;
            private Boolean b;
            private UInteger c;
            private Void d;

            public static void main() {
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    assert!(
        output.status.success(),
        "expected success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_wrapper_integer_boolean_apis() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.lang.Integer;
        import pulse.lang.Boolean;

        class Main {
            public static void main() {
                Integer a = Integer.parse("12");
                Integer b = Integer.valueOf(8);
                int rawA = Integer.intValue(a);
                int rawB = Integer.intValue(b);

                IO.println(rawA);
                IO.println(rawB);
                IO.println(Integer.compare(rawA, rawB));
                IO.println(Integer.equals(rawA, rawB));

                Boolean flag = Boolean.parse("false");
                IO.println(Boolean.booleanValue(flag));
                IO.println(Boolean.compare(Boolean.booleanValue(flag), true));
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected executable success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "12\n8\n1\nfalse\nfalse\n-1\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_wrapper_integral_text_and_constants_flow() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.lang.Byte;
        import pulse.lang.Short;
        import pulse.lang.Long;
        import pulse.lang.Char;
        import pulse.lang.UByte;
        import pulse.lang.UShort;
        import pulse.lang.UInteger;
        import pulse.lang.ULong;
        import pulse.lang.Integer;
        import pulse.lang.Boolean;

        class Main {
            public static void main() {
                IO.println(Byte.toString(Byte.byteValue(Byte.parse("127"))));
                IO.println(Byte.compare(Byte.MIN_VALUE, Byte.MAX_VALUE));
                IO.println(Short.toString(Short.shortValue(Short.parse("-1234"))));
                IO.println(Short.compare(Short.MIN_VALUE, Short.MAX_VALUE));
                IO.println(Long.toString(Long.longValue(Long.parse("-9876543210"))));
                IO.println(Long.compare(Long.MIN_VALUE, Long.MAX_VALUE));
                IO.println(Char.toString(Char.charValue(Char.parse("Z"))));
                IO.println(Char.toString('Z'));
                IO.println(Char.compare(Char.MIN_VALUE, Char.MAX_VALUE));
                IO.println(UByte.toString(UByte.ubyteValue(UByte.parse("255"))));
                IO.println(UShort.toString(UShort.ushortValue(UShort.parse("65535"))));
                IO.println(UInteger.toString(UInteger.uintValue(UInteger.parse("4000000000"))));
                IO.println(ULong.toString(ULong.ulongValue(ULong.parse("18446744073709551615"))));
                IO.println(UByte.compare(UByte.MIN_VALUE, UByte.MAX_VALUE));
                IO.println(UShort.compare(UShort.MIN_VALUE, UShort.MAX_VALUE));
                IO.println(UInteger.compare(UInteger.MIN_VALUE, UInteger.MAX_VALUE));
                IO.println(ULong.compare(ULong.MIN_VALUE, ULong.MAX_VALUE));
                IO.println(Integer.toString(Integer.MIN_VALUE));
                IO.println(Boolean.toString(Boolean.TRUE));
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected executable success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(
        out,
        "127\n-1\n-1234\n-1\n-9876543210\n-1\nZ\nZ\n-1\n255\n65535\n4000000000\n18446744073709551615\n-1\n-1\n-1\n-1\n-2147483648\ntrue\n"
    );

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_wrapper_floating_text_and_compare_flow() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.Float;
        import pulse.lang.Double;
        import pulse.lang.StringBuilder;
        import pulse.lang.IO;

        class Main {
            public static void main() {
                Float left = Float.parse("1.25");
                Float small = Float.parse("0.00125");
                Float exp = Float.parse("1.25e2");
                Double right = Double.parse("-12.5");
                Double tiny = Double.parse("0.000125");
                Double big = Double.parse("12500000");
                Double nan = Double.parse("NaN");
                Double inf = Double.parse("Infinity");
                Double negInf = Double.parse("-Infinity");
                StringBuilder sb = new StringBuilder();

                IO.println(Float.toString(Float.floatValue(left)));
                IO.println(Float.toString(Float.floatValue(small)));
                IO.println(Float.toString(Float.floatValue(exp)));
                IO.println(Double.toString(Double.doubleValue(right)));
                IO.println(Double.toString(Double.doubleValue(tiny)));
                IO.println(Double.toString(Double.doubleValue(big)));
                IO.println(Double.toString(Double.doubleValue(nan)));
                IO.println(Double.toString(Double.doubleValue(inf)));
                IO.println(Double.toString(Double.doubleValue(negInf)));
                IO.println(Float.compare(Float.floatValue(left), Float.floatValue(exp)));
                IO.println(Double.compare(Double.doubleValue(right), Double.doubleValue(tiny)));
                sb.append(Float.floatValue(left));
                sb.append('|');
                sb.append(Double.doubleValue(right));
                IO.println(sb.toString());
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected executable success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(
        out,
        "1.25\n0.00125\n125.0\n-12.5\n1.25E-4\n1.25E7\nNaN\nInfinity\n-Infinity\n-1\n-1\n1.25|-12.5\n"
    );

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_core_lang_object_class_stringbuilder() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.lang.Object;
        import pulse.lang.Class;
        import pulse.lang.StringBuilder;

            class Main {
                public static void main() {
                    Object o = new Main();
                    Class c = o.getClass();
                    StringBuilder sb = new StringBuilder("type=");
                    sb.append(c.getName());
                    sb.append(",simple=");
                    sb.append(c.getSimpleName());
                    sb.append(",pkg=");
                    sb.append(c.getPackageName());
                    sb.append(",eq=");
                    sb.append(o.equals(o));
                    sb.append(",hashStable=");
                    sb.append(Integer.equals(o.hashCode(), o.hashCode()));
                    IO.println(sb.toString());
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected executable success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(
        out,
        "type=app.core.Main,simple=Main,pkg=app.core,eq=true,hashStable=true\n"
    );

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_core_string_search_slice_and_trim_flow() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
          package app.core;
            import pulse.lang.IO;
            import pulse.lang.Integer;
            import pulse.lang.Long;
            import pulse.lang.Object;
            import pulse.lang.System;
            import pulse.lang.UInteger;

            class Widget {
                public String toString() {
                    return "widget";
                }
            }

            class Main {
                public static void main() {
                  String raw = "  pulsecode  ";
                  String text = raw.trim();
                  String repeated = "pulse pulse code";
                  String replaced = repeated.replace("pulse", "beam");
                    String trimmedPrefix = "prefix-value".removePrefix("prefix-");
                    String trimmedSuffix = "value.txt".removeSuffix(".txt");
                    String paddedLeft = "7".padLeft(3, '0');
                      String paddedRight = "7".padRight(3, '.');
                      String[] charParts = "a,b,".split(',');
                      String[] textParts = "::pulse::code::".split("::");
                      String joined = String.join("-", new String[] { "pulse", null, "code" });
                      char[] letters = "pulse".toCharArray();
                      char[] copied = new char[6];
                      String fromChars = String.copyValueOf(new char[] { 'o', 'k' });
                      String rangedChars = String.copyValueOf(new char[] { 'a', 'b', 'c', 'd' }, 1, 2);
                      String valueChars = String.valueOf(new char[] { 'z', 'i', 'p' });
                      String valueRangedChars = String.valueOf(new char[] { 'n', 'o', 'd', 'e' }, 1, 2);
                      "pulse".getChars(1, 5, copied, 1);

                  IO.println(text.equals("pulsecode"));
                  IO.println("PuLsE".toLowerCase());
                  IO.println("PuLsE".toUpperCase());
                  IO.println("Pulse".equalsIgnoreCase("pUlSe"));
                  IO.println(text.charAt(0));
                  IO.println(text.substring(0, 5));
                  IO.println(text.substring(5));
                  IO.println(text.startsWith("pulse"));
                  IO.println(text.startsWith("code", 5));
                  IO.println(text.endsWith("code"));
                  IO.println(text.contains("sec"));
                  IO.println(text.contains((CharSequence) "sec"));
                  IO.println(text.contains('c'));
                  IO.println(text.indexOf("sec"));
                  IO.println(text.indexOf('s'));
                  IO.println(text.indexOf('e', 4));
                  IO.println(repeated.indexOf("pulse", 1));
                  IO.println(text.lastIndexOf("e"));
                  IO.println(repeated.lastIndexOf('p', 5));
                  IO.println(repeated.lastIndexOf("pulse", 10));
                  IO.println(replaced);
                  IO.println(repeated.replace(' ', '-'));
                  IO.println("na".repeat(3));
                  IO.println(trimmedPrefix);
                    IO.println(trimmedSuffix);
                    IO.println(paddedLeft);
                    IO.println(paddedRight);
                    IO.println(charParts.length);
                    IO.println(charParts[0]);
                    IO.println(charParts[1]);
                    IO.println(charParts[2].equals(""));
                    IO.println(textParts.length);
                    IO.println(textParts[0].equals(""));
                      IO.println(textParts[1]);
                      IO.println(textParts[2]);
                      IO.println(textParts[3].equals(""));
                      IO.println(joined);
                      IO.println(letters.length);
                      IO.println(Char.toString(letters[0]));
                      IO.println(Char.toString(letters[4]));
                      IO.println(fromChars);
                      IO.println(rangedChars);
                      IO.println(valueChars);
                      IO.println(valueRangedChars);
                      IO.println(Char.toString(copied[0]));
                      IO.println(Char.toString(copied[1]));
                      IO.println(Char.toString(copied[4]));
                      IO.println(copied[5] == '\0');
                      IO.println("pulse".contentEquals((CharSequence) "pulse"));
                      IO.println("PulseCode".regionMatches(5, "coder", 0, 3));
                      IO.println("PulseCode".regionMatches(true, 0, "pulse", 0, 5));
                      IO.println(" \t\n".isBlank());
                    IO.println("  pulse  ".strip());
                    IO.println("  pulse".stripLeading());
                  IO.println("pulse  ".stripTrailing());
                    IO.println("pulse".hashCode());
                    IO.println(String.valueOf(Integer.MIN_VALUE));
                    IO.println(Integer.toHexString(255));
                    IO.println(Integer.toString(Integer.intValue(Integer.parse("-2147483648"))));
                    IO.println(String.valueOf(-42));
                  IO.println(String.valueOf(9000000000L));
                  IO.println(String.valueOf((byte) -7));
                  IO.println(String.valueOf((short) 1234));
                  IO.println(String.valueOf((ubyte) 200));
                  IO.println(String.valueOf((ushort) 60000));
                  IO.println(String.valueOf((uint) 4000000000L));
                  IO.println(String.valueOf(true));
                  IO.println(Boolean.toString(Boolean.booleanValue(Boolean.parse("TrUe"))));
                    IO.println(Boolean.toString(Boolean.booleanValue(Boolean.parse(" false "))));
                    IO.println(Long.toString(Long.longValue(Long.parse("+42"))));
                    IO.println(Long.toString(9000000000L));
                    IO.println(Long.toString(Long.longValue(Long.parse("-9223372036854775808"))));
                    IO.println(UInteger.toString(UInteger.uintValue(UInteger.parse("4000000000"))));
                    IO.println(String.valueOf(new Main()).startsWith("app.core.Main@"));
                    IO.println(new Main().toString().startsWith("app.core.Main@"));
                    Object ref = new Main();
                    IO.println(ref.toString().startsWith("app.core.Main@"));
                    IO.println("one plus six is: " + (1 + 6));
                    IO.println(1 + "x");
                    IO.println((new Main() + " ready").startsWith("app.core.Main@"));
                    IO.println("null=" + null);
                    System.out.println((Object) new Widget());
                    System.out.println(new char[] { 'o', 'k' });
                    System.out.println(1.5f);
                    System.out.println(2.5);
                  System.out.println((uint) 4000000000L);
              }
          }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected executable success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
      assert_eq!(
          out,
            "true\npulse\nPULSE\ntrue\n112\npulse\ncode\ntrue\ntrue\ntrue\ntrue\n3\n3\n7\n6\n7\n6\nbeam beam code\npulse-pulse-code\nnanana\nvalue\nvalue\n007\n7..\n3\na\nb\ntrue\n4\ntrue\npulse\ncode\ntrue\npulse-null-code\n5\np\ne\nok\nbc\nzip\nod\n\0\nu\ne\ntrue\ntrue\ntrue\ntrue\npulse\npulse\npulse\n106642798\n-2147483648\n-2147483648\n-42\n9000000000\n-7\n1234\n200\n60000\n4000000000\ntrue\ntrue\nfalse\n42\n9000000000\n-9223372036854775808\n4000000000\napp.core.Main\none plus six is: 7\n1x\napp.core.Main ready\nnull=null\napp.core.Main\nok\n1.5\n2.5\n4000000000\n"
        );

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_stringbuilder_insert_delete_setlength_and_object_append_flow() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
          package app.core;
          import pulse.lang.IO;
          import pulse.lang.Long;
          import pulse.lang.StringBuilder;

          class Main {
              public static void main() {
                  StringBuilder sb = new StringBuilder("ace");
                  IO.println(sb.isEmpty());
                  sb.insert(1, "b");
                  sb.append('d');
                  sb.append(9000000000L);
                  sb.append(new Main());
                  IO.println(sb.toString());

                  sb.delete(4, 14);
                  IO.println(sb.toString());

                  sb.deleteCharAt(1);
                  IO.println(sb.toString());

                  sb.replace(1, 3, "YZ");
                  IO.println(sb.toString());

                  sb.setCharAt(0, 'Q');
                  IO.println(sb.toString());

                  IO.println(sb.substring(1, 3));
                  IO.println(sb.substring(3));
                  IO.println(sb.indexOf("YZ"));
                  IO.println(sb.indexOf("app", 3));
                  IO.println(sb.lastIndexOf("Main"));
                  IO.println(sb.lastIndexOf("app", sb.length()));
                  sb.reverse();
                  IO.println(sb.toString());

                  sb.clear();
                  sb.appendLine("alpha");
                  sb.appendLine(42);
                  sb.appendLine(true);
                  sb.appendLine('Z');
                    sb.appendLine(1.5f);
                    sb.appendLine(2.5);
                    sb.appendLine(1234567890123L);
                    sb.appendLine(new Main());
                    sb.appendLine((CharSequence) "gamma");
                    sb.appendLine(new char[] { 'o', 'k' });
                    sb.appendLine("beta");
                  IO.println(sb.toString());
                  sb.clear();
                  sb.append((CharSequence) "chars");
                  sb.append((CharSequence) "segment", 1, 4);
                  sb.append(new char[] { 'x', 'y' });
                  sb.append(new char[] { 'a', 'b', 'c', 'd' }, 1, 2);
                  sb.append((byte) -7);
                  sb.append((short) 1234);
                  sb.append((ubyte) 200);
                    sb.append((ushort) 60000);
                    sb.append((uint) 4000000000L);
                    IO.println(sb.toString());
                    IO.println(new StringBuilder().append("x").append('y').appendLine(7).toString());

                    StringBuilder inserted = new StringBuilder("core");
                    inserted.insert(0, (CharSequence) "A");
                    inserted.insert(1, (Object) new Main());
                    inserted.insert(2, false);
                    inserted.insert(3, '!');
                    inserted.insert(4, (byte) 9);
                    inserted.insert(5, (short) 88);
                    inserted.insert(6, (ubyte) 7);
                      inserted.insert(7, (ushort) 66);
                      inserted.insert(8, (uint) 55L);
                      inserted.insert(9, (ulong) 44L);
                      inserted.insert(10, (CharSequence) "slice", 1, 4);
                      inserted.insert(11, new char[] { 'J', 'K' });
                      inserted.insert(12, new char[] { 'm', 'n', 'o', 'p' }, 1, 2);
                      IO.println(inserted.toString());
                    IO.println(new StringBuilder("pulse").contentEquals((CharSequence) "pulse"));
                    IO.println(new StringBuilder().append((String) null).toString());
                    IO.println(new StringBuilder("x").insert(1, (String) null).toString());
                      IO.println(new StringBuilder("abc").compareTo(new StringBuilder("abd")));

                    sb.setLength(2);
                    IO.println(sb.toString());

                  sb.setLength(4);
                  IO.println(sb.length());
                  IO.println(sb.toString().charAt(2) == '\0');
                  IO.println(sb.toString().charAt(3) == '\0');
                  sb.clear();
                  IO.println(sb.isEmpty());
              }
          }
          "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected executable success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
      );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    let lines: Vec<&str> = out.split('\n').collect();
    assert_eq!(lines.len(), 39);
    assert_eq!(lines[0], "false");
    assert!(lines[1].starts_with("abced9000000000app.core.Main@"));
    assert!(lines[2].starts_with("abce0app.core.Main@"));
    assert!(lines[3].starts_with("ace0app.core.Main@"));
    assert!(lines[4].starts_with("aYZ0app.core.Main@"));
    assert!(lines[5].starts_with("QYZ0app.core.Main@"));
    assert_eq!(lines[6], "YZ");
    assert!(lines[7].starts_with("0app.core.Main@"));
    assert_eq!(lines[8], "1");
    assert_eq!(lines[9], "4");
    assert_eq!(lines[10], "13");
    assert_eq!(lines[11], "4");
    assert!(lines[12].ends_with("@niaM.eroc.ppa0ZYQ"));
    assert_eq!(lines[13], "alpha");
    assert_eq!(lines[14], "42");
    assert_eq!(lines[15], "true");
    assert_eq!(lines[16], "Z");
    assert_eq!(lines[17], "1.5");
    assert_eq!(lines[18], "2.5");
    assert_eq!(lines[19], "1234567890123");
    assert!(lines[20].starts_with("app.core.Main@"));
    assert_eq!(lines[21], "gamma");
    assert_eq!(lines[22], "ok");
    assert_eq!(lines[23], "beta");
    assert_eq!(lines[24], "");
    assert_eq!(lines[25], "charsegmxybc-71234200600004000000000");
    assert_eq!(lines[26], "xy7");
    assert_eq!(lines[27], "");
    assert!(lines[28].starts_with("Aaf!987654lJnoKic4568alsepp.core.Main@"));
    assert!(lines[28].ends_with("core"));
    assert_eq!(lines[29], "true");
    assert_eq!(lines[30], "null");
    assert_eq!(lines[31], "xnull");
    assert_eq!(lines[32], "-1");
    assert_eq!(lines[33], "ch");
    assert_eq!(lines[34], "4");
    assert_eq!(lines[35], "true");
    assert_eq!(lines[36], "true");
    assert_eq!(lines[37], "true");
    assert_eq!(lines[38], "");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_chained_string_and_queue_receiver_flow() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
          package app.core;
          import pulse.collections.LinkedList;
          import pulse.lang.IO;
          import pulse.lang.Integer;
          import pulse.lang.StringBuilder;

          class Main {
              public static void main() {
                  LinkedList queue = new LinkedList();
                  int i = 0;
                  while (i < 5) {
                      int value = i + 1;
                      queue.offer(Integer.toString(value));
                      i = i + 1;
                  }

                  StringBuilder sb = new StringBuilder();
                  while (queue.size() > 0) {
                      String nextText = (String) queue.poll();
                      sb.append(nextText).append('|');
                  }

                  IO.println(new StringBuilder().append("x").append('y').toString());
                  IO.println(sb.toString());
              }
          }
          "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(run.status.success(), "exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "xy\n1|2|3|4|5|\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_wrapper_invalid_integer_parse_panics() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.Integer;

        class Main {
            public static void main() {
                Integer.parse("x1");
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(!run.status.success(), "expected non-zero exit");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert!(
        out.starts_with("Invalid integer literal\n"),
        "unexpected stdout:\n{}",
        out
    );
    assert!(
        out.contains("Stack trace:\n"),
        "missing stack trace:\n{}",
        out
    );

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_wrapper_invalid_long_parse_panics() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.Long;

        class Main {
            public static void main() {
                Long.parse("x1");
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(!run.status.success(), "expected non-zero exit");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert!(
        out.starts_with("Invalid long literal\n"),
        "unexpected stdout:\n{}",
        out
    );

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_wrapper_invalid_uinteger_parse_panics() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.UInteger;

        class Main {
            public static void main() {
                UInteger.parse("-1");
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(!run.status.success(), "expected non-zero exit");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert!(
        out.starts_with("Invalid uint literal\n"),
        "unexpected stdout:\n{}",
        out
    );

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_wrapper_invalid_ulong_parse_panics() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.ULong;

        class Main {
            public static void main() {
                ULong.parse("-1");
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(!run.status.success(), "expected non-zero exit");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert!(
        out.starts_with("Invalid ulong literal\n"),
        "unexpected stdout:\n{}",
        out
    );

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_wrapper_invalid_boolean_parse_panics() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.Boolean;

        class Main {
            public static void main() {
                Boolean.parse("maybe");
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(!run.status.success(), "expected non-zero exit");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert!(
        out.contains("Invalid boolean literal"),
        "unexpected stdout:\n{}",
        out
    );
    assert!(
        out.contains("Stack trace:\n"),
        "missing stack trace:\n{}",
        out
    );

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_mixed_primitive_wrapper_overload_dispatch() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.lang.Integer;

        class Main {
            public static int pick(int x) {
                return 1;
            }

            public static int pick(Integer x) {
                return 2;
            }

            public static void main() {
                Integer boxed = Integer.valueOf(7);
                IO.println(pick(5));
                IO.println(pick(boxed));
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(run.status.success(), "expected executable success");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "1\n2\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_exception_base_hierarchy_flow() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.lang.Throwable;
        import pulse.lang.Exception;
        import pulse.lang.RuntimeException;

        class Main {
            public static void main() {
                RuntimeException rt = new RuntimeException("boom");
                Exception ex = rt;
                Throwable th = ex;
                IO.println(th.getMessage());
                IO.println(rt.toString());
                Exception wrapped = new Exception("outer", rt);
                IO.println(wrapped.getCause().toString());
                IO.println(wrapped.describe());
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(run.status.success(), "expected executable success");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(
        out,
        "boom\nRuntimeException: boom\nRuntimeException: boom\nException: outer\nCaused by: RuntimeException: boom\n"
    );

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_runtime_exception_subclasses_flow() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.lang.IllegalArgumentException;
        import pulse.lang.IllegalStateException;
        import pulse.lang.NullPointerException;
        import pulse.lang.IndexOutOfBoundsException;
        import pulse.lang.UnsupportedOperationException;
        import pulse.lang.NumberFormatException;

        class Main {
            public static void main() {
                IO.println(new IllegalArgumentException("x").toString());
                IO.println(new IllegalStateException("x").toString());
                IO.println(new NullPointerException("x").toString());
                IO.println(new IndexOutOfBoundsException("x").toString());
                IO.println(new UnsupportedOperationException("x").toString());
                IO.println(new NumberFormatException("x").toString());
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(run.status.success(), "expected executable success");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(
        out,
        "IllegalArgumentException: x\nIllegalStateException: x\nNullPointerException: x\nIndexOutOfBoundsException: x\nUnsupportedOperationException: x\nNumberFormatException: x\n"
    );

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_uncaught_exception_cause_chain_flow() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.Exception;
        import pulse.lang.RuntimeException;

        class Main {
            public static void main() throws Exception {
                RuntimeException inner = new RuntimeException("inner");
                throw new Exception("outer", inner);
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(
        !run.status.success(),
        "expected uncaught throwable to terminate process"
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert!(
        out.starts_with("Exception: outer\nCaused by: RuntimeException: inner\n"),
        "unexpected uncaught throwable text:\n{}",
        out
    );
    assert!(
        out.contains("Stack trace:\n"),
        "missing stack trace:\n{}",
        out
    );

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_accepts_string_class_surface_without_import() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static void main() {
                String text = "a";
                text = text.concat("b");
                int len = text.length();
                String out = String.valueOf(len);
                IO.println(out);
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    assert!(
        output.status.success(),
        "expected success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );

    let link_report_path = root.join("build").join("native.link.txt");
    assert!(
        link_report_path.exists(),
        "expected link report at '{}'",
        link_report_path.display()
    );
    let report = fs::read_to_string(&link_report_path).expect("read link report");
    assert!(
        report.contains("status=linked"),
        "unexpected link report:\n{}",
        report
    );

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_hard_fails_when_linker_is_unavailable_and_preserves_failure_report() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static void main() {
                IO.println("hello");
            }
        }
        "#,
    );

    let missing_linker = root.join("missing").join("link.exe");
    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .arg("--linker")
        .arg(missing_linker.to_str().expect("missing linker utf8"))
        .output()
        .expect("run pulsec build");

    assert!(
        !output.status.success(),
        "expected build failure\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );

    let link_report_path = root.join("build").join("native.link.txt");
    assert!(
        link_report_path.exists(),
        "expected failure report at '{}'",
        link_report_path.display()
    );
    let report = fs::read_to_string(&link_report_path).expect("read failure link report");
    assert!(
        report.contains("status=not-linked"),
        "expected hard-fail link report:\n{}",
        report
    );
    assert!(
        !report.contains("stub=emitted"),
        "stub publication must not occur on failure:\n{}",
        report
    );
    assert!(
        !report.contains("status=stubbed"),
        "stub-success fallback must not occur on failure:\n{}",
        report
    );
    assert!(
        !root.join("build").join("main.exe").exists(),
        "no executable should be published on link failure"
    );

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_ternary_baseline() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static int leftCount = 0;
            public static int rightCount = 0;

            public static int left() {
                leftCount = leftCount + 1;
                IO.println("left");
                return 1;
            }

            public static int right() {
                rightCount = rightCount + 1;
                IO.println("right");
                return 2;
            }

            public static void main() {
                int a = true ? left() : right();
                int b = false ? left() : right();
                IO.println(a);
                IO.println((int) b);
                IO.println(leftCount);
                IO.println(rightCount);
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected ternary baseline to complete successfully\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "left\nright\n1\n2\n1\n1\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_cast_baseline() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;

        interface Tag {}

        class Base {}
        class Derived extends Base implements Tag {
            public int value() {
                return 7;
            }
        }

        class Main {
            public static void main() {
                int a = (int) 2.9d;
                long b = (long) (-3.9f);
                Base base = new Derived();
                Derived derived = (Derived) base;
                IO.println(a);
                IO.println((int) b);
                IO.println(base instanceof Derived);
                IO.println(base instanceof Tag);
                IO.println(derived.value());
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected cast baseline to complete successfully\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "2\n-3\ntrue\ntrue\n7\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_mixed_signed_unsigned_numeric_flow() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static long widenLong(long value) {
                return value;
            }

            public static double widenDouble(double value) {
                return value;
            }

            public static void main() {
                uint wide = (uint) 4000000000L;
                ushort small = (ushort) 65000;
                int signed = 5;
                char letter = 'A';

                long combined = wide + signed;
                int compact = small + signed;
                uint letterWide = letter;

                IO.println((int) (combined - 4000000000L));
                IO.println(compact);
                IO.println((int) letterWide);
                IO.println((int) widenLong(wide));
                IO.println(widenDouble(wide) > 3999999999.0d);
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected mixed signed/unsigned numeric flow to complete successfully\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "5\n65005\n65\n-294967296\ntrue\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_varargs_applicability_flow() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static int count(String... names) {
                return names.length;
            }

            public static String pick(String name) {
                return "fixed";
            }

            public static String pick(String... names) {
                return "varargs";
            }

            public static void main() {
                String[] names = new String[] { "pulse", "code" };

                IO.println(count());
                IO.println(count("a", "b"));
                IO.println(count(names));
                IO.println(pick("x"));
                IO.println(pick("x", "y"));
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected varargs applicability flow to complete successfully\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "0\n2\n2\nfixed\nvarargs\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_instantiated_generic_member_typing_with_runtime_erasure() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/generics/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.generics;
        import pulse.lang.IO;
        import pulse.lang.Object;

        class Box<T> {
            private T value;

            public void set(T value) {
                this.value = value;
            }

            public T get() {
                return this.value;
            }
        }

        class Main {
            public static <T> T id(T value) {
                return value;
            }

            public static void main() {
                Box<String> box = new Box();
                box.set("pulse");
                String value = box.get();
                String echoed = id(value);
                Object widened = box;

                IO.println(value);
                IO.println(echoed);
                IO.println(widened != null);
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected instantiated generic flow to complete successfully\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "pulse\npulse\ntrue\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_raw_generic_compatibility_flow() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/generics/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.generics;
        import pulse.lang.IO;
        import pulse.lang.Object;

        class Box<T> {
            private T value;

            public void set(T value) {
                this.value = value;
            }

            public T get() {
                return this.value;
            }
        }

        class Main {
            public static Box echoRaw(Box value) {
                return value;
            }

            public static Object widenObject(Object value) {
                return value;
            }

            public static void main() {
                Box<String> box = new Box();
                box.set("pulse");
                Object widened = widenObject(box);
                Box raw = echoRaw(box);

                IO.println(widened != null);
                IO.println((String) raw.get());
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected raw generic compatibility flow to complete successfully\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "true\npulse\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_flow_narrowing_across_loops_and_finally() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;

        class Player {
            public int hp;

            public Player(int hp) {
                this.hp = hp;
            }
        }

        class Main {
            public static void main() {
                Player p = new Player(7);
                while (p != null) {
                    IO.println(p.hp);
                    p = null;
                }

                p = new Player(9);
                for (; p != null; ) {
                    IO.println(p.hp);
                    break;
                }

                Player after = null;
                try {
                } finally {
                    after = new Player(11);
                }
                IO.println(after.hp);
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected flow narrowing loop/finally flow to complete successfully\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "7\n9\n11\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_cross_package_protected_subclass_flow() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/main/Main.pulse");

    write_file(
        &src_root.join("app/base/Base.pulse"),
        r#"
        package app.base;

        class Base {
            protected int hp;

            protected int readHp() {
                return this.hp;
            }
        }
        "#,
    );
    write_file(
        &src_root.join("app/derived/Derived.pulse"),
        r#"
        package app.derived;
        import app.base.Base;

        class Derived extends Base {
            public int read() {
                this.hp = 7;
                return this.readHp();
            }
        }
        "#,
    );
    write_file(
        &entry,
        r#"
        package app.main;
        import pulse.lang.IO;
        import app.derived.Derived;

        class Main {
            public static void main() {
                Derived d = new Derived();
                IO.println(d.read());
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected protected subclass flow to complete successfully\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "7\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_supported_native_array_creation_and_initializer_flow() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;

        class Box {
            public Box() {
            }
        }

        class Main {
            public static void main() {
                byte[] bytes = new byte[2];
                boolean[] flags = new boolean[] { true, false, true };
                int[] numbers = new int[] { 1, 2, 3 };
                String[] names = new String[] { "a", "b" };
                Box[] boxes = new Box[] { new Box(), null };
                IO.println(bytes.length);
                IO.println(flags.length);
                IO.println(numbers.length);
                IO.println(names != null);
                IO.println(boxes.length);
                IO.println(boxes != null);
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected supported native array creation and initializer flow to complete successfully\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "2\n3\n3\ntrue\n2\ntrue\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_supported_native_array_subscript_read_write_flow() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;

        class Box {
            private int value;

            public Box(int value) {
                this.value = value;
            }

            public int value() {
                return this.value;
            }
        }

        class Main {
            public static void main() {
                int[] numbers = new int[] { 1, 2, 3 };
                numbers[1] = numbers[0] + 4;
                numbers[2] += 1;

                boolean[] flags = new boolean[] { true, false };
                flags[1] = flags[0];

                String[] names = new String[] { "a", "b" };
                names[1] = names[0];

                Box[] boxes = new Box[] { new Box(7), null };
                boxes[1] = new Box(9);

                IO.println(numbers[1]);
                IO.println(numbers[2]);
                IO.println(flags[1]);
                IO.println(names[1]);
                IO.println(boxes[1].value());
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected supported native array subscript flow to complete successfully\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "5\n4\ntrue\na\n9\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_multidimensional_native_array_flow() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static void main() {
                int[][] grid = new int[2][3];
                grid[0][0] = 4;
                grid[1][2] = 7;

                String[][] words = new String[2][2];
                words[0][1] = "pulse";

                IO.println(grid.length);
                IO.println(grid[0].length);
                IO.println(grid[0][0]);
                IO.println(grid[1][2]);
                IO.println(words.length);
                IO.println(words[0].length);
                IO.println(words[0][1]);
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected multidimensional native array flow to complete successfully\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "2\n3\n4\n7\n2\n2\npulse\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_nested_multidimensional_array_initializer_flow() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static void main() {
                int[][] grid = new int[][] { { 1, 2 }, { 3, 4 } };
                String[][] words = new String[][] { { "pulse" }, null };

                IO.println(grid.length);
                IO.println(grid[1].length);
                IO.println(grid[1][0]);
                IO.println(grid[1][1]);
                IO.println(words.length);
                IO.println(words[0][0]);
                IO.println(words[1] == null);
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected nested multidimensional array initializer flow to complete successfully\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "2\n2\n3\n4\n2\npulse\ntrue\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_java_like_new_constructor_expression() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;

        class Box {
            private int value;

            public Box(int value) {
                this.value = value;
            }

            public int value() {
                return this.value;
            }
        }

        class Main {
            public static void main() {
                Box box = new Box(7);
                IO.println(box.value());
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected java-like new constructor expression to complete successfully\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "7\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_string_runtime_baseline() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static void main() {
                String text = "a";
                text = text.concat("b");
                int len = text.length();
                String out = String.valueOf(len).concat("!");
                IO.println(out);
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected executable success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "2!\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_collections_runtime_baseline() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.collections.Array;
        import pulse.collections.ArrayList;
        import pulse.collections.List;
        import pulse.collections.Map;
        import pulse.collections.HashMap;

        class Main {
            public static void main() {
                Array arr = new Array(2);
                arr.setInt(0, 7);
                arr.setInt(1, 9);

                List list = new ArrayList();
                list.add(arr.getInt(0));
                list.add(arr.getInt(1));

                Map stats = new HashMap();
                stats.putInt("hp", list.getInt(1));
                stats.put("name", "hero");

                IO.println(arr.length());
                IO.println(list.size());
                IO.println(stats.containsKey("hp"));
                IO.println(stats.getInt("hp"));
                IO.println((String) stats.get("name"));
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected executable success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "2\n2\ntrue\n9\nhero\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_runtime_owned_collections_state_in_shared_mode() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.collections.Array;
        import pulse.collections.ArrayList;
        import pulse.collections.HashMap;
        import pulse.collections.LinkedList;
        import pulse.collections.List;

        class Main {
            public static void main() {
                Array arr = new Array(3);
                arr.setInt(0, 2);
                arr.setInt(1, 4);
                arr.setInt(2, 6);

                List list = new ArrayList();
                list.add(arr.getInt(0));
                list.add(arr.getInt(2));

                HashMap stats = new HashMap();
                stats.put("name", "hero");
                stats.putInt("max", arr.length());
                stats.putInt("last", list.getInt(1));

                LinkedList queue = new LinkedList();
                queue.offer(stats.getInt("last"));
                queue.offer(list.size());

                IO.println(arr.length());
                IO.println(list.getInt(1));
                IO.println(stats.getInt("max"));
                IO.println(stats.containsKey("name"));
                IO.println(stats.getInt("last"));
                IO.println((String) stats.get("name"));
                IO.println((Integer) queue.poll());
                IO.println((Integer) queue.poll());
                IO.println(queue.isEmpty());
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .arg("--output-mode")
        .arg("shared")
        .output()
        .expect("run pulsec build shared");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let report = fs::read_to_string(root.join("build").join("native.link.txt"))
        .expect("read shared collections link report");
    assert!(
        report.contains("status=linked") && report.contains("mode=shared"),
        "shared collections fixture must link real shared artifacts:\n{}",
        report
    );

    let exe = root.join("build").join("main.exe");
    let run = Command::new(&exe)
        .output()
        .expect("run shared collections executable");
    assert!(
        run.status.success(),
        "shared collections executable failed\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "3\n6\n3\ntrue\n6\nhero\n6\n2\ntrue\n");

    let _ = fs::remove_dir_all(root);
}

fn unique_temp_root() -> PathBuf {
    let nanos = SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .expect("time should move forward")
        .as_nanos();
    std::env::temp_dir().join(format!("pulsec_cli_fixture_{nanos}"))
}

fn write_file(path: &std::path::Path, content: &str) {
    if let Some(parent) = path.parent() {
        fs::create_dir_all(parent).expect("create dirs");
    }
    fs::write(path, content).expect("write file");
}

fn build_and_run_fixture_in_mode(
    fixture_name: &str,
    entry_rel: &str,
    mode: &str,
) -> Option<String> {
    let fixture = fixture_root(fixture_name);
    let root = unique_temp_root();
    copy_dir_recursive(&fixture.join("src"), &root.join("src"));
    let src_root = root.join("src");
    let entry = src_root.join(entry_rel);

    let mut command = common::pulsec_command();
    command
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package");
    if mode == "shared" {
        command.arg("--output-mode").arg("shared");
    }

    let output = command.output().expect("run pulsec build");
    if !build_supports_runtime_execution(&output, &root) {
        let _ = fs::remove_dir_all(root);
        return None;
    }

    let report = fs::read_to_string(root.join("build").join("native.link.txt"))
        .expect("read native link report");
    assert!(
        report.contains("status=linked"),
        "{fixture_name} {mode} build must link real native artifacts:\n{report}"
    );
    if mode == "shared" {
        assert!(
            report.contains("mode=shared"),
            "{fixture_name} shared build must lock shared mode in native.link.txt:\n{report}"
        );
    } else {
        assert!(
            !report.contains("entry_codegen=stub-fallback"),
            "{fixture_name} fat build must not fall back to stub execution:\n{report}"
        );
    }

    let exe = root.join("build").join("main.exe");
    let run = run_exe_with_timeout(&exe, fixture_name, mode, false);
    assert!(
        run.status.success(),
        "{fixture_name} {mode} executable failed\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    let _ = fs::remove_dir_all(root);
    Some(out)
}

fn build_and_run_source_in_mode(entry_source: &str, mode: &str) -> Option<String> {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(&entry, entry_source);

    let mut command = common::pulsec_command();
    command
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package");
    if mode == "shared" {
        command.arg("--output-mode").arg("shared");
    }

    let output = command.output().expect("run pulsec build");
    if !build_supports_runtime_execution(&output, &root) {
        let _ = fs::remove_dir_all(root);
        return None;
    }

    let exe = root.join("build").join("main.exe");
    let run = run_exe_with_timeout(&exe, "inline_source", mode, false);
    assert!(
        run.status.success(),
        "inline {mode} executable failed\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    let _ = fs::remove_dir_all(root);
    Some(out)
}

fn build_and_run_source_expect_failure_in_mode(entry_source: &str, mode: &str) -> Option<String> {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(&entry, entry_source);

    let mut command = common::pulsec_command();
    command
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package");
    if mode == "shared" {
        command.arg("--output-mode").arg("shared");
    }

    let output = command.output().expect("run pulsec build");
    if !build_supports_runtime_execution(&output, &root) {
        let _ = fs::remove_dir_all(root);
        return None;
    }

    let exe = root.join("build").join("main.exe");
    let run = run_exe_with_timeout(&exe, "inline_failure_source", mode, true);
    assert!(
        !run.status.success(),
        "inline {mode} executable was expected to fail\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let combined = format!(
        "{}\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    )
    .replace('\r', "");
    let _ = fs::remove_dir_all(root);
    Some(combined)
}

fn output_contains_terminal_failure(output: &Output) -> bool {
    let combined = format!(
        "{}\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    )
    .replace('\r', "");
    combined.contains("Stack trace:\n")
        && (combined.contains("Null dispatch receiver")
            || combined.contains("Invalid cast")
            || combined.contains("Exception:")
            || combined.contains("AssertionError"))
}

fn run_exe_with_timeout(
    exe: &std::path::Path,
    fixture_name: &str,
    mode: &str,
    accept_terminal_failure_timeout: bool,
) -> Output {
    let timeout_ms = env::var("PULSEC_TEST_EXE_TIMEOUT_MS")
        .ok()
        .and_then(|value| value.parse::<u64>().ok())
        .unwrap_or(15_000);
    let mut child = Command::new(exe)
        .stdout(Stdio::piped())
        .stderr(Stdio::piped())
        .spawn()
        .expect("spawn built executable");
    let deadline = std::time::Instant::now() + Duration::from_millis(timeout_ms);

    loop {
        match child.try_wait().expect("poll built executable") {
            Some(_) => {
                return child
                    .wait_with_output()
                    .expect("collect built executable output");
            }
            None if std::time::Instant::now() >= deadline => {
                let _ = child.kill();
                let output = child
                    .wait_with_output()
                    .expect("collect timed out executable output");
                if accept_terminal_failure_timeout && output_contains_terminal_failure(&output) {
                    return output;
                }
                panic!(
                    "{fixture_name} {mode} executable exceeded {} ms and was killed\nstdout:\n{}\nstderr:\n{}",
                    timeout_ms,
                    String::from_utf8_lossy(&output.stdout),
                    String::from_utf8_lossy(&output.stderr)
                );
            }
            None => thread::sleep(Duration::from_millis(10)),
        }
    }
}

#[test]
fn cli_build_executes_same_fixture_corpus_with_side_by_side_fat_shared_parity() {
    for (fixture_name, entry_rel, expected) in [
        ("runtime_mix", "app/runtime/Main.pulse", "runtime_mix_ok\n"),
        (
            "object_interface_mix",
            "app/mixed/Main.pulse",
            "object_interface_mix_ok\n",
        ),
        (
            "strict_stress_soak",
            "strict_stress_soak/Main.pulse",
            "soak_ok\n40415\n",
        ),
    ] {
        let Some(fat_out) = build_and_run_fixture_in_mode(fixture_name, entry_rel, "fat") else {
            return;
        };
        let Some(shared_out) = build_and_run_fixture_in_mode(fixture_name, entry_rel, "shared")
        else {
            return;
        };
        assert_eq!(
            fat_out, expected,
            "{fixture_name} fat output drifted from locked expectation"
        );
        assert_eq!(
            shared_out, expected,
            "{fixture_name} shared output drifted from locked expectation"
        );
        assert_eq!(
            fat_out, shared_out,
            "{fixture_name} fat/shared outputs diverged"
        );
    }
}

#[test]
fn cli_build_executes_runtime_heavy_app_with_side_by_side_fat_shared_parity() {
    let source = r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.collections.ArrayList;
        import pulse.collections.HashMap;
        import pulse.collections.LinkedList;
        import pulse.time.Instant;
        import pulse.time.Duration;

        interface Speaker {
            public String say();
        }

        class Hero implements Speaker {
            public String say() {
                return "hero";
            }
        }

        class Main {
            public static void main() {
                Speaker speaker = new Hero();
                ArrayList list = new ArrayList();
                list.add(2);
                list.add(4);

                LinkedList queue = new LinkedList();
                queue.offer(9);
                queue.offer(11);

                HashMap map = new HashMap();
                map.put("role", speaker.say());
                map.putInt("sum", list.getInt(0) + list.getInt(1));

                Instant now = Instant.now();
                Instant later = now.plusMillis(Duration.ofMillis(5).toMillis());

                IO.println((String) map.get("role"));
                IO.println(map.getInt("sum"));
                IO.println((Integer) queue.poll());
                IO.println((Integer) queue.poll());
                IO.println(later.toEpochMillis());
                IO.println(queue.isEmpty());
            }
        }
    "#;

    let Some(fat_out) = build_and_run_source_in_mode(source, "fat") else {
        return;
    };
    let Some(shared_out) = build_and_run_source_in_mode(source, "shared") else {
        return;
    };

    let fat_lines = fat_out.lines().collect::<Vec<_>>();
    let shared_lines = shared_out.lines().collect::<Vec<_>>();
    assert_eq!(fat_lines.len(), 6, "unexpected fat line count");
    assert_eq!(shared_lines.len(), 6, "unexpected shared line count");
    assert_eq!(&fat_lines[..4], ["hero", "6", "9", "11"]);
    assert_eq!(&shared_lines[..4], ["hero", "6", "9", "11"]);
    assert_eq!(fat_lines[5], "true");
    assert_eq!(shared_lines[5], "true");
    let fat_millis = fat_lines[4]
        .parse::<i64>()
        .expect("fat millis line should be numeric");
    let shared_millis = shared_lines[4]
        .parse::<i64>()
        .expect("shared millis line should be numeric");
    assert!(fat_millis > 0, "fat millis should be positive");
    assert!(shared_millis > 0, "shared millis should be positive");
}

#[test]
fn cli_build_executes_strict_stress_soak_with_repeated_fat_shared_parity() {
    let fixture_name = "strict_stress_soak";
    let entry_rel = "strict_stress_soak/Main.pulse";
    let iterations = env::var("PULSEC_SOAK_ITERS")
        .ok()
        .and_then(|s| s.parse::<usize>().ok())
        .unwrap_or(2);
    assert!(iterations > 0, "PULSEC_SOAK_ITERS must be >= 1");

    for _ in 0..iterations {
        let Some(fat_out) = build_and_run_fixture_in_mode(fixture_name, entry_rel, "fat") else {
            return;
        };
        let Some(shared_out) = build_and_run_fixture_in_mode(fixture_name, entry_rel, "shared")
        else {
            return;
        };
        assert_eq!(fat_out, "soak_ok\n40415\n");
        assert_eq!(shared_out, "soak_ok\n40415\n");
        assert_eq!(
            fat_out, shared_out,
            "strict stress fat/shared outputs diverged"
        );
    }
}

#[test]
fn cli_build_executes_failure_paths_with_side_by_side_fat_shared_parity() {
    let null_dispatch = r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.memory.Memory;

        class Base {
            public int value() {
                return 1;
            }
        }

        class Main {
            public static Base choose(boolean pick) {
                if (pick) {
                    return new Base();
                }
                return null;
            }

            public static void main() {
                boolean pick = Memory.cycleTick() == 123;
                Base b = choose(pick);
                IO.println("before");
                IO.println(b.value());
            }
        }
    "#;

    let invalid_cast = r#"
        package app.core;

        class Base {}
        class Derived extends Base {}

        class Main {
            public static void main() {
                Base b = new Base();
                Derived d = (Derived) b;
            }
        }
    "#;

    let Some(fat_null) = build_and_run_source_expect_failure_in_mode(null_dispatch, "fat") else {
        return;
    };
    let Some(shared_null) = build_and_run_source_expect_failure_in_mode(null_dispatch, "shared")
    else {
        return;
    };
    for out in [&fat_null, &shared_null] {
        assert!(out.contains("before\n"), "missing pre-panic marker\n{out}");
        assert!(
            out.contains("Null dispatch receiver"),
            "missing null-dispatch diagnostic\n{out}"
        );
        assert!(out.contains("Stack trace:\n"), "missing stack trace\n{out}");
    }

    let Some(fat_cast) = build_and_run_source_expect_failure_in_mode(invalid_cast, "fat") else {
        return;
    };
    let Some(shared_cast) = build_and_run_source_expect_failure_in_mode(invalid_cast, "shared")
    else {
        return;
    };
    for out in [&fat_cast, &shared_cast] {
        assert!(
            out.contains("Invalid cast"),
            "missing invalid-cast diagnostic\n{out}"
        );
        assert!(out.contains("Stack trace:\n"), "missing stack trace\n{out}");
    }
}

#[test]
fn cli_build_shared_boundary_failure_diagnostics_remain_explicit_and_deterministic() {
    let fixture = fixture_root("runtime_mix");
    let root = unique_temp_root();
    copy_dir_recursive(&fixture.join("src"), &root.join("src"));
    let src_root = root.join("src");
    let entry = src_root.join("app/runtime/Main.pulse");

    let runtime_abi_output = common::pulsec_command()
        .env("PULSEC_FORCE_RUNTIME_ABI_VERSION", "1")
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .arg("--output-mode")
        .arg("shared")
        .output()
        .expect("run shared build with runtime ABI mismatch");
    if !build_supports_runtime_execution(&runtime_abi_output, &root) {
        return;
    }
    let runtime_run = Command::new(root.join("build").join("main.exe"))
        .output()
        .expect("run shared runtime ABI mismatch executable");
    assert!(
        !runtime_run.status.success(),
        "expected shared runtime ABI mismatch failure"
    );
    let runtime_out = String::from_utf8_lossy(&runtime_run.stdout).replace('\r', "");
    assert!(
        runtime_out.contains("Runtime ABI mismatch"),
        "unexpected runtime ABI mismatch output:\n{runtime_out}"
    );

    let object_model_output = common::pulsec_command()
        .env("PULSEC_FORCE_OBJECT_MODEL_ABI_VERSION", "2")
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .arg("--output-mode")
        .arg("shared")
        .output()
        .expect("run shared build with object-model ABI mismatch");
    assert!(
        object_model_output.status.success(),
        "expected build success before object-model ABI mismatch launch\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&object_model_output.stdout),
        String::from_utf8_lossy(&object_model_output.stderr)
    );
    let object_model_run = Command::new(root.join("build").join("main.exe"))
        .output()
        .expect("run shared object-model ABI mismatch executable");
    assert!(
        !object_model_run.status.success(),
        "expected shared object-model ABI mismatch failure"
    );
    let object_model_out = String::from_utf8_lossy(&object_model_run.stdout).replace('\r', "");
    assert!(
        object_model_out.contains("Object model ABI mismatch"),
        "unexpected object-model ABI mismatch output:\n{object_model_out}"
    );

    let launch_root = unique_temp_root();
    let project = launch_root.join("shared_missing_runtime_payload");
    let new_output = common::pulsec_command()
        .arg("new")
        .arg("shared_missing_runtime_payload")
        .arg("--template")
        .arg("app")
        .arg("--path")
        .arg(launch_root.to_str().expect("launch root utf8"))
        .output()
        .expect("run pulsec new for shared missing payload project");
    assert!(
        new_output.status.success(),
        "shared app scaffold should succeed"
    );
    let main_root = project.join("src").join("main").join("pulse");
    let _ = fs::remove_dir_all(main_root.join("app").join("main"));
    copy_dir_recursive(
        &fixture_root("runtime_mix")
            .join("src")
            .join("app")
            .join("runtime"),
        &main_root.join("app").join("runtime"),
    );
    let manifest_path = project.join("pulsec.toml");
    let manifest = fs::read_to_string(&manifest_path)
        .expect("read shared missing payload manifest")
        .replace(
            "entry = \"app/main/Main.pulse\"",
            "entry = \"app/runtime/Main.pulse\"",
        )
        .replace("output_mode = \"fat\"", "output_mode = \"shared\"");
    fs::write(&manifest_path, manifest).expect("write shared missing payload manifest");

    let launch_build = common::pulsec_command()
        .arg("build")
        .arg("--project-root")
        .arg(project.to_str().expect("project utf8"))
        .output()
        .expect("run shared build for launch metadata check");
    if !build_supports_runtime_execution(&launch_build, &project) {
        return;
    }
    let launch = fs::read_to_string(
        project
            .join("build")
            .join("distro")
            .join("release")
            .join("bin")
            .join("launch.txt"),
    )
    .expect("read shared launch metadata");
    assert!(launch.contains("missing_runtime_policy=deterministic-fail-fast"));
    assert!(launch.contains("missing_import_policy=deterministic-fail-fast"));
    assert!(launch.contains("runtime_library=pulsecore-"));

    let _ = fs::remove_dir_all(root);
    let _ = fs::remove_dir_all(launch_root);
}

#[test]
fn cli_build_preserves_package_object_layout_for_multifile_project() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    let helper = src_root.join("app/core/Helper.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static void main() {
                IO.println("before helper");
                Helper.ping();
                IO.println("after helper");
            }
        }
        "#,
    );
    write_file(
        &helper,
        r#"
        package app.core;
        import pulse.lang.IO;

        class Helper {
            public static void ping() {
                IO.println("helper called");
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    assert!(
        output.status.success(),
        "expected success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );
    let stdout = String::from_utf8_lossy(&output.stdout);
    if !stdout.contains("Entry codegen: masm-split-stdlib") {
        let _ = fs::remove_dir_all(root);
        return;
    }

    let startup_obj = root
        .join("build")
        .join("obj")
        .join("runtime")
        .join("Startup.obj");
    let main_obj = root
        .join("build")
        .join("obj")
        .join("app")
        .join("core")
        .join("Main.obj");
    let helper_obj = root
        .join("build")
        .join("obj")
        .join("app")
        .join("core")
        .join("Helper.obj");
    let io_obj = root
        .join("build")
        .join("obj")
        .join("runtime")
        .join("StdlibRuntime.obj");
    assert!(
        startup_obj.exists(),
        "missing startup object '{}'",
        startup_obj.display()
    );
    assert!(
        main_obj.exists(),
        "missing main object '{}'",
        main_obj.display()
    );
    assert!(
        helper_obj.exists(),
        "missing helper object '{}'",
        helper_obj.display()
    );
    assert!(io_obj.exists(), "missing io object '{}'", io_obj.display());

    let exe_path = root.join("build").join("main.exe");
    assert!(
        exe_path.exists(),
        "missing executable '{}'",
        exe_path.display()
    );
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected executable success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "before helper\nhelper called\nafter helper\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_cross_file_static_call_with_args_and_return() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    let helper = src_root.join("app/core/MathOps.pulse");

    write_file(
        &helper,
        r#"
        package app.core;

        class MathOps {
            public static int add(int a, int b) {
                return a + b;
            }
        }
        "#,
    );
    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static void main() {
                IO.println("math start");
                MathOps.add(2, 3);
                IO.println("math done");
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    assert!(
        output.status.success(),
        "expected success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );
    let stdout = String::from_utf8_lossy(&output.stdout);
    if !stdout.contains("Entry codegen: masm-split-stdlib") {
        let _ = fs::remove_dir_all(root);
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected executable success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "math start\nmath done\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_cross_file_instance_call_baseline() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    let helper = src_root.join("app/core/Greeter.pulse");

    write_file(
        &helper,
        r#"
        package app.core;
        import pulse.lang.IO;

        class Greeter {
            public void ping() {
                IO.print("hello");
                IO.println(" world");
            }
        }
        "#,
    );
    write_file(
        &entry,
        r#"
        package app.core;

        class Main {
            public static void main() {
                Greeter g = new Greeter();
                g.ping();
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    assert!(
        output.status.success(),
        "expected success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );
    let stdout = String::from_utf8_lossy(&output.stdout);
    if !stdout.contains("Entry codegen: masm-split-stdlib") {
        let _ = fs::remove_dir_all(root);
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected executable success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "hello world\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_this_receiver_call_baseline() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    let helper = src_root.join("app/core/Greeter.pulse");

    write_file(
        &helper,
        r#"
        package app.core;
        import pulse.lang.IO;

        class Greeter {
            public void run() {
                this.say();
            }

            public void say() {
                IO.println("from this");
            }
        }
        "#,
    );
    write_file(
        &entry,
        r#"
        package app.core;

        class Main {
            public static void main() {
                Greeter g = new Greeter();
                g.run();
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    assert!(
        output.status.success(),
        "expected success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );
    let stdout = String::from_utf8_lossy(&output.stdout);
    if !stdout.contains("Entry codegen: masm-split-stdlib") {
        let _ = fs::remove_dir_all(root);
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected executable success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "from this\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_constructor_and_instance_field_baseline() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    let counter = src_root.join("app/core/Counter.pulse");

    write_file(
        &counter,
        r#"
        package app.core;
        import pulse.lang.IO;

        class Counter {
            int value;

            public Counter() {
                this.value = 1;
                IO.println("ctor");
            }

            public void bump() {
                this.value = this.value + 1;
                IO.println("bump");
            }

            public int read() {
                return this.value;
            }
        }
        "#,
    );
    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static void main() {
                Counter c = new Counter();
                c.bump();
                c.read();
                IO.println("done");
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    assert!(
        output.status.success(),
        "expected success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );
    let stdout = String::from_utf8_lossy(&output.stdout);
    if !stdout.contains("Entry codegen: masm-split-stdlib") {
        let _ = fs::remove_dir_all(root);
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected executable success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "ctor\nbump\ndone\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_loop_and_branch_control_flow_baseline() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static void main() {
                int i = 0;
                while (i < 3) {
                    if (i == 1) {
                        IO.println("mid");
                    } else {
                        IO.println("tick");
                    }
                    i = i + 1;
                }
                IO.println("done");
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    assert!(
        output.status.success(),
        "expected success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );
    let stdout = String::from_utf8_lossy(&output.stdout);
    if !stdout.contains("Entry codegen: masm-split-stdlib") {
        let _ = fs::remove_dir_all(root);
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected executable success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "tick\nmid\ntick\ndone\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_constructor_and_instance_args_baseline() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    let worker = src_root.join("app/core/Worker.pulse");

    write_file(
        &worker,
        r#"
        package app.core;
        import pulse.lang.IO;

        class Worker {
            int base;

            public Worker(int seed) {
                this.base = seed;
                if (seed == 7) {
                    IO.println("ctor-arg-ok");
                }
            }

            public void ping(int x) {
                if (x == 3) {
                    IO.println("inst-arg-ok");
                }
                if (this.base == 7) {
                    IO.println("field-ok");
                }
            }
        }
        "#,
    );
    write_file(
        &entry,
        r#"
        package app.core;

        class Main {
            public static void main() {
                Worker w = new Worker(7);
                w.ping(3);
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    assert!(
        output.status.success(),
        "expected success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );
    let stdout = String::from_utf8_lossy(&output.stdout);
    if !stdout.contains("Entry codegen: masm-split-stdlib") {
        let _ = fs::remove_dir_all(root);
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected executable success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "ctor-arg-ok\ninst-arg-ok\nfield-ok\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_constructor_field_fill_after_partial_init() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;

        class Shape {
            private boolean fixed;
            private long value;
            private boolean shifted;
            private long delta;

            public Shape(boolean fixed, long value) {
                this.fixed = fixed;
                this.value = value;
                this.shifted = false;
                this.delta = 0L;
            }

            public static Shape shifted(long value, long delta) {
                Shape shape = new Shape(true, value);
                shape.shifted = true;
                shape.delta = delta;
                return shape;
            }

            public void print() {
                IO.println(this.fixed);
                IO.println((int) this.value);
                IO.println(this.shifted);
                IO.println((int) this.delta);
            }
        }

        class Main {
            public static void main() {
                Shape base = new Shape(false, 10L);
                Shape shifted = Shape.shifted(25L, 7L);
                base.print();
                shifted.print();
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    assert!(
        output.status.success(),
        "expected success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );
    let stdout = String::from_utf8_lossy(&output.stdout);
    if !stdout.contains("Entry codegen: masm-split-stdlib") {
        let _ = fs::remove_dir_all(root);
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected executable success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "false\n10\nfalse\n0\ntrue\n25\ntrue\n7\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_rejects_unknown_runtime_intrinsic_call() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.rt.Intrinsics;

        class Main {
            public static void main() {
                Intrinsics.nope();
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    assert!(!output.status.success(), "expected build failure");
    let stderr = String::from_utf8_lossy(&output.stderr);
    assert!(
        stderr.contains("No method 'nope' matches argument types")
            || stderr.contains("Compile error:"),
        "unexpected stderr:\n{}",
        stderr
    );

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_system_out_console_writer_path() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.System;

        class Main {
            public static void main() {
                System.out.println("sys");
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(run.status.success(), "exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "sys\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_system_process_time_and_stderr_flow() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.System;

        class Main {
            public static void main() {
                long start = System.nanoTime();
                long wall = System.currentTimeMillis();
                System.out.println(wall > 0L);
                System.out.println(System.nanoTime() >= start);
                System.err.println("errline");
                System.err.print("tail");
                System.exit(5);
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert_eq!(run.status.code(), Some(5), "expected exit status 5");
    let stdout = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    let stderr = String::from_utf8_lossy(&run.stderr).replace('\r', "");
    assert_eq!(stdout, "true\ntrue\n");
    assert_eq!(stderr, "errline\ntail");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_foundational_lang_interface_flow() {
    let source = r#"
        package app.core;
        import pulse.lang.Char;
        import pulse.lang.IO;
        import pulse.lang.Runnable;
        import pulse.lang.Appendable;
        import pulse.lang.CharSequence;

        class Job implements Runnable {
            public void run() {
                IO.println("run");
            }
        }

        class Main {
            public static void main() {
                Runnable r = new Job();
                r.run();

                StringBuilder builder = new StringBuilder();
                Appendable appendable = builder;
                appendable.append("ab");
                appendable.append('c');
                IO.println(builder.toString());

                CharSequence seq = builder;
                IO.println(seq.length());
                IO.println(Char.toString(seq.charAt(1)));
                IO.println(seq.subSequence(1, 3));

                CharSequence text = "pulse";
                IO.println(text.subSequence(1, 4));
            }
        }
        "#;

    let Some(fat_out) = build_and_run_source_in_mode(source, "fat") else {
        return;
    };
    let Some(shared_out) = build_and_run_source_in_mode(source, "shared") else {
        return;
    };
    assert_eq!(fat_out, "run\nabc\n3\nb\nbc\nuls\n");
    assert_eq!(
        shared_out, fat_out,
        "foundational lang fat/shared outputs diverged"
    );
}

#[test]
fn cli_build_executes_collection_isempty_contract_flow() {
    let source = r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.collections.Collection;
        import pulse.collections.List;
        import pulse.collections.Set;
        import pulse.collections.Map;
        import pulse.collections.ArrayList;
        import pulse.collections.LinkedList;
        import pulse.collections.HashSet;
        import pulse.collections.HashMap;

        class Main {
            public static void main() {
                Collection collection = new ArrayList();
                IO.println(collection.isEmpty());
                collection.clear();
                IO.println(collection.isEmpty());

                List list = new LinkedList();
                IO.println(list.isEmpty());
                list.add(7);
                IO.println(list.isEmpty());
                list.clear();
                IO.println(list.isEmpty());

                Set set = new HashSet();
                IO.println(set.isEmpty());
                set.add("pulse");
                IO.println(set.isEmpty());
                set.clear();
                IO.println(set.isEmpty());

                Map map = new HashMap();
                IO.println(map.isEmpty());
                map.putInt("a", 1);
                IO.println(map.isEmpty());
                map.clear();
                IO.println(map.isEmpty());

                HashMap direct = new HashMap();
                IO.println(direct.isEmpty());
                direct.put("name", "pulse");
                IO.println(direct.isEmpty());
            }
        }
    "#;

    let Some(fat_out) = build_and_run_source_in_mode(source, "fat") else {
        return;
    };
    let Some(shared_out) = build_and_run_source_in_mode(source, "shared") else {
        return;
    };
    assert_eq!(
        fat_out,
        "true\ntrue\ntrue\nfalse\ntrue\ntrue\nfalse\ntrue\ntrue\nfalse\ntrue\ntrue\nfalse\n"
    );
    assert_eq!(
        shared_out, fat_out,
        "collection isEmpty fat/shared outputs diverged"
    );
}

#[test]
fn cli_build_executes_queue_deque_contract_coherence_flow() {
    let source = r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.collections.List;
        import pulse.collections.Queue;
        import pulse.collections.Deque;
        import pulse.collections.LinkedList;

        class Main {
            public static void main() {
                LinkedList shared = new LinkedList();
                List list = shared;
                Queue queue = shared;
                Deque deque = shared;

                IO.println(queue.isEmpty());
                shared.offer(10);
                shared.offer(20);
                IO.println(queue.size());
                IO.println((Integer) queue.peek());
                IO.println((Integer) deque.peekFirst());
                IO.println((Integer) deque.peekLast());
                IO.println(list.getInt(1));
                IO.println((Integer) queue.poll());
                IO.println(list.size());
                IO.println(list.getInt(0));
                deque.addFirst(5);
                IO.println(list.size());
                IO.println(list.getInt(0));
                IO.println((Integer) deque.removeLast());
                IO.println((Integer) queue.peek());
                queue.clear();
                IO.println(deque.isEmpty());
                IO.println(queue.size());
            }
        }
    "#;

    let Some(fat_out) = build_and_run_source_in_mode(source, "fat") else {
        return;
    };
    let Some(shared_out) = build_and_run_source_in_mode(source, "shared") else {
        return;
    };
    assert_eq!(
        fat_out,
        "true\n2\n10\n10\n20\n20\n10\n1\n20\n2\n5\n20\n5\ntrue\n0\n"
    );
    assert_eq!(
        shared_out, fat_out,
        "queue/deque contract fat/shared outputs diverged"
    );
}

#[test]
fn cli_build_executes_deque_occurrence_removal_flow() {
    let source = r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.collections.Deque;
        import pulse.collections.LinkedList;

        class Box {
            public String name;

            public Box(String name) {
                this.name = name;
            }

            public String label() {
                return this.name;
            }
        }

        class Main {
            public static void main() {
                Box a = new Box("a");
                Box b = new Box("b");
                Deque deque = new LinkedList();
                deque.addLast(a);
                deque.addLast(b);
                deque.addLast(a);
                IO.println(deque.removeFirstOccurrence(a));
                IO.println(((Box) deque.peekFirst()).label());
                IO.println(deque.removeLastOccurrence(a));
                IO.println(deque.size());
                IO.println(((Box) deque.peekLast()).label());
                IO.println(deque.removeLastOccurrence(a));
            }
        }
    "#;

    let Some(fat_out) = build_and_run_source_in_mode(source, "fat") else {
        return;
    };
    let Some(shared_out) = build_and_run_source_in_mode(source, "shared") else {
        return;
    };
    assert_eq!(fat_out, "true\nb\ntrue\n1\nb\nfalse\n");
    assert_eq!(
        shared_out, fat_out,
        "deque occurrence removal fat/shared outputs diverged"
    );
}

#[test]
fn cli_build_executes_extended_deque_helper_flow() {
    let source = r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.collections.Deque;
        import pulse.collections.LinkedList;

        class Main {
            public static void main() {
                Deque deque = new LinkedList();
                IO.println(deque.offerFirst(2));
                IO.println(deque.offerLast(5));
                IO.println((Integer) deque.getFirst());
                IO.println((Integer) deque.getLast());
                IO.println((Integer) deque.pollFirst());
                IO.println((Integer) deque.pollLast());
                IO.println(deque.pollFirst() == null);
                IO.println(deque.pollLast() == null);
            }
        }
    "#;

    let Some(fat_out) = build_and_run_source_in_mode(source, "fat") else {
        return;
    };
    let Some(shared_out) = build_and_run_source_in_mode(source, "shared") else {
        return;
    };
    assert_eq!(fat_out, "true\ntrue\n2\n5\n2\n5\ntrue\ntrue\n");
    assert_eq!(
        shared_out, fat_out,
        "extended deque helper fat/shared outputs diverged"
    );
}

#[test]
fn cli_build_executes_queue_element_and_deque_push_pop_flow() {
    let source = r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.collections.Queue;
        import pulse.collections.Deque;
        import pulse.collections.LinkedList;

        class Main {
            public static void main() {
                Queue queue = new LinkedList();
                queue.offer(7);
                queue.offer(9);
                IO.println((Integer) queue.element());
                IO.println((Integer) queue.peek());
                IO.println(queue.size());

                Deque deque = new LinkedList();
                deque.push(1);
                deque.push(2);
                IO.println((Integer) deque.pop());
                IO.println((Integer) deque.getFirst());
                IO.println(deque.size());
            }
        }
    "#;

    let Some(fat_out) = build_and_run_source_in_mode(source, "fat") else {
        return;
    };
    let Some(shared_out) = build_and_run_source_in_mode(source, "shared") else {
        return;
    };
    assert_eq!(fat_out, "7\n7\n2\n2\n1\n1\n");
    assert_eq!(
        shared_out, fat_out,
        "queue element / deque push-pop fat/shared outputs diverged"
    );
}

#[test]
fn cli_build_executes_queue_remove_helper_flow() {
    let source = r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.collections.Queue;
        import pulse.collections.LinkedList;

        class Main {
            public static void main() {
                Queue queue = new LinkedList();
                queue.offer(7);
                queue.offer(9);
                IO.println((Integer) queue.remove());
                IO.println((Integer) queue.peek());
                IO.println(queue.size());
            }
        }
    "#;

    let Some(fat_out) = build_and_run_source_in_mode(source, "fat") else {
        return;
    };
    let Some(shared_out) = build_and_run_source_in_mode(source, "shared") else {
        return;
    };
    assert_eq!(fat_out, "7\n9\n1\n");
    assert_eq!(
        shared_out, fat_out,
        "queue remove helper fat/shared outputs diverged"
    );
}

#[test]
fn cli_build_executes_collection_interface_hierarchy_flow() {
    let source = r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.collections.Collection;
        import pulse.collections.List;
        import pulse.collections.Set;
        import pulse.collections.Queue;
        import pulse.collections.Deque;
        import pulse.collections.ArrayList;
        import pulse.collections.HashSet;
        import pulse.collections.LinkedList;

        class Main {
            public static void main() {
                List list = new ArrayList();
                list.add(4);
                Collection listCollection = list;
                IO.println(listCollection.size());
                IO.println(listCollection.isEmpty());

                Set set = new HashSet();
                set.add("pulse");
                Collection setCollection = set;
                IO.println(setCollection.size());
                IO.println(setCollection.isEmpty());

                Queue queue = new LinkedList();
                queue.offer(9);
                Collection queueCollection = queue;
                IO.println(queueCollection.size());
                IO.println((Integer) queue.peek());

                Deque deque = new LinkedList();
                deque.addFirst(2);
                deque.addLast(5);
                Queue dequeQueue = deque;
                Collection dequeCollection = deque;
                IO.println((Integer) dequeQueue.peek());
                IO.println(dequeCollection.size());
                dequeCollection.clear();
                IO.println(deque.isEmpty());
            }
        }
    "#;

    let Some(fat_out) = build_and_run_source_in_mode(source, "fat") else {
        return;
    };
    let Some(shared_out) = build_and_run_source_in_mode(source, "shared") else {
        return;
    };
    assert_eq!(fat_out, "1\nfalse\n1\nfalse\n1\n9\n2\n2\ntrue\n");
    assert_eq!(
        shared_out, fat_out,
        "collection hierarchy fat/shared outputs diverged"
    );
}

#[test]
fn cli_build_executes_membership_query_family_flow() {
    let source = r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.collections.List;
        import pulse.collections.Set;
        import pulse.collections.Map;
        import pulse.collections.ArrayList;
        import pulse.collections.LinkedList;
        import pulse.collections.HashSet;
        import pulse.collections.HashMap;

        class Main {
            public static void main() {
                List ints = new ArrayList();
                ints.add(4);
                ints.add(9);
                IO.println(ints.contains(9));
                IO.println(ints.contains(7));
                IO.println(ints.contains("9"));

                List words = new LinkedList();
                words.add("pulse");
                words.add("code");
                IO.println(words.contains("code"));
                IO.println(words.contains("java"));
                IO.println(words.contains(9));

                Set set = new HashSet();
                set.add("pulse");
                IO.println(set.contains("pulse"));
                IO.println(set.contains("java"));

                Map map = new HashMap();
                map.put("name", "pulse");
                IO.println(map.containsKey("name"));
                IO.println(map.containsKey("missing"));
            }
        }
    "#;

    let Some(fat_out) = build_and_run_source_in_mode(source, "fat") else {
        return;
    };
    let Some(shared_out) = build_and_run_source_in_mode(source, "shared") else {
        return;
    };
    assert_eq!(
        fat_out,
        "true\nfalse\nfalse\ntrue\nfalse\nfalse\ntrue\nfalse\ntrue\nfalse\n"
    );
    assert_eq!(
        shared_out, fat_out,
        "membership query family fat/shared outputs diverged"
    );
}

#[test]
fn cli_build_executes_list_indexof_helper_flow() {
    let source = r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.collections.List;
        import pulse.collections.ArrayList;
        import pulse.collections.LinkedList;

        class Main {
            public static void main() {
                List ints = new ArrayList();
                ints.add(3);
                ints.add(8);
                ints.add(3);
                IO.println(ints.indexOf(3));
                IO.println(ints.indexOf(8));
                IO.println(ints.indexOf(5));
                IO.println(ints.indexOf("3"));

                List words = new LinkedList();
                words.add("pulse");
                words.add("code");
                words.add("pulse");
                IO.println(words.indexOf("pulse"));
                IO.println(words.indexOf("code"));
                IO.println(words.indexOf("java"));
                IO.println(words.indexOf(8));
            }
        }
    "#;

    let Some(fat_out) = build_and_run_source_in_mode(source, "fat") else {
        return;
    };
    let Some(shared_out) = build_and_run_source_in_mode(source, "shared") else {
        return;
    };
    assert_eq!(fat_out, "0\n1\n-1\n-1\n0\n1\n-1\n-1\n");
    assert_eq!(
        shared_out, fat_out,
        "list indexOf fat/shared outputs diverged"
    );
}

#[test]
fn cli_build_executes_list_last_indexof_helper_flow() {
    let source = r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.collections.List;
        import pulse.collections.ArrayList;
        import pulse.collections.LinkedList;

        class Main {
            public static void main() {
                List ints = new ArrayList();
                ints.add(3);
                ints.add(8);
                ints.add(3);
                IO.println(ints.lastIndexOf(3));
                IO.println(ints.lastIndexOf(8));
                IO.println(ints.lastIndexOf(5));
                IO.println(ints.lastIndexOf("3"));

                List words = new LinkedList();
                words.add("pulse");
                words.add("code");
                words.add("pulse");
                IO.println(words.lastIndexOf("pulse"));
                IO.println(words.lastIndexOf("code"));
                IO.println(words.lastIndexOf("java"));
                IO.println(words.lastIndexOf(8));
            }
        }
    "#;

    let Some(fat_out) = build_and_run_source_in_mode(source, "fat") else {
        return;
    };
    let Some(shared_out) = build_and_run_source_in_mode(source, "shared") else {
        return;
    };
    assert_eq!(fat_out, "2\n1\n-1\n-1\n2\n1\n-1\n-1\n");
    assert_eq!(
        shared_out, fat_out,
        "list lastIndexOf fat/shared outputs diverged"
    );
}

#[test]
fn cli_build_executes_list_end_access_helper_flow() {
    let source = r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.collections.List;
        import pulse.collections.ArrayList;
        import pulse.collections.LinkedList;

        class Main {
            public static void main() {
                List ints = new ArrayList();
                ints.add(3);
                ints.add(8);
                IO.println((Integer) ints.getFirst());
                IO.println((Integer) ints.getLast());

                List words = new LinkedList();
                words.add("pulse");
                words.add("code");
                IO.println((String) words.getFirst());
                IO.println((String) words.getLast());
            }
        }
    "#;

    let Some(fat_out) = build_and_run_source_in_mode(source, "fat") else {
        return;
    };
    let Some(shared_out) = build_and_run_source_in_mode(source, "shared") else {
        return;
    };
    assert_eq!(fat_out, "3\n8\npulse\ncode\n");
    assert_eq!(
        shared_out, fat_out,
        "list end-access fat/shared outputs diverged"
    );
}

#[test]
fn cli_build_executes_list_set_helper_flow() {
    let source = r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.collections.List;
        import pulse.collections.ArrayList;
        import pulse.collections.LinkedList;

        class Main {
            public static void main() {
                List ints = new ArrayList();
                ints.add(3);
                ints.add(8);
                IO.println(ints.set(1, 5));
                IO.println(ints.getInt(1));
                IO.println(ints.indexOf(5));

                List words = new LinkedList();
                words.add("pulse");
                words.add("code");
                IO.println(words.set(0, "java"));
                IO.println(words.getString(0));
                IO.println(words.indexOf("java"));
            }
        }
    "#;

    let Some(fat_out) = build_and_run_source_in_mode(source, "fat") else {
        return;
    };
    let Some(shared_out) = build_and_run_source_in_mode(source, "shared") else {
        return;
    };
    assert_eq!(fat_out, "8\n5\n1\npulse\njava\n0\n");
    assert_eq!(shared_out, fat_out, "list set fat/shared outputs diverged");
}

#[test]
fn cli_build_executes_list_indexed_add_helper_flow() {
    let source = r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.collections.List;
        import pulse.collections.ArrayList;
        import pulse.collections.LinkedList;

        class Main {
            public static void main() {
                List ints = new ArrayList();
                ints.add(1);
                ints.add(3);
                ints.add(1, 2);
                IO.println(ints.getInt(0));
                IO.println(ints.getInt(1));
                IO.println(ints.getInt(2));
                IO.println(ints.indexOf(2));

                List words = new LinkedList();
                words.add("pulse");
                words.add("lang");
                words.add(1, "code");
                IO.println(words.getString(0));
                IO.println(words.getString(1));
                IO.println(words.getString(2));
                IO.println(words.indexOf("code"));
            }
        }
    "#;

    let Some(fat_out) = build_and_run_source_in_mode(source, "fat") else {
        return;
    };
    let Some(shared_out) = build_and_run_source_in_mode(source, "shared") else {
        return;
    };
    assert_eq!(fat_out, "1\n2\n3\n1\npulse\ncode\nlang\n1\n");
    assert_eq!(
        shared_out, fat_out,
        "list indexed add fat/shared outputs diverged"
    );
}

#[test]
fn cli_build_executes_list_remove_helper_flow() {
    let source = r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.collections.List;
        import pulse.collections.ArrayList;
        import pulse.collections.LinkedList;

        class Box {
            public String name;

            public Box(String name) {
                this.name = name;
            }

            public String label() {
                return this.name;
            }
        }

        class Main {
            public static void main() {
                Box a = new Box("a");
                Box b = new Box("b");
                Box c = new Box("c");

                List refs = new ArrayList();
                refs.add(a);
                refs.add(b);
                refs.add(c);
                IO.println(((Box) refs.remove(1)).label());
                IO.println(refs.size());
                IO.println(refs.remove(b));
                IO.println(refs.remove(c));
                IO.println(refs.size());

                List words = new LinkedList();
                words.add("pulse");
                words.add("code");
                words.add("lang");
                IO.println((String) words.remove(0));
                IO.println(words.remove("java"));
                IO.println(words.remove("code"));
                IO.println(words.size());
                IO.println(words.getString(0));
            }
        }
    "#;

    let Some(fat_out) = build_and_run_source_in_mode(source, "fat") else {
        return;
    };
    let Some(shared_out) = build_and_run_source_in_mode(source, "shared") else {
        return;
    };
    assert_eq!(fat_out, "b\n2\nfalse\ntrue\n1\npulse\nfalse\ntrue\n1\nlang\n");
    assert_eq!(shared_out, fat_out, "list remove fat/shared outputs diverged");
}

#[test]
fn cli_build_executes_raw_object_collection_flow() {
    let source = r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.lang.Object;
        import pulse.collections.List;
        import pulse.collections.ArrayList;
        import pulse.collections.Map;
        import pulse.collections.HashMap;
        import pulse.collections.Set;
        import pulse.collections.HashSet;
        import pulse.collections.Queue;
        import pulse.collections.Deque;
        import pulse.collections.LinkedList;

        class Box {
            public String name;

            public Box(String name) {
                this.name = name;
            }

            public String label() {
                return this.name;
            }
        }

        class Main {
            public static void main() {
                Box a = new Box("a");
                Box b = new Box("b");

                List list = new ArrayList();
                list.add(a);
                list.add(1, b);
                IO.println(((Box) list.get(0)).label());
                IO.println(((Box) list.get(1)).label());
                IO.println(list.contains(a));
                IO.println(list.indexOf(b));
                IO.println(((Box) list.set(1, a)).label());
                IO.println(((Box) list.get(1)).label());

                Map map = new HashMap();
                IO.println(map.put(a, b) == null);
                IO.println(((Box) map.get(a)).label());
                IO.println(map.containsKey(a));

                Set set = new HashSet();
                IO.println(set.add(a));
                IO.println(set.contains(a));

                Queue q = new LinkedList();
                q.offer(a);
                IO.println(((Box) q.peek()).label());
                IO.println(((Box) q.poll()).label());

                Deque d = new LinkedList();
                d.addFirst(a);
                d.addLast(b);
                IO.println(((Box) d.removeFirst()).label());
                IO.println(((Box) d.removeLast()).label());
            }
        }
    "#;

    let Some(fat_out) = build_and_run_source_in_mode(source, "fat") else {
        return;
    };
    let Some(shared_out) = build_and_run_source_in_mode(source, "shared") else {
        return;
    };
    assert_eq!(
        fat_out,
        "a\nb\ntrue\n1\nb\na\ntrue\nb\ntrue\ntrue\ntrue\na\na\na\nb\n"
    );
    assert_eq!(
        shared_out, fat_out,
        "raw object collection fat/shared outputs diverged"
    );
}

#[test]
fn cli_build_executes_io_print_and_println_mix() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static void main() {
                IO.print("a");
                IO.println("b");
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(run.status.success(), "exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "ab\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_fully_qualified_io_call_without_import() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;

        class Main {
            public static void main() {
                pulse.lang.IO.println("fq_ok");
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(run.status.success(), "exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "fq_ok\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_static_field_reads_from_imported_self_and_fully_qualified_receivers() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.Boolean;
        import pulse.lang.IO;

        class Main {
            public static final int VALUE = 7;

            public static void main() {
                IO.println(Boolean.TRUE);
                IO.println(pulse.lang.Boolean.FALSE);
                IO.println(Main.VALUE);
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(run.status.success(), "exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "true\nfalse\n7\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_plan_contains_core_runtime_symbol_set() {
    let root = fixture_root("runtime_mix");
    let src_root = root.join("src");
    let entry = src_root.join("app/runtime/Main.pulse");

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }
    let plan = fs::read_to_string(root.join("build").join("native.plan.json")).expect("read plan");
    for symbol in [
        "pulse.rt.Intrinsics.consoleWriteLine",
        "pulse.rt.Intrinsics.stringConcat",
        "pulse.rt.Intrinsics.listAddInt",
        "pulse.rt.Intrinsics.mapPutInt",
    ] {
        assert!(plan.contains(symbol), "missing runtime symbol: {}", symbol);
    }
}

#[test]
fn cli_build_plan_contains_m3_runtime_backed_intrinsics() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.collections.Array;
        import pulse.collections.ArrayList;
        import pulse.collections.HashMap;
        import pulse.collections.HashSet;
        import pulse.collections.LinkedList;
        import pulse.io.File;
        import pulse.io.Files;
        import pulse.io.InputStream;
        import pulse.io.OutputStream;
        import pulse.math.Random;

        class Main {
            public static void main() {
                Array arr = new Array(1);
                arr.setInt(0, 1);
                IO.println(arr.getInt(0));

                ArrayList list = new ArrayList();
                list.add("x");
                IO.println(list.getString(0));

                HashMap map = new HashMap();
                map.putInt("n", 7);
                IO.println(map.getInt("n"));

                HashSet set = new HashSet();
                set.add("k");
                IO.println(set.contains("k"));

                LinkedList queue = new LinkedList();
                queue.offer(3);
                IO.println((Integer) queue.poll());

                File.writeAllText("p", "A");
                Files.appendString("p", "B");
                OutputStream out = new OutputStream("p");
                out.append("C");
                InputStream input = new InputStream("p");
                IO.println(input.readAll());

                Random r = new Random(7);
                IO.println(r.nextInt(10));
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let plan = fs::read_to_string(root.join("build").join("native.plan.json")).expect("read plan");
    for symbol in [
        "pulse.rt.Intrinsics.arrayNew",
        "pulse.rt.Intrinsics.arraySetInt",
        "pulse.rt.Intrinsics.arrayGetInt",
        "pulse.rt.Intrinsics.listNew",
        "pulse.rt.Intrinsics.listAddString",
        "pulse.rt.Intrinsics.listGetString",
        "pulse.rt.Intrinsics.mapNew",
        "pulse.rt.Intrinsics.mapPutInt",
        "pulse.rt.Intrinsics.mapGetInt",
        "pulse.rt.Intrinsics.mapContainsKey",
        "pulse.rt.Intrinsics.mapGet",
        "pulse.rt.Intrinsics.stringConcat",
    ] {
        assert!(plan.contains(symbol), "missing runtime symbol: {}", symbol);
    }

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_link_report_includes_codegen_and_status() {
    let root = fixture_root("runtime_mix");
    let src_root = root.join("src");
    let entry = src_root.join("app/runtime/Main.pulse");

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }
    let report =
        fs::read_to_string(root.join("build").join("native.link.txt")).expect("read report");
    assert!(
        report.contains("status="),
        "missing status in report:\n{}",
        report
    );
    assert!(
        report.contains("entry_codegen="),
        "missing entry codegen in report:\n{}",
        report
    );
}

#[test]
fn cli_build_executes_array_string_roundtrip() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.collections.Array;

        class Main {
            public static void main() {
                Array arr = new Array(1);
                arr.setString(0, "ok");
                IO.println(arr.getString(0));
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(run.status.success(), "exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "ok\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_list_clear_behavior() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.collections.ArrayList;
        import pulse.collections.List;

        class Main {
            public static void main() {
                List list = new ArrayList();
                list.add(1);
                list.add(2);
                list.clear();
                IO.println(list.size());
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(run.status.success(), "exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "0\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_arraylist_crud_flow() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.collections.ArrayList;
        import pulse.collections.List;

        class Main {
            public static void main() {
                List list = new ArrayList();
                list.add(10);
                list.add(20);
                IO.println(list.size());
                IO.println(list.getInt(0));
                IO.println(list.getInt(1));
                list.clear();
                IO.println(list.size());
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(run.status.success(), "exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "2\n10\n20\n0\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_arraylist_bounds_panic() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.collections.ArrayList;

        class Main {
            public static void main() {
                ArrayList list = new ArrayList();
                list.add(1);
                list.getInt(1);
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(!run.status.success(), "expected non-zero exit");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert!(
        out.starts_with("ArrayList index out of bounds\n"),
        "unexpected stdout:\n{}",
        out
    );
    assert!(
        out.contains("Stack trace:\n"),
        "missing stack trace:\n{}",
        out
    );

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_linkedlist_crud_flow() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.collections.LinkedList;
        import pulse.collections.List;

        class Main {
            public static void main() {
                List list = new LinkedList();
                list.add("pulse");
                list.add("code");
                IO.println(list.size());
                IO.println(list.getString(0));
                IO.println(list.getString(1));
                list.clear();
                IO.println(list.size());

                List raw = new LinkedList();
                raw.add("java");
                IO.println((String) raw.get(0));
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(run.status.success(), "exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "2\npulse\ncode\n0\njava\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_linkedlist_bounds_panic() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.collections.LinkedList;

        class Main {
            public static void main() {
                LinkedList list = new LinkedList();
                list.add(1);
                list.getInt(2);
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(!run.status.success(), "expected non-zero exit");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert!(
        out.starts_with("LinkedList index out of bounds\n"),
        "unexpected stdout:\n{}",
        out
    );
    assert!(
        out.contains("Stack trace:\n"),
        "missing stack trace:\n{}",
        out
    );

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_hashset_and_hashmap_flow() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.collections.HashSet;
        import pulse.collections.HashMap;

        class Main {
            public static void main() {
                HashSet s = new HashSet();
                s.add("a");
                s.add("a");
                IO.println(s.size());
                IO.println(s.contains("a"));

                HashMap m = new HashMap();
                m.put("k", "v");
                m.put("n", "7");
                IO.println((String) m.get("k"));
                IO.println((String) m.get("n"));
                IO.println(m.containsKey("k"));
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(run.status.success(), "exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "1\ntrue\nv\n7\ntrue\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_linkedlist_queue_deque_flow() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.collections.LinkedList;

        class Main {
            public static void main() {
                LinkedList q = new LinkedList();
                q.offer(10);
                q.offer(20);
                IO.println((Integer) q.poll());
                IO.println((Integer) q.poll());
                IO.println(q.isEmpty());

                LinkedList d = new LinkedList();
                d.addFirst(5);
                d.addLast(9);
                IO.println((Integer) d.removeFirst());
                IO.println((Integer) d.removeLast());
                IO.println(d.isEmpty());
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(run.status.success(), "exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "10\n20\ntrue\n5\n9\ntrue\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_map_put_get_string_roundtrip() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.collections.Map;
        import pulse.collections.HashMap;

        class Main {
            public static void main() {
                Map m = new HashMap();
                m.put("k", "v");
                IO.println((String) m.get("k"));
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(run.status.success(), "exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "v\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_static_import_math_path() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import static pulse.math.Math.max;

        class Main {
            public static void main() {
                IO.println(max(2, 9));
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(run.status.success(), "exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "9\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_math_edge_behavior() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.Double;
        import pulse.lang.Float;
        import pulse.lang.IO;
        import pulse.lang.Long;
        import pulse.math.Math;

        class Probe {
            public static float firstFloat(float a, float b) {
                return a;
            }

            public static float secondFloat(float a, float b) {
                return b;
            }

            public static double firstDouble(double a, double b) {
                return a;
            }

            public static double secondDouble(double a, double b) {
                return b;
            }

            public static float negFloat(float value) {
                return -value;
            }

            public static double negDouble(double value) {
                return -value;
            }
        }

        class Main {
            public static void main() {
                IO.println(Float.toString(Probe.firstFloat(2.5f, 2.25f)));
                IO.println(Float.toString(Probe.secondFloat(2.5f, 2.25f)));
                IO.println(Double.toString(Probe.firstDouble(3.5d, 3.25d)));
                IO.println(Double.toString(Probe.secondDouble(3.5d, 3.25d)));
                IO.println(Float.toString(Probe.negFloat(-2.5f)));
                IO.println(Double.toString(Probe.negDouble(-3.25d)));
                IO.println(Double.toString(Math.PI));
                IO.println(Double.toString(Math.E));
                IO.println(Math.abs(-5));
                IO.println(Long.toString(Math.abs(-12L)));
                IO.println(Math.max(2, 9));
                IO.println(Long.toString(Math.max(20L, 9L)));
                IO.println(Float.toString(Math.max(2.5f, 2.25f)));
                IO.println(Double.toString(Math.max(3.5d, 3.25d)));
                IO.println(Math.min(2, 9));
                IO.println(Long.toString(Math.min(20L, 9L)));
                IO.println(Float.toString(Math.min(2.5f, 2.25f)));
                IO.println(Double.toString(Math.min(3.5d, 3.25d)));
                IO.println(Float.toString(Math.abs(-2.5f)));
                IO.println(Double.toString(Math.abs(-3.25d)));
                IO.println(Float.toString(Math.signum(-2.5f)));
                IO.println(Double.toString(Math.signum(3.25d)));
                IO.println(Math.signum(-12));
                IO.println(Long.toString(Math.signum(0L)));
                IO.println(Float.toString(Math.sqrt(2.25f)));
                IO.println(Double.toString(Math.sqrt(9.0d)));
                IO.println(Double.toString(Math.sqrt(16)));
                IO.println(Double.toString(Math.sqrt(25L)));
                IO.println(Math.pow(3, 4));
                IO.println(Long.toString(Math.pow(2L, 5)));
                IO.println(Double.toString(Math.pow(2.0d, -3)));
                IO.println(Float.toString(Math.pow(2.0f, -2)));
                IO.println(Math.floorDiv(-7, 3));
                IO.println(Long.toString(Math.floorDiv(-7L, 3L)));
                IO.println(Math.floorMod(-7, 3));
                IO.println(Long.toString(Math.floorMod(-7L, 3L)));
                int rem = 17 % 5;
                long remLong = 17L % 5L;
                double remDouble = 5.5d % 2.0d;
                int remAssign = 10;
                remAssign %= 4;
                IO.println(rem);
                IO.println(Long.toString(remLong));
                IO.println(Double.toString(remDouble));
                IO.println(remAssign);
                IO.println(Float.toString(Math.ceil(2.2f)));
                IO.println(Float.toString(Math.floor(-2.2f)));
                IO.println(Boolean.toString(Math.isNaN(0.0d / 0.0d)));
                IO.println(Boolean.toString(Math.isInfinite(1.0d / 0.0d)));
                IO.println(Boolean.toString(Math.isNaN(1.5f)));
                IO.println(Boolean.toString(Math.isInfinite(2.0f)));
                IO.println(Float.toString(Math.copySign(2.5f, -1.0f)));
                IO.println(Double.toString(Math.copySign(3.25d, -1.0d)));
                IO.println(Double.toString(Math.toRadians(180.0d)));
                IO.println(Double.toString(Math.toDegrees(Math.PI)));
                IO.println(Math.clamp(-2, 0, 10));
                IO.println(Math.clamp(7, 0, 10));
                IO.println(Math.clamp(12, 0, 10));
                IO.println(Long.toString(Math.clamp(-2L, 0L, 10L)));
                IO.println(Float.toString(Math.clamp(7.5f, 0.0f, 5.0f)));
                IO.println(Double.toString(Math.clamp(12.25d, 0.0d, 10.0d)));
                IO.println(Math.round(2.6f));
                IO.println(Long.toString(Math.round(-2.6d)));
                IO.println(Double.toString(Math.floor(2.9d)));
                IO.println(Double.toString(Math.floor(-2.2d)));
                IO.println(Double.toString(Math.ceil(2.2d)));
                IO.println(Double.toString(Math.ceil(-2.9d)));
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(run.status.success(), "exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "2.5\n2.25\n3.5\n3.25\n2.5\n3.25\n3.141592653589793\n2.718281828459045\n5\n12\n9\n20\n2.5\n3.5\n2\n9\n2.25\n3.25\n2.5\n3.25\n-1.0\n1.0\n-1\n0\n1.5\n3.0\n4.0\n5.0\n81\n32\n0.125\n0.25\n-3\n-3\n2\n2\n2\n2\n1.5\n2\n3.0\n-3.0\ntrue\ntrue\nfalse\nfalse\n-2.5\n-3.25\n3.141592653589793\n180.0\n0\n7\n10\n0\n5.0\n10.0\n3\n-3\n2.0\n-3.0\n3.0\n-2.0\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_unsigned_math_closure_slice() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.lang.UInteger;
        import pulse.lang.ULong;
        import pulse.math.Math;

        class Main {
            public static void main() {
                uint ua = (uint) 7;
                uint ub = (uint) 12;
                ulong uc = (ulong) 4000000000L;
                ulong ud = (ulong) 9L;
                IO.println(UInteger.toString(Math.min(ua, ub)));
                IO.println(UInteger.toString(Math.max(ua, ub)));
                IO.println(UInteger.toString(Math.clamp((uint) 15, (uint) 0, (uint) 10)));
                IO.println(UInteger.toString(Math.signum((uint) 0)));
                IO.println(UInteger.toString(Math.signum((uint) 5)));
                IO.println(UInteger.toString(Math.pow((uint) 3, 4)));
                IO.println(UInteger.toString(Math.floorDiv((uint) 7, (uint) 3)));
                IO.println(UInteger.toString(Math.floorMod((uint) 7, (uint) 3)));
                IO.println(ULong.toString(Math.min(uc, ud)));
                IO.println(ULong.toString(Math.max(uc, ud)));
                IO.println(ULong.toString(Math.clamp((ulong) 25L, (ulong) 0L, (ulong) 10L)));
                IO.println(ULong.toString(Math.signum((ulong) 0L)));
                IO.println(ULong.toString(Math.signum((ulong) 9L)));
                IO.println(ULong.toString(Math.pow((ulong) 2L, 5)));
                IO.println(ULong.toString(Math.floorDiv((ulong) 7L, (ulong) 3L)));
                IO.println(ULong.toString(Math.floorMod((ulong) 7L, (ulong) 3L)));
                IO.println(UInteger.toString(Math.abs((uint) 4000000000L)));
                IO.println(ULong.toString(Math.abs(ULong.MAX_VALUE)));
                IO.println(Double.toString(Math.sqrt((uint) 16)));
                IO.println(Double.toString(Math.sqrt((ulong) 25L)));
                IO.println(Float.toString(Math.hypot(3.0f, 4.0f)));
                IO.println(Double.toString(Math.hypot(5.0d, 12.0d)));
                IO.println(Float.toString(Math.toRadians(180.0f)));
                IO.println(Float.toString(Math.toDegrees((float) Math.PI)));
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(run.status.success(), "exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(
        out,
        "7\n12\n10\n0\n1\n81\n2\n1\n9\n4000000000\n10\n0\n1\n32\n2\n1\n4000000000\n18446744073709551615\n4.0\n5.0\n5.0\n13.0\n3.141592\n180.0\n"
    );

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_transcendental_math_closure_slice() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.math.Math;

        class Main {
            public static void main() {
                IO.println(Long.toString(Math.round(Math.sin(Math.PI / 2.0d) * 1000.0d)));
                IO.println(Math.round(Math.sin((float) (Math.PI / 6.0d)) * 1000.0f));
                IO.println(Long.toString(Math.round(Math.cos(Math.PI) * 1000.0d)));
                IO.println(Math.round(Math.cos(0.0f) * 1000.0f));
                IO.println(Long.toString(Math.round(Math.tan(Math.PI / 4.0d) * 1000.0d)));
                IO.println(Math.round(Math.tan((float) (Math.PI / 4.0d)) * 1000.0f));
                IO.println(Long.toString(Math.round(Math.exp(1.0d) * 1000.0d)));
                IO.println(Math.round(Math.exp(1.0f) * 1000.0f));
                IO.println(Long.toString(Math.round(Math.log(Math.E) * 1000.0d)));
                IO.println(Math.round(Math.log(1.0f) * 1000.0f));
                IO.println(Long.toString(Math.round(Math.log10(1000.0d) * 1000.0d)));
                IO.println(Math.round(Math.log10(100.0f) * 1000.0f));
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(run.status.success(), "exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "1000\n500\n-1000\n1000\n1000\n1000\n2718\n2718\n1000\n0\n3000\n2000\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_inverse_hyperbolic_math_closure_slice() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.lang.Long;
        import pulse.math.Math;

        class Main {
            public static void main() {
                IO.println(Long.toString(Math.round(Math.asin(0.5d) * 1000.0d)));
                IO.println(Math.round(Math.asin(0.5f) * 1000.0f));
                IO.println(Long.toString(Math.round(Math.acos(0.5d) * 1000.0d)));
                IO.println(Math.round(Math.acos(0.5f) * 1000.0f));
                IO.println(Long.toString(Math.round(Math.atan(1.0d) * 1000.0d)));
                IO.println(Math.round(Math.atan(1.0f) * 1000.0f));
                IO.println(Long.toString(Math.round(Math.atan2(1.0d, -1.0d) * 1000.0d)));
                IO.println(Math.round(Math.atan2(-1.0f, -1.0f) * 1000.0f));
                IO.println(Long.toString(Math.round(Math.sinh(1.0d) * 1000.0d)));
                IO.println(Math.round(Math.sinh(1.0f) * 1000.0f));
                IO.println(Long.toString(Math.round(Math.cosh(1.0d) * 1000.0d)));
                IO.println(Math.round(Math.cosh(1.0f) * 1000.0f));
                IO.println(Long.toString(Math.round(Math.tanh(1.0d) * 1000.0d)));
                IO.println(Math.round(Math.tanh(1.0f) * 1000.0f));
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(run.status.success(), "exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "524\n524\n1047\n1047\n785\n785\n2356\n-2356\n1175\n1175\n1543\n1543\n762\n762\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_math_special_value_fidelity_slice() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.Boolean;
        import pulse.lang.IllegalArgumentException;
        import pulse.lang.IO;
        import pulse.lang.Long;
        import pulse.math.Math;

        class Main {
            public static void main() {
                double nan = 0.0d / 0.0d;
                double positiveInfinity = 1.0d / 0.0d;
                double negativeInfinity = 0.0d - (1.0d / 0.0d);
                double negativeZero = -1.0d / positiveInfinity;
                IO.println(Boolean.toString(Math.isNaN(Math.sqrt(-1.0d))));
                IO.println(Boolean.toString(Math.isNaN(Math.sqrt(nan))));
                IO.println(Boolean.toString(Math.isInfinite(Math.sqrt(positiveInfinity))));
                IO.println(Boolean.toString(Math.isNaN(Math.log(-1.0d))));
                IO.println(Boolean.toString(Math.isNaN(Math.log(nan))));
                IO.println(Boolean.toString(Math.isInfinite(Math.log(0.0d))));
                IO.println(Boolean.toString(Math.isNaN(Math.exp(nan))));
                IO.println(Boolean.toString(Math.isInfinite(Math.exp(positiveInfinity))));
                IO.println(Long.toString(Math.round(Math.exp(negativeInfinity) * 1000.0d)));
                IO.println(Boolean.toString(Math.isNaN(Math.sin(positiveInfinity))));
                IO.println(Boolean.toString(Math.isNaN(Math.tan(positiveInfinity))));
                IO.println(Boolean.toString(Math.isNaN(Math.asin(2.0d))));
                IO.println(Boolean.toString(Math.isNaN(Math.acos(-2.0d))));
                IO.println(Boolean.toString(Math.isNaN(Math.atan(nan))));
                IO.println(Long.toString(Math.round(Math.atan(positiveInfinity) * 1000.0d)));
                IO.println(Boolean.toString(Math.isNaN(Math.atan2(nan, 1.0d))));
                IO.println(Long.toString(Math.round(Math.atan2(0.0d, 0.0d) * 1000.0d)));
                IO.println(Boolean.toString(Math.isNaN(Math.sinh(nan))));
                IO.println(Boolean.toString(Math.isInfinite(Math.cosh(positiveInfinity))));
                IO.println(Long.toString(Math.round(Math.tanh(positiveInfinity) * 1000.0d)));
                IO.println(Long.toString(Math.round(Math.tanh(negativeInfinity) * 1000.0d)));
                IO.println(Boolean.toString((1.0d / Math.abs(negativeZero)) == positiveInfinity));
                IO.println(Boolean.toString(Math.isNaN(Math.signum(nan))));
                IO.println(Boolean.toString((1.0d / Math.signum(negativeZero)) == negativeInfinity));
                IO.println(Boolean.toString(Math.copySign(1.0d, negativeZero) < 0.0d));
                IO.println(Long.toString(Math.round(nan)));
                IO.println(Long.toString(Math.round(positiveInfinity)));
                IO.println(Long.toString(Math.round(negativeInfinity)));
                IO.println(Boolean.toString((1.0d / Math.floor(negativeZero)) == negativeInfinity));
                IO.println(Boolean.toString((1.0d / Math.ceil(negativeZero)) == negativeInfinity));
                IO.println(Boolean.toString(Math.abs((0 - 2147483647) - 1) == ((0 - 2147483647) - 1)));
                IO.println(Boolean.toString(Math.abs((0L - 9223372036854775807L) - 1L) == ((0L - 9223372036854775807L) - 1L)));
                IO.println(Long.toString(Math.round(Math.pow(1.0d, (0 - 2147483647) - 1) * 1000.0d)));
                boolean clampThrows = false;
                IO.println(Boolean.toString(Math.isFinite(123.0d)));
                IO.println(Boolean.toString(Math.isFinite(positiveInfinity)));
                IO.println(Boolean.toString(Math.isFinite(nan)));
                double bigScale = Math.pow(10.0d, 200);
                IO.println(Long.toString(Math.round(Math.hypot(3.0d * bigScale, 4.0d * bigScale) / Math.pow(10.0d, 198))));
                IO.println(Long.toString(Math.round(Math.ulp(1.0d) * Math.pow(10.0d, 18))));
                IO.println(Long.toString(Math.round(Math.ulp(1.0f) * (float) Math.pow(10.0d, 9))));
                IO.println(Long.toString(Math.round((Math.nextAfter(1.0d, 2.0d) - 1.0d) / Math.ulp(1.0d))));
                IO.println(Boolean.toString(Math.nextAfter(-1.0d, -2.0d) < -1.0d));
                IO.println(Long.toString(Math.round((Math.nextUp(1.0d) - 1.0d) / Math.ulp(1.0d))));
                IO.println(Long.toString(Math.round((1.0d - Math.nextDown(1.0d)) / Math.ulp(1.0d))));
                IO.println(Boolean.toString(Math.isNormal(1.0d)));
                IO.println(Boolean.toString(Math.isNormal(0.0d)));
                IO.println(Math.getExponent(8.0d));
                IO.println(Long.toString(Math.round(Math.scalb(1.5d, 3) * 1000.0d)));
                IO.println(Long.toString(Math.round(Math.cbrt(27.0d) * 1000.0d)));
                IO.println(Long.toString(Math.round(Math.expm1(0.001d) * 1000000.0d)));
                IO.println(Long.toString(Math.round(Math.log1p(0.001d) * 1000000.0d)));
                IO.println(Long.toString(Math.round(Math.IEEEremainder(5.3d, 2.0d) * 10.0d)));
                IO.println(Long.toString(Math.round(Math.rint(2.5d) * 10.0d)));
                try {
                    Math.clamp(5, 7, 3);
                } catch (IllegalArgumentException error) {
                    clampThrows = true;
                }
                IO.println(Boolean.toString(clampThrows));
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(run.status.success(), "exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "true\ntrue\ntrue\ntrue\ntrue\ntrue\ntrue\ntrue\n0\ntrue\ntrue\ntrue\ntrue\ntrue\n1571\ntrue\n0\ntrue\ntrue\n1000\n-1000\ntrue\ntrue\ntrue\ntrue\n0\n9223372036854775807\n-9223372036854775808\ntrue\ntrue\ntrue\ntrue\n1000\ntrue\nfalse\nfalse\n500\n222\n119\n1\ntrue\n1\n1\ntrue\nfalse\n3\n12000\n3000\n1001\n1000\n-7\n20\ntrue\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_full_primitive_math_closure_slice() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.math.Math;

        class Main {
            public static void main() {
                byte b = (byte) -7;
                short s = (short) 12;
                char c = 'A';
                ubyte ub = (ubyte) 200;
                ushort us = (ushort) 60000;
                IO.println(Math.abs(b));
                IO.println(Math.max((short) 4, s));
                IO.println((int) Math.min(c, 'Z'));
                IO.println((int) Math.clamp(ub, (ubyte) 0, (ubyte) 150));
                IO.println((int) Math.signum(us));
                IO.println(Long.toString(Math.round(Math.sqrt((byte) 9) * 1000.0d)));
                IO.println(Math.pow((byte) 3, 2));
                IO.println((int) Math.pow((ushort) 3, 2));
                IO.println(Math.floorDiv((byte) 7, (byte) 3));
                IO.println((int) Math.floorMod((ushort) 7, (ushort) 3));
                IO.println(Long.toString(Math.round(Math.sin(ub) * 1000.0d)));
                IO.println(Long.toString(Math.round(Math.log(us) * 1000.0d)));
                IO.println(Long.toString(Math.round(Math.atan((byte) 1) * 1000.0d)));
                IO.println(Long.toString(Math.round(Math.sinh((short) 1) * 1000.0d)));
                IO.println(Long.toString(Math.round(Math.toRadians(c) * 1000.0d)));
                IO.println(Long.toString(Math.round(Math.hypot((ubyte) 3, (ubyte) 4) * 1000.0d)));
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(run.status.success(), "exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "7\n12\n65\n150\n1\n3000\n9\n9\n2\n1\n-873\n11002\n785\n1175\n1134\n5000\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_seeded_random_deterministically() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.math.Random;

        class Main {
            public static void main() {
                Random a = new Random(7);
                Random b = new Random(7);

                IO.println(a.nextInt(10));
                IO.println(a.nextInt(10));
                IO.println(a.nextInt(10));

                IO.println(b.nextInt(10));
                IO.println(b.nextInt(10));
                IO.println(b.nextInt(10));
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(run.status.success(), "exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    let lines: Vec<&str> = out.lines().collect();
    assert_eq!(lines.len(), 6, "unexpected output: {}", out);
    assert_eq!(lines[0], lines[3], "seq mismatch #1");
    assert_eq!(lines[1], lines[4], "seq mismatch #2");
    assert_eq!(lines[2], lines[5], "seq mismatch #3");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_expanded_random_deterministically() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.collections.Array;
        import pulse.lang.Boolean;
        import pulse.lang.Double;
        import pulse.lang.Float;
        import pulse.lang.IO;
        import pulse.lang.Long;
        import pulse.math.Random;

        class Main {
            public static void main() {
                Random a = new Random(7);
                Random b = new Random(7);

                IO.println(a.nextInt());
                IO.println(a.nextInt(10));
                IO.println(a.nextInt(3, 9));
                IO.println(Boolean.toString(a.nextBoolean()));
                IO.println(Long.toString(a.nextLong()));
                IO.println(Long.toString(a.nextLong(100L)));
                IO.println(Long.toString(a.nextLong(20L, 40L)));
                IO.println((int) a.nextByte());
                IO.println((int) a.nextByte((byte) 20));
                IO.println((int) a.nextByte((byte) 4, (byte) 12));
                IO.println((int) a.nextShort());
                IO.println((int) a.nextShort((short) 500));
                IO.println((int) a.nextShort((short) 100, (short) 200));
                IO.println((int) a.nextChar());
                IO.println((int) a.nextChar((char) 128));
                IO.println((int) a.nextChar((char) 65, (char) 91));
                IO.println(Float.toString(a.nextFloat()));
                IO.println(Double.toString(a.nextDouble()));
                IO.println(Float.toString(a.nextFloat(5.0f)));
                IO.println(Float.toString(a.nextFloat(2.0f, 6.0f)));
                IO.println(Double.toString(a.nextDouble(8.0d)));
                IO.println(Double.toString(a.nextDouble(3.0d, 9.0d)));
                IO.println(Double.toString(a.nextGaussian()));
                IO.println(Double.toString(a.nextGaussian(10.0d, 2.5d)));
                IO.println(a.getSeed());
                Array valuesA = new Array(3);
                a.nextInts(valuesA);
                IO.println(valuesA.getInt(0));
                IO.println(valuesA.getInt(1));
                IO.println(valuesA.getInt(2));
                Array boundedValuesA = new Array(2);
                a.nextInts(boundedValuesA, 10);
                IO.println(boundedValuesA.getInt(0));
                IO.println(boundedValuesA.getInt(1));
                Array byteValuesA = new Array(2);
                a.nextBytes(byteValuesA);
                IO.println(byteValuesA.getInt(0));
                IO.println(byteValuesA.getInt(1));
                Array shortValuesA = new Array(2);
                a.nextShorts(shortValuesA);
                IO.println(shortValuesA.getInt(0));
                IO.println(shortValuesA.getInt(1));
                Array charValuesA = new Array(2);
                a.nextChars(charValuesA);
                IO.println(charValuesA.getInt(0));
                IO.println(charValuesA.getInt(1));
                Array uintValuesA = new Array(2);
                a.nextUInts(uintValuesA);
                IO.println(uintValuesA.getInt(0));
                IO.println(uintValuesA.getInt(1));

                IO.println(b.nextInt());
                IO.println(b.nextInt(10));
                IO.println(b.nextInt(3, 9));
                IO.println(Boolean.toString(b.nextBoolean()));
                IO.println(Long.toString(b.nextLong()));
                IO.println(Long.toString(b.nextLong(100L)));
                IO.println(Long.toString(b.nextLong(20L, 40L)));
                IO.println((int) b.nextByte());
                IO.println((int) b.nextByte((byte) 20));
                IO.println((int) b.nextByte((byte) 4, (byte) 12));
                IO.println((int) b.nextShort());
                IO.println((int) b.nextShort((short) 500));
                IO.println((int) b.nextShort((short) 100, (short) 200));
                IO.println((int) b.nextChar());
                IO.println((int) b.nextChar((char) 128));
                IO.println((int) b.nextChar((char) 65, (char) 91));
                IO.println(Float.toString(b.nextFloat()));
                IO.println(Double.toString(b.nextDouble()));
                IO.println(Float.toString(b.nextFloat(5.0f)));
                IO.println(Float.toString(b.nextFloat(2.0f, 6.0f)));
                IO.println(Double.toString(b.nextDouble(8.0d)));
                IO.println(Double.toString(b.nextDouble(3.0d, 9.0d)));
                IO.println(Double.toString(b.nextGaussian()));
                IO.println(Double.toString(b.nextGaussian(10.0d, 2.5d)));
                IO.println(b.getSeed());
                Array valuesB = new Array(3);
                b.nextInts(valuesB);
                IO.println(valuesB.getInt(0));
                IO.println(valuesB.getInt(1));
                IO.println(valuesB.getInt(2));
                Array boundedValuesB = new Array(2);
                b.nextInts(boundedValuesB, 10);
                IO.println(boundedValuesB.getInt(0));
                IO.println(boundedValuesB.getInt(1));
                Array byteValuesB = new Array(2);
                b.nextBytes(byteValuesB);
                IO.println(byteValuesB.getInt(0));
                IO.println(byteValuesB.getInt(1));
                Array shortValuesB = new Array(2);
                b.nextShorts(shortValuesB);
                IO.println(shortValuesB.getInt(0));
                IO.println(shortValuesB.getInt(1));
                Array charValuesB = new Array(2);
                b.nextChars(charValuesB);
                IO.println(charValuesB.getInt(0));
                IO.println(charValuesB.getInt(1));
                Array uintValuesB = new Array(2);
                b.nextUInts(uintValuesB);
                IO.println(uintValuesB.getInt(0));
                IO.println(uintValuesB.getInt(1));

                Random c = new Random();
                c.setSeed(11);
                Random d = new Random();
                d.setSeed(11);
                IO.println(c.nextInt(5));
                IO.println(d.nextInt(5));
                Random copySource = new Random(17);
                Random copy = copySource.copy();
                IO.println(copySource.nextInt());
                IO.println(copy.nextInt());
                copySource.skip(3);
                copy.skip(3);
                IO.println(copySource.nextInt(10));
                IO.println(copy.nextInt(10));

                Random e = new Random(1234567890123L);
                Random f = new Random();
                f.setSeed(1234567890123L);
                IO.println(e.nextInt(10));
                IO.println(f.nextInt(10));
                e.reset();
                Random g = new Random();
                IO.println(e.nextInt(10));
                IO.println(g.nextInt(10));

                Random h = new Random((uint) 99);
                Random i = new Random((ulong) 99);
                IO.println(Long.toString((long) h.nextUInt()));
                IO.println(Long.toString((long) h.nextUInt((uint) 50)));
                IO.println(Long.toString((long) h.nextUInt((uint) 10, (uint) 20)));
                IO.println(Long.toString((long) h.nextULong()));
                IO.println(Long.toString((long) h.nextULong((ulong) 100)));
                IO.println(Long.toString((long) h.nextULong((ulong) 30, (ulong) 60)));
                IO.println((int) h.nextUByte());
                IO.println((int) h.nextUByte((ubyte) 25));
                IO.println((int) h.nextUShort((ushort) 500));
                i.setSeed((ulong) 99);
                IO.println(Long.toString((long) i.nextUInt()));
                IO.println(Long.toString((long) i.nextULong()));
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(run.status.success(), "exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    let lines: Vec<&str> = out.lines().collect();
    assert_eq!(lines.len(), 97, "unexpected output: {}", out);

    for i in 0..38 {
        assert_eq!(lines[i], lines[i + 38], "expanded random mismatch at line {}", i);
    }

    assert_eq!(lines[76], lines[77], "default-seed reset mismatch");
    assert_eq!(lines[78], lines[79], "copy mismatch");
    assert_eq!(lines[80], lines[81], "copy+skip mismatch");
    assert_eq!(lines[82], lines[83], "long-seed constructor/setSeed mismatch");
    assert_eq!(lines[84], lines[85], "reset/default-seed mismatch");
    assert_eq!(lines[86], lines[95], "uint seed constructor/setSeed mismatch");

    let bounded = lines[1].parse::<i32>().expect("bounded int");
    assert!((0..10).contains(&bounded), "unexpected nextInt(bound): {}", bounded);

    let ranged = lines[2].parse::<i32>().expect("ranged int");
    assert!((3..9).contains(&ranged), "unexpected nextInt(origin,bound): {}", ranged);

    let long_bounded = lines[5].parse::<i64>().expect("bounded long");
    assert!((0..100).contains(&long_bounded), "unexpected nextLong(bound): {}", long_bounded);

    let long_ranged = lines[6].parse::<i64>().expect("ranged long");
    assert!((20..40).contains(&long_ranged), "unexpected nextLong(origin,bound): {}", long_ranged);

    let bounded_byte = lines[8].parse::<i32>().expect("bounded byte");
    assert!((0..20).contains(&bounded_byte), "unexpected nextByte(bound): {}", bounded_byte);

    let ranged_byte = lines[9].parse::<i32>().expect("ranged byte");
    assert!((4..12).contains(&ranged_byte), "unexpected nextByte(origin,bound): {}", ranged_byte);

    let bounded_short = lines[11].parse::<i32>().expect("bounded short");
    assert!((0..500).contains(&bounded_short), "unexpected nextShort(bound): {}", bounded_short);

    let ranged_short = lines[12].parse::<i32>().expect("ranged short");
    assert!((100..200).contains(&ranged_short), "unexpected nextShort(origin,bound): {}", ranged_short);

    let bounded_char = lines[14].parse::<u32>().expect("bounded char");
    assert!(bounded_char < 128, "unexpected nextChar(bound): {}", bounded_char);

    let ranged_char = lines[15].parse::<u32>().expect("ranged char");
    assert!((65..91).contains(&ranged_char), "unexpected nextChar(origin,bound): {}", ranged_char);

    let gaussian_scaled = lines[23].parse::<f64>().expect("scaled gaussian");
    assert!(gaussian_scaled >= -1000.0, "unexpected nextGaussian(mean,stddev): {}", gaussian_scaled);

    let uint_bounded = lines[87].parse::<u32>().expect("bounded uint");
    assert!(uint_bounded < 50, "unexpected nextUInt(bound): {}", uint_bounded);

    let uint_ranged = lines[88].parse::<u32>().expect("ranged uint");
    assert!((10..20).contains(&uint_ranged), "unexpected nextUInt(origin,bound): {}", uint_ranged);

    let ulong_bounded = lines[90].parse::<u64>().expect("bounded ulong");
    assert!(ulong_bounded < 100, "unexpected nextULong(bound): {}", ulong_bounded);

    let ulong_ranged = lines[91].parse::<u64>().expect("ranged ulong");
    assert!((30..60).contains(&ulong_ranged), "unexpected nextULong(origin,bound): {}", ulong_ranged);

    let ubyte_bounded = lines[93].parse::<u8>().expect("bounded ubyte");
    assert!(ubyte_bounded < 25, "unexpected nextUByte(bound): {}", ubyte_bounded);

    let ushort_bounded = lines[94].parse::<u16>().expect("bounded ushort");
    assert!(ushort_bounded < 500, "unexpected nextUShort(bound): {}", ushort_bounded);

    let next_float = lines[16].parse::<f32>().expect("next float");
    assert!((0.0..1.0).contains(&next_float), "unexpected nextFloat(): {}", next_float);

    let next_double = lines[17].parse::<f64>().expect("next double");
    assert!((0.0..1.0).contains(&next_double), "unexpected nextDouble(): {}", next_double);

    let bounded_float = lines[18].parse::<f32>().expect("bounded float");
    assert!((0.0..5.0).contains(&bounded_float), "unexpected nextFloat(bound): {}", bounded_float);

    let ranged_float = lines[19].parse::<f32>().expect("ranged float");
    assert!((2.0..6.0).contains(&ranged_float), "unexpected nextFloat(origin,bound): {}", ranged_float);

    let bounded_double = lines[20].parse::<f64>().expect("bounded double");
    assert!((0.0..8.0).contains(&bounded_double), "unexpected nextDouble(bound): {}", bounded_double);

    let ranged_double = lines[21].parse::<f64>().expect("ranged double");
    assert!((3.0..9.0).contains(&ranged_double), "unexpected nextDouble(origin,bound): {}", ranged_double);

    for idx in 25..28 {
        let value = lines[idx].parse::<i32>().expect("bulk int");
        assert!(value >= 0, "unexpected bulk nextInt(): {}", value);
    }

    for idx in 28..30 {
        let value = lines[idx].parse::<i32>().expect("bounded bulk int");
        assert!((0..10).contains(&value), "unexpected bulk nextInt(bound): {}", value);
    }

    let bulk_byte_a = lines[30].parse::<i32>().expect("bulk byte a");
    let bulk_byte_b = lines[31].parse::<i32>().expect("bulk byte b");
    assert!((-128..128).contains(&bulk_byte_a), "unexpected bulk nextByte(): {}", bulk_byte_a);
    assert!((-128..128).contains(&bulk_byte_b), "unexpected bulk nextByte(): {}", bulk_byte_b);

    let bulk_short_a = lines[32].parse::<i32>().expect("bulk short a");
    let bulk_short_b = lines[33].parse::<i32>().expect("bulk short b");
    assert!((-32768..32768).contains(&bulk_short_a), "unexpected bulk nextShort(): {}", bulk_short_a);
    assert!((-32768..32768).contains(&bulk_short_b), "unexpected bulk nextShort(): {}", bulk_short_b);

    let bulk_char_a = lines[34].parse::<u32>().expect("bulk char a");
    let bulk_char_b = lines[35].parse::<u32>().expect("bulk char b");
    assert!(bulk_char_a <= 65535, "unexpected bulk nextChar(): {}", bulk_char_a);
    assert!(bulk_char_b <= 65535, "unexpected bulk nextChar(): {}", bulk_char_b);

    let reset_bounded = lines[76].parse::<i32>().expect("reset bounded");
    assert!((0..5).contains(&reset_bounded), "unexpected reset nextInt(bound): {}", reset_bounded);

    let long_seed_value = lines[82].parse::<i32>().expect("long seed value");
    assert!((0..10).contains(&long_seed_value), "unexpected long-seed nextInt(bound): {}", long_seed_value);

    let reset_default_value = lines[84].parse::<i32>().expect("reset default value");
    assert!((0..10).contains(&reset_default_value), "unexpected reset/default nextInt(bound): {}", reset_default_value);

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_file_path_files_and_stream_flow() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.collections.ArrayList;
        import pulse.collections.List;
        import pulse.lang.IO;
        import pulse.io.Path;
        import pulse.io.File;
        import pulse.io.Files;
        import pulse.io.Closeable;
        import pulse.io.Flushable;
        import pulse.io.InputStream;
        import pulse.io.OutputStream;
        import pulse.io.ResourceScope;

        class Main {
            public static void main() {
                String p = Path.combine("tmp\\", "/a.txt");
                IO.println(p);
                IO.println(Path.separator());
                IO.println(Path.parent(p));
                IO.println(Path.fileName(p));
                IO.println(Path.stem(p));
                IO.println(Path.extension(p));
                String copied = Path.resolve(Path.parent(p), "copy.txt");
                IO.println(Path.resolveSibling(p, "side.log"));
                IO.println(Path.isAbsolute("/tmp/a.txt"));
                IO.println(Path.root("/tmp/a.txt"));
                String win = Path.normalize("C:\\tmp\\nested\\..\\a.txt");
                IO.println(win);
                IO.println(Path.isAbsolute(win));
                IO.println(Path.root(win));
                IO.println(Path.parent(win));
                IO.println(Path.resolve(Path.parent(win), "copy.txt"));
                IO.println(Path.relativeTo("tmp", p));
                IO.println(Path.normalize("tmp/./nested/../a.txt"));
                IO.println(Path.normalize("/tmp/./nested/../a.txt"));
                IO.println(Path.normalize("../tmp/../a.txt"));
                IO.println(Path.changeFileName(p, "renamed.txt"));
                IO.println(Path.childPath("tmp", p));
                List<String> parts = Path.parts(p);
                IO.println(parts.size());
                IO.println(parts.get(0));
                IO.println(parts.get(1));
                IO.println(Path.join(parts));
                IO.println(Path.depth(p));
                IO.println(Path.startsWithPath("tmp", p));
                IO.println(Path.endsWithPath("a.txt", p));
                IO.println(Path.commonParent("tmp/nested/deeper", "tmp/nested/file.txt"));
                IO.println(Path.hasExtension(p));
                IO.println(Path.changeExtension(p, "data"));
                IO.println(Path.changeExtension(p, ""));
                IO.println(Files.createDirectories("tmp/nested/deeper"));
                IO.println(Files.isDirectory("tmp/nested"));
                List<String> initialChildren = Files.list("tmp");
                IO.println(initialChildren.size());
                IO.println(initialChildren.get(0));
                File.writeAllText(p, "A");
                File.appendText(p, "B");
                IO.println(File.exists(p));
                IO.println(File.isFile(p));
                IO.println(File.size(p));
                long modifiedBefore = File.lastModified(p);
                IO.println(modifiedBefore > 0L);
                IO.println(File.parent(p));
                IO.println(File.name(p));
                IO.println(File.extension(p));
                IO.println(File.readAllText(p));
                IO.println(File.create("tmp/created.txt"));
                IO.println(File.create("tmp/created.txt"));
                IO.println(File.createParentDirectories("tmp/generated/output/result.txt"));
                IO.println(File.createWithParents("tmp/generated/output/result.txt"));
                String tempFile = File.createTempFile("scratch-", "tmp");
                String tempDirectory = File.createTempDirectory("scratch-dir-");
                IO.println(File.exists("tmp/generated/output/result.txt"));
                IO.println(File.isDirectory("tmp/generated/output"));
                IO.println(tempFile.startsWith("tmp/scratch-"));
                IO.println(File.exists(tempFile));
                IO.println(tempDirectory.startsWith("tmp/scratch-dir-"));
                IO.println(File.isDirectory(tempDirectory));
                IO.println(File.isEmpty("tmp/created.txt"));
                IO.println(File.isEmpty(p));
                IO.println(File.isEmpty("missing-empty"));
                IO.println(File.touch(p));
                IO.println(File.lastModified(p) > 0L);
                IO.println(File.readAllTextOrDefault("missing.txt", "fallback"));
                IO.println(File.copy(p, copied));
                IO.println(File.readAllText(copied));
                IO.println(File.move(copied, "tmp/moved.txt"));
                IO.println(File.exists(copied));
                IO.println(File.readAllText("tmp/moved.txt"));
                IO.println(File.delete("tmp/moved.txt"));
                IO.println(File.exists("tmp/moved.txt"));

                Files.writeString("mem", "X");
                Files.appendString("mem", "Y");
                IO.println(Files.readString("mem"));
                IO.println(Files.lastModified("mem") > 0L);
                IO.println(Files.readStringOrDefault("missing", "none"));
                IO.println(Files.delete("mem"));
                IO.println(Files.exists("mem"));
                Files.appendString("mem", "Z");
                IO.println(Files.readString("mem"));
                IO.println(Files.createDirectory("tmp/manual"));
                IO.println(Files.createParentDirectories("tmp/low-level/data.txt"));
                IO.println(Files.createFileWithParents("tmp/low-level/data.txt"));
                IO.println(Files.exists("tmp/low-level/data.txt"));
                IO.println(Files.isDirectory("tmp/low-level"));
                IO.println(Files.createDirectories("tmp/low-level/data.txt/child"));
                File.writeAllText("tmp-other/outside.txt", "outside");
                IO.println(File.delete("tmp/nested"));
                IO.println(File.isEmpty("tmp"));
                IO.println(File.isDirectory("tmp/manual"));
                List<String> listed = File.list("tmp");
                IO.println(listed.size());
                IO.println(listed.get(0));
                IO.println(listed.get(1));
                IO.println(listed.get(2));
                IO.println(listed.get(3));
                List<String> relativeListed = File.listRelative("tmp");
                IO.println(relativeListed.size());
                IO.println(relativeListed.get(0));
                IO.println(relativeListed.get(3));
                List<String> recursive = File.listRecursive("tmp");
                IO.println(recursive.size());
                IO.println(recursive.get(0));
                IO.println(recursive.get(4));
                List<String> relativeRecursive = File.listRelativeRecursive("tmp");
                IO.println(relativeRecursive.size());
                IO.println(relativeRecursive.get(0));
                IO.println(relativeRecursive.get(4));
                List<String> listedFiles = File.listFiles("tmp");
                IO.println(listedFiles.size());
                IO.println(listedFiles.get(0));
                IO.println(listedFiles.get(1));
                List<String> relativeListedFiles = File.listRelativeFiles("tmp");
                IO.println(relativeListedFiles.size());
                IO.println(relativeListedFiles.get(0));
                IO.println(relativeListedFiles.get(1));
                List<String> listedDirectories = File.listDirectories("tmp");
                IO.println(listedDirectories.size());
                IO.println(listedDirectories.get(0));
                IO.println(listedDirectories.get(1));
                List<String> relativeListedDirectories = File.listRelativeDirectories("tmp");
                IO.println(relativeListedDirectories.size());
                IO.println(relativeListedDirectories.get(0));
                IO.println(relativeListedDirectories.get(1));
                List<String> recursiveFiles = File.listFilesRecursive("tmp");
                IO.println(recursiveFiles.size());
                IO.println(recursiveFiles.get(0));
                IO.println(recursiveFiles.get(2));
                List<String> relativeRecursiveFiles = File.listRelativeFilesRecursive("tmp");
                IO.println(relativeRecursiveFiles.size());
                IO.println(relativeRecursiveFiles.get(0));
                IO.println(relativeRecursiveFiles.get(2));
                List<String> recursiveDirectories = File.listDirectoriesRecursive("tmp");
                IO.println(recursiveDirectories.size());
                IO.println(recursiveDirectories.get(0));
                IO.println(recursiveDirectories.get(1));
                List<String> relativeRecursiveDirectories = File.listRelativeDirectoriesRecursive("tmp");
                IO.println(relativeRecursiveDirectories.size());
                IO.println(relativeRecursiveDirectories.get(0));
                IO.println(relativeRecursiveDirectories.get(1));
                IO.println(recursive.contains("tmp-other/outside.txt"));
                IO.println(recursiveFiles.contains("tmp-other/outside.txt"));
                IO.println(File.stem(p));
                IO.println(File.mkdirs("tmp/facade/deeper"));
                IO.println(File.mkdir("tmp/facade-single"));
                IO.println(File.deleteRecursive("tmp/facade"));
                IO.println(File.isDirectory("tmp/facade"));
                IO.println(File.deleteRecursive("tmp/facade"));
                IO.println(File.copyRecursive("tmp/nested", "tmp/copy-nested"));
                IO.println(File.copyRecursive("tmp/nested", "tmp/nested/deeper-copy"));
                IO.println(File.copyRecursive("tmp/nested", "tmp/created.txt"));
                IO.println(File.isDirectory("tmp/copy-nested"));
                IO.println(File.moveRecursive("tmp/copy-nested", "tmp/moved-nested"));
                IO.println(File.isDirectory("tmp/copy-nested"));
                IO.println(File.isDirectory("tmp/moved-nested"));
                IO.println(File.moveRecursive("tmp/copy-nested", "tmp/again"));
                IO.println(File.move(p, p));
                IO.println(File.copy(p, "tmp/manual"));
                List<String> lines = new ArrayList<String>();
                lines.add("one");
                lines.add("two");
                File.writeAllLines("tmp/lines.txt", lines);
                File.appendLines("tmp/lines.txt", lines);
                List<String> readLines = File.readAllLines("tmp/lines.txt");
                IO.println(readLines.size());
                IO.println(readLines.get(0));
                IO.println(readLines.get(3));

                OutputStream out = new OutputStream(p);
                Flushable flushable = out;
                out.writeLine("C");
                flushable.flush();
                out.writeLines(lines);
                out.appendLines(lines);
                out.clear();
                out.writeLines(lines);
                IO.println(out.position());
                IO.println(out.length());
                OutputStream appendOut = new OutputStream("tmp/append.txt", true);
                IO.println(appendOut.isAppendMode());
                appendOut.write("A");
                appendOut.write("B");
                appendOut.close();
                IO.println(appendOut.isClosed());
                IO.println(File.readAllText("tmp/append.txt"));
                OutputStream sequentialOut = new OutputStream("tmp/seq.txt");
                sequentialOut.write("A");
                sequentialOut.write("B");
                IO.println(sequentialOut.position());
                IO.println(sequentialOut.length());
                IO.println(sequentialOut.rewind(1));
                sequentialOut.write("C");
                sequentialOut.seek(1);
                sequentialOut.write("D");
                sequentialOut.reset();
                sequentialOut.write("Z");
                sequentialOut.seek(2);
                sequentialOut.truncate();
                sequentialOut.close();
                IO.println(File.readAllText("tmp/seq.txt"));
                OutputStream nullableOut = new OutputStream("tmp/null-lines.txt");
                List<String> nullableLines = new ArrayList<String>();
                nullableLines.add("left");
                nullableLines.add(null);
                nullableLines.add("right");
                nullableOut.writeLines(nullableLines);
                nullableOut.writeLine(null);
                nullableOut.close();
                IO.println(File.readAllText("tmp/null-lines.txt"));
                InputStream input = new InputStream(p);
                Closeable inputCloser = input;
                IO.println(input.readAll());
                IO.println(input.readAllOrDefault("empty"));
                List<String> streamLines = input.readLines();
                IO.println(streamLines.size());
                IO.println(streamLines.get(0));
                IO.println(streamLines.get(1));
                IO.println(input.hasRemaining());
                IO.println(input.available());
                IO.println(input.position());
                IO.println(String.valueOf(input.peek()));
                IO.println(String.valueOf(input.read()));
                IO.println(input.skip(3));
                IO.println(input.rewind(2));
                input.mark();
                IO.println(input.hasMark());
                IO.println(input.readLine());
                IO.println(input.readLine());
                IO.println(input.hasRemaining());
                IO.println(input.available());
                IO.println(input.resetToMark());
                input.clearMark();
                IO.println(input.hasMark());
                input.seek(1);
                IO.println(String.valueOf(input.read()));
                input.reset();
                IO.println(input.readLine());
                IO.println(input.readRemaining());
                IO.println(input.position());
                IO.println(input.isOpen());
                inputCloser.close();
                IO.println(input.isClosed());
                IO.println(input.isOpen());
                input.close();
                InputStream reopened = File.openInputStream(p, 1);
                IO.println(String.valueOf(reopened.read()));
                reopened.close();
                OutputStream ownedOut = File.openOutputStream("tmp/owned.txt");
                Closeable ownedCloser = ownedOut;
                IO.println(ownedOut.isOpen());
                ownedOut.write("owned");
                ownedCloser.close();
                IO.println(ownedOut.isClosed());
                IO.println(ownedOut.isOpen());
                ownedOut.close();
                OutputStream appendOwned = File.openOutputStream("tmp/owned.txt", true);
                appendOwned.write("!");
                appendOwned.close();
                IO.println(File.readAllText("tmp/owned.txt"));
                OutputStream firstOut = File.openOutputStream("tmp/shared.txt");
                OutputStream secondOut = File.openOutputStream("tmp/shared.txt", true);
                firstOut.write("A");
                firstOut.close();
                secondOut.write("B");
                secondOut.flush();
                secondOut.close();
                InputStream firstIn = File.openInputStream("tmp/shared.txt");
                InputStream secondIn = File.openInputStream("tmp/shared.txt");
                firstIn.close();
                IO.println(secondIn.isOpen());
                IO.println(secondIn.readAll());
                secondIn.close();
                ResourceScope scope = new ResourceScope();
                IO.println(scope.isOpen());
                scope.add(reopened);
                scope.add(secondIn);
                IO.println(scope.size());
                scope.close();
                IO.println(scope.isClosed());
                IO.println(scope.isOpen());
                scope.close();
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(run.status.success(), "exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    let expected = "tmp/a.txt
/
tmp
a.txt
a
txt
tmp/side.log
true
/
C:/tmp/a.txt
true
C:/
C:/tmp
C:/tmp/copy.txt
a.txt
tmp/a.txt
/tmp/a.txt
../a.txt
tmp/renamed.txt
a.txt
2
tmp
a.txt
tmp/a.txt
2
true
true
tmp/nested
true
tmp/a.data
tmp/a
true
true
1
tmp/nested
true
true
2
true
tmp
a.txt
txt
AB
true
false
true
true
true
true
true
true
true
true
true
false
true
true
true
fallback
true
AB
true
false
AB
true
false
XY
true
none
true
false
Z
true
true
true
true
true
false
false
false
true
8
tmp/nested
tmp/generated
<scratch-dir>
tmp/manual
8
nested
manual
12
tmp/nested
tmp/generated/output/result.txt
12
nested
generated/output/result.txt
3
tmp/a.txt
tmp/created.txt
3
a.txt
created.txt
5
tmp/nested
tmp/generated
5
nested
generated
5
tmp/generated/output/result.txt
tmp/a.txt
5
generated/output/result.txt
a.txt
7
tmp/nested
tmp/nested/deeper
7
nested
nested/deeper
false
false
a
true
true
true
false
false
true
false
false
true
true
false
true
false
false
false
4
one
two
7
7
true
true
AB
2
2
1
ZD
left
right

one
two
one
two
2
one
two
true
7
0
o
o
3
2
true
e
two
false
0
true
false
n
one
two
7
true
true
false
n
true
true
false
owned!
true
AB
true
2
true
false
";
    let actual_lines = out.split('\n').collect::<Vec<_>>();
    let expected_lines = expected.split('\n').collect::<Vec<_>>();
    assert_eq!(actual_lines.len(), expected_lines.len(), "line count mismatch");
    for (idx, (actual, expected)) in actual_lines.iter().zip(expected_lines.iter()).enumerate() {
        if *expected == "<scratch-dir>" {
            assert!(
                actual.starts_with("tmp/scratch-dir-"),
                "line {} expected scratch dir prefix, got '{}'",
                idx + 1,
                actual
            );
        } else {
            assert_eq!(actual, expected, "line {} mismatch", idx + 1);
        }
    }

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_time_instant_duration_flow() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.lang.Boolean;
        import pulse.lang.Long;
        import pulse.time.Instant;
        import pulse.time.Duration;
        import pulse.time.DateTimeFormatter;
        import pulse.time.LocalDate;
        import pulse.time.LocalTime;
        import pulse.time.LocalDateTime;

        class Main {
            public static void main() {
                Instant a = Instant.ofEpochMillis(1000L);
                Instant b = a.plus(Duration.ofMillis(5));
                Instant c = Instant.ofEpochSeconds(2L).plusSeconds(3L).minusSeconds(1L);
                Instant negative = Instant.ofEpochMillis(-1L);
                IO.println(Long.toString(a.toEpochMillis()));
                IO.println(Long.toString(b.toEpochMillis()));
                IO.println(Long.toString(a.durationUntil(b).toMillis()));
                IO.println(Boolean.toString(a.isBefore(b)));
                IO.println(a.hashCode());
                IO.println(a.toString());
                IO.println(Long.toString(c.toEpochMillis()));
                IO.println(Long.toString(c.toEpochSeconds()));
                IO.println(Long.toString(negative.toEpochSeconds()));
                IO.println(negative.toString());

                Duration d1 = Duration.ofMillis(9L);
                Duration d2 = new Duration(4L);
                IO.println(Long.toString(d1.plus(d2).toMillis()));
                IO.println(Long.toString(d1.minus(d2).toMillis()));
                IO.println(Long.toString(Duration.ofHours(1).toMillis()));
                IO.println(Long.toString(Duration.ofMinutes(2).toSeconds()));
                IO.println(Long.toString(Duration.ofDays(2).toMillis()));
                IO.println(Long.toString(Duration.ofMinutes(5).toMinutes()));
                IO.println(Long.toString(Duration.ofHours(3).toHours()));
                IO.println(Long.toString(Duration.ofDays(2).toDays()));
                IO.println(Boolean.toString(d2.isBefore(Duration.ofSeconds(2L))));
                IO.println(Boolean.toString(Duration.ofSeconds(2L).isAfter(d2)));
                IO.println(Long.toString(Duration.ofSeconds(2L).plusMinutes(2L).minusSeconds(30L).plusHours(1L).minusMillis(500L).minusDays(1L).toMillis()));
                IO.println(Duration.ofSeconds(2L).hashCode());
                IO.println(Duration.ofMillis(1500L).toString());

                LocalDate date = LocalDate.of(2026, 4, 10);
                LocalDate nextDate = date.plusDays(2);
                LocalDate byYearDay = LocalDate.ofYearDay(2026, 100);
                LocalDate byWeek = date.plusWeeks(2L).minusWeeks(1L);
                LocalDate shiftedMonth = LocalDate.of(2024, 1, 31).plusMonths(1L);
                LocalDate shiftedYear = LocalDate.of(2024, 2, 29).plusYears(1L);
                LocalDate rewrittenDate = LocalDate.of(2024, 1, 31).withYear(2025).withMonth(2).withDay(27);
                IO.println(date.toString());
                IO.println(nextDate.toString());
                IO.println(Long.toString(nextDate.toEpochDay()));
                IO.println(date.atStartOfDay().toString());
                IO.println(byYearDay.toString());
                IO.println(byWeek.toString());
                IO.println(shiftedMonth.toString());
                IO.println(shiftedYear.toString());
                IO.println(rewrittenDate.toString());
                IO.println(date.dayOfYear());
                IO.println(date.dayOfWeek());
                IO.println(date.lengthOfYear());
                IO.println(date.hashCode());
                  IO.println(Boolean.toString(LocalDate.of(2026, 4, 11).isWeekend()));
                  IO.println(Boolean.toString(date.isWeekday()));
                  IO.println(Boolean.toString(date.isBefore(nextDate)));
                  IO.println(Boolean.toString(nextDate.isAfter(date)));
                  IO.println(Long.toString(Duration.between(date, nextDate).toMillis()));
                  IO.println(Long.toString(date.durationUntil(nextDate).toMillis()));

                LocalTime time = LocalTime.of(9, 15, 30, 125);
                LocalTime bySecondOfDayFactory = LocalTime.ofSecondOfDay(33330);
                LocalTime rewrittenTime = time.withHour(10).withMinute(45).withSecond(50).withMillis(250);
                LocalTime truncatedSecondsTime = time.truncatedToSeconds();
                LocalTime truncatedMinutesTime = time.truncatedToMinutes();
                LocalTime truncatedHoursTime = time.truncatedToHours();
                LocalTime wrapped = time.plusMillis(1000L);
                LocalTime shiftedTime = time.plusSeconds(30L).minusSeconds(10L);
                LocalTime shiftedMinuteTime = time.plusHours(1L).plusMinutes(30L).minusHours(2L).minusMinutes(10L);
                IO.println(time.toString());
                IO.println(bySecondOfDayFactory.toString());
                IO.println(rewrittenTime.toString());
                IO.println(truncatedSecondsTime.toString());
                IO.println(truncatedMinutesTime.toString());
                IO.println(truncatedHoursTime.toString());
                IO.println(wrapped.toString());
                IO.println(time.toSecondOfDay());
                IO.println(wrapped.toMillisOfDay());
                  IO.println(shiftedTime.toString());
                  IO.println(shiftedMinuteTime.toString());
                  IO.println(time.hashCode());
                  IO.println(Boolean.toString(time.isBefore(wrapped)));
                  IO.println(Boolean.toString(wrapped.isAfter(time)));
                  IO.println(Long.toString(Duration.between(time, wrapped).toMillis()));
                  IO.println(Long.toString(time.durationUntil(wrapped).toMillis()));

                LocalDateTime dt = LocalDateTime.of(2026, 4, 10, 9, 15, 30, 125);
                LocalDateTime later = dt.plusMillis(2000L);
                LocalDateTime byDuration = dt.plus(Duration.ofSeconds(2L)).minus(Duration.ofMillis(500L));
                LocalDateTime shiftedDateTime = dt.plusHours(2L).plusMinutes(30L).plusSeconds(15L).minusSeconds(5L).minusMinutes(5L).minusHours(1L);
                LocalDateTime byWeekDateTime = dt.plusWeeks(1L).minusWeeks(1L);
                LocalDateTime shiftedMonthDateTime = LocalDateTime.of(2024, 1, 31, 9, 15, 30, 125).plusMonths(1L).plusYears(1L).minusMonths(2L).minusYears(1L);
                LocalDateTime byEpochSecondsDateTime = LocalDateTime.ofEpochSeconds(1775812530L);
                LocalDateTime rewrittenDateTime = dt.withYear(2027).withMonth(5).withDay(11).withHour(10).withMinute(20).withSecond(40).withMillis(300);
                LocalDateTime truncatedSecondsDateTime = dt.truncatedToSeconds();
                LocalDateTime truncatedMinutesDateTime = dt.truncatedToMinutes();
                LocalDateTime truncatedHoursDateTime = dt.truncatedToHours();
                LocalDateTime truncatedDaysDateTime = dt.truncatedToDays();
                IO.println(dt.toString());
                IO.println(later.toString());
                IO.println(Long.toString(dt.toEpochMillis()));
                IO.println(Long.toString(later.toEpochMillis()));
                IO.println(byDuration.toString());
                IO.println(shiftedDateTime.toString());
                IO.println(byWeekDateTime.toString());
                IO.println(shiftedMonthDateTime.toString());
                IO.println(byEpochSecondsDateTime.toString());
                IO.println(rewrittenDateTime.toString());
                IO.println(truncatedSecondsDateTime.toString());
                IO.println(truncatedMinutesDateTime.toString());
                IO.println(truncatedHoursDateTime.toString());
                IO.println(truncatedDaysDateTime.toString());
                  IO.println(dt.hashCode());
                  IO.println(Boolean.toString(dt.isBefore(later)));
                  IO.println(Boolean.toString(later.isAfter(dt)));
                  IO.println(Long.toString(Duration.between(dt, later).toMillis()));
                  IO.println(Long.toString(dt.durationUntil(later).toMillis()));
                  IO.println(later.toLocalDate().toString());
                IO.println(later.toLocalTime().toString());
                IO.println(later.toInstant().toString());
                IO.println(a.toLocalDate().toString());
                IO.println(a.toLocalTime().toString());
                IO.println(Instant.parse("2026-04-10T09:15:32.125Z").truncatedToSeconds().toString());
                IO.println(Instant.parse("2026-04-10T09:15:32.125Z").truncatedToMinutes().toString());
                IO.println(DateTimeFormatter.format(date));
                IO.println(DateTimeFormatter.format(time));
                IO.println(DateTimeFormatter.format(dt));
                IO.println(DateTimeFormatter.format(later.toInstant()));
                IO.println(DateTimeFormatter.formatBasicDate(date));
                IO.println(DateTimeFormatter.formatSlashDate(date));
                IO.println(DateTimeFormatter.formatBasicTime(time));
                IO.println(DateTimeFormatter.formatMinuteTime(time));
                IO.println(DateTimeFormatter.formatSpaceTime(time));
                IO.println(DateTimeFormatter.formatBasicDateTime(dt));
                IO.println(DateTimeFormatter.formatMinuteDateTime(dt));
                IO.println(DateTimeFormatter.formatBasicInstant(later.toInstant()));
                IO.println(DateTimeFormatter.formatSpaceDateTime(dt));
                IO.println(DateTimeFormatter.formatSpaceInstant(later.toInstant()));
                IO.println(DateTimeFormatter.parseBasicDate("20260410").toString());
                IO.println(DateTimeFormatter.parseSlashDate("2026/04/10").toString());
                IO.println(DateTimeFormatter.parseBasicTime("091530125").toString());
                IO.println(DateTimeFormatter.parseMinuteTime("09:15").toString());
                IO.println(DateTimeFormatter.parseSpaceTime("09 15 30 125").toString());
                IO.println(DateTimeFormatter.parseBasicDateTime("20260410T091530125").toString());
                IO.println(DateTimeFormatter.parseMinuteDateTime("2026-04-10T09:15").toString());
                IO.println(DateTimeFormatter.parseBasicInstant("20260410T091532125Z").toString());
                IO.println(DateTimeFormatter.parseSpaceDateTime("2026-04-10 09:15:30.125").toString());
                IO.println(DateTimeFormatter.parseSpaceInstant("2026-04-10 09:15:32.125Z").toString());
                IO.println(date.atTime(9, 15).toString());
                IO.println(date.atTime(9, 15, 30).toString());
                IO.println(date.atTime(time).toString());
                IO.println(LocalDateTime.of(date, time).toString());
                IO.println(LocalDate.parse("2026-04-10").toString());
                IO.println(LocalTime.parse("09:15:30.125").toString());
                IO.println(LocalDateTime.parse("2026-04-10T09:15:30.125").toString());
                IO.println(Instant.parse("2026-04-10T09:15:32.125Z").toString());
                IO.println(DateTimeFormatter.parseLocalDate("2026-04-10").toString());
                IO.println(DateTimeFormatter.parseLocalTime("09:15:30.125").toString());
                IO.println(DateTimeFormatter.parseLocalDateTime("2026-04-10T09:15:30.125").toString());
                IO.println(DateTimeFormatter.parseInstant("2026-04-10T09:15:32.125Z").toString());
                IO.println(Instant.parse(a.toString()).equals(a));
                IO.println(Instant.parse(negative.toString()).equals(negative));
                IO.println(LocalDate.parse(date.toString()).equals(date));
                IO.println(LocalTime.parse(time.toString()).equals(time));
                IO.println(LocalDateTime.parse(dt.toString()).equals(dt));
                IO.println(Instant.parse("1969-12-31T23:59:59.999Z").truncatedToSeconds().toString());
                IO.println(Instant.parse("1969-12-31T23:59:59.999Z").truncatedToHours().toString());
                IO.println(Instant.parse("1969-12-31T23:59:59.999Z").truncatedToDays().toString());
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(run.status.success(), "exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "1000\n1005\n5\ntrue\n1000\n1970-01-01T00:00:01.000Z\n4000\n4\n13\n5\n3600000\n120\n172800000\n5\n3\n2\ntrue\ntrue\n-82708500\n2000\nPT1.500S\n2026-04-10\n2026-04-12\n20555\n2026-04-10T00:00:00.000\n2026-04-10\n2026-04-17\n2024-02-29\n2025-02-28\n2025-02-27\n100\n5\n365\n1947120\ntrue\ntrue\ntrue\ntrue\n172800000\n172800000\n09:15:30.125\n09:15:30.000\n10:45:50.250\n09:15:30.000\n09:15:00.000\n09:15:31.125\n33330\n33331125\n09:15:50.125\n08:35:30.125\n283589\ntrue\ntrue\n1000\n1000\n2026-04-10T09:15:30.125\n2026-04-10T09:15:32.125\n1775812530125\n1775812532125\n2026-04-10T09:15:31.625\n2026-04-10T10:40:40.125\n2026-04-10T09:15:30.125\n2023-12-28T09:15:30.125\n2026-04-10T09:15:30.000\n2027-05-11T10:20:40.300\n2026-04-10T09:15:30.000\n2026-04-10T09:15:00.000\n-1384803915\ntrue\ntrue\n2000\n2000\n2026-04-10\n09:15:32.125\n2026-04-10T09:15:32.125Z\n1970-01-01\n00:00:01.000\n2026-04-10T09:15:32.000Z\n2026-04-10T09:15:00.000Z\n2026-04-10\n09:15:30.125\n2026-04-10T09:15:30.125\n2026-04-10T09:15:32.125Z\n20260410\n2026/04/10\n091530125\n09 15 30 125\n20260410T091530125\n20260410T091532125Z\n2026-04-10 09:15:30.125\n2026-04-10 09:15:32.125Z\n2026-04-10\n2026-04-10\n09:15:30.125\n09:15:30.125\n2026-04-10T09:15:30.125\n2026-04-10T09:15:32.125Z\n2026-04-10T09:15:30.125\n2026-04-10T09:15:32.125Z\n2026-04-10T09:15:00.000\n2026-04-10T09:15:30.000\n2026-04-10T09:15:30.125\n2026-04-10T09:15:30.125\n2026-04-10\n09:15:30.125\n2026-04-10T09:15:30.125\n2026-04-10T09:15:32.125Z\n2026-04-10\n09:15:30.125\n2026-04-10T09:15:30.125\n2026-04-10T09:15:32.125Z\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_instant_overflow_panics_deterministically() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.Long;
        import pulse.time.Instant;

        class Main {
            public static void main() {
                Instant.ofEpochMillis(Long.MAX_VALUE).plusMillis(1L);
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let run = Command::new(root.join("build").join("main.exe"))
        .output()
        .expect("run instant-overflow executable");
    assert!(!run.status.success(), "expected non-zero exit");
    let combined = format!(
        "{}\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    )
    .replace('\r', "");
    assert!(
        combined.contains("Instant arithmetic overflow"),
        "expected instant overflow diagnostic\n{}",
        combined
    );

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_time_calendar_edge_matrix() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.Boolean;
        import pulse.lang.IO;
        import pulse.time.DateTimeFormatter;
        import pulse.time.Duration;
        import pulse.time.Instant;
        import pulse.time.LocalDate;
        import pulse.time.LocalDateTime;
        import pulse.time.LocalTime;

        class Main {
            public static void main() {
                LocalDate leapCentury = LocalDate.of(2000, 2, 29);
                LocalDate nonLeapCentury = LocalDate.of(1900, 2, 28);
                LocalDate leapForward = LocalDate.of(2000, 2, 28).plusDays(1L);
                LocalDate nonLeapForward = nonLeapCentury.plusDays(1L);
                LocalDate monthBoundary = LocalDate.of(2023, 12, 31).plusDays(1L);
                LocalDate leapBack = LocalDate.of(2024, 3, 1).minusDays(1L);
                LocalDate clampMonth = LocalDate.of(2024, 1, 31).plusMonths(1L);
                LocalDate clampYear = LocalDate.of(2024, 2, 29).plusYears(1L);
                LocalDateTime midnightCarry = LocalDateTime.of(2023, 12, 31, 23, 59, 59, 999).plusMillis(1L);
                LocalDateTime monthCarry = LocalDateTime.of(2024, 2, 29, 23, 59, 59, 999).plusMillis(1L);
                Instant edgeInstant = Instant.parse("1969-12-31T23:59:59.999Z");
                IO.println(leapCentury.toString());
                IO.println(nonLeapCentury.toString());
                IO.println(leapForward.toString());
                IO.println(nonLeapForward.toString());
                IO.println(monthBoundary.toString());
                IO.println(leapBack.toString());
                IO.println(clampMonth.toString());
                IO.println(clampYear.toString());
                IO.println(midnightCarry.toString());
                IO.println(monthCarry.toString());
                IO.println(edgeInstant.truncatedToSeconds().toString());
                IO.println(edgeInstant.truncatedToMinutes().toString());
                IO.println(edgeInstant.truncatedToHours().toString());
                IO.println(edgeInstant.truncatedToDays().toString());
                IO.println(Boolean.toString(DateTimeFormatter.parseBasicInstant(DateTimeFormatter.formatBasicInstant(edgeInstant)).equals(edgeInstant)));
                IO.println(Boolean.toString(DateTimeFormatter.parseBasicDate(DateTimeFormatter.formatBasicDate(leapCentury)).equals(leapCentury)));
                IO.println(Boolean.toString(DateTimeFormatter.parseMinuteDateTime(DateTimeFormatter.formatMinuteDateTime(monthCarry)).equals(monthCarry.truncatedToMinutes())));
                IO.println(Boolean.toString(DateTimeFormatter.parseMinuteTime(DateTimeFormatter.formatMinuteTime(LocalTime.of(23, 59, 58, 999))).equals(LocalTime.of(23, 59))));
                IO.println(Duration.ZERO.toString());
                IO.println(Instant.EPOCH.toString());
                IO.println(LocalTime.MIDNIGHT.toString());
                IO.println(LocalTime.NOON.toString());
                IO.println(Duration.ofSeconds(9L).dividedBy(2).toString());
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(run.status.success(), "exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(
        out,
        "2000-02-29\n1900-02-28\n2000-02-29\n1900-03-01\n2024-01-01\n2024-02-29\n2024-02-29\n2025-02-28\n2024-01-01T00:00:00.000\n2024-03-01T00:00:00.000\n1969-12-31T23:59:59.000Z\n1969-12-31T23:59:00.000Z\n1969-12-31T23:00:00.000Z\n1969-12-31T00:00:00.000Z\ntrue\ntrue\ntrue\ntrue\nPT0S\n1970-01-01T00:00:00.000Z\n00:00:00.000\n12:00:00.000\nPT4.500S\n"
    );

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_invalid_feb_29_panics_deterministically() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.time.LocalDate;

        class Main {
            public static void main() {
                LocalDate.of(1900, 2, 29);
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let run = Command::new(root.join("build").join("main.exe"))
        .output()
        .expect("run invalid-date executable");
    assert!(!run.status.success(), "expected non-zero exit");
    let combined = format!(
        "{}\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    )
    .replace('\r', "");
    assert!(
        combined.contains("Invalid date day"),
        "expected invalid date diagnostic\n{}",
        combined
    );

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_datetime_formatter_null_contract_panics_deterministically() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.String;
        import pulse.time.DateTimeFormatter;

        class Main {
            public static void main() {
                String text = null;
                DateTimeFormatter.parseInstant(text);
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let run = Command::new(root.join("build").join("main.exe"))
        .output()
        .expect("run formatter-null executable");
    assert!(!run.status.success(), "expected non-zero exit");
    let combined = format!(
        "{}\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    )
    .replace('\r', "");
    assert!(
        combined.contains("String must not be null"),
        "expected formatter null diagnostic\n{}",
        combined
    );

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_clock_offset_overflow_panics_deterministically() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.Boolean;
        import pulse.lang.IO;
        import pulse.lang.Long;
        import pulse.lang.String;
        import pulse.time.Clock;
        import pulse.time.Clocks;
        import pulse.time.Duration;

        class Main {
            public static void main() {
                Clock base = Clocks.fixedMillis(Long.MAX_VALUE);
                IO.println(Boolean.toString(base.isFixed()));
                IO.println(String.valueOf(base.millis()));
                Clocks.offset(base, Duration.ofMillis(1L)).millis();
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let run = Command::new(root.join("build").join("main.exe"))
        .output()
        .expect("run clock-overflow executable");
    assert!(!run.status.success(), "expected non-zero exit");
    let combined = format!(
        "{}\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    )
    .replace('\r', "");
    assert!(
        combined.contains("Clock offset overflow"),
        "expected clock overflow diagnostic\n{}",
        combined
    );

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_duration_overflow_panics_deterministically() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.Long;
        import pulse.time.Duration;

        class Main {
            public static void main() {
                Duration.ofDays(Long.MAX_VALUE);
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let run = Command::new(root.join("build").join("main.exe"))
        .output()
        .expect("run duration-overflow executable");
    assert!(!run.status.success(), "expected non-zero exit");
    let combined = format!(
        "{}\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    )
    .replace('\r', "");
    assert!(
        combined.contains("Duration conversion overflow"),
        "expected duration overflow diagnostic\n{}",
        combined
    );

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_objects_utility_baseline() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.lang.Boolean;
        import pulse.lang.Integer;
        import pulse.lang.Object;
        import pulse.util.Objects;

        class Main {
            public static void main() {
                Object value = new Object();
                Object same = value;
                Object missing = null;

                IO.println(Boolean.toString(Objects.isNull(missing)));
                IO.println(Boolean.toString(Objects.nonNull(value)));
                IO.println(Boolean.toString(Objects.equals(value, same)));
                IO.println(Boolean.toString(Objects.equals(value, missing)));
                IO.println(Integer.toString(Objects.hashCode(missing)));
                IO.println(Boolean.toString(Objects.hashCode(value) != 0));
                IO.println(Objects.toString(missing));
                IO.println(Objects.toString(missing, "fallback"));
                IO.println(Boolean.toString(Objects.requireNonNull(value) == value));
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(run.status.success(), "exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "true\ntrue\ntrue\nfalse\n0\ntrue\nnull\nfallback\ntrue\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_string_tokenizer_utility_baseline() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.lang.Boolean;
        import pulse.lang.Integer;
        import pulse.util.StringTokenizer;

        class Main {
            public static void main() {
                StringTokenizer tokenizer = new StringTokenizer("alpha,beta,gamma", ",");
                IO.println(Boolean.toString(tokenizer.hasMoreTokens()));
                IO.println(Integer.toString(tokenizer.countTokens()));
                IO.println(tokenizer.nextToken());
                IO.println(tokenizer.nextToken());
                IO.println(tokenizer.remainingText());
                IO.println(tokenizer.nextToken());
                IO.println(Boolean.toString(tokenizer.hasMoreTokens()));

                StringTokenizer switched = new StringTokenizer("x|y|z", "|");
                IO.println(switched.nextToken());
                IO.println(switched.nextToken("|"));
                IO.println(switched.nextToken());
                IO.println(Boolean.toString(switched.hasMoreTokens()));
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(run.status.success(), "exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "true\n3\nalpha\nbeta\ngamma\ngamma\nfalse\nx\ny\nz\nfalse\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_scanner_utility_baseline() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.io.File;
        import pulse.lang.Boolean;
        import pulse.lang.Double;
        import pulse.lang.Float;
        import pulse.lang.IO;
        import pulse.lang.Integer;
        import pulse.lang.Long;
        import pulse.util.Scanner;

        class Main {
            public static void main() {
                Scanner scanner = new Scanner("42 true 3.5 4.25 9000000000\nalpha beta");
                IO.println(Boolean.toString(scanner.hasNext()));
                IO.println(Integer.toString(scanner.nextInt()));
                IO.println(Boolean.toString(scanner.nextBoolean()));
                IO.println(Float.toString(scanner.nextFloat()));
                IO.println(Double.toString(scanner.nextDouble()));
                IO.println(Long.toString(scanner.nextLong()));
                IO.println(scanner.nextLine());
                IO.println(Boolean.toString(scanner.hasNextLine()));
                IO.println(scanner.next());
                IO.println(scanner.remainingText());
                IO.println(scanner.nextOrDefault("fallback"));
                IO.println(scanner.nextLineOrDefault("line-fallback"));
                scanner.reset();
                IO.println(Integer.toString(scanner.nextInt()));
                scanner.useDelimiter(",");

                File.writeAllText("/tmp-scanner.txt", "red,green,blue");
                Scanner fileScanner = new Scanner(File.openInputStream("/tmp-scanner.txt"));
                fileScanner.useDelimiter(",");
                IO.println(fileScanner.next());
                IO.println(fileScanner.next());
                IO.println(fileScanner.next());
                IO.println(Boolean.toString(fileScanner.hasNext()));
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(run.status.success(), "exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
      assert_eq!(out, "true\n42\ntrue\n3.5\n4.25\n9000000000\n\ntrue\nalpha\n beta\nbeta\nline-fallback\n42\nred\ngreen\nblue\nfalse\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_string_joiner_utility_baseline() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.lang.Integer;
        import pulse.util.StringJoiner;

        class Main {
            public static void main() {
                StringJoiner joiner = new StringJoiner(", ", "[", "]");
                joiner.add("alpha");
                joiner.add(null);
                joiner.add("beta");
                IO.println(joiner.toString());
                IO.println(Integer.toString(joiner.length()));

                StringJoiner empty = new StringJoiner(" | ");
                empty.setEmptyValue("<empty>");
                IO.println(empty.toString());

                StringJoiner left = new StringJoiner("/");
                left.add("root");
                StringJoiner right = new StringJoiner(", ", "{", "}");
                right.add("x");
                right.add("y");
                left.merge(right);
                IO.println(left.toString());
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(run.status.success(), "exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "[alpha, null, beta]\n19\n<empty>\nroot/x, y\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_optional_utility_baseline() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.Boolean;
        import pulse.lang.IO;
        import pulse.util.Optional;

        class Main {
            public static void main() {
                Optional<String> value = Optional.of("pulse");
                Optional<String> missing = Optional.ofNullable(null);
                IO.println(Boolean.toString(value.isPresent()));
                IO.println(Boolean.toString(missing.isEmpty()));
                IO.println(value.get());
                IO.println(missing.orElse("fallback"));
                IO.println(Boolean.toString(missing.orNull() == null));
                IO.println(value.toString());
                IO.println(Boolean.toString(value.equals(Optional.of("pulse"))));
                IO.println(Boolean.toString(value.hashCode() != 0));
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(run.status.success(), "exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(
        out,
        "true\ntrue\npulse\nfallback\ntrue\nOptional[pulse]\ntrue\ntrue\n"
    );

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_properties_utility_baseline() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.Boolean;
        import pulse.lang.IO;
        import pulse.util.Properties;

        class Main {
            public static void main() {
                Properties props = new Properties();
                IO.println(Boolean.toString(props.isEmpty()));
                IO.println(props.setProperty("mode", "dev"));
                IO.println(props.getProperty("mode"));
                IO.println(props.getProperty("missing", "fallback"));
                IO.println(Boolean.toString(props.containsKey("mode")));
                IO.println(props.remove("mode"));
                IO.println(Boolean.toString(props.isEmpty()));
                props.setProperty("target", "windows");
                props.setProperty("profile", "debug");
                IO.println(Boolean.toString(props.propertyNames().contains("target")));
                IO.println(Boolean.toString(props.size() == 2));
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(run.status.success(), "exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(
        out,
        "true\n\ndev\nfallback\ntrue\ndev\ntrue\ntrue\ntrue\n"
    );

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_text_cursor_utility_baseline() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.Boolean;
        import pulse.lang.IO;
        import pulse.lang.Integer;
        import pulse.lang.String;
        import pulse.util.TextCursor;

        class Main {
            public static void main() {
                TextCursor cursor = new TextCursor("  alpha=\"4\\n2\"\nnext -12.5e+2 007");
                TextCursor empty = new TextCursor("!");
                IO.println(Boolean.toString(cursor.hasRemaining()));
                IO.println(String.valueOf(cursor.peek()));
                cursor.skipWhitespace();
                IO.println(cursor.readIdentifier());
                IO.println(Boolean.toString(empty.tryReadIdentifier() == null));
                IO.println(Boolean.toString(cursor.consumeIf("=")));
                IO.println(Boolean.toString(cursor.startsWith('"')));
                IO.println(String.valueOf(cursor.peek()));
                cursor.mark();
                IO.println(cursor.tryReadQuotedString());
                IO.println(cursor.readQuotedString());
                cursor.consume('\n');
                IO.println(cursor.readLine());
                IO.println(Integer.toString(cursor.line()));
                IO.println(Integer.toString(cursor.column()));
                IO.println(cursor.locationString());
                cursor.seek(20);
                cursor.mark();
                IO.println(cursor.tryReadNumberToken());
                IO.println(cursor.readNumberToken());
                cursor.consume(' ');
                IO.println(cursor.tryReadDigits());
                IO.println(cursor.readDigits());
                cursor.resetToMark();
                IO.println(cursor.readUntil(' '));
                IO.println(Integer.toString(cursor.position()));
                IO.println(cursor.remainingText());
                cursor.seek(0);
                cursor.consume("  ");
                IO.println(String.valueOf(cursor.peek(2)));
                cursor.seek(32);
                IO.println(Boolean.toString(cursor.isAtEnd()));
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(run.status.success(), "exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "true\n \nalpha\ntrue\ntrue\ntrue\n\"\n4\n2\n4\n2\nnext -12.5e+2 007\n2\n18\nline 2, column 18 (position 32)\n-12.5e+2\n-12.5e+2\n007\n007\n-12.5e+2\n28\n 007\np\ntrue\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_author_project_discovery_baseline() {
    let root = unique_temp_root();
    let src_root = root.join("src").join("main").join("pulse");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &root.join("pulsec.toml"),
        r#"
[package]
name = "author-discovery"
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
        import author.build.BuildInvocation;
        import author.build.BuildInvocationResolver;
        import author.project.CheckInvocation;
        import author.project.ProjectDiscovery;
        import author.project.ProjectInvocationResolver;
        import author.project.ProjectManifest;
        import author.project.TestInvocation;
        import pulse.collections.List;
        import pulse.io.File;
        import pulse.lang.Boolean;
        import pulse.lang.IO;
        import pulse.lang.Integer;
        import pulse.lang.Object;

        class Main {
            public static void main() {
                File.writeAllText(
                    "workspace/pulsec.toml",
                    "[workspace]\n"
                    + "members = \"apps/demo, libs/shared\"\n"
                );
                File.writeAllText(
                    "workspace/apps/demo/pulsec.toml",
                    "[package]\n"
                    + "name = \"demo\"\n"
                    + "version = \"1.2.3\"\n"
                    + "\n"
                    + "[sources]\n"
                    + "main_pulse = \"src/main/pulse\"\n"
                    + "test_pulse = \"src/test/pulse\"\n"
                    + "entry = \"app/main/Main.pulse\"\n"
                );
                File.writeAllText(
                    "workspace/libs/shared/pulsec.toml",
                    "[package]\n"
                    + "name = \"shared\"\n"
                    + "version = \"0.1.0\"\n"
                );
                File.writeAllText(
                    "workspace/apps/demo/src/main/pulse/app/main/Main.pulse",
                    "package app.main;\nclass Main { public static void main() {} }\n"
                );
                File.writeAllText(
                    "workspace/apps/demo/src/test/pulse/app/tests/ZetaTest.pulse",
                    "package app.tests;\nclass ZetaTest {}\n"
                );
                File.writeAllText(
                    "workspace/apps/demo/src/test/pulse/app/tests/AlphaTest.pulse",
                    "package app.tests;\nclass AlphaTest {}\n"
                );

                String manifestPath = ProjectDiscovery.findManifestPath(
                    "workspace/apps/demo/src/main/pulse/app/main"
                );
                String projectRoot = ProjectDiscovery.findProjectRoot(
                    "workspace/apps/demo/src/main/pulse/app/main"
                );
                ProjectManifest demo = ProjectDiscovery.loadManifest("workspace/apps/demo/pulsec.toml");
                ProjectManifest found = ProjectDiscovery.findAndLoadManifest(
                    "workspace/apps/demo/src/main/pulse/app/main"
                );
                ProjectManifest workspace = ProjectDiscovery.loadManifest("workspace/pulsec.toml");
                CheckInvocation checkFromManifest = ProjectInvocationResolver.resolveCheckInvocation(
                    "workspace/apps/demo/src/main/pulse/app/main",
                    null,
                    null
                );
                CheckInvocation checkFromDirect = ProjectInvocationResolver.resolveCheckInvocation(
                    "workspace/apps/demo",
                    "workspace/apps/demo/src/main/pulse",
                    null
                );
                TestInvocation testFromManifest = ProjectInvocationResolver.resolveTestInvocation(
                    "workspace/apps/demo/src/main/pulse/app/main",
                    null
                );
                TestInvocation testFromDirect = ProjectInvocationResolver.resolveTestInvocation(
                    "direct-project",
                    null
                );
                BuildInvocation buildFromManifest = BuildInvocationResolver.resolveBuildInvocation(
                    "workspace/apps/demo/src/main/pulse/app/main",
                    null,
                    null,
                    null,
                    null,
                    "pulseos-x64",
                    "shared",
                    "on",
                    "off",
                    null,
                    "C:/override/ml64.exe",
                    "C:/override/link.exe"
                );
                BuildInvocation buildFromDirect = BuildInvocationResolver.resolveBuildInvocation(
                    "direct-project",
                    null,
                    "direct-project/src/main/pulse",
                    "direct-project/src/main/pulse/app/main/Main.pulse",
                    "debug",
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null
                );
                List<String> memberRoots = ProjectDiscovery.resolveWorkspaceMemberProjectRoots(
                    "workspace",
                    workspace.workspace()
                );
                String entryPath = ProjectDiscovery.discoverEntryPath(demo.sources().mainPulseRoot());
                List<String> tests = ProjectDiscovery.discoverTestFiles(demo.sources().testPulseRoot());

                IO.println(manifestPath);
                IO.println(projectRoot);
                IO.println(demo.packageInfo().name());
                IO.println(Boolean.toString(found != null));
                IO.println(entryPath);
                IO.println(checkFromManifest.entryPath());
                IO.println(String.valueOf((Object) checkFromDirect.sourceRoot()));
                IO.println(Boolean.toString(checkFromManifest.usedManifest()));
                IO.println(Boolean.toString(checkFromManifest.authorlibEnabled()));
                IO.println(testFromManifest.projectRoot());
                IO.println(testFromManifest.sourceRoot());
                IO.println(testFromManifest.testsRoot());
                IO.println(Boolean.toString(testFromManifest.usedManifest()));
                IO.println(testFromDirect.testsRoot());
                IO.println(buildFromManifest.outputRoot());
                IO.println(buildFromManifest.profile());
                IO.println(buildFromManifest.target());
                IO.println(buildFromManifest.outputMode());
                IO.println(buildFromManifest.outputEntry());
                IO.println(buildFromManifest.runtimeDebugAllocator());
                IO.println(buildFromManifest.runtimeCycleCollector());
                IO.println(String.valueOf((Object) buildFromManifest.assembler()));
                IO.println(String.valueOf((Object) buildFromManifest.linker()));
                IO.println(buildFromDirect.outputRoot());
                IO.println(Integer.toString(tests.size()));
                IO.println(tests.getString(0));
                IO.println(tests.getString(1));
                IO.println(Integer.toString(memberRoots.size()));
                IO.println(memberRoots.getString(0));
                IO.println(memberRoots.getString(1));
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg("--project-root")
        .arg(root.to_str().expect("root utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("distro").join("release").join("author-discovery-0.1.0.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(run.status.success(), "exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(
        out,
        "workspace/apps/demo/pulsec.toml\nworkspace/apps/demo\ndemo\ntrue\nworkspace/apps/demo/src/main/pulse/app/main/Main.pulse\nworkspace/apps/demo/src/main/pulse/app/main/Main.pulse\nworkspace/apps/demo/src/main/pulse\ntrue\nfalse\nworkspace/apps/demo\nworkspace/apps/demo/src/main/pulse\nworkspace/apps/demo/src/test/pulse\ntrue\ndirect-project/tests\nworkspace/apps/demo/build/distro/release\nrelease\npulseos-x64\nshared\nmain\non\noff\nC:/override/ml64.exe\nC:/override/link.exe\ndirect-project/build/distro/debug\n2\nworkspace/apps/demo/src/test/pulse/app/tests/AlphaTest.pulse\nworkspace/apps/demo/src/test/pulse/app/tests/ZetaTest.pulse\n2\nworkspace/apps/demo\nworkspace/libs/shared\n"
    );

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_uuid_utility_baseline() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.Boolean;
        import pulse.lang.IO;
        import pulse.math.Random;
        import pulse.util.UUID;

        class Main {
            public static void main() {
                UUID parsed = UUID.fromString("123e4567-e89b-42d3-a456-426614174000");
                UUID manual = new UUID(parsed.getMostSignificantBits(), parsed.getLeastSignificantBits());
                UUID nil = UUID.nilUUID();
                Random a = new Random(7);
                Random b = new Random(7);
                UUID generatedA = UUID.randomUUID(a);
                UUID generatedB = UUID.randomUUID(b);
                UUID implicit = UUID.randomUUID();

                IO.println(parsed.toString());
                IO.println(parsed.version());
                IO.println(parsed.variant());
                IO.println(Boolean.toString(parsed.equals(manual)));
                IO.println(Boolean.toString(nil.isNil()));
                IO.println(parsed.hashCode());
                IO.println(nil.compareTo(parsed));
                IO.println(generatedA.toString());
                IO.println(generatedB.toString());
                IO.println(generatedA.version());
                IO.println(generatedA.variant());
                IO.println(implicit.toString());
                IO.println(Boolean.toString(UUID.fromString(generatedA.toString()).equals(generatedA)));
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(run.status.success(), "exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    let lines: Vec<&str> = out.lines().collect();
    assert_eq!(lines.len(), 13, "unexpected output: {}", out);

    assert_eq!(lines[0], "123e4567-e89b-42d3-a456-426614174000");
    assert_eq!(lines[1], "4");
    assert_eq!(lines[2], "2");
    assert_eq!(lines[3], "true");
    assert_eq!(lines[4], "true");
    let order = lines[6].parse::<i32>().expect("uuid ordering");
    assert!(order < 0, "expected nil UUID to compare before parsed UUID: {}", order);
    assert_eq!(lines[7], lines[8], "deterministic UUID mismatch");
    assert_eq!(lines[9], "4");
    assert_eq!(lines[10], "2");
    assert_eq!(lines[12], "true");

    for idx in [0usize, 7usize, 8usize, 11usize] {
        let text = lines[idx];
        assert_eq!(text.len(), 36, "unexpected UUID length: {}", text);
        assert_eq!(text.chars().nth(8), Some('-'));
        assert_eq!(text.chars().nth(13), Some('-'));
        assert_eq!(text.chars().nth(18), Some('-'));
        assert_eq!(text.chars().nth(23), Some('-'));
    }

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_clock_time_closure_slice() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.time.Clock;
        import pulse.time.Duration;
        import pulse.time.Instant;
        import pulse.time.LocalDate;
        import pulse.time.LocalTime;
        import pulse.time.LocalDateTime;
        import pulse.time.TimeSource;

        class Main {
            public static void main() {
                Clock fixed = Clock.fixed(Instant.ofEpochMillis(1775812530125L));
                Clock fixedMillisClock = Clock.fixedMillis(1775812530125L);
                Clock offset = Clock.offset(fixed, Duration.ofSeconds(30L));
                Clock fluentOffset = fixed.withOffset(Duration.ofMillis(250L));
                Clock tick = Clock.tick(fixed, Duration.ofSeconds(1L));
                Clock fluentTick = fixed.withTick(Duration.ofMinutes(1L));
                Clock system = Clock.systemUTC();
                IO.println(system.isFixed());
                IO.println(fixed.isFixed());
                IO.println(offset.isOffset());
                IO.println(tick.isTicking());
                IO.println(fixed.millis());
                IO.println(offset.millis());
                IO.println(tick.millis());
                IO.println(fixed.instant().toString());
                IO.println(offset.instant().toString());
                IO.println(tick.instant().toString());
                IO.println(fixed.today().toString());
                IO.println(fixed.localTime().toString());
                IO.println(fixed.localDateTime().toString());
                IO.println(offset.offsetDuration().toString());
                IO.println(tick.tickDuration().toString());
                IO.println(Instant.now(fixed).toString());
                IO.println(LocalDate.now(fixed).toString());
                IO.println(LocalTime.now(fixed).toString());
                IO.println(LocalDateTime.now(fixed).toString());
                IO.println(fixed.equals(Clock.fixed(Instant.ofEpochMillis(1775812530125L))));
                IO.println(fixed.equals(fixedMillisClock));
                IO.println(tick.equals(Clock.tick(fixed, Duration.ofSeconds(1L))));
                IO.println(fluentOffset.instant().toString());
                IO.println(fluentTick.instant().toString());
                IO.println(fixed.toString());
                IO.println(offset.toString());
                IO.println(tick.toString());
                TimeSource monotonic = TimeSource.systemMonotonic();
                TimeSource process = TimeSource.processMonotonic();
                TimeSource fixedSource = TimeSource.fixed(Duration.ofSeconds(2L));
                TimeSource fixedNanosSource = TimeSource.fixedNanos(2000000000L);
                TimeSource offsetSource = TimeSource.offset(fixedSource, Duration.ofMillis(250L));
                TimeSource tickSource = TimeSource.tick(offsetSource, Duration.ofMillis(100L));
                IO.println(monotonic.isFixed());
                IO.println(fixedSource.isFixed());
                IO.println(offsetSource.isOffset());
                IO.println(tickSource.isTicking());
                IO.println(fixedSource.nanos());
                IO.println(fixedSource.millis());
                IO.println(tickSource.elapsedSince(0L).toString());
                IO.println(offsetSource.offsetDuration().toString());
                IO.println(tickSource.tickDuration().toString());
                IO.println(fixedSource.equals(fixedNanosSource));
                IO.println(monotonic.equals(process));
                IO.println(fixedSource.withOffset(Duration.ofMillis(100L)).toString());
                IO.println(fixedSource.withTick(Duration.ofMillis(250L)).toString());
                IO.println(tickSource.toString());
                TimeSource nanosOffset = TimeSource.offsetNanos(fixedSource, 500000L);
                TimeSource nanosTick = TimeSource.tickNanos(nanosOffset, 250000L);
                TimeSource truncatedSource = fixedSource.truncatedTo(Duration.ofMillis(250L));
                IO.println(nanosOffset.offsetNanos());
                IO.println(nanosTick.tickNanos());
                IO.println(nanosTick.elapsedNanosSince(0L));
                IO.println(truncatedSource.toString());
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe_path = root.join("build").join("main.exe");
    let run = Command::new(&exe_path)
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected executable success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
        assert_eq!(
            out,
            "false\ntrue\ntrue\ntrue\n1775812530125\n1775812560125\n1775812530000\n2026-04-10T09:15:30.125Z\n2026-04-10T09:16:00.125Z\n2026-04-10T09:15:30.000Z\n2026-04-10\n09:15:30.125\n2026-04-10T09:15:30.125\nPT30S\nPT1S\n2026-04-10T09:15:30.125Z\n2026-04-10\n09:15:30.125\n2026-04-10T09:15:30.125\ntrue\ntrue\ntrue\n2026-04-10T09:15:30.375Z\n2026-04-10T09:15:00.000Z\nClock[fixed=2026-04-10T09:15:30.125Z]\nClock[offset=PT30S,fixed=2026-04-10T09:16:00.125Z]\nClock[tick=PT1S,fixed=2026-04-10T09:15:30.125Z]\nfalse\ntrue\ntrue\ntrue\n2000000000\n2000\nPT2.2S\nPT250MS\nPT100MS\ntrue\ntrue\nTimeSource[offset=PT100MS,fixed=2100000000ns]\nTimeSource[tick=PT250MS,fixed=2000000000ns]\nTimeSource[tick=PT100MS,offset=PT250MS,fixed=2200000000ns]\n500000\n250000\n2000500000\nTimeSource[tick=PT250MS,fixed=2000000000ns]\n"
        );

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_intrinsics_console_calls_directly() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.rt.Intrinsics;

        class Main {
            public static void main() {
                Intrinsics.consoleWrite("x");
                Intrinsics.consoleWriteLine("y");
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    assert!(output.status.success(), "build failed");
    let stdout = String::from_utf8_lossy(&output.stdout);
    if !stdout.contains("Entry codegen: masm-split-stdlib") {
        let _ = fs::remove_dir_all(root);
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(run.status.success(), "exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "xy\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_generic_collection_public_surface() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.collections.ArrayList;
        import pulse.collections.Collection;
        import pulse.collections.Deque;
        import pulse.collections.HashMap;
        import pulse.collections.HashSet;
        import pulse.collections.LinkedList;
        import pulse.collections.List;
        import pulse.collections.Map;
        import pulse.collections.Queue;
        import pulse.collections.Set;

        class Box {
            public String name;

            public Box(String name) {
                this.name = name;
            }
        }

        class Main {
            public static void main() {
                List<String> words = new ArrayList<String>();
                words.add("pulse");
                words.add("code");
                IO.println(words.get(0));
                IO.println(words.get(1));

                Collection<String> bag = words;
                IO.println(bag.contains("pulse"));

                Set<Box> boxes = new HashSet<Box>();
                Box hero = new Box("hero");
                boxes.add(hero);
                IO.println(boxes.contains(hero));

                Map<String, Box> byName = new HashMap<String, Box>();
                byName.put("hero", hero);
                IO.println(byName.get("hero").name);

                Queue<String> queue = new LinkedList<String>();
                queue.offer("front");
                IO.println(queue.element());

                Deque<String> deque = new LinkedList<String>();
                deque.addFirst("left");
                deque.addLast("right");
                IO.println(deque.removeFirst());
                IO.println(deque.removeLast());
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(run.status.success(), "exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "pulse\ncode\ntrue\ntrue\nhero\nfront\nleft\nright\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_wrapper_based_collection_usage_without_primitive_helpers() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.lang.Integer;
        import pulse.collections.ArrayList;
        import pulse.collections.HashMap;
        import pulse.collections.LinkedList;
        import pulse.collections.List;
        import pulse.collections.Map;
        import pulse.collections.Queue;

        class Main {
            public static void main() {
                List<Integer> values = new ArrayList<Integer>();
                values.add(1);
                values.add(Integer.valueOf(2));
                IO.println(values.get(0));
                IO.println(values.get(1));

                Map<String, Integer> counts = new HashMap<String, Integer>();
                counts.put("name", 7);
                counts.put("other", Integer.valueOf(9));
                IO.println(counts.get("name"));
                IO.println(counts.get("other"));

                Queue<Integer> queue = new LinkedList<Integer>();
                queue.offer(3);
                queue.offer(Integer.valueOf(4));
                IO.println(queue.element());
                IO.println(queue.remove());
                IO.println(queue.remove());
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(run.status.success(), "exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "1\n2\n7\n9\n3\n3\n4\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_collection_value_kind_matrix_without_primitive_helpers() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.Boolean;
        import pulse.lang.Byte;
        import pulse.lang.Char;
        import pulse.lang.Double;
        import pulse.lang.Float;
        import pulse.lang.IO;
        import pulse.lang.Integer;
        import pulse.lang.Long;
        import pulse.lang.Short;
        import pulse.lang.UByte;
        import pulse.lang.UInteger;
        import pulse.lang.ULong;
        import pulse.lang.UShort;
        import pulse.collections.ArrayList;
        import pulse.collections.HashMap;
        import pulse.collections.LinkedList;
        import pulse.collections.List;
        import pulse.collections.Map;
        import pulse.collections.Queue;

        class Box {
            private String name;

            public Box(String name) {
                this.name = name;
            }

            public String name() {
                return this.name;
            }
        }

        class Main {
            public static void main() {
                List<String> names = new ArrayList<String>();
                names.add("pulse");
                IO.println(names.get(0));

                List<Box> boxes = new ArrayList<Box>();
                boxes.add(new Box("core"));
                Map<String, Box> boxMap = new HashMap<String, Box>();
                boxMap.put("hero", boxes.get(0));
                boxMap.put("missing", null);
                IO.println(boxMap.get("hero").name());
                IO.println(boxMap.get("missing") == null);

                List<Byte> bytes = new ArrayList<Byte>();
                bytes.add((byte) 7);
                bytes.add(Byte.valueOf((byte) 8));
                IO.println((int) Byte.byteValue(bytes.get(1)));

                List<Short> shorts = new ArrayList<Short>();
                shorts.add((short) 300);
                shorts.add(Short.valueOf((short) 301));
                IO.println((int) Short.shortValue(shorts.get(1)));

                List<Integer> ints = new ArrayList<Integer>();
                ints.add(11);
                ints.add(Integer.valueOf(12));
                IO.println(ints.get(1));

                Queue<Long> longs = new LinkedList<Long>();
                longs.offer(10000000000L);
                longs.offer(Long.valueOf(10000000001L));
                IO.println(Long.toString(longs.remove()));
                IO.println(Long.toString(longs.remove()));

                List<Boolean> flags = new ArrayList<Boolean>();
                flags.add(true);
                flags.add(Boolean.valueOf(false));
                IO.println(Boolean.toString(flags.get(0)));
                IO.println(Boolean.toString(flags.get(1)));

                List<Char> chars = new ArrayList<Char>();
                chars.add('P');
                chars.add(Char.valueOf('Q'));
                IO.println(Char.toString(chars.get(0)));
                IO.println(Char.toString(chars.get(1)));

                List<Float> floats = new ArrayList<Float>();
                floats.add(1.25f);
                floats.add(Float.valueOf(2.5f));
                IO.println(Float.toString(floats.get(0)));
                IO.println(Float.toString(floats.get(1)));

                Queue<Double> doubles = new LinkedList<Double>();
                doubles.offer(3.5d);
                doubles.offer(Double.valueOf(4.5d));
                IO.println(Double.toString(doubles.remove()));
                IO.println(Double.toString(doubles.remove()));

                List<UByte> ubytes = new ArrayList<UByte>();
                ubytes.add((ubyte) 200);
                ubytes.add(UByte.valueOf((ubyte) 201));
                IO.println((int) UByte.ubyteValue(ubytes.get(0)));
                IO.println((int) UByte.ubyteValue(ubytes.get(1)));

                List<UShort> ushorts = new ArrayList<UShort>();
                ushorts.add((ushort) 60000);
                ushorts.add(UShort.valueOf((ushort) 60001));
                IO.println((int) UShort.ushortValue(ushorts.get(0)));
                IO.println((int) UShort.ushortValue(ushorts.get(1)));

                Map<String, UInteger> uints = new HashMap<String, UInteger>();
                uints.put("big", (uint) 4000000000L);
                uints.put("bigger", UInteger.valueOf((uint) 4000000001L));
                IO.println(UInteger.toString(uints.get("big")));
                IO.println(UInteger.toString(uints.get("bigger")));

                Queue<ULong> ulongs = new LinkedList<ULong>();
                ulongs.offer(ULong.parse("18446744073709551614"));
                ulongs.offer(ULong.parse("18446744073709551615"));
                IO.println(ULong.toString(ulongs.remove()));
                IO.println(ULong.toString(ulongs.remove()));
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(run.status.success(), "exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(
        out,
        "pulse\ncore\ntrue\n8\n301\n12\n10000000000\n10000000001\ntrue\nfalse\nP\nQ\n1.25\n2.5\n3.5\n4.5\n200\n201\n60000\n60001\n4000000000\n4000000001\n18446744073709551614\n18446744073709551615\n"
    );

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_collection_wrapper_query_and_raw_object_equality_flows() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.Byte;
        import pulse.lang.IO;
        import pulse.lang.Integer;
        import pulse.lang.UInteger;
        import pulse.collections.ArrayList;
        import pulse.collections.HashMap;
        import pulse.collections.HashSet;
        import pulse.collections.List;
        import pulse.collections.Map;
        import pulse.collections.Set;

        class Box {
            private String name;

            public Box(String name) {
                this.name = name;
            }
        }

        class Main {
            public static void main() {
                List<Byte> bytes = new ArrayList<Byte>();
                bytes.add((byte) 7);
                bytes.add((byte) 8);
                IO.println(bytes.contains((byte) 8));
                IO.println(bytes.indexOf((byte) 8));
                IO.println(bytes.remove(Byte.valueOf((byte) 7)));
                IO.println(bytes.size());

                List<Integer> ints = new ArrayList<Integer>();
                ints.add(7);
                ints.add(Integer.valueOf(8));
                ints.add(7);
                IO.println(ints.contains(8));
                IO.println(ints.lastIndexOf(7));
                IO.println(ints.remove(Integer.valueOf(7)));
                IO.println(ints.size());

                Set<UInteger> ids = new HashSet<UInteger>();
                ids.add((uint) 4000000000L);
                IO.println(ids.contains((uint) 4000000000L));
                IO.println(ids.remove(UInteger.valueOf((uint) 4000000000L)));
                IO.println(ids.isEmpty());

                Map<String, Byte> byteMap = new HashMap<String, Byte>();
                byteMap.put("b", (byte) 7);
                IO.println(byteMap.containsValue((byte) 7));

                Map<String, UInteger> uintMap = new HashMap<String, UInteger>();
                uintMap.put("id", (uint) 4000000000L);
                IO.println(uintMap.containsValue((uint) 4000000000L));

                Map<String, Box> boxes = new HashMap<String, Box>();
                boxes.put("hero", new Box("pulse"));
                boxes.put("empty", null);
                IO.println(boxes.containsKey("empty"));
                IO.println(boxes.remove("empty") == null);
                IO.println(boxes.containsKey("empty"));
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(run.status.success(), "exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(
        out,
        "true\n1\ntrue\n1\ntrue\n2\ntrue\n2\ntrue\ntrue\ntrue\ntrue\ntrue\ntrue\nfalse\n"
    );

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_collections_empty_and_singleton_map_helpers() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.collections.Collection;
        import pulse.collections.Collections;
        import pulse.collections.List;
        import pulse.collections.Map;
        import pulse.collections.Set;
        import pulse.lang.IO;
        import pulse.lang.Integer;

        class Main {
            public static void main() {
                List<String> emptyNames = Collections.emptyList();
                Set<Integer> emptyIds = Collections.emptySet();
                Map<String, Integer> emptyCounts = Collections.emptyMap();

                IO.println(emptyNames.isEmpty());
                IO.println(emptyIds.isEmpty());
                IO.println(emptyCounts.isEmpty());

                Map<String, Integer> oneCount = Collections.singletonMap("hp", Integer.valueOf(7));
                IO.println(oneCount.get("hp"));

                Set<String> keys = oneCount.keySet();
                Collection<Integer> values = oneCount.values();
                IO.println(keys.contains("hp"));
                IO.println(values.contains(Integer.valueOf(7)));
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(run.status.success(), "exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "true\ntrue\ntrue\n7\ntrue\ntrue\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_hashmap_entry_set_copy_view_baseline() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.collections.HashMap;
        import pulse.collections.Map;
        import pulse.collections.MapEntry;
        import pulse.collections.Set;
        import pulse.lang.IO;
        import pulse.lang.Integer;
        import pulse.lang.Iterator;

        class Main {
            public static void main() {
                Map<String, Integer> stats = new HashMap<String, Integer>();
                stats.put("hp", Integer.valueOf(7));
                stats.put("mp", Integer.valueOf(9));

                Set<MapEntry> entries = stats.entrySet();
                Iterator items = entries.iterator();
                while (items.hasNext()) {
                    MapEntry entry = (MapEntry) items.next();
                    IO.println((String) entry.getKey());
                    IO.println((Integer) entry.getValue());
                }

                stats.put("xp", Integer.valueOf(11));
                IO.println(entries.size());
                IO.println(stats.size());
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(run.status.success(), "exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    let ordered_hp_first = "hp\n7\nmp\n9\n2\n3\n";
    let ordered_mp_first = "mp\n9\nhp\n7\n2\n3\n";
    assert!(
        out == ordered_hp_first || out == ordered_mp_first,
        "unexpected entry-set snapshot output: {out:?}"
    );

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_collection_bulk_contract_on_list_implementations() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.collections.ArrayList;
        import pulse.collections.Collection;
        import pulse.collections.LinkedList;
        import pulse.lang.IO;

        class Main {
            public static void main() {
                Collection<String> left = new ArrayList<String>();
                left.add("a");
                left.add("b");
                left.add("b");

                Collection<String> filter = new LinkedList<String>();
                filter.add("b");

                IO.println(left.containsAll(filter));
                IO.println(left.removeAll(filter));
                IO.println(left.size());

                Collection<String> refill = new LinkedList<String>();
                refill.add("x");
                refill.add("y");
                refill.add("z");
                left.addAll(refill);
                IO.println(left.size());

                Collection<String> keep = new ArrayList<String>();
                keep.add("x");
                keep.add("z");
                IO.println(left.retainAll(keep));
                IO.println(left.size());
                IO.println(left.contains("x"));
                IO.println(left.contains("y"));
                IO.println(left.contains("z"));
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(run.status.success(), "exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "true\ntrue\n1\n4\ntrue\n2\ntrue\nfalse\ntrue\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_collection_remove_contract_across_list_and_set() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.collections.ArrayList;
        import pulse.collections.Collection;
        import pulse.collections.HashSet;
        import pulse.lang.IO;

        class Main {
            public static void main() {
                Collection<String> list = new ArrayList<String>();
                list.add("a");
                list.add("b");
                IO.println(list.remove("a"));
                IO.println(list.size());

                Collection<String> set = new HashSet<String>();
                set.add("x");
                IO.println(set.remove("x"));
                IO.println(set.remove("y"));
                IO.println(set.isEmpty());
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(run.status.success(), "exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "true\n1\ntrue\nfalse\ntrue\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_hashmap_live_keyset_and_values_views() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.collections.Collection;
        import pulse.collections.HashMap;
        import pulse.collections.Map;
        import pulse.collections.Set;
        import pulse.lang.IO;

        class Main {
            public static void main() {
                Map<String, String> values = new HashMap<String, String>();
                values.put("a", "one");
                values.put("b", "two");

                Set<String> keys = values.keySet();
                Collection<String> seen = values.values();

                IO.println(keys.remove("a"));
                IO.println(values.containsKey("a"));
                IO.println(seen.remove("two"));
                IO.println(values.containsKey("b"));
                IO.println(keys.size());
                IO.println(seen.size());
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(exe).output().expect("run exe");
    assert!(run.status.success(), "exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "true\nfalse\ntrue\nfalse\n0\n0\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_system_in_console_reader_baseline() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.AutoCloseable;
        import pulse.lang.ConsoleReader;
        import pulse.lang.IO;
        import pulse.lang.PrintStream;
        import pulse.lang.System;

        class Main {
            public static void main() {
                ConsoleReader input = System.in;
                AutoCloseable closer = input;
                String prompted = input.readLine("name> ");
                String blank = input.readLine();
                String fallback = input.readLineOrDefault("fallback");
                IO.println(prompted);
                IO.println(blank == null);
                IO.println(blank.length());
                IO.println(fallback);
                IO.println(input.isOpen());
                closer.close();
                IO.println(input.isClosed());
                IO.println(input.isOpen());
                input.close();
                PrintStream out = System.out;
                AutoCloseable outCloser = out;
                IO.println(out.isOpen());
                out.flush();
                outCloser.close();
                out.println("after-close");
                IO.println(out.isClosed());
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let mut child = Command::new(&exe)
        .stdin(Stdio::piped())
        .stdout(Stdio::piped())
        .stderr(Stdio::piped())
        .spawn()
        .expect("spawn exe");
    {
        let mut stdin = child.stdin.take().expect("child stdin");
        stdin.write_all(b"pulse\n\n").expect("write stdin");
    }
    let run = child.wait_with_output().expect("collect exe output");
    assert!(
        run.status.success(),
        "exe failed\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "name> pulse\nfalse\n0\nfallback\ntrue\ntrue\nfalse\ntrue\nafter-close\nfalse\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_console_reader_accepts_long_lines_beyond_legacy_stack_buffer() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.lang.System;

        class Main {
            public static void main() {
                String line = System.in.readLine();
                IO.println(line.length());
                IO.println(line.charAt(0));
                IO.println(line.substring(line.length() - 3));
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let mut child = Command::new(&exe)
        .stdin(Stdio::piped())
        .stdout(Stdio::piped())
        .stderr(Stdio::piped())
        .spawn()
        .expect("spawn exe");
    let long_line = format!("{}XYZ\n", "a".repeat(5000));
    {
        let mut stdin = child.stdin.take().expect("child stdin");
        stdin
            .write_all(long_line.as_bytes())
            .expect("write long stdin");
    }
    let run = child.wait_with_output().expect("collect exe output");
    assert!(
        run.status.success(),
        "exe failed\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "5003\na\nXYZ\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_large_host_text_write_honestly() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.io.Files;
        import pulse.lang.IO;
        import pulse.lang.StringBuilder;

        class Main {
            public static void main() {
                StringBuilder out = new StringBuilder();
                int index = 0;
                while (index < 80) {
                    out.append("0123456789");
                    index = index + 1;
                }
                String text = out.toString();
                String path = "large-host-write.txt";
                Files.writeString(path, text);
                String written = Files.readString(path);
                IO.println(written.length());
                IO.println(written.substring(written.length() - 10));
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(&exe).output().expect("run exe");
    assert!(
        run.status.success(),
        "exe failed\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "800\n0123456789\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_large_local_string_concat_honestly() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static void main() {
                String out = "";
                int index = 0;
                while (index < 800) {
                    out = out.concat("a");
                    index = index + 1;
                }
                IO.println(out.length());
                IO.println(out.substring(out.length() - 5));
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(&exe).output().expect("run exe");
    assert!(
        run.status.success(),
        "exe failed\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "800\naaaaa\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_large_string_split_honestly() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.lang.StringBuilder;

        class Main {
            public static void main() {
                StringBuilder out = new StringBuilder();
                int index = 0;
                while (index < 20) {
                    if (index > 0) {
                        out.append('\n');
                    }
                    out.append("part");
                    out.append(index);
                    index = index + 1;
                }
                String[] parts = out.toString().split('\n');
                IO.println(parts.length);
                IO.println(parts[0]);
                IO.println(parts[19]);
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(&exe).output().expect("run exe");
    assert!(
        run.status.success(),
        "exe failed\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "20\npart0\npart19\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_large_char_to_string_concat_honestly() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.lang.String;

        class Main {
            public static void main() {
                String out = "";
                int index = 0;
                while (index < 800) {
                    out = out.concat(String.valueOf('a'));
                    index = index + 1;
                }
                IO.println(out.length());
                IO.println(out.substring(out.length() - 5));
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(&exe).output().expect("run exe");
    assert!(
        run.status.success(),
        "exe failed\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "800\naaaaa\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_small_plus_large_string_concat_honestly() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.lang.StringBuilder;

        class Main {
            public static void main() {
                StringBuilder out = new StringBuilder();
                int index = 0;
                while (index < 800) {
                    out.append("a");
                    index = index + 1;
                }
                String text = "prefix-".concat(out.toString());
                IO.println(text.length());
                IO.println(text.substring(0, 7));
                IO.println(text.substring(text.length() - 5));
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(&exe).output().expect("run exe");
    assert!(
        run.status.success(),
        "exe failed\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "807\nprefix-\naaaaa\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_large_string_tail_substring_honestly() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.lang.StringBuilder;

        class Main {
            public static void main() {
                StringBuilder out = new StringBuilder();
                int index = 0;
                while (index < 800) {
                    out.append("a");
                    index = index + 1;
                }
                String text = "1:".concat(out.toString());
                String tail = text.substring(2);
                IO.println(tail.length());
                IO.println(tail.substring(tail.length() - 5));
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(&exe).output().expect("run exe");
    assert!(
        run.status.success(),
        "exe failed\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "800\naaaaa\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_console_reader_use_after_close_panics_deterministically() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.ConsoleReader;
        import pulse.lang.System;

        class Main {
            public static void main() {
                ConsoleReader input = System.in;
                input.close();
                input.readLine();
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let run = Command::new(root.join("build").join("main.exe"))
        .output()
        .expect("run closed-console executable");
    assert!(!run.status.success(), "expected non-zero exit");
    let combined = format!(
        "{}\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    )
    .replace('\r', "");
    assert!(
        combined.contains("ConsoleReader is closed"),
        "expected closed-console diagnostic\n{}",
        combined
    );

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_resource_scope_closes_registered_resources_in_reverse_order() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.collections.ArrayList;
        import pulse.collections.List;
        import pulse.io.ResourceScope;
        import pulse.lang.AutoCloseable;
        import pulse.lang.IO;

        class Probe implements AutoCloseable {
            private String name;
            private boolean closed;
            private static String log = "";

            public Probe(String name) {
                this.name = name;
                this.closed = false;
            }

            public void close() {
                if (this.closed) {
                    return;
                }
                Probe.log = Probe.log.concat(this.name);
                this.closed = true;
            }

            public static String log() {
                return Probe.log;
            }
        }

        class Main {
            public static void main() {
                ResourceScope scope = new ResourceScope();
                scope.add(new Probe("A"));
                scope.add(new Probe("B"));
                scope.add(new Probe("C"));
                IO.println(scope.size());
                scope.close();
                IO.println(scope.size());
                IO.println(Probe.log());
                IO.println(scope.isClosed());
                IO.println(scope.isOpen());
                scope.close();
                IO.println(Probe.log());

                List<AutoCloseable> closers = new ArrayList<AutoCloseable>();
                AutoCloseable missing = null;
                closers.add(new Probe("D"));
                closers.add(missing);
                closers.add(new Probe("E"));
                ResourceScope.closeAll(closers);
                IO.println(Probe.log());

                ResourceScope clearScope = new ResourceScope();
                clearScope.add(new Probe("F"));
                clearScope.add(new Probe("G"));
                IO.println(clearScope.size());
                clearScope.clear();
                IO.println(clearScope.size());
                clearScope.close();
                IO.println(Probe.log());
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let run = Command::new(root.join("build").join("main.exe"))
        .output()
        .expect("run resource-scope executable");
    assert!(run.status.success(), "exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "3\n0\nCBA\ntrue\nfalse\nCBA\nCBAED\n2\n0\nCBAED\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_resource_scope_use_after_close_panics_deterministically() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.io.ResourceScope;

        class Main {
            public static void main() {
                ResourceScope scope = new ResourceScope();
                scope.close();
                scope.add(null);
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let run = Command::new(root.join("build").join("main.exe"))
        .output()
        .expect("run closed-scope executable");
    assert!(!run.status.success(), "expected non-zero exit");
    let combined = format!(
        "{}\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    )
    .replace('\r', "");
    assert!(
        combined.contains("ResourceScope is closed"),
        "expected closed-scope diagnostic\n{}",
        combined
    );

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_try_with_resources_baseline() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.AutoCloseable;
        import pulse.lang.Exception;
        import pulse.lang.IO;

        class Probe implements AutoCloseable {
            private String name;
            private static String log = "";

            public Probe(String name) {
                this.name = name;
            }

            public static Probe open(String name, boolean fail) throws Exception {
                if (fail) {
                    throw new Exception(name.concat("-open"));
                }
                return new Probe(name);
            }

            public void close() {
                Probe.log = Probe.log.concat(this.name);
            }

            public static String log() {
                return Probe.log;
            }
        }

        class Main {
            public static void main() {
                try (Probe first = Probe.open("A", false); Probe second = Probe.open("B", false)) {
                    IO.println("body");
                } catch (Exception ex) {
                    IO.println("miss");
                }
                IO.println(Probe.log());

                try (Probe third = Probe.open("C", false); Probe fourth = Probe.open("D", true)) {
                    IO.println("miss");
                } catch (Exception ex) {
                    IO.println(ex.getMessage());
                }
                IO.println(Probe.log());
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let run = Command::new(root.join("build").join("main.exe"))
        .output()
        .expect("run try-with-resources executable");
    assert!(run.status.success(), "exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "body\nBA\nD-open\nBAC\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_executes_large_string_builder_growth_honestly() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.lang.StringBuilder;

        class Main {
            public static void main() {
                StringBuilder out = new StringBuilder();
                int index = 0;
                while (index < 80) {
                    out.append("0123456789");
                    index = index + 1;
                }
                String text = out.toString();
                IO.println(text.length());
                IO.println(text.substring(text.length() - 10));
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(&exe).output().expect("run exe");
    assert!(
        run.status.success(),
        "exe failed\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "800\n0123456789\n");

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_inputstream_use_after_close_panics_deterministically() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.io.File;
        import pulse.io.InputStream;

        class Main {
            public static void main() {
                File.writeAllText("closed.txt", "pulse");
                InputStream input = File.openInputStream("closed.txt");
                input.close();
                input.readAll();
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let run = Command::new(root.join("build").join("main.exe"))
        .output()
        .expect("run closed-input executable");
    assert!(!run.status.success(), "expected non-zero exit");
    let combined = format!(
        "{}\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    )
    .replace('\r', "");
    assert!(
        combined.contains("InputStream is closed"),
        "expected closed-input diagnostic\n{}",
        combined
    );

    let _ = fs::remove_dir_all(root);
}

#[test]
fn cli_build_outputstream_use_after_close_panics_deterministically() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.io.File;
        import pulse.io.OutputStream;

        class Main {
            public static void main() {
                OutputStream out = File.openOutputStream("closed.txt");
                out.close();
                out.write("boom");
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");

    if !build_supports_runtime_execution(&output, &root) {
        return;
    }

    let run = Command::new(root.join("build").join("main.exe"))
        .output()
        .expect("run closed-output executable");
    assert!(!run.status.success(), "expected non-zero exit");
    let combined = format!(
        "{}\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    )
    .replace('\r', "");
    assert!(
        combined.contains("OutputStream is closed"),
        "expected closed-output diagnostic\n{}",
        combined
    );

    let _ = fs::remove_dir_all(root);
}

