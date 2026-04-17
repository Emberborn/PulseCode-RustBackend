use super::*;

#[test]
fn lexes_basic_file() {
    let src = "package app.core; class Main { public static void main() { } }";
    let tokens = lex(src).expect("lex should pass");
    assert!(!tokens.is_empty());
    assert_eq!(tokens.last().expect("has EOF").kind, TokenKind::Eof);
}

#[test]
fn lex_skips_line_comments() {
    let src = r#"
        package app.core; // package comment
        class Main {
            // inside class
            public static void main() { // inline comment
            }
        }
    "#;
    let tokens = lex(src).expect("lex should pass with line comments");
    assert!(tokens.iter().any(|t| t.lexeme == "package"));
    assert!(tokens.iter().any(|t| t.lexeme == "Main"));
    assert!(tokens.iter().all(|t| t.lexeme != "//"));
}

#[test]
fn lex_skips_block_and_doc_comments() {
    let src = r#"
        package app.core;
        /* block comment */
        /**
         * doc comment
         */
        class Main {
            public static void main() {
                /* inline block */
            }
        }
    "#;
    let tokens = lex(src).expect("lex should pass with block/doc comments");
    assert!(tokens.iter().any(|t| t.lexeme == "class"));
    assert!(tokens.iter().any(|t| t.lexeme == "main"));
}

#[test]
fn lex_rejects_unterminated_block_comment() {
    let src = "package app.core; /* never closed";
    let err = lex(src).expect_err("unterminated block comment should fail");
    assert!(err.to_string().contains("Unterminated block comment"));
}

#[test]
fn lex_skips_region_line_comments() {
    let src = r#"
        package app.core;
        class Main {
            //region lifecycle
            public static void main() {
            }
            //end region
        }
    "#;
    let tokens = lex(src).expect("lex should pass with region comments");
    assert!(tokens.iter().any(|t| t.lexeme == "main"));
}

#[test]
fn lex_recognizes_f1_keyword_expansion() {
    let src = "package app.core; class Main { public static void main() { enum throw try catch finally assert new throws; } }";
    let tokens = lex(src).expect("lex should pass");
    for keyword in [
        "enum", "throw", "try", "catch", "finally", "assert", "new", "throws",
    ] {
        let token = tokens
            .iter()
            .find(|token| token.lexeme == keyword)
            .expect("keyword present");
        assert_eq!(
            token.kind,
            TokenKind::Keyword,
            "{keyword} should lex as keyword"
        );
    }
}

#[test]
fn lex_supports_char_literals_and_escapes() {
    let tokens = lex(r"'a' '\n' '\u0041'").expect("char literals should lex");
    let chars: Vec<_> = tokens
        .into_iter()
        .filter(|token| token.kind == TokenKind::Char)
        .collect();
    assert_eq!(chars.len(), 3);
    assert_eq!(chars[0].lexeme, "a");
    assert_eq!(chars[1].lexeme, "\n");
    assert_eq!(chars[2].lexeme, "A");
}

#[test]
fn lex_rejects_invalid_char_literals_and_escapes() {
    let empty = lex("''").expect_err("empty char should fail");
    assert!(empty.to_string().contains("Char literal cannot be empty"));

    let long = lex("'ab'").expect_err("multi-char literal should fail");
    assert!(long
        .to_string()
        .contains("must contain exactly one character or escape"));

    let bad_escape = lex(r"'\x'").expect_err("invalid char escape should fail");
    assert!(bad_escape.to_string().contains("Invalid escape sequence"));
}

#[test]
fn lex_supports_java_close_numeric_literal_forms() {
    let tokens = lex("0x2A 0b101010 052 1_000 3.14_15F 6.02_2D 42L")
        .expect("numeric literal breadth should lex");
    let numbers: Vec<_> = tokens
        .into_iter()
        .filter(|token| token.kind == TokenKind::Number)
        .map(|token| token.lexeme)
        .collect();
    assert_eq!(
        numbers,
        vec!["0x2A", "0b101010", "052", "1_000", "3.14_15F", "6.02_2D", "42L"]
    );
}

#[test]
fn lex_rejects_invalid_java_like_numeric_literals() {
    let bad_underscore = lex("1__0").expect_err("bad underscore should fail");
    assert!(bad_underscore
        .to_string()
        .contains("invalid underscore placement"));

    let bad_binary = lex("0b102").expect_err("bad binary digit should fail");
    assert!(bad_binary.to_string().contains("invalid digit '2'"));

    let bad_octal = lex("09").expect_err("bad octal digit should fail");
    assert!(bad_octal.to_string().contains("invalid digit '9'"));
}

#[test]
fn lex_supports_future_syntax_family_tokens() {
    let tokens = lex("a -> b :: c ...").expect("future syntax tokens should lex");
    let symbols: Vec<_> = tokens
        .into_iter()
        .filter(|token| token.kind == TokenKind::Symbol)
        .map(|token| token.lexeme)
        .collect();
    assert!(symbols.contains(&"->".to_string()));
    assert!(symbols.contains(&"::".to_string()));
    assert!(symbols.contains(&"...".to_string()));
}

#[test]
fn parses_sample_program() {
    let src = r#"
        package game.demo;

        import pulse.lang.IO;

        class Main {
            private int score;

            public Main() {
            }

            public static void main(String[] args) {
            }
        }
    "#;

    let program = parse(src).expect("parse should succeed");
    assert_eq!(program.package.name, "game.demo");
    assert_eq!(program.imports.len(), 1);
    assert_eq!(program.classes.len(), 1);

    let class = &program.classes[0];
    assert_eq!(class.name, "Main");
    assert_eq!(class.members.len(), 3);
}

#[test]
fn parse_accepts_java_close_numeric_literals() {
    let src = r#"
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
        }
    "#;

    check(src).expect("java-close numeric literals should parse and check");
}

#[test]
fn check_accepts_char_literals_in_declarations_and_calls() {
    let src = r#"
        package app.core;
        import pulse.lang.Char;

        class Main {
            public static void main() {
                char a = 'a';
                Char boxed = 'b';
                printChar('z');
            }

            public static void printChar(char value) {
            }
        }
    "#;

    check(src).expect("char literals should typecheck in the selected F1 baseline");
}

#[test]
fn check_accepts_varargs_entry_signature_as_array_backed_baseline() {
    let src = r#"
        package app.core;

        class Main {
            public static void main(String... args) {
            }
        }
    "#;

    check(src).expect("String... entry signature should map to the array-backed baseline");
}

#[test]
fn parse_rejects_non_terminal_varargs_parameter() {
    let src = r#"
        package app.core;

        class Main {
            public static void main(String... args, int count) {
            }
        }
    "#;

    let err = parse(src).expect_err("varargs must be last");
    assert!(err
        .to_string()
        .contains("Varargs parameter must be the last parameter"));
}

#[test]
fn parse_rejects_nested_type_declarations_with_explicit_diagnostic() {
    let src = r#"
        package app.core;

        class Main {
            public static class Nested() {
            }
        }
    "#;

    let err = parse(src).expect_err("nested types should fail with explicit diagnostic");
    assert!(err
        .to_string()
        .contains("Nested type declarations are not supported yet"));
}

#[test]
fn parse_rejects_local_type_declarations_with_explicit_diagnostic() {
    let src = r#"
        package app.core;

        class Main {
            public static void main() {
                class Local {
                }
            }
        }
    "#;

    let err = parse(src).expect_err("local types should fail with explicit diagnostic");
    assert!(err
        .to_string()
        .contains("Local type declarations are not supported"));
}

#[test]
fn parse_rejects_anonymous_class_expressions_with_explicit_diagnostic() {
    let src = r#"
        package app.core;

        interface Task {
            void run();
        }

        class Main {
            public static void main() {
                Task t = new Task() {
                    public void run() {
                    }
                };
            }
        }
    "#;

    let err = parse(src).expect_err("anonymous classes should fail with explicit diagnostic");
    assert!(err
        .to_string()
        .contains("Anonymous class bodies are not supported"));
}

#[test]
fn check_accepts_void_main_without_args() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static void main() {
            }
        }
    "#;

    check(src).expect("void main without args should pass");
}

#[test]
fn check_accepts_void_main_with_string_array_args() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static void main(String[] args) {
            }
        }
    "#;

    check(src).expect("void main with String[] args should pass");
}

#[test]
fn check_accepts_fully_qualified_static_call_without_import() {
    let src = r#"
        package app.core;

        class Main {
            public static void main() {
                pulse.lang.IO.println("ok");
            }
        }
    "#;

    check(src).expect("fully-qualified static call should pass without import");
}

#[test]
fn check_accepts_static_wildcard_import_for_io_println() {
    let src = r#"
        package app.core;
        import static pulse.lang.IO.*;

        class Main {
            public static void main() {
                println("hello world.");
            }
        }
    "#;

    check(src).expect("static wildcard import should allow unqualified println");
}

#[test]
fn check_rejects_non_void_main() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            public static int main() {
                return 0;
            }
        }
    "#;

    let err = check(src).expect_err("non-void main should fail");
    assert!(err.to_string().contains("must return void"));
}

#[test]
fn check_rejects_unknown_field_type() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            private Mystery score;
            public static void main() {
            }
        }
    "#;

    let err = check(src).expect_err("unknown field type should fail");
    assert!(err.to_string().contains("Unknown type 'Mystery'"));
}

#[test]
fn check_accepts_unsigned_types() {
    let src = r#"
        package app.core;
        import pulse.lang.IO;

        class Main {
            private uint ticks;
            public static void main(String[] args) {
            }
        }
    "#;

    check(src).expect("unsigned primitive types should pass");
}

#[test]
fn check_accepts_wrapper_types_in_declarations() {
    let src = r#"
        package app.core;
        import pulse.lang.Byte;
        import pulse.lang.Short;
        import pulse.lang.Integer;
        import pulse.lang.Long;
        import pulse.lang.Float;
        import pulse.lang.Double;
        import pulse.lang.Char;
        import pulse.lang.Boolean;
        import pulse.lang.UByte;
        import pulse.lang.UShort;
        import pulse.lang.UInteger;
        import pulse.lang.ULong;
        import pulse.lang.Void;

        class Main {
            private Byte b;
            private Short s;
            private Integer i;
            private Long l;
            private Float f;
            private Double d;
            private Char c;
            private Boolean ok;
            private UByte ub;
            private UShort us;
            private UInteger ui;
            private ULong ul;
            private Void none;

            public static void main() {
            }
        }
    "#;

    check(src).expect("wrapper classes should resolve in declarations");
}

#[test]
fn check_accepts_wrapper_api_surface_calls() {
    let src = r#"
        package app.core;
        import pulse.lang.Integer;
        import pulse.lang.Boolean;

        class Main {
            public static void main() {
                Integer parsed = Integer.parse("12");
                Integer boxed = Integer.valueOf(8);
                int raw = Integer.intValue(parsed);
                boolean eq = Integer.equals(raw, Integer.intValue(boxed));
                int cmp = Integer.compare(raw, Integer.intValue(boxed));

                Boolean flag = Boolean.parse("true");
                boolean b = Boolean.booleanValue(flag);
                boolean beq = Boolean.equals(b, true);
                int bcmp = Boolean.compare(b, false);
            }
        }
    "#;

    check(src).expect("wrapper API surface should typecheck");
}

#[test]
fn check_accepts_core_bootstrap_lang_class_usage() {
    let src = r#"
        package app.core;
        import pulse.lang.Object;
        import pulse.lang.Class;
        import pulse.lang.StringBuilder;
        import pulse.lang.Comparable;
        import pulse.lang.Iterable;
        import pulse.lang.Iterator;

        class CounterIter implements Iterator {
            private int i;

            public CounterIter() {
                this.i = 0;
            }

            public boolean hasNext() {
                return this.i < 2;
            }

            public Object next() {
                this.i = this.i + 1;
                return new Object();
            }
        }

        class CounterBag implements Iterable {
            public Iterator iterator() {
                return new CounterIter();
            }
        }

        class Ranker implements Comparable {
            private int score;

            public Ranker(int score) {
                this.score = score;
            }

            public int compareTo(Object other) {
                return this.score;
            }
        }

        class Main {
            public static void main() {
                Object o = new Object();
                Class c = o.getClass();

                StringBuilder sb = new StringBuilder("kind=");
                sb.append(c.getName());
                sb.append(",ok=");
                sb.append(o.equals(o));

                Iterable bag = new CounterBag();
                Iterator it = bag.iterator();
                while (it.hasNext()) {
                    it.next();
                }

                Comparable cmp = new Ranker(7);
                cmp.compareTo(o);
                sb.toString();
            }
        }
    "#;

    check(src).expect("core bootstrap lang classes/interfaces should typecheck");
}

#[test]
fn check_accepts_exception_base_hierarchy_assignments_and_methods() {
    let src = r#"
        package app.core;
        import pulse.lang.Throwable;
        import pulse.lang.Exception;
        import pulse.lang.RuntimeException;

        class Main {
            public static void main() {
                RuntimeException rt = new RuntimeException("boom");
                Exception ex = rt;
                Throwable th = ex;

                String m = th.getMessage();
                String s = rt.toString();
            }
        }
    "#;

    check(src).expect("exception base hierarchy should typecheck");
}

#[test]
fn check_accepts_stdlib_enum_bootstrap_type_import() {
    let src = r#"
        package app.core;
        import pulse.lang.Enum;

        class Main {
            private Enum kind;

            public static void main() {
            }
        }
    "#;

    check(src).expect("stdlib enum bootstrap type should be importable");
}

#[test]
fn check_accepts_stdlib_autocloseable_bootstrap_type_import() {
    let src = r#"
        package app.core;
        import pulse.lang.AutoCloseable;

        class Main {
            private AutoCloseable handle;

            public static void main() {
            }
        }
    "#;

    check(src).expect("stdlib AutoCloseable bootstrap type should be importable");
}

#[test]
fn parse_accepts_try_with_resources_statement() {
    let src = r#"
        package app.core;
        import pulse.io.InputStream;

        class Main {
            public static void main() {
                try (InputStream input = new InputStream("x")) {
                }
            }
        }
    "#;

    let program = parse(src).expect("try-with-resources should parse");
    let method = match &program.classes[0].members[0] {
        crate::ClassMember::Method(method) => method,
        _ => panic!("expected method"),
    };
    match &method.body[0] {
        crate::Stmt::Try { resources, .. } => assert_eq!(resources.len(), 1),
        _ => panic!("expected try statement"),
    }
}

#[test]
fn parse_accepts_modulo_and_mod_compound_assignment() {
    let src = r#"
        package app.core;

        class Main {
            public static void main() {
                int x = 10 % 3;
                x %= 2;
                double y = 5.5d % 2.0d;
            }
        }
    "#;

    parse(src).expect("parser should accept modulo expressions and %= assignments");
}

#[test]
fn check_accepts_runtime_exception_subclasses_in_base_slots() {
    let src = r#"
        package app.core;
        import pulse.lang.Throwable;
        import pulse.lang.Exception;
        import pulse.lang.RuntimeException;
        import pulse.lang.IllegalArgumentException;
        import pulse.lang.IllegalStateException;
        import pulse.lang.NullPointerException;
        import pulse.lang.IndexOutOfBoundsException;
        import pulse.lang.UnsupportedOperationException;
        import pulse.lang.NumberFormatException;

        class Main {
            public static void main() {
                IllegalArgumentException iae = new IllegalArgumentException("bad arg");
                IllegalStateException ise = new IllegalStateException("bad state");
                NullPointerException npe = new NullPointerException("bad null");
                IndexOutOfBoundsException iobe = new IndexOutOfBoundsException("bad idx");
                UnsupportedOperationException uoe = new UnsupportedOperationException("bad op");
                NumberFormatException nfe = new NumberFormatException("bad num");

                RuntimeException rt = iae;
                rt = ise;
                rt = npe;
                rt = iobe;
                rt = uoe;
                rt = nfe;

                Exception ex = rt;
                Throwable th = ex;
                String msg = th.getMessage();
                String txt = iae.toString().concat(ise.toString());
                txt = txt.concat(npe.toString());
                txt = txt.concat(iobe.toString());
                txt = txt.concat(uoe.toString());
                txt = txt.concat(nfe.toString());
            }
        }
    "#;

    check(src).expect("runtime exception subclasses should typecheck");
}

#[test]
fn check_accepts_boxing_and_unboxing_at_assignment_boundaries() {
    let src = r#"
        package app.core;
        import pulse.lang.Integer;

        class Main {
            public static void main() {
                Integer boxed;
                int raw;

                boxed = 7;
                raw = boxed;
            }
        }
    "#;

    check(src).expect("primitive/wrapper assignment boundaries should typecheck");
}

#[test]
fn check_accepts_boxing_unboxing_roundtrip_for_all_supported_pairs() {
    let src = r#"
        package app.core;
        import pulse.lang.Byte;
        import pulse.lang.Short;
        import pulse.lang.Integer;
        import pulse.lang.Long;
        import pulse.lang.Float;
        import pulse.lang.Double;
        import pulse.lang.Char;
        import pulse.lang.Boolean;
        import pulse.lang.UByte;
        import pulse.lang.UShort;
        import pulse.lang.UInteger;
        import pulse.lang.ULong;

        class Main {
            public static void probe(
                byte pb, Byte wb,
                short ps, Short ws,
                int pi, Integer wi,
                long pl, Long wl,
                float pf, Float wf,
                double pd, Double wd,
                char pc, Char wc,
                boolean pz, Boolean wz,
                ubyte pub, UByte wub,
                ushort pus, UShort wus,
                uint pui, UInteger wui,
                ulong pul, ULong wul
            ) {
                wb = pb; pb = wb;
                ws = ps; ps = ws;
                wi = pi; pi = wi;
                wl = pl; pl = wl;
                wf = pf; pf = wf;
                wd = pd; pd = wd;
                wc = pc; pc = wc;
                wz = pz; pz = wz;
                wub = pub; pub = wub;
                wus = pus; pus = wus;
                wui = pui; pui = wui;
                wul = pul; pul = wul;
            }

            public static void main() {
            }
        }
    "#;

    check(src).expect("all supported primitive/wrapper roundtrips should typecheck");
}

#[test]
fn check_accepts_runtime_intrinsics_calls() {
    let src = r#"
        package app.core;
        import pulse.rt.Intrinsics;

        class Main {
            public static void main() {
                Intrinsics.consoleWrite("tick");
                Intrinsics.consoleWriteLine("1");
            }
        }
    "#;

    check(src).expect("runtime intrinsics calls should pass");
}

#[test]
fn check_accepts_arc_retain_release_intrinsics_calls() {
    let src = r#"
        package app.core;
        import pulse.memory.Memory;

        class Main {
            public static void main() {
                long handle = Memory.retain(0L);
                Memory.release(handle);
            }
        }
    "#;

    check(src).expect("ARC retain/release intrinsic calls should pass");
}

#[test]
fn check_accepts_static_wildcard_import_for_memory_surface() {
    let src = r#"
        package app.core;
        import static pulse.memory.Memory.*;

        class Main {
            public static void main() {
                long handle = retain(0L);
                release(handle);
                cycleTick();
            }
        }
    "#;

    check(src).expect("static wildcard import should allow unqualified memory calls");
}

#[test]
fn check_accepts_runtime_panic_intrinsic_call() {
    let src = r#"
        package app.core;
        import pulse.rt.Intrinsics;

        class Main {
            public static void main() {
                Intrinsics.panic("boom");
            }
        }
    "#;

    check(src).expect("runtime panic intrinsic call should pass");
}
