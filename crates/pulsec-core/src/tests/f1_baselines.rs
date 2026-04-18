use super::*;

#[test]
fn parse_accepts_throw_statement() {
    let src = r#"
        package app.core;
        import pulse.lang.Exception;

        class Main {
            public static void boom() {
                throw new Exception("boom");
            }

            public static void main() {
            }
        }
    "#;

    let program = parse(src).expect("throw statement should parse");
    let method = match &program.classes[0].members[0] {
        crate::ClassMember::Method(method) => method,
        _ => panic!("expected method"),
    };
    assert!(matches!(method.body[0], crate::Stmt::Throw(..)));
}

#[test]
fn parse_accepts_throws_clause_on_methods_and_constructors() {
    let src = r#"
        package app.core;
        import pulse.lang.Exception;

        class Main {
            public Main() throws Exception {
            }

            public static void run() throws Exception {
            }
        }
    "#;

    let program = parse(src).expect("throws clause should parse");
    let constructor = match &program.classes[0].members[0] {
        crate::ClassMember::Method(method) => method,
        _ => panic!("expected constructor"),
    };
    let method = match &program.classes[0].members[1] {
        crate::ClassMember::Method(method) => method,
        _ => panic!("expected method"),
    };
    assert_eq!(constructor.throws, vec!["Exception".to_string()]);
    assert_eq!(method.throws, vec!["Exception".to_string()]);
}

#[test]
fn check_accepts_throw_for_throwable_subtypes() {
    let src = r#"
        package app.core;
        import pulse.lang.Exception;

        class Main {
            public static int fail() throws Exception {
                throw new Exception("boom");
            }

            public static void main() {
            }
        }
    "#;

    check(src).expect("throw should accept throwable subtypes and satisfy termination");
}

#[test]
fn check_rejects_uncaught_checked_exception_without_declared_throws() {
    let src = r#"
        package app.core;
        import pulse.lang.Exception;

        class Main {
            public static void fail() {
                throw new Exception("boom");
            }

            public static void main() {
            }
        }
    "#;

    let err = check(src).expect_err("unchecked checked exception should fail");
    assert!(err
        .to_string()
        .contains("Checked exception 'Exception' must be caught or declared in 'Main.fail'"));
}

#[test]
fn check_accepts_declared_checked_exception_calls_and_constructor_calls() {
    let src = r#"
        package app.core;
        import pulse.lang.Exception;

        class Worker {
            public Worker() throws Exception {
            }

            public void fail() throws Exception {
                throw new Exception("boom");
            }
        }

        class Main {
            public static void main() throws Exception {
                Worker worker = new Worker();
                worker.fail();
            }
        }
    "#;

    check(src).expect("declared checked exception flow should typecheck");
}

#[test]
fn check_accepts_unchecked_runtime_exception_without_declared_throws() {
    let src = r#"
        package app.core;
        import pulse.lang.RuntimeException;

        class Main {
            public static void fail() {
                throw new RuntimeException("boom");
            }

            public static void main() {
            }
        }
    "#;

    check(src).expect("unchecked runtime exceptions should not require throws");
}

#[test]
fn check_rejects_throw_for_non_throwable_values() {
    let src = r#"
        package app.core;

        class Main {
            public static void main() {
                throw "boom";
            }
        }
    "#;

    let err = check(src).expect_err("non-throwable throw operand should fail");
    assert!(err
        .to_string()
        .contains("Cannot assign type 'String' to 'pulse.lang.Throwable'"));
}

#[test]
fn check_rejects_definitely_null_throw_operand_in_current_f1_baseline() {
    let src = r#"
        package app.core;
        import pulse.lang.Exception;

        class Main {
            public static void main() {
                Exception ex = null;
                throw ex;
            }
        }
    "#;

    let err = check(src).expect_err("definitely-null throw operand should fail");
    assert!(err
        .to_string()
        .contains("is definitely null in the current F1 baseline"));
}

#[test]
fn lower_throw_to_fail_fast_panic_call_baseline() {
    let src = r#"
        package app.core;
        import pulse.lang.Exception;

        class Main {
            public static void main() throws Exception {
                throw new Exception("boom");
            }
        }
    "#;

    let program = check(src).expect("throw program should typecheck");
    let ir = lower_to_ir(&program).expect("throw program should lower");
    let method = ir
        .classes
        .iter()
        .find(|class| class.name == "Main")
        .and_then(|class| class.methods.iter().find(|method| method.name == "main"))
        .expect("find main");

    assert!(
        method.blocks.iter().any(|block| matches!(
            block.terminator,
            crate::intermediate::IrTerminator::Throw { .. }
        )),
        "expected throw lowering to produce a real IR throw terminator"
    );
}

#[test]
fn parse_accepts_try_catch_finally_statement() {
    let src = r#"
        package app.core;
        import pulse.lang.Exception;

        class Main {
            public static void main() {
                try {
                    throw new Exception("boom");
                } catch (Exception ex) {
                } finally {
                }
            }
        }
    "#;

    let program = parse(src).expect("try/catch/finally should parse");
    let method = match &program.classes[0].members[0] {
        crate::ClassMember::Method(method) => method,
        _ => panic!("expected method"),
    };
    assert!(matches!(method.body[0], crate::Stmt::Try { .. }));
}

#[test]
fn parse_accepts_foreach_statement() {
    let src = r#"
        package app.core;
        import pulse.lang.Object;
        import pulse.lang.Iterable;

        class Main {
            public static void main() {
                Iterable items = null;
                for (Object item : items) {
                }
            }
        }
    "#;

    let program = parse(src).expect("foreach should parse");
    let class = &program.classes[0];
    let method = match &class.members[0] {
        crate::ClassMember::Method(method) => method,
        _ => panic!("expected method"),
    };
    assert!(matches!(method.body[1], crate::Stmt::ForEach { .. }));
}

#[test]
fn parse_accepts_assert_statement_with_optional_message() {
    let src = r#"
        package app.core;

        class Main {
            public static void main() {
                assert true;
                assert true : "ok";
            }
        }
    "#;

    let program = parse(src).expect("assert should parse");
    let class = &program.classes[0];
    let method = match &class.members[0] {
        crate::ClassMember::Method(method) => method,
        _ => panic!("expected method"),
    };
    assert!(matches!(method.body[0], crate::Stmt::Assert { .. }));
    assert!(matches!(method.body[1], crate::Stmt::Assert { .. }));
}

#[test]
fn parse_rejects_synchronized_statement_for_current_f1_baseline() {
    let src = r#"
        package app.core;

        class Main {
            public static void main() {
                synchronized (new Main()) {
                }
            }
        }
    "#;

    let err = parse(src).expect_err("synchronized statement should stay fenced");
    assert!(err
        .to_string()
        .contains("Synchronized statements are not supported in the current F1 baseline"));
}

#[test]
fn check_accepts_assert_baseline() {
    let src = r#"
        package app.core;

        class Main {
            public static void main() {
                assert 1 < 2;
                assert true : "ok";
            }
        }
    "#;

    check(src).expect("assert baseline should typecheck");
}

#[test]
fn check_rejects_non_boolean_assert_condition() {
    let src = r#"
        package app.core;

        class Main {
            public static void main() {
                assert 1;
            }
        }
    "#;

    let err = check(src).expect_err("assert condition must be boolean");
    assert!(err.to_string().contains("Assert condition"));
}

#[test]
fn check_rejects_non_string_assert_message() {
    let src = r#"
        package app.core;

        class Main {
            public static void main() {
                assert true : 7;
            }
        }
    "#;

    let err = check(src).expect_err("assert message must be string in current baseline");
    assert!(err.to_string().contains("Assert message"));
}

#[test]
fn parse_accepts_ternary_expression() {
    let src = r#"
        package app.core;

        class Main {
            public static void main() {
                int value = true ? 1 : 2;
            }
        }
    "#;

    let program = parse(src).expect("ternary should parse");
    let class = &program.classes[0];
    let method = match &class.members[0] {
        crate::ClassMember::Method(method) => method,
        _ => panic!("expected method"),
    };
    let crate::Stmt::VarDecl {
        init: Some(init), ..
    } = &method.body[0]
    else {
        panic!("expected initialized variable declaration");
    };
    assert!(matches!(init, crate::Expr::Conditional { .. }));
}

#[test]
fn check_accepts_ternary_with_boolean_condition_and_compatible_branches() {
    let src = r#"
        package app.core;

        class Main {
            public static void main() {
                int value = true ? 1 : 2;
                String text = false ? "left" : "right";
            }
        }
    "#;

    check(src).expect("ternary baseline should typecheck");
}

#[test]
fn check_rejects_ternary_with_non_boolean_condition() {
    let src = r#"
        package app.core;

        class Main {
            public static void main() {
                int value = 1 ? 2 : 3;
            }
        }
    "#;

    let err = check(src).expect_err("ternary condition must be boolean");
    assert!(err.to_string().contains("Ternary condition"));
}

#[test]
fn lower_ternary_to_lazy_conditional_ir_value() {
    let src = r#"
        package app.core;

        class Main {
            public static void main() {
                int value = true ? 1 : 2;
            }
        }
    "#;

    let program = check(src).expect("ternary program should typecheck");
    let ir = lower_to_ir(&program).expect("ternary program should lower");
    let method = ir
        .classes
        .iter()
        .find(|class| class.name == "Main")
        .and_then(|class| class.methods.iter().find(|method| method.name == "main"))
        .expect("find main");
    assert!(
        method.values.iter().any(|value| matches!(
            value.kind,
            crate::intermediate::IrValueKind::Conditional { .. }
        )),
        "expected ternary to lower to a conditional IR value"
    );
}

#[test]
fn parse_accepts_native_array_creation_expression() {
    let src = r#"
        package app.core;

        class Main {
            public static void main() {
                int[] numbers = new int[3];
            }
        }
    "#;

    let program = parse(src).expect("array creation should parse");
    let class = &program.classes[0];
    let method = match &class.members[0] {
        crate::ClassMember::Method(method) => method,
        _ => panic!("expected method"),
    };
    let crate::Stmt::VarDecl {
        init: Some(init), ..
    } = &method.body[0]
    else {
        panic!("expected initialized variable declaration");
    };
    assert!(matches!(init, crate::Expr::NewArray { .. }));
}

#[test]
fn parse_accepts_native_array_initializer_expression() {
    let src = r#"
        package app.core;

        class Main {
            public static void main() {
                int[] numbers = new int[] { 1, 2, 3 };
            }
        }
    "#;

    let program = parse(src).expect("array initializer should parse");
    let class = &program.classes[0];
    let method = match &class.members[0] {
        crate::ClassMember::Method(method) => method,
        _ => panic!("expected method"),
    };
    let crate::Stmt::VarDecl {
        init: Some(init), ..
    } = &method.body[0]
    else {
        panic!("expected initialized variable declaration");
    };
    assert!(matches!(init, crate::Expr::NewArrayInitialized { .. }));
}

#[test]
fn parse_accepts_nested_native_array_initializer_expression() {
    let src = r#"
        package app.core;

        class Main {
            public static void main() {
                int[][] numbers = new int[][] { { 1, 2 }, { 3, 4 } };
            }
        }
    "#;

    let program = parse(src).expect("nested array initializer should parse");
    let class = &program.classes[0];
    let method = match &class.members[0] {
        crate::ClassMember::Method(method) => method,
        _ => panic!("expected method"),
    };
    let crate::Stmt::VarDecl {
        init: Some(init), ..
    } = &method.body[0]
    else {
        panic!("expected initialized variable declaration");
    };
    match init {
        crate::Expr::NewArrayInitialized {
            dimensions, values, ..
        } => {
            assert_eq!(*dimensions, 2);
            assert!(matches!(values[0], crate::ArrayInitExpr::Nested(_)));
        }
        _ => panic!("expected nested native array initializer"),
    }
}

#[test]
fn parse_accepts_native_array_subscript_expression_and_assignment_target() {
    let src = r#"
        package app.core;

        class Main {
            public static void main() {
                int[] numbers = new int[3];
                numbers[1] = numbers[0];
            }
        }
    "#;

    let program = parse(src).expect("native array subscript should parse");
    let class = &program.classes[0];
    let method = match &class.members[0] {
        crate::ClassMember::Method(method) => method,
        _ => panic!("expected method"),
    };
    let crate::Stmt::Assign { target, value, .. } = &method.body[1] else {
        panic!("expected native array assignment");
    };
    assert!(matches!(target, crate::Expr::ArrayAccess { .. }));
    assert!(matches!(value, crate::Expr::ArrayAccess { .. }));
}

#[test]
fn parse_accepts_java_like_new_constructor_expression() {
    let src = r#"
        package app.core;

        class Box {
            public Box(int value) {
            }
        }

        class Main {
            public static void main() {
                Box box = new Box(7);
            }
        }
    "#;

    let program = parse(src).expect("new constructor expression should parse");
    let class = &program.classes[1];
    let method = match &class.members[0] {
        crate::ClassMember::Method(method) => method,
        _ => panic!("expected method"),
    };
    let crate::Stmt::VarDecl {
        init: Some(init), ..
    } = &method.body[0]
    else {
        panic!("expected initialized variable declaration");
    };
    assert!(matches!(init, crate::Expr::NewObject { .. }));
}

#[test]
fn check_accepts_java_like_new_constructor_expression() {
    let src = r#"
        package app.core;

        class Box {
            private int value;

            public Box(int value) {
                this.value = value;
            }

            public int value() {
                return this.value;
            }
        }

        class Main {
            public static void main() {
                Box box = new Box(7);
                int value = box.value();
            }
        }
    "#;

    check(src).expect("new constructor expression should typecheck");
}

#[test]
fn check_rejects_bare_constructor_call_without_new() {
    let src = r#"
        package app.core;

        class Box {
            public Box(int value) {
            }
        }

        class Main {
            public static void main() {
                Box box = Box(7);
            }
        }
    "#;

    let err = check(src).expect_err("bare constructor calls should be rejected");
    assert!(err
        .to_string()
        .contains("Constructor calls must use Java-like 'new Box(...)' syntax"));
}

#[test]
fn check_accepts_native_array_creation_and_length_for_reference_and_intlike_types() {
    let src = r#"
        package app.core;

        class Box {
        }

        class Main {
            public static void main() {
                byte[] bytes = new byte[2];
                boolean[] flags = new boolean[4];
                int[] numbers = new int[3];
                String[] names = new String[2];
                Box[] boxes = new Box[1];
                int a = bytes.length;
                int b = flags.length;
                int c = numbers.length;
                int d = names.length;
                int e = boxes.length;
            }
        }
    "#;

    check(src).expect("native array creation should typecheck for supported element types");
}

#[test]
fn check_accepts_integral_native_array_element_types() {
    let src = r#"
        package app.core;

        class Main {
            public static void main() {
                long[] values = new long[1];
                uint[] ids = new uint[2];
                ulong[] bigIds = new ulong[1];
            }
        }
    "#;

    check(src).expect("integral native array element types should typecheck");
}

#[test]
fn check_accepts_floating_native_array_element_types() {
    let src = r#"
        package app.core;

        class Main {
            public static void main() {
                float[] values = new float[] { 1.25f, -2.5f };
                double[][] grid = new double[][] { { 1.5d, 2.5d }, { -3.5d, 4.5d } };
                int count = values.length + grid.length;
            }
        }
    "#;

    check(src).expect("floating native array element types should typecheck");
}

#[test]
fn check_accepts_native_array_initializer_for_supported_types() {
    let src = r#"
        package app.core;

        class Box {
            public Box() {
            }
        }

        class Main {
            public static void main() {
                int[] numbers = new int[] { 1, 2 };
                boolean[] flags = new boolean[] { true, false, true };
                String[] names = new String[] { "a", "b" };
                Box[] boxes = new Box[] { new Box(), null };
                int a = numbers.length;
                int b = flags.length;
                int c = names.length;
                int d = boxes.length;
            }
        }
    "#;

    check(src).expect("supported native array initializers should typecheck");
}

#[test]
fn check_accepts_native_array_subscript_reads_and_updates_for_supported_types() {
    let src = r#"
        package app.core;

        class Box {
            private int value;

            public Box(int value) {
                this.value = value;
            }

            public int value() {
                return this.value;
            }
        }

        class Main {
            public static void main() {
                int[] numbers = new int[] { 1, 2, 3 };
                numbers[1] = numbers[0] + 4;
                numbers[2] += 1;

                boolean[] flags = new boolean[] { true, false };
                flags[1] = flags[0];

                String[] names = new String[] { "a", "b" };
                names[1] = names[0];

                Box[] boxes = new Box[] { new Box(7), null };
                boxes[1] = new Box(9);

                int a = numbers[1];
                boolean b = flags[1];
                String c = names[1];
                int d = boxes[1].value();
            }
        }
    "#;

    check(src).expect("native array subscript reads and writes should typecheck");
}

#[test]
fn check_rejects_non_int_native_array_index() {
    let src = r#"
        package app.core;

        class Main {
            public static void main() {
                int[] numbers = new int[2];
                int value = numbers[true];
            }
        }
    "#;

    let err = check(src).expect_err("non-int native array index should fail");
    assert!(err
        .to_string()
        .contains("Native array index expression must be 'int'"));
}

#[test]
fn check_accepts_multidimensional_native_array_creation() {
    let multidimensional = r#"
        package app.core;

        class Main {
            public static void main() {
                int[][] grid = new int[2][3];
            }
        }
    "#;
    check(multidimensional).expect("multidimensional array creation should typecheck");
}

#[test]
fn check_accepts_nested_multidimensional_native_array_initializers() {
    let src = r#"
        package app.core;

        class Main {
            public static void main() {
                int[][] grid = new int[][] { { 1, 2 }, { 3, 4 } };
                String[][] names = new String[][] { { "a" }, null };
            }
        }
    "#;

    check(src).expect("nested multidimensional array initializers should typecheck");
}

#[test]
fn lower_native_array_creation_initializer_and_length_to_ir_values() {
    let src = r#"
        package app.core;

        class Main {
            public static void main() {
                int[] numbers = new int[] { 1, 2, 3 };
                int size = numbers.length;
            }
        }
    "#;

    let program = check(src).expect("array creation program should typecheck");
    let ir = lower_to_ir(&program).expect("array creation program should lower");
    let method = ir
        .classes
        .iter()
        .find(|class| class.name == "Main")
        .and_then(|class| class.methods.iter().find(|method| method.name == "main"))
        .expect("find main");
    assert!(method.values.iter().any(|value| matches!(
        value.kind,
        crate::intermediate::IrValueKind::ArrayNew { .. }
            | crate::intermediate::IrValueKind::ArrayNewInitialized { .. }
    )));
    assert!(method.values.iter().any(|value| matches!(
        value.kind,
        crate::intermediate::IrValueKind::ArrayLength { .. }
    )));
}

#[test]
fn lower_native_array_subscript_reads_and_writes_to_ir_values() {
    let src = r#"
        package app.core;

        class Main {
            public static void main() {
                int[] numbers = new int[] { 1, 2, 3 };
                numbers[1] = numbers[0] + 4;
                int value = numbers[1];
            }
        }
    "#;

    let program = check(src).expect("array subscript program should typecheck");
    let ir = lower_to_ir(&program).expect("array subscript program should lower");
    let method = ir
        .classes
        .iter()
        .find(|class| class.name == "Main")
        .and_then(|class| class.methods.iter().find(|method| method.name == "main"))
        .expect("find main");
    assert!(method.values.iter().any(|value| matches!(
        value.kind,
        crate::intermediate::IrValueKind::ArrayGet { .. }
    )));
    assert!(method.values.iter().any(|value| matches!(
        value.kind,
        crate::intermediate::IrValueKind::ArraySet { .. }
    )));
}

#[test]
fn lower_multidimensional_native_array_creation_to_ir_values() {
    let src = r#"
        package app.core;

        class Main {
            public static void main() {
                int[][] grid = new int[2][3];
                int value = grid[1][2];
            }
        }
    "#;

    let program = check(src).expect("multidimensional array program should typecheck");
    let ir = lower_to_ir(&program).expect("multidimensional array program should lower");
    let method = ir
        .classes
        .iter()
        .find(|class| class.name == "Main")
        .and_then(|class| class.methods.iter().find(|method| method.name == "main"))
        .expect("find main");
    assert!(method.values.iter().any(|value| matches!(
        &value.kind,
        crate::intermediate::IrValueKind::ArrayNew { lengths, .. } if lengths.len() == 2
    )));
}

#[test]
fn lower_nested_multidimensional_array_initializers_to_ir_values() {
    let src = r#"
        package app.core;

        class Main {
            public static void main() {
                int[][] grid = new int[][] { { 1, 2 }, { 3, 4 } };
            }
        }
    "#;

    let program = check(src).expect("nested initializer program should typecheck");
    let ir = lower_to_ir(&program).expect("nested initializer program should lower");
    let method = ir
        .classes
        .iter()
        .find(|class| class.name == "Main")
        .and_then(|class| class.methods.iter().find(|method| method.name == "main"))
        .expect("find main");
    assert!(method.values.iter().any(|value| matches!(
        &value.kind,
        crate::intermediate::IrValueKind::ArrayNewInitialized { dimensions, .. } if *dimensions == 2
    )));
    assert!(method.values.iter().any(|value| matches!(
        &value.kind,
        crate::intermediate::IrValueKind::ArrayNewInitialized { dimensions, .. } if *dimensions == 1
    )));
}

#[test]
fn lower_overloaded_call_return_type_by_argument_types() {
    let src = r#"
        package app.core;

        class Main {
            public int set(int index, int value) {
                return value;
            }

            public String set(int index, String value) {
                return value;
            }

            public static void main() {
                Main m = new Main();
                int a = m.set(1, 5);
                String b = m.set(1, "pulse");
            }
        }
    "#;

    let program = check(src).expect("overloaded set program should typecheck");
    let ir = lower_to_ir(&program).expect("overloaded set program should lower");
    let method = ir
        .classes
        .iter()
        .find(|class| class.name == "Main")
        .and_then(|class| class.methods.iter().find(|method| method.name == "main"))
        .expect("find main");

    let call_types = method
        .values
        .iter()
        .filter_map(|value| match value.kind {
            crate::intermediate::IrValueKind::Call { .. } => Some(value.ty.as_str()),
            _ => None,
        })
        .collect::<Vec<_>>();

    assert!(call_types.contains(&"int"));
    assert!(call_types.contains(&"String"));
}

#[test]
fn parse_rejects_lambda_expression_baseline() {
    let src = r#"
        package app.core;

        class Main {
            public static void main() {
                Runnable r = () -> 1;
            }
        }
    "#;

    let err = parse(src).expect_err("lambda expressions should be fenced");
    assert!(err
        .to_string()
        .contains("Lambda expressions are not supported in the current F1 baseline"));
}

#[test]
fn parse_rejects_method_reference_baseline() {
    let src = r#"
        package app.core;

        class Main {
            public static void main() {
                Object ref = Main::main;
            }
        }
    "#;

    let err = parse(src).expect_err("method references should be fenced");
    assert!(err
        .to_string()
        .contains("Method references are not supported in the current F1 baseline"));
}

#[test]
fn check_accepts_foreach_over_iterable_object_stream_baseline() {
    let src = r#"
        package app.core;
        import pulse.lang.Object;
        import pulse.lang.Iterable;
        import pulse.lang.Iterator;

        class CounterIterator implements Iterator {
            private int remaining;

            public CounterIterator(int remaining) {
                this.remaining = remaining;
            }

            public boolean hasNext() {
                return this.remaining > 0;
            }

            public Object next() {
                this.remaining = this.remaining - 1;
                return new Object();
            }
        }

        class CounterBag implements Iterable {
            public Iterator iterator() {
                return new CounterIterator(3);
            }
        }

        class Main {
            public static void main() {
                int count = 0;
                for (Object item : new CounterBag()) {
                    count = count + 1;
                }
            }
        }
    "#;

    check(src)
        .expect("foreach over Iterable should typecheck for the current object-stream baseline");
}

#[test]
fn check_accepts_foreach_over_stdlib_array_int_lane_baseline() {
    let src = r#"
        package app.core;
        import pulse.collections.Array;

        class Main {
            public static void main() {
                Array arr = new Array(3);
                arr.setInt(0, 1);
                arr.setInt(1, 2);
                arr.setInt(2, 3);

                int total = 0;
                for (int value : arr) {
                    total = total + value;
                }
            }
        }
    "#;

    check(src).expect("foreach over stdlib Array int lane should typecheck");
}

#[test]
fn check_accepts_foreach_over_native_arrays() {
    let src = r#"
        package app.core;

        class Main {
            public static void main(String[] args) {
                for (String arg : args) {
                }
            }
        }
    "#;

    check(src).expect("native array foreach should typecheck");
}

#[test]
fn check_accepts_same_method_try_catch_finally_baseline() {
    let src = r#"
        package app.core;
        import pulse.lang.Exception;

        class Main {
            public static void main() {
                try {
                    throw new Exception("boom");
                } catch (Exception ex) {
                    String msg = ex.getMessage();
                } finally {
                    String marker = "done";
                }
            }
        }
    "#;

    check(src).expect("same-method try/catch/finally baseline should typecheck");
}

#[test]
fn check_rejects_return_inside_try_regions_for_current_f1_16_baseline() {
    let src = r#"
        package app.core;

        class Main {
            public static int fail() {
                try {
                    return 1;
                } finally {
                }
            }

            public static void main() {
            }
        }
    "#;

    let err = check(src).expect_err("return in try should be fenced");
    assert!(err
        .to_string()
        .contains("'return' is not supported inside try/catch/finally"));
}

#[test]
fn check_rejects_throw_inside_catch_for_current_f1_16_baseline() {
    let src = r#"
        package app.core;
        import pulse.lang.Exception;

        class Main {
            public static void main() {
                try {
                    throw new Exception("boom");
                } catch (Exception ex) {
                    throw ex;
                }
            }
        }
    "#;

    let err = check(src).expect_err("throw in catch should be fenced");
    assert!(err
        .to_string()
        .contains("'throw' from catch/finally is not supported yet"));
}

#[test]
fn check_accepts_runtime_backed_string_baseline_calls() {
    let src = r#"
        package app.core;
        class Main {
            public static void main() {
                String text;
                int len;
                text = "a".concat("b");
                len = text.length();
                text = String.valueOf(len);
                text = String.valueOf(true);
                pulse.rt.Intrinsics.consoleWriteLine(text);
            }
        }
    "#;

    check(src).expect("runtime-backed String baseline calls should pass");
}

#[test]
fn check_accepts_string_class_instance_and_static_apis() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static void main() {
                String text = "ab";
                int n = text.length();
                boolean empty = text.isEmpty();
                String out = text.concat("cd");
                if (empty) {
                    out = out.concat("!");
                }
                out = String.valueOf(n);
                out = String.valueOf(empty);
                IO.println(out);
            }
        }
    "#;

    check(src).expect("String class baseline APIs should typecheck");
}

#[test]
fn check_allows_source_override_of_builtin_fqcn() {
    let src = r#"
        package pulse.lang;

        class IO {
            public static void println(String text) {
            }
        }

        class Main {
            public static void main() {
                IO.println("ok");
            }
        }
    "#;

    check(src).expect("source IO should be allowed to override builtin IO stub");
}

#[test]
fn check_accepts_arc_cycle_intrinsics_calls() {
    let src = r#"
        package app.core;
        import pulse.memory.Memory;

        class Main {
            public static void main() {
                int a = Memory.cycleYoungPass();
                int b = Memory.cycleFullPass();
                int c = Memory.cycleTick();
                int d = a + b + c;
            }
        }
    "#;

    check(src).expect("arc cycle intrinsic methods should typecheck");
}

#[test]
fn check_accepts_system_out_and_io_alias_calls() {
    let src = r#"
        package app.core;
        import pulse.lang.System;
        import pulse.lang.IO;

        class Main {
            public static void main() {
                System.out.println("hello");
                IO.println(1);
                IO.print(true);
            }
        }
    "#;

    check(src).expect("System.out and IO alias calls should pass");
}

#[test]
fn check_accepts_system_out_typed_as_console_writer_contract() {
    let src = r#"
        package app.core;
        import pulse.lang.System;
        import pulse.lang.ConsoleWriter;

        class Main {
            public static void main() {
                ConsoleWriter writer;
                writer = System.out;
                writer.println("ok");
            }
        }
    "#;

    check(src).expect("System.out should satisfy ConsoleWriter contract");
}

#[test]
fn check_rejects_assignment_to_system_out_runtime_singleton() {
    let src = r#"
        package app.core;
        import pulse.lang.System;
        import pulse.lang.PrintStream;

        class Main {
            public static void main() {
                System.out = new PrintStream();
            }
        }
    "#;

    let err = check(src).expect_err("System.out assignment should be rejected");
    assert!(err
        .to_string()
        .contains("runtime-managed field 'System.out'"));
}

#[test]
fn check_accepts_extends_and_super_call() {
    let src = r#"
        package app.core;

        class Base {
            public int value() {
                return 1;
            }
        }

        class Main extends Base {
            public int value() {
                return super.value() + 1;
            }

            public static void main() {
            }
        }
    "#;

    check(src).expect("extends + super call should pass");
}

#[test]
fn check_accepts_else_if_chain() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static int pick(int x) {
                if (x < 0) {
                    return -1;
                } else if (x == 0) {
                    return 0;
                } else {
                    return 1;
                }
            }

            public static void main() {
                IO.println(pick(2));
            }
        }
    "#;

    check(src).expect("else-if chains should parse and typecheck");
}

#[test]
fn check_rejects_missing_super_method_on_implicit_object_super() {
    let src = r#"
        package app.core;

        class Main {
            public int value() {
                return super.value();
            }

            public static void main() {
            }
        }
    "#;

    let err = check(src).expect_err("missing method on implicit Object super should fail");
    assert!(err
        .to_string()
        .contains("No method 'Object.value' matches argument types ()"));
}

#[test]
fn check_rejects_extending_final_class() {
    let src = r#"
        package app.core;

        final class Base {
            public int value() {
                return 1;
            }
        }

        class Main extends Base {
            public static void main() {
            }
        }
    "#;

    let err = check(src).expect_err("extending final class should fail");
    assert!(err.to_string().contains("cannot extend final class"));
}

#[test]
fn check_accepts_abstract_class_with_abstract_method() {
    let src = r#"
        package app.core;

        abstract class Base {
            public abstract int value();
        }

        class Main extends Base {
            public int value() {
                return 1;
            }

            public static void main() {
            }
        }
    "#;

    check(src).expect("abstract class with override should pass");
}

#[test]
fn check_rejects_abstract_method_in_non_abstract_class() {
    let src = r#"
        package app.core;

        class Main {
            public abstract int value();

            public static void main() {
            }
        }
    "#;

    let err = check(src).expect_err("non-abstract class with abstract method should fail");
    assert!(err
        .to_string()
        .contains("must be abstract to declare abstract method"));
}

#[test]
fn check_rejects_reserved_keyword_as_identifier() {
    let src = r#"
        package app.core;

        class Main {
            public static void main() {
                int super = 1;
            }
        }
    "#;

    let err = check(src).expect_err("reserved keyword should not parse as identifier");
    let msg = err.to_string();
    assert!(
        msg.contains("Parse error")
            || msg.contains("Expected expression")
            || msg.contains("Expected variable name")
    );
}

#[test]
fn check_accepts_foundational_lang_interfaces_in_implements_and_usage() {
    let src = r#"
        package app.core;
        import pulse.lang.Runnable;
        import pulse.lang.Appendable;
        import pulse.lang.CharSequence;

        class Main implements Runnable {
            public void run() {
            }
        }

        class Use {
            public static void main() {
                Runnable r = new Main();
                Appendable app = new StringBuilder();
                CharSequence seq = "pulse";
            }
        }
    "#;

    check(src).expect("foundational lang interfaces should typecheck");
}

#[test]
fn check_rejects_reserved_but_unsupported_modifier_usage() {
    let src = r#"
        package app.core;

        class Main {
            public synchronized void tick() {
            }

            public static void main() {
            }
        }
    "#;

    let err = check(src).expect_err("unsupported reserved modifier should fail");
    assert!(err.to_string().contains("reserved but not supported"));
}

#[test]
fn check_accepts_interface_and_implements() {
    let src = r#"
        package app.core;

        interface Tickable {
            int tick(int dt);
        }

        class Main implements Tickable {
            public int tick(int dt) {
                return dt;
            }

            public static void main() {
            }
        }
    "#;

    check(src).expect("implements with matching method should pass");
}

#[test]
fn check_rejects_missing_interface_method_implementation() {
    let src = r#"
        package app.core;

        interface Tickable {
            int tick(int dt);
        }

        class Main implements Tickable {
            public static void main() {
            }
        }
    "#;

    let err = check(src).expect_err("missing interface method should fail");
    assert!(err.to_string().contains("must implement interface method"));
}

#[test]
fn check_allows_abstract_class_to_defer_interface_method() {
    let src = r#"
        package app.core;

        interface Tickable {
            int tick(int dt);
        }

        abstract class Base implements Tickable {
        }

        class Main extends Base {
            public int tick(int dt) {
                return dt;
            }

            public static void main() {
            }
        }
    "#;

    check(src).expect("abstract class may defer interface implementation");
}

#[test]
fn check_accepts_override_annotation_for_super_method() {
    let src = r#"
        package app.core;

        class Base {
            public int value() {
                return 1;
            }
        }

        class Main extends Base {
            @Override
            public int value() {
                return 2;
            }

            public static void main() {
            }
        }
    "#;

    check(src).expect("@Override on superclass method should pass");
}

#[test]
fn check_accepts_override_annotation_for_interface_contract() {
    let src = r#"
        package app.core;

        interface Tickable {
            int tick();
        }

        class Main implements Tickable {
            @Override
            public int tick() {
                return 1;
            }

            public static void main() {
            }
        }
    "#;

    check(src).expect("@Override on interface contract implementation should pass");
}

#[test]
fn check_rejects_override_annotation_without_contract() {
    let src = r#"
        package app.core;

        class Main {
            @Override
            public int value() {
                return 1;
            }

            public static void main() {
            }
        }
    "#;

    let err = check(src).expect_err("@Override without parent/interface contract should fail");
    assert!(err
        .to_string()
        .contains("uses @Override but does not override"));
}

#[test]
fn check_rejects_override_annotation_on_static_method() {
    let src = r#"
        package app.core;

        class Main {
            @Override
            public static int value() {
                return 1;
            }

            public static void main() {
            }
        }
    "#;

    let err = check(src).expect_err("@Override on static method should fail");
    assert!(err.to_string().contains("not allowed on static method"));
}

#[test]
fn check_accepts_notnull_field_and_return_baseline() {
    let src = r#"
        package app.core;
        import pulse.lang.String;

        class Main {
            @NotNull
            private String name = "pulse";

            @NotNull
            public static String banner() {
                return "ok";
            }

            public static void main() {
                String local = banner();
            }
        }
    "#;

    check(src).expect("@NotNull field and method return should pass for non-null values");
}

#[test]
fn check_rejects_notnull_on_primitive_return() {
    let src = r#"
        package app.core;

        class Main {
            @NotNull
            public static int value() {
                return 1;
            }

            public static void main() {
            }
        }
    "#;

    let err = check(src).expect_err("@NotNull on primitive return should fail");
    assert!(err
        .to_string()
        .contains("Annotation '@NotNull' is not meaningful on primitive/void type 'int'"));
}

#[test]
fn check_rejects_notnull_null_field_initializer_and_return() {
    let field_src = r#"
        package app.core;
        import pulse.lang.String;

        class Main {
            @NotNull
            private String name = null;

            public static void main() {
            }
        }
    "#;
    let field_err = check(field_src).expect_err("@NotNull field cannot initialize to null");
    assert!(field_err
        .to_string()
        .contains("Annotation '@NotNull' forbids null in field initializer"));

    let return_src = r#"
        package app.core;
        import pulse.lang.String;

        class Main {
            @NotNull
            public static String value() {
                return null;
            }

            public static void main() {
            }
        }
    "#;
    let return_err = check(return_src).expect_err("@NotNull return cannot return null");
    assert!(return_err
        .to_string()
        .contains("Annotation '@NotNull' forbids null in return"));
}

#[test]
fn check_rejects_assigning_null_to_notnull_field() {
    let src = r#"
        package app.core;
        import pulse.lang.String;

        class Main {
            @NotNull
            private String name = "ok";

            public static void main() {
                Main m = new Main();
                m.name = null;
            }
        }
    "#;

    let err = check(src).expect_err("@NotNull field assignment should reject null");
    assert!(err
        .to_string()
        .contains("Annotation '@NotNull' forbids null in assignment"));
}

#[test]
fn check_accepts_test_annotation_on_valid_test_method() {
    let src = r#"
        package app.core;

        class Main {
            @Test
            public static void smoke() {
            }

            public static void main() {
            }
        }
    "#;

    check(src).expect("@Test baseline should accept public static void no-arg methods");
}

#[test]
fn check_rejects_invalid_test_annotation_signature() {
    let src = r#"
        package app.core;

        class Main {
            @Test
            public int smoke(int a) {
                return a;
            }

            public static void main() {
            }
        }
    "#;

    let err = check(src).expect_err("@Test should validate method signature");
    assert!(err
        .to_string()
        .contains("Annotation '@Test' requires method 'Main.smoke' to be public static"));
}

#[test]
fn parse_accepts_annotation_declarations() {
    let src = r#"
        package app.meta;

        public @interface Marker {
        }

        class Main {
            public static void main() {
            }
        }
    "#;

    let program = parse(src).expect("annotation declaration should parse");
    assert_eq!(program.classes.len(), 2);
    assert!(program.classes[0].is_annotation);
    assert!(program.classes[0].is_interface);
}

#[test]
fn check_accepts_user_declared_marker_annotation_usage() {
    let src = r#"
        package app.meta;

        public @interface Marker {
        }

        @Marker
        class Main {
            @Marker
            private int score = 1;

            @Marker
            public static void main() {
            }
        }
    "#;

    check(src).expect("user-declared marker annotations should be usable");
}

#[test]
fn check_rejects_non_annotation_type_used_as_annotation() {
    let src = r#"
        package app.meta;

        class Marker {
            public static void main() {
            }
        }

        @Marker
        class Main {
            public static void main() {
            }
        }
    "#;

    let err = check(src).expect_err("non-annotation type should not be usable as annotation");
    assert!(err.to_string().contains("is not an annotation declaration"));
}

#[test]
fn check_rejects_annotation_members_until_supported() {
    let src = r#"
        package app.meta;

        public @interface Marker {
            String value();
        }

        class Main {
            public static void main() {
            }
        }
    "#;

    let err = check(src).expect_err("annotation members should be fenced for now");
    assert!(err.to_string().contains("members are not supported yet"));
}

#[test]
fn parse_accepts_enum_declarations() {
    let src = r#"
        package app.types;

        public enum Mode {
            OFF,
            ON,
        }

        class Main {
            public static void main() {
            }
        }
    "#;

    let program = parse(src).expect("enum declaration should parse");
    assert_eq!(program.classes.len(), 2);
    assert!(program.classes[0].is_enum);
    assert_eq!(program.classes[0].enum_constants, vec!["OFF", "ON"]);
}

#[test]
fn check_accepts_enum_constants_in_assignments_and_comparisons() {
    let src = r#"
        package app.types;

        enum Mode {
            OFF,
            ON
        }

        class Main {
            public static void main() {
                Mode current = Mode.ON;
                boolean hot = current == Mode.ON;
            }
        }
    "#;

    check(src).expect("enum constants should typecheck in assignments and comparisons");
}

#[test]
fn check_rejects_duplicate_enum_constants() {
    let src = r#"
        package app.types;

        enum Mode {
            ON,
            ON
        }

        class Main {
            public static void main() {
            }
        }
    "#;

    let err = check(src).expect_err("duplicate enum constants should fail");
    assert!(err
        .to_string()
        .contains("Duplicate enum constant 'Mode.ON'"));
}

#[test]
fn check_rejects_assignment_to_enum_constant() {
    let src = r#"
        package app.types;

        enum Mode {
            OFF,
            ON
        }

        class Main {
            public static void main() {
                Mode.ON = Mode.OFF;
            }
        }
    "#;

    let err = check(src).expect_err("enum constants should be immutable");
    assert!(err
        .to_string()
        .contains("Cannot assign to enum constant 'Mode.ON'"));
}

#[test]
fn lower_enum_constants_to_ordinals_for_execution() {
    let src = r#"
        package app.types;

        enum Mode {
            OFF,
            ON
        }

        class Main {
            public static void main() {
                Mode current = Mode.ON;
            }
        }
    "#;

    let program = check(src).expect("enum program should typecheck");
    let ir = lower_to_ir(&program).expect("enum program should lower");
    let method = ir
        .classes
        .iter()
        .find(|class| class.name == "Main")
        .and_then(|class| class.methods.iter().find(|method| method.name == "main"))
        .expect("find main");
    assert!(
        method
            .values
            .iter()
            .any(|value| value.ty == "app.types.Mode"
                && matches!(value.kind, crate::intermediate::IrValueKind::IntLiteral(1))),
        "expected enum constant to lower to ordinal-backed IR value"
    );
}

#[test]
fn parse_accepts_erased_generic_class_and_method_baseline() {
    let src = r#"
        package app.generics;

        interface Supplier<T> {
            T get();
        }

        class Box<T> implements Supplier<T> {
            private T value;

            public void set(T value) {
                this.value = value;
            }

            @Override
            public T get() {
                return this.value;
            }

            public static <T> T id(T value) {
                return value;
            }
        }

        class Main {
            public static void main() {
            }
        }
    "#;

    let program = parse(src).expect("generic declarations should parse");
    assert_eq!(program.classes[0].type_params, vec!["T"]);
    assert_eq!(program.classes[1].type_params, vec!["T"]);
    let id_method = match &program.classes[1].members[3] {
        crate::ClassMember::Method(method) => method,
        _ => panic!("expected method"),
    };
    assert_eq!(id_method.type_params, vec!["T"]);
}
