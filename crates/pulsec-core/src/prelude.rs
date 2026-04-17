pub const IMPLICIT_PRELUDE_PACKAGES: &[&str] = &[
    "pulse.io",
    "pulse.math",
    "pulse.collections",
    "pulse.lang",
];

pub fn implicit_prelude_packages() -> &'static [&'static str] {
    IMPLICIT_PRELUDE_PACKAGES
}
