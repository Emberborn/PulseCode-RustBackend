use super::*;

pub(super) fn semantic_error(message: String) -> SemanticError {
    SemanticError { message }
}

pub(super) fn modifier_name(modifier: Modifier) -> &'static str {
    match modifier {
        Modifier::Public => "public",
        Modifier::Private => "private",
        Modifier::Protected => "protected",
        Modifier::Default => "default",
        Modifier::Static => "static",
        Modifier::Abstract => "abstract",
        Modifier::Final => "final",
        Modifier::Synchronized => "synchronized",
        Modifier::Native => "native",
        Modifier::Strictfp => "strictfp",
        Modifier::Transient => "transient",
        Modifier::Volatile => "volatile",
        Modifier::Async => "async",
    }
}

pub(super) fn class_simple_name(ty: &str) -> &str {
    ty.rsplit('.').next().unwrap_or(ty)
}

pub(super) fn is_string_type(ty: &str) -> bool {
    class_simple_name(ty) == "String"
}

pub(super) fn is_nullable_type(ty: &str, class_names: &HashSet<String>) -> bool {
    is_string_type(ty) || ty.ends_with("[]") || class_names.contains(ty)
}

pub(super) fn is_primitive_non_void(ty: &str) -> bool {
    is_builtin_type(ty) && class_simple_name(ty) != "void"
}

pub(super) fn is_numeric_primitive(ty: &str) -> bool {
    matches!(
        class_simple_name(ty),
        "byte"
            | "short"
            | "int"
            | "long"
            | "float"
            | "double"
            | "char"
            | "ubyte"
            | "ushort"
            | "uint"
            | "ulong"
    )
}

pub(super) fn is_unsigned_primitive(ty: &str) -> bool {
    matches!(class_simple_name(ty), "ubyte" | "ushort" | "uint" | "ulong")
}

pub(super) fn is_integral_primitive(ty: &str) -> bool {
    matches!(
        class_simple_name(ty),
        "byte" | "short" | "int" | "long" | "char" | "ubyte" | "ushort" | "uint" | "ulong"
    )
}

pub(super) fn unary_integral_promotion_type(ty: &str) -> Option<String> {
    match class_simple_name(ty) {
        "byte" | "short" | "char" => Some("int".to_string()),
        "ubyte" | "ushort" => Some("uint".to_string()),
        "int" => Some("int".to_string()),
        "uint" => Some("uint".to_string()),
        "long" => Some("long".to_string()),
        "ulong" => Some("ulong".to_string()),
        _ => None,
    }
}

pub(super) fn integral_binary_result_type(left_ty: &str, right_ty: &str) -> Option<String> {
    if !is_integral_primitive(left_ty) || !is_integral_primitive(right_ty) {
        return None;
    }
    numeric_binary_result_type(left_ty, right_ty)
}

pub(super) fn shift_result_type(left_ty: &str) -> Option<String> {
    if !is_integral_primitive(left_ty) {
        return None;
    }
    unary_integral_promotion_type(left_ty)
}

fn signed_numeric_rank(ty: &str) -> Option<u8> {
    match class_simple_name(ty) {
        "byte" => Some(1),
        "short" => Some(2),
        "char" => Some(2),
        "int" => Some(3),
        "long" => Some(4),
        "float" => Some(5),
        "double" => Some(6),
        _ => None,
    }
}

fn unsigned_numeric_rank(ty: &str) -> Option<u8> {
    match class_simple_name(ty) {
        "ubyte" => Some(1),
        "ushort" => Some(2),
        "uint" => Some(3),
        "ulong" => Some(4),
        _ => None,
    }
}

fn signed_widen_target_for_unsigned(actual: &str) -> Option<&'static str> {
    match class_simple_name(actual) {
        "ubyte" => Some("short"),
        "ushort" => Some("int"),
        "uint" => Some("long"),
        "ulong" => Some("float"),
        _ => None,
    }
}

fn unsigned_widen_target_for_signed(actual: &str) -> Option<&'static str> {
    match class_simple_name(actual) {
        "char" => Some("ushort"),
        _ => None,
    }
}

pub(super) fn implicit_numeric_widening_allowed(expected: &str, actual: &str) -> bool {
    let expected = class_simple_name(expected);
    let actual = class_simple_name(actual);
    if expected == actual {
        return true;
    }
    match (signed_numeric_rank(expected), signed_numeric_rank(actual)) {
        (Some(expected_rank), Some(actual_rank)) => return actual_rank <= expected_rank,
        _ => {}
    }
    match (
        unsigned_numeric_rank(expected),
        unsigned_numeric_rank(actual),
    ) {
        (Some(expected_rank), Some(actual_rank)) => actual_rank <= expected_rank,
        _ => {
            if let Some(min_expected) = signed_widen_target_for_unsigned(actual) {
                if let (Some(expected_rank), Some(min_rank)) = (
                    signed_numeric_rank(expected),
                    signed_numeric_rank(min_expected),
                ) {
                    return expected_rank >= min_rank;
                }
            }
            if let Some(min_expected) = unsigned_widen_target_for_signed(actual) {
                if let (Some(expected_rank), Some(min_rank)) = (
                    unsigned_numeric_rank(expected),
                    unsigned_numeric_rank(min_expected),
                ) {
                    return expected_rank >= min_rank;
                }
            }
            false
        }
    }
}

pub(super) fn numeric_binary_result_type(left_ty: &str, right_ty: &str) -> Option<String> {
    if !is_numeric_primitive(left_ty) || !is_numeric_primitive(right_ty) {
        return None;
    }
    let left_simple = class_simple_name(left_ty);
    let right_simple = class_simple_name(right_ty);
    if left_simple == right_simple {
        return Some(left_ty.to_string());
    }
    if let (Some(left_rank), Some(right_rank)) = (
        signed_numeric_rank(left_simple),
        signed_numeric_rank(right_simple),
    ) {
        let result = if left_rank >= right_rank {
            left_simple
        } else {
            right_simple
        };
        return Some(match result {
            "byte" | "short" | "char" => "int".to_string(),
            _ => result.to_string(),
        });
    }
    if let (Some(left_rank), Some(right_rank)) = (
        unsigned_numeric_rank(left_simple),
        unsigned_numeric_rank(right_simple),
    ) {
        let result_rank = left_rank.max(right_rank);
        return Some(
            match result_rank {
                1 | 2 | 3 => "uint",
                4 => "ulong",
                _ => unreachable!(),
            }
            .to_string(),
        );
    }
    let left_signed = signed_numeric_rank(left_simple);
    let right_signed = signed_numeric_rank(right_simple);
    let left_unsigned = unsigned_numeric_rank(left_simple);
    let right_unsigned = unsigned_numeric_rank(right_simple);
    if let Some((signed_rank, unsigned_rank, signed_ty)) =
        match (left_signed, left_unsigned, right_signed, right_unsigned) {
            (Some(signed_rank), None, None, Some(unsigned_rank)) => {
                Some((signed_rank, unsigned_rank, left_simple))
            }
            (None, Some(unsigned_rank), Some(signed_rank), None) => {
                Some((signed_rank, unsigned_rank, right_simple))
            }
            _ => None,
        }
    {
        if signed_rank >= 5 {
            return Some(signed_ty.to_string());
        }
        return match unsigned_rank {
            1 | 2 => Some(match signed_ty {
                "long" => "long".to_string(),
                _ => "int".to_string(),
            }),
            3 => Some("long".to_string()),
            4 => None,
            _ => None,
        };
    }
    None
}

pub(super) fn numeric_conversion_kind(expected: &str, actual: &str) -> Option<&'static str> {
    let expected = class_simple_name(expected);
    let actual = class_simple_name(actual);
    if !is_numeric_primitive(expected) || !is_numeric_primitive(actual) || expected == actual {
        return None;
    }

    match (
        is_unsigned_primitive(expected),
        is_unsigned_primitive(actual),
    ) {
        (true, false) => Some("signed-to-unsigned"),
        (false, true) => Some("unsigned-to-signed"),
        _ => Some("widening-or-narrowing"),
    }
}
