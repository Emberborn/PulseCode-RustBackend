mod common;
// Windows x64 host/bootstrap runtime and ARC lock suite.

use std::fs;
use std::path::{Path, PathBuf};
use std::process::{Command, Output, Stdio};
use std::sync::atomic::{AtomicU64, Ordering};
use std::time::{SystemTime, UNIX_EPOCH};

#[cfg(windows)]
use std::ffi::c_void;
#[cfg(windows)]
use std::os::windows::io::AsRawHandle;
#[cfg(windows)]
use std::thread;
#[cfg(windows)]
use std::time::Duration;

const HANDLE_SLOT_INITIAL_CAPACITY: i32 = 63;
const HANDLE_SLOT_CAPACITY: u32 = 0xFFFF_FFFF;
const HANDLE_TABLE_ROWS: i32 = HANDLE_SLOT_INITIAL_CAPACITY + 1;
const CONTAINER_MAX_CAPACITY: i32 = i32::MAX;
const FRAME_BUDGET_WARN_BYTES: i32 = 1024;
const FRAME_BUDGET_FAIL_BYTES: i32 = 4096;

fn unique_temp_root() -> PathBuf {
    static NEXT_ID: AtomicU64 = AtomicU64::new(1);
    let nanos = SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .expect("system time")
        .as_nanos();
    let id = NEXT_ID.fetch_add(1, Ordering::Relaxed);
    let root = std::env::temp_dir().join(format!(
        "pulsec_c2_lock_{}_{}_{}",
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

fn read_runtime_asm(root: &Path) -> String {
    let split_runtime = root
        .join("build")
        .join("obj")
        .join("runtime")
        .join("StdlibRuntime.asm");
    if split_runtime.exists() {
        return fs::read_to_string(&split_runtime).expect("read StdlibRuntime.asm");
    }
    fs::read_to_string(root.join("build").join("main.asm")).expect("read main.asm")
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

fn build_supports_backend_execution(output: &Output) -> bool {
    if output.status.success() {
        let stdout = String::from_utf8_lossy(&output.stdout);
        return stdout.contains("Entry codegen: masm-split-stdlib");
    }

    let stderr = String::from_utf8_lossy(&output.stderr);
    if stderr.contains("error[PULSEC:E_BUILD_FAILED]: Compile error: backend emit failed:") {
        return false;
    }

    panic!(
        "expected build success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        stderr
    );
}

#[cfg(windows)]
#[repr(C)]
struct ProcessMemoryCounters {
    cb: u32,
    page_fault_count: u32,
    peak_working_set_size: usize,
    working_set_size: usize,
    quota_peak_paged_pool_usage: usize,
    quota_paged_pool_usage: usize,
    quota_peak_non_paged_pool_usage: usize,
    quota_non_paged_pool_usage: usize,
    pagefile_usage: usize,
    peak_pagefile_usage: usize,
}

#[cfg(windows)]
#[link(name = "psapi")]
extern "system" {
    fn GetProcessMemoryInfo(
        process: *mut c_void,
        counters: *mut ProcessMemoryCounters,
        cb: u32,
    ) -> i32;
}

#[cfg(windows)]
fn read_peak_working_set(handle: *mut c_void) -> Option<u64> {
    let mut counters = ProcessMemoryCounters {
        cb: std::mem::size_of::<ProcessMemoryCounters>() as u32,
        page_fault_count: 0,
        peak_working_set_size: 0,
        working_set_size: 0,
        quota_peak_paged_pool_usage: 0,
        quota_paged_pool_usage: 0,
        quota_peak_non_paged_pool_usage: 0,
        quota_non_paged_pool_usage: 0,
        pagefile_usage: 0,
        peak_pagefile_usage: 0,
    };
    let ok = unsafe { GetProcessMemoryInfo(handle, &mut counters, counters.cb) };
    if ok == 0 {
        None
    } else {
        Some(counters.peak_working_set_size as u64)
    }
}

#[cfg(windows)]
fn run_exe_with_peak_working_set(exe: &Path) -> (std::process::Output, u64) {
    let mut child = Command::new(exe)
        .stdout(Stdio::piped())
        .stderr(Stdio::piped())
        .spawn()
        .expect("spawn fixture executable");
    let handle = child.as_raw_handle() as *mut c_void;
    let mut peak = 0u64;
    loop {
        if let Some(v) = read_peak_working_set(handle) {
            peak = peak.max(v);
        }
        match child.try_wait().expect("poll child process") {
            Some(_) => break,
            None => thread::sleep(Duration::from_millis(5)),
        }
    }
    let output = child.wait_with_output().expect("collect process output");
    if let Some(v) = read_peak_working_set(handle) {
        peak = peak.max(v);
    }
    (output, peak)
}

#[test]
fn lock_c2_01_arc_header_contract_is_documented_and_emitted_in_native_plan() {
    let doc = fs::read_to_string(
        PathBuf::from(env!("CARGO_MANIFEST_DIR"))
            .join("..")
            .join("..")
            .join("docs")
            .join("RUNTIME_INTRINSICS_ABI.md"),
    )
    .expect("read RUNTIME_INTRINSICS_ABI.md");
    assert!(doc.contains("ARC Header Contract (C2-01)"));
    assert!(doc.contains("pulsec.arc.header.v1"));
    assert!(doc.contains("refcount_saturation_guard"));

    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        class Main {
            public static void main() {
            }
        }"#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");
    if !build_supports_backend_execution(&output) {
        return;
    }

    let plan = fs::read_to_string(root.join("build").join("native.plan.json"))
        .expect("read native.plan.json");
    assert!(plan.contains("\"abi_version\": \"v2\""));
    assert!(plan.contains("\"memory_model\""));
    assert!(plan.contains("\"strategy\": \"arc\""));
    assert!(plan.contains("\"header_schema\": \"pulsec.arc.header.v1\""));
    assert!(plan.contains("\"refcount_saturation_guard\": 4294967294"));
    assert!(plan.contains("\"kind_tags\""));
}

#[test]
fn lock_c2_02_arc_fast_path_null_noop_behavior_executes() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.memory.Memory;

        class Main {
            public static void main() {
                long h = Memory.retain(0L);
                Memory.release(h);
                Memory.release(5000L);
                IO.println("arc_ok");
            }
        }"#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");
    if !build_supports_backend_execution(&output) {
        return;
    }

    let plan = fs::read_to_string(root.join("build").join("native.plan.json"))
        .expect("read native.plan.json");
    assert!(plan.contains("pulse.memory.Memory.retain"));
    assert!(plan.contains("pulse.memory.Memory.release"));

    let run = Command::new(root.join("build").join("main.exe"))
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected zero exit\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "arc_ok\n", "unexpected runtime output");
}

#[test]
fn lock_c2_03_arc_release_slow_path_teardown_sequence_executes() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.memory.Memory;
        import pulse.rt.Intrinsics;

        class Main {
            public static void main() {
                long h = Intrinsics.listNew();
                Memory.retain(h);
                Memory.release(h);
                Intrinsics.listAddInt(h, 9);
                int before = Intrinsics.listSize(h);
                Memory.release(h);
                IO.println(before);
                // Stale handle use-after-release must panic deterministically.
                int after = Intrinsics.listSize(h);
                IO.println(after);
            }
        }"#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");
    if !build_supports_backend_execution(&output) {
        return;
    }

    let run = Command::new(root.join("build").join("main.exe"))
        .output()
        .expect("run built executable");
    assert!(
        !run.status.success(),
        "expected non-zero exit from stale handle panic\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert!(
        out.contains("1\n"),
        "expected pre-release list size output before panic\nstdout:\n{}",
        out
    );
    assert!(
        out.contains("Stale runtime handle"),
        "expected stale-handle panic message\nstdout:\n{}",
        out
    );
}

#[test]
fn lock_c2_04_arc_insertion_boundaries_emit_retain_release_sequences() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.memory.Memory;
        import pulse.rt.Intrinsics;

        class Main {
            public static String keep;

            public static String echo(String s) {
                return s;
            }

            public static void sink(String s) {
            }

            public static void main() {
                String a = "A";
                String b = "B";
                a = b;
                keep = a;
                sink(a);
                String c = echo(a);
                long list = Intrinsics.listNew();
                Intrinsics.listAddString(list, c);
                IO.println(c);
            }
        }"#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");
    if !build_supports_backend_execution(&output) {
        return;
    }

    let asm = fs::read_to_string(
        root.join("build")
            .join("obj")
            .join("app")
            .join("core")
            .join("Main.asm"),
    )
    .expect("read Main.asm");
    let retain_count = asm.matches("call pulsec_rt_arcRetain").count();
    let release_count = asm.matches("call pulsec_rt_arcRelease").count();
    assert!(
        retain_count >= 4,
        "expected ARC retain insertion points in Main.asm, saw {}",
        retain_count
    );
    assert!(
        release_count >= 3,
        "expected ARC release insertion points in Main.asm, saw {}",
        release_count
    );

    let run = Command::new(root.join("build").join("main.exe"))
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected zero exit\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "B\n", "unexpected runtime output");
}

#[test]
fn lock_c2_05_cycle_detector_cadence_and_symbols_are_locked() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.memory.Memory;
        import pulse.rt.Intrinsics;

        class Main {
            public static void main() {
                IO.println(Memory.cycleYoungPass());
                IO.println(Memory.cycleFullPass());
                IO.println(Memory.cycleTick());
                IO.println(Memory.cycleTick());
            }
        }"#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");
    if !build_supports_backend_execution(&output) {
        return;
    }

    let plan = fs::read_to_string(root.join("build").join("native.plan.json"))
        .expect("read native.plan.json");
    assert!(plan.contains("\"cycle_detector\""));
    assert!(plan.contains("\"schema\": \"pulsec.arc.cycle.v1\""));
    assert!(plan.contains("\"strategy\": \"trial-deletion\""));
    assert!(plan.contains("\"young_window\": 64"));
    assert!(plan.contains("\"full_interval_ticks\": 8"));
    assert!(plan.contains("pulse.memory.Memory.cycleYoungPass"));
    assert!(plan.contains("pulse.memory.Memory.cycleFullPass"));
    assert!(plan.contains("pulse.memory.Memory.cycleTick"));

    let run = Command::new(root.join("build").join("main.exe"))
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected zero exit\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "0\n0\n0\n0\n", "unexpected runtime output");
}

#[test]
fn lock_c2_user_object_cycle_reclamation_executes_when_unreachable() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.memory.Memory;

        class Node {
            public Node next;
        }

        class Main {
            public static void main() {
                int baseline = Memory.cycleFullPass();
                Node a = new Node();
                Node b = new Node();
                Node keep = new Node();
                a.next = b;
                b.next = a;
                a = null;
                b = null;
                int reclaimed = Memory.cycleFullPass() - baseline;
                IO.println(reclaimed);
                IO.println(Memory.cycleFullPass());
                if (keep == null) {
                    IO.println(0);
                } else {
                    IO.println(1);
                }
            }
        }"#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");
    if !build_supports_backend_execution(&output) {
        return;
    }

    let run = Command::new(root.join("build").join("main.exe"))
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected zero exit\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(
        out, "2\n0\n1\n",
        "expected unreachable user-object cycle to be reclaimed deterministically\nstdout:\n{}",
        out
    );
}

#[test]
fn lock_c2_user_object_storage_tables_are_dynamic_pointer_backed() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;

        class Node {
            public Node next;
        }

        class Main {
            public static void main() {
                Node a = new Node();
                Node b = new Node();
                a.next = b;
                IO.println(1);
            }
        }"#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");
    if !build_supports_backend_execution(&output) {
        return;
    }

    let io_asm = read_runtime_asm(&root);
    assert!(
        io_asm.contains("pulsec_rt_obj_class_ids dq pulsec_rt_obj_class_ids_init"),
        "expected object class-id table pointer root in runtime asm"
    );
    assert!(
        io_asm.contains("pulsec_rt_obj_class_ids_heap_owned dd 0"),
        "expected object class-id heap-owned flag in runtime asm"
    );
    assert!(
        io_asm.contains("mov r10, qword ptr [pulsec_rt_obj_class_ids]"),
        "expected object class-id table loads to dereference pointer root"
    );
    assert!(
        !io_asm.contains("pulsec_rt_obj_class_ids dd "),
        "legacy fixed object class-id table should not remain in runtime asm"
    );

    let node_asm = fs::read_to_string(
        root.join("build")
            .join("obj")
            .join("app")
            .join("core")
            .join("Node.asm"),
    )
    .expect("read Node.asm");
    assert!(
        node_asm.contains("pulsec_fld_app_core_Node_next dq pulsec_fld_app_core_Node_next_tbl"),
        "expected non-static object field pointer root in class asm"
    );
    assert!(
        node_asm.contains("pulsec_fld_app_core_Node_next_heap_owned dd 0"),
        "expected non-static object field heap-owned flag in class asm"
    );
}

#[test]
fn lock_c2_user_reference_field_lanes_are_64bit_in_codegen() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;

        class Holder {
            public String value;
        }

        class Main {
            public static void main() {
                Holder h = new Holder();
                h.value = "ok";
                IO.println(h.value);
            }
        }"#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");
    if !build_supports_backend_execution(&output) {
        return;
    }

    let holder_asm = fs::read_to_string(
        root.join("build")
            .join("obj")
            .join("app")
            .join("core")
            .join("Holder.asm"),
    )
    .expect("read Holder.asm");
    assert!(
        holder_asm.contains("mov rax, qword ptr [r10+rdx*8]"),
        "expected 64-bit load lane for reference field handle in class asm"
    );
    assert!(
        holder_asm.contains("mov qword ptr [r10+rdx*8], rax"),
        "expected 64-bit store lane for reference field handle in class asm"
    );
    assert!(
        !holder_asm.contains("mov dword ptr [r10+rdx*4], eax"),
        "legacy 32-bit reference field store lane should not remain in class asm"
    );
}

#[test]
fn lock_c2_06_weak_reference_runtime_support_is_locked() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.memory.Memory;
        import pulse.rt.Intrinsics;

        class Main {
            public static void main() {
                String h = String.valueOf(42);
                long w = Memory.weakNew(h);
                String live = Memory.weakGet(w);
                IO.println(Intrinsics.stringLength(live));

                Memory.release(h);
                String dropped = Memory.weakGet(w);
                if (dropped == null) {
                    IO.println(0);
                } else {
                    IO.println(dropped.length());
                }

                Memory.weakClear(w);
                String cleared = Memory.weakGet(w);
                if (cleared == null) {
                    IO.println(0);
                } else {
                    IO.println(cleared.length());
                }

                long stale = w + 16777216L;
                String invalid = Memory.weakGet(stale);
                IO.println(invalid.length());
            }
        }"#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");
    if !build_supports_backend_execution(&output) {
        return;
    }

    let plan = fs::read_to_string(root.join("build").join("native.plan.json"))
        .expect("read native.plan.json");
    assert!(plan.contains("pulse.memory.Memory.weakNew"));
    assert!(plan.contains("pulse.memory.Memory.weakGet"));
    assert!(plan.contains("pulse.memory.Memory.weakClear"));

    let run = Command::new(root.join("build").join("main.exe"))
        .output()
        .expect("run built executable");
    assert!(
        !run.status.success(),
        "expected non-zero exit from stale weak-handle panic\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert!(
        out.contains("2\n0\n0\n"),
        "expected live/drop/clear weak-ref outputs before stale panic\nstdout:\n{}",
        out
    );
    assert!(
        out.contains("Stale runtime handle"),
        "expected stale-handle panic message\nstdout:\n{}",
        out
    );
}

#[test]
fn lock_c2_07_arc_failure_semantics_are_locked() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.memory.Memory;

        class Main {
            public static void main() {
                int i = 0;
                while (i < 1025) {
                    Memory.cycleTick();
                    i = i + 1;
                }
                IO.println("lag_checked");
            }
        }"#,
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
        "expected build success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );

    let plan = fs::read_to_string(root.join("build").join("native.plan.json"))
        .expect("read native.plan.json");
    assert!(plan.contains("\"failure_semantics\""));
    assert!(plan.contains("\"zero_reclaim_lag_limit\": 1024"));
    assert!(plan.contains("\"lag_action\": \"track\""));

    let runtime_asm = read_runtime_asm(&root);
    assert!(
        runtime_asm.contains("cmp edx, 4294967294"),
        "expected retain saturation guard compare in runtime asm"
    );
    assert!(
        runtime_asm.contains("rt_arc_refcount_saturation_err"),
        "expected retain saturation diagnostic symbol in runtime asm"
    );
    assert!(
        runtime_asm.contains("rt_arc_cycle_zero_reclaim_streak"),
        "expected cycle lag tracking counter in runtime asm"
    );
    assert!(
        runtime_asm.contains("cmp eax, 1024"),
        "expected lag threshold compare in runtime asm"
    );

    let run = Command::new(root.join("build").join("main.exe"))
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected zero exit from lag-tracking runtime path\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "lag_checked\n", "unexpected runtime output");
}

#[test]
fn lock_c2_allocator_reuses_reclaimed_arc_slots() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.memory.Memory;
        import pulse.rt.Intrinsics;

        class Main {
            public static void main() {
                int i = 0;
                int ok = 1;
                while (i < 5000) {
                    long h = Intrinsics.listNew();
                    if (h == 0L) {
                        ok = 0;
                        i = 5000;
                    } else {
                        Memory.release(h);
                    }
                    i = i + 1;
                }
                IO.println(ok);
            }
        }"#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");
    if !build_supports_backend_execution(&output) {
        return;
    }

    let io_asm = read_runtime_asm(&root);
    assert!(
        io_asm.contains("rt_arc_free_head"),
        "expected ARC free-list head in runtime asm"
    );
    assert!(
        io_asm.contains("rt_arc_free_next"),
        "expected ARC free-list next table in runtime asm"
    );

    let run = Command::new(root.join("build").join("main.exe"))
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected zero exit for slot reuse fixture\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "1\n", "expected slot reuse to keep allocations alive");
}

#[test]
fn lock_c2_weak_allocator_grows_beyond_legacy_limit_without_early_exhaustion() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    let weak_growth_loops = 6000;
    write_file(
        &entry,
        &format!(
            r#"
        package app.core;
        import pulse.memory.Memory;
        import pulse.rt.Intrinsics;

        class Main {{
            public static void main() {{
                String seed = String.valueOf(7);
                int i = 0;
                int ok = 1;
                while (i < {}) {{
                    long w = Memory.weakNew(seed);
                    if (w == 0L) {{
                        ok = 0;
                        i = {};
                    }}
                    i = i + 1;
                }}
                if (ok == 1) {{
                    Intrinsics.consoleWriteLine(seed);
                }}
            }}
        }}"#,
            weak_growth_loops, weak_growth_loops
        ),
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");
    if !build_supports_backend_execution(&output) {
        return;
    }

    let io_asm = read_runtime_asm(&root);
    assert!(
        io_asm.contains("rt_weak_exhausted_err"),
        "expected weak exhaustion diagnostic symbol in runtime asm"
    );
    assert!(
        io_asm.contains("call pulsec_rt_ensureSlotCapacity"),
        "expected weak allocator to route through slot-capacity growth"
    );

    let run = Command::new(root.join("build").join("main.exe"))
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected zero exit for weak allocator growth fixture\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "7\n", "expected weak allocator growth fixture output");
}

#[test]
fn lock_c2_weak_clear_recycles_token_capacity() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.memory.Memory;
        import pulse.rt.Intrinsics;

        class Main {
            public static void main() {
                String seed = String.valueOf(9);
                int ok = 1;
                int round = 0;
                while (round < 100) {
                    long[] bag = new long[200];
                    int i = 0;
                    while (i < 200) {
                        long w = Memory.weakNew(seed);
                        if (w == 0L) {
                            ok = 0;
                            i = 200;
                            round = 100;
                        } else {
                            bag[i] = w;
                        }
                        i = i + 1;
                    }
                    i = 0;
                    while (i < 200) {
                        long w2 = bag[i];
                        if (w2 != 0L) {
                            Memory.weakClear(w2);
                        }
                        i = i + 1;
                    }
                    round = round + 1;
                }
                IO.println(ok);
            }
        }"#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");
    if !build_supports_backend_execution(&output) {
        return;
    }

    let io_asm = read_runtime_asm(&root);
    assert!(
        io_asm.contains("rt_weak_free_head"),
        "expected weak free-list head in runtime asm"
    );
    assert!(
        io_asm.contains("rt_weak_free_next"),
        "expected weak free-list next table in runtime asm"
    );

    let run = Command::new(root.join("build").join("main.exe"))
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected zero exit with weak slot recycling\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "1\n", "expected weak token recycling to stay healthy");
}

#[test]
fn lock_c2_generation_wraparound_is_fail_fast_and_locked() {
    let doc = fs::read_to_string(
        PathBuf::from(env!("CARGO_MANIFEST_DIR"))
            .join("..")
            .join("..")
            .join("docs")
            .join("RUNTIME_INTRINSICS_ABI.md"),
    )
    .expect("read RUNTIME_INTRINSICS_ABI.md");
    assert!(
        doc.contains("generation") && doc.contains("overflow"),
        "expected generation overflow contract in ABI doc"
    );

    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        class Main {
            public static void main() {
            }
        }"#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");
    if !build_supports_backend_execution(&output) {
        return;
    }

    let stdout = String::from_utf8_lossy(&output.stdout);
    if !stdout.contains("Entry codegen: masm-split-stdlib") {
        return;
    }

    let io_asm = read_runtime_asm(&root);
    assert!(
        io_asm.contains("rt_arc_gen_overflow_err")
            || io_asm.contains("rt_arc_generation_overflow_err"),
        "expected ARC generation overflow diagnostic in runtime asm"
    );
    assert!(
        io_asm.contains("rt_weak_generation_overflow_err"),
        "expected weak generation overflow diagnostic in runtime asm"
    );
}

#[test]
fn lock_c2_08_array_heap_allocation_contract_is_locked() {
    let doc = fs::read_to_string(
        PathBuf::from(env!("CARGO_MANIFEST_DIR"))
            .join("..")
            .join("..")
            .join("docs")
            .join("RUNTIME_INTRINSICS_ABI.md"),
    )
    .expect("read RUNTIME_INTRINSICS_ABI.md");
    assert!(
        doc.contains("per-array heap-backed buffers"),
        "expected C2-08 heap-backed array contract in ABI doc"
    );
    assert!(
        doc.contains("pulsec.alloc.policy.v1"),
        "expected allocator policy schema in ABI doc"
    );

    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.memory.Memory;
        import pulse.rt.Intrinsics;

        class Main {
            public static void main() {
                long a = Intrinsics.arrayNew(4);
                Intrinsics.arraySetInt(a, 2, 77);
                IO.println(Intrinsics.arrayGetInt(a, 2));
                Memory.release(a);
            }
        }"#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");
    if !build_supports_backend_execution(&output) {
        return;
    }
    let plan = fs::read_to_string(root.join("build").join("native.plan.json"))
        .expect("read native.plan.json");
    assert!(plan.contains("\"allocator\""));
    assert!(plan.contains("\"schema\": \"pulsec.alloc.policy.v1\""));
    assert!(plan.contains("\"backend\": \"win64-process-heap\""));
    assert!(plan.contains(&format!("\"slot_capacity\": {}", HANDLE_SLOT_CAPACITY)));
    assert!(plan.contains(&format!(
        "\"slot_capacity_initial\": {}",
        HANDLE_SLOT_INITIAL_CAPACITY
    )));
    assert!(plan.contains("\"slot_capacity_growth\": \"runtime-doubling\""));
    assert!(plan.contains("\"frame_budget\""));
    assert!(plan.contains(&format!("\"warn_bytes\": {}", FRAME_BUDGET_WARN_BYTES)));
    assert!(plan.contains(&format!("\"fail_bytes\": {}", FRAME_BUDGET_FAIL_BYTES)));
    assert!(plan.contains("\"pointer_bytes\": 8"));
    assert!(plan.contains("\"lane_bytes\": { \"int\": 4, \"handle\": 8 }"));
    assert!(plan.contains("\"container_storage\""));
    assert!(plan.contains("\"list\""));
    assert!(plan.contains("\"init_capacity\": 16"));
    assert!(plan.contains(&format!("\"max_capacity\": {}", CONTAINER_MAX_CAPACITY)));
    assert!(plan.contains("\"growth_factor\": { \"numerator\": 2, \"denominator\": 1 }"));
    assert!(plan.contains("\"shrink\": { \"hysteresis_trigger_multiplier\": 4 }"));
    assert!(plan.contains("\"map\""));
    assert!(plan.contains("\"failure_mode\": \"deterministic-fatal\""));

    let stdout = String::from_utf8_lossy(&output.stdout);
    if !stdout.contains("Entry codegen: masm-split-stdlib") {
        return;
    }

    let io_asm = read_runtime_asm(&root);
    assert!(
        io_asm.contains("extrn GetProcessHeap:proc"),
        "expected GetProcessHeap import for array heap allocation"
    );
    assert!(
        io_asm.contains("extrn HeapAlloc:proc"),
        "expected HeapAlloc import for array heap allocation"
    );
    assert!(
        io_asm.contains("extrn HeapFree:proc"),
        "expected HeapFree import for array teardown"
    );
    assert!(
        io_asm.contains(&format!(
            "rt_slot_capacity dd {}",
            HANDLE_SLOT_INITIAL_CAPACITY
        )),
        "expected runtime slot capacity state in asm"
    );
    assert!(
        io_asm.contains(&format!("cmp edx, {}", HANDLE_SLOT_CAPACITY))
            || io_asm.contains("cmp edx, -1"),
        "expected runtime growth ceiling to use ABI slot mask ceiling"
    );
    assert!(
        !io_asm.contains("cmp edx, 1048575"),
        "legacy 1,048,575 ceiling should not remain in runtime growth path"
    );
    assert!(
        io_asm.contains("pulsec_rt_ensureSlotCapacity proc"),
        "expected slot-capacity growth proc in runtime asm"
    );
    assert!(
        io_asm.contains(&format!("rt_arr_i_ptr dq {} dup(0)", HANDLE_TABLE_ROWS)),
        "expected array int-lane pointer table in runtime asm"
    );
    assert!(
        io_asm.contains(&format!("rt_arr_s_ptr dq {} dup(0)", HANDLE_TABLE_ROWS)),
        "expected array string-lane pointer table in runtime asm"
    );
    assert!(
        !io_asm.contains("rt_arr_i dd "),
        "fixed array int table should not be emitted"
    );
    assert!(
        !io_asm.contains("rt_arr_s dd "),
        "fixed array string table should not be emitted"
    );

    let run = Command::new(root.join("build").join("main.exe"))
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected zero exit for heap-backed array fixture\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "77\n", "unexpected runtime output");
}

#[test]
fn lock_c2_08_slot_capacity_grows_beyond_legacy_limit() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.memory.Memory;
        import pulse.rt.Intrinsics;

        class Main {
            public static void main() {
                long holders = Intrinsics.arrayNew(5005);
                int i = 0;
                while (i < 5005) {
                    long h = Intrinsics.arrayNew(1);
                    Intrinsics.arraySetLong(holders, i, h);
                    i = i + 1;
                }
                IO.println("grow_ok");
                i = 0;
                while (i < 5005) {
                    long h2 = Intrinsics.arrayGetLong(holders, i);
                    Memory.release(h2);
                    i = i + 1;
                }
                Memory.release(holders);
            }
        }"#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");
    if !build_supports_backend_execution(&output) {
        return;
    }

    let io_asm = read_runtime_asm(&root);
    assert!(
        io_asm.contains("call pulsec_rt_ensureSlotCapacity"),
        "expected runtime slot-growth call in emitted asm"
    );

    let run = Command::new(root.join("build").join("main.exe"))
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected zero exit for slot-capacity growth fixture\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "grow_ok\n", "expected growth fixture output");
}

#[test]
fn lock_c2_10_container_shrink_hysteresis_executes() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.memory.Memory;
        import pulse.rt.Intrinsics;

        class Main {
            public static void main() {
                long list = Intrinsics.listNew();
                long map = Intrinsics.mapNew();
                int cycle = 0;
                int ok = 1;
                while (cycle < 8) {
                    int i = 0;
                    while (i < 200) {
                        Intrinsics.listAddInt(list, i);
                        String key = String.valueOf(i);
                        Intrinsics.mapPutInt(map, key, i);
                        i = i + 1;
                    }
                    Intrinsics.listClear(list);
                    Intrinsics.mapClear(map);
                    if (Intrinsics.listSize(list) != 0) {
                        ok = 0;
                    }
                    if (Intrinsics.mapSize(map) != 0) {
                        ok = 0;
                    }
                    cycle = cycle + 1;
                }
                IO.println(ok);
            }
        }"#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");
    if !build_supports_backend_execution(&output) {
        return;
    }

    let io_asm = read_runtime_asm(&root);
    assert!(
        io_asm.contains("pulsec_rt_listClear proc"),
        "expected list clear runtime proc in runtime asm"
    );
    assert!(
        io_asm.contains("pulsec_rt_mapClear proc"),
        "expected map clear runtime proc in runtime asm"
    );

    let run = Command::new(root.join("build").join("main.exe"))
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected zero exit for container shrink/hysteresis fixture\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "1\n", "unexpected runtime output");
}

#[test]
fn lock_c2_11_list_string_ownership_retain_and_clear_release() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.memory.Memory;
        import pulse.rt.Intrinsics;

        class Main {
            public static void main() {
                String s = String.valueOf(7);
                long list = Intrinsics.listNew();
                Intrinsics.listAddString(list, s);
                s = null;
                String got = Intrinsics.listGetString(list, 0);
                if (got == null) {
                    IO.println(0);
                } else {
                    IO.println(got.length());
                }
                Intrinsics.listClear(list);
                IO.println(1);
            }
        }"#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");
    if !build_supports_backend_execution(&output) {
        return;
    }

    let io_asm = read_runtime_asm(&root);
    assert!(
        io_asm.contains("pulsec_rt_listAddString proc")
            && io_asm.contains("call pulsec_rt_arcRetain"),
        "expected list add string ownership retain in runtime asm"
    );
    assert!(
        io_asm.contains("pulsec_rt_listClear proc") && io_asm.contains("call pulsec_rt_arcRelease"),
        "expected list clear ownership release in runtime asm"
    );

    let run = Command::new(root.join("build").join("main.exe"))
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected zero exit for list ownership fixture\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "1\n1\n", "unexpected list ownership runtime output");
}

#[test]
fn lock_c2_11_map_string_ownership_replace_and_clear_release() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.rt.Intrinsics;

        class Main {
            public static void main() {
                long map = Intrinsics.mapNew();
                String key = String.valueOf(1);
                String v1 = String.valueOf(11);
                Intrinsics.mapPut(map, key, v1);
                v1 = null;
                String v2 = String.valueOf(22);
                Intrinsics.mapPut(map, key, v2);
                v2 = null;

                String current = Intrinsics.mapGet(map, key);
                int len = current.length();
                IO.println(len);
                key = null;
                Intrinsics.mapClear(map);
                int size = Intrinsics.mapSize(map);
                IO.println(size);
            }
        }"#,
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
        "expected build success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );

    let stdout = String::from_utf8_lossy(&output.stdout);
    if !stdout.contains("Entry codegen: masm-split-stdlib") {
        return;
    }

    let io_asm = read_runtime_asm(&root);
    assert!(
        io_asm.contains("pulsec_rt_mapPut proc")
            && io_asm.contains("call pulsec_rt_arcRetain")
            && io_asm.contains("call pulsec_rt_arcRelease"),
        "expected map put ownership retain/release behavior in runtime asm"
    );
    assert!(
        io_asm.contains("pulsec_rt_mapClear proc") && io_asm.contains("call pulsec_rt_arcRelease"),
        "expected map clear ownership release behavior in runtime asm"
    );

    let run = Command::new(root.join("build").join("main.exe"))
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected zero exit for map ownership fixture\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "2\n0\n", "unexpected map ownership runtime output");
}

#[test]
fn lock_c2_12_array_oom_behavior_panics_deterministically() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.rt.Intrinsics;

        class Main {
            public static void main() {
                long h = Intrinsics.arrayNew(2147483647);
                IO.println(0);
            }
        }"#,
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
        "expected build success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );

    let stdout = String::from_utf8_lossy(&output.stdout);
    if !stdout.contains("Entry codegen: masm-split-stdlib") {
        return;
    }

    let io_asm = read_runtime_asm(&root);
    assert!(
        io_asm.contains("rt_array_alloc_err"),
        "expected deterministic array allocation failure diagnostic symbol"
    );

    let run = Command::new(root.join("build").join("main.exe"))
        .output()
        .expect("run built executable");
    assert!(
        !run.status.success(),
        "expected non-zero exit on deterministic array allocation failure\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert!(
        out.contains("Array allocation failed"),
        "expected deterministic array allocation failure message\nstdout:\n{}",
        out
    );
}

#[test]
fn lock_c2_12_list_growth_scales_without_panic() {
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
                long list = Intrinsics.listNew();
                int i = 0;
                while (i < 600) {
                    Intrinsics.listAddInt(list, i);
                    i = i + 1;
                }
            }
        }"#,
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
        "expected build success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );

    let stdout = String::from_utf8_lossy(&output.stdout);
    if !stdout.contains("Entry codegen: masm-split-stdlib") {
        return;
    }

    let io_asm = read_runtime_asm(&root);
    assert!(
        io_asm.contains("rt_list_growth_err"),
        "expected deterministic list growth diagnostic symbol in runtime asm"
    );

    let run = Command::new(root.join("build").join("main.exe"))
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected zero exit for dynamic list growth fixture\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
}

#[test]
fn lock_c2_12_map_growth_scales_without_panic() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    let mut puts = String::new();
    for i in 0..600 {
        puts.push_str(&format!(
            "                Intrinsics.mapPutInt(map, \"k{}\", {});\n",
            i, i
        ));
    }
    write_file(
        &entry,
        &format!(
            r#"
        package app.core;
        import pulse.rt.Intrinsics;

        class Main {{
            public static void main() {{
                long map = Intrinsics.mapNew();
{puts}            }}
        }}"#
        ),
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
        "expected build success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );

    let stdout = String::from_utf8_lossy(&output.stdout);
    if !stdout.contains("Entry codegen: masm-split-stdlib") {
        return;
    }

    let io_asm = read_runtime_asm(&root);
    assert!(
        io_asm.contains("rt_map_growth_err"),
        "expected deterministic map growth diagnostic symbol in runtime asm"
    );

    let run = Command::new(root.join("build").join("main.exe"))
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected zero exit for dynamic map growth fixture\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
}

#[test]
fn lock_c2_12_string_growth_scales_deterministically() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.rt.Intrinsics;

        class Main {
            public static void main() {
                String s = "";
                int i = 0;
                while (i < 300) {
                    s = Intrinsics.stringConcat(s, "a");
                    i = i + 1;
                }
                IO.println(s.length());
            }
        }"#,
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
        "expected build success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );

    let stdout = String::from_utf8_lossy(&output.stdout);
    if !stdout.contains("Entry codegen: masm-split-stdlib") {
        return;
    }

    let run = Command::new(root.join("build").join("main.exe"))
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected successful execution with dynamic string growth\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert!(
        out.contains("300"),
        "expected dynamic string growth to preserve final length\nstdout:\n{}",
        out
    );
}

#[test]
fn lock_c2_15_long_literal_codegen_uses_64bit_immediate() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;

        class Main {
            public static long id(long x) {
                return x;
            }

            public static void main() {
                long v = 4294967296L;
                long out = id(v);
            }
        }"#,
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
        "expected build success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );

    let stdout = String::from_utf8_lossy(&output.stdout);
    if !stdout.contains("Entry codegen: masm-split-stdlib") {
        return;
    }

    let main_asm = fs::read_to_string(
        root.join("build")
            .join("obj")
            .join("app")
            .join("core")
            .join("Main.asm"),
    )
    .expect("read Main.asm");
    assert!(
        main_asm.contains("mov rax, 4294967296"),
        "expected 64-bit long literal immediate in asm\n{}",
        main_asm
    );
}

#[test]
fn lock_c2_16_abi_v2_runtime_markers_are_locked() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        class Main {
            public static void main() {
            }
        }"#,
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
        "expected build success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );

    let plan = fs::read_to_string(root.join("build").join("native.plan.json"))
        .expect("read native.plan.json");
    assert!(plan.contains("\"abi_version\": \"v2\""));
    assert!(plan.contains(&format!("\"slot_capacity\": {}", HANDLE_SLOT_CAPACITY)));
    assert!(plan.contains("\"slot_capacity_growth\": \"runtime-doubling\""));

    let stdout = String::from_utf8_lossy(&output.stdout);
    if !stdout.contains("Entry codegen: masm-split-stdlib") {
        return;
    }

    let io_asm = read_runtime_asm(&root);
    assert!(
        io_asm.contains("cmp edx, -1") || io_asm.contains("cmp edx, 4294967295"),
        "expected runtime growth ceiling to match ABI v2 slot mask"
    );
    assert!(
        io_asm.contains("and r10d, -1")
            || io_asm.contains("and r8d, -1")
            || io_asm.contains("and r10d, 4294967295")
            || io_asm.contains("and r8d, 4294967295"),
        "expected stale-handle slot-mask checks to use ABI v2 slot mask"
    );
    assert!(
        !io_asm.contains("cmp edx, 1048575"),
        "legacy 1,048,575 ceiling should not remain in runtime asm"
    );
}

#[test]
fn lock_c2_16_generation_mismatch_panics_deterministically() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.rt.Intrinsics;

        class Main {
            public static void main() {
                long h = Intrinsics.listNew();
                IO.println("live");
                long stale = 8589934593L;
                int x = Intrinsics.listSize(stale);
                IO.println(x);
            }
        }"#,
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
        "expected build success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );

    let run = Command::new(root.join("build").join("main.exe"))
        .output()
        .expect("run built executable");
    assert!(
        !run.status.success(),
        "expected non-zero exit from forged generation mismatch\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert!(
        out.contains("live\n"),
        "expected live marker before stale panic\nstdout:\n{}",
        out
    );
    assert!(
        out.contains("Stale runtime handle"),
        "expected stale-handle panic output for forged generation mismatch\nstdout:\n{}",
        out
    );
}

#[test]
fn lock_c2_16_slot_growth_exceeds_legacy_65535() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.memory.Memory;
        import pulse.rt.Intrinsics;

        class Main {
            public static void main() {
                int target = 66000;
                long holders = Intrinsics.arrayNew(target);
                int i = 0;
                while (i < target) {
                    long h = Intrinsics.listNew();
                    Intrinsics.arraySetLong(holders, i, h);
                    i = i + 1;
                }
                IO.println("growth_65k_ok");
                IO.println(Intrinsics.arrayLength(holders));
                i = 0;
                while (i < target) {
                    long h2 = Intrinsics.arrayGetLong(holders, i);
                    Memory.release(h2);
                    i = i + 1;
                }
                Memory.release(holders);
            }
        }"#,
    );

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");
    if !build_supports_backend_execution(&output) {
        return;
    }

    let run = Command::new(root.join("build").join("main.exe"))
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected zero exit for >65535 growth fixture\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(
        out, "growth_65k_ok\n66000\n",
        "unexpected growth fixture output"
    );
}

#[test]
fn lock_c2_17_method_frames_do_not_use_fixed_scratch_offsets() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static int addThree(int a, int b, int c) {
                int x = a + b;
                int y = x + c;
                return y;
            }

            public static void main() {
                int v = addThree(1, 2, 3);
                IO.println(v);
            }
        }"#,
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
        "expected build success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );

    let stdout = String::from_utf8_lossy(&output.stdout);
    if !stdout.contains("Entry codegen: masm-split-stdlib") {
        return;
    }

    let main_asm = fs::read_to_string(
        root.join("build")
            .join("obj")
            .join("app")
            .join("core")
            .join("Main.asm"),
    )
    .expect("read Main.asm");
    assert!(
        !main_asm.contains("[rsp+1024]"),
        "method asm should not use legacy fixed temp offset 1024:\n{}",
        main_asm
    );
    assert!(
        !main_asm.contains("[rsp+3072]"),
        "method asm should not use legacy fixed ARC spill offset 3072:\n{}",
        main_asm
    );

    let mut max_sub_rsp = 0usize;
    for line in main_asm.lines() {
        let t = line.trim();
        if let Some(rest) = t.strip_prefix("sub rsp,") {
            let n = rest.trim().parse::<usize>().unwrap_or(0);
            if n > max_sub_rsp {
                max_sub_rsp = n;
            }
        }
    }
    assert!(
        max_sub_rsp > 0 && max_sub_rsp < 512,
        "expected bounded per-method frame size in Main.asm, got max sub rsp {}",
        max_sub_rsp
    );
}

#[test]
fn lock_c2_18_win64_outgoing_stack_args_work_for_static_and_instance_calls() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;

        class Helper {
            public static int sum5(int a, int b, int c, int d, int e) {
                return a + b + c + d + e;
            }

            public int add5(int a, int b, int c, int d, int e) {
                return a + b + c + d + e;
            }
        }

        class Main {
            public static void main() {
                int s = Helper.sum5(1, 2, 3, 4, 5);
                IO.println(s);
                Helper h = new Helper();
                int t = h.add5(2, 3, 4, 5, 6);
                IO.println(t);
            }
        }"#,
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
        "expected build success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );

    let stdout = String::from_utf8_lossy(&output.stdout);
    if !stdout.contains("Entry codegen: masm-split-stdlib") {
        return;
    }

    let main_asm = fs::read_to_string(
        root.join("build")
            .join("obj")
            .join("app")
            .join("core")
            .join("Main.asm"),
    )
    .expect("read Main.asm");
    assert!(
        main_asm.contains("mov dword ptr [rsp+32],")
            || main_asm.contains("mov qword ptr [rsp+32],"),
        "expected outgoing stack-arg emission at Win64 stack-arg area [rsp+32]\n{}",
        main_asm
    );

    let run = Command::new(root.join("build").join("main.exe"))
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected executable success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "15\n20\n", "unexpected output for >4 arg calls");
}

#[test]
fn lock_c2_19_frame_budget_lint_fails_build_with_clear_diagnostic() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");

    let mut locals = String::new();
    for i in 0..600 {
        locals.push_str(&format!("                int v{} = {};\n", i, i));
    }

    let src = format!(
        r#"
        package app.core;

        class Main {{
            public static void blowFrame() {{
{locals}            }}

            public static void main() {{
                blowFrame();
            }}
        }}
        "#
    );
    write_file(&entry, &src);

    let output = common::pulsec_command()
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");
    assert!(
        !output.status.success(),
        "expected frame-budget lint build failure\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );
    let stderr = String::from_utf8_lossy(&output.stderr);
    assert!(
        stderr.contains("Frame budget exceeded"),
        "expected frame-budget diagnostic in stderr\n{}",
        stderr
    );
    assert!(
        stderr.contains("app.core.Main.blowFrame"),
        "expected offending method in frame-budget diagnostic\n{}",
        stderr
    );
}

#[test]
fn lock_c2_20_same_package_gameloop_frame_is_bounded_and_executable() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/runtime/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.runtime;
        import pulse.lang.IO;

        class Main {
            public static void main() {
                if (GameLoop.tick() == 1) {
                    IO.println("same_package_ok");
                }
            }
        }"#,
    );
    write_file(
        &src_root.join("app/runtime/GameLoop.pulse"),
        r#"
        package app.runtime;

        class GameLoop {
            public static int tick() {
                return 1;
            }
        }"#,
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
        "expected build success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );

    let game_loop_asm = fs::read_to_string(
        root.join("build")
            .join("obj")
            .join("app")
            .join("runtime")
            .join("GameLoop.asm"),
    )
    .expect("read GameLoop.asm");
    let mut max_sub_rsp = 0usize;
    for line in game_loop_asm.lines() {
        let t = line.trim();
        if let Some(rest) = t.strip_prefix("sub rsp,") {
            let n = rest.trim().parse::<usize>().unwrap_or(0);
            if n > max_sub_rsp {
                max_sub_rsp = n;
            }
        }
    }
    assert!(
        max_sub_rsp > 0 && max_sub_rsp <= 4096,
        "expected bounded GameLoop frame <= 4096 bytes, got {}",
        max_sub_rsp
    );

    let stdout = String::from_utf8_lossy(&output.stdout);
    if !stdout.contains("Entry codegen: masm-split-stdlib") {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(&exe).output().expect("run same-package exe");
    assert!(
        run.status.success(),
        "expected same-package executable success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "same_package_ok\n", "unexpected same-package output");
}

#[test]
fn lock_c2_21_debug_allocator_double_release_panics_deterministically() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.memory.Memory;
        import pulse.rt.Intrinsics;

        class Main {
            public static void main() {
                long h = Intrinsics.listNew();
                Memory.release(h);
                IO.println("before-double-release");
                Memory.release(h);
                IO.println("unreachable");
            }
        }"#,
    );

    let output = common::pulsec_command()
        .env("PULSEC_DEBUG_ALLOC", "1")
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");
    assert!(
        output.status.success(),
        "expected build success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );

    let plan =
        fs::read_to_string(root.join("build").join("native.plan.json")).expect("read native plan");
    assert!(
        plan.contains("\"debug_allocator\"") && plan.contains("\"enabled\": true"),
        "expected debug allocator enabled in native plan\n{}",
        plan
    );

    let stdout = String::from_utf8_lossy(&output.stdout);
    if !stdout.contains("Entry codegen: masm-split-stdlib") {
        return;
    }

    let run = Command::new(root.join("build").join("main.exe"))
        .output()
        .expect("run built executable");
    assert!(
        !run.status.success(),
        "expected non-zero exit for debug double-release\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert!(
        out.contains("before-double-release\n"),
        "expected marker before debug allocator panic\nstdout:\n{}",
        out
    );
    assert!(
        out.contains("Debug allocator: invalid ARC release"),
        "expected debug ARC release panic output\nstdout:\n{}",
        out
    );
}

#[test]
fn lock_c2_21_debug_allocator_retain_after_release_panics_deterministically() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import pulse.lang.IO;
        import pulse.memory.Memory;
        import pulse.rt.Intrinsics;

        class Main {
            public static void main() {
                long h = Intrinsics.listNew();
                Memory.release(h);
                IO.println("before-retain-uaf");
                Memory.retain(h);
                IO.println("unreachable");
            }
        }"#,
    );

    let output = common::pulsec_command()
        .env("PULSEC_DEBUG_ALLOC", "1")
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");
    assert!(
        output.status.success(),
        "expected build success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );

    let stdout = String::from_utf8_lossy(&output.stdout);
    if !stdout.contains("Entry codegen: masm-split-stdlib") {
        return;
    }

    let run = Command::new(root.join("build").join("main.exe"))
        .output()
        .expect("run built executable");
    assert!(
        !run.status.success(),
        "expected non-zero exit for debug retain-after-release\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert!(
        out.contains("before-retain-uaf\n"),
        "expected marker before debug allocator panic\nstdout:\n{}",
        out
    );
    assert!(
        out.contains("Debug allocator: invalid ARC retain"),
        "expected debug ARC retain panic output\nstdout:\n{}",
        out
    );
}

#[test]
fn lock_c2_22_soak_memory_trend_is_stable() {
    if !cfg!(windows) {
        return;
    }
    let fixture = fixture_root("strict_stress_soak");
    let root = unique_temp_root();
    copy_dir_recursive(&fixture.join("src"), &root.join("src"));
    let src_root = root.join("src");
    let entry = src_root.join("strict_stress_soak/Main.pulse");
    let exe = root.join("build").join("main.exe");

    let iterations = std::env::var("PULSEC_SOAK_TREND_ITERS")
        .ok()
        .and_then(|s| s.parse::<usize>().ok())
        .unwrap_or(8)
        .max(5);

    let allowed_spread_bytes = std::env::var("PULSEC_SOAK_PEAK_SPREAD_BYTES")
        .ok()
        .and_then(|s| s.parse::<u64>().ok())
        .unwrap_or(12 * 1024 * 1024);
    let allowed_drift_bytes = std::env::var("PULSEC_SOAK_PEAK_DRIFT_BYTES")
        .ok()
        .and_then(|s| s.parse::<u64>().ok())
        .unwrap_or(8 * 1024 * 1024);

    let mut peaks = Vec::with_capacity(iterations);
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
            "expected build success\nstdout:\n{}\nstderr:\n{}",
            String::from_utf8_lossy(&output.stdout),
            String::from_utf8_lossy(&output.stderr)
        );

        let stdout = String::from_utf8_lossy(&output.stdout);
        if !stdout.contains("Entry codegen: masm-split-stdlib") {
            return;
        }
        let report = fs::read_to_string(root.join("build").join("native.link.txt"))
            .expect("read strict_stress_soak link report");
        assert!(
            report.contains("status=linked"),
            "strict_stress_soak must link without stubs:\n{}",
            report
        );

        #[cfg(windows)]
        let (run, peak) = run_exe_with_peak_working_set(&exe);
        #[cfg(not(windows))]
        let (run, peak) = (
            Command::new(&exe)
                .output()
                .expect("run strict_stress_soak exe"),
            0u64,
        );
        assert!(
            run.status.success(),
            "expected strict_stress_soak executable success\nstdout:\n{}\nstderr:\n{}",
            String::from_utf8_lossy(&run.stdout),
            String::from_utf8_lossy(&run.stderr)
        );
        let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
        assert_eq!(
            out, "soak_ok\n40415\n",
            "unexpected strict soak output:\n{}",
            out
        );
        peaks.push(peak);
    }

    // Ignore first two samples as warmup to avoid startup/toolchain noise in trend checks.
    let analysis = &peaks[2..];
    let min_peak = *analysis.iter().min().expect("analysis min peak");
    let max_peak = *analysis.iter().max().expect("analysis max peak");
    let final_peak = *analysis.last().expect("analysis final peak");
    assert!(
        max_peak.saturating_sub(min_peak) <= allowed_spread_bytes,
        "unexpected soak memory spread: min={} max={} spread={} allowed={} peaks={:?}",
        min_peak,
        max_peak,
        max_peak.saturating_sub(min_peak),
        allowed_spread_bytes,
        peaks
    );
    assert!(
        final_peak.saturating_sub(min_peak) <= allowed_drift_bytes,
        "unexpected soak memory drift: min={} final={} drift={} allowed={} peaks={:?}",
        min_peak,
        final_peak,
        final_peak.saturating_sub(min_peak),
        allowed_drift_bytes,
        peaks
    );
}

#[test]
fn lock_c2_23_threading_contract_is_documented_and_emitted() {
    let doc = fs::read_to_string(
        PathBuf::from(env!("CARGO_MANIFEST_DIR"))
            .join("..")
            .join("..")
            .join("docs")
            .join("RUNTIME_INTRINSICS_ABI.md"),
    )
    .expect("read RUNTIME_INTRINSICS_ABI.md");
    assert!(
        doc.contains("C2-23 threading model lock"),
        "ABI doc missing C2-23 threading section"
    );
    assert!(
        doc.contains("pulsec.runtime.threading.v1"),
        "ABI doc missing threading schema id"
    );
    assert!(
        doc.contains("single-threaded")
            && doc.contains("non-atomic")
            && doc.contains("not-thread-safe"),
        "ABI doc missing threading model field locks"
    );

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
                IO.println(1);
            }
        }"#,
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
        "expected build success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );

    let plan =
        fs::read_to_string(root.join("build").join("native.plan.json")).expect("read native plan");
    assert!(
        plan.contains("\"threading\"")
            && plan.contains("\"schema\": \"pulsec.runtime.threading.v1\"")
            && plan.contains("\"model\": \"single-threaded\"")
            && plan.contains("\"arc_atomicity\": \"non-atomic\"")
            && plan.contains("\"runtime_thread_safety\": \"not-thread-safe\"")
            && plan.contains("\"container_thread_safety\": \"not-thread-safe\""),
        "native plan missing locked threading model\n{}",
        plan
    );

    let stdout = String::from_utf8_lossy(&output.stdout);
    if !stdout.contains("Entry codegen: masm-split-stdlib") {
        return;
    }

    let io_asm = read_runtime_asm(&root);
    assert!(
        !io_asm.contains("lock "),
        "threading lock expects non-atomic runtime paths; found lock-prefixed instruction in StdlibRuntime.asm"
    );
}

#[test]
fn lock_c2_24_runtime_abi_mismatch_fails_deterministically() {
    let doc = fs::read_to_string(
        PathBuf::from(env!("CARGO_MANIFEST_DIR"))
            .join("..")
            .join("..")
            .join("docs")
            .join("RUNTIME_INTRINSICS_ABI.md"),
    )
    .expect("read RUNTIME_INTRINSICS_ABI.md");
    assert!(
        doc.contains("C2-24 runtime ABI compatibility lock"),
        "ABI doc missing C2-24 compatibility section"
    );
    assert!(
        doc.contains("pulsec.runtime.abi.v1"),
        "ABI doc missing runtime ABI schema id"
    );

    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        class Main {
            public static void main() {
            }
        }"#,
    );
    let output = common::pulsec_command()
        .env("PULSEC_FORCE_RUNTIME_ABI_VERSION", "1")
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");
    assert!(
        output.status.success(),
        "expected build success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );

    let plan =
        fs::read_to_string(root.join("build").join("native.plan.json")).expect("read native plan");
    assert!(
        plan.contains("\"abi_compatibility\"")
            && plan.contains("\"schema\": \"pulsec.runtime.abi.v1\"")
            && plan.contains("\"compiler_abi_version\": 2")
            && plan.contains("\"runtime_abi_version\": 1")
            && plan.contains("\"mismatch_policy\": \"deterministic-fail-fast\""),
        "native plan missing ABI compatibility mismatch lock\n{}",
        plan
    );

    let stdout = String::from_utf8_lossy(&output.stdout);
    if !stdout.contains("Entry codegen: masm-split-stdlib") {
        return;
    }

    let exe = root.join("build").join("main.exe");
    let run = Command::new(&exe).output().expect("run built exe");
    assert!(
        !run.status.success(),
        "expected non-zero exit for ABI mismatch\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert!(
        out.contains("Runtime ABI mismatch"),
        "expected ABI mismatch diagnostic\nstdout:\n{}",
        out
    );
}

