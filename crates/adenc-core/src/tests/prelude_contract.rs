use crate::{check, implicit_prelude_packages};

#[test]
fn prelude_contract_packages_are_locked() {
    assert_eq!(
        implicit_prelude_packages(),
        &["aden.io", "aden.math", "aden.collections", "aden.lang"]
    );
}

#[test]
fn prelude_contract_resolves_lang_io_math_and_collections_without_imports() {
    let src = r#"
        package app.core;

        class Main {
            public static void main() {
                List values = new ArrayList();
                Collection base = values;
                int n = Math.abs(-7);
                IO.println(n);
                IO.println(base.size());
            }
        }
    "#;

    check(src).expect("implicit prelude contract should resolve current default-import packages");
}
