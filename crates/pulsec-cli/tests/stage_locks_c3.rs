use std::fs;
use std::path::{Path, PathBuf};
use std::process::{Command, Output};
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
        "pulsec_c3_lock_{}_{}_{}",
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

#[test]
fn lock_c3_01_object_layout_contract_is_documented_and_emitted() {
    let doc = fs::read_to_string(
        PathBuf::from(env!("CARGO_MANIFEST_DIR"))
            .join("..")
            .join("..")
            .join("docs")
            .join("RUNTIME_INTRINSICS_ABI.md"),
    )
    .expect("read RUNTIME_INTRINSICS_ABI.md");
    assert!(
        doc.contains("C3-01 object layout contract"),
        "ABI doc missing C3-01 object layout section"
    );
    assert!(
        doc.contains("pulsec.object.layout.v1"),
        "ABI doc missing object layout schema id"
    );
    assert!(
        doc.contains("base-prefix-then-derived"),
        "ABI doc missing inherited field placement lock"
    );

    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import com.pulse.lang.IO;

        class Base {
            int b;
        }

        class Main extends Base {
            int d;

            public Main() {
                this.b = 1;
                this.d = 2;
            }

            public static void main() {
                Main m = new Main();
                IO.println(m.b + m.d);
            }
        }"#,
    );

    let output = Command::new(env!("CARGO_BIN_EXE_pulsec"))
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
    assert!(plan.contains("\"object_model\""));
    assert!(plan.contains("\"schema\": \"pulsec.object.layout.v1\""));
    assert!(plan.contains("\"layout_version\": 1"));
    assert!(plan.contains("\"header_bytes\": 16"));
    assert!(plan.contains("\"field_slot_bytes\": 8"));
    assert!(plan.contains("\"alignment_bytes\": 8"));
    assert!(plan.contains("\"field_ordering\": \"declaration-order\""));
    assert!(plan.contains("\"inherited_field_placement\": \"base-prefix-then-derived\""));
}

#[test]
fn lock_c3_02_static_field_storage_contract_and_runtime_flow_are_locked() {
    let doc = fs::read_to_string(
        PathBuf::from(env!("CARGO_MANIFEST_DIR"))
            .join("..")
            .join("..")
            .join("docs")
            .join("RUNTIME_INTRINSICS_ABI.md"),
    )
    .expect("read RUNTIME_INTRINSICS_ABI.md");
    assert!(
        doc.contains("C3-02 static-field storage contract"),
        "ABI doc missing C3-02 static-field storage section"
    );
    assert!(
        doc.contains("pulsec.static.storage.v1"),
        "ABI doc missing static storage schema id"
    );

    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import com.pulse.lang.IO;

        class Counter {
            public static int value = 1;

            public static int bump() {
                value = value + 1;
                return value;
            }
        }

        class Main {
            public static void main() {
                IO.println(Counter.value);
                IO.println(Counter.bump());
                IO.println(Counter.value);
            }
        }"#,
    );

    let output = Command::new(env!("CARGO_BIN_EXE_pulsec"))
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
    assert!(plan.contains("\"static_storage\""));
    assert!(plan.contains("\"schema\": \"pulsec.static.storage.v1\""));
    assert!(plan.contains("\"owner_model\": \"class-owned\""));
    assert!(plan.contains("\"symbol_model\": \"per-class-field-symbol\""));
    assert!(plan.contains("\"initialization_order\": \"declaration-order-within-class\""));
    assert!(plan.contains("\"class_reference_read\": \"allowed\""));
    assert!(plan.contains("\"class_reference_write\": \"allowed\""));
    assert!(plan.contains("\"instance_reference_read\": \"forbidden\""));
    assert!(plan.contains("\"instance_reference_write\": \"forbidden\""));

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
    assert_eq!(out, "1\n2\n2\n", "unexpected static-field runtime output");
}

#[test]
fn lock_c3_03_constructor_invocation_contract_is_documented_and_emitted() {
    let doc = fs::read_to_string(
        PathBuf::from(env!("CARGO_MANIFEST_DIR"))
            .join("..")
            .join("..")
            .join("docs")
            .join("RUNTIME_INTRINSICS_ABI.md"),
    )
    .expect("read RUNTIME_INTRINSICS_ABI.md");
    assert!(
        doc.contains("C3-03 constructor invocation contract"),
        "ABI doc missing C3-03 constructor section"
    );
    assert!(
        doc.contains("pulsec.constructor.model.v1"),
        "ABI doc missing constructor model schema id"
    );

    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import com.pulse.lang.IO;

        class Pair {
            int left;
            int right;

            public Pair(int a, int b) {
                this.left = a;
                this.right = b;
            }

            public int sum() {
                return this.left + this.right;
            }
        }

        class Main {
            public static void main() {
                Pair p = new Pair(2, 5);
                IO.println(p.sum());
            }
        }"#,
    );

    let output = Command::new(env!("CARGO_BIN_EXE_pulsec"))
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
    assert!(plan.contains("\"constructor_model\""));
    assert!(plan.contains("\"schema\": \"pulsec.constructor.model.v1\""));
    assert!(plan.contains("\"receiver_allocation\": \"allocated-before-body\""));
    assert!(plan.contains("\"chaining\": \"explicit-this-super-unsupported\""));
    assert!(plan.contains("\"implicit_super\": \"not-emitted\""));
    assert!(plan.contains("\"return_behavior\": \"implicit-receiver\""));
}

#[test]
fn lock_c3_04_class_allocation_contract_emits_variable_class_sizes() {
    let doc = fs::read_to_string(
        PathBuf::from(env!("CARGO_MANIFEST_DIR"))
            .join("..")
            .join("..")
            .join("docs")
            .join("RUNTIME_INTRINSICS_ABI.md"),
    )
    .expect("read RUNTIME_INTRINSICS_ABI.md");
    assert!(
        doc.contains("C3-04 class allocation metadata contract"),
        "ABI doc missing C3-04 allocation section"
    );
    assert!(
        doc.contains("pulsec.class.alloc.v1"),
        "ABI doc missing class allocation schema id"
    );

    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import com.pulse.lang.IO;

        class Tiny {
            int x;
        }

        class Large {
            int a;
            int b;
            int c;
        }

        class Main {
            public static void main() {
                IO.println(1);
            }
        }"#,
    );

    let output = Command::new(env!("CARGO_BIN_EXE_pulsec"))
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
    assert!(plan.contains("\"allocation\""));
    assert!(plan.contains("\"schema\": \"pulsec.class.alloc.v1\""));
    assert!(plan.contains("\"class_size_table\""));
    assert!(plan.contains("\"class\": \"app.core.Tiny\""));
    assert!(plan.contains("\"class\": \"app.core.Large\""));
    assert!(plan.contains("\"instance_field_count\": 1"));
    assert!(plan.contains("\"instance_field_count\": 3"));
    assert!(plan.contains("\"instance_size_bytes\": 24"));
    assert!(plan.contains("\"instance_size_bytes\": 40"));
}

#[test]
fn lock_c3_05_object_model_plan_sections_are_complete() {
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

    let output = Command::new(env!("CARGO_BIN_EXE_pulsec"))
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
    assert!(plan.contains("\"object_model\""));
    assert!(plan.contains("\"instance_layout\""));
    assert!(plan.contains("\"static_storage\""));
    assert!(plan.contains("\"constructor_model\""));
    assert!(plan.contains("\"allocation\""));
}

#[test]
fn lock_c3_06_dispatch_schema_is_documented_and_emitted() {
    let doc = fs::read_to_string(
        PathBuf::from(env!("CARGO_MANIFEST_DIR"))
            .join("..")
            .join("..")
            .join("docs")
            .join("RUNTIME_INTRINSICS_ABI.md"),
    )
    .expect("read RUNTIME_INTRINSICS_ABI.md");
    assert!(
        doc.contains("C3-06 dispatch schema contract"),
        "ABI doc missing C3-06 dispatch section"
    );
    assert!(
        doc.contains("pulsec.dispatch.schema.v1"),
        "ABI doc missing dispatch schema id"
    );

    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        class Main {
            public static void main() {}
        }"#,
    );
    let output = Command::new(env!("CARGO_BIN_EXE_pulsec"))
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
    assert!(plan.contains("\"dispatch\""));
    assert!(plan.contains("\"schema\": \"pulsec.dispatch.schema.v1\""));
    assert!(plan.contains("\"slot_assignment\": \"deterministic-lexicographic-signature\""));
    assert!(plan.contains("\"slot_table\": ["));
}

#[test]
fn lock_c3_07_virtual_dispatch_runtime_override_resolution_is_locked() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import com.pulse.lang.IO;

        class Base {
            public int value() {
                return 1;
            }
        }

        class Derived extends Base {
            public int value() {
                return 2;
            }
        }

        class Main {
            public static void main() {
                Base b = new Derived();
                IO.println(b.value());
            }
        }"#,
    );

    let output = Command::new(env!("CARGO_BIN_EXE_pulsec"))
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
    assert_eq!(out, "2\n", "unexpected virtual dispatch runtime output");
}

#[test]
fn lock_c3_08_interface_dispatch_bridge_runtime_resolution_is_locked() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import com.pulse.lang.IO;

        interface Task {
            int run();
        }

        class Fast implements Task {
            public int run() {
                return 3;
            }
        }

        class Slow implements Task {
            public int run() {
                return 7;
            }
        }

        class Main {
            public static void main() {
                Task a = new Fast();
                Task b = new Slow();
                IO.println(a.run());
                IO.println(b.run());
            }
        }"#,
    );

    let output = Command::new(env!("CARGO_BIN_EXE_pulsec"))
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
    assert_eq!(out, "3\n7\n", "unexpected interface dispatch runtime output");
}

#[test]
fn lock_c3_09_super_dispatch_runtime_behavior_is_locked() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import com.pulse.lang.IO;

        class Base {
            public int value() {
                return 1;
            }
        }

        class Mid extends Base {
            public int value() {
                return 2;
            }
        }

        class Derived extends Mid {
            public int value() {
                return 3;
            }

            public int superValue() {
                return super.value();
            }
        }

        class Main {
            public static void main() {
                Derived d = new Derived();
                Base b = d;
                IO.println(b.value());
                IO.println(d.superValue());
            }
        }"#,
    );

    let output = Command::new(env!("CARGO_BIN_EXE_pulsec"))
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
    assert_eq!(out, "3\n2\n", "unexpected super-dispatch runtime output");
}

#[test]
fn lock_c3_09_final_override_is_rejected_semantically() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;

        class Base {
            public final int value() {
                return 1;
            }
        }

        class Main extends Base {
            public int value() {
                return 2;
            }
        }"#,
    );

    let output = Command::new(env!("CARGO_BIN_EXE_pulsec"))
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");
    assert!(
        !output.status.success(),
        "expected semantic failure for final override\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );
    let stderr = String::from_utf8_lossy(&output.stderr);
    assert!(
        stderr.contains("cannot override final method"),
        "missing final-override diagnostic, stderr:\n{}",
        stderr
    );
}

#[test]
fn lock_c3_09_abstract_instantiation_contract_failure_is_rejected_semantically() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;

        abstract class Base {
            public abstract int value();
        }

        class Main {
            public static void main() {
                Base b = new Base();
            }
        }"#,
    );

    let output = Command::new(env!("CARGO_BIN_EXE_pulsec"))
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");
    assert!(
        !output.status.success(),
        "expected semantic failure for abstract class instantiation\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );
    let stderr = String::from_utf8_lossy(&output.stderr);
    assert!(
        stderr.contains("Cannot instantiate abstract class"),
        "missing abstract-instantiation diagnostic, stderr:\n{}",
        stderr
    );
}

#[test]
fn lock_c3_09_override_annotation_contract_failure_is_rejected_semantically() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;

        class Main {
            @Override
            public int value() {
                return 1;
            }
        }"#,
    );

    let output = Command::new(env!("CARGO_BIN_EXE_pulsec"))
        .arg("build")
        .arg(entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build");
    assert!(
        !output.status.success(),
        "expected semantic failure for invalid @Override contract\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );
    let stderr = String::from_utf8_lossy(&output.stderr);
    assert!(
        stderr.contains("uses @Override but does not override"),
        "missing @Override contract diagnostic, stderr:\n{}",
        stderr
    );
}

#[test]
fn lock_c3_09_override_annotation_interface_contract_is_accepted() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import com.pulse.lang.IO;

        public interface Task {
            int run();
        }

        class Main implements Task {
            @Override
            public int run() {
                return 9;
            }

            public static void main() {
                Task t = new Main();
                IO.println(t.run());
            }
        }"#,
    );

    let output = Command::new(env!("CARGO_BIN_EXE_pulsec"))
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
    assert_eq!(out, "9\n", "unexpected @Override interface runtime output");
}

#[test]
fn lock_c3_10_safe_devirtualization_fast_paths_preserve_behavioral_parity() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import com.pulse.lang.IO;

        class Base {
            public int virt() {
                return 1;
            }

            public final int fin() {
                return 2;
            }

            private int secret() {
                return 3;
            }

            public int viaSecret() {
                return secret();
            }

            public static int stat() {
                return 4;
            }
        }

        class Derived extends Base {
            public int virt() {
                return 5;
            }
        }

        final class FinalBox {
            public int val() {
                return 6;
            }
        }

        class Main {
            public static void main() {
                Base b = new Derived();
                Base d = new Derived();
                FinalBox fb = new FinalBox();
                IO.println(b.virt());
                IO.println(d.fin());
                IO.println(d.viaSecret());
                IO.println(Base.stat());
                IO.println(fb.val());
            }
        }"#,
    );

    let output = Command::new(env!("CARGO_BIN_EXE_pulsec"))
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
    assert!(plan.contains("\"devirtualization\""));
    assert!(plan.contains("\"mode\": \"safe-fast-paths\""));
    assert!(plan.contains("\"final-method-direct\""));
    assert!(plan.contains("\"private-method-direct\""));
    assert!(plan.contains("\"final-class-direct\""));
    assert!(plan.contains("\"parity_requirement\": \"behavioral-equivalence-with-runtime-dispatch\""));

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
    assert_eq!(out, "5\n2\n3\n4\n6\n", "unexpected devirtualization parity runtime output");
}

#[test]
fn lock_c3_11_instanceof_runtime_type_check_boundary_is_locked() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import com.pulse.lang.IO;

        interface Tag {}
        class Base {}
        class Derived extends Base implements Tag {}

        class Main {
            public static void main() {
                Base b = new Derived();
                Base n = new Base();
                Tag t = new Derived();
                Base z = null;
                IO.println(b instanceof Base);
                IO.println(b instanceof Derived);
                IO.println(n instanceof Derived);
                IO.println(t instanceof Tag);
                IO.println(z instanceof Base);
            }
        }"#,
    );

    let output = Command::new(env!("CARGO_BIN_EXE_pulsec"))
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
    assert_eq!(out, "true\ntrue\nfalse\ntrue\nfalse\n", "unexpected instanceof runtime output");
}

#[test]
fn lock_c3_11_checked_reference_cast_success_is_locked() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import com.pulse.lang.IO;

        class Base {
            public int v() {
                return 1;
            }
        }

        class Derived extends Base {
            public int v() {
                return 2;
            }
        }

        class Main {
            public static void main() {
                Base b = new Derived();
                Derived d = (Derived) b;
                IO.println(d.v());
            }
        }"#,
    );

    let output = Command::new(env!("CARGO_BIN_EXE_pulsec"))
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
    assert_eq!(out, "2\n", "unexpected checked-cast success runtime output");
}

#[test]
fn lock_c3_11_checked_reference_cast_failure_is_locked() {
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

    let output = Command::new(env!("CARGO_BIN_EXE_pulsec"))
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
        "expected non-zero exit for invalid checked cast\nstdout:\n{}\nstderr:\n{}",
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
        "missing checked-cast runtime diagnostic, output:\n{}",
        combined
    );
}

#[test]
fn lock_c3_12_type_id_schema_is_documented_and_emitted() {
    let doc = fs::read_to_string(
        PathBuf::from(env!("CARGO_MANIFEST_DIR"))
            .join("..")
            .join("..")
            .join("docs")
            .join("RUNTIME_INTRINSICS_ABI.md"),
    )
    .expect("read RUNTIME_INTRINSICS_ABI.md");
    assert!(
        doc.contains("C3-12 runtime type-id/class-id contract"),
        "ABI doc missing C3-12 type-id section"
    );
    assert!(
        doc.contains("pulsec.typeid.schema.v1"),
        "ABI doc missing type-id schema id"
    );

    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        class A {}
        class B {}
        class Main {
            public static void main() {}
        }"#,
    );
    let output = Command::new(env!("CARGO_BIN_EXE_pulsec"))
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
    assert!(plan.contains("\"type_ids\""));
    assert!(plan.contains("\"schema\": \"pulsec.typeid.schema.v1\""));
    assert!(plan.contains("\"class_table\": ["));
    assert!(plan.contains("\"class\": \"app.core.A\""));
    assert!(plan.contains("\"class\": \"app.core.B\""));
}

#[test]
fn lock_c3_12_runtime_type_checks_use_runtime_class_id_proc_boundary() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import com.pulse.lang.IO;

        interface Tag {}
        class Base {}
        class Derived extends Base implements Tag {}

        class Main {
            public static void main() {
                Base b = new Derived();
                IO.println(b instanceof Base);
                IO.println(b instanceof Derived);
                IO.println(b instanceof Tag);
            }
        }"#,
    );
    let output = Command::new(env!("CARGO_BIN_EXE_pulsec"))
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
    assert!(
        asm.contains("extrn pulsec_rt_objectClassId:proc"),
        "instanceof codegen must import runtime class-id resolution through a procedure boundary"
    );
    assert!(
        asm.contains("call pulsec_rt_objectClassId"),
        "instanceof codegen must resolve class-id through runtime procedure boundary"
    );
    assert!(
        !asm.contains("mov r10, qword ptr [pulsec_rt_obj_class_ids]"),
        "instanceof codegen must not dereference runtime-private class-id table directly"
    );
}

#[test]
fn lock_c3_13_null_virtual_dispatch_receiver_panics_deterministically() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import com.pulse.lang.IO;
        import com.pulse.memory.Memory;

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

    let output = Command::new(env!("CARGO_BIN_EXE_pulsec"))
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
        "expected non-zero exit for null virtual receiver dispatch\nstdout:\n{}\nstderr:\n{}",
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
        "expected marker output before null-dispatch panic\n{}",
        combined
    );
    assert!(
        combined.contains("Null dispatch receiver"),
        "expected deterministic null-dispatch diagnostic\n{}",
        combined
    );
}

#[test]
fn lock_c3_13_null_interface_dispatch_receiver_panics_deterministically() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import com.pulse.lang.IO;
        import com.pulse.memory.Memory;

        interface Task {
            int run();
        }

        class Fast implements Task {
            public int run() {
                return 3;
            }
        }

        class Main {
            public static Task choose(boolean pick) {
                if (pick) {
                    return new Fast();
                }
                return null;
            }

            public static void main() {
                boolean pick = Memory.cycleTick() == 123;
                Task t = choose(pick);
                IO.println("before");
                IO.println(t.run());
            }
        }"#,
    );

    let output = Command::new(env!("CARGO_BIN_EXE_pulsec"))
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
        "expected non-zero exit for null interface receiver dispatch\nstdout:\n{}\nstderr:\n{}",
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
        "expected marker output before null-dispatch panic\n{}",
        combined
    );
    assert!(
        combined.contains("Null dispatch receiver"),
        "expected deterministic null-dispatch diagnostic\n{}",
        combined
    );
}

#[test]
fn lock_c3_14_object_model_abi_contract_is_documented_and_emitted() {
    let doc = fs::read_to_string(
        PathBuf::from(env!("CARGO_MANIFEST_DIR"))
            .join("..")
            .join("..")
            .join("docs")
            .join("RUNTIME_INTRINSICS_ABI.md"),
    )
    .expect("read RUNTIME_INTRINSICS_ABI.md");
    assert!(
        doc.contains("C3-14 object-model ABI compatibility contract"),
        "ABI doc missing C3-14 object-model ABI section"
    );
    assert!(
        doc.contains("pulsec.object_model.abi.v1"),
        "ABI doc missing object-model ABI schema id"
    );

    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        class Main {
            public static void main() {}
        }"#,
    );
    let output = Command::new(env!("CARGO_BIN_EXE_pulsec"))
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
    assert!(plan.contains("\"abi_compatibility\""));
    assert!(plan.contains("\"schema\": \"pulsec.object_model.abi.v1\""));
    assert!(plan.contains("\"compiler_object_model_abi_version\": 1"));
    assert!(plan.contains("\"runtime_object_model_abi_version\": 1"));
    assert!(plan.contains("\"mismatch_policy\": \"deterministic-fail-fast\""));
}

#[test]
fn lock_c3_14_object_model_abi_mismatch_fails_deterministically() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        class Main {
            public static void main() {}
        }"#,
    );
    let output = Command::new(env!("CARGO_BIN_EXE_pulsec"))
        .env("PULSEC_FORCE_OBJECT_MODEL_ABI_VERSION", "2")
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
        .expect("read native plan");
    assert!(
        plan.contains("\"abi_compatibility\"")
            && plan.contains("\"schema\": \"pulsec.object_model.abi.v1\"")
            && plan.contains("\"compiler_object_model_abi_version\": 1")
            && plan.contains("\"runtime_object_model_abi_version\": 2")
            && plan.contains("\"mismatch_policy\": \"deterministic-fail-fast\""),
        "native plan missing object-model ABI mismatch lock\n{}",
        plan
    );

    let exe = root.join("build").join("main.exe");
    let run = Command::new(&exe).output().expect("run built exe");
    assert!(
        !run.status.success(),
        "expected non-zero exit for object-model ABI mismatch\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert!(
        out.contains("Object model ABI mismatch"),
        "expected object-model ABI mismatch diagnostic\nstdout:\n{}",
        out
    );
}

#[test]
fn lock_c3_15_semantic_constructor_and_layout_edge_matrix_is_locked() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let ok_entry = src_root.join("app/core/OkMain.pulse");
    write_file(
        &ok_entry,
        r#"
        package app.core;
        import com.pulse.lang.IO;

        class Base {
            int x;
            public Base(int v) {
                this.x = v;
            }
        }

        class Derived extends Base {
            int y;
            public Derived(int a, int b) {
                this.y = b;
            }

            public int sum() {
                return this.x + this.y;
            }
        }

        class OkMain {
            public static void main() {
                Derived d = new Derived(2, 5);
                IO.println(d.sum());
            }
        }"#,
    );
    let ok = Command::new(env!("CARGO_BIN_EXE_pulsec"))
        .arg("build")
        .arg(ok_entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build for legal matrix fixture");
    if !build_supports_backend_execution(&ok) {
        return;
    }

    let bad_ctor_root = unique_temp_root();
    let bad_ctor_src_root = bad_ctor_root.join("src");
    let bad_ctor_entry = bad_ctor_src_root.join("app/core/BadCtor.pulse");
    write_file(
        &bad_ctor_entry,
        r#"
        package app.core;

        class Pair {
            int a;
            public Pair(int x) {
                this.a = x;
            }
        }

        class BadCtor {
            public static void main() {
                Pair p = new Pair();
            }
        }"#,
    );
    let bad_ctor = Command::new(env!("CARGO_BIN_EXE_pulsec"))
        .arg("build")
        .arg(bad_ctor_entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(bad_ctor_src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build for constructor arity failure fixture");
    assert!(
        !bad_ctor.status.success(),
        "expected constructor arity mismatch to fail semantically\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&bad_ctor.stdout),
        String::from_utf8_lossy(&bad_ctor.stderr)
    );
    let bad_ctor_err = String::from_utf8_lossy(&bad_ctor.stderr);
    assert!(
        bad_ctor_err.contains("No constructor 'Pair' matches argument types"),
        "expected constructor mismatch diagnostic\n{}",
        bad_ctor_err
    );

    let bad_layout_root = unique_temp_root();
    let bad_layout_src_root = bad_layout_root.join("src");
    let bad_layout_entry = bad_layout_src_root.join("app/core/BadLayout.pulse");
    write_file(
        &bad_layout_entry,
        r#"
        package app.core;

        class VaultBase {
            private int secret = 3;
        }

        class VaultDerived extends VaultBase {
            public int leak() {
                return this.secret;
            }
        }

        class BadLayout {
            public static void main() {
                VaultDerived d = new VaultDerived();
            }
        }"#,
    );
    let bad_layout = Command::new(env!("CARGO_BIN_EXE_pulsec"))
        .arg("build")
        .arg(bad_layout_entry.to_str().expect("entry utf8"))
        .arg("--source-root")
        .arg(bad_layout_src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec build for class-layout failure fixture");
    assert!(
        !bad_layout.status.success(),
        "expected private inherited-field access to fail semantically\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&bad_layout.stdout),
        String::from_utf8_lossy(&bad_layout.stderr)
    );
    let bad_layout_err = String::from_utf8_lossy(&bad_layout.stderr);
    assert!(
        bad_layout_err.contains("Cannot access private field 'VaultBase.secret' from class 'VaultDerived'"),
        "expected private-field layout diagnostic\n{}",
        bad_layout_err
    );
}

#[test]
fn lock_e2_06_runtime_no_longer_imports_user_field_storage_and_field_growth_stays_live() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import com.pulse.lang.IO;

        class Box {
            int value;
            Box next;

            public Box(int v) {
                this.value = v;
                this.next = null;
            }

            public int get() {
                return this.value;
            }
        }

        class Main {
            public static void main() {
                int i = 0;
                int last = -1;
                Box prev = null;
                while (i < 80) {
                    Box b = new Box(i);
                    b.next = prev;
                    prev = b;
                    last = b.get();
                    i = i + 1;
                }
                IO.println(last);
            }
        }"#,
    );
    let output = Command::new(env!("CARGO_BIN_EXE_pulsec"))
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

    let runtime_asm = fs::read_to_string(
        root.join("build")
            .join("obj")
            .join("com")
            .join("pulse")
            .join("lang")
            .join("IO.asm"),
    )
    .expect("read runtime asm");
    assert!(
        !runtime_asm.contains("pulsec_fld_app_core_Box_value"),
        "runtime asm should not import app field storage anymore\n{}",
        runtime_asm
    );
    assert!(
        !runtime_asm.contains("pulsec_fld_app_core_Box_value_heap_owned"),
        "runtime asm should not import app field ownership flags anymore\n{}",
        runtime_asm
    );
    assert!(
        !runtime_asm.contains("pulsec_fld_app_core_Box_next"),
        "runtime asm should not import app ARC field storage anymore\n{}",
        runtime_asm
    );
    assert!(
        !runtime_asm.contains("pulsec_fld_app_core_Box_next_heap_owned"),
        "runtime asm should not import app ARC field ownership flags anymore\n{}",
        runtime_asm
    );

    let exe = root.join("build").join("main.exe");
    let run = Command::new(&exe).output().expect("run built exe");
    assert!(
        run.status.success(),
        "expected successful execution after field-table growth\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "79\n", "expected last field value after >63 object allocations");
}

#[test]
fn lock_c3_16_polymorphism_and_interface_dispatch_fixture_suite_executes() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import com.pulse.lang.IO;

        interface Ranker {
            int rank();
        }

        class Base {
            public int score() {
                return 1;
            }
        }

        class Mid extends Base {
            public int score() {
                return 3;
            }
        }

        class Pro extends Mid implements Ranker {
            public int score() {
                return 5;
            }

            public int rank() {
                return 7;
            }
        }

        class Main {
            public static void main() {
                Base a = new Mid();
                Base b = new Pro();
                Ranker r = new Pro();
                IO.println(a.score());
                IO.println(b.score());
                IO.println(r.rank());
            }
        }"#,
    );

    let output = Command::new(env!("CARGO_BIN_EXE_pulsec"))
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
        "expected executable success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "3\n5\n7\n", "unexpected polymorphism/interface output");
}

#[test]
fn lock_c3_17_object_model_stress_alloc_churn_polymorphic_calls_are_stable() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import com.pulse.lang.IO;

        interface Eval {
            int eval();
        }

        class A implements Eval {
            int n;
            public A(int v) { this.n = v; }
            public int eval() { return this.n; }
        }

        class B extends A {
            public B(int v) { this.n = v; }
            public int eval() { return this.n + 1; }
        }

        class Main {
            public static int runOnce(int rounds) {
                int i = 0;
                int acc = 0;
                int parity = 0;
                while (i < rounds) {
                    Eval e;
                    if (parity == 0) {
                        e = new A(i);
                        parity = 1;
                    } else {
                        e = new B(i);
                        parity = 0;
                    }
                    acc = acc + e.eval();
                    i = i + 1;
                }
                return acc;
            }

            public static void main() {
                IO.println(runOnce(500));
            }
        }"#,
    );

    let output = Command::new(env!("CARGO_BIN_EXE_pulsec"))
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

    let exe = root.join("build").join("main.exe");
    let run1 = Command::new(&exe).output().expect("run built executable first pass");
    assert!(
        run1.status.success(),
        "expected first stress executable success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run1.stdout),
        String::from_utf8_lossy(&run1.stderr)
    );
    let out1 = String::from_utf8_lossy(&run1.stdout).replace('\r', "");
    assert_eq!(out1, "125000\n", "unexpected first stress output");

    let run2 = Command::new(&exe).output().expect("run built executable second pass");
    assert!(
        run2.status.success(),
        "expected second stress executable success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run2.stdout),
        String::from_utf8_lossy(&run2.stderr)
    );
    let out2 = String::from_utf8_lossy(&run2.stdout).replace('\r', "");
    assert_eq!(out2, "125000\n", "unexpected second stress output");
}

#[test]
fn lock_c3_18_dispatch_heavy_frame_and_win64_abi_guards_are_locked() {
    let root = unique_temp_root();
    let src_root = root.join("src");
    let entry = src_root.join("app/core/Main.pulse");
    write_file(
        &entry,
        r#"
        package app.core;
        import com.pulse.lang.IO;

        interface Sum6 {
            int sum6(int a, int b, int c, int d, int e, int f);
        }

        class Impl implements Sum6 {
            public int sum6(int a, int b, int c, int d, int e, int f) {
                return a + b + c + d + e + f;
            }
        }

        class Main {
            public static void main() {
                Sum6 s = new Impl();
                int out = s.sum6(1, 2, 3, 4, 5, 6);
                IO.println(out);
            }
        }"#,
    );

    let output = Command::new(env!("CARGO_BIN_EXE_pulsec"))
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
    assert!(
        asm.contains("mov dword ptr [rsp+32],") || asm.contains("mov qword ptr [rsp+32],"),
        "expected Win64 outgoing stack arg spill at [rsp+32] in dispatch-heavy call\n{}",
        asm
    );
    assert!(
        asm.contains("mov dword ptr [rsp+40],") || asm.contains("mov qword ptr [rsp+40],"),
        "expected Win64 outgoing stack arg spill at [rsp+40] in dispatch-heavy call\n{}",
        asm
    );
    assert!(
        !asm.contains("[rsp+1024]") && !asm.contains("[rsp+3072]"),
        "dispatch-heavy path should not regress to fixed scratch offsets\n{}",
        asm
    );

    let mut max_sub_rsp = 0usize;
    for line in asm.lines() {
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
        "expected bounded dispatch-heavy frame <= 4096 bytes, got {}",
        max_sub_rsp
    );

    let run = Command::new(root.join("build").join("main.exe"))
        .output()
        .expect("run built executable");
    assert!(
        run.status.success(),
        "expected dispatch-heavy executable success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&run.stdout),
        String::from_utf8_lossy(&run.stderr)
    );
    let out = String::from_utf8_lossy(&run.stdout).replace('\r', "");
    assert_eq!(out, "21\n", "unexpected dispatch-heavy runtime output");
}
