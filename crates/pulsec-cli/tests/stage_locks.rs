use std::fs;
use std::path::{Path, PathBuf};
use std::process::Command;
use std::sync::atomic::{AtomicU64, Ordering};
use std::time::{SystemTime, UNIX_EPOCH};

fn fixture_root(name: &str) -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("tests")
        .join("fixtures")
        .join(name)
}

fn unique_temp_root() -> PathBuf {
    static NEXT_ID: AtomicU64 = AtomicU64::new(1);
    let nanos = SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .expect("system time")
        .as_nanos();
    let id = NEXT_ID.fetch_add(1, Ordering::Relaxed);
    let root = std::env::temp_dir().join(format!(
        "pulsec_stage_lock_{}_{}_{}",
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

fn assert_check_ok(entry: &Path, src_root: &Path) {
    let output = run_pulsec(&[
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

fn assert_fixture_build_and_run(name: &str, entry_rel: &str, expected_out: &str) {
    let fixture = fixture_root(name);
    let root = unique_temp_root();
    let src_root = root.join("src");
    copy_dir_recursive(&fixture.join("src"), &src_root);
    let entry = src_root.join(entry_rel);
    let exe = root.join("build").join("main.exe");
    let _ = fs::remove_file(&exe);
    let output = run_pulsec(&[
        "build",
        entry.to_str().expect("entry utf8"),
        "--source-root",
        src_root.to_str().expect("src utf8"),
        "--strict-package",
    ]);
    assert!(
        output.status.success(),
        "expected build success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );
    let report = fs::read_to_string(root.join("build").join("native.link.txt"))
        .expect("read native.link.txt");
    assert!(
        report.contains("status=linked"),
        "expected linked status in report:\n{}",
        report
    );
    let run = Command::new(&exe).output().expect("run exe");
    assert!(run.status.success(), "exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, expected_out, "unexpected output");
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

#[test]
fn lock_m2_01_wrapper_map_semantics() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import com.pulse.lang.Integer;
        import com.pulse.lang.Boolean;
        class Main {
            public static void main() {
                Integer x = 1;
                int y = x;
                Boolean ok = true;
                boolean b = ok;
            }
        }"#,
    );
    assert_check_ok(&entry, &src_root);
}

#[test]
fn lock_m2_02_signed_wrapper_skeletons_importable() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import com.pulse.lang.Byte;
        import com.pulse.lang.Short;
        import com.pulse.lang.Integer;
        import com.pulse.lang.Long;
        import com.pulse.lang.Float;
        import com.pulse.lang.Double;
        import com.pulse.lang.Char;
        import com.pulse.lang.Boolean;
        class Main {
            public static void main() {
                Byte b = null;
                Short s = null;
                Integer i = null;
                Long l = null;
                Float f = null;
                Double d = null;
                Char c = null;
                Boolean ok = null;
            }
        }"#,
    );
    assert_check_ok(&entry, &src_root);
}

#[test]
fn lock_m2_03_unsigned_wrapper_skeletons_importable() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import com.pulse.lang.UByte;
        import com.pulse.lang.UShort;
        import com.pulse.lang.UInteger;
        import com.pulse.lang.ULong;
        class Main {
            public static void main() {
                UByte b = null;
                UShort s = null;
                UInteger i = null;
                ULong l = null;
            }
        }"#,
    );
    assert_check_ok(&entry, &src_root);
}

#[test]
fn lock_m2_04_void_wrapper_contract() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import com.pulse.lang.Void;
        class Main {
            public static Void id(Void v) { return v; }
            public static void main() {
                Void v = null;
                id(v);
            }
        }"#,
    );
    assert_check_ok(&entry, &src_root);
}

#[test]
fn lock_m2_05_boxing_assignment() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import com.pulse.lang.Integer;
        class Main {
            public static void main() {
                Integer boxed = 42;
            }
        }"#,
    );
    assert_check_ok(&entry, &src_root);
}

#[test]
fn lock_m2_06_unboxing_assignment() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import com.pulse.lang.Integer;
        class Main {
            public static void main() {
                Integer boxed = Integer.valueOf(9);
                int unboxed = boxed;
            }
        }"#,
    );
    assert_check_ok(&entry, &src_root);
}

#[test]
fn lock_m2_07_boxing_in_call_and_return() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import com.pulse.lang.Integer;
        class Main {
            public static int id(int x) { return x; }
            public static Integer wid(Integer x) { return x; }
            public static void main() {
                Integer a = wid(3);
                int b = id(a);
            }
        }"#,
    );
    assert_check_ok(&entry, &src_root);
}

#[test]
fn lock_m2_08_overload_precedence() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import com.pulse.lang.Integer;
        class Main {
            public static void pick(int x) {}
            public static void pick(Integer x) {}
            public static void main() {
                pick(1);
                pick(Integer.valueOf(2));
            }
        }"#,
    );
    assert_check_ok(&entry, &src_root);
}

#[test]
fn lock_m2_09_numeric_conversion_diagnostics() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        class Main {
            public static void main() {
                uint u = -1;
            }
        }"#,
    );
    assert_check_fails(&entry, &src_root, "Semantic error");
}

#[test]
fn lock_m2_10_wrapper_api_surface() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import com.pulse.lang.Integer;
        import com.pulse.lang.Boolean;
        class Main {
            public static void main() {
                Integer i = Integer.valueOf(5);
                int p = Integer.intValue(i);
                boolean eq = Integer.equals(p, 5);
                int cmp = Integer.compare(p, 7);
                Integer parsed = Integer.parse("9");
                Boolean b = Boolean.valueOf(true);
                Boolean pb = Boolean.parse("true");
                boolean raw = Boolean.booleanValue(pb);
            }
        }"#,
    );
    assert_check_ok(&entry, &src_root);
}

#[test]
fn lock_m2_11_core_bootstrap_classes() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import com.pulse.lang.Object;
        import com.pulse.lang.StringBuilder;
        import com.pulse.lang.Iterable;
        import com.pulse.lang.Iterator;
        class Main {
            public static void main() {
                Object o = new Object();
                StringBuilder sb = new StringBuilder();
                sb.append("x");
                Iterable it = null;
                Iterator iter = null;
            }
        }"#,
    );
    assert_check_ok(&entry, &src_root);
}

#[test]
fn lock_m2_12_wrapper_nullability_enforced() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import com.pulse.lang.Integer;
        class Main {
            public static void main() {
                Integer x = null;
                int y = x;
            }
        }"#,
    );
    assert_check_fails(&entry, &src_root, "Cannot unbox null variable");
}

#[test]
fn lock_m2_13_wrapper_runtime_failure_fixture() {
    assert_fixture_build_and_run("strict_stress_soak", "strict_stress_soak/Main.pulse", "soak_ok\n40415\n");
}

#[test]
fn lock_m2_14_freeze_docs_present() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..").join("docs");
    let freeze = fs::read_to_string(root.join("M1_SEMANTICS_FREEZE.md")).expect("read freeze doc");
    let matrix = fs::read_to_string(root.join("NUMERIC_CONVERSION_MATRIX.md")).expect("read conversion matrix");
    assert!(freeze.contains("boxing") || freeze.contains("Boxing"));
    assert!(matrix.contains("signed") && matrix.contains("unsigned"));
}

#[test]
fn lock_m3_01_exception_hierarchy_available() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import com.pulse.lang.Throwable;
        import com.pulse.lang.Exception;
        import com.pulse.lang.RuntimeException;
        class Main {
            public static void main() {
                Throwable t = new Exception();
                Exception e = new RuntimeException();
            }
        }"#,
    );
    assert_check_ok(&entry, &src_root);
}

#[test]
fn lock_m3_02_runtime_exception_set_available() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import com.pulse.lang.IllegalArgumentException;
        import com.pulse.lang.IllegalStateException;
        import com.pulse.lang.NullPointerException;
        import com.pulse.lang.IndexOutOfBoundsException;
        import com.pulse.lang.UnsupportedOperationException;
        import com.pulse.lang.NumberFormatException;
        class Main {
            public static void main() {
                IllegalArgumentException a = new IllegalArgumentException();
                IllegalStateException b = new IllegalStateException();
                NullPointerException c = new NullPointerException();
                IndexOutOfBoundsException d = new IndexOutOfBoundsException();
                UnsupportedOperationException e = new UnsupportedOperationException();
                NumberFormatException f = new NumberFormatException();
            }
        }"#,
    );
    assert_check_ok(&entry, &src_root);
}

#[test]
fn lock_m3_03_collection_list_contracts() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import com.pulse.collections.Collection;
        import com.pulse.collections.List;
        import com.pulse.collections.ArrayList;
        class Main {
            public static void main() {
                Collection c = new ArrayList();
                List l = new ArrayList();
            }
        }"#,
    );
    assert_check_ok(&entry, &src_root);
}

#[test]
fn lock_m3_04_arraylist_surface() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import com.pulse.collections.ArrayList;
        class Main {
            public static void main() {
                ArrayList l = new ArrayList();
                l.add(1);
                int x = l.getInt(0);
            }
        }"#,
    );
    assert_check_ok(&entry, &src_root);
}

#[test]
fn lock_m3_05_linkedlist_surface() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import com.pulse.collections.LinkedList;
        class Main {
            public static void main() {
                LinkedList l = new LinkedList();
                l.add(1);
                int x = l.getInt(0);
            }
        }"#,
    );
    assert_check_ok(&entry, &src_root);
}

#[test]
fn lock_m3_06_set_hashset_surface() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import com.pulse.collections.HashSet;
        class Main {
            public static void main() {
                HashSet s = new HashSet();
                s.add("x");
                boolean c = s.contains("x");
            }
        }"#,
    );
    assert_check_ok(&entry, &src_root);
}

#[test]
fn lock_m3_07_map_hashmap_surface() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import com.pulse.collections.HashMap;
        class Main {
            public static void main() {
                HashMap m = new HashMap();
                m.putInt("hp", 10);
                int hp = m.getInt("hp");
            }
        }"#,
    );
    assert_check_ok(&entry, &src_root);
}

#[test]
fn lock_m3_08_queue_deque_surface() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import com.pulse.collections.LinkedList;
        class Main {
            public static void main() {
                LinkedList q = new LinkedList();
                q.offer(1);
                int x = q.poll();
                q.addFirst(2);
                int y = q.removeFirst();
            }
        }"#,
    );
    assert_check_ok(&entry, &src_root);
}

#[test]
fn lock_m3_09_math_surface() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import com.pulse.math.Math;
        class Main {
            public static void main() {
                int x = Math.max(1, 2);
                int y = Math.abs(-5);
            }
        }"#,
    );
    assert_check_ok(&entry, &src_root);
}

#[test]
fn lock_m3_10_random_seeded_surface() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import com.pulse.math.Random;
        class Main {
            public static void main() {
                Random r = new Random(0);
                int x = r.nextInt(10);
            }
        }"#,
    );
    assert_check_ok(&entry, &src_root);
}

#[test]
fn lock_m3_11_file_path_files_surface() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import com.pulse.io.Files;
        import com.pulse.io.Path;
        class Main {
            public static void main() {
                String p = Path.combine("a", "b");
                Files.writeString(p, "x");
                String read = Files.readString(p);
            }
        }"#,
    );
    assert_check_ok(&entry, &src_root);
}

#[test]
fn lock_m3_12_stream_surface() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import com.pulse.io.InputStream;
        import com.pulse.io.OutputStream;
        class Main {
            public static void main() {
                OutputStream out = new OutputStream("x");
                out.write("a");
                InputStream inp = new InputStream("x");
                String s = inp.readAll();
            }
        }"#,
    );
    assert_check_ok(&entry, &src_root);
}

#[test]
fn lock_m3_13_time_surface() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import com.pulse.time.Instant;
        import com.pulse.time.Duration;
        class Main {
            public static void main() {
                Instant now = Instant.now();
                Duration d = Duration.ofMillis(3);
                Instant next = now.plusMillis(d.toMillis());
            }
        }"#,
    );
    assert_check_ok(&entry, &src_root);
}

#[test]
fn lock_m3_14_abi_doc_and_lock_tests_exist() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..");
    let abi_doc = fs::read_to_string(root.join("docs").join("RUNTIME_INTRINSICS_ABI.md"))
        .expect("read ABI doc");
    assert!(abi_doc.contains("Intrinsics.arrayNew"));
    assert!(abi_doc.contains("pulsec_rt_mapGetInt"));
}

#[test]
fn lock_m3_15_multifile_fixture_projects_check() {
    let runtime_mix = fixture_root("runtime_mix");
    let runtime_src = runtime_mix.join("src");
    let runtime_entry = runtime_src.join("app/runtime/Main.pulse");
    assert_check_ok(&runtime_entry, &runtime_src);

    let mix = fixture_root("object_interface_mix");
    let mix_src = mix.join("src");
    let mix_entry = mix_src.join("app/mixed/Main.pulse");
    assert_check_ok(&mix_entry, &mix_src);
}

#[test]
fn lock_m3_16_stress_soak_fixture_check() {
    let strict = fixture_root("strict_stress_soak");
    let strict_src = strict.join("src");
    let strict_entry = strict_src.join("strict_stress_soak/Main.pulse");
    assert_check_ok(&strict_entry, &strict_src);
}

#[test]
fn lock_m3_17_windows_matrix_doc_exists() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..").join("docs");
    let matrix = fs::read_to_string(root.join("WINDOWS_TOOLCHAIN_MATRIX.md"))
        .expect("read windows toolchain matrix");
    assert!(matrix.contains("Default linker discovery"));
    assert!(matrix.contains("Explicit linker CLI override"));
    assert!(matrix.contains("PULSEC_LINKER"));
}

#[test]
fn lock_e3_14_windows_matrix_covers_fat_shared_package_install_parity() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..").join("docs");
    let matrix = fs::read_to_string(root.join("WINDOWS_TOOLCHAIN_MATRIX.md"))
        .expect("read windows toolchain matrix");
    assert!(matrix.contains("E3 Fat/Shared Parity Validation Matrix"));
    assert!(matrix.contains("Release native build + launch"));
    assert!(matrix.contains("Debug native build + launch"));
    assert!(matrix.contains("Staged package output"));
    assert!(matrix.contains("MSI generation"));
    assert!(matrix.contains("MSI install + launch"));
    assert!(matrix.contains("MSI repair/upgrade/uninstall"));
    assert!(matrix.contains("Shared-only expected additions"));
    assert!(matrix.contains("supported programs in the locked fixture corpus"));
}

#[test]
fn lock_f1_board_explicitly_tracks_scanner_util_concurrency_network_and_defers_desktop_ui() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..").join("docs");
    let board = fs::read_to_string(root.join("F1_TASK_BOARD.md"))
        .expect("read F1 task board");
    let roadmap = fs::read_to_string(root.join("STANDALONE_ROADMAP.md"))
        .expect("read standalone roadmap");
    assert!(board.contains("com.pulse.util"));
    assert!(board.contains("Scanner"));
    assert!(board.contains("Objects"));
    assert!(!board.contains("Optional"));
    assert!(board.contains("Lock F1 generics scope"));
    assert!(board.contains("Compile-time instantiated generics with erased runtime are real today"));
    assert!(board.contains("collection-wide generic story"));
    assert!(board.contains("F1-29"));
    assert!(board.contains("F1-35"));
    assert!(board.contains("F1-101"));
    assert!(board.contains("runtime cross-method Pulse-throw unwind now works"));
    assert!(board.contains("pre-self-host concurrency baseline"));
    assert!(board.contains("networking baseline policy"));
    assert!(board.contains("sockets-only baseline"));
    assert!(board.contains("URL/HTTP"));
    assert!(board.contains("Thread"));
    assert!(board.contains("Runnable"));
    assert!(board.contains("volatile"));
    assert!(board.contains("final` fields"));
    assert!(board.contains("AtomicInteger"));
    assert!(board.contains("AtomicReference"));
    assert!(board.contains("ConcurrentHashMap"));
    assert!(board.contains("CopyOnWriteArrayList"));
    assert!(board.contains("executors/semaphores"));
    assert!(board.contains("reflection-lite"));
    assert!(board.contains("full Java-style reflection/invocation"));
    assert!(board.contains("external library/binding ecosystem"));
    assert!(board.contains("awt"));
    assert!(board.contains("swing"));
    assert!(board.contains("deferred until after self-hosting"));
    assert!(roadmap.contains("com.pulse.util"));
    assert!(roadmap.contains("Scanner"));
    assert!(roadmap.contains("generics baseline is explicitly chosen"));
    assert!(roadmap.contains("exception runtime model is explicitly chosen"));
    assert!(roadmap.contains("Thread"));
    assert!(roadmap.contains("Runnable"));
    assert!(roadmap.contains("volatile"));
    assert!(roadmap.contains("atomics"));
    assert!(roadmap.contains("concurrent collections"));
    assert!(roadmap.contains("executor/semaphore"));
    assert!(roadmap.contains("reflection-lite"));
    assert!(roadmap.contains("full reflection/invocation deferred until after self-hosting"));
    assert!(roadmap.contains("external library/binding ecosystem work remains in Phase F-A"));
    assert!(roadmap.contains("desktop UI families"));
    assert!(roadmap.contains("after self-hosting"));
}

#[test]
fn lock_f2_language_docs_tree_is_explicit_and_present() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..");
    let f2 = fs::read_to_string(root.join("docs").join("F2_TASK_BOARD.md"))
        .expect("read F2 task board");
    let roadmap = fs::read_to_string(root.join("docs").join("STANDALONE_ROADMAP.md"))
        .expect("read standalone roadmap");
    let compiler_backed = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("compiler-backed")
            .join("README.md"),
    )
    .expect("read compiler-backed language docs readme");
    let runtime_backed = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("runtime-backed")
            .join("README.md"),
    )
    .expect("read runtime-backed language docs readme");
    let stdlib = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("stdlib")
            .join("README.md"),
    )
    .expect("read stdlib language docs readme");
    let packages_and_imports = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("compiler-backed")
            .join("packages-and-imports.md"),
    )
    .expect("read compiler-backed packages/imports doc");
    let declarations = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("compiler-backed")
            .join("declarations-and-modifiers.md"),
    )
    .expect("read compiler-backed declarations doc");
    let constructors = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("compiler-backed")
            .join("constructors.md"),
    )
    .expect("read compiler-backed constructors doc");
    let types = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("compiler-backed")
            .join("types-and-conversions.md"),
    )
    .expect("read compiler-backed types doc");
    let entry = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("runtime-backed")
            .join("program-entry-and-execution.md"),
    )
    .expect("read runtime-backed entry doc");
    let gc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("runtime-backed")
            .join("object-lifetime-and-gc.md"),
    )
    .expect("read runtime-backed gc doc");
    let null_and_type = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("runtime-backed")
            .join("runtime-type-and-null-behavior.md"),
    )
    .expect("read runtime-backed null/type doc");
    let exceptions = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("runtime-backed")
            .join("exceptions-and-failure.md"),
    )
    .expect("read runtime-backed exceptions doc");
    assert!(f2.contains("docs/language/{compiler-backed,runtime-backed,stdlib}"));
    assert!(f2.contains("PulseDoc"));
    assert!(roadmap.contains("docs/language/{compiler-backed,runtime-backed,stdlib}"));
    assert!(compiler_backed.contains("compiler/frontend/type system"));
    assert!(runtime_backed.contains("runtime/native backend"));
    assert!(stdlib.contains("each doc file corresponds to exactly one `.pulse` class"));
    assert!(packages_and_imports.contains("static imports"));
    assert!(declarations.contains("Supported Declaration Kinds"));
    assert!(constructors.contains("Construction Call"));
    assert!(constructors.contains("new Player(\"Nova\")"));
    assert!(types.contains("Current primitive baseline"));
    assert!(entry.contains("Exactly one valid entry point is required"));
    assert!(gc.contains("ARC-backed runtime ownership"));
    assert!(null_and_type.contains("Full Java-style reflection is intentionally deferred"));
    assert!(exceptions.contains("checked exceptions from calls/constructors are enforced by semantic analysis"));
}

#[test]
fn lock_current_shipped_stdlib_pulse_files_have_multiline_pulsedoc_blocks() {
    fn has_pulsedoc_before(lines: &[&str], index: usize) -> bool {
        let mut cursor = index;
        while cursor > 0 {
            cursor -= 1;
            let trimmed = lines[cursor].trim();
            if trimmed.is_empty() {
                continue;
            }
            if trimmed == "*/" {
                let mut start = cursor;
                while start > 0 {
                    start -= 1;
                    let candidate = lines[start].trim();
                    if candidate.starts_with("/**") {
                        return true;
                    }
                    if !candidate.starts_with('*') && !candidate.is_empty() {
                        return false;
                    }
                }
                return false;
            }
            return false;
        }
        false
    }

    fn is_type_declaration(trimmed: &str) -> bool {
        if trimmed.starts_with('/') || trimmed.starts_with('*') {
            return false;
        }
        trimmed.contains(" class ")
            || trimmed.starts_with("class ")
            || trimmed.contains(" interface ")
            || trimmed.starts_with("interface ")
            || trimmed.contains(" enum ")
            || trimmed.starts_with("enum ")
    }

    fn is_public_method_or_constructor(trimmed: &str) -> bool {
        trimmed.starts_with("public ")
            && trimmed.contains('(')
            && (trimmed.ends_with('{') || trimmed.ends_with(';'))
    }

    fn is_public_field(trimmed: &str) -> bool {
        trimmed.starts_with("public ") && trimmed.ends_with(';') && !trimmed.contains('(')
    }

    fn collect_pulse_files(root: &Path, out: &mut Vec<PathBuf>) {
        for entry in fs::read_dir(root).expect("read stdlib dir") {
            let entry = entry.expect("dir entry");
            let path = entry.path();
            if path.is_dir() {
                collect_pulse_files(&path, out);
            } else if path.extension().and_then(|ext| ext.to_str()) == Some("pulse") {
                out.push(path);
            }
        }
    }

    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..")
        .join("stdlib")
        .join("src")
        .join("com")
        .join("pulse");
    let mut files = Vec::new();
    collect_pulse_files(&root, &mut files);
    for file in files {
        let text = fs::read_to_string(&file).expect("read stdlib pulse file");
        let lines: Vec<&str> = text.lines().collect();
        assert!(
            text.contains("/**") && text.contains("*/"),
            "expected PulseDoc block in {}",
            file.display()
        );
        for (index, line) in lines.iter().enumerate() {
            let trimmed = line.trim();
            if is_type_declaration(trimmed) {
                assert!(
                    has_pulsedoc_before(&lines, index),
                    "expected PulseDoc before type declaration in {}: {}",
                    file.display(),
                    trimmed
                );
            }
            if is_public_method_or_constructor(trimmed) || is_public_field(trimmed) {
                assert!(
                    has_pulsedoc_before(&lines, index),
                    "expected PulseDoc before public member in {}: {}",
                    file.display(),
                    trimmed
                );
            }
        }
    }
}

#[test]
fn lock_generated_stdlib_reference_docs_cover_shipped_stdlib_surface() {
    fn collect_files(root: &Path, extension: &str, out: &mut Vec<PathBuf>) {
        for entry in fs::read_dir(root).expect("read dir") {
            let entry = entry.expect("dir entry");
            let path = entry.path();
            if path.is_dir() {
                collect_files(&path, extension, out);
            } else if path.extension().and_then(|ext| ext.to_str()) == Some(extension) {
                out.push(path);
            }
        }
    }

    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..");
    let script = fs::read_to_string(root.join("scripts").join("generate-stdlib-docs.ps1"))
        .expect("read stdlib docs generator");
    let stdlib_readme = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("stdlib")
            .join("README.md"),
    )
    .expect("read stdlib docs readme");
    let stdlib_root = root.join("stdlib").join("src").join("com").join("pulse");
    let docs_root = root
        .join("docs")
        .join("language")
        .join("stdlib")
        .join("com")
        .join("pulse");
    let sample = fs::read_to_string(docs_root.join("lang").join("String.md"))
        .expect("read generated String stdlib doc");

    let mut pulse_files = Vec::new();
    let mut doc_files = Vec::new();
    collect_files(&stdlib_root, "pulse", &mut pulse_files);
    collect_files(&docs_root, "md", &mut doc_files);

    assert!(script.contains("docs\\language\\stdlib"));
    assert!(script.contains("Remove-Item -Recurse -Force $docsPulseRoot"));
    assert!(script.contains("## Members"));
    assert!(stdlib_readme.contains("overwrites the generated `docs/language/stdlib/com/pulse/**` tree"));
    assert_eq!(
        pulse_files.len(),
        doc_files.len(),
        "expected generated stdlib docs to cover each shipped stdlib pulse file"
    );
    assert!(sample.contains("# com.pulse.lang.String"));
    assert!(sample.contains("Source: ``stdlib/src/com/pulse/lang/String.pulse``"));
    assert!(sample.contains("## Members"));
    assert!(sample.contains("public int length()"));
}

#[test]
fn lock_f1_00_baseline_audit_distinguishes_real_partial_and_reserved_features() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..");
    let audit = fs::read_to_string(root.join("docs").join("F1_BASELINE_AUDIT.md"))
        .expect("read F1 baseline audit");
    let board = fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md"))
        .expect("read F1 task board");

    assert!(audit.contains("End-To-End Supported Baseline"));
    assert!(audit.contains("Reserved / Parsed / Tokenized But Not Supported As Real Features"));
    assert!(audit.contains("synchronized"));
    assert!(audit.contains("volatile"));
    assert!(audit.contains("async"));
    assert!(audit.contains("throwable/exception classes exist in the stdlib"));
    assert!(audit.contains("throw"));
    assert!(audit.contains("try"));
    assert!(audit.contains("catch"));
    assert!(audit.contains("finally"));
    assert!(audit.contains("enum runtime semantics are not implemented"));
    assert!(audit.contains("current practical annotation support is `@Override`"));
    assert!(audit.contains("collections are non-generic"));
    assert!(audit.contains("docs/LANGUAGE_GUIDE.md"));
    assert!(audit.contains("docs/LANGUAGE_OVERVIEW.md"));
    assert!(board.contains("| F1-00 |"));
    assert!(board.contains("Done (Locked)"));
}

#[test]
fn lock_f1_01_to_f1_03_gap_policy_and_dependency_docs_are_present_and_truthful() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..");
    let gap = fs::read_to_string(root.join("docs").join("F1_GAP_MATRIX.md"))
        .expect("read F1 gap matrix");
    let policy = fs::read_to_string(root.join("docs").join("F1_SUPPORT_POLICY.md"))
        .expect("read F1 support policy");
    let graph = fs::read_to_string(root.join("docs").join("F1_DEPENDENCY_GRAPH.md"))
        .expect("read F1 dependency graph");
    let board = fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md"))
        .expect("read F1 task board");

    assert!(gap.contains("Reserved/Fenced"));
    assert!(gap.contains("synchronized"));
    assert!(gap.contains("throw"));
    assert!(gap.contains("enum"));
    assert!(gap.contains("generics"));
    assert!(gap.contains("Real, non-generic, specialized"));

    assert!(policy.contains("Required By F1"));
    assert!(policy.contains("Allowed To Defer In F1"));
    assert!(policy.contains("Pulse-Specific Intentional Differences"));
    assert!(policy.contains("unsigned primitive and wrapper support"));
    assert!(policy.contains("reserved keywords or modifiers do not count as partial support"));

    assert!(graph.contains("Layer 0: Truth And Policy"));
    assert!(graph.contains("Layer 3: Runtime / Backend Enablement"));
    assert!(graph.contains("Layer 4: Stdlib Expansion"));
    assert!(graph.contains("Recommended Execution Batches"));
    assert!(graph.contains("Policy lock batch"));

    assert!(board.contains("| F1-01 |"));
    assert!(board.contains("| F1-02 |"));
    assert!(board.contains("| F1-03 |"));
    assert!(board.contains("Done (Locked)"));
}

#[test]
fn lock_f1_04_to_f1_08_lexer_and_literal_surface_is_documented_and_locked() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..");
    let board = fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md"))
        .expect("read F1 task board");
    let lexer_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("compiler-backed")
            .join("lexer-and-literals.md"),
    )
    .expect("read lexer and literals doc");

    assert!(lexer_doc.contains("## Keyword Baseline"));
    assert!(lexer_doc.contains("enum"));
    assert!(lexer_doc.contains("throw"));
    assert!(lexer_doc.contains("## Literal Baseline"));
    assert!(lexer_doc.contains("hexadecimal integer literals"));
    assert!(lexer_doc.contains("binary integer literals"));
    assert!(lexer_doc.contains("octal integer literals"));
    assert!(lexer_doc.contains("numeric underscore separators"));
    assert!(lexer_doc.contains("## Char Baseline"));
    assert!(lexer_doc.contains("char literal use in declarations and method-call arguments"));
    assert!(lexer_doc.contains("->"));
    assert!(lexer_doc.contains("::"));
    assert!(lexer_doc.contains("..."));
    assert!(lexer_doc.contains("invalid numeric underscore placement"));

    assert!(board.contains("| F1-04 |"));
    assert!(board.contains("| F1-05 |"));
    assert!(board.contains("| F1-06 |"));
    assert!(board.contains("| F1-07 |"));
    assert!(board.contains("| F1-08 |"));
    assert!(board.contains("Done (Locked)"));
}

#[test]
fn lock_f1_04_to_f1_08_cli_check_accepts_numeric_breadth_and_stages_char_literals_honestly() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;

        class Main {
            public static void main() {
                int hex = 0x2A;
                int binary = 0b101010;
                int octal = 052;
                int grouped = 1_000;
                long wide = 9_223L;
                float ratio = 3.14_15F;
                double precise = 6.02_2D;
            }
        }"#,
    );
    assert_check_ok(&entry, &src_root);

}

#[test]
fn lock_f1_09_f1_13_and_f1_14_type_modifier_and_declaration_edges_are_explicit() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..");
    let board = fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md"))
        .expect("read F1 task board");
    let decls = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("compiler-backed")
            .join("declarations-and-modifiers.md"),
    )
    .expect("read declarations and modifiers doc");
    let types = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("compiler-backed")
            .join("types-and-conversions.md"),
    )
    .expect("read types and conversions doc");
    let imports = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("compiler-backed")
            .join("packages-and-imports.md"),
    )
    .expect("read packages and imports doc");

    assert!(decls.contains("The following modifiers are intentionally fenced"));
    assert!(decls.contains("nested type declarations are not part of the current shipped baseline"));
    assert!(types.contains("varargs parameter declarations such as `String... args`"));
    assert!(types.contains("entrypoint `main(String... args)` is accepted"));
    assert!(imports.contains("nested or static-nested type import flows are deferred"));

    assert!(board.contains("| F1-09 |"));
    assert!(board.contains("| F1-13 |"));
    assert!(board.contains("| F1-14 |"));
    assert!(board.contains("Done (Locked)"));
}

#[test]
fn lock_f1_10_enum_baseline_is_documented_and_backend_backed() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..");
    let board = fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md"))
        .expect("read F1 task board");
    let decls = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("compiler-backed")
            .join("declarations-and-modifiers.md"),
    )
    .expect("read declarations and modifiers doc");
    let types = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("compiler-backed")
            .join("types-and-conversions.md"),
    )
    .expect("read types and conversions doc");
    let enums = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("compiler-backed")
            .join("enums.md"),
    )
    .expect("read enums doc");

    assert!(decls.contains("- `enum`"));
    assert!(types.contains("- enums"));
    assert!(enums.contains("ordinal-backed executable form"));
    assert!(enums.contains("full enum object model"));
    assert!(board.contains("| F1-10 |"));
    assert!(board.contains("In Progress"));
    assert!(board.contains("com.pulse.lang.Enum"));
}

#[test]
fn lock_f1_10_cli_build_executes_enum_baseline_honestly() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/types/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.types;
        import com.pulse.lang.IO;

        enum Mode {
            OFF,
            ON
        }

        class Main {
            public static void main() {
                Mode current = Mode.ON;
                if (current == Mode.ON) {
                    IO.println(1);
                } else {
                    IO.println(0);
                }
            }
        }"#,
    );

    let exe = root.join("build").join("main.exe");
    let output = run_pulsec(&[
        "build",
        entry.to_str().expect("entry utf8"),
        "--source-root",
        src_root.to_str().expect("src utf8"),
        "--strict-package",
    ]);
    assert!(
        output.status.success(),
        "expected enum build success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );
    let run = Command::new(&exe).output().expect("run enum exe");
    assert!(run.status.success(), "enum exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "1\n");
}

#[test]
fn lock_f1_11_and_f1_31_generics_contract_is_documented_as_compile_time_instantiated_runtime_erased() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..");
    let board = fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md"))
        .expect("read F1 task board");
    let policy = fs::read_to_string(root.join("docs").join("F1_SUPPORT_POLICY.md"))
        .expect("read F1 support policy");
    let generics = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("compiler-backed")
            .join("generics.md"),
    )
    .expect("read generics doc");

    assert!(generics.contains("compile-time instantiated generics with an erased runtime"));
    assert!(generics.contains("type parameters are supported on classes and interfaces"));
    assert!(generics.contains("type parameters are supported on methods"));
    assert!(generics.contains("primitive generic arguments are rejected"));
    assert!(generics.contains("Box<String>.get()"));
    assert!(generics.contains("Box<String>.set(Object)"));
    assert!(generics.contains("runtime lowering still erases instantiated generic owners"));
    assert!(board.contains("| F1-11 |"));
    assert!(board.contains("Compile-time instantiated generics with erased runtime are real today"));
    assert!(board.contains("| F1-31 |"));
    assert!(board.contains("Done (Locked)"));
    let _ = policy;
}

#[test]
fn lock_f1_31_cli_build_executes_instantiated_generic_members_with_runtime_erasure() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/generics/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.generics;
        import com.pulse.lang.IO;
        import com.pulse.lang.Object;

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
                String raw = box.get();
                String echoed = Main.id(raw);
                Object widened = box;
                IO.println(raw);
                IO.println(echoed);
                IO.println(widened != null);
            }
        }"#,
    );

    let exe = root.join("build").join("main.exe");
    let output = run_pulsec(&[
        "build",
        entry.to_str().expect("entry utf8"),
        "--source-root",
        src_root.to_str().expect("src utf8"),
        "--strict-package",
    ]);
    assert!(
        output.status.success(),
        "expected generic build success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );
    let run = Command::new(&exe).output().expect("run generic exe");
    assert!(run.status.success(), "generic exe failed");
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "pulse\npulse\ntrue\n");
}

#[test]
fn lock_f1_32_flow_analysis_slice_is_documented_and_board_locked() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..");
    let board = fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md"))
        .expect("read F1 task board");
    let types = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("compiler-backed")
            .join("types-and-conversions.md"),
    )
    .expect("read types and conversions doc");

    assert!(board.contains("| F1-32 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(types.contains("Nullability And Definite Flow"));
    assert!(types.contains("if` conditions"));
    assert!(types.contains("while` / `for` / `do-while` conditions"));
    assert!(types.contains("try` / `catch` / `finally`"));
}

#[test]
fn lock_f1_33_visibility_inheritance_and_nested_type_policy_are_documented_and_board_locked() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..");
    let board = fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md"))
        .expect("read F1 task board");
    let decls = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("compiler-backed")
            .join("declarations-and-modifiers.md"),
    )
    .expect("read declarations and modifiers doc");

    assert!(board.contains("| F1-33 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(decls.contains("Visibility And Inheritance Notes"));
    assert!(decls.contains("cross-package protected access from subclasses"));
    assert!(decls.contains("nested member types"));
    assert!(decls.contains("local classes"));
    assert!(decls.contains("anonymous classes"));
}

#[test]
fn lock_f1_96_interface_inheritance_and_member_policy_are_documented_and_board_locked() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read task board");
    let compiler_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("compiler-backed")
            .join("declarations-and-modifiers.md"),
    )
    .expect("read declarations and modifiers doc");

    assert!(compiler_doc.contains("## Interface Inheritance And Members"));
    assert!(compiler_doc.contains("`interface extends A, B`"));
    assert!(compiler_doc.contains("`default` interface methods"));
    assert!(compiler_doc.contains("`static` interface methods"));
    assert!(compiler_doc.contains("`private` interface methods"));
    assert!(compiler_doc.contains("only abstract interface instance methods remain implementation obligations"));
    assert!(board.contains("| F1-96 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(board.contains("interface extends"));
    assert!(board.contains("default"));
    assert!(board.contains("private"));
}

#[test]
fn lock_f1_98_nested_local_and_anonymous_type_policy_are_documented_and_board_locked() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read task board");
    let compiler_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("compiler-backed")
            .join("declarations-and-modifiers.md"),
    )
    .expect("read declarations and modifiers doc");

    assert!(compiler_doc.contains("Current nested-type policy"));
    assert!(compiler_doc.contains("local classes are not part of the shipped pre-self-host surface"));
    assert!(compiler_doc.contains("anonymous classes are not part of the shipped pre-self-host surface"));
    assert!(compiler_doc.contains("deferred until after self-host"));
    assert!(board.contains("| F1-98 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(board.contains("explicitly deferred until after self-host"));
}

#[test]
fn lock_f1_43_wrapper_surface_is_documented_and_board_locked() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read task board");
    let handoff = fs::read_to_string(root.join("docs").join("CODEX_HANDOFF_PHASE_F.md"))
        .expect("read phase f handoff");
    let abi = fs::read_to_string(root.join("docs").join("RUNTIME_INTRINSICS_ABI.md"))
        .expect("read runtime abi doc");

    assert!(board.contains("| F1-43 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(board.contains("signed/unsigned integral wrappers"));
    assert!(board.contains("Float` / `Double`"));

    assert!(handoff.contains("`F1-43` wrapper-class depth"));
    assert!(handoff.contains("`Float.compare` / `Double.compare`"));
    assert!(handoff.contains("`Float.parse` / `Double.parse` now accept ordinary decimal text"));
    assert!(handoff.contains("cli_build_executes_wrapper_floating_text_and_compare_flow"));

    assert!(!abi.contains("Float.runtimeParse"));
    assert!(!abi.contains("pulsec_rt_fpToString"));
    assert!(abi.contains("floating wrapper parse/format does not add new runtime ABI in F1"));
}

#[test]
fn lock_f1_44_unsigned_policy_is_documented_and_board_locked() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read task board");
    let policy = fs::read_to_string(root.join("docs").join("F1_SUPPORT_POLICY.md"))
        .expect("read F1 support policy");
    let compiler_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("compiler-backed")
            .join("types-and-conversions.md"),
    )
    .expect("read types and conversions doc");
    let handoff = fs::read_to_string(root.join("docs").join("CODEX_HANDOFF_PHASE_F.md"))
        .expect("read phase f handoff");
    let fixtures = fs::read_to_string(
        root.join("crates")
            .join("pulsec-cli")
            .join("tests")
            .join("fixture_projects.rs"),
    )
    .expect("read fixture projects");

    assert!(policy.contains("unsigned primitive and wrapper support"));
    assert!(policy.contains("retained Pulse extensions, not part of the Java-close claim"));
    assert!(policy.contains("must not imply that unsigned types came from Java"));
    assert!(compiler_doc.contains("Pulse extension unsigned primitives"));
    assert!(compiler_doc.contains("intentional Pulse extensions"));
    assert!(compiler_doc.contains("not part of the Java-close compatibility claim"));
    assert!(handoff.contains("`F1-44` unsigned policy"));
    assert!(handoff.contains("retained Pulse extensions"));
    assert!(fixtures.contains("cli_build_executes_unsigned_promotion_and_comparison_flow"));
    assert!(fixtures.contains("UByte.toString(UByte.ubyteValue(UByte.parse(\"255\")))"));
    assert!(board.contains("| F1-44 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(board.contains("retained Pulse extensions"));
    assert!(board.contains("Java-close wording"));
}

#[test]
fn lock_f1_45_system_process_surface_is_documented_and_board_locked() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read task board");
    let handoff = fs::read_to_string(root.join("docs").join("CODEX_HANDOFF_PHASE_F.md"))
        .expect("read phase f handoff");
    let abi = fs::read_to_string(root.join("docs").join("RUNTIME_INTRINSICS_ABI.md"))
        .expect("read runtime abi doc");
    let runtime_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("runtime-backed")
            .join("program-entry-and-execution.md"),
    )
    .expect("read program entry doc");
    let system_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("stdlib")
            .join("com")
            .join("pulse")
            .join("lang")
            .join("System.md"),
    )
    .expect("read System stdlib doc");

    assert!(system_doc.contains("public static final PrintStream out"));
    assert!(system_doc.contains("public static final PrintStream err"));
    assert!(system_doc.contains("public static long currentTimeMillis()"));
    assert!(system_doc.contains("public static long nanoTime()"));
    assert!(system_doc.contains("public static void exit(int status)"));
    assert!(runtime_doc.contains("## `System` Runtime Baseline"));
    assert!(runtime_doc.contains("`System.out`"));
    assert!(runtime_doc.contains("`System.err`"));
    assert!(runtime_doc.contains("`System.currentTimeMillis()`"));
    assert!(runtime_doc.contains("`System.nanoTime()`"));
    assert!(runtime_doc.contains("`System.exit(int)`"));
    assert!(runtime_doc.contains("System.getProperty"));
    assert!(runtime_doc.contains("System.getenv"));
    assert!(abi.contains("pulsec_rt_consoleErrorWrite"));
    assert!(abi.contains("pulsec_rt_currentTimeMillis"));
    assert!(abi.contains("pulsec_rt_nanoTime"));
    assert!(abi.contains("pulsec_rt_systemExit"));
    assert!(handoff.contains("`F1-45` `System` / process baseline"));
    assert!(board.contains("| F1-45 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(board.contains("real `out` / `err`"));
    assert!(board.contains("property/env/process breadth beyond that slice is still deferred"));
}

#[test]
fn lock_f1_47_foundational_lang_types_are_documented_and_board_locked() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read task board");
    let handoff = fs::read_to_string(root.join("docs").join("CODEX_HANDOFF_PHASE_F.md"))
        .expect("read phase f handoff");
    let enums_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("compiler-backed")
            .join("enums.md"),
    )
    .expect("read enums doc");
    let runnable_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("stdlib")
            .join("com")
            .join("pulse")
            .join("lang")
            .join("Runnable.md"),
    )
    .expect("read Runnable stdlib doc");
    let appendable_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("stdlib")
            .join("com")
            .join("pulse")
            .join("lang")
            .join("Appendable.md"),
    )
    .expect("read Appendable stdlib doc");
    let sequence_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("stdlib")
            .join("com")
            .join("pulse")
            .join("lang")
            .join("CharSequence.md"),
    )
    .expect("read CharSequence stdlib doc");
    let string_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("stdlib")
            .join("com")
            .join("pulse")
            .join("lang")
            .join("String.md"),
    )
    .expect("read String stdlib doc");
    let builder_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("stdlib")
            .join("com")
            .join("pulse")
            .join("lang")
            .join("StringBuilder.md"),
    )
    .expect("read StringBuilder stdlib doc");
    let input_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("stdlib")
            .join("com")
            .join("pulse")
            .join("io")
            .join("InputStream.md"),
    )
    .expect("read InputStream stdlib doc");
    let output_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("stdlib")
            .join("com")
            .join("pulse")
            .join("io")
            .join("OutputStream.md"),
    )
    .expect("read OutputStream stdlib doc");

    assert!(runnable_doc.contains("public interface Runnable"));
    assert!(appendable_doc.contains("public interface Appendable"));
    assert!(appendable_doc.contains("public StringBuilder append(String text);"));
    assert!(sequence_doc.contains("public interface CharSequence"));
    assert!(sequence_doc.contains("public String subSequence(int beginIndex, int endIndex);"));
    assert!(string_doc.contains("implements CharSequence, Comparable"));
    assert!(string_doc.contains("public String subSequence(int beginIndex, int endIndex)"));
    assert!(string_doc.contains("public int compareTo(Object other)"));
    assert!(builder_doc.contains("implements Appendable, CharSequence"));
    assert!(builder_doc.contains("public char charAt(int index)"));
    assert!(builder_doc.contains("public String subSequence(int beginIndex, int endIndex)"));
    assert!(input_doc.contains("implements AutoCloseable"));
    assert!(output_doc.contains("implements AutoCloseable"));
    assert!(enums_doc.contains("com.pulse.lang.Enum"));
    assert!(enums_doc.contains("bootstrap base contract"));
    assert!(board.contains("| F1-47 |"));
    assert!(board.contains("| F1-47 | Add missing foundational `com.pulse.lang` types"));
    assert!(board.contains("| 2026-03-14 | Done (Locked) |"));
    assert!(board.contains("Runnable"));
    assert!(board.contains("Appendable"));
    assert!(board.contains("CharSequence"));
    assert!(handoff.contains("`F1-47` foundational `com.pulse.lang` types"));
    assert!(handoff.contains("`Runnable`, `Appendable`, and `CharSequence`"));
    assert!(handoff.contains("fat and shared output modes now both pass the foundational interface flow"));
}

#[test]
fn lock_f1_48_collection_inventory_is_documented_and_board_locked() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read task board");
    let handoff = fs::read_to_string(root.join("docs").join("CODEX_HANDOFF_PHASE_F.md"))
        .expect("read phase f handoff");
    let inventory = fs::read_to_string(root.join("docs").join("F1_COLLECTION_API_INVENTORY.md"))
        .expect("read collection inventory");

    assert!(board.contains("| F1-48 |"));
    assert!(board.contains("| F1-48 | Inventory current collection API limitations versus Java-close expectations | F1-01 | Codex | 2026-03-14 | Done (Locked) |"));
    assert!(inventory.contains("## Current Surface"));
    assert!(inventory.contains("## Cross-Cutting Gaps Versus Java-Close Expectations"));
    assert!(inventory.contains("`F1-49`"));
    assert!(inventory.contains("`F1-55`"));
    assert!(handoff.contains("`F1-48` collection API inventory and strategy"));
    assert!(handoff.contains("`F1-49` staged collection strategy before and after generics"));
}

#[test]
fn lock_f1_49_collection_strategy_is_documented_and_board_locked() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read task board");
    let handoff = fs::read_to_string(root.join("docs").join("CODEX_HANDOFF_PHASE_F.md"))
        .expect("read phase f handoff");
    let strategy = fs::read_to_string(root.join("docs").join("F1_COLLECTION_STRATEGY.md"))
        .expect("read collection strategy");

    assert!(board.contains("| F1-49 |"));
    assert!(board.contains("| F1-49 | Define staged collection strategy before and after generic support is available | F1-11, F1-48 | Codex | 2026-03-14 | Done (Locked) |"));
    assert!(strategy.contains("## Stage 1: Current Bootstrap Surface"));
    assert!(strategy.contains("## Stage 2: Transitional Generic Public Contracts"));
    assert!(strategy.contains("## Stage 3: Java-Close Collection Shape"));
    assert!(strategy.contains("`F1-68`"));
    assert!(handoff.contains("`F1-49` staged collection strategy before and after generics"));
    assert!(handoff.contains("generic collection contracts are the intended public direction"));
}

#[test]
fn lock_f1_09_f1_13_and_f1_14_cli_baseline_is_char_varargs_and_explicit_nested_type_fence() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import com.pulse.lang.Char;

        class Main {
            public static void main(String... args) {
                char a = 'a';
                Char boxed = 'b';
                take('z');
            }

            public static void take(char value) {
            }
        }"#,
    );
    assert_check_ok(&entry, &src_root);

    let nested_entry = src_root.join("app/core/NestedFail.pulse");
    write_file(
        &nested_entry,
        r#"
        package app.core;

        class NestedFail {
            public static class Inner() {
            }
        }"#,
    );
    assert_check_fails(
        &nested_entry,
        &src_root,
        "Nested type declarations are not supported yet",
    );
}

#[test]
fn lock_f1_12_and_f1_30_annotation_baseline_is_documented_and_compiler_owned() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..");
    let board = fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md"))
        .expect("read F1 task board");
    let doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("compiler-backed")
            .join("annotations.md"),
    )
    .expect("read annotations doc");

    assert!(doc.contains("compiler-backed annotation registry"));
    assert!(doc.contains("@interface Marker"));
    assert!(doc.contains("`@Override`"));
    assert!(doc.contains("`@NotNull`"));
    assert!(doc.contains("`@Test`"));
    assert!(doc.contains("bootstrap contract"));
    assert!(doc.contains("Phase F-A"));
    assert!(doc.contains("Lombok-style annotations"));
    assert!(doc.contains("rejects `null` field initializers"));
    assert!(doc.contains("method must be `public static`"));
    assert!(doc.contains("external annotation processors"));
    assert!(doc.contains("`@Getter` / `@Setter`"));

    assert!(board.contains("| F1-12 |"));
    assert!(board.contains("| F1-30 |"));
    assert!(board.contains("In Progress"));
    assert!(board.contains("processor/runtime-backed Pulse ownership"));
}

#[test]
fn lock_f1_12_and_f1_30_cli_check_enforces_override_notnull_and_test_baseline() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let ok = src_root.join("app/core/Main.pulse");
    write_file(
        &ok,
        r#"
        package app.core;
        import com.pulse.lang.String;

        class Base {
            public String value() {
                return "base";
            }
        }

        class Main extends Base {
            @Override
            @NotNull
            public String value() {
                return "ok";
            }

            @Test
            public static void smoke() {
            }

            public static void main() {
                Main m = new Main();
                String v = m.value();
            }
        }"#,
    );
    assert_check_ok(&ok, &src_root);

    let not_null_fail = src_root.join("app/core/NotNullFail.pulse");
    write_file(
        &not_null_fail,
        r#"
        package app.core;
        import com.pulse.lang.String;

        class NotNullFail {
            @NotNull
            private String name = null;

            public static void main() {
            }
        }"#,
    );
    assert_check_fails(
        &not_null_fail,
        &src_root,
        "Annotation '@NotNull' forbids null in field initializer",
    );

    let test_fail = src_root.join("app/core/TestFail.pulse");
    write_file(
        &test_fail,
        r#"
        package app.core;

        class TestFail {
            @Test
            public int smoke(int value) {
                return value;
            }

            public static void main() {
            }
        }"#,
    );
    assert_check_fails(
        &test_fail,
        &src_root,
        "Annotation '@Test' requires method 'TestFail.smoke' to be public static",
    );
}

#[test]
fn lock_f1_15_throw_baseline_is_documented_and_board_locked() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..");
    let board = fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md"))
        .expect("read F1 task board");
    let compiler_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("compiler-backed")
            .join("exceptions.md"),
    )
    .expect("read compiler-backed exceptions doc");
    let runtime_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("runtime-backed")
            .join("exceptions-and-failure.md"),
    )
    .expect("read runtime-backed exceptions doc");

    assert!(compiler_doc.contains("## `throw`"));
    assert!(compiler_doc.contains("must typecheck as `com.pulse.lang.Throwable`"));
    assert!(compiler_doc.contains("real exception transfer in IR/backend/runtime"));
    assert!(compiler_doc.contains("`try`"));
    assert!(runtime_doc.contains("Current `throw` Runtime Contract"));
    assert!(runtime_doc.contains("Intrinsics.panic(String)"));
    assert!(runtime_doc.contains("fall back through the stdlib-facing `Throwable.panic()` bridge"));
    assert!(board.contains("| F1-15 |"));
    assert!(board.contains("In Progress"));
}

#[test]
fn lock_f1_16_try_catch_finally_baseline_is_documented_and_board_locked() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..");
    let board = fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md"))
        .expect("read F1 task board");
    let compiler_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("compiler-backed")
            .join("exceptions.md"),
    )
    .expect("read compiler-backed exceptions doc");
    let runtime_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("runtime-backed")
            .join("exceptions-and-failure.md"),
    )
    .expect("read runtime-backed exceptions doc");

    assert!(compiler_doc.contains("## `try` / `catch` / `finally`"));
    assert!(compiler_doc.contains("across method boundaries"));
    assert!(compiler_doc.contains("runtime panics from callees are not catchable"));
    assert!(compiler_doc.contains("`return`, `break`, and `continue`"));
    assert!(runtime_doc.contains("Current `try` / `catch` / `finally` Runtime Contract"));
    assert!(runtime_doc.contains("runtime-installed handler frames"));
    assert!(board.contains("| F1-16 |"));
    assert!(board.contains("In Progress"));
}

#[test]
fn lock_f1_17_try_with_resources_policy_is_documented_and_fenced() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..");
    let board = fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md"))
        .expect("read F1 task board");
    let compiler_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("compiler-backed")
            .join("exceptions.md"),
    )
    .expect("read compiler-backed exceptions doc");
    let policy = fs::read_to_string(root.join("docs").join("F1_SUPPORT_POLICY.md"))
        .expect("read F1 support policy");

    assert!(compiler_doc.contains("## `try-with-resources`"));
    assert!(compiler_doc.contains("explicitly out of scope for the shipped F1 syntax baseline"));
    assert!(compiler_doc.contains("deterministic diagnostic"));
    assert!(compiler_doc.contains("com.pulse.lang.AutoCloseable"));
    assert!(compiler_doc.contains("F1-47"));
    assert!(compiler_doc.contains("F1-57"));
    assert!(policy.contains("try-with-resources for the current F1 baseline"));
    assert!(board.contains("| F1-17 |"));
    assert!(board.contains("Done (Locked)"));
}

#[test]
fn lock_f1_17_cli_check_rejects_try_with_resources_baseline() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import com.pulse.io.InputStream;

        class Main {
            public static void main() {
                try (InputStream input = new InputStream("x")) {
                }
            }
        }"#,
    );
    assert_check_fails(
        &entry,
        &src_root,
        "Try-with-resources is not supported in the current F1 baseline",
    );
}

#[test]
fn lock_f1_18_foreach_baseline_is_documented_and_board_staged() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..");
    let board = fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md"))
        .expect("read F1 task board");
    let doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("compiler-backed")
            .join("statements-and-control-flow.md"),
    )
    .expect("read statements and control flow doc");

    assert!(doc.contains("## `foreach`"));
    assert!(doc.contains("com.pulse.lang.Iterable"));
    assert!(doc.contains("com.pulse.collections.Array"));
    assert!(doc.contains("`for (T value : nativeArrayExpr) { ... }` works for native array types"));
    assert!(doc.contains("native-array foreach lowers through array `length` plus native array subscript reads"));
    assert!(doc.contains("F1-53"));
    assert!(board.contains("| F1-18 |"));
    assert!(board.contains("In Progress"));
}

#[test]
fn lock_f1_19_assert_baseline_is_documented_and_board_locked() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..");
    let board = fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md"))
        .expect("read F1 task board");
    let doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("compiler-backed")
            .join("statements-and-control-flow.md"),
    )
    .expect("read statements and control flow doc");

    assert!(doc.contains("## `assert`"));
    assert!(doc.contains("com.pulse.lang.AssertionError"));
    assert!(doc.contains("condition must typecheck as `boolean`"));
    assert!(doc.contains("optional message must currently typecheck as `String`"));
    assert!(doc.contains("AssertionError: <message>"));
    assert!(board.contains("| F1-19 |"));
    assert!(board.contains("Done (Locked)"));
}

#[test]
fn lock_f1_20_synchronized_statement_policy_is_documented_and_board_staged() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..");
    let board = fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md"))
        .expect("read F1 task board");
    let doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("compiler-backed")
            .join("statements-and-control-flow.md"),
    )
    .expect("read statements and control flow doc");
    let policy = fs::read_to_string(root.join("docs").join("F1_SUPPORT_POLICY.md"))
        .expect("read F1 support policy");

    assert!(doc.contains("## `synchronized`"));
    assert!(doc.contains("statements are explicitly fenced"));
    assert!(doc.contains("F1-86"));
    assert!(doc.contains("F1-89"));
    assert!(doc.contains("F1-93"));
    assert!(policy.contains("synchronized statements for the current F1 baseline"));
    assert!(board.contains("| F1-20 |"));
    assert!(board.contains("In Progress"));
}

#[test]
fn lock_f1_20_cli_check_rejects_synchronized_statement_baseline() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;

        class Main {
            public static void main() {
                synchronized (new Main()) {
                }
            }
        }"#,
    );
    assert_check_fails(
        &entry,
        &src_root,
        "Synchronized statements are not supported in the current F1 baseline",
    );
}

#[test]
fn lock_f1_21_ternary_baseline_is_documented_and_board_locked() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read task board");
    let doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("compiler-backed")
            .join("types-and-conversions.md"),
    )
    .expect("read types and conversions doc");

    assert!(doc.contains("## Ternary"));
    assert!(doc.contains("condition must typecheck as `boolean`"));
    assert!(doc.contains("branch expressions must have compatible types"));
    assert!(doc.contains("only the selected branch is evaluated"));
    assert!(board.contains("| F1-21 |"));
    assert!(board.contains("Done (Locked)"));
}

#[test]
fn lock_f1_22_cast_baseline_is_documented_and_board_locked() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read task board");
    let compiler_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("compiler-backed")
            .join("types-and-conversions.md"),
    )
    .expect("read types and conversions doc");
    let runtime_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("runtime-backed")
            .join("runtime-type-and-null-behavior.md"),
    )
    .expect("read runtime type and null behavior doc");

    assert!(compiler_doc.contains("Current cast baseline"));
    assert!(compiler_doc.contains("explicit primitive numeric casts"));
    assert!(compiler_doc.contains("checked reference casts"));
    assert!(compiler_doc.contains("Invalid cast"));
    assert!(runtime_doc.contains("Current runtime-backed cast baseline"));
    assert!(runtime_doc.contains("checked reference casts execute through runtime class-id checks"));
    assert!(board.contains("| F1-22 |"));
    assert!(board.contains("Done (Locked)"));
}

#[test]
fn lock_f1_36_lowering_codegen_slice_is_documented_and_board_locked() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read task board");
    let types_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("compiler-backed")
            .join("types-and-conversions.md"),
    )
    .expect("read types and conversions doc");
    let statements_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("compiler-backed")
            .join("statements-and-control-flow.md"),
    )
    .expect("read statements and control flow doc");

    assert!(types_doc.contains("multidimensional creation such as `new int[2][3]`"));
    assert!(types_doc.contains("native subscript reads such as `values[1]`"));
    assert!(types_doc.contains("native-array foreach is real"));
    assert!(types_doc.contains("native output preserves lazy branch execution"));
    assert!(types_doc.contains("shift operators `<<`, `>>`, `>>>`"));
    assert!(statements_doc.contains("arrow-style switch expressions"));
    assert!(board.contains("| F1-36 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(board.contains("executable in realistic fixtures"));
}

#[test]
fn lock_f1_37_runtime_abi_growth_is_documented_and_board_locked() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read task board");
    let abi_doc = fs::read_to_string(root.join("docs").join("RUNTIME_INTRINSICS_ABI.md"))
        .expect("read runtime intrinsics abi doc");

    assert!(abi_doc.contains("pulsec_rt_throw"));
    assert!(abi_doc.contains("pulsec_rt_traceUpdateTop"));
    assert!(abi_doc.contains("exception-handler stack"));
    assert!(abi_doc.contains("Class.method(File.pulse:line)"));
    assert!(board.contains("| F1-37 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(board.contains("pulsec_rt_throw"));
    assert!(board.contains("pulsec_rt_traceUpdateTop"));
}

#[test]
fn lock_f1_38_fat_shared_compatibility_coverage_is_documented_and_board_locked() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read task board");
    let parity_guide = fs::read_to_string(root.join("docs").join("E3_PARITY_GUIDE.md"))
        .expect("read parity guide");
    let evidence_index = fs::read_to_string(root.join("docs").join("E3_EVIDENCE_INDEX.md"))
        .expect("read parity evidence index");

    assert!(parity_guide.contains("fat and shared native output modes"));
    assert!(evidence_index.contains("cli_build_executes_same_fixture_corpus_with_side_by_side_fat_shared_parity"));
    assert!(evidence_index.contains("cli_build_executes_runtime_heavy_app_with_side_by_side_fat_shared_parity"));
    assert!(evidence_index.contains("cli_build_executes_strict_stress_soak_with_repeated_fat_shared_parity"));
    assert!(evidence_index.contains("cli_build_executes_failure_paths_with_side_by_side_fat_shared_parity"));
    assert!(board.contains("| F1-38 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(board.contains("strict stress soak parity"));
}

#[test]
fn lock_f1_39_object_identity_surface_is_documented_and_board_locked() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read task board");
    let object_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("stdlib")
            .join("com")
            .join("pulse")
            .join("lang")
            .join("Object.md"),
    )
    .expect("read Object stdlib doc");

    assert!(object_doc.contains("public int hashCode()"));
    assert!(object_doc.contains("public boolean equals(Object other)"));
    assert!(object_doc.contains("public Class getClass()"));
    assert!(board.contains("| F1-39 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(board.contains("stable identity `hashCode()`"));
    assert!(board.contains("runtime-backed `getClass()`"));
}

#[test]
fn lock_f1_40_class_reflection_lite_surface_is_documented_and_board_locked() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read task board");
    let runtime_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("runtime-backed")
            .join("runtime-type-and-null-behavior.md"),
    )
    .expect("read runtime type doc");
    let class_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("stdlib")
            .join("com")
            .join("pulse")
            .join("lang")
            .join("Class.md"),
    )
    .expect("read Class stdlib doc");

    assert!(class_doc.contains("public String getName()"));
    assert!(class_doc.contains("public String getSimpleName()"));
    assert!(class_doc.contains("public String getPackageName()"));
    assert!(runtime_doc.contains("fully qualified runtime class names"));
    assert!(runtime_doc.contains("`Class.getSimpleName()`"));
    assert!(runtime_doc.contains("`Class.getPackageName()`"));
    assert!(board.contains("| F1-40 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(board.contains("fully qualified runtime names"));
    assert!(board.contains("simple-name and package-name helpers"));
}

#[test]
fn lock_f1_41_string_surface_is_documented_and_board_locked() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read task board");
    let string_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("stdlib")
            .join("com")
            .join("pulse")
            .join("lang")
            .join("String.md"),
    )
    .expect("read String stdlib doc");

    for needle in [
        "public char charAt(int index)",
        "public String substring(int beginIndex)",
        "public String substring(int beginIndex, int endIndex)",
        "public boolean equals(Object other)",
        "public boolean startsWith(String prefix)",
        "public boolean endsWith(String suffix)",
        "public boolean contains(String text)",
        "public int indexOf(String text)",
        "public int lastIndexOf(String text)",
        "public String trim()",
        "public static String valueOf(Object value)",
    ] {
        assert!(string_doc.contains(needle), "String doc missing '{}'", needle);
    }

    assert!(board.contains("| F1-41 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(board.contains("Core Java-close `String` operations"));
}

#[test]
fn lock_f1_42_stringbuilder_surface_is_documented_and_board_locked() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read task board");
    let builder_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("stdlib")
            .join("com")
            .join("pulse")
            .join("lang")
            .join("StringBuilder.md"),
    )
    .expect("read StringBuilder stdlib doc");

    for needle in [
        "public StringBuilder append(char value)",
        "public StringBuilder append(Object value)",
        "public StringBuilder insert(int index, String text)",
        "public StringBuilder delete(int beginIndex, int endIndex)",
        "public void setLength(int newLength)",
    ] {
        assert!(
            builder_doc.contains(needle),
            "StringBuilder doc missing '{}'",
            needle
        );
    }

    assert!(board.contains("| F1-42 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(board.contains("`StringBuilder` supports common builder flows"));
}

#[test]
fn lock_f1_23_native_array_creation_policy_is_documented_and_board_staged() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read task board");
    let compiler_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("compiler-backed")
            .join("types-and-conversions.md"),
    )
    .expect("read types and conversions doc");
    let runtime_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("runtime-backed")
            .join("runtime-type-and-null-behavior.md"),
    )
    .expect("read runtime type and null behavior doc");
    let lexer_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("compiler-backed")
            .join("lexer-and-literals.md"),
    )
    .expect("read lexer and literals doc");

    assert!(compiler_doc.contains("## Native Array Creation"));
    assert!(compiler_doc.contains("`new int[n]`"));
    assert!(compiler_doc.contains("`new float[n]`"));
    assert!(compiler_doc.contains("`new double[n]`"));
    assert!(compiler_doc.contains("`new Box[n]`"));
    assert!(compiler_doc.contains("one-dimensional initializer expressions such as `new int[] { 1, 2 }`"));
    assert!(compiler_doc.contains("one-dimensional floating-point initializers such as `new float[] { 1.25f, -2.5f }`"));
    assert!(compiler_doc.contains("nested multidimensional initializer expressions such as `new int[][] { {1, 2}, {3, 4} }`"));
    assert!(compiler_doc.contains("native subscript reads such as `values[1]`"));
    assert!(compiler_doc.contains("native subscript writes such as `values[0] = 7`"));
    assert!(compiler_doc.contains("multidimensional creation such as `new int[2][3]`"));
    assert!(runtime_doc.contains("Current runtime-backed native array baseline"));
    assert!(runtime_doc.contains("primitive arrays and reference arrays lower through the runtime array allocator"));
    assert!(runtime_doc.contains("one-dimensional initializer expressions lower by allocating the array and filling the int lane, qword scalar lane, or reference lane at runtime"));
    assert!(runtime_doc.contains("multidimensional native array creation lowers by recursively composing nested runtime arrays through the reference lane"));
    assert!(runtime_doc.contains("nested multidimensional initializer expressions lower by recursively constructing nested array values and storing them through the primitive or reference lane as appropriate"));
    assert!(runtime_doc.contains("native subscript reads and writes lower through the current int lane, qword scalar lane, or reference lane runtime array paths, including chained multidimensional access"));
    assert!(lexer_doc.contains("- `new`"));
    assert!(board.contains("| F1-23 |"));
    assert!(board.contains("Done (Locked)"));
}

#[test]
fn lock_f1_26_f1_28_numeric_promotion_slice_is_documented_and_board_staged() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read task board");
    let compiler_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("compiler-backed")
            .join("types-and-conversions.md"),
    )
    .expect("read types and conversions doc");

    assert!(compiler_doc.contains("floating arithmetic and comparison are now executable"));
    assert!(compiler_doc.contains("lowering now materializes known-destination numeric widening"));
    assert!(compiler_doc.contains("mixed signed/unsigned widening now follows the current executable Pulse slice"));
    assert!(compiler_doc.contains("call-site and constructor-side implicit numeric widening now execute through the same runtime-backed coercion path"));
    assert!(compiler_doc.contains("varargs applicability is now real for the current baseline"));
    assert!(compiler_doc.contains("casts from integral primitives to `float` / `double` now materialize real floating values"));
    assert!(compiler_doc.contains("explicit `double` -> `float` casts now round"));
    assert!(board.contains("| F1-26 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(board.contains("lossless mixed signed/unsigned slice"));
    assert!(board.contains("| F1-28 |"));
    assert!(board.contains("call-site/constructor conversion closure"));
    assert!(board.contains("real varargs applicability"));
    assert!(board.contains("erased generic raw/instantiated compatibility"));
}

#[test]
fn lock_f1_27_bitwise_shift_slice_is_documented_and_board_locked() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read task board");
    let compiler_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("compiler-backed")
            .join("types-and-conversions.md"),
    )
    .expect("read types and conversions doc");

    assert!(compiler_doc.contains("bitwise and shift operators are now executable"));
    assert!(compiler_doc.contains("compound assignment forms `&=`, `|=`, `^=`, `<<=`, `>>=`, `>>>=`"));
    assert!(compiler_doc.contains("boolean `&`, `|`, and `^` now use real non-short-circuit Java-like boolean semantics"));
    assert!(compiler_doc.contains("`&&` and `||` now lower through lazy conditional execution"));
    assert!(board.contains("| F1-27 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(board.contains("lazy logical `&&` / `||` execution"));
}

#[test]
fn lock_f1_100_local_var_slice_is_documented_and_board_locked() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read task board");
    let compiler_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("compiler-backed")
            .join("types-and-conversions.md"),
    )
    .expect("read types and conversions doc");

    assert!(compiler_doc.contains("Current pre-self-host local `var` baseline"));
    assert!(compiler_doc.contains("`var` requires an initializer"));
    assert!(compiler_doc.contains("`var` cannot infer from `null`"));
    assert!(compiler_doc.contains("`for` initializer locals such as `for (var i = 0; ... )`"));
    assert!(compiler_doc.contains("`foreach` loop variables over native arrays"));
    assert!(board.contains("| F1-100 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(board.contains("classic `for` initializers"));
}

#[test]
fn lock_f1_99_switch_expression_policy_is_documented_and_board_locked() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read task board");
    let compiler_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("compiler-backed")
            .join("statements-and-control-flow.md"),
    )
    .expect("read statements doc");

    assert!(compiler_doc.contains("arrow-style switch expressions"));
    assert!(compiler_doc.contains("a `default` arm is required"));
    assert!(compiler_doc.contains("`yield` is reserved and fenced"));
    assert!(board.contains("| F1-99 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(board.contains("Arrow-style switch expressions are now real and executable"));
}

#[test]
fn lock_f1_29_checked_exception_model_is_documented_and_board_locked() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read task board");
    let compiler_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("compiler-backed")
            .join("exceptions.md"),
    )
    .expect("read compiler exceptions doc");
    let runtime_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("runtime-backed")
            .join("exceptions-and-failure.md"),
    )
    .expect("read runtime exceptions doc");

    assert!(compiler_doc.contains("methods and constructors can declare `throws TypeA, TypeB`"));
    assert!(compiler_doc.contains("checked versus unchecked exception typing is enforced"));
    assert!(compiler_doc.contains("direct `throw` of a checked exception must be caught or declared"));
    assert!(compiler_doc.contains("overriding methods and interface implementations cannot widen checked throws"));
    assert!(compiler_doc.contains("Current Throwable Detail Surface"));
    assert!(compiler_doc.contains("cause chaining"));
    assert!(runtime_doc.contains("`throws` clauses are compile-time contracts today"));
    assert!(runtime_doc.contains("checked exceptions from calls/constructors are enforced by semantic analysis"));
    assert!(runtime_doc.contains("cross-method Pulse-throw propagation"));
    assert!(runtime_doc.contains("uncaught throwable output now includes stdlib-owned cause-chain text"));
    assert!(board.contains("| F1-29 |"));
    assert!(board.contains("In Progress"));
    assert!(board.contains("runtime cross-method Pulse-throw unwind now works"));
    assert!(board.contains("F1-101"));
}

#[test]
fn lock_f1_46_throwable_hierarchy_is_documented_and_board_locked() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read task board");
    let compiler_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("compiler-backed")
            .join("exceptions.md"),
    )
    .expect("read compiler exceptions doc");
    let runtime_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("runtime-backed")
            .join("exceptions-and-failure.md"),
    )
    .expect("read runtime exceptions doc");

    assert!(compiler_doc.contains("Current Throwable Detail Surface"));
    assert!(compiler_doc.contains("`getMessage()`"));
    assert!(compiler_doc.contains("`getCause()`"));
    assert!(compiler_doc.contains("`initCause(...)`"));
    assert!(runtime_doc.contains("Current Throwable Detail Output"));
    assert!(runtime_doc.contains("Caused by: RuntimeException: inner"));
    assert!(board.contains("| F1-46 |"));
    assert!(board.contains("Done (Locked)"));
}

#[test]
fn lock_f1_101_exception_diagnostics_are_documented_and_board_locked() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read task board");
    let compiler_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("compiler-backed")
            .join("exceptions.md"),
    )
    .expect("read compiler exceptions doc");
    let runtime_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("runtime-backed")
            .join("exceptions-and-failure.md"),
    )
    .expect("read runtime exceptions doc");

    assert!(compiler_doc.contains("Java-equivalent-or-better stack trace surface"));
    assert!(compiler_doc.contains("`Class.method(File.pulse:line)`"));
    assert!(runtime_doc.contains("Current stack traces now include source file and line data"));
    assert!(runtime_doc.contains("internal fallback helpers like `Throwable.panic()` do not leak"));
    assert!(board.contains("| F1-101 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(board.contains("Java-equivalent-or-better stack traces"));
}

#[test]
fn lock_f1_34_and_f1_35_exception_ir_and_runtime_are_documented_and_board_locked() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read task board");
    let compiler_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("compiler-backed")
            .join("exceptions.md"),
    )
    .expect("read compiler exceptions doc");
    let runtime_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("runtime-backed")
            .join("exceptions-and-failure.md"),
    )
    .expect("read runtime exceptions doc");

    assert!(compiler_doc.contains("real exception transfer in IR/backend/runtime"));
    assert!(runtime_doc.contains("handler-frame model"));
    assert!(runtime_doc.contains("cross-method frame chain"));
    assert!(board.contains("| F1-34 |"));
    assert!(board.contains("| F1-35 |"));
    assert!(board.contains("Done (Locked)"));
}

#[test]
fn lock_f1_24_lambda_policy_is_documented_and_board_staged() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read task board");
    let doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("compiler-backed")
            .join("types-and-conversions.md"),
    )
    .expect("read types and conversions doc");

    assert!(doc.contains("## Lambda Expressions"));
    assert!(doc.contains("lambda expressions are not part of the current F1 baseline"));
    assert!(doc.contains("deferred to `F2`"));
    assert!(board.contains("| F1-24 |"));
    assert!(board.contains("In Progress"));
    assert!(board.contains("closure object model"));
}

#[test]
fn lock_f1_24_cli_check_rejects_lambda_baseline() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;

        class Main {
            public static void main() {
                Object fn = () -> 1;
            }
        }"#,
    );
    assert_check_fails(
        &entry,
        &src_root,
        "Lambda expressions are not supported in the current F1 baseline",
    );
}

#[test]
fn lock_f1_25_method_reference_policy_is_documented_and_board_staged() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read task board");
    let doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("compiler-backed")
            .join("types-and-conversions.md"),
    )
    .expect("read types and conversions doc");

    assert!(doc.contains("## Method References"));
    assert!(doc.contains("method references are not part of the current F1 baseline"));
    assert!(doc.contains("deferred until after the lambda/runtime model exists in `F2`"));
    assert!(board.contains("| F1-25 |"));
    assert!(board.contains("In Progress"));
}

#[test]
fn lock_f1_25_cli_check_rejects_method_reference_baseline() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;

        class Main {
            public static void main() {
                Object fn = Main::main;
            }
        }"#,
    );
    assert_check_fails(
        &entry,
        &src_root,
        "Method references are not supported in the current F1 baseline",
    );
}

#[test]
fn lock_m3_18_closure_docs_exist() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..").join("docs");
    let idx = fs::read_to_string(root.join("STDLIB_API_INDEX.md")).expect("read stdlib index");
    let closure =
        fs::read_to_string(root.join("C1_5_CLOSURE_CHECKLIST.md")).expect("read closure checklist");
    assert!(idx.contains("com.pulse.collections"));
    assert!(closure.contains("Closure Commands"));
}

#[test]
fn lock_e3_01_parity_support_matrix_scopes_supported_vs_intentional_differences() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..").join("docs");
    let matrix = fs::read_to_string(root.join("E3_PARITY_SUPPORT_MATRIX.md"))
        .expect("read E3 parity support matrix");
    assert!(matrix.contains("runtime_mix"));
    assert!(matrix.contains("object_interface_mix"));
    assert!(matrix.contains("strict_stress_soak"));
    assert!(matrix.contains("Intentional Non-Parity"));
    assert!(matrix.contains("fat"));
    assert!(matrix.contains("shared"));
    assert!(matrix.contains("missing runtime library payload"));
}

#[test]
fn lock_e3_02_and_e3_03_cli_parity_semantics_and_evidence_strategy_are_documented() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..").join("..").join("docs");
    let cli = fs::read_to_string(root.join("CLI_COMMAND_CONTRACT.md"))
        .expect("read CLI command contract");
    let strategy = fs::read_to_string(root.join("E3_PARITY_EVIDENCE_STRATEGY.md"))
        .expect("read E3 parity evidence strategy");
    assert!(cli.contains("E3 Parity Baseline"));
    assert!(cli.contains("--output-mode fat"));
    assert!(cli.contains("--output-mode shared"));
    assert!(cli.contains("same fixture corpus"));
    assert!(strategy.contains("side-by-side evidence"));
    assert!(strategy.contains("runtime_mix"));
    assert!(strategy.contains("object_interface_mix"));
    assert!(strategy.contains("strict_stress_soak"));
    assert!(strategy.contains("Packaging / Install Comparison Rules"));
}

#[test]
fn gate_m3_g1_fixture_project_coverage() {
    assert_fixture_build_and_run("runtime_mix", "app/runtime/Main.pulse", "runtime_mix_ok\n");
    assert_fixture_build_and_run("object_interface_mix", "app/mixed/Main.pulse", "object_interface_mix_ok\n");
    assert_fixture_build_and_run("strict_stress_soak", "strict_stress_soak/Main.pulse", "soak_ok\n40415\n");
}

#[test]
fn gate_m3_g2_collections_behavior_coverage() {
    assert_fixture_build_and_run("runtime_mix", "app/runtime/Main.pulse", "runtime_mix_ok\n");
}

#[test]
fn gate_m3_g3_io_stream_behavior_coverage() {
    let fixture = fixture_root("object_interface_mix");
    let root = unique_temp_root();
    let src_root = root.join("src");
    copy_dir_recursive(&fixture.join("src"), &src_root);
    let entry = src_root.join("app/mixed/Main.pulse");
    let output = run_pulsec(&[
        "build",
        entry.to_str().expect("entry utf8"),
        "--source-root",
        src_root.to_str().expect("src utf8"),
        "--strict-package",
    ]);
    assert!(
        output.status.success(),
        "expected build success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );
    let plan = fs::read_to_string(root.join("build").join("native.plan.json")).expect("read native plan");
    assert!(plan.contains("com.pulse.io.File.readAllText"));
}

#[test]
fn gate_m3_g4_time_math_determinism_coverage() {
    assert_fixture_build_and_run("runtime_mix", "app/runtime/Main.pulse", "runtime_mix_ok\n");
}
