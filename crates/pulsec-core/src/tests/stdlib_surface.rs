use super::*;

#[test]
fn check_accepts_com_pulse_math_and_collections_baseline() {
    let src = r#"
        package app.core;
        import com.pulse.lang.IO;
        import com.pulse.math.Math;
        import com.pulse.collections.Array;
        import com.pulse.collections.Collection;
        import com.pulse.collections.ArrayList;
        import com.pulse.collections.List;
        import com.pulse.collections.Map;

        class Main {
            public static void main() {
                List values = new ArrayList();
                values.add(10);
                values.add(5);
                Collection base = new ArrayList();
                base.size();
                Array arr = new Array(2);
                arr.setInt(0, values.getInt(0));
                arr.setInt(1, values.getInt(1));

                ArrayList copy = new ArrayList();
                copy.add(arr.getInt(0));
                copy.add(arr.getInt(1));

                Map stats = new Map();
                stats.putInt("hp", Math.max(copy.getInt(0), copy.getInt(1)));

                IO.println(stats.getInt("hp"));
                IO.println(Math.PI);
            }
        }
    "#;

    check(src).expect("com.pulse baseline classes should typecheck");
}

#[test]
fn check_accepts_static_imports_from_com_pulse_math() {
    let src = r#"
        package app.core;
        import com.pulse.lang.IO;
        import static com.pulse.math.Math.PI;
        import static com.pulse.math.Math.abs;

        class Main {
            public static void main() {
                int x = abs(-3);
                IO.println(x);
                IO.println(PI);
            }
        }
    "#;

    check(src).expect("static imports from com.pulse math should typecheck");
}

#[test]
fn check_accepts_math_min_and_clamp_and_random_usage() {
    let src = r#"
        package app.core;
        import com.pulse.lang.IO;
        import com.pulse.math.Math;
        import com.pulse.math.Random;

        class Main {
            public static void main() {
                int a = Math.min(2, 9);
                int b = Math.clamp(12, 0, 10);
                Random r = new Random(7);
                int n = r.nextInt(10);
                IO.println(a);
                IO.println(b);
                IO.println(n);
            }
        }
    "#;

    check(src).expect("math min/clamp and seeded random usage should typecheck");
}

#[test]
fn check_accepts_io_file_path_files_and_stream_surface() {
    let src = r#"
        package app.core;
        import com.pulse.io.Path;
        import com.pulse.io.File;
        import com.pulse.io.Files;
        import com.pulse.io.InputStream;
        import com.pulse.io.OutputStream;

        class Main {
            public static void main() {
                String p = Path.combine("tmp", "log.txt");
                File.writeAllText(p, "A");
                File.appendText(p, "B");
                boolean ok = File.exists(p);
                String a = File.readAllText(p);

                Files.writeString("x", "1");
                Files.appendString("x", "2");
                String b = Files.readString("x");

                OutputStream out = new OutputStream(p);
                out.append("C");
                InputStream input = new InputStream(p);
                String c = input.readAll();
            }
        }
    "#;

    check(src).expect("file/path/files and stream surface should typecheck");
}

#[test]
fn check_accepts_time_instant_and_duration_surface() {
    let src = r#"
        package app.core;
        import com.pulse.time.Instant;
        import com.pulse.time.Duration;

        class Main {
            public static void main() {
                Instant a = Instant.now();
                Instant b = a.plusMillis(5);
                int at = a.toEpochMillis();
                int bt = b.toEpochMillis();

                Duration d1 = Duration.ofMillis(9);
                Duration d2 = new Duration(4);
                Duration d3 = d1.plus(d2);
                Duration d4 = d3.minus(d2);
                int ms = d4.toMillis();
            }
        }
    "#;

    check(src).expect("instant/duration surface should typecheck");
}

#[test]
fn check_rejects_static_import_visibility_with_duplicate_main_names_across_packages() {
    let main_one = r#"
        package app.one;
        class Main {
            public static void main() {
            }
        }
    "#;
    let util_one = r#"
        package app.one;
        class Util {
            static int secret() {
                return 1;
            }
        }
    "#;
    let main_two = r#"
        package app.two;
        import static app.one.Util.secret;

        class Main {
            public static void main() {
                IO.println(secret());
            }
        }
    "#;

    let err = analyze_merged_with_contexts(&[main_one, util_one, main_two])
        .expect_err("package-private static import should not leak across packages");
    assert!(err
        .to_string()
        .contains("No method 'secret' matches argument types () in class 'Main'"));
}

#[test]
fn check_accepts_prelude_class_types_in_declarations_without_imports() {
    let src = r#"
        package app.core;

        class Main {
            private List values;
            private Collection base;

            public static void main() {
                List local = new ArrayList();
                Collection c = new ArrayList();
                c.clear();
                IO.println(local.size());
            }
        }
    "#;

    check(src).expect("prelude class fallback should also resolve declaration type positions");
}

#[test]
fn check_accepts_arraylist_for_collection_and_list_contracts() {
    let src = r#"
        package app.core;
        import com.pulse.collections.Collection;
        import com.pulse.collections.List;
        import com.pulse.collections.ArrayList;

        class Main {
            public static void main() {
                Collection c = new ArrayList();
                List l = new ArrayList();
                c.clear();
                l.add(1);
            }
        }
    "#;

    check(src).expect("ArrayList should satisfy both Collection and List contracts");
}

#[test]
fn check_accepts_arraylist_crud_surface_calls() {
    let src = r#"
        package app.core;
        import com.pulse.collections.ArrayList;
        import com.pulse.collections.List;

        class Main {
            public static void main() {
                List list = new ArrayList();
                list.add(1);
                list.add("v");
                int a = list.getInt(0);
                String b = list.getString(1);
                list.clear();
                int c = list.size();
            }
        }
    "#;

    check(src).expect("ArrayList CRUD surface should typecheck through List contract");
}

#[test]
fn check_accepts_linkedlist_for_collection_and_list_contracts() {
    let src = r#"
        package app.core;
        import com.pulse.collections.Collection;
        import com.pulse.collections.List;
        import com.pulse.collections.LinkedList;

        class Main {
            public static void main() {
                Collection c = new LinkedList();
                List l = new LinkedList();
                c.clear();
                l.add(1);
                int v = l.getInt(0);
            }
        }
    "#;

    check(src).expect("LinkedList should satisfy both Collection and List contracts");
}

#[test]
fn check_accepts_hashset_and_hashmap_core_operations() {
    let src = r#"
        package app.core;
        import com.pulse.collections.Set;
        import com.pulse.collections.HashSet;
        import com.pulse.collections.HashMap;

        class Main {
            public static void main() {
                Set s = new HashSet();
                s.add("a");
                boolean has = s.contains("a");
                int n = s.size();
                s.clear();

                HashMap m = new HashMap();
                m.put("k", "v");
                m.putInt("n", 3);
                String v = m.get("k");
                int x = m.getInt("n");
                boolean ok = m.containsKey("k");
                m.clear();
            }
        }
    "#;

    check(src).expect("HashSet/HashMap operations should typecheck");
}

#[test]
fn check_accepts_linkedlist_queue_and_deque_operations() {
    let src = r#"
        package app.core;
        import com.pulse.collections.Queue;
        import com.pulse.collections.Deque;
        import com.pulse.collections.LinkedList;

        class Main {
            public static void main() {
                Queue q = new LinkedList();
                q.offer(10);
                int a = q.poll();
                boolean emptyQ = q.isEmpty();

                Deque d = new LinkedList();
                d.addFirst(1);
                d.addLast(2);
                int b = d.removeFirst();
                int c = d.removeLast();
                boolean emptyD = d.isEmpty();
            }
        }
    "#;

    check(src).expect("LinkedList should satisfy Queue/Deque contracts");
}


