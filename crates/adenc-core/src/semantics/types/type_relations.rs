use super::*;

#[allow(dead_code)]
const PRIMITIVE_WRAPPER_FQCNS: &[(&str, &str)] = &[
    ("byte", "aden.lang.Byte"),
    ("short", "aden.lang.Short"),
    ("int", "aden.lang.Integer"),
    ("long", "aden.lang.Long"),
    ("float", "aden.lang.Float"),
    ("double", "aden.lang.Double"),
    ("char", "aden.lang.Char"),
    ("boolean", "aden.lang.Boolean"),
    ("ubyte", "aden.lang.UByte"),
    ("ushort", "aden.lang.UShort"),
    ("uint", "aden.lang.UInteger"),
    ("ulong", "aden.lang.ULong"),
    ("void", "aden.lang.Void"),
];

#[allow(dead_code)]
pub(super) fn primitive_wrapper_type(primitive: &str) -> Option<&'static str> {
    PRIMITIVE_WRAPPER_FQCNS
        .iter()
        .find_map(|(p, w)| if *p == primitive { Some(*w) } else { None })
}

pub(super) fn wrapper_primitive_type(wrapper_ty: &str) -> Option<&'static str> {
    let simple = class_simple_name(wrapper_ty);
    PRIMITIVE_WRAPPER_FQCNS
        .iter()
        .find_map(|(primitive, wrapper)| {
            if *wrapper == wrapper_ty || class_simple_name(wrapper) == simple {
                Some(*primitive)
            } else {
                None
            }
        })
}

pub(super) fn is_boxing_pair(wrapper_expected: &str, primitive_actual: &str) -> bool {
    let primitive_actual = class_simple_name(primitive_actual);
    match wrapper_primitive_type(wrapper_expected) {
        Some(primitive) => primitive == primitive_actual,
        None => false,
    }
}
