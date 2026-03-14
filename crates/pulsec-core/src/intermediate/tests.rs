use crate::{parse, ClassContext};

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
