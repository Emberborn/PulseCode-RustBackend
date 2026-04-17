use super::*;

#[test]
fn check_accepts_compile_time_instantiated_generic_members_with_runtime_erasure() {
    let src = r#"
        package app.generics;
        import pulse.lang.Object;
        import pulse.lang.String;

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
                String payload = "ok";
                box.set(payload);
                String raw = box.get();
                String echoed = id(raw);
                Object widened = box;
            }
        }
    "#;

    let program = check(src).expect("instantiated generic baseline should typecheck");
    let ir = lower_to_ir(&program).expect("generic baseline should still erase at runtime");
    let box_class = ir
        .classes
        .iter()
        .find(|class| class.name == "Box")
        .expect("find Box");
    assert_eq!(box_class.fields[0].ty, "Object");
    let get_method = box_class
        .methods
        .iter()
        .find(|method| method.name == "get")
        .expect("find get");
    assert_eq!(get_method.return_type.as_deref(), Some("Object"));
}

#[test]
fn check_rejects_mismatched_instantiated_generic_member_argument() {
    let src = r#"
        package app.generics;
        import pulse.lang.Object;

        class Box<T> {
            private T value;

            public void set(T value) {
                this.value = value;
            }
        }

        class Main {
            public static void main() {
                Box<String> box = new Box();
                Object payload = (Object) "ok";
                box.set(payload);
            }
        }
    "#;

    let err = check(src).expect_err("mismatched instantiated generic arg should fail");
    assert!(err
        .to_string()
        .contains("No method 'Box.set' matches argument types (pulse.lang.Object)"));
}

#[test]
fn check_rejects_wrong_generic_arity_and_primitive_arguments() {
    let wrong_arity = r#"
        package app.generics;

        class Box<T> {
            public static void main() {
            }
        }

        class Main {
            public static void main() {
                Box<String, String> box = new Box();
            }
        }
    "#;
    let err = check(wrong_arity).expect_err("wrong generic arity should fail");
    assert!(err
        .to_string()
        .contains("expects 1 generic argument(s) but got 2"));

    let primitive_arg = r#"
        package app.generics;

        class Box<T> {
            public static void main() {
            }
        }

        class Main {
            public static void main() {
                Box<int> box = new Box();
            }
        }
    "#;
    let err = check(primitive_arg).expect_err("primitive generic argument should fail");
    assert!(err.to_string().contains("must be a reference type"));
}

#[test]
fn check_rejects_duplicate_type_parameters() {
    let src = r#"
        package app.generics;

        class Box<T, T> {
            public static void main() {
            }
        }
    "#;

    let err = check(src).expect_err("duplicate type params should fail");
    assert!(err.to_string().contains("Duplicate type parameter 'T'"));
}

#[test]
fn check_accepts_public_interface_declaration() {
    let src = r#"
        package app.core;

        public interface Marker {
        }

        class Main {
            public static void main() {
            }
        }
    "#;

    check(src).expect("public interface declaration should parse and typecheck");
}

#[test]
fn check_accepts_interface_inheritance_and_default_static_private_methods() {
    let src = r#"
        package app.core;

        interface Named {
            String name();
        }

        interface Versioned extends Named {
            private String prefix() {
                return "pulse-";
            }

            default String label() {
                return prefix() + name();
            }

            static String marker() {
                return "v1";
            }
        }

        class Tool implements Versioned {
            public String name() {
                return "code";
            }
        }

        class Main {
            public static void main() {
                Versioned v = new Tool();
                String a = v.label();
                String b = Versioned.marker();
            }
        }
    "#;

    check(src).expect("interface extends/default/static/private slice should typecheck");
}

#[test]
fn check_accepts_inherited_interface_overloads_alongside_child_overloads() {
    let src = r#"
        package app.core;
        import pulse.lang.Object;

        interface CollectionLike {
            boolean add(Object value);
        }

        interface ListLike extends CollectionLike {
            void add(int index, Object value);
            void add(String value);
        }

        class Items implements ListLike {
            public boolean add(Object value) {
                return true;
            }

            public void add(int index, Object value) {
            }

            public void add(String value) {
            }
        }

        class Main {
            public static void main() {
                ListLike list = new Items();
                Object value = new Items();
                boolean ok = list.add(value);
                list.add(0, value);
                list.add("x");
            }
        }
    "#;

    check(src).expect("child interface overloads should not hide inherited parent methods");
}

#[test]
fn check_accepts_inherited_superclass_overloads_alongside_child_overloads() {
    let src = r#"
        package app.core;
        import pulse.lang.Object;

        class Base {
            public Object set(Object value) {
                return value;
            }
        }

        class Derived extends Base {
            public int set(int value) {
                return value;
            }
        }

        class Main {
            public static void main() {
                Derived d = new Derived();
                Object ref = d.set((Object) d);
                int raw = d.set(7);
            }
        }
    "#;

    check(src).expect("child class overloads should not hide inherited superclass methods");
}

#[test]
fn check_accepts_implicit_object_methods_on_user_classes() {
    let src = r#"
        package app.core;
        import pulse.lang.Object;

        class Main {
            public static void main() {
                Main m = new Main();
                String text = m.toString();
                int hash = m.hashCode();
                boolean same = m.equals((Object) m);
                Class kind = m.getClass();
            }
        }
    "#;

    check(src).expect("user classes should inherit Object methods implicitly");
}

#[test]
fn check_rejects_interface_instance_body_without_default_modifier() {
    let src = r#"
        package app.core;

        interface Named {
            String label() {
                return "bad";
            }
        }

        class Main {
            public static void main() {
            }
        }
    "#;

    let err = check(src).expect_err("interface instance body without default should fail");
    assert!(err
        .to_string()
        .contains("with a body must use the 'default' modifier"));
}

#[test]
fn check_rejects_interface_inheritance_cycle() {
    let src = r#"
        package app.core;

        interface Left extends Right {
        }

        interface Right extends Left {
        }

        class Main {
            public static void main() {
            }
        }
    "#;

    let err = check(src).expect_err("interface inheritance cycle should fail");
    assert!(err
        .to_string()
        .contains("Interface inheritance cycle detected"));
}

#[test]
fn check_accepts_instanceof_for_class_and_interface_targets() {
    let src = r#"
        package app.core;

        interface Tag {}

        class Base {}

        class Derived extends Base implements Tag {}

        class Main {
            public static void main() {
                Base b = new Derived();
                boolean a = b instanceof Base;
                boolean d = b instanceof Derived;
                Tag t = new Derived();
                boolean i = t instanceof Tag;
            }
        }
    "#;

    check(src).expect("instanceof on class/interface references should typecheck");
}

#[test]
fn check_rejects_instanceof_with_primitive_target() {
    let src = r#"
        package app.core;

        class Main {
            public static void main() {
                ObjectLike x = new ObjectLike();
                boolean bad = x instanceof int;
            }
        }

        class ObjectLike {}
    "#;

    let err = check(src).expect_err("primitive instanceof target should fail");
    assert!(err.to_string().contains("must be a reference type"));
}

#[test]
fn check_rejects_instanceof_on_primitive_operand() {
    let src = r#"
        package app.core;

        class Main {
            public static void main() {
                int x = 1;
                boolean bad = x instanceof Main;
            }
        }
    "#;

    let err = check(src).expect_err("primitive instanceof operand should fail");
    assert!(err
        .to_string()
        .contains("Left operand of 'instanceof' must be a reference type"));
}

#[test]
fn check_rejects_removed_unsigned_types() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            private ufloat a;
            private udouble b;
            private uchar c;
            public static void main() {
            }
        }
    "#;

    let err = check(src).expect_err("removed unsigned types should fail");
    assert!(err.to_string().contains("Unknown type 'ufloat'"));
}

#[test]
fn check_rejects_missing_entrypoint() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public void run() {
            }
        }
    "#;

    let err = check(src).expect_err("missing entrypoint should fail");
    assert!(err.to_string().contains("No entry method found"));
}

#[test]
fn check_rejects_multiple_entrypoints() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static void main() {
            }

            public static void main(String[] args) {
            }
        }
    "#;

    let err = check(src).expect_err("multiple entrypoints should fail");
    assert!(err.to_string().contains("Multiple entry methods found"));
}

#[test]
fn check_rejects_duplicate_fields() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            private int score;
            private int score;

            public static void main() {
            }
        }
    "#;

    let err = check(src).expect_err("duplicate fields should fail");
    assert!(err.to_string().contains("Duplicate field 'Main.score'"));
}

#[test]
fn check_rejects_duplicate_method_signatures() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public void tick(int dt) {
            }

            public void tick(int dt) {
            }

            public static void main() {
            }
        }
    "#;

    let err = check(src).expect_err("duplicate method signatures should fail");
    assert!(err
        .to_string()
        .contains("Duplicate method signature 'tick(int)'"));
}

#[test]
fn check_rejects_assignment_type_mismatch() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            private static int score;

            public static void main() {
                score = "bad";
            }
        }
    "#;

    let err = check(src).expect_err("assignment type mismatch should fail");
    assert!(err
        .to_string()
        .contains("Cannot assign type 'String' to 'int'"));
}

#[test]
fn check_rejects_implicit_signed_to_unsigned_assignment() {
    let src = r#"
        package app.core;

        class Main {
            public static void main() {
                uint value;
                value = 1;
            }
        }
    "#;

    let err = check(src).expect_err("implicit signed->unsigned conversion should fail");
    assert!(err
        .to_string()
        .contains("Implicit numeric conversion 'int' -> 'uint'"));
}

#[test]
fn check_rejects_implicit_unsigned_to_signed_assignment() {
    let src = r#"
        package app.core;

        class Main {
            public static int toSigned(uint u) {
                int i;
                i = u;
                return i;
            }

            public static void main() {
            }
        }
    "#;

    let err = check(src).expect_err("implicit unsigned->signed conversion should fail");
    assert!(err
        .to_string()
        .contains("Implicit numeric conversion 'uint' -> 'int'"));
}

#[test]
fn check_accepts_implicit_widening_assignment() {
    let src = r#"
        package app.core;

        class Main {
            public static void main() {
                int base = 1;
                long total;
                total = base;
            }
        }
    "#;

    check(src).expect("implicit primitive widening should typecheck");
}

#[test]
fn check_accepts_java_like_integral_promotion_and_overload_widening() {
    let src = r#"
        package app.core;

        class Main {
            public static long widen(long value) {
                return value;
            }

            public static void main() {
                byte a = (byte) 1;
                byte b = (byte) 2;
                int promoted = a + b;
                long widened = widen(promoted);
            }
        }
    "#;

    check(src).expect("integral promotion and overload widening should typecheck");
}

#[test]
fn check_accepts_mixed_signed_unsigned_widening_slice() {
    let src = r#"
        package app.core;

        class Main {
            public static long widenLong(long value) {
                return value;
            }

            public static void main() {
                uint wide = (uint) 4000000000L;
                ushort small = (ushort) 65000;
                int signed = 5;
                long combined = wide + signed;
                int compact = small + signed;
                double decimal = wide;
                long widened = widenLong(wide);
            }
        }
    "#;

    check(src).expect("mixed signed/unsigned widening slice should typecheck");
}

#[test]
fn check_rejects_mixed_signed_with_ulong_without_explicit_cast() {
    let src = r#"
        package app.core;

        class Main {
            public static void main() {
                ulong huge = (ulong) 4000000000L;
                long bad = huge + 1L;
            }
        }
    "#;

    let err =
        check(src).expect_err("mixed signed/ulong arithmetic should fail without an explicit cast");
    let msg = err.to_string();
    assert!(msg.contains("ulong") || msg.contains("numeric"));
}

#[test]
fn check_accepts_varargs_applicability_slice() {
    let src = r#"
        package app.core;

        class Main {
            public static int count(String... names) {
                return names.length;
            }

            public static String pick(String name) {
                return name;
            }

            public static String pick(String... names) {
                return "varargs";
            }

            public static void main() {
                String[] names = new String[] { "pulse", "code" };
                int empty = count();
                int packed = count("a", "b");
                int direct = count(names);
                String fixed = pick("x");
                String spread = pick("x", "y");
            }
        }
    "#;

    check(src).expect("varargs applicability slice should typecheck");
}

#[test]
fn check_accepts_erased_generic_applicability_slice() {
    let src = r#"
        package app.generics;
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
            public static Box echoRaw(Box value) {
                return value;
            }

            public static Object widenObject(Object value) {
                return value;
            }

            public static void main() {
                Box<String> box = new Box();
                box.set("pulse");
                Object widened = widenObject(box);
                Box raw = echoRaw(box);
                Object payload = raw.get();
            }
        }
    "#;

    check(src).expect("erased generic applicability slice should typecheck");
}

#[test]
fn check_accepts_typed_numeric_suffix_literals() {
    let src = r#"
        package app.core;

        class Main {
            public static void main() {
                long a = 20L;
                double b = 20.3d;
                float c = 30.5f;
            }
        }
    "#;

    check(src).expect("typed numeric suffix literals should typecheck");
}

#[test]
fn check_accepts_contextual_numeric_literal_mapping_for_long_and_double() {
    let src = r#"
        package app.core;

        class Main {
            public static long l = 10;
            public static double d = 23.3;

            public static long pickLong() {
                return 10;
            }

            public static double pickDouble() {
                return 23.3;
            }

            public static void main() {
                long x;
                double y;
                x = 10;
                y = 23.3;
            }
        }
    "#;

    check(src).expect("numeric literals should map in long/double assignment contexts");
}

#[test]
fn check_accepts_contextual_double_literal_mapping_to_float() {
    let src = r#"
        package app.core;

        class Main {
            public static void main() {
                float f = 23.3;
            }
        }
    "#;

    check(src).expect("unsuffixed decimal literal should map to float in float assignment context");
}

#[test]
fn check_accepts_contextual_int_literal_mapping_to_boxed_long() {
    let src = r#"
        package app.core;
        import pulse.lang.Long;

        class Main {
            public static void main() {
                Long a = 20;
            }
        }
    "#;

    check(src).expect("int literal should contextually map to boxed Long");
}

#[test]
fn check_accepts_explicit_truncation_casts_for_negative_float_and_double() {
    let src = r#"
        package app.core;

        class Main {
            public static void main() {
                int a = (int) (-2.9d);
                long b = (long) (-2.9f);
            }
        }
    "#;

    check(src).expect("explicit float/double to int/long casts should typecheck");
}

#[test]
fn check_accepts_float_double_arithmetic_and_unary_negation() {
    let src = r#"
        package app.core;

        class Main {
            public static void main() {
                float a = 1.5f;
                float b = 2.25f;
                float sum = a + b;
                float neg = -b;
                double mixed = 3 + 0.5d;
                boolean cmp = mixed > 3.0d;
            }
        }
    "#;

    check(src).expect("float/double arithmetic and unary negation should typecheck");
}

#[test]
fn check_rejects_oversized_unsuffixed_integer_literal_even_for_long_target() {
    let src = r#"
        package app.core;

        class Main {
            public static void main() {
                long x = 2147483648;
            }
        }
    "#;

    let err = check(src).expect_err("oversized unsuffixed integer literal should fail");
    assert!(err.to_string().contains("exceeds int range"));
}

#[test]
fn check_accepts_large_long_literal_with_l_suffix() {
    let src = r#"
        package app.core;

        class Main {
            public static void main() {
                long x = 2147483648L;
            }
        }
    "#;

    check(src).expect("large long literal with L suffix should typecheck");
}

#[test]
fn check_accepts_explicit_numeric_cast_expression() {
    let src = r#"
        package app.core;

        class Main {
            public static void main() {
                int a = 10;
                long b = (long) 20;
                int c = 0;
                c = a + (int) b;
            }
        }
    "#;

    check(src).expect("explicit numeric cast should typecheck");
}

#[test]
fn check_rejects_invalid_explicit_cast_expression() {
    let src = r#"
        package app.core;

        class Main {
            public static void main() {
                int x = (int) true;
            }
        }
    "#;

    let err = check(src).expect_err("invalid explicit cast should fail");
    assert!(err
        .to_string()
        .contains("Invalid cast from 'boolean' to 'int'"));
}

#[test]
fn check_accepts_field_initializers_with_casts() {
    let src = r#"
        package app.core;

        class Main {
            public static int a = 10;
            public static long b = (long) 20;
            public static int c = 0;

            public static void main() {
                c = a + (int) b;
            }
        }
    "#;

    check(src).expect("field initializers with explicit casts should typecheck");
}

#[test]
fn check_rejects_incompatible_field_initializer_type() {
    let src = r#"
        package app.core;

        class Main {
            public static int x = true;

            public static void main() {
            }
        }
    "#;

    let err = check(src).expect_err("incompatible field initializer type should fail");
    assert!(err.to_string().contains("field initializer"));
}

#[test]
fn check_accepts_body_statements() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            private static int score;

            public static void main(String[] args) {
                int base = 40;
                score = base + 2;
                IO.println("PulseCode online");
                IO.println(score);
            }
        }
    "#;

    check(src).expect("body statements should typecheck");
}
#[test]
fn check_accepts_if_while_and_comparisons() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static void main() {
                int i = 0;
                while (i < 3 && true) {
                    if (i == 1) {
                        IO.println("mid");
                    } else {
                        IO.println(i);
                    }
                    i = i + 1;
                }
            }
        }
    "#;

    check(src).expect("if/while/comparison flow should typecheck");
}

#[test]
fn check_rejects_non_boolean_if_condition() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static void main() {
                if (1) {
                    IO.println("bad");
                }
            }
        }
    "#;

    let err = check(src).expect_err("if condition must be boolean");
    assert!(err.to_string().contains("If condition"));
}

#[test]
fn check_rejects_non_boolean_while_condition() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static void main() {
                while (5) {
                    IO.println("bad");
                }
            }
        }
    "#;

    let err = check(src).expect_err("while condition must be boolean");
    assert!(err.to_string().contains("While condition"));
}

#[test]
fn check_accepts_for_loop_with_break_and_continue() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static void main() {
                int sum = 0;
                for (int i = 0; i < 10; i = i + 1) {
                    if (i == 3) {
                        continue;
                    }
                    if (i == 8) {
                        break;
                    }
                    sum = sum + i;
                }
                IO.println(sum);
            }
        }
    "#;

    check(src).expect("for loop with break/continue should typecheck");
}

#[test]
fn check_rejects_break_outside_loop() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static void main() {
                break;
            }
        }
    "#;

    let err = check(src).expect_err("break outside loop should fail");
    assert!(err
        .to_string()
        .contains("'break' is only valid inside loops"));
}

#[test]
fn check_rejects_continue_outside_loop() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static void main() {
                continue;
            }
        }
    "#;

    let err = check(src).expect_err("continue outside loop should fail");
    assert!(err
        .to_string()
        .contains("'continue' is only valid inside loops"));
}

#[test]
fn check_rejects_method_call_signature_mismatch() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public void tick(int dt) {
            }

            public static void main() {
                tick("bad");
            }
        }
    "#;

    let err = check(src).expect_err("method call type mismatch should fail");
    assert!(err
        .to_string()
        .contains("No method 'tick' matches argument types (String)"));
    assert!(err.to_string().contains("Available overloads"));
}

#[test]
fn check_accepts_overloaded_method_calls_by_type() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static void hit(int amount) {
            }

            public static void hit(String label) {
            }

            public static void main() {
                hit(10);
                hit("boss");
            }
        }
    "#;

    check(src).expect("overloaded methods should resolve by argument types");
}

#[test]
fn check_accepts_boxing_and_unboxing_in_method_call_arguments() {
    let src = r#"
        package app.core;
        import pulse.lang.Integer;

        class Main {
            public static void takesBox(Integer value) {
            }

            public static void takesRaw(int value) {
            }

            public static void main() {
                Integer boxed;
                boxed = 7;
                takesBox(42);
                takesRaw(boxed);
            }
        }
    "#;

    check(src).expect("method argument matching should allow boxing/unboxing");
}

#[test]
fn check_prefers_exact_primitive_or_wrapper_overload_before_boxing() {
    let src = r#"
        package app.core;
        import pulse.lang.Integer;

        class Main {
            public static int pick(int x) {
                return 1;
            }

            public static boolean pick(Integer x) {
                return true;
            }

            public static void main() {
                Integer boxed;
                boxed = 7;

                int rawResult;
                boolean boxedResult;

                rawResult = pick(5);
                boxedResult = pick(boxed);
            }
        }
    "#;

    check(src).expect("overload resolution should prefer exact primitive/wrapper matches");
}

#[test]
fn check_prefers_exact_wrapper_boxing_over_widening_helper_overload() {
    let src = r#"
        package app.core;
        import pulse.lang.Byte;

        class Main {
            public static boolean pick(int x) {
                return false;
            }

            public static boolean pick(Byte x) {
                return true;
            }

            public static void main() {
                boolean boxedResult;
                boxedResult = pick((byte) 7);
            }
        }
    "#;

    check(src).expect("overload resolution should prefer exact wrapper boxing over widening helper matches");
}

#[test]
fn check_prefers_reference_overload_before_wrapper_unboxing() {
    let src = r#"
        package app.core;
        import pulse.lang.Integer;

        class Main {
            public static boolean pick(Object value) {
                return true;
            }

            public static boolean pick(int value) {
                return false;
            }

            public static void main() {
                Integer boxed;
                boxed = Integer.boxObject(7);

                boolean result;
                result = pick(boxed);
            }
        }
    "#;

    check(src).expect("reference overloads should outrank wrapper unboxing overloads");
}

#[test]
fn check_preserves_exact_char_overloads_alongside_numeric_widening_overloads() {
    let src = r#"
        package app.core;

        class Main {
            public static int pick(short x) {
                return 1;
            }

            public static int pick(char x) {
                return 2;
            }

            public static int pick(int x) {
                return 3;
            }

            public static void main() {
                int result;
                result = pick('Z');
            }
        }
    "#;

    check(src).expect("exact char overload should not be collapsed into widening overloads");
}

#[test]
fn check_accepts_member_field_and_method_chains() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Player {
            public int hp;

            public int getHp() {
                return hp;
            }
        }

        class Main {
            private static Player p;

            public static void main() {
                p = new Player();
                p.hp = 10;
                IO.println(p.getHp());
            }
        }
    "#;

    check(src).expect("member field/method chains should typecheck");
}

#[test]
fn check_rejects_instance_field_access_through_class_reference() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Player {
            public int hp;
        }

        class Main {
            public static void main() {
                Player.hp = 1;
            }
        }
    "#;

    let err = check(src).expect_err("instance field via class should fail");
    assert!(err
        .to_string()
        .contains("Cannot access instance field 'Player.hp' through class reference"));
}

#[test]
fn check_rejects_instance_method_call_from_static_context() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public int ping() {
                return 1;
            }

            public static void main() {
                ping();
            }
        }
    "#;

    let err = check(src).expect_err("instance method from static context should fail");
    assert!(err
        .to_string()
        .contains("Cannot call instance method 'Main.ping' from static context"));
}

#[test]
fn check_accepts_this_field_and_this_method_chains() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            private int score;

            public int read() {
                return this.score;
            }

            public int readViaCall() {
                return this.read();
            }

            public static void main() {
                Main m = new Main();
                IO.println(m.readViaCall());
            }
        }
    "#;

    check(src).expect("this.field and this.method chains should typecheck");
}

#[test]
fn check_accepts_static_member_access_through_class_reference() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static int total;

            public static int readTotal() {
                return total;
            }

            public static void main() {
                Main.total = 7;
                int local = Main.total;
                IO.println(Main.readTotal());
            }
        }
    "#;

    check(src).expect("class-qualified static members should typecheck");
}

#[test]
fn check_accepts_wrapper_and_fully_qualified_static_field_reads() {
    let src = r#"
        package app.core;
        import pulse.lang.Boolean;
        import pulse.lang.IO;

        class Main {
            public static final int VALUE = 7;

            public static void main() {
                boolean a = Boolean.TRUE;
                boolean b = pulse.lang.Boolean.FALSE;
                int c = Main.VALUE;
                IO.println(a);
                IO.println(b);
                IO.println(c);
            }
        }
    "#;

    check(src).expect("wrapper and fully qualified static field reads should typecheck");
}

#[test]
fn check_rejects_this_in_static_context() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            private int score;

            public static void main() {
                this.score = 1;
            }
        }
    "#;

    let err = check(src).expect_err("this in static method should fail");
    assert!(err
        .to_string()
        .contains("Cannot use 'this' in static method 'Main'"));
}

#[test]
fn check_rejects_member_access_on_primitive() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static void main() {
                IO.println(1.x);
            }
        }
    "#;

    let err = check(src).expect_err("primitive member access should fail");
    assert!(err.to_string().contains("Type 'int' has no members"));
}

#[test]
fn check_rejects_unknown_member_access() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Player {
            public int hp;
        }

        class Main {
            public static void main() {
                Player p = new Player();
                IO.println(p.missing);
            }
        }
    "#;

    let err = check(src).expect_err("unknown member should fail");
    assert!(err.to_string().contains("Unknown member 'Player.missing'"));
}

#[test]
fn check_rejects_method_reference_without_call_syntax() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Player {
            public int getHp() {
                return 1;
            }
        }

        class Main {
            public static void main() {
                Player p = new Player();
                IO.println(p.getHp.bad);
            }
        }
    "#;

    let err = check(src).expect_err("method reference chain without call should fail");
    assert!(err
        .to_string()
        .contains("Method 'Player.getHp' requires call syntax"));
}

#[test]
fn check_accepts_do_while_loop() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static void main() {
                int i = 0;
                do {
                    i = i + 1;
                } while (i < 3);
            }
        }
    "#;

    check(src).expect("do-while should typecheck");
}

#[test]
fn check_rejects_non_boolean_do_while_condition() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static void main() {
                do {
                } while (1);
            }
        }
    "#;

    let err = check(src).expect_err("do-while condition must be boolean");
    assert!(err.to_string().contains("Do-while condition"));
}

#[test]
fn check_accepts_switch_with_break_and_default() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static void main() {
                int code = 2;
                switch (code) {
                    case 1:
                        IO.println("one");
                        break;
                    case 2:
                        IO.println("two");
                        break;
                    default:
                        IO.println("other");
                        break;
                }
            }
        }
    "#;

    check(src).expect("switch with literal cases should typecheck");
}

#[test]
fn check_rejects_switch_case_type_mismatch() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static void main() {
                int code = 2;
                switch (code) {
                    case "bad":
                        break;
                }
            }
        }
    "#;

    let err = check(src).expect_err("switch case type mismatch should fail");
    assert!(err.to_string().contains("Switch case type mismatch"));
}

#[test]
fn check_accepts_prefix_and_postfix_inc_dec() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static void main() {
                int i = 0;
                ++i;
                i++;
                --i;
                i--;
            }
        }
    "#;

    check(src).expect("prefix/postfix ++/-- should typecheck");
}

#[test]
fn check_rejects_inc_on_non_int() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static void main() {
                boolean ok = true;
                ++ok;
            }
        }
    "#;

    let err = check(src).expect_err("++ on non-int should fail");
    assert!(err.to_string().contains("requires numeric target"));
}

#[test]
fn check_accepts_compound_assignments() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static void main() {
                int x = 10;
                x += 2;
                x -= 1;
                x *= 3;
                x /= 2;
                x %= 5;

                double ratio = 5.5d % 2.0d;

                String s = "Pulse";
                s += "Code";
            }
        }
    "#;

    check(src).expect("compound assignments should typecheck");
}

#[test]
fn check_rejects_bad_compound_assignment_type() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static void main() {
                int x = 1;
                x += true;
            }
        }
    "#;

    let err = check(src).expect_err("bad compound assignment should fail");
    assert!(err
        .to_string()
        .contains("Operator '+' requires matching numeric operands or String concatenation"));
}

#[test]
fn check_accepts_arithmetic_for_long_short_byte_and_unsigned_pairs() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static long longOps(long l1, long l2) {
                long l3 = l1 + l2;
                long l4 = l1 - l2;
                if (l3 > l4) {
                    return l3;
                }
                return l4;
            }

            public static int shortOps(short s1, short s2) {
                int s3 = s1 + s2;
                return s3;
            }

            public static int byteOps(byte b1, byte b2) {
                int b3 = b1 + b2;
                return b3;
            }

            public static uint ushortOps(ushort a, ushort b) {
                uint c = a + b;
                return c;
            }

            public static uint uintOps(uint u1, uint u2) {
                uint u3 = u1 + u2;
                return u3;
            }

            public static void main() {
                IO.println(true);
            }
        }
    "#;

    check(src).expect("matching-width arithmetic should typecheck for supported primitives");
}

#[test]
fn check_accepts_bitwise_shift_and_lazy_logical_operator_family() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static boolean side() {
                IO.println(99);
                return true;
            }

            public static void main() {
                int bits = 5 & 3;
                bits |= 8;
                bits ^= 2;
                bits <<= 1;
                bits >>= 2;
                bits >>>= 1;

                uint unsignedBits = (uint) 12;
                unsignedBits >>= 1;

                boolean both = true & false;
                boolean either = false | true;
                boolean diff = true ^ false;
                boolean lazyAnd = false && side();
                boolean lazyOr = true || side();

                int inverted = ~1;
                IO.println(bits);
                IO.println((int) unsignedBits);
                IO.println(both);
                IO.println(either);
                IO.println(diff);
                IO.println(lazyAnd);
                IO.println(lazyOr);
                IO.println(inverted);
            }
        }
    "#;

    check(src).expect("bitwise/shift and lazy logical operator family should typecheck");
}

#[test]
fn check_accepts_local_var_inference_for_locals_and_foreach() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Box {
            public int value() {
                return 7;
            }
        }

        class Main {
            public static void main() {
                var count = 3;
                var title = "Pulse";
                var box = new Box();
                int[] values = new int[] { 1, 2, 3 };

                for (var value : values) {
                    IO.println(value + count);
                }

                IO.println(title);
                IO.println(box.value());
            }
        }
    "#;

    check(src).expect("local var inference should typecheck for supported locals and foreach");
}

#[test]
fn check_rejects_local_var_without_initializer_or_null_initializer() {
    let missing_init = r#"
        package app.core;

        class Main {
            public static void main() {
                var value;
            }
        }
    "#;

    let err = check(missing_init).expect_err("var without initializer should fail");
    assert!(err.to_string().contains("requires an initializer"));

    let null_init = r#"
        package app.core;

        class Main {
            public static void main() {
                var value = null;
            }
        }
    "#;

    let err = check(null_init).expect_err("var from null should fail");
    assert!(err.to_string().contains("cannot infer from 'null'"));
}

#[test]
fn check_accepts_switch_expression_arrow_slice() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static void main() {
                int code = 2;
                int value = switch (code) {
                    case 1 -> 10;
                    case 2 -> 20;
                    default -> 30;
                };

                String label = switch (code) {
                    case 1 -> "one";
                    default -> "other";
                };

                IO.println(value);
                IO.println(label);
            }
        }
    "#;

    check(src).expect("switch expression arrow slice should typecheck");
}

#[test]
fn check_rejects_switch_expression_yield_block_slice() {
    let src = r#"
        package app.core;

        class Main {
            public static void main() {
                int code = 1;
                int value = switch (code) {
                    case 1 -> { yield 10; }
                    default -> 20;
                };
            }
        }
    "#;

    let err = check(src).expect_err("yield block slice should be fenced explicitly");
    assert!(err
        .to_string()
        .contains("Switch-expression block arms with 'yield' are not supported"));
}

#[test]
fn check_accepts_null_for_reference_types() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Player {
        }

        class Main {
            public static void main() {
                Player p = null;
                String name = null;

                if (p == null) {
                    IO.println(name);
                }
            }
        }
    "#;

    check(src).expect("null should be allowed for reference types");
}

#[test]
fn check_rejects_null_for_primitive_types() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static void main() {
                int x = null;
            }
        }
    "#;

    let err = check(src).expect_err("null to primitive should fail");
    assert!(err
        .to_string()
        .contains("Cannot assign type 'null' to 'int'"));
}

#[test]
fn check_rejects_unboxing_definite_null_wrapper_assignment() {
    let src = r#"
        package app.core;
        import pulse.lang.Integer;

        class Main {
            public static void main() {
                Integer boxed;
                int raw;
                boxed = null;
                raw = boxed;
            }
        }
    "#;

    let err = check(src).expect_err("definite-null wrapper unboxing should fail");
    assert!(err
        .to_string()
        .contains("Cannot unbox null variable 'boxed' to primitive 'int'"));
}

#[test]
fn check_accepts_unboxing_after_non_null_flow_narrowing() {
    let src = r#"
        package app.core;
        import pulse.lang.Integer;

        class Main {
            public static void main() {
                Integer boxed;
                boxed = 7;
                if (boxed != null) {
                    int raw;
                    raw = boxed;
                }
            }
        }
    "#;

    check(src).expect("unboxing in non-null narrowed branch should pass");
}

#[test]
fn check_rejects_unboxing_definite_null_wrapper_in_call_arg_and_return() {
    let src = r#"
        package app.core;
        import pulse.lang.Integer;

        class Main {
            private static Integer boxed;

            public static void takesInt(int value) {
            }

            public static int unwrap() {
                return boxed;
            }

            public static void main() {
                boxed = null;
                takesInt(boxed);
            }
        }
    "#;

    let err = check(src).expect_err("definite-null wrapper unboxing in call/return should fail");
    assert!(err
        .to_string()
        .contains("Cannot unbox null variable 'boxed' to primitive 'int'"));
}

#[test]
fn check_rejects_definite_null_dereference() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Player {
            public int hp;
        }

        class Main {
            public static void main() {
                Player p = null;
                IO.println(p.hp);
            }
        }
    "#;

    let err = check(src).expect_err("definite null dereference should fail");
    assert!(err
        .to_string()
        .contains("Definite null dereference on variable 'p'"));
}

#[test]
fn check_accepts_null_flow_narrowing_in_if() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Player {
            public int hp;
        }

        class Main {
            public static void main() {
                Player p = null;
                if (p != null) {
                    IO.println(p.hp);
                }
            }
        }
    "#;

    check(src).expect("if null-check should narrow variable to non-null in then branch");
}

#[test]
fn check_accepts_null_flow_narrowing_on_short_circuit_boolean_rhs() {
    let src = r#"
        package app.core;
        import pulse.lang.Integer;
        import pulse.lang.IO;

        class Player {
            public int hp;
        }

        class Main {
            public static void takesInt(int value) {
                IO.println(value);
            }

            public static void main() {
                Player p = new Player();
                Integer boxed = 7;

                if (p != null && p.hp >= 0) {
                    IO.println(p.hp);
                }

                if (p == null || p.hp >= 0) {
                    IO.println(1);
                }

                if (boxed != null && true) {
                    takesInt(boxed);
                }

                if (boxed == null || true) {
                    IO.println(2);
                }
            }
        }
    "#;

    check(src).expect("short-circuit rhs should inherit null-flow narrowing from lhs");
}

#[test]
fn check_accepts_null_flow_narrowing_in_loop_conditions() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Player {
            public int hp;
        }

        class Main {
            public static void main() {
                Player p = new Player();
                while (p != null) {
                    IO.println(p.hp);
                    p = null;
                }

                p = new Player();
                for (; p != null; ) {
                    IO.println(p.hp);
                    break;
                }
            }
        }
    "#;

    check(src).expect("loop conditions should narrow nullability inside the loop body");
}

#[test]
fn check_accepts_null_flow_after_finally_assignment() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Player {
            public int hp;
        }

        class Main {
            public static void main() {
                Player p = null;
                try {
                } finally {
                    p = new Player();
                }
                IO.println(p.hp);
            }
        }
    "#;

    check(src).expect("finally assignment should update post-try null state");
}

#[test]
fn check_accepts_try_with_resources_baseline() {
    let src = r#"
        package app.core;
        import pulse.lang.AutoCloseable;
        import pulse.lang.Exception;

        class Probe implements AutoCloseable {
            public void close() {
            }
        }

        class Main {
            public static void main() {
                try (Probe first = new Probe(); Probe second = new Probe()) {
                } catch (Exception ex) {
                }
            }
        }
    "#;

    check(src).expect("try-with-resources baseline should typecheck");
}

#[test]
fn check_rejects_try_with_resources_non_autocloseable_type() {
    let src = r#"
        package app.core;
        import pulse.lang.Exception;

        class Probe {
        }

        class Main {
            public static void main() {
                try (Probe probe = new Probe()) {
                } catch (Exception ex) {
                }
            }
        }
    "#;

    let err = check(src).expect_err("non-AutoCloseable resource should fail");
    assert!(err
        .to_string()
        .contains("try-with-resources value in 'Main.main'"));
    assert!(err.to_string().contains("AutoCloseable"));
}

#[test]
fn check_rejects_private_field_access_from_other_class() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Player {
            private int hp;
        }

        class Main {
            public static void main() {
                Player p = new Player();
                IO.println(p.hp);
            }
        }
    "#;

    let err = check(src).expect_err("private field access should fail");
    assert!(err
        .to_string()
        .contains("Cannot access private field 'Player.hp' from class 'Main'"));
}

#[test]
fn check_rejects_private_method_access_from_other_class() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Player {
            private int hp() {
                return 1;
            }
        }

        class Main {
            public static void main() {
                Player p = new Player();
                IO.println(p.hp());
            }
        }
    "#;

    let err = check(src).expect_err("private method access should fail");
    assert!(err
        .to_string()
        .contains("Cannot access private method 'Player.hp' from class 'Main'"));
}

#[test]
fn check_accepts_private_access_within_same_class() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            private int score;

            private int read() {
                return score;
            }

            public static void main() {
                Main m = new Main();
                IO.println(m.read());
            }
        }
    "#;

    check(src).expect("private members should be accessible within the same class");
}

#[test]
fn check_accepts_protected_access_from_other_class_same_package() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Player {
            protected int hp() {
                return 7;
            }
        }

        class Main {
            public static void main() {
                Player p = new Player();
                IO.println(p.hp());
            }
        }
    "#;

    check(src)
        .expect("protected should be accessible in same package (temporary no-inheritance rule)");
}

#[test]
fn check_accepts_package_private_access_from_other_class_same_package() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Player {
            int hp;
        }

        class Main {
            public static void main() {
                Player p = new Player();
                p.hp = 3;
                IO.println(p.hp);
            }
        }
    "#;

    check(src).expect("package-private should be accessible in same package");
}

#[test]
fn check_accepts_object_methods_on_interface_typed_receivers() {
    let src = r#"
        package app.core;

        interface Named {
            String name();
        }

        class Box implements Named {
            public String name() {
                return "pulse";
            }
        }

        class Main {
            public static void main() {
                Named value = new Box();
                String text = value.toString();
                boolean same = value.equals(value);
                int hash = value.hashCode();
            }
        }
    "#;

    check(src).expect("interface-typed receivers should inherit Object methods");
}

#[test]
fn check_rejects_non_void_method_without_definite_return() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public int pick(int x) {
                if (x > 0) {
                    return 1;
                }
            }

            public static void main() {
            }
        }
    "#;

    let err = check(src).expect_err("missing return path should fail");
    assert!(err.to_string().contains("must return 'int' on all paths"));
}

#[test]
fn allows_constructor_initialization_of_final_instance_fields() {
    let src = r#"
        package app.core;

        class Box {
            public final int value;

            public Box(int value) {
                this.value = value;
            }
        }

        class Main {
            public static void main() {
                Box box = new Box(1);
            }
        }
    "#;

    check(src).expect("constructor should be allowed to initialize final instance fields");
}
