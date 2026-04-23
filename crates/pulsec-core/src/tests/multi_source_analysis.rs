use super::*;

fn analyze_merged_with_contexts(sources: &[&str]) -> Result<(), crate::SemanticError> {
    let parsed = sources
        .iter()
        .map(|src| parse(src).expect("source should parse"))
        .collect::<Vec<_>>();
    let root = parsed.first().expect("at least one source");

    let mut classes = Vec::new();
    let mut contexts = Vec::new();
    for program in &parsed {
        for class in &program.classes {
            classes.push(class.clone());
            contexts.push(ClassContext {
                package_name: program.package.name.clone(),
                imports: program.imports.clone(),
            });
        }
    }

    let merged = Program {
        package: root.package.clone(),
        imports: root.imports.clone(),
        classes,
    };
    analyze_with_class_contexts(&merged, &contexts)
}

#[test]
fn check_rejects_ambiguous_type_in_field_declaration() {
    let main = r#"
        package app.core;
        import app.shared.*;
        import app.tools.*;

        class Main {
            Util u;
            public static void main() {
            }
        }
    "#;
    let shared = r#"
        package app.shared;
        import pulse.lang.IO;

        class Util {
        }
    "#;
    let tools = r#"
        package app.tools;
        import pulse.lang.IO;

        class Util {
        }
    "#;

    let err = analyze_merged_with_contexts(&[main, shared, tools])
        .expect_err("ambiguous field type should fail");
    assert!(err.to_string().contains("Ambiguous type reference 'Util'"));
}

#[test]
fn check_rejects_ambiguous_type_in_method_param() {
    let main = r#"
        package app.core;
        import app.shared.*;
        import app.tools.*;

        class Main {
            public int pick(Util u) {
                return 1;
            }
            public static void main() {
            }
        }
    "#;
    let shared = r#"
        package app.shared;
        import pulse.lang.IO;

        class Util {
        }
    "#;
    let tools = r#"
        package app.tools;
        import pulse.lang.IO;

        class Util {
        }
    "#;

    let err = analyze_merged_with_contexts(&[main, shared, tools])
        .expect_err("ambiguous param type should fail");
    assert!(err.to_string().contains("Ambiguous type reference 'Util'"));
}

#[test]
fn check_rejects_ambiguous_type_in_method_return() {
    let main = r#"
        package app.core;
        import app.shared.*;
        import app.tools.*;

        class Main {
            public Util pick() {
                return null;
            }
            public static void main() {
            }
        }
    "#;
    let shared = r#"
        package app.shared;
        import pulse.lang.IO;

        class Util {
        }
    "#;
    let tools = r#"
        package app.tools;
        import pulse.lang.IO;

        class Util {
        }
    "#;

    let err = analyze_merged_with_contexts(&[main, shared, tools])
        .expect_err("ambiguous return type should fail");
    assert!(err.to_string().contains("Ambiguous type reference 'Util'"));
}

#[test]
fn check_rejects_ambiguous_type_in_local_declaration() {
    let main = r#"
        package app.core;
        import app.shared.*;
        import app.tools.*;

        class Main {
            public static void main() {
                Util u = null;
            }
        }
    "#;
    let shared = r#"
        package app.shared;
        import pulse.lang.IO;

        class Util {
        }
    "#;
    let tools = r#"
        package app.tools;
        import pulse.lang.IO;

        class Util {
        }
    "#;

    let err = analyze_merged_with_contexts(&[main, shared, tools])
        .expect_err("ambiguous local type should fail");
    assert!(err.to_string().contains("Ambiguous type reference 'Util'"));
}

#[test]
fn check_accepts_non_void_method_with_if_else_definite_return() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public int pick(int x) {
                if (x > 0) {
                    return 1;
                } else {
                    return 0;
                }
            }

            public static void main() {
            }
        }
    "#;

    check(src).expect("if/else return should satisfy definite return");
}

#[test]
fn check_rejects_non_boolean_for_condition() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static void main() {
                for (int i = 0; i + 1; i = i + 1) {
                    IO.println(i);
                }
            }
        }
    "#;

    let err = check(src).expect_err("for condition must be boolean");
    assert!(err.to_string().contains("For condition"));
}

#[test]
fn check_rejects_constructor_signature_mismatch() {
    let src = r#"
        package app.core;

        import pulse.lang.IO;


        class Player {
            public Player(int hp) {
            }
        }

        class Main {
            public static void main() {
                Player p = new Player("bad");
            }
        }
    "#;

    let err = check(src).expect_err("constructor signature mismatch should fail");
    assert!(err
        .to_string()
        .contains("No constructor 'Player' matches argument types (pulse.lang.String)"));
}

#[test]
fn check_accepts_protected_access_from_subclass_across_packages() {
    let base = r#"
        package app.base;

        class Base {
            protected int hp;

            protected int readHp() {
                return this.hp;
            }
        }
    "#;
    let derived = r#"
        package app.derived;
        import app.base.Base;

        class Derived extends Base {
            public int read() {
                this.hp = 7;
                return this.readHp();
            }
        }
    "#;
    let main = r#"
        package app.main;
        import app.derived.Derived;

        class Main {
            public static void main() {
                Derived d = new Derived();
                int hp = d.read();
            }
        }
    "#;

    analyze_merged_with_contexts(&[base, derived, main])
        .expect("subclass protected access across packages should pass");
}

#[test]
fn check_rejects_protected_access_from_non_subclass_across_packages() {
    let base = r#"
        package app.base;

        class Base {
            protected int hp;
        }
    "#;
    let main = r#"
        package app.main;
        import app.base.Base;

        class Main {
            public static void main() {
                Base b = new Base();
                int hp = b.hp;
            }
        }
    "#;

    let err = analyze_merged_with_contexts(&[base, main])
        .expect_err("non-subclass protected access across packages should fail");
    assert!(err
        .to_string()
        .contains("Cannot access protected field 'Base.hp'"));
}

#[test]
fn check_rejects_protected_access_through_base_receiver_from_subclass_across_packages() {
    let base = r#"
        package app.base;

        class Base {
            protected int hp;
        }
    "#;
    let derived = r#"
        package app.derived;
        import app.base.Base;

        class Derived extends Base {
            public int read(Base other) {
                return other.hp;
            }
        }
    "#;
    let main = r#"
        package app.main;
        import app.derived.Derived;
        import app.base.Base;

        class Main {
            public static void main() {
                Derived d = new Derived();
                Base b = new Base();
                int hp = d.read(b);
            }
        }
    "#;

    let err = analyze_merged_with_contexts(&[base, derived, main]).expect_err(
        "subclass should not access protected member through base receiver across packages",
    );
    assert!(err
        .to_string()
        .contains("Cannot access protected field 'Base.hp' through receiver type 'Base'"));
}
