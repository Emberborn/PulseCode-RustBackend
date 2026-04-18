mod common;
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
        "adenc_cast_lock_{}_{}_{}",
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

fn run_adenc(args: &[&str]) -> std::process::Output {
    common::adenc_command()
        .args(args)
        .output()
        .expect("run adenc")
}

fn assert_check_ok(entry: &Path, src_root: &Path) {
    let output = run_adenc(&[
        "check",
        entry.to_str().expect("entry utf8"),
        "--source-root",
        src_root.to_str().expect("src utf8"),
        "--strict-package",
    ]);
    assert!(
        output.status.success(),
        "expected check success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );
}

#[test]
fn lock_cast_01_suffix_literals_typecheck() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.aden");
    write_file(
        &entry,
        r#"
        package app.core;
        class Main {
            public static void main() {
                long l = 20L;
                double d = 20.3d;
                float f = 30.5f;
            }
        }"#,
    );
    assert_check_ok(&entry, &src_root);
}

#[test]
fn lock_cast_02_contextual_literals_typecheck() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.aden");
    write_file(
        &entry,
        r#"
        package app.core;
        class Main {
            public static long asLong() { return 20; }
            public static double asDouble() { return 23.3; }
            public static float asFloat() { return 23.3; }
            public static void main() {
                long l = 20;
                double d = 23.3;
                float f = 23.3;
            }
        }"#,
    );
    assert_check_ok(&entry, &src_root);
}

#[test]
fn lock_cast_03_explicit_numeric_casts_typecheck() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.aden");
    write_file(
        &entry,
        r#"
        package app.core;
        class Main {
            public static void main() {
                int i = 10;
                long l = (long) i;
                double d = (double) l;
                float f = (float) d;
                int back = (int) d;
                long backLong = (long) f;
            }
        }"#,
    );
    assert_check_ok(&entry, &src_root);
}

#[test]
fn lock_cast_04_field_initializers_with_casts_typecheck() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.aden");
    write_file(
        &entry,
        r#"
        package app.core;
        class Main {
            public static int a = 10;
            public static long b = (long) 20;
            public static int c = (int) 20.9d;
            public static void main() {
                c = a + (int) b;
            }
        }"#,
    );
    assert_check_ok(&entry, &src_root);
}

#[test]
fn lock_cast_05_explicit_truncation_casts_negative_values_typecheck() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.aden");
    write_file(
        &entry,
        r#"
        package app.core;
        class Main {
            public static void main() {
                int a = (int) (-2.9d);
                long b = (long) (-2.9f);
            }
        }"#,
    );
    assert_check_ok(&entry, &src_root);
}

#[test]
fn lock_cast_06_boxed_long_contextual_int_literal_assignment_typecheck() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.aden");
    write_file(
        &entry,
        r#"
        package app.core;
        import aden.lang.Long;
        class Main {
            public static void main() {
                Long a = 20;
            }
        }"#,
    );
    assert_check_ok(&entry, &src_root);
}

#[test]
fn lock_cast_07_unparenthesized_negative_decimal_cast_typecheck() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.aden");
    write_file(
        &entry,
        r#"
        package app.core;
        class Main {
            public static void main() {
                int a = (int) -2.9d;
                long b = (long) -2.9f;
            }
        }"#,
    );
    assert_check_ok(&entry, &src_root);
}
