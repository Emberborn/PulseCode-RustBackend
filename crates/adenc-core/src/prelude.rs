pub const IMPLICIT_PRELUDE_PACKAGES: &[&str] =
    &["aden.io", "aden.math", "aden.collections", "aden.lang"];

pub fn implicit_prelude_packages() -> &'static [&'static str] {
    IMPLICIT_PRELUDE_PACKAGES
}
