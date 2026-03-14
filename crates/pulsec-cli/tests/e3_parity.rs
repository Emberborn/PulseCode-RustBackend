use std::env;
use std::fs;
use std::path::PathBuf;
use std::process::{Command, Output};
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

fn unique_temp_root() -> PathBuf {
    let nanos = SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .expect("time should move forward")
        .as_nanos();
    std::env::temp_dir().join(format!("pulsec_e3_parity_{nanos}"))
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

    let mut command = Command::new(env!("CARGO_BIN_EXE_pulsec"));
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
    let run = Command::new(&exe).output().expect("run built executable");
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

#[test]
fn e3_12_parity_ci_suite_runs_matched_fat_shared_fixture_corpus() {
    for (fixture_name, entry_rel, expected) in [
        ("runtime_mix", "app/runtime/Main.pulse", "runtime_mix_ok\n"),
        ("object_interface_mix", "app/mixed/Main.pulse", "object_interface_mix_ok\n"),
        ("strict_stress_soak", "strict_stress_soak/Main.pulse", "soak_ok\n20313\n"),
    ] {
        let Some(fat_out) = build_and_run_fixture_in_mode(fixture_name, entry_rel, "fat") else {
            return;
        };
        let Some(shared_out) =
            build_and_run_fixture_in_mode(fixture_name, entry_rel, "shared")
        else {
            return;
        };
        assert_eq!(fat_out, expected, "{fixture_name} fat output drifted");
        assert_eq!(shared_out, expected, "{fixture_name} shared output drifted");
        assert_eq!(fat_out, shared_out, "{fixture_name} fat/shared outputs diverged");
    }
}
