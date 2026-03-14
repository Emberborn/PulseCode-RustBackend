use std::fs;
use std::path::{Path, PathBuf};
use std::process::Command;
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
        "pulsec_cast_fail_lock_{}_{}_{}",
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
    Command::new(env!("CARGO_BIN_EXE_pulsec"))
        .args(args)
        .output()
        .expect("run pulsec")
}

fn assert_check_fails(entry: &Path, src_root: &Path, expected: &str) {
    let output = run_pulsec(&[
        "check",
        entry.to_str().expect("entry utf8"),
        "--source-root",
        src_root.to_str().expect("src utf8"),
        "--strict-package",
    ]);
    assert!(!output.status.success(), "expected check failure");
    let stderr = String::from_utf8_lossy(&output.stderr);
    assert!(
        stderr.contains(expected),
        "expected stderr to contain '{}'\nstderr:\n{}",
        expected,
        stderr
    );
}

#[test]
fn lock_cast_fail_01_rejects_invalid_cast_boolean_to_int() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        class Main {
            public static void main() {
                int x = (int) true;
            }
        }"#,
    );
    assert_check_fails(&entry, &src_root, "Invalid cast from 'boolean' to 'int'");
}

#[test]
fn lock_cast_fail_02_rejects_byte_overflow_literal_assignment() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        class Main {
            public static void main() {
                byte a = 10000000;
            }
        }"#,
    );
    assert_check_fails(&entry, &src_root, "Implicit numeric conversion 'int' -> 'byte'");
}

#[test]
fn lock_cast_fail_03_rejects_large_unsuffixed_literal_for_long_target() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        class Main {
            public static void main() {
                long a = 2147483648;
            }
        }"#,
    );
    assert_check_fails(&entry, &src_root, "exceeds int range");
}

#[test]
fn lock_cast_fail_04_rejects_long_to_int_without_cast() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        class Main {
            public static void main() {
                int a = 20L;
            }
        }"#,
    );
    assert_check_fails(&entry, &src_root, "Implicit numeric conversion 'long' -> 'int'");
}

#[test]
fn lock_cast_fail_05_rejects_float_to_int_without_cast() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        class Main {
            public static void main() {
                int a = 2.9f;
            }
        }"#,
    );
    assert_check_fails(&entry, &src_root, "Implicit numeric conversion 'float' -> 'int'");
}
