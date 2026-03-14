use super::*;

#[allow(dead_code)]
const PRIMITIVE_WRAPPER_FQCNS: &[(&str, &str)] = &[
    ("byte", "com.pulse.lang.Byte"),
    ("short", "com.pulse.lang.Short"),
    ("int", "com.pulse.lang.Integer"),
    ("long", "com.pulse.lang.Long"),
    ("float", "com.pulse.lang.Float"),
    ("double", "com.pulse.lang.Double"),
    ("char", "com.pulse.lang.Char"),
    ("boolean", "com.pulse.lang.Boolean"),
    ("ubyte", "com.pulse.lang.UByte"),
    ("ushort", "com.pulse.lang.UShort"),
    ("uint", "com.pulse.lang.UInteger"),
    ("ulong", "com.pulse.lang.ULong"),
    ("void", "com.pulse.lang.Void"),
];

#[allow(dead_code)]
pub(super) fn primitive_wrapper_type(primitive: &str) -> Option<&'static str> {
    PRIMITIVE_WRAPPER_FQCNS
        .iter()
        .find_map(|(p, w)| if *p == primitive { Some(*w) } else { None })
}

pub(super) fn wrapper_primitive_type(wrapper_ty: &str) -> Option<&'static str> {
    let simple = class_simple_name(wrapper_ty);
    PRIMITIVE_WRAPPER_FQCNS.iter().find_map(|(primitive, wrapper)| {
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
