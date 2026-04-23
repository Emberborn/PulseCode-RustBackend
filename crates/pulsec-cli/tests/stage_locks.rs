mod common;
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
    common::pulsec_command()
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
        import pulse.lang.Integer;
        import pulse.lang.Boolean;
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
        import pulse.lang.Byte;
        import pulse.lang.Short;
        import pulse.lang.Integer;
        import pulse.lang.Long;
        import pulse.lang.Float;
        import pulse.lang.Double;
        import pulse.lang.Char;
        import pulse.lang.Boolean;
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
        import pulse.lang.UByte;
        import pulse.lang.UShort;
        import pulse.lang.UInteger;
        import pulse.lang.ULong;
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
        import pulse.lang.Void;
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
        import pulse.lang.Integer;
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
        import pulse.lang.Integer;
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
        import pulse.lang.Integer;
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
        import pulse.lang.Integer;
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
        import pulse.lang.Integer;
        import pulse.lang.Boolean;
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
        import pulse.lang.Object;
        import pulse.lang.StringBuilder;
        import pulse.lang.Iterable;
        import pulse.lang.Iterator;
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
        import pulse.lang.Integer;
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
    assert_fixture_build_and_run(
        "strict_stress_soak",
        "strict_stress_soak/Main.pulse",
        "soak_ok\n40415\n",
    );
}

#[test]
fn lock_m2_14_freeze_docs_present() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..")
        .join("docs");
    let freeze = fs::read_to_string(root.join("M1_SEMANTICS_FREEZE.md")).expect("read freeze doc");
    let matrix = fs::read_to_string(root.join("NUMERIC_CONVERSION_MATRIX.md"))
        .expect("read conversion matrix");
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
        import pulse.lang.Throwable;
        import pulse.lang.Exception;
        import pulse.lang.RuntimeException;
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
        import pulse.lang.IllegalArgumentException;
        import pulse.lang.IllegalStateException;
        import pulse.lang.NullPointerException;
        import pulse.lang.IndexOutOfBoundsException;
        import pulse.lang.UnsupportedOperationException;
        import pulse.lang.NumberFormatException;
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
        import pulse.collections.Collection;
        import pulse.collections.List;
        import pulse.collections.ArrayList;
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
fn lock_m3_03b_collection_interface_hierarchy_surface() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
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
                List l = new ArrayList();
                Collection c1 = l;
                Set s = new HashSet();
                Collection c2 = s;
                Queue q = new LinkedList();
                Collection c3 = q;
                Deque d = new LinkedList();
                Queue q2 = d;
                Collection c4 = d;
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
        import pulse.lang.Object;
        import pulse.collections.List;
        import pulse.collections.ArrayList;
        class Main {
            public static void main() {
                List l = new ArrayList();
                l.add(1);
                l.add(0, 2);
                Object o = l.get(0);
                int x = l.getInt(0);
                Object oldObj = l.set(0, o);
                boolean has = l.contains(1);
                boolean hasObj = l.contains(o);
                int objIdx = l.indexOf(o);
                int idx = l.indexOf(1);
                int old = l.set(0, 2);
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
        import pulse.lang.Object;
        import pulse.collections.List;
        import pulse.collections.LinkedList;
        class Main {
            public static void main() {
                List l = new LinkedList();
                l.add(1);
                l.add(0, 2);
                Object o = l.get(0);
                int x = l.getInt(0);
                Object oldObj = l.set(0, o);
                boolean has = l.contains(1);
                boolean hasObj = l.contains(o);
                int objIdx = l.indexOf(o);
                int idx = l.indexOf(1);
                int old = l.set(0, 2);
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
        import pulse.lang.Object;
        import pulse.collections.HashSet;
        class Main {
            public static void main() {
                HashSet s = new HashSet();
                Object o = new Main();
                boolean ao = s.add(o);
                s.add("x");
                boolean co = s.contains(o);
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
        import pulse.lang.Object;
        import pulse.collections.Map;
        import pulse.collections.HashMap;
        class Main {
            public static void main() {
                Map m = new HashMap();
                Object key = new Main();
                Object value = new Main();
                Object old = m.put(key, value);
                Object got = m.get(key);
                boolean raw = m.containsKey(key);
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
        import pulse.lang.Object;
        import pulse.collections.Queue;
        import pulse.collections.Deque;
        import pulse.collections.LinkedList;
        class Main {
            public static void main() {
                Queue q = new LinkedList();
                q.offer(1);
                Object qp = q.peek();
                Object qx = q.poll();
                q.offer(1);
                int p = (Integer) q.peek();
                int x = (Integer) q.poll();
                int qs = q.size();
                q.clear();

                Deque d = new LinkedList();
                d.addFirst(new Main());
                d.addFirst(2);
                d.addLast(new Main());
                d.addLast(3);
                Object of = d.peekFirst();
                Object ol = d.peekLast();
                Object rf = d.removeFirst();
                Object rl = d.removeLast();
                d.addFirst(2);
                d.addLast(3);
                int a = (Integer) d.peekFirst();
                int b = (Integer) d.peekLast();
                int y = (Integer) d.removeFirst();
                int z = (Integer) d.removeLast();
                int ds = d.size();
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
        import pulse.math.Math;
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
        import pulse.math.Random;
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
        import pulse.io.Files;
        import pulse.io.Path;
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
        import pulse.io.InputStream;
        import pulse.io.OutputStream;
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
        import pulse.time.Instant;
        import pulse.time.Duration;
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
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
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
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..")
        .join("docs");
    let matrix = fs::read_to_string(root.join("WINDOWS_TOOLCHAIN_MATRIX.md"))
        .expect("read windows toolchain matrix");
    assert!(matrix.contains("Default linker discovery"));
    assert!(matrix.contains("Explicit linker CLI override"));
    assert!(matrix.contains("PULSEC_LINKER"));
}

#[test]
fn lock_e3_14_windows_matrix_covers_fat_shared_build_parity() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..")
        .join("docs");
    let matrix = fs::read_to_string(root.join("WINDOWS_TOOLCHAIN_MATRIX.md"))
        .expect("read windows toolchain matrix");
    assert!(matrix.contains("E3 Fat/Shared Parity Validation Matrix"));
    assert!(matrix.contains("Release native build + launch"));
    assert!(matrix.contains("Debug native build + launch"));
    assert!(matrix.contains("Release distro publication"));
    assert!(matrix.contains("Debug distro publication"));
    assert!(matrix.contains("Shared-only expected additions"));
    assert!(matrix.contains("supported programs in the locked fixture corpus"));
}

#[test]
fn lock_f1_board_explicitly_tracks_scanner_util_concurrency_network_and_defers_desktop_ui() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..")
        .join("docs");
    let board = fs::read_to_string(root.join("F1_TASK_BOARD.md")).expect("read F1 task board");
    let roadmap =
        fs::read_to_string(root.join("STANDALONE_ROADMAP.md")).expect("read standalone roadmap");
    assert!(board.contains("pulse.util"));
    assert!(board.contains("Scanner"));
    assert!(board.contains("Objects"));
    assert!(board.contains("Optional"));
    assert!(board.contains("Lock F1 generics scope"));
    assert!(board
        .contains("The selected F1 generics baseline is now explicit, executable, and documented"));
    assert!(board.contains("collection-wide generic closure"));
    assert!(board.contains("F1-29"));
    assert!(board.contains("F1-35"));
    assert!(board.contains("F1-101"));
    assert!(board.contains("runtime cross-method Pulse-throw unwind now works"));
    assert!(board.contains("pre-self-sustained concurrency baseline"));
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
    assert!(board.contains("deferred until after the self-sustained-hosting transition"));
    assert!(roadmap.contains("pulse.util"));
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
    assert!(roadmap.contains(
        "full reflection/invocation deferred until after the self-sustained-hosting transition"
    ));
    assert!(roadmap.contains("external library/binding ecosystem work remains in Phase F-A"));
    assert!(roadmap.contains("desktop UI families"));
    assert!(roadmap.contains("after the self-sustained-hosting transition"));
}

#[test]
fn lock_f2_language_docs_tree_is_explicit_and_present() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
    let f2 =
        fs::read_to_string(root.join("docs").join("F2_TASK_BOARD.md")).expect("read F2 task board");
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
    assert!(exceptions
        .contains("checked exceptions from calls/constructors are enforced by semantic analysis"));
}

#[test]
fn lock_self_sustained_hosting_direction_and_authorlib_inventory_are_documented() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
    let roadmap = fs::read_to_string(root.join("docs").join("STANDALONE_ROADMAP.md"))
        .expect("read standalone roadmap");
    let handoff = fs::read_to_string(root.join("docs").join("CODEX_HANDOFF_PHASE_F.md"))
        .expect("read handoff");
    let fb =
        fs::read_to_string(root.join("docs").join("FB_TASK_BOARD.md")).expect("read FB task board");
    let authorlib = fs::read_to_string(root.join("docs").join("AUTHORLIB_STRATEGY.md"))
        .expect("read authorlib strategy");

    assert!(roadmap.contains("self-sustained-hosting readiness"));
    assert!(roadmap.contains("## Phase F-B: Self-Sustained Elevation Inventory"));
    assert!(roadmap.contains("## Phase G: Self-Sustained-Hosting Transition"));
    assert!(roadmap.contains("`stdlib` remains the public user-facing library"));
    assert!(roadmap.contains("`authorlib` becomes the privileged Pulse-owned extension library"));
    assert!(handoff
        .contains("self-sustained hosting is the transition mechanism, not the end-state goal"));
    assert!(handoff.contains("`authorlib` is the privileged Pulse-owned extension library"));
    assert!(handoff.contains("a dedicated pre-Phase-G `F-B` inventory pass now exists"));
    assert!(fb.contains("Self-Sustained Elevation Inventory"));
    assert!(fb.contains("compiler/runtime-facing `authorlib`"));
    assert!(fb.contains("compiler/runtime builds can always access it"));
    assert!(authorlib.contains("`stdlib`"));
    assert!(authorlib.contains("`authorlib`"));
    assert!(authorlib.contains("compiler must still be able to resolve `author.*` at all times"));
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

    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
    let script = fs::read_to_string(root.join("scripts").join("generate-stdlib-docs.ps1"))
        .expect("read stdlib docs generator");
    let stdlib_readme = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("stdlib")
            .join("README.md"),
    )
    .expect("read stdlib docs readme");
    let stdlib_root = root.join("stdlib").join("src").join("pulse");
    let docs_root = root
        .join("docs")
        .join("language")
        .join("stdlib")
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
    assert!(stdlib_readme.contains("overwrites the generated `docs/language/stdlib/pulse/**` tree"));
    assert_eq!(
        pulse_files.len(),
        doc_files.len(),
        "expected generated stdlib docs to cover each shipped stdlib pulse file"
    );
    assert!(sample.contains("# pulse.lang.String"));
    assert!(sample.contains("Source: ``stdlib/src/pulse/lang/String.pulse``"));
    assert!(sample.contains("## Members"));
    assert!(sample.contains("public int length()"));
}

#[test]
fn lock_f1_00_baseline_audit_distinguishes_real_partial_and_reserved_features() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
    let audit = fs::read_to_string(root.join("docs").join("F1_BASELINE_AUDIT.md"))
        .expect("read F1 baseline audit");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read F1 task board");

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
    assert!(audit.contains("compile-time instantiated generics with erased runtime are real"));
    assert!(audit.contains("docs/LANGUAGE_GUIDE.md"));
    assert!(audit.contains("docs/LANGUAGE_OVERVIEW.md"));
    assert!(board.contains("| F1-00 |"));
    assert!(board.contains("Done (Locked)"));
}

#[test]
fn lock_f1_01_to_f1_03_gap_policy_and_dependency_docs_are_present_and_truthful() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
    let gap =
        fs::read_to_string(root.join("docs").join("F1_GAP_MATRIX.md")).expect("read F1 gap matrix");
    let policy = fs::read_to_string(root.join("docs").join("F1_SUPPORT_POLICY.md"))
        .expect("read F1 support policy");
    let graph = fs::read_to_string(root.join("docs").join("F1_DEPENDENCY_GRAPH.md"))
        .expect("read F1 dependency graph");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read F1 task board");

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
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read F1 task board");
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
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read F1 task board");
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
    assert!(decls.contains("method-level `synchronized` on concrete class methods"));
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
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read F1 task board");
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
    assert!(board.contains("pulse.lang.Enum"));
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
        import pulse.lang.IO;

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
fn lock_f1_11_and_f1_31_generics_contract_is_documented_as_compile_time_instantiated_runtime_erased(
) {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read F1 task board");
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
    assert!(board.contains("| F1-11 | Lock F1 generics scope and implement the selected baseline for classes/interfaces/methods | F1-02, F1-07 | Codex | 2026-04-10 | Done (Locked) |"));
    assert!(board
        .contains("The selected F1 generics baseline is now explicit, executable, and documented"));
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
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read F1 task board");
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
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read F1 task board");
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
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
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
    assert!(compiler_doc
        .contains("only abstract interface instance methods remain implementation obligations"));
    assert!(board.contains("| F1-96 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(board.contains("interface extends"));
    assert!(board.contains("default"));
    assert!(board.contains("private"));
}

#[test]
fn lock_f1_98_nested_local_and_anonymous_type_policy_are_documented_and_board_locked() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
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
    assert!(
        compiler_doc.contains("local classes are not part of the shipped pre-self-host surface")
    );
    assert!(compiler_doc
        .contains("anonymous classes are not part of the shipped pre-self-host surface"));
    assert!(compiler_doc.contains("deferred until after self-host"));
    assert!(board.contains("| F1-98 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(board.contains("explicitly deferred until after the self-sustained-hosting transition"));
}

#[test]
fn lock_rb_03_target_taxonomy_and_handoff_resume_point_are_documented() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
    let board = fs::read_to_string(root.join("docs").join("REBASE_TAKS_BOARD.md"))
        .expect("read rebase board");
    let handoff = fs::read_to_string(root.join("docs").join("CODEX_HANDOFF_PHASE_F.md"))
        .expect("read phase f handoff");
    let contract = fs::read_to_string(root.join("docs").join("NATIVE_BACKEND_CONTRACT.md"))
        .expect("read backend contract");
    let taxonomy = fs::read_to_string(root.join("docs").join("TARGET_TAXONOMY_AND_NAMING.md"))
        .expect("read target taxonomy doc");
    assert!(taxonomy.contains("`windows-x64`"));
    assert!(taxonomy.contains("`pulseos-x64`"));
    assert!(taxonomy.contains("`linux-x64`"));
    assert!(taxonomy.contains("`macos-arm64`"));
    assert!(taxonomy.contains("`native-x64`"));
    assert!(taxonomy.contains("old single-target public name"));
    assert!(taxonomy.contains("`windows-x64-host-bootstrap`"));
    assert!(taxonomy.contains("`pulseos-x64-first-slice`"));
    assert!(taxonomy.contains("`linux-x64-planned`"));
    assert!(taxonomy.contains("`macos-arm64-planned`"));
    assert!(taxonomy.contains("<os>-<arch>"));

    assert!(board.contains("| RB-03 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(board.contains("Target Taxonomy and Naming Policy"));
    assert!(handoff.contains("Target Taxonomy and Naming Policy"));
    assert!(contract.contains("Canonical Target IDs (`RB-03`)"));
    assert!(contract.contains("`windows-x64`"));
    assert!(contract.contains("`pulseos-x64`"));
    assert!(contract.contains("`linux-x64`"));
    assert!(contract.contains("`macos-arm64`"));
}

#[test]
fn lock_rb_04_cli_target_surface_is_documented() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
    let board = fs::read_to_string(root.join("docs").join("REBASE_TAKS_BOARD.md"))
        .expect("read rebase board");
    let cli_contract = fs::read_to_string(root.join("docs").join("CLI_COMMAND_CONTRACT.md"))
        .expect("read cli command contract");
    let cli_guide =
        fs::read_to_string(root.join("docs").join("D_CLI_UX_GUIDE.md")).expect("read cli ux guide");

    assert!(board.contains("| RB-04 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(cli_contract.contains("Rebase note (`RB-05`)"));
    assert!(cli_contract.contains("windows-x64"));
    assert!(cli_contract.contains("pulseos-x64"));
    assert!(cli_contract.contains("linux-x64"));
    assert!(cli_contract.contains("macos-arm64"));
    assert!(cli_contract.contains("removed from the public CLI surface"));
    assert!(cli_contract.contains("`--target <windows-x64|pulseos-x64|linux-x64|macos-arm64>`"));
    assert!(cli_guide.contains("Rebase note (`RB-05`)"));
    assert!(cli_guide.contains("windows-x64"));
    assert!(cli_guide.contains("pulseos-x64"));
    assert!(cli_guide.contains("linux-x64"));
    assert!(cli_guide.contains("macos-arm64"));
    assert!(cli_guide.contains("removed from the public CLI/manifest surface"));
    assert!(cli_guide.contains("`pulsec build [<entry.pulse>] [--project-root <dir>] [--source-root <dir>] [--profile <debug|release>] [--target <windows-x64|pulseos-x64|linux-x64|macos-arm64>]"));
}

#[test]
fn lock_rb_05_manifest_target_surface_and_handoff_resume_point_are_documented() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
    let board = fs::read_to_string(root.join("docs").join("REBASE_TAKS_BOARD.md"))
        .expect("read rebase board");
    let handoff = fs::read_to_string(root.join("docs").join("CODEX_HANDOFF_PHASE_F.md"))
        .expect("read phase f handoff");
    let contract = fs::read_to_string(root.join("docs").join("NATIVE_BACKEND_CONTRACT.md"))
        .expect("read backend contract");
    let taxonomy = fs::read_to_string(root.join("docs").join("TARGET_TAXONOMY_AND_NAMING.md"))
        .expect("read target taxonomy doc");
    let manifest_schema = fs::read_to_string(root.join("docs").join("PULSEC_MANIFEST_V1.md"))
        .expect("read manifest schema");
    let manifest_examples =
        fs::read_to_string(root.join("docs").join("PULSEC_MANIFEST_EXAMPLES.md"))
            .expect("read manifest examples");

    assert!(board.contains("| RB-05 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(handoff.contains("`RB-08`"));
    assert!(contract.contains(
        "CLI, manifest, and scaffold surfaces now use the canonical public target IDs directly"
    ));
    assert!(contract.contains("`native-x64` is retired from the public target surface"));
    assert!(taxonomy.contains("`native-x64` was the old single-target public name"));
    assert!(taxonomy.contains(
        "`native-x64` is not accepted on current CLI, manifest, or scaffold public surfaces"
    ));
    assert!(taxonomy.contains(
        "`RB-05` has rebased manifest validation, scaffold defaults, and manifest-facing examples"
    ));
    assert!(manifest_schema.contains("Rebase note (`RB-05`)"));
    assert!(manifest_schema.contains(
        "manifest v1 now accepts `windows-x64`, `pulseos-x64`, `linux-x64`, and `macos-arm64`"
    ));
    assert!(
        manifest_schema.contains("`native-x64` has been removed from the public manifest surface")
    );
    assert!(manifest_schema.contains(
        "`target` (string, optional: `\"windows-x64\"`, `\"pulseos-x64\"`, `\"linux-x64\"`, or `\"macos-arm64\"`)"
    ));
    assert!(manifest_examples.contains("Rebase note (`RB-05`)"));
    assert!(manifest_examples
        .contains("the examples below are now rebased onto the canonical target taxonomy"));
    assert!(manifest_examples.contains("target = \"windows-x64\""));
    assert!(manifest_examples.contains("target = \"pulseos-x64\""));
    assert!(manifest_examples.contains("target = \"macos-arm64\""));
}

#[test]
fn lock_rb_06_plan_adapter_metadata_and_handoff_resume_point_are_documented() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
    let board = fs::read_to_string(root.join("docs").join("REBASE_TAKS_BOARD.md"))
        .expect("read rebase board");
    let handoff = fs::read_to_string(root.join("docs").join("CODEX_HANDOFF_PHASE_F.md"))
        .expect("read phase f handoff");
    let contract = fs::read_to_string(root.join("docs").join("NATIVE_BACKEND_CONTRACT.md"))
        .expect("read backend contract");
    let taxonomy = fs::read_to_string(root.join("docs").join("TARGET_TAXONOMY_AND_NAMING.md"))
        .expect("read target taxonomy doc");
    let roadmap = fs::read_to_string(root.join("docs").join("STANDALONE_ROADMAP.md"))
        .expect("read standalone roadmap");

    assert!(board.contains("| RB-06 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(board.contains("`build.config.plan.json` and `native.plan.json` now emit explicit `target_adapter` metadata"));
    assert!(board.contains("| RB-G2 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(handoff.contains("`RB-18`"));
    assert!(handoff.contains("`RB-06`"));
    assert!(contract.contains("Both `build.config.plan.json` and `native.plan.json` now also emit a `target_adapter` block"));
    assert!(contract.contains("requested public target ID and lane metadata"));
    assert!(contract.contains("active emission adapter"));
    assert!(contract.contains("`selected-target-not-yet-implemented-using-windows-host-bootstrap`"));
    assert!(taxonomy.contains(
        "`RB-06` now emits adapter, artifact-family, and runtime-ABI metadata separately"
    ));
    assert!(taxonomy.contains("requested target lane and active emission adapter can differ"));
    assert!(roadmap.contains("the rebase board is now closed through `RB-21`"));
}

#[test]
fn lock_rb_07_backend_layer_split_and_handoff_resume_point_are_documented() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
    let board = fs::read_to_string(root.join("docs").join("REBASE_TAKS_BOARD.md"))
        .expect("read rebase board");
    let handoff = fs::read_to_string(root.join("docs").join("CODEX_HANDOFF_PHASE_F.md"))
        .expect("read phase f handoff");
    let contract = fs::read_to_string(root.join("docs").join("NATIVE_BACKEND_CONTRACT.md"))
        .expect("read backend contract");
    let roadmap = fs::read_to_string(root.join("docs").join("STANDALONE_ROADMAP.md"))
        .expect("read standalone roadmap");
    let architecture = fs::read_to_string(root.join("docs").join("BACKEND_LAYER_ARCHITECTURE.md"))
        .expect("read backend layer architecture");
    let backend_mod = fs::read_to_string(
        root.join("crates")
            .join("pulsec-cli")
            .join("src")
            .join("backend")
            .join("mod.rs"),
    )
    .expect("read backend mod");
    let target_neutral_mod = fs::read_to_string(
        root.join("crates")
            .join("pulsec-cli")
            .join("src")
            .join("backend")
            .join("target_neutral")
            .join("mod.rs"),
    )
    .expect("read target_neutral mod");
    let host_bootstrap_mod = fs::read_to_string(
        root.join("crates")
            .join("pulsec-cli")
            .join("src")
            .join("backend")
            .join("host_bootstrap")
            .join("mod.rs"),
    )
    .expect("read host_bootstrap mod");
    let adapters_mod = fs::read_to_string(
        root.join("crates")
            .join("pulsec-cli")
            .join("src")
            .join("backend")
            .join("adapters")
            .join("mod.rs"),
    )
    .expect("read adapters mod");
    let windows_adapter_mod = fs::read_to_string(
        root.join("crates")
            .join("pulsec-cli")
            .join("src")
            .join("backend")
            .join("adapters")
            .join("windows_x64")
            .join("mod.rs"),
    )
    .expect("read windows adapter mod");

    assert!(board.contains("| RB-07 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(board
        .contains("`backend/target_neutral`, `backend/host_bootstrap`, and `backend/adapters`"));
    assert!(handoff.contains("`RB-18`"));
    assert!(handoff.contains("`RB-07`"));
    assert!(contract.contains("Layer Ownership (`RB-07`)"));
    assert!(contract.contains("`RustHostBootstrapBackend`"));
    assert!(contract.contains("`crates/pulsec-cli/src/backend/adapters/windows_x64/mod.rs`"));
    assert!(roadmap.contains("the rebase board is now closed through `RB-21`"));
    assert!(roadmap.contains("`RustHostBootstrapBackend`"));
    assert!(architecture.contains("target-neutral compiler output"));
    assert!(architecture.contains("Rust-host bootstrap layer"));
    assert!(architecture.contains("target-specific adapters"));
    assert!(architecture.contains("`crates/pulsec-cli/src/backend/target_neutral/mod.rs`"));
    assert!(architecture.contains("`crates/pulsec-cli/src/backend/host_bootstrap/mod.rs`"));
    assert!(architecture.contains("`crates/pulsec-cli/src/backend/adapters/windows_x64/mod.rs`"));
    assert!(backend_mod.contains("mod adapters;"));
    assert!(backend_mod.contains("mod host_bootstrap;"));
    assert!(backend_mod.contains("mod target_neutral;"));
    assert!(backend_mod.contains("pub use self::host_bootstrap::RustHostBootstrapBackend;"));
    assert!(target_neutral_mod
        .contains("RB-07 layer ownership: target-neutral backend planning/output belongs here."));
    assert!(host_bootstrap_mod
        .contains("RB-07 layer ownership: Rust-host bootstrap orchestration belongs here."));
    assert!(adapters_mod.contains(
        "RB-07 layer ownership: target-specific backend adapters live under this module."
    ));
    assert!(windows_adapter_mod.contains(
        "RB-07 layer ownership: the current Windows x64 adapter owns MASM/COFF emission"
    ));
}

#[test]
fn lock_rb_08_adapter_registry_and_handoff_resume_point_are_documented() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
    let board = fs::read_to_string(root.join("docs").join("REBASE_TAKS_BOARD.md"))
        .expect("read rebase board");
    let handoff = fs::read_to_string(root.join("docs").join("CODEX_HANDOFF_PHASE_F.md"))
        .expect("read phase f handoff");
    let contract = fs::read_to_string(root.join("docs").join("NATIVE_BACKEND_CONTRACT.md"))
        .expect("read backend contract");
    let roadmap = fs::read_to_string(root.join("docs").join("STANDALONE_ROADMAP.md"))
        .expect("read standalone roadmap");
    let registry = fs::read_to_string(root.join("docs").join("BACKEND_ADAPTER_REGISTRY.md"))
        .expect("read backend adapter registry");
    let adapters_mod = fs::read_to_string(
        root.join("crates")
            .join("pulsec-cli")
            .join("src")
            .join("backend")
            .join("adapters")
            .join("mod.rs"),
    )
    .expect("read adapters mod");
    let analysis_support = fs::read_to_string(
        root.join("crates")
            .join("pulsec-cli")
            .join("src")
            .join("backend")
            .join("analysis")
            .join("analysis_support.rs"),
    )
    .expect("read analysis_support");
    let plan_rendering = fs::read_to_string(
        root.join("crates")
            .join("pulsec-cli")
            .join("src")
            .join("backend")
            .join("analysis")
            .join("plan_rendering.rs"),
    )
    .expect("read plan_rendering");

    assert!(board.contains("| RB-08 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(board.contains("BACKEND_ADAPTER_REGISTRY.md"));
    assert!(handoff.contains("`RB-18`"));
    assert!(handoff.contains("`RB-08` adapter registry seam"));
    assert!(contract.contains("Adapter Registry (`RB-08`)"));
    assert!(contract.contains("`resolve_host_bootstrap_target_adapter(...)`"));
    assert!(contract.contains("`resolve_active_backend_contract(...)`"));
    assert!(roadmap.contains("the rebase board is now closed through `RB-21`"));
    assert!(roadmap.contains("[Backend Adapter Registry]"));
    assert!(registry.contains("The current explicit seam is:"));
    assert!(registry.contains("`TargetAdapter`"));
    assert!(registry.contains("`resolve_plan_target_adapter_metadata(...)`"));
    assert!(registry.contains("After `RB-08`, new code must not bypass the registry"));
    assert!(registry.contains("`crates/pulsec-cli/src/backend/host_bootstrap/mod.rs`"));
    assert!(adapters_mod.contains("pub(crate) trait TargetAdapter"));
    assert!(adapters_mod.contains("resolve_host_bootstrap_target_adapter("));
    assert!(adapters_mod.contains("resolve_active_backend_contract("));
    assert!(analysis_support
        .contains("use crate::backend::adapters::resolve_host_bootstrap_target_adapter;"));
    assert!(!analysis_support.contains("crate::backend::adapters::windows_x64::{"));
    assert!(plan_rendering.contains("use crate::backend::adapters::{"));
    assert!(plan_rendering.contains("resolve_planned_link_plan"));
    assert!(plan_rendering.contains("resolve_active_backend_contract(target_id)"));
}

#[test]
fn lock_rb_09_windows_x64_adapter_scope_and_handoff_resume_point_are_documented() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
    let board = fs::read_to_string(root.join("docs").join("REBASE_TAKS_BOARD.md"))
        .expect("read rebase board");
    let handoff = fs::read_to_string(root.join("docs").join("CODEX_HANDOFF_PHASE_F.md"))
        .expect("read phase f handoff");
    let contract = fs::read_to_string(root.join("docs").join("NATIVE_BACKEND_CONTRACT.md"))
        .expect("read backend contract");
    let roadmap = fs::read_to_string(root.join("docs").join("STANDALONE_ROADMAP.md"))
        .expect("read standalone roadmap");
    let scope = fs::read_to_string(root.join("docs").join("WINDOWS_X64_ADAPTER_SCOPE.md"))
        .expect("read windows x64 adapter scope");
    let matrix = fs::read_to_string(root.join("docs").join("WINDOWS_TOOLCHAIN_MATRIX.md"))
        .expect("read windows toolchain matrix");
    let cli = fs::read_to_string(root.join("docs").join("CLI_COMMAND_CONTRACT.md"))
        .expect("read cli contract");
    let guide =
        fs::read_to_string(root.join("docs").join("D_CLI_UX_GUIDE.md")).expect("read cli guide");
    let windows_adapter_mod = fs::read_to_string(
        root.join("crates")
            .join("pulsec-cli")
            .join("src")
            .join("backend")
            .join("adapters")
            .join("windows_x64")
            .join("mod.rs"),
    )
    .expect("read windows adapter mod");
    let toolchain_linking = fs::read_to_string(
        root.join("crates")
            .join("pulsec-cli")
            .join("src")
            .join("backend")
            .join("support")
            .join("toolchain_linking.rs"),
    )
    .expect("read toolchain linking");

    assert!(board.contains("| RB-09 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(board.contains("| RB-G3 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(handoff.contains("`RB-18`"));
    assert!(handoff.contains("`RB-09` Windows x64 adapter scope"));
    assert!(contract.contains("Windows x64 Adapter Scope (`RB-09`)"));
    assert!(contract.contains("`--linker`"));
    assert!(contract.contains("`--assembler`"));
    assert!(roadmap.contains("the rebase board is now closed through `RB-21`"));
    assert!(roadmap.contains("[Windows x64 Adapter Scope]"));
    assert!(scope.contains("What The Windows x64 Adapter Owns"));
    assert!(scope.contains("What The Windows x64 Adapter Does Not Own"));
    assert!(scope.contains("`WIN-CLI-02`"));
    assert!(
        scope.contains("Compiler-owned packaging/install generation is removed under `RB-17.1`.")
    );
    assert!(!scope.contains("`--wix`"));
    assert!(matrix.contains("Rebase note (`RB-09`)"));
    assert!(matrix.contains("Retained Windows Adapter Support Baseline"));
    assert!(matrix.contains("adapter support evidence"));
    assert!(cli.contains("Windows adapter note (`RB-09`)"));
    assert!(cli.contains(
        "`--linker` and `--assembler` are retained Windows x64 host/bootstrap adapter overrides"
    ));
    assert!(guide.contains("Windows adapter note (`RB-09`)"));
    assert!(
        guide.contains("current Windows x64 host/bootstrap adapter needs explicit tool overrides")
    );
    assert!(windows_adapter_mod.contains(
        "RB-09 scope: this adapter preserves the current Windows x64 host/bootstrap lane"
    ));
    assert!(toolchain_linking
        .contains("RB-09 scope: these helpers are retained Windows x64 adapter support"));
}

#[test]
fn lock_rb_17_1_compiler_packaging_removal_is_documented_and_handoffed() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
    let board = fs::read_to_string(root.join("docs").join("REBASE_TAKS_BOARD.md"))
        .expect("read rebase board");
    let handoff = fs::read_to_string(root.join("docs").join("CODEX_HANDOFF_PHASE_F.md"))
        .expect("read phase f handoff");
    let cli = fs::read_to_string(root.join("docs").join("CLI_COMMAND_CONTRACT.md"))
        .expect("read cli contract");
    let guide =
        fs::read_to_string(root.join("docs").join("D_CLI_UX_GUIDE.md")).expect("read cli ux guide");
    let manifest = fs::read_to_string(root.join("docs").join("PULSEC_MANIFEST_V1.md"))
        .expect("read manifest v1 doc");
    let examples = fs::read_to_string(root.join("docs").join("PULSEC_MANIFEST_EXAMPLES.md"))
        .expect("read manifest examples doc");
    let removal = fs::read_to_string(root.join("docs").join("COMPILER_PACKAGING_REMOVAL.md"))
        .expect("read packaging removal doc");
    let scope = fs::read_to_string(root.join("docs").join("WINDOWS_X64_ADAPTER_SCOPE.md"))
        .expect("read windows x64 adapter scope");
    let matrix = fs::read_to_string(root.join("docs").join("WINDOWS_TOOLCHAIN_MATRIX.md"))
        .expect("read windows toolchain matrix");

    assert!(board.contains("| RB-17.1 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(board.contains("COMPILER_PACKAGING_REMOVAL.md"));
    assert!(handoff.contains("`RB-17.1`"));
    assert!(handoff.contains("[Compiler Packaging Removal]"));
    assert!(cli.contains("Packaging removal note (`RB-17.1`)"));
    assert!(cli.contains("`pulsec package` is not part of the public CLI anymore"));
    assert!(guide.contains("Packaging removal note (`RB-17.1`)"));
    assert!(guide.contains("compiler-owned packaging/install generation has been removed"));
    assert!(manifest.contains("not part of manifest v1"));
    assert!(!manifest.contains("- `packaging_mode` (optional"));
    assert!(!manifest.contains("- `wix` (string, optional)"));
    assert!(!manifest.contains("- `signtool` (string, optional)"));
    assert!(!manifest.contains("- `[package.metadata]`"));
    assert!(examples.contains("Packaging removal note (`RB-17.1`)"));
    assert!(!examples.contains("| Packaging-ready app |"));
    assert!(removal.contains("`pulsec package`"));
    assert!(removal.contains("[build].packaging_mode"));
    assert!(removal.contains("downstream tools own installers/packages"));
    assert!(
        scope.contains("Compiler-owned packaging/install generation is removed under `RB-17.1`.")
    );
    assert!(matrix.contains("Rebase note (`RB-17.1`)"));
    assert!(matrix.contains("compiler-owned packaging/install generation is removed"));
}

#[test]
fn lock_rb_10_target_neutral_planning_boundary_and_handoff_resume_point_are_documented() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
    let board = fs::read_to_string(root.join("docs").join("REBASE_TAKS_BOARD.md"))
        .expect("read rebase board");
    let handoff = fs::read_to_string(root.join("docs").join("CODEX_HANDOFF_PHASE_F.md"))
        .expect("read phase f handoff");
    let contract = fs::read_to_string(root.join("docs").join("NATIVE_BACKEND_CONTRACT.md"))
        .expect("read backend contract");
    let roadmap = fs::read_to_string(root.join("docs").join("STANDALONE_ROADMAP.md"))
        .expect("read standalone roadmap");
    let boundary = fs::read_to_string(
        root.join("docs")
            .join("TARGET_NEUTRAL_PLANNING_BOUNDARY.md"),
    )
    .expect("read target-neutral planning boundary");
    let adapters_mod = fs::read_to_string(
        root.join("crates")
            .join("pulsec-cli")
            .join("src")
            .join("backend")
            .join("adapters")
            .join("mod.rs"),
    )
    .expect("read adapters mod");
    let plan_rendering = fs::read_to_string(
        root.join("crates")
            .join("pulsec-cli")
            .join("src")
            .join("backend")
            .join("analysis")
            .join("plan_rendering.rs"),
    )
    .expect("read plan_rendering");
    let policy_support = fs::read_to_string(
        root.join("crates")
            .join("pulsec-cli")
            .join("src")
            .join("backend")
            .join("support")
            .join("policy_support.rs"),
    )
    .expect("read policy_support");
    let windows_adapter_mod = fs::read_to_string(
        root.join("crates")
            .join("pulsec-cli")
            .join("src")
            .join("backend")
            .join("adapters")
            .join("windows_x64")
            .join("mod.rs"),
    )
    .expect("read windows adapter mod");

    assert!(board.contains("| RB-10 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(board.contains("TARGET_NEUTRAL_PLANNING_BOUNDARY.md"));
    assert!(handoff.contains("`RB-18`"));
    assert!(handoff.contains("`RB-10` target-neutral planning boundary"));
    assert!(contract.contains("Target-Neutral Planning Boundary (`RB-10`)"));
    assert!(roadmap.contains("the rebase board is now closed through `RB-21`"));
    assert!(roadmap.contains("[Target-Neutral Planning Boundary]"));
    assert!(boundary.contains("`WIN-PLAN-01`"));
    assert!(boundary.contains("`WIN-PLAN-04`"));
    assert!(boundary.contains(
        "target-neutral planning code must not introduce new hard-coded target-specific link/system input assumptions"
    ));
    assert!(boundary.contains("`kernel32.lib`"));
    assert!(adapters_mod.contains("fn planned_link_plan(&self, ir: &IrProgram) -> NativeLinkPlan;"));
    assert!(adapters_mod.contains("resolve_planned_link_plan("));
    assert!(plan_rendering.contains("resolve_planned_link_plan(target_id, ir)"));
    assert!(!plan_rendering.contains("kernel32.lib"));
    assert!(policy_support.contains("fn windows_x64_backend_contract() -> BackendContract"));
    assert!(!policy_support.contains("fn default_backend_contract() -> BackendContract"));
    assert!(windows_adapter_mod
        .contains("fn planned_link_plan(&self, ir: &IrProgram) -> NativeLinkPlan"));
    assert!(windows_adapter_mod.contains("system_inputs: vec![PathBuf::from(\"kernel32.lib\")]"));
}

#[test]
fn lock_rb_11_runtime_partition_and_handoff_resume_point_are_documented() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
    let board = fs::read_to_string(root.join("docs").join("REBASE_TAKS_BOARD.md"))
        .expect("read rebase board");
    let handoff = fs::read_to_string(root.join("docs").join("CODEX_HANDOFF_PHASE_F.md"))
        .expect("read phase f handoff");
    let contract = fs::read_to_string(root.join("docs").join("NATIVE_BACKEND_CONTRACT.md"))
        .expect("read backend contract");
    let roadmap = fs::read_to_string(root.join("docs").join("STANDALONE_ROADMAP.md"))
        .expect("read standalone roadmap");
    let partition = fs::read_to_string(root.join("docs").join("RUNTIME_INTRINSICS_PARTITION.md"))
        .expect("read runtime intrinsics partition doc");
    let abi = fs::read_to_string(root.join("docs").join("RUNTIME_INTRINSICS_ABI.md"))
        .expect("read runtime intrinsics abi doc");
    let e2 = fs::read_to_string(root.join("docs").join("E2_RUNTIME_BOUNDARY_GUIDE.md"))
        .expect("read e2 runtime boundary guide");
    let windows_adapter_mod = fs::read_to_string(
        root.join("crates")
            .join("pulsec-cli")
            .join("src")
            .join("backend")
            .join("adapters")
            .join("windows_x64")
            .join("mod.rs"),
    )
    .expect("read windows adapter mod");

    assert!(board.contains("| RB-11 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(board.contains("RUNTIME_INTRINSICS_PARTITION.md"));
    assert!(handoff.contains("`RB-18`"));
    assert!(handoff.contains("`RB-11` runtime/intrinsics partition"));
    assert!(contract.contains("Runtime Intrinsics Partition (`RB-11`)"));
    assert!(roadmap.contains("the rebase board is now closed through `RB-21`"));
    assert!(roadmap.contains("[Runtime Intrinsics Partition]"));
    assert!(partition.contains("`WIN-RT-01`"));
    assert!(partition.contains("`WIN-RT-02`"));
    assert!(partition.contains("`WIN-RT-03`"));
    assert!(partition.contains("`WIN-RT-05`"));
    assert!(partition.contains("portable language/runtime contract"));
    assert!(partition.contains("adapter-specific service glue"));
    assert!(partition.contains("windows_x64_runtime_service_imports()"));
    assert!(abi.contains("## RB-11 Runtime Partition Note"));
    assert!(abi.contains("## Portable Contract vs Adapter-Specific Service Glue"));
    assert!(abi.contains("## Current Windows x64 Host/Bootstrap Adapter Notes"));
    assert!(e2.contains("Rebase Note (`RB-11`)"));
    assert!(e2.contains("current Windows x64 shared-mode evidence"));
    assert!(windows_adapter_mod.contains("WINDOWS_X64_RUNTIME_SERVICE_IMPORTS"));
    assert!(windows_adapter_mod.contains("fn windows_x64_runtime_service_imports()"));
}

#[test]
fn lock_rb_12_host_bootstrap_runtime_contract_and_handoff_resume_point_are_documented() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
    let board = fs::read_to_string(root.join("docs").join("REBASE_TAKS_BOARD.md"))
        .expect("read rebase board");
    let handoff = fs::read_to_string(root.join("docs").join("CODEX_HANDOFF_PHASE_F.md"))
        .expect("read phase f handoff");
    let contract = fs::read_to_string(root.join("docs").join("NATIVE_BACKEND_CONTRACT.md"))
        .expect("read backend contract");
    let roadmap = fs::read_to_string(root.join("docs").join("STANDALONE_ROADMAP.md"))
        .expect("read standalone roadmap");
    let cli = fs::read_to_string(root.join("docs").join("CLI_COMMAND_CONTRACT.md"))
        .expect("read cli command contract");
    let architecture = fs::read_to_string(root.join("docs").join("BACKEND_LAYER_ARCHITECTURE.md"))
        .expect("read backend layer architecture");
    let bootstrap =
        fs::read_to_string(root.join("docs").join("HOST_BOOTSTRAP_RUNTIME_CONTRACT.md"))
            .expect("read host bootstrap runtime contract");
    let host_bootstrap_mod = fs::read_to_string(
        root.join("crates")
            .join("pulsec-cli")
            .join("src")
            .join("backend")
            .join("host_bootstrap")
            .join("mod.rs"),
    )
    .expect("read host_bootstrap mod");
    let runtime_contract = fs::read_to_string(
        root.join("crates")
            .join("pulsec-cli")
            .join("src")
            .join("backend")
            .join("host_bootstrap")
            .join("runtime_contract.rs"),
    )
    .expect("read runtime_contract");
    let plan_rendering = fs::read_to_string(
        root.join("crates")
            .join("pulsec-cli")
            .join("src")
            .join("backend")
            .join("analysis")
            .join("plan_rendering.rs"),
    )
    .expect("read plan_rendering");

    assert!(board.contains("| RB-12 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(board.contains("HOST_BOOTSTRAP_RUNTIME_CONTRACT.md"));
    assert!(handoff.contains("`RB-18`"));
    assert!(handoff.contains("`RB-12` host bootstrap runtime contract"));
    assert!(contract.contains("Host Bootstrap Runtime Contract (`RB-12`)"));
    assert!(roadmap.contains("the rebase board is now closed through `RB-21`"));
    assert!(roadmap.contains("[Host Bootstrap Runtime Contract]"));
    assert!(cli.contains("host_bootstrap_runtime"));
    assert!(cli.contains("schema `pulsec.host_bootstrap.runtime.v1`"));
    assert!(architecture.contains("minimum retained bootstrap runtime contract"));
    assert!(bootstrap.contains("Schema id:"));
    assert!(bootstrap.contains("`pulsec.host_bootstrap.runtime.v1`"));
    assert!(bootstrap.contains("## Minimum Retained Bootstrap Surface"));
    assert!(bootstrap.contains("## Explicit Exclusions"));
    assert!(bootstrap.contains("## Ownership Rule"));
    assert!(host_bootstrap_mod.contains("mod runtime_contract;"));
    assert!(host_bootstrap_mod.contains("resolve_host_bootstrap_runtime_contract"));
    assert!(runtime_contract.contains("HostBootstrapRuntimeContract"));
    assert!(runtime_contract.contains("minimum-retained-bootstrap-surface"));
    assert!(runtime_contract.contains("pulsec.host_bootstrap.runtime.v1"));
    assert!(runtime_contract.contains("portable_stdlib_bridge_symbols"));
    assert!(plan_rendering.contains("render_host_bootstrap_runtime_contract(target_id)"));
    assert!(plan_rendering.contains("  \\\"host_bootstrap_runtime\\\": {},\\n"));
    assert!(plan_rendering.contains("\\\"runtime_service_imports\\\": [{}],\\n"));
}

#[test]
fn lock_rb_13_pulseos_runtime_service_contract_and_handoff_resume_point_are_documented() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
    let board = fs::read_to_string(root.join("docs").join("REBASE_TAKS_BOARD.md"))
        .expect("read rebase board");
    let handoff = fs::read_to_string(root.join("docs").join("CODEX_HANDOFF_PHASE_F.md"))
        .expect("read phase f handoff");
    let contract = fs::read_to_string(root.join("docs").join("NATIVE_BACKEND_CONTRACT.md"))
        .expect("read backend contract");
    let roadmap = fs::read_to_string(root.join("docs").join("STANDALONE_ROADMAP.md"))
        .expect("read standalone roadmap");
    let cli = fs::read_to_string(root.join("docs").join("CLI_COMMAND_CONTRACT.md"))
        .expect("read cli command contract");
    let partition = fs::read_to_string(root.join("docs").join("RUNTIME_INTRINSICS_PARTITION.md"))
        .expect("read runtime partition");
    let pulseos = fs::read_to_string(
        root.join("docs")
            .join("PULSEOS_RUNTIME_SERVICE_ABI_SLICE.md"),
    )
    .expect("read pulseos runtime service abi slice");
    let adapters_mod = fs::read_to_string(
        root.join("crates")
            .join("pulsec-cli")
            .join("src")
            .join("backend")
            .join("adapters")
            .join("mod.rs"),
    )
    .expect("read adapters mod");
    let pulseos_mod = fs::read_to_string(
        root.join("crates")
            .join("pulsec-cli")
            .join("src")
            .join("backend")
            .join("adapters")
            .join("pulseos_x64")
            .join("mod.rs"),
    )
    .expect("read pulseos adapter contract mod");
    let plan_rendering = fs::read_to_string(
        root.join("crates")
            .join("pulsec-cli")
            .join("src")
            .join("backend")
            .join("analysis")
            .join("plan_rendering.rs"),
    )
    .expect("read plan_rendering");

    assert!(board.contains("| RB-13 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(board.contains("PULSEOS_RUNTIME_SERVICE_ABI_SLICE.md"));
    assert!(board.contains("| RB-G4 | Runtime/Intrinsics ownership and PulseOS first-slice service contract are explicit | Done (Locked) |"));
    assert!(handoff.contains("`RB-18`"));
    assert!(handoff.contains("`RB-13` PulseOS runtime-service slice"));
    assert!(contract.contains("PulseOS Runtime Service ABI Slice (`RB-13`)"));
    assert!(roadmap.contains("the rebase board is now closed through `RB-21`"));
    assert!(roadmap.contains("[PulseOS Runtime Service ABI Slice]"));
    assert!(cli.contains("requested_target_runtime_service_abi"));
    assert!(cli.contains("pulsec.pulseos.runtime_service.v1"));
    assert!(partition.contains("PULSEOS_RUNTIME_SERVICE_ABI_SLICE.md"));
    assert!(pulseos.contains("Schema id:"));
    assert!(pulseos.contains("`pulsec.pulseos.runtime_service.v1`"));
    assert!(pulseos.contains("## Meeting Milestone Surface"));
    assert!(pulseos.contains("## ABI Ground Rules"));
    assert!(pulseos.contains("## Plan Surface"));
    assert!(adapters_mod.contains("pub(crate) mod pulseos_x64;"));
    assert!(adapters_mod.contains("resolve_requested_target_runtime_service_contract("));
    assert!(pulseos_mod.contains("PulseOsRuntimeServiceContract"));
    assert!(pulseos_mod.contains("pulsec.pulseos.runtime_service.v1"));
    assert!(pulseos_mod.contains("contract-defined-not-yet-implemented"));
    assert!(plan_rendering.contains("render_requested_target_runtime_service_contract(target_id)"));
    assert!(plan_rendering.contains("  \\\"requested_target_runtime_service_abi\\\": {},\\n"));
    assert!(plan_rendering
        .contains("\\\"payload_shape\\\": \\\"service-specific-binary-layout-deferred\\\"\\n"));
}

#[test]
fn lock_rb_14_runtime_ownership_rebase_and_handoff_resume_point_are_documented() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
    let board = fs::read_to_string(root.join("docs").join("REBASE_TAKS_BOARD.md"))
        .expect("read rebase board");
    let handoff = fs::read_to_string(root.join("docs").join("CODEX_HANDOFF_PHASE_F.md"))
        .expect("read phase f handoff");
    let contract = fs::read_to_string(root.join("docs").join("NATIVE_BACKEND_CONTRACT.md"))
        .expect("read backend contract");
    let roadmap = fs::read_to_string(root.join("docs").join("STANDALONE_ROADMAP.md"))
        .expect("read standalone roadmap");
    let cli = fs::read_to_string(root.join("docs").join("CLI_COMMAND_CONTRACT.md"))
        .expect("read cli command contract");
    let architecture = fs::read_to_string(root.join("docs").join("BACKEND_LAYER_ARCHITECTURE.md"))
        .expect("read backend layer architecture");
    let bootstrap =
        fs::read_to_string(root.join("docs").join("HOST_BOOTSTRAP_RUNTIME_CONTRACT.md"))
            .expect("read host bootstrap runtime contract");
    let pulseos = fs::read_to_string(
        root.join("docs")
            .join("PULSEOS_RUNTIME_SERVICE_ABI_SLICE.md"),
    )
    .expect("read pulseos runtime service slice");
    let ownership = fs::read_to_string(root.join("docs").join("RUNTIME_OWNERSHIP_REBASE.md"))
        .expect("read runtime ownership rebase");
    let host_bootstrap_mod = fs::read_to_string(
        root.join("crates")
            .join("pulsec-cli")
            .join("src")
            .join("backend")
            .join("host_bootstrap")
            .join("mod.rs"),
    )
    .expect("read host_bootstrap mod");
    let ownership_model = fs::read_to_string(
        root.join("crates")
            .join("pulsec-cli")
            .join("src")
            .join("backend")
            .join("host_bootstrap")
            .join("ownership_model.rs"),
    )
    .expect("read ownership model");
    let plan_rendering = fs::read_to_string(
        root.join("crates")
            .join("pulsec-cli")
            .join("src")
            .join("backend")
            .join("analysis")
            .join("plan_rendering.rs"),
    )
    .expect("read plan_rendering");

    assert!(board.contains("| RB-14 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(board.contains("RUNTIME_OWNERSHIP_REBASE.md"));
    assert!(handoff.contains("`RB-18`"));
    assert!(handoff.contains("`RB-14` runtime ownership rebase"));
    assert!(contract.contains("Runtime Ownership Rebase (`RB-14`)"));
    assert!(roadmap.contains("the rebase board is now closed through `RB-21`"));
    assert!(roadmap.contains("[Runtime Ownership Rebase]"));
    assert!(cli.contains("runtime_ownership_model"));
    assert!(cli.contains("pulsec.runtime.ownership.rebase.v1"));
    assert!(architecture.contains("RUNTIME_OWNERSHIP_REBASE.md"));
    assert!(bootstrap.contains("RUNTIME_OWNERSHIP_REBASE.md"));
    assert!(pulseos.contains("RUNTIME_OWNERSHIP_REBASE.md"));
    assert!(ownership.contains("Schema id:"));
    assert!(ownership.contains("`pulsec.runtime.ownership.rebase.v1`"));
    assert!(ownership.contains("## Three-Way Ownership Split"));
    assert!(ownership.contains("## Locked Anti-Collapse Rules"));
    assert!(ownership.contains("## Plan Surface"));
    assert!(ownership.contains("`pulse.lang.*`"));
    assert!(ownership.contains("`startup-entry-and-exit-boundary`"));
    assert!(host_bootstrap_mod.contains("mod ownership_model;"));
    assert!(host_bootstrap_mod.contains("resolve_runtime_ownership_model"));
    assert!(ownership_model.contains("RuntimeOwnershipModel"));
    assert!(ownership_model.contains("pulsec.runtime.ownership.rebase.v1"));
    assert!(ownership_model.contains("rb-14-explicit-three-way-split"));
    assert!(ownership_model
        .contains("windows-service-imports-must-not-become-portable-runtime-or-pulseos-defaults"));
    assert!(plan_rendering.contains("render_runtime_ownership_model(target_id)"));
    assert!(plan_rendering.contains("  \\\"runtime_ownership_model\\\": {},\\n"));
    assert!(
        plan_rendering.contains("\\\"requested_target_service_contract_status\\\": \\\"{}\\\",\\n")
    );
}

#[test]
fn lock_rb_15_target_artifact_contract_split_and_handoff_resume_point_are_documented() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
    let board = fs::read_to_string(root.join("docs").join("REBASE_TAKS_BOARD.md"))
        .expect("read rebase board");
    let handoff = fs::read_to_string(root.join("docs").join("CODEX_HANDOFF_PHASE_F.md"))
        .expect("read phase f handoff");
    let contract = fs::read_to_string(root.join("docs").join("NATIVE_BACKEND_CONTRACT.md"))
        .expect("read backend contract");
    let roadmap = fs::read_to_string(root.join("docs").join("STANDALONE_ROADMAP.md"))
        .expect("read standalone roadmap");
    let cli = fs::read_to_string(root.join("docs").join("CLI_COMMAND_CONTRACT.md"))
        .expect("read cli command contract");
    let windows_scope = fs::read_to_string(root.join("docs").join("WINDOWS_X64_ADAPTER_SCOPE.md"))
        .expect("read windows scope");
    let ownership = fs::read_to_string(root.join("docs").join("RUNTIME_OWNERSHIP_REBASE.md"))
        .expect("read runtime ownership rebase");
    let artifact = fs::read_to_string(root.join("docs").join("TARGET_ARTIFACT_CONTRACT_SPLIT.md"))
        .expect("read target artifact contract split");
    let adapters_mod = fs::read_to_string(
        root.join("crates")
            .join("pulsec-cli")
            .join("src")
            .join("backend")
            .join("adapters")
            .join("mod.rs"),
    )
    .expect("read adapters mod");
    let windows_mod = fs::read_to_string(
        root.join("crates")
            .join("pulsec-cli")
            .join("src")
            .join("backend")
            .join("adapters")
            .join("windows_x64")
            .join("mod.rs"),
    )
    .expect("read windows artifact mod");
    let pulseos_mod = fs::read_to_string(
        root.join("crates")
            .join("pulsec-cli")
            .join("src")
            .join("backend")
            .join("adapters")
            .join("pulseos_x64")
            .join("mod.rs"),
    )
    .expect("read pulseos artifact mod");
    let plan_rendering = fs::read_to_string(
        root.join("crates")
            .join("pulsec-cli")
            .join("src")
            .join("backend")
            .join("analysis")
            .join("plan_rendering.rs"),
    )
    .expect("read plan_rendering");

    assert!(board.contains("| RB-15 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(board.contains("TARGET_ARTIFACT_CONTRACT_SPLIT.md"));
    assert!(handoff.contains("`RB-18`"));
    assert!(handoff.contains("`RB-15` target artifact contract split"));
    assert!(contract.contains("Target Artifact Contract Split (`RB-15`)"));
    assert!(roadmap.contains("the rebase board is now closed through `RB-21`"));
    assert!(roadmap.contains("[Target Artifact Contract Split]"));
    assert!(cli.contains("artifact_contracts"));
    assert!(cli.contains("pulsec.windows_x64.artifact_contract.v1"));
    assert!(cli.contains("pulsec.pulseos.artifact_contract.v1"));
    assert!(windows_scope.contains("TARGET_ARTIFACT_CONTRACT_SPLIT.md"));
    assert!(ownership.contains("TARGET_ARTIFACT_CONTRACT_SPLIT.md"));
    assert!(artifact.contains("Schema id:"));
    assert!(artifact.contains("`pulsec.windows_x64.artifact_contract.v1`"));
    assert!(artifact.contains("`pulsec.pulseos.artifact_contract.v1`"));
    assert!(artifact.contains("## Windows x64 Adapter Artifact Contract"));
    assert!(artifact.contains("## PulseOS Requested-Target Artifact Contract"));
    assert!(artifact.contains("## What `artifact_contracts` Means In The Plan"));
    assert!(artifact.contains("PULSEOS_STARTUP_LOADER_PUBLICATION_CONTRACT.md"));
    assert!(artifact.contains("`bin/<entry> + bin/launch.json`"));
    assert!(adapters_mod.contains("TargetArtifactContract"));
    assert!(adapters_mod.contains("resolve_active_adapter_artifact_contract("));
    assert!(adapters_mod.contains("resolve_requested_target_artifact_contract("));
    assert!(windows_mod.contains("windows_x64_artifact_contract("));
    assert!(windows_mod.contains("pulsec.windows_x64.artifact_contract.v1"));
    assert!(pulseos_mod.contains("pulseos_x64_artifact_contract("));
    assert!(pulseos_mod.contains("pulsec.pulseos.artifact_contract.v1"));
    assert!(pulseos_mod.contains("first-slice-loader-layout-published"));
    assert!(pulseos_mod.contains("shared-request-collapses-to-first-slice-single-image-layout"));
    assert!(plan_rendering.contains("render_artifact_contracts(target_id, output_mode)"));
    assert!(plan_rendering.contains("  \\\"artifact_contracts\\\": {},\\n"));
    assert!(plan_rendering.contains("\\\"active_adapter\\\": {},\\n"));
    assert!(plan_rendering.contains("\\\"requested_target\\\": {}\\n"));
}

#[test]
fn lock_rb_16_pulseos_startup_loader_publication_contract_and_handoff_resume_point_are_documented()
{
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
    let board = fs::read_to_string(root.join("docs").join("REBASE_TAKS_BOARD.md"))
        .expect("read rebase board");
    let handoff = fs::read_to_string(root.join("docs").join("CODEX_HANDOFF_PHASE_F.md"))
        .expect("read phase f handoff");
    let contract = fs::read_to_string(root.join("docs").join("NATIVE_BACKEND_CONTRACT.md"))
        .expect("read backend contract");
    let roadmap = fs::read_to_string(root.join("docs").join("STANDALONE_ROADMAP.md"))
        .expect("read standalone roadmap");
    let cli = fs::read_to_string(root.join("docs").join("CLI_COMMAND_CONTRACT.md"))
        .expect("read cli command contract");
    let runtime_service = fs::read_to_string(
        root.join("docs")
            .join("PULSEOS_RUNTIME_SERVICE_ABI_SLICE.md"),
    )
    .expect("read pulseos runtime service abi slice");
    let artifact = fs::read_to_string(root.join("docs").join("TARGET_ARTIFACT_CONTRACT_SPLIT.md"))
        .expect("read target artifact contract split");
    let startup = fs::read_to_string(
        root.join("docs")
            .join("PULSEOS_STARTUP_LOADER_PUBLICATION_CONTRACT.md"),
    )
    .expect("read pulseos startup loader publication contract");
    let adapters_mod = fs::read_to_string(
        root.join("crates")
            .join("pulsec-cli")
            .join("src")
            .join("backend")
            .join("adapters")
            .join("mod.rs"),
    )
    .expect("read adapters mod");
    let windows_mod = fs::read_to_string(
        root.join("crates")
            .join("pulsec-cli")
            .join("src")
            .join("backend")
            .join("adapters")
            .join("windows_x64")
            .join("mod.rs"),
    )
    .expect("read windows adapter mod");
    let pulseos_mod = fs::read_to_string(
        root.join("crates")
            .join("pulsec-cli")
            .join("src")
            .join("backend")
            .join("adapters")
            .join("pulseos_x64")
            .join("mod.rs"),
    )
    .expect("read pulseos adapter mod");
    let plan_rendering = fs::read_to_string(
        root.join("crates")
            .join("pulsec-cli")
            .join("src")
            .join("backend")
            .join("analysis")
            .join("plan_rendering.rs"),
    )
    .expect("read plan_rendering");

    assert!(board.contains("| RB-16 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(board.contains("PULSEOS_STARTUP_LOADER_PUBLICATION_CONTRACT.md"));
    assert!(board.contains("| RB-G5 |"));
    assert!(board.contains("Artifact/startup/loader contracts are explicit for the Windows x64 lane and the PulseOS lane"));
    assert!(board.contains("Done (Locked)"));
    assert!(handoff.contains("`RB-18`"));
    assert!(handoff.contains("`RB-16` PulseOS startup/loader/publication contract"));
    assert!(contract.contains("PulseOS Startup, Loader, and Publication Contract (`RB-16`)"));
    assert!(roadmap.contains("the rebase board is now closed through `RB-21`"));
    assert!(roadmap.contains("[PulseOS Startup, Loader, and Publication Contract]"));
    assert!(cli.contains("startup_loader_contracts"));
    assert!(cli.contains("pulsec.windows_x64.startup_loader_contract.v1"));
    assert!(cli.contains("pulsec.pulseos.startup_loader_contract.v1"));
    assert!(runtime_service.contains("PULSEOS_STARTUP_LOADER_PUBLICATION_CONTRACT.md"));
    assert!(artifact.contains("PULSEOS_STARTUP_LOADER_PUBLICATION_CONTRACT.md"));
    assert!(startup.contains("Schema ids:"));
    assert!(startup.contains("`pulsec.windows_x64.startup_loader_contract.v1`"));
    assert!(startup.contains("`pulsec.pulseos.startup_loader_contract.v1`"));
    assert!(startup.contains("## Windows x64 Active Adapter Startup/Loader Contract"));
    assert!(startup.contains("## PulseOS Requested-Target Startup/Loader Contract"));
    assert!(startup.contains("## First-Slice Publication Layout"));
    assert!(startup.contains("## What `startup_loader_contracts` Means In The Plan"));
    assert!(startup.contains("`pulseos_start`"));
    assert!(startup.contains("`bin/<entry> + bin/launch.json`"));
    assert!(adapters_mod.contains("TargetStartupLoaderContract"));
    assert!(adapters_mod.contains("resolve_active_adapter_startup_loader_contract("));
    assert!(adapters_mod.contains("resolve_requested_target_startup_loader_contract("));
    assert!(windows_mod.contains("windows_x64_startup_loader_contract("));
    assert!(windows_mod.contains("pulsec.windows_x64.startup_loader_contract.v1"));
    assert!(pulseos_mod.contains("pulseos_x64_startup_loader_contract("));
    assert!(pulseos_mod.contains("pulsec.pulseos.startup_loader_contract.v1"));
    assert!(pulseos_mod.contains("pulseos_start"));
    assert!(pulseos_mod.contains("bin/launch.json"));
    assert!(plan_rendering.contains("render_startup_loader_contracts(target_id, output_mode)"));
    assert!(plan_rendering.contains("  \\\"startup_loader_contracts\\\": {},\\n"));
    assert!(plan_rendering.contains("\\\"loader_manifest_schema\\\": {},\\n"));
    assert!(plan_rendering.contains("\\\"loader_manifest_path\\\": {},\\n"));
}

#[test]
fn lock_rb_17_pulseos_loading_proof_target_and_handoff_resume_point_are_documented() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
    let board = fs::read_to_string(root.join("docs").join("REBASE_TAKS_BOARD.md"))
        .expect("read rebase board");
    let handoff = fs::read_to_string(root.join("docs").join("CODEX_HANDOFF_PHASE_F.md"))
        .expect("read phase f handoff");
    let contract = fs::read_to_string(root.join("docs").join("NATIVE_BACKEND_CONTRACT.md"))
        .expect("read backend contract");
    let roadmap = fs::read_to_string(root.join("docs").join("STANDALONE_ROADMAP.md"))
        .expect("read standalone roadmap");
    let cli = fs::read_to_string(root.join("docs").join("CLI_COMMAND_CONTRACT.md"))
        .expect("read cli command contract");
    let startup = fs::read_to_string(
        root.join("docs")
            .join("PULSEOS_STARTUP_LOADER_PUBLICATION_CONTRACT.md"),
    )
    .expect("read pulseos startup contract");
    let proof = fs::read_to_string(
        root.join("docs")
            .join("PULSEOS_EXECUTABLE_LOADING_PROOF_TARGET.md"),
    )
    .expect("read pulseos loading proof target");
    let adapters_mod = fs::read_to_string(
        root.join("crates")
            .join("pulsec-cli")
            .join("src")
            .join("backend")
            .join("adapters")
            .join("mod.rs"),
    )
    .expect("read adapters mod");
    let pulseos_mod = fs::read_to_string(
        root.join("crates")
            .join("pulsec-cli")
            .join("src")
            .join("backend")
            .join("adapters")
            .join("pulseos_x64")
            .join("mod.rs"),
    )
    .expect("read pulseos adapter mod");
    let plan_rendering = fs::read_to_string(
        root.join("crates")
            .join("pulsec-cli")
            .join("src")
            .join("backend")
            .join("analysis")
            .join("plan_rendering.rs"),
    )
    .expect("read plan_rendering");

    assert!(board.contains("| RB-17 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(board.contains("PULSEOS_EXECUTABLE_LOADING_PROOF_TARGET.md"));
    assert!(handoff.contains("`RB-18`"));
    assert!(handoff.contains("`RB-17` PulseOS executable-loading proof target"));
    assert!(contract.contains("PulseOS Executable-Loading Proof Target (`RB-17`)"));
    assert!(roadmap.contains("the rebase board is now closed through `RB-21`"));
    assert!(roadmap.contains("[PulseOS Executable-Loading Proof Target]"));
    assert!(cli.contains("requested_target_executable_loading_proof_target"));
    assert!(cli.contains("pulsec.pulseos.loading_proof_target.v1"));
    assert!(startup.contains("PULSEOS_EXECUTABLE_LOADING_PROOF_TARGET.md"));
    assert!(proof.contains("Schema id:"));
    assert!(proof.contains("`pulsec.pulseos.loading_proof_target.v1`"));
    assert!(proof.contains("## Required Published Artifacts"));
    assert!(proof.contains("## Required Loader Capabilities"));
    assert!(proof.contains("## Required Runtime Bootstrap Sequence"));
    assert!(proof.contains("## Success Conditions"));
    assert!(proof.contains("## Explicit Excluded Claims"));
    assert!(proof
        .contains("## What `requested_target_executable_loading_proof_target` Means In The Plan"));
    assert!(proof.contains("`bin/<entry>`"));
    assert!(proof.contains("`bin/launch.json`"));
    assert!(proof.contains("`pulseos_start`"));
    assert!(adapters_mod.contains("TargetExecutableLoadingProofTarget"));
    assert!(adapters_mod.contains("resolve_requested_target_executable_loading_proof_target("));
    assert!(pulseos_mod.contains("pulseos_x64_executable_loading_proof_target("));
    assert!(pulseos_mod.contains("pulsec.pulseos.loading_proof_target.v1"));
    assert!(pulseos_mod.contains("proof-contract-defined-execution-deferred"));
    assert!(plan_rendering.contains("render_requested_target_executable_loading_proof_target("));
    assert!(plan_rendering
        .contains("  \\\"requested_target_executable_loading_proof_target\\\": {},\\n"));
    assert!(plan_rendering.contains("\\\"required_loader_manifest_path\\\": \\\"{}\\\",\\n"));
}

#[test]
fn lock_rb_18_validation_layering_is_documented_and_test_homes_are_labeled() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
    let board = fs::read_to_string(root.join("docs").join("REBASE_TAKS_BOARD.md"))
        .expect("read rebase board");
    let handoff = fs::read_to_string(root.join("docs").join("CODEX_HANDOFF_PHASE_F.md"))
        .expect("read phase f handoff");
    let contract = fs::read_to_string(root.join("docs").join("NATIVE_BACKEND_CONTRACT.md"))
        .expect("read backend contract");
    let roadmap = fs::read_to_string(root.join("docs").join("STANDALONE_ROADMAP.md"))
        .expect("read standalone roadmap");
    let parity = fs::read_to_string(root.join("docs").join("E3_PARITY_EVIDENCE_STRATEGY.md"))
        .expect("read parity evidence strategy");
    let layering = fs::read_to_string(root.join("docs").join("REBASE_VALIDATION_LAYERING.md"))
        .expect("read validation layering doc");
    let stage_locks_d = fs::read_to_string(
        root.join("crates")
            .join("pulsec-cli")
            .join("tests")
            .join("stage_locks_d.rs"),
    )
    .expect("read stage_locks_d");
    let phase_d_cli = fs::read_to_string(
        root.join("crates")
            .join("pulsec-cli")
            .join("tests")
            .join("phase_d_cli.rs"),
    )
    .expect("read phase_d_cli");
    let fixture_projects = fs::read_to_string(
        root.join("crates")
            .join("pulsec-cli")
            .join("tests")
            .join("fixture_projects.rs"),
    )
    .expect("read fixture_projects");
    let e3_parity = fs::read_to_string(
        root.join("crates")
            .join("pulsec-cli")
            .join("tests")
            .join("e3_parity.rs"),
    )
    .expect("read e3_parity");
    let stage_locks_c2 = fs::read_to_string(
        root.join("crates")
            .join("pulsec-cli")
            .join("tests")
            .join("stage_locks_c2.rs"),
    )
    .expect("read stage_locks_c2");
    let stage_locks_c3 = fs::read_to_string(
        root.join("crates")
            .join("pulsec-cli")
            .join("tests")
            .join("stage_locks_c3.rs"),
    )
    .expect("read stage_locks_c3");
    let backend_tests = fs::read_to_string(
        root.join("crates")
            .join("pulsec-cli")
            .join("src")
            .join("backend")
            .join("tests")
            .join("mod.rs"),
    )
    .expect("read backend tests mod");

    assert!(board.contains("| RB-18 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(board.contains("REBASE_VALIDATION_LAYERING.md"));
    assert!(handoff.contains("`RB-21`"));
    assert!(handoff.contains("`RB-18` rebase validation layering"));
    assert!(contract.contains("Validation Layering (`RB-18`)"));
    assert!(roadmap.contains("the rebase board is now closed through `RB-21`"));
    assert!(roadmap.contains("[Rebase Validation Layering]"));
    assert!(parity.contains("Windows x64 adapter evidence only"));
    assert!(parity.contains("It does not prove PulseOS or Linux parity by proxy"));
    assert!(layering.contains("## Layer Rules"));
    assert!(layering.contains("### Target-Neutral Compiler and Project Validation"));
    assert!(layering.contains("### Cross-Cutting Contract Locks"));
    assert!(layering.contains("### Windows x64 Adapter Validation"));
    assert!(layering.contains("### PulseOS Requested-Target Contract / Proof Validation"));
    assert!(layering.contains("### Linux Expansion Slot"));
    assert!(layering.contains("fixture_projects.rs"));
    assert!(layering.contains("A passing Windows x64 executable/parity test is never proof of PulseOS or Linux execution."));
    assert!(layering.contains("A passing PulseOS requested-target plan/contract test is never proof of PulseOS execution."));
    assert!(stage_locks_d
        .contains("// Target-neutral CLI, manifest, scaffold, and build-plan surface locks."));
    assert!(phase_d_cli.contains(
        "// Target-neutral project lifecycle/publication coverage. This uses the current"
    ));
    assert!(fixture_projects.contains(
        "// Mixed executable corpus: portable language/runtime behavior lives beside the"
    ));
    assert!(e3_parity.contains("// Windows x64 host/bootstrap fat-vs-shared parity suite."));
    assert!(stage_locks_c2.contains("// Windows x64 host/bootstrap runtime and ARC lock suite."));
    assert!(stage_locks_c3
        .contains("// Windows x64 host/bootstrap object-model and dispatch lock suite."));
    assert!(backend_tests
        .contains("// Backend contract suite: target-neutral and requested-target contract"));
}

#[test]
fn lock_rb_19_windows_scope_freeze_policy_and_handoff_resume_point_are_documented() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
    let board = fs::read_to_string(root.join("docs").join("REBASE_TAKS_BOARD.md"))
        .expect("read rebase board");
    let handoff = fs::read_to_string(root.join("docs").join("CODEX_HANDOFF_PHASE_F.md"))
        .expect("read phase f handoff");
    let contract = fs::read_to_string(root.join("docs").join("NATIVE_BACKEND_CONTRACT.md"))
        .expect("read backend contract");
    let roadmap = fs::read_to_string(root.join("docs").join("STANDALONE_ROADMAP.md"))
        .expect("read standalone roadmap");
    let cli = fs::read_to_string(root.join("docs").join("CLI_COMMAND_CONTRACT.md"))
        .expect("read cli command contract");
    let guide =
        fs::read_to_string(root.join("docs").join("D_CLI_UX_GUIDE.md")).expect("read cli guide");
    let scope = fs::read_to_string(root.join("docs").join("WINDOWS_X64_ADAPTER_SCOPE.md"))
        .expect("read windows x64 adapter scope");
    let matrix = fs::read_to_string(root.join("docs").join("WINDOWS_TOOLCHAIN_MATRIX.md"))
        .expect("read windows toolchain matrix");
    let removal = fs::read_to_string(root.join("docs").join("COMPILER_PACKAGING_REMOVAL.md"))
        .expect("read compiler packaging removal");
    let policy = fs::read_to_string(root.join("docs").join("WINDOWS_X64_SCOPE_FREEZE_POLICY.md"))
        .expect("read windows scope freeze policy");

    assert!(board.contains("| RB-19 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(board.contains("WINDOWS_X64_SCOPE_FREEZE_POLICY.md"));
    assert!(handoff.contains("`RB-21`"));
    assert!(handoff.contains("`RB-19` Windows x64 scope / freeze policy"));
    assert!(contract.contains("Windows Scope / Freeze Policy (`RB-19`)"));
    assert!(roadmap.contains("the rebase board is now closed through `RB-21`"));
    assert!(roadmap.contains("[Windows x64 Scope / Freeze Policy]"));
    assert!(cli.contains("Windows freeze note (`RB-19`)"));
    assert!(cli.contains("the only retained Windows-only top-level CLI flags"));
    assert!(guide.contains("Windows freeze note (`RB-19`)"));
    assert!(
        guide.contains("license to add installer/signing/productization flags back into `pulsec`")
    );
    assert!(scope.contains("WINDOWS_X64_SCOPE_FREEZE_POLICY.md"));
    assert!(matrix.contains("Rebase note (`RB-19`)"));
    assert!(matrix.contains("does not authorize new Windows-only compiler scope"));
    assert!(matrix.contains(
        "the only retained Windows-only top-level CLI controls are `--linker` and `--assembler`"
    ));
    assert!(removal.contains("WINDOWS_X64_SCOPE_FREEZE_POLICY.md"));
    assert!(policy.contains("## Retained Live Windows x64 Scope"));
    assert!(policy.contains("## Frozen / Deferred Windows-Specific Scope"));
    assert!(policy.contains("## No-Reentry Rules"));
    assert!(policy.contains("## Growth Rules For The Retained Windows Lane"));
    assert!(policy.contains("`WIN-CLI-02`"));
    assert!(policy.contains("`WIN-TC-01`"));
    assert!(policy.contains("`WIN-PKG-01`"));
    assert!(policy.contains("`WIN-SCF-02`"));
    assert!(policy.contains("restoring `pulsec package`"));
    assert!(policy.contains("new MSI-specific manifest keys"));
    assert!(policy.contains("better MASM failure diagnostics"));
}

#[test]
fn lock_rb_20_planning_spine_alignment_and_closed_rebase_state_are_documented() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
    let board = fs::read_to_string(root.join("docs").join("REBASE_TAKS_BOARD.md"))
        .expect("read rebase board");
    let handoff = fs::read_to_string(root.join("docs").join("CODEX_HANDOFF_PHASE_F.md"))
        .expect("read phase f handoff");
    let contract = fs::read_to_string(root.join("docs").join("NATIVE_BACKEND_CONTRACT.md"))
        .expect("read backend contract");
    let roadmap = fs::read_to_string(root.join("docs").join("STANDALONE_ROADMAP.md"))
        .expect("read standalone roadmap");
    let policy = fs::read_to_string(root.join("docs").join("REBASE_SCOPE_AND_RETURN_POLICY.md"))
        .expect("read scope and return policy");
    let alignment =
        fs::read_to_string(root.join("docs").join("REBASE_PLANNING_SPINE_ALIGNMENT.md"))
            .expect("read planning spine alignment");

    assert!(board.contains("| RB-20 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(board.contains("REBASE_PLANNING_SPINE_ALIGNMENT.md"));
    assert!(handoff.contains("`RB-21`"));
    assert!(handoff.contains("`RB-20` planning spine alignment"));
    assert!(contract.contains("RB-20"));
    assert!(contract.contains("REBASE_PLANNING_SPINE_ALIGNMENT.md"));
    assert!(roadmap.contains("the rebase board is now closed through `RB-21`"));
    assert!(roadmap.contains("[Rebase Planning Spine Alignment]"));
    assert!(policy.contains("Closure note:"));
    assert!(policy.contains("control now returns to `F1_TASK_BOARD` at `F1-51`"));
    assert!(alignment.contains("## Live Planning Spine"));
    assert!(alignment.contains("## Current Active Truth"));
    assert!(alignment.contains("active execution board: `F1_TASK_BOARD`"));
    assert!(alignment.contains("active resume point: `F1-51`"));
    assert!(alignment.contains("the rebase closure package is published, reviewed, and closed"));
}

#[test]
fn lock_rb_21_closure_package_is_published_and_f1_handoff_is_activated() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
    let board = fs::read_to_string(root.join("docs").join("REBASE_TAKS_BOARD.md"))
        .expect("read rebase board");
    let handoff = fs::read_to_string(root.join("docs").join("CODEX_HANDOFF_PHASE_F.md"))
        .expect("read phase f handoff");
    let roadmap = fs::read_to_string(root.join("docs").join("STANDALONE_ROADMAP.md"))
        .expect("read standalone roadmap");
    let checklist = fs::read_to_string(root.join("docs").join("REBASE_CLOSURE_CHECKLIST.md"))
        .expect("read rebase closure checklist");
    let evidence = fs::read_to_string(root.join("docs").join("REBASE_EVIDENCE_INDEX.md"))
        .expect("read rebase evidence index");

    assert!(board.contains("| RB-21 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(board.contains("REBASE_CLOSURE_CHECKLIST.md"));
    assert!(board.contains("REBASE_EVIDENCE_INDEX.md"));
    assert!(board.contains("control now returns explicitly to `F1_TASK_BOARD` at `F1-51`"));
    assert!(board.contains("| RB-G6 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(handoff.contains("`RB-21` closure package publication"));
    assert!(handoff.contains("the requested review has cleared and the rebase is now closed"));
    assert!(handoff.contains("`F1-51` is now the active return point"));
    assert!(roadmap.contains("the rebase board is now closed through `RB-21`"));
    assert!(checklist.contains("Status: Closed"));
    assert!(checklist.contains("## Review Gate"));
    assert!(checklist.contains("the explicit handoff back to `F1_TASK_BOARD` is now active"));
    assert!(checklist.contains("first return point: `F1-51`"));
    assert!(evidence.contains("Status: Closed"));
    assert!(evidence.contains("## Review Gate"));
    assert!(evidence.contains("The next active board is now:"));
    assert!(evidence.contains("active resume point: `F1-51`"));
}

#[test]
fn lock_f1_43_wrapper_surface_is_documented_and_board_locked() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
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
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
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
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
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
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
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
            .join("pulse")
            .join("lang")
            .join("Runnable.md"),
    )
    .expect("read Runnable stdlib doc");
    let appendable_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("stdlib")
            .join("pulse")
            .join("lang")
            .join("Appendable.md"),
    )
    .expect("read Appendable stdlib doc");
    let sequence_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("stdlib")
            .join("pulse")
            .join("lang")
            .join("CharSequence.md"),
    )
    .expect("read CharSequence stdlib doc");
    let string_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("stdlib")
            .join("pulse")
            .join("lang")
            .join("String.md"),
    )
    .expect("read String stdlib doc");
    let builder_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("stdlib")
            .join("pulse")
            .join("lang")
            .join("StringBuilder.md"),
    )
    .expect("read StringBuilder stdlib doc");
    let input_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("stdlib")
            .join("pulse")
            .join("io")
            .join("InputStream.md"),
    )
    .expect("read InputStream stdlib doc");
    let output_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("stdlib")
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
    assert!(string_doc.contains("implements CharSequence, Comparable<String>"));
    assert!(string_doc.contains("public String subSequence(int beginIndex, int endIndex)"));
    assert!(string_doc.contains("public int compareTo(String text)"));
    assert!(builder_doc.contains("implements Appendable, CharSequence"));
    assert!(builder_doc.contains("public char charAt(int index)"));
    assert!(builder_doc.contains("public String subSequence(int beginIndex, int endIndex)"));
    assert!(input_doc.contains("implements AutoCloseable"));
    assert!(output_doc.contains("implements AutoCloseable"));
    assert!(enums_doc.contains("pulse.lang.Enum"));
    assert!(enums_doc.contains("bootstrap base contract"));
    assert!(board.contains("| F1-47 |"));
    assert!(board.contains("| F1-47 | Add missing foundational `pulse.lang` types"));
    assert!(board.contains("| 2026-03-14 | Done (Locked) |"));
    assert!(board.contains("Runnable"));
    assert!(board.contains("Appendable"));
    assert!(board.contains("CharSequence"));
    assert!(handoff.contains("`F1-47` foundational `pulse.lang` types"));
    assert!(handoff.contains("`Runnable`, `Appendable`, and `CharSequence`"));
    assert!(handoff
        .contains("fat and shared output modes now both pass the foundational interface flow"));
}

#[test]
fn lock_f1_48_collection_inventory_is_documented_and_board_locked() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
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
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
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
    assert!(strategy.contains("`F1-108`"));
    assert!(strategy.contains("`F1-109`"));
    assert!(strategy.contains("`F1-110`"));
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
        import pulse.lang.Char;

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
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read F1 task board");
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
        import pulse.lang.String;

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
        import pulse.lang.String;

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
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read F1 task board");
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
    assert!(compiler_doc.contains("must typecheck as `pulse.lang.Throwable`"));
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
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read F1 task board");
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
    assert!(compiler_doc.contains("`return` through `try` / `catch` / `finally` is real"));
    assert!(compiler_doc.contains("`break` and `continue` inside `try` / `catch` / `finally` are still fenced"));
    assert!(runtime_doc.contains("Current `try` / `catch` / `finally` Runtime Contract"));
    assert!(runtime_doc.contains("runtime-installed handler frames"));
    assert!(board.contains("| F1-16 |"));
    assert!(board.contains("Done (Locked)"));
}

#[test]
fn lock_f1_17_try_with_resources_policy_is_documented_and_fenced() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read F1 task board");
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
    assert!(compiler_doc.contains("declaration-form resource statements are supported"));
    assert!(compiler_doc.contains("pulse.lang.AutoCloseable"));
    assert!(compiler_doc.contains("resources close in reverse declaration order"));
    assert!(!policy.contains("try-with-resources for the current F1 baseline"));
    assert!(board.contains("| F1-17 |"));
    assert!(board.contains("Done (Locked)"));
}

#[test]
fn lock_f1_17_cli_check_accepts_try_with_resources_baseline() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.io.InputStream;

        class Main {
            public static void main() {
                try (InputStream input = new InputStream("x")) {
                }
            }
        }"#,
    );
    assert_check_ok(&entry, &src_root);
}

#[test]
fn lock_f1_18_foreach_baseline_is_documented_and_board_staged() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read F1 task board");
    let doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("compiler-backed")
            .join("statements-and-control-flow.md"),
    )
    .expect("read statements and control flow doc");

    assert!(doc.contains("## `foreach`"));
    assert!(doc.contains("pulse.lang.Iterable"));
    assert!(doc.contains("pulse.collections.Array"));
    assert!(doc.contains("`for (T value : nativeArrayExpr) { ... }` works for native array types"));
    assert!(doc.contains(
        "native-array foreach lowers through array `length` plus native array subscript reads"
    ));
    assert!(doc.contains("selected F1 foreach/iteration baseline is now locked"));
    assert!(board.contains("| F1-18 |"));
    assert!(board.contains("Done (Locked)"));
}

#[test]
fn lock_f1_19_assert_baseline_is_documented_and_board_locked() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read F1 task board");
    let doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("compiler-backed")
            .join("statements-and-control-flow.md"),
    )
    .expect("read statements and control flow doc");

    assert!(doc.contains("## `assert`"));
    assert!(doc.contains("pulse.lang.AssertionError"));
    assert!(doc.contains("condition must typecheck as `boolean`"));
    assert!(doc.contains("optional message must currently typecheck as `String`"));
    assert!(doc.contains("AssertionError: <message>"));
    assert!(board.contains("| F1-19 |"));
    assert!(board.contains("Done (Locked)"));
}

#[test]
fn lock_f1_20_synchronized_statement_policy_is_documented_and_board_staged() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read F1 task board");
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
    assert!(doc.contains("statements are real in the current F1 baseline"));
    assert!(doc.contains("method-level `synchronized` on concrete class methods is also real"));
    assert!(doc.contains("pulse.concurrent.Monitor"));
    assert!(doc.contains("does not require manual user-code workarounds"));
    assert!(doc.contains("F1-86"));
    assert!(doc.contains("F1-89"));
    assert!(doc.contains("F1-93"));
    assert!(policy.contains("`synchronized` statement/method baseline"));
    assert!(board.contains("| F1-20 |"));
    assert!(board.contains("Done (Locked)"));
}

#[test]
fn lock_f1_20_cli_check_accepts_synchronized_statement_baseline() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.concurrent.Monitor;

        class Main {
            public static void main() {
                Monitor gate = Monitor.create();
                synchronized (gate) {
                }
            }
        }"#,
    );
    assert_check_ok(&entry, &src_root);
}

#[test]
fn lock_f1_20_cli_check_accepts_synchronized_method_baseline() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;

        class Counter {
            private int value;

            public synchronized int next() {
                value = value + 1;
                return value;
            }
        }

        class Main {
            public static synchronized int id() {
                return 7;
            }

            public static void main() {
                int value = new Counter().next();
                int same = Main.id();
            }
        }"#,
    );
    assert_check_ok(&entry, &src_root);
}

#[test]
fn lock_f1_86_monitor_wait_notify_floor_is_documented_on_board_and_language_surface() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read F1 task board");
    let doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("compiler-backed")
            .join("statements-and-control-flow.md"),
    )
    .expect("read statements and control flow doc");

    assert!(board.contains("| F1-86 |"));
    assert!(board.contains("Monitor.wait"));
    assert!(board.contains("notifyAll"));
    assert!(doc.contains("Monitor.wait()"));
    assert!(doc.contains("Monitor.notify()"));
    assert!(doc.contains("queued waiter event"));
}

#[test]
fn lock_f1_89_memory_publication_baseline_is_documented_and_volatile_remains_fenced() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read F1 task board");
    let policy = fs::read_to_string(root.join("docs").join("F1_SUPPORT_POLICY.md"))
        .expect("read F1 support policy");
    let gap =
        fs::read_to_string(root.join("docs").join("F1_GAP_MATRIX.md")).expect("read F1 gap matrix");
    let doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("compiler-backed")
            .join("concurrency-and-memory-model.md"),
    )
    .expect("read concurrency and memory model doc");

    assert!(board.contains("| F1-89 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(board.contains("`volatile` remains semantically rejected"));
    assert!(board.contains("`final` fields are compile-time immutability"));
    assert!(board.contains("`AtomicReference` now provides explicit supported reference handoff/publication"));
    assert!(board.contains("ARC/weak/cycle runtime memory ownership is thread-safe"));
    assert!(policy.contains("## F1 Memory / Publication Baseline"));
    assert!(policy.contains("`AtomicReference` is real for explicit shared-reference handoff/publication"));
    assert!(policy.contains("ARC/weak/cycle runtime memory ownership is now thread-safe"));
    assert!(policy.contains("ordinary unsynchronized object-field publication across threads is not part of the currently claimed F1 baseline"));
    assert!(gap.contains("| `volatile` modifier | Reserved/Fenced | Reserved, semantically rejected |"));
    assert!(gap.contains("ordinary unsynchronized object-graph publication is out of scope"));
    assert!(doc.contains("Current shipped concurrency behavior is intentionally narrower than the full Java Memory Model"));
    assert!(doc.contains("`volatile` remains intentionally fenced in F1"));
    assert!(doc.contains("compile-time immutability after initialization"));
    assert!(doc.contains("use `AtomicReference` for explicit shared-reference handoff/publication"));
    assert!(doc.contains("ARC/weak/cycle runtime memory ownership paths are now serialized"));
    assert!(doc.contains("do not treat ordinary unsynchronized field reads/writes on arbitrary objects as a supported cross-thread publication model"));
}

#[test]
fn lock_f1_89_cli_check_rejects_volatile_field_baseline() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;

        class Counter {
            public volatile int value;
        }

        class Main {
            public static void main() {
                Counter counter = new Counter();
            }
        }"#,
    );

    let output = run_pulsec(&[
        "check",
        entry.to_str().expect("entry str"),
        "--source-root",
        src_root.to_str().expect("src root str"),
    ]);
    assert!(
        !output.status.success(),
        "expected volatile field check failure\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );
    let stderr = String::from_utf8_lossy(&output.stderr);
    assert!(stderr.contains("Modifier 'volatile' is reserved but not supported on field 'Counter.value' yet"));
}

#[test]
fn lock_f1_91_atomic_policy_is_documented_and_reference_atomics_are_shipped_with_explicit_publication_boundary() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read F1 task board");
    let doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("compiler-backed")
            .join("concurrency-and-memory-model.md"),
    )
    .expect("read concurrency and memory model doc");

    assert!(board.contains("| F1-91 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(board.contains("AtomicBoolean"));
    assert!(board.contains("AtomicReference"));
    assert!(board.contains("explicit reference handoff/publication are in"));
    assert!(doc.contains("## Supported Atomic Policy"));
    assert!(doc.contains("`AtomicBoolean` is supported"));
    assert!(doc.contains("`AtomicInt` is supported"));
    assert!(doc.contains("`AtomicLong` is supported"));
    assert!(doc.contains("`AtomicReference` is supported"));
    assert!(!doc.contains("Why `AtomicReference` is still later:"));
}

#[test]
fn lock_f1_90_concurrency_scope_is_documented_and_thread_stays_language_owned() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read F1 task board");
    let doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("compiler-backed")
            .join("concurrency-and-memory-model.md"),
    )
    .expect("read concurrency and memory model doc");
    let roadmap = fs::read_to_string(root.join("docs").join("STANDALONE_ROADMAP.md"))
        .expect("read standalone roadmap");

    assert!(board.contains("| F1-90 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(board.contains("`Mutex`, `Event`, `Semaphore`, `CountDownLatch`, `Monitor`, `Callable`, `Executor`, `ExecutorService`, `Future`, `FutureTask`, `RunnableFuture`, `ScheduledFuture`, `ScheduledExecutorService`, `ScheduledFutureTask`, `ScheduledThreadPerTaskExecutor`, `CompletableFuture`, `CompletionFunction`, `CompletionConsumer`, `ThreadPerTaskExecutor`, `Executors`, `AtomicBoolean`, `AtomicInt`, `AtomicLong`, `AtomicReference`, `ConcurrentHashMap`, `CopyOnWriteArrayList`, `BlockingQueue`, `LinkedBlockingQueue`, `BlockingDeque`, and `LinkedBlockingDeque`"));
    assert!(board.contains("`Thread` remains `pulse.lang.Thread`"));
    assert!(board.contains("periodic scheduling plus broader completion-stage/executor/concurrent-collection families continue as explicit later work"));

    assert!(doc.contains("## `pulse.concurrent` Scope"));
    assert!(doc.contains("Shipped in `pulse.concurrent` today:"));
    assert!(doc.contains("`Thread` remains `pulse.lang.Thread`"));
    assert!(doc.contains("`Runnable` remains `pulse.lang.Runnable`"));
    assert!(doc.contains("`AtomicReference` is supported"));
    assert!(doc.contains("`ExecutorService`"));
    assert!(doc.contains("`ThreadPerTaskExecutor`"));
    assert!(doc.contains("`ScheduledFuture`"));
    assert!(doc.contains("`CompletableFuture`"));
    assert!(doc.contains("`CompletionConsumer`"));
    assert!(doc.contains("`ConcurrentHashMap`"));
    assert!(doc.contains("`CopyOnWriteArrayList`"));
    assert!(doc.contains("`LinkedBlockingQueue`"));
    assert!(doc.contains("`LinkedBlockingDeque`"));
    assert!(doc.contains("CompletableFuture"));

    assert!(roadmap.contains("locked `pulse.concurrent` scope"));
    assert!(roadmap.contains("`Thread`/`Runnable` remaining language-owned"));
    assert!(roadmap.contains("explicit reference publication now raised"));
    assert!(roadmap.contains("thread-per-task executor/future baseline now shipped"));
    assert!(roadmap.contains("bounded `CompletableFuture` completion/composition now shipped"));
    assert!(roadmap.contains("selected concurrent collections and blocking producer/consumer containers now shipped"));
}

#[test]
fn lock_f1_93_thread_lifecycle_floor_is_documented_on_board_and_language_surface() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read F1 task board");
    let doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("compiler-backed")
            .join("statements-and-control-flow.md"),
    )
    .expect("read statements and control flow doc");

    assert!(board.contains("| F1-93 |"));
    assert!(board.contains("real lifecycle/start/join semantics"));
    assert!(board.contains("cooperative interruption"));
    assert!(board.contains("cross-thread monitor wakeup validation"));
    assert!(board.contains("ARC/weak/cycle memory ownership"));
    assert!(board.contains("thread-per-task plus one-shot delayed executor baseline"));
    assert!(doc.contains("real `Thread` lifecycle (`start`, `join`, cooperative interruption)"));
    assert!(doc.contains("first truthful executor/future baseline now exists separately under `F1-103`"));
}

#[test]
fn lock_f1_103_executor_future_baseline_is_documented_and_board_locked() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read F1 task board");
    let doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("compiler-backed")
            .join("concurrency-and-memory-model.md"),
    )
    .expect("read concurrency and memory model doc");
    let policy =
        fs::read_to_string(root.join("docs").join("F1_SUPPORT_POLICY.md")).expect("read F1 support policy");

    assert!(board.contains("| F1-103 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(board.contains("`Callable`, `Executor`, `ExecutorService`, `Future`, `FutureTask`, `RunnableFuture`, `ScheduledFuture`, `ScheduledExecutorService`, `ScheduledFutureTask`, `ScheduledThreadPerTaskExecutor`, `CompletableFuture`, `CompletionFunction`, `CompletionConsumer`, `ThreadPerTaskExecutor`, and the `Executors` factories are real and executable"));
    assert!(board.contains("one-shot delayed scheduling"));
    assert!(board.contains("explicit failed futures"));
    assert!(board.contains("bounded chained async accept/map/recovery/compose behavior"));
    assert!(board.contains("Periodic scheduling"));

    assert!(doc.contains("higher-level task execution baseline:"));
    assert!(doc.contains("`ExecutorService`"));
    assert!(doc.contains("`FutureTask`"));
    assert!(doc.contains("`ThreadPerTaskExecutor`"));
    assert!(doc.contains("`ScheduledThreadPerTaskExecutor`"));
    assert!(doc.contains("`CompletableFuture`"));
    assert!(doc.contains("`CompletionConsumer`"));
    assert!(doc.contains("periodic scheduling"));
    assert!(doc.contains("fuller `CompletableFuture` / completion-stage surface"));

    assert!(policy.contains("`Callable`, `Executor`, `ExecutorService`, `Future`, `FutureTask`, `RunnableFuture`, `ScheduledFuture`, `ScheduledExecutorService`, `CompletableFuture`, and the thread-per-task / one-shot delayed executor baseline are now real and executable"));
}

#[test]
fn lock_f1_92_concurrent_collection_baseline_is_documented_and_board_locked() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read F1 task board");
    let doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("compiler-backed")
            .join("concurrency-and-memory-model.md"),
    )
    .expect("read concurrency and memory model doc");
    let policy =
        fs::read_to_string(root.join("docs").join("F1_SUPPORT_POLICY.md")).expect("read F1 support policy");
    let roadmap = fs::read_to_string(root.join("docs").join("STANDALONE_ROADMAP.md"))
        .expect("read standalone roadmap");

    assert!(board.contains("| F1-92 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(board.contains("`ConcurrentHashMap`, `CopyOnWriteArrayList`, `BlockingQueue`, `LinkedBlockingQueue`, `BlockingDeque`, and `LinkedBlockingDeque` are real and executable"));
    assert!(board.contains("blocking producer/consumer handoff"));
    assert!(board.contains("broader concurrent collections"));

    assert!(doc.contains("selected concurrent collections:"));
    assert!(doc.contains("`ConcurrentHashMap`"));
    assert!(doc.contains("`CopyOnWriteArrayList`"));
    assert!(doc.contains("`BlockingQueue`"));
    assert!(doc.contains("`LinkedBlockingQueue`"));
    assert!(doc.contains("`BlockingDeque`"));
    assert!(doc.contains("`LinkedBlockingDeque`"));
    assert!(doc.contains("selected concurrent collections and blocking producer/consumer containers are in"));
    assert!(doc.contains("broader concurrent-collection families"));

    assert!(policy.contains("`ConcurrentHashMap`, `CopyOnWriteArrayList`, `LinkedBlockingQueue`, and `LinkedBlockingDeque` are now real and executable"));
    assert!(roadmap.contains("selected concurrent collections and blocking producer/consumer containers now shipped"));
}

#[test]
fn lock_f1_21_ternary_baseline_is_documented_and_board_locked() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
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
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
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
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
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
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
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
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read task board");
    let parity_guide = fs::read_to_string(root.join("docs").join("E3_PARITY_GUIDE.md"))
        .expect("read parity guide");
    let evidence_index = fs::read_to_string(root.join("docs").join("E3_EVIDENCE_INDEX.md"))
        .expect("read parity evidence index");

    assert!(parity_guide.contains("fat and shared native output modes"));
    assert!(evidence_index
        .contains("cli_build_executes_same_fixture_corpus_with_side_by_side_fat_shared_parity"));
    assert!(evidence_index
        .contains("cli_build_executes_runtime_heavy_app_with_side_by_side_fat_shared_parity"));
    assert!(evidence_index
        .contains("cli_build_executes_strict_stress_soak_with_repeated_fat_shared_parity"));
    assert!(evidence_index
        .contains("cli_build_executes_failure_paths_with_side_by_side_fat_shared_parity"));
    assert!(board.contains("| F1-38 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(board.contains("strict stress soak parity"));
}

#[test]
fn lock_f1_39_object_identity_surface_is_documented_and_board_locked() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read task board");
    let object_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("stdlib")
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
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
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
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read task board");
    let string_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("stdlib")
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
        assert!(
            string_doc.contains(needle),
            "String doc missing '{}'",
            needle
        );
    }

    assert!(board.contains("| F1-41 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(board.contains("Core Java-close `String` operations"));
}

#[test]
fn lock_f1_42_stringbuilder_surface_is_documented_and_board_locked() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read task board");
    let builder_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("stdlib")
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
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
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
    assert!(compiler_doc
        .contains("one-dimensional initializer expressions such as `new int[] { 1, 2 }`"));
    assert!(compiler_doc.contains(
        "one-dimensional floating-point initializers such as `new float[] { 1.25f, -2.5f }`"
    ));
    assert!(compiler_doc.contains(
        "nested multidimensional initializer expressions such as `new int[][] { {1, 2}, {3, 4} }`"
    ));
    assert!(compiler_doc.contains("native subscript reads such as `values[1]`"));
    assert!(compiler_doc.contains("native subscript writes such as `values[0] = 7`"));
    assert!(compiler_doc.contains("multidimensional creation such as `new int[2][3]`"));
    assert!(runtime_doc.contains("Current runtime-backed native array baseline"));
    assert!(runtime_doc.contains(
        "primitive arrays and reference arrays lower through the runtime array allocator"
    ));
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
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
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
    assert!(compiler_doc
        .contains("mixed signed/unsigned widening now follows the current executable Pulse slice"));
    assert!(compiler_doc.contains("call-site and constructor-side implicit numeric widening now execute through the same runtime-backed coercion path"));
    assert!(compiler_doc.contains("varargs applicability is now real for the current baseline"));
    assert!(compiler_doc.contains(
        "casts from integral primitives to `float` / `double` now materialize real floating values"
    ));
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
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
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
    assert!(
        compiler_doc.contains("compound assignment forms `&=`, `|=`, `^=`, `<<=`, `>>=`, `>>>=`")
    );
    assert!(compiler_doc.contains(
        "boolean `&`, `|`, and `^` now use real non-short-circuit Java-like boolean semantics"
    ));
    assert!(compiler_doc.contains("`&&` and `||` now lower through lazy conditional execution"));
    assert!(board.contains("| F1-27 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(board.contains("lazy logical `&&` / `||` execution"));
}

#[test]
fn lock_f1_100_local_var_slice_is_documented_and_board_locked() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
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
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
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
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
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
    assert!(
        compiler_doc.contains("direct `throw` of a checked exception must be caught or declared")
    );
    assert!(compiler_doc
        .contains("overriding methods and interface implementations cannot widen checked throws"));
    assert!(compiler_doc.contains("Current Throwable Detail Surface"));
    assert!(compiler_doc.contains("cause chaining"));
    assert!(runtime_doc.contains("`throws` clauses are compile-time contracts today"));
    assert!(runtime_doc
        .contains("checked exceptions from calls/constructors are enforced by semantic analysis"));
    assert!(runtime_doc.contains("cross-method Pulse-throw propagation"));
    assert!(runtime_doc
        .contains("uncaught throwable output now includes stdlib-owned cause-chain text"));
    assert!(board.contains("| F1-29 |"));
    assert!(board.contains("In Progress"));
    assert!(board.contains("runtime cross-method Pulse-throw unwind now works"));
    assert!(board.contains("F1-101"));
}

#[test]
fn lock_f1_46_throwable_hierarchy_is_documented_and_board_locked() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
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
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
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
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
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
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
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
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
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
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..")
        .join("docs");
    let idx = fs::read_to_string(root.join("STDLIB_API_INDEX.md")).expect("read stdlib index");
    let closure =
        fs::read_to_string(root.join("C1_5_CLOSURE_CHECKLIST.md")).expect("read closure checklist");
    assert!(idx.contains("pulse.collections"));
    assert!(closure.contains("Closure Commands"));
}

#[test]
fn lock_e3_01_parity_support_matrix_scopes_supported_vs_intentional_differences() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..")
        .join("docs");
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
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..")
        .join("docs");
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
    assert!(strategy.contains("Build / Publication Comparison Rules"));
}

#[test]
fn gate_m3_g1_fixture_project_coverage() {
    assert_fixture_build_and_run("runtime_mix", "app/runtime/Main.pulse", "runtime_mix_ok\n");
    assert_fixture_build_and_run(
        "object_interface_mix",
        "app/mixed/Main.pulse",
        "object_interface_mix_ok\n",
    );
    assert_fixture_build_and_run(
        "strict_stress_soak",
        "strict_stress_soak/Main.pulse",
        "soak_ok\n40415\n",
    );
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
    let plan =
        fs::read_to_string(root.join("build").join("native.plan.json")).expect("read native plan");
    assert!(plan.contains("pulse.io.File.readAllText"));
}

#[test]
fn gate_m3_g4_time_math_determinism_coverage() {
    assert_fixture_build_and_run("runtime_mix", "app/runtime/Main.pulse", "runtime_mix_ok\n");
}

#[test]
fn lock_f1_58_io_text_and_encoding_policy_is_documented_and_board_locked() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read F1 task board");
    let runtime_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("runtime-backed")
            .join("io-text-and-encoding.md"),
    )
    .expect("read runtime-backed io encoding doc");

    assert!(runtime_doc.contains("PulseCode currently ships a text-first IO model"));
    assert!(runtime_doc.contains("operate on `String` payloads, not byte buffers"));
    assert!(runtime_doc.contains("there is no user-selectable charset API"));
    assert!(runtime_doc.contains("`readLines()` and `InputStream.readLine()` split on `\\n`"));
    assert!(runtime_doc.contains("`\\r\\n` is treated as one logical line ending"));
    assert!(runtime_doc.contains("raw binary streams"));
    assert!(board.contains("| F1-58 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(board.contains("text-first and line-oriented over `String` payloads"));
}

#[test]
fn lock_f1_59_path_and_file_metadata_baseline_is_board_locked() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..");
    let board =
        fs::read_to_string(root.join("docs").join("F1_TASK_BOARD.md")).expect("read F1 task board");
    let path_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("stdlib")
            .join("pulse")
            .join("io")
            .join("Path.md"),
    )
    .expect("read Path stdlib doc");
    let file_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("stdlib")
            .join("pulse")
            .join("io")
            .join("File.md"),
    )
    .expect("read File stdlib doc");
    let files_doc = fs::read_to_string(
        root.join("docs")
            .join("language")
            .join("stdlib")
            .join("pulse")
            .join("io")
            .join("Files.md"),
    )
    .expect("read Files stdlib doc");

    assert!(path_doc.contains("public static String combine(String left, String right)"));
    assert!(path_doc.contains("public static String resolve(String parent, String child)"));
    assert!(path_doc.contains("public static String fileName(String value)"));
    assert!(path_doc.contains("public static String commonParent(String left, String right)"));
    assert!(file_doc.contains("public static boolean exists(String path)"));
    assert!(file_doc.contains("public static boolean isFile(String path)"));
    assert!(file_doc.contains("public static boolean isDirectory(String path)"));
    assert!(file_doc.contains("public static long lastModified(String path)"));
    assert!(files_doc.contains("public static boolean exists(String path)"));
    assert!(files_doc.contains("public static boolean isDirectory(String path)"));
    assert!(board.contains("| F1-59 |"));
    assert!(board.contains("Done (Locked)"));
    assert!(board.contains(
        "selected path/file metadata and utility baseline is already real and fixture-validated"
    ));
}
