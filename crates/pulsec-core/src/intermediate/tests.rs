use crate::{parse, ClassContext, ImportDecl};

use super::{lower_to_ir_with_contexts, IrFieldInit, IrTerminator};

#[test]
fn lower_ir_captures_class_field_and_method_shape() {
    let src = r#"
        package app.core;
        class Main {
            private static int count;
            public static void main() {
                int x = 1;
            }
        }
    "#;

    let program = parse(src).expect("parse should succeed");
    let contexts = vec![ClassContext {
        package_name: "app.core".to_string(),
        imports: vec![],
    }];

    let ir = lower_to_ir_with_contexts(&program, &contexts).expect("ir lowering should pass");
    assert_eq!(ir.classes.len(), 1);
    assert_eq!(ir.classes[0].package_name, "app.core");
    assert_eq!(ir.classes[0].fields.len(), 1);
    assert_eq!(ir.classes[0].methods.len(), 1);
    assert_eq!(ir.classes[0].methods[0].stmt_count, 1);
    assert!(!ir.classes[0].methods[0].blocks.is_empty());
    assert!(!ir.classes[0].methods[0].values.is_empty());
}

#[test]
fn lower_ir_builds_branch_blocks_for_if() {
    let src = r#"
        package app.core;
        class Main {
            public static void main() {
                int x = 1;
                if (x > 0) {
                    x = x + 1;
                } else {
                    x = x - 1;
                }
            }
        }
    "#;

    let program = parse(src).expect("parse should succeed");
    let contexts = vec![ClassContext {
        package_name: "app.core".to_string(),
        imports: vec![],
    }];

    let ir = lower_to_ir_with_contexts(&program, &contexts).expect("ir lowering should pass");
    let method = &ir.classes[0].methods[0];
    assert!(method.blocks.len() >= 4);
    let saw_branch = method.blocks.iter().any(|b| {
        matches!(
            b.terminator,
            IrTerminator::Branch {
                then_target: _,
                else_target: _,
                ..
            }
        )
    });
    assert!(saw_branch, "expected conditional branch terminator");
}

#[test]
fn lower_ir_captures_static_field_literal_initializer() {
    let src = r#"
        package app.core;
        class Main {
            private static int count = -42;
            public static void main() {
            }
        }
    "#;

    let program = parse(src).expect("parse should succeed");
    let contexts = vec![ClassContext {
        package_name: "app.core".to_string(),
        imports: vec![],
    }];

    let ir = lower_to_ir_with_contexts(&program, &contexts).expect("ir lowering should pass");
    assert_eq!(
        ir.classes[0].fields[0].init,
        Some(IrFieldInit::Int(-42)),
        "expected static field literal initializer in IR"
    );
}

#[test]
fn lower_ir_truncates_casted_decimal_field_initializer_to_whole_number() {
    let src = r#"
        package app.core;
        class Main {
            private static int count = (int) 20.9d;
            public static void main() {
            }
        }
    "#;

    let program = parse(src).expect("parse should succeed");
    let contexts = vec![ClassContext {
        package_name: "app.core".to_string(),
        imports: vec![],
    }];

    let ir = lower_to_ir_with_contexts(&program, &contexts).expect("ir lowering should pass");
    assert_eq!(
        ir.classes[0].fields[0].init,
        Some(IrFieldInit::Int(20)),
        "expected casted decimal initializer to truncate toward zero"
    );
}

#[test]
fn lower_ir_truncates_negative_casted_decimal_field_initializers_toward_zero() {
    let src = r#"
        package app.core;
        class Main {
            private static int a = (int) (-2.9d);
            private static long b = (long) (-2.9f);
            public static void main() {
            }
        }
    "#;

    let program = parse(src).expect("parse should succeed");
    let contexts = vec![ClassContext {
        package_name: "app.core".to_string(),
        imports: vec![],
    }];

    let ir = lower_to_ir_with_contexts(&program, &contexts).expect("ir lowering should pass");
    assert_eq!(
        ir.classes[0].fields[0].init,
        Some(IrFieldInit::Int(-2)),
        "expected int cast from negative decimal to truncate toward zero"
    );
    assert_eq!(
        ir.classes[0].fields[1].init,
        Some(IrFieldInit::Int(-2)),
        "expected long cast from negative decimal to truncate toward zero"
    );
}

#[test]
fn lower_ir_captures_binary_and_unsigned_static_field_initializers() {
    let src = r#"
        package app.core;
        class Main {
            private static int minInt = -2147483647 - 1;
            private static long minLong = -9223372036854775807L - 1L;
            private static uint maxUInt = (uint) 4294967295L;
            private static ulong maxULong = (ulong) -1L;
            public static void main() {
            }
        }
    "#;

    let program = parse(src).expect("parse should succeed");
    let contexts = vec![ClassContext {
        package_name: "app.core".to_string(),
        imports: vec![],
    }];

    let ir = lower_to_ir_with_contexts(&program, &contexts).expect("ir lowering should pass");
    assert_eq!(
        ir.classes[0].fields[0].init,
        Some(IrFieldInit::Int(-2147483648)),
        "expected binary int initializer to lower as a constant"
    );
    assert_eq!(
        ir.classes[0].fields[1].init,
        Some(IrFieldInit::Int(i64::MIN)),
        "expected binary long initializer to lower as a constant"
    );
    assert_eq!(
        ir.classes[0].fields[2].init,
        Some(IrFieldInit::Int(4294967295)),
        "expected uint cast initializer to lower as a raw bit-pattern constant"
    );
    assert_eq!(
        ir.classes[0].fields[3].init,
        Some(IrFieldInit::Int(-1)),
        "expected ulong cast initializer to lower as a raw bit-pattern constant"
    );
}

#[test]
fn lower_ir_captures_same_class_static_constant_reference_initializers() {
    let src = r#"
        package app.core;
        class Main {
            private static long SECOND = 1000L;
            private static long MINUTE = 60L * SECOND;
            private static long HOUR = 60L * Main.MINUTE;
            private static long DAY = 24L * app.core.Main.HOUR;
            public static void main() {
            }
        }
    "#;

    let program = parse(src).expect("parse should succeed");
    let contexts = vec![ClassContext {
        package_name: "app.core".to_string(),
        imports: vec![],
    }];
    let ir = lower_to_ir_with_contexts(&program, &contexts).expect("lower succeeds");
    let class = ir
        .classes
        .iter()
        .find(|class| class.name == "Main")
        .expect("main class present");

    let second = class
        .fields
        .iter()
        .find(|field| field.name == "SECOND")
        .expect("SECOND field present");
    assert_eq!(second.init, Some(IrFieldInit::Int(1000)));

    let minute = class
        .fields
        .iter()
        .find(|field| field.name == "MINUTE")
        .expect("MINUTE field present");
    assert_eq!(minute.init, Some(IrFieldInit::Int(60_000)));

    let hour = class
        .fields
        .iter()
        .find(|field| field.name == "HOUR")
        .expect("HOUR field present");
    assert_eq!(hour.init, Some(IrFieldInit::Int(3_600_000)));

    let day = class
        .fields
        .iter()
        .find(|field| field.name == "DAY")
        .expect("DAY field present");
    assert_eq!(day.init, Some(IrFieldInit::Int(86_400_000)));
}

#[test]
fn lower_ir_captures_foreign_static_constant_reference_initializers_out_of_order() {
    let src = r#"
        package app.core;
        import app.core.Limits;

        class Main {
            private static int MAX = Limits.MAX;
            private static long BIG = app.core.Limits.BIG;
            private static double BIG_AS_DOUBLE = (double) Limits.BIG;
            public static void main() {
            }
        }

        class Limits {
            private static int MAX = 2147483647;
            private static long BIG = 9223372036854775807L;
            public static void main() {
            }
        }
    "#;

    let program = parse(src).expect("parse should succeed");
    let contexts = vec![
        ClassContext {
            package_name: "app.core".to_string(),
            imports: vec![ImportDecl {
                path: "app.core.Limits".to_string(),
                is_static: false,
                is_wildcard: false,
            }],
        },
        ClassContext {
            package_name: "app.core".to_string(),
            imports: vec![],
        },
    ];

    let ir = lower_to_ir_with_contexts(&program, &contexts).expect("lower succeeds");
    let main = ir
        .classes
        .iter()
        .find(|class| class.name == "Main")
        .expect("main class present");

    let max = main
        .fields
        .iter()
        .find(|field| field.name == "MAX")
        .expect("MAX field present");
    assert_eq!(max.init, Some(IrFieldInit::Int(2147483647)));

    let big = main
        .fields
        .iter()
        .find(|field| field.name == "BIG")
        .expect("BIG field present");
    assert_eq!(big.init, Some(IrFieldInit::Int(9_223_372_036_854_775_807)));

    let big_as_double = main
        .fields
        .iter()
        .find(|field| field.name == "BIG_AS_DOUBLE")
        .expect("BIG_AS_DOUBLE field present");
    assert_eq!(
        big_as_double.init,
        Some(IrFieldInit::Double(
            (9_223_372_036_854_775_807f64).to_bits()
        ))
    );
}

#[test]
fn lower_ir_captures_floating_static_field_literal_initializers() {
    let src = r#"
        package app.core;
        class Main {
            private static float F = 1.25f;
            private static double D = 3.141592653589793d;
            public static void main() {
            }
        }
    "#;

    let program = parse(src).expect("parse should succeed");
    let contexts = vec![ClassContext {
        package_name: "app.core".to_string(),
        imports: vec![],
    }];

    let ir = lower_to_ir_with_contexts(&program, &contexts).expect("ir lowering should pass");
    assert_eq!(
        ir.classes[0].fields[0].init,
        Some(IrFieldInit::Float(1.25f32.to_bits())),
        "expected float field initializer to preserve float bits"
    );
    assert_eq!(
        ir.classes[0].fields[1].init,
        Some(IrFieldInit::Double(3.141592653589793f64.to_bits())),
        "expected double field initializer to preserve double bits"
    );
}
