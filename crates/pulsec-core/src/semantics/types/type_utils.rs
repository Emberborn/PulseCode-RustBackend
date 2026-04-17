use super::*;

fn generic_conversion_score(expected: &str, actual: &str) -> Option<Option<u16>> {
    if expected == actual {
        return Some(Some(0));
    }

    let expected_generic = generic_type_components(expected);
    let actual_generic = generic_type_components(actual);
    if expected_generic.is_none() && actual_generic.is_none() {
        return None;
    }

    let expected_erased = erase_generic_type_name(expected);
    let actual_erased = erase_generic_type_name(actual);
    if expected_erased != actual_erased {
        return None;
    }

    match (expected_generic, actual_generic) {
        (Some((_, expected_args, expected_suffix)), Some((_, actual_args, actual_suffix))) => {
            if expected_suffix != actual_suffix {
                Some(None)
            } else if expected_args == actual_args {
                Some(Some(0))
            } else {
                Some(None)
            }
        }
        (Some(_), None) | (None, Some(_)) => Some(Some(1)),
        (None, None) => None,
    }
}

fn is_erased_type_param_slot(ty: &str, class_index: &HashMap<String, ClassInfo>) -> bool {
    let erased = erase_generic_type_name(ty);
    !erased.ends_with("[]")
        && !erased.contains('.')
        && !is_builtin_type(&erased)
        && !class_index.contains_key(&erased)
}

pub(super) fn signature_params_match(
    expected: &[String],
    actual: &[String],
    class_index: &HashMap<String, ClassInfo>,
) -> bool {
    if expected.len() != actual.len() {
        return false;
    }
    expected
        .iter()
        .zip(actual.iter())
        .all(|(e, a)| types_compatible(e, a, class_index))
}

pub(super) fn select_best_constructor_overload<'a>(
    arg_types: &[String],
    constructors: &'a [ConstructorSignature],
    class_index: &HashMap<String, ClassInfo>,
) -> Result<Option<&'a ConstructorSignature>, SemanticError> {
    let mut best_score: Option<u16> = None;
    let mut best_indices: Vec<usize> = Vec::new();

    for (idx, constructor) in constructors.iter().enumerate() {
        if let Some(score) = signature_match_score(
            &constructor.param_types,
            constructor.is_varargs,
            arg_types,
            class_index,
        ) {
            match best_score {
                None => {
                    best_score = Some(score);
                    best_indices.clear();
                    best_indices.push(idx);
                }
                Some(existing) if score < existing => {
                    best_score = Some(score);
                    best_indices.clear();
                    best_indices.push(idx);
                }
                Some(existing) if score == existing => best_indices.push(idx),
                Some(_) => {}
            }
        }
    }

    if best_indices.is_empty() {
        return Ok(None);
    }
    if best_indices.len() > 1 {
        let options = best_indices
            .iter()
            .map(|idx| {
                format!(
                    "({})",
                    format_params_for_display(
                        &constructors[*idx].param_types,
                        constructors[*idx].is_varargs
                    )
                )
            })
            .collect::<Vec<_>>()
            .join("; ");
        return Err(semantic_error(format!(
            "Ambiguous constructor overload for argument types ({}): {}",
            arg_types.join(","),
            options
        )));
    }

    Ok(best_indices
        .into_iter()
        .next()
        .map(|idx| &constructors[idx]))
}

pub(super) fn select_best_method_overload<'a>(
    method_name: &str,
    arg_types: &[String],
    candidates: &'a [MethodSignature],
    class_index: &HashMap<String, ClassInfo>,
) -> Result<Option<&'a MethodSignature>, SemanticError> {
    let mut best_score: Option<u16> = None;
    let mut best_indices: Vec<usize> = Vec::new();

    for (idx, sig) in candidates.iter().enumerate() {
        if let Some(score) =
            signature_match_score(&sig.param_types, sig.is_varargs, arg_types, class_index)
        {
            match best_score {
                None => {
                    best_score = Some(score);
                    best_indices.clear();
                    best_indices.push(idx);
                }
                Some(existing) if score < existing => {
                    best_score = Some(score);
                    best_indices.clear();
                    best_indices.push(idx);
                }
                Some(existing) if score == existing => best_indices.push(idx),
                Some(_) => {}
            }
        }
    }

    if best_indices.is_empty() {
        return Ok(None);
    }
    if best_indices.len() > 1 {
        let options = best_indices
            .iter()
            .map(|idx| {
                format!(
                    "{}({})",
                    method_name,
                    candidates[*idx].param_types.join(",")
                )
            })
            .collect::<Vec<_>>()
            .join("; ");
        return Err(semantic_error(format!(
            "Ambiguous method overload '{}({})': {}",
            method_name,
            arg_types.join(","),
            options
        )));
    }

    Ok(best_indices.into_iter().next().map(|idx| &candidates[idx]))
}

pub(super) fn signature_match_score(
    expected: &[String],
    is_varargs: bool,
    actual: &[String],
    class_index: &HashMap<String, ClassInfo>,
) -> Option<u16> {
    if !is_varargs {
        if expected.len() != actual.len() {
            return None;
        }
    } else if actual.len() < expected.len().saturating_sub(1) {
        return None;
    }

    let mut total = 0u16;
    let fixed_count = if is_varargs {
        expected.len().saturating_sub(1)
    } else {
        expected.len()
    };
    for (expected_ty, actual_ty) in expected
        .iter()
        .take(fixed_count)
        .zip(actual.iter().take(fixed_count))
    {
        let score = conversion_score(expected_ty, actual_ty, class_index)?;
        total = total.saturating_add(score);
    }
    if is_varargs {
        let vararg_array_ty = expected.last()?;
        let vararg_element_ty = vararg_array_ty
            .strip_suffix("[]")
            .unwrap_or(vararg_array_ty);
        let remaining = &actual[fixed_count..];
        if remaining.is_empty() {
            total = total.saturating_add(4);
        } else if remaining.len() == 1
            && conversion_score(vararg_array_ty, &remaining[0], class_index).is_some()
        {
            total = total.saturating_add(3);
        } else {
            total = total.saturating_add(5);
            for actual_ty in remaining {
                let score = conversion_score(vararg_element_ty, actual_ty, class_index)?;
                total = total.saturating_add(score);
            }
        }
    }
    Some(total)
}

fn format_params_for_display(param_types: &[String], is_varargs: bool) -> String {
    if !is_varargs || param_types.is_empty() {
        return param_types.join(",");
    }
    let mut rendered = param_types[..param_types.len() - 1].to_vec();
    let vararg = param_types[param_types.len() - 1]
        .strip_suffix("[]")
        .unwrap_or(param_types[param_types.len() - 1].as_str());
    rendered.push(format!("{vararg}..."));
    rendered.join(",")
}

pub(super) fn conversion_score(
    expected: &str,
    actual: &str,
    class_index: &HashMap<String, ClassInfo>,
) -> Option<u16> {
    if expected == actual {
        return Some(0);
    }
    if let Some(score) = generic_conversion_score(expected, actual) {
        return score;
    }
    let expected_erased = erase_generic_type_name(expected);
    let actual_erased = erase_generic_type_name(actual);
    if class_simple_name(&expected_erased) == "Object"
        && (actual.ends_with("[]")
            || is_string_type(actual)
            || (!is_primitive_non_void(&actual_erased) && class_simple_name(&actual_erased) != "void")
            || class_index.contains_key(&actual_erased)
            || class_index
                .keys()
                .any(|fqcn| class_simple_name(fqcn) == class_simple_name(&actual_erased)))
    {
        return Some(2);
    }
    if class_simple_name(&actual_erased) == "Object"
        && is_erased_type_param_slot(expected, class_index)
    {
        return Some(2);
    }
    if actual == "null" && nullable_reference_type(expected, class_index) {
        return Some(3);
    }

    let expected_arr = expected.ends_with("[]");
    let actual_arr = actual.ends_with("[]");
    if expected_arr != actual_arr {
        return None;
    }

    let expected_base = expected.trim_end_matches("[]");
    let actual_base = actual.trim_end_matches("[]");
    let expected_base_erased = erase_generic_type_name(expected_base);
    let actual_base_erased = erase_generic_type_name(actual_base);
    if class_simple_name(expected_base) == class_simple_name(actual_base) {
        return Some(0);
    }
    if expected_base_erased == actual_base_erased {
        return Some(1);
    }
    if is_boxing_pair(expected_base, actual_base) {
        return Some(1);
    }
    if is_boxing_pair(actual_base, expected_base) {
        return Some(3);
    }
    if implicit_numeric_widening_allowed(expected_base, actual_base) {
        return Some(2);
    }
    if is_assignable_class(actual_base, expected_base, class_index) {
        return Some(2);
    }

    None
}

pub(super) fn nullable_reference_type(ty: &str, class_index: &HashMap<String, ClassInfo>) -> bool {
    let erased = erase_generic_type_name(ty);
    if is_string_type(ty) || ty.ends_with("[]") {
        return true;
    }
    if !is_primitive_non_void(&erased) && class_simple_name(&erased) != "void" {
        return true;
    }
    class_index.contains_key(&erased)
        || class_index
            .keys()
            .any(|fqcn| class_simple_name(fqcn) == class_simple_name(&erased))
}

pub(super) fn is_assignable_class(
    actual: &str,
    expected: &str,
    class_index: &HashMap<String, ClassInfo>,
) -> bool {
    let actual = erase_generic_type_name(actual);
    let expected = erase_generic_type_name(expected);
    if actual == expected || class_simple_name(&actual) == class_simple_name(&expected) {
        return true;
    }

    let mut stack = vec![actual];
    let mut seen = HashSet::new();
    while let Some(current) = stack.pop() {
        if !seen.insert(current.clone()) {
            continue;
        }
        if current == expected || class_simple_name(&current) == class_simple_name(&expected) {
            return true;
        }

        let Some(info) = class_index
            .get(&current)
            .or_else(|| class_index.get(class_simple_name(&current)))
        else {
            continue;
        };

        if let Some(parent) = info.super_class.as_deref() {
            stack.push(erase_generic_type_name(parent));
        }
        for interface in &info.interfaces {
            stack.push(erase_generic_type_name(interface));
        }
    }

    false
}

pub(super) fn types_compatible(
    expected: &str,
    actual: &str,
    class_index: &HashMap<String, ClassInfo>,
) -> bool {
    if expected == actual || class_simple_name(expected) == class_simple_name(actual) {
        return true;
    }
    if let Some(score) = generic_conversion_score(expected, actual) {
        return score.is_some();
    }
    let expected_erased = erase_generic_type_name(expected);
    let actual_erased = erase_generic_type_name(actual);
    if class_simple_name(&expected_erased) == "Object"
        && (actual.ends_with("[]")
            || is_string_type(actual)
            || (!is_primitive_non_void(&actual_erased) && class_simple_name(&actual_erased) != "void")
            || class_index.contains_key(&actual_erased))
    {
        return true;
    }
    if class_simple_name(&actual_erased) == "Object"
        && is_erased_type_param_slot(expected, class_index)
    {
        return true;
    }
    if actual == "null" {
        return nullable_reference_type(expected, class_index);
    }

    let expected_arr = expected.ends_with("[]");
    let actual_arr = actual.ends_with("[]");
    if expected_arr != actual_arr {
        return false;
    }
    if expected_arr && actual_arr {
        let expected_base = expected.trim_end_matches("[]");
        let actual_base = actual.trim_end_matches("[]");
        return expected_base == actual_base
            || class_simple_name(expected_base) == class_simple_name(actual_base)
            || implicit_numeric_widening_allowed(expected_base, actual_base)
            || is_assignable_class(actual_base, expected_base, class_index);
    }

    if is_boxing_pair(expected, actual) || is_boxing_pair(actual, expected) {
        return true;
    }

    if is_numeric_primitive(expected) && is_numeric_primitive(actual) {
        return implicit_numeric_widening_allowed(expected, actual);
    }

    is_assignable_class(actual, expected, class_index)
}

pub(super) fn validate_assignable(
    expected: &str,
    actual: &str,
    expr: Option<&Expr>,
    context: &str,
    _class_names: &HashSet<String>,
    class_index: &HashMap<String, ClassInfo>,
) -> Result<(), SemanticError> {
    if types_compatible(expected, actual, class_index) {
        return Ok(());
    }

    if actual == "null" {
        return Err(semantic_error(format!(
            "Cannot assign type 'null' to '{}'",
            expected
        )));
    }

    let expected_numeric = wrapper_primitive_type(expected).unwrap_or(expected);
    let actual_numeric = wrapper_primitive_type(actual).unwrap_or(actual);
    if implicit_numeric_widening_allowed(expected_numeric, actual_numeric) {
        return Ok(());
    }
    if let Some(kind) = numeric_conversion_kind(expected_numeric, actual_numeric) {
        if contextual_numeric_literal_assignment_allowed(expected_numeric, actual_numeric, expr) {
            return Ok(());
        }

        return Err(semantic_error(format!(
            "Implicit numeric conversion '{}' -> '{}' is not allowed ({})",
            actual, expected, kind
        )));
    }

    Err(semantic_error(format!(
        "Cannot assign type '{}' to '{}' in {}",
        actual, expected, context
    )))
}

fn contextual_numeric_literal_assignment_allowed(
    expected: &str,
    actual: &str,
    expr: Option<&Expr>,
) -> bool {
    let Some(expr) = expr else {
        return false;
    };

    match expr {
        Expr::IntLiteral(_) => matches!(class_simple_name(expected), "long"),
        Expr::DoubleLiteral(_) => matches!(class_simple_name(expected), "float"),
        Expr::Unary {
            op: UnaryOp::Neg,
            expr,
        } => match expr.as_ref() {
            Expr::IntLiteral(_) => {
                matches!(class_simple_name(expected), "long") && class_simple_name(actual) == "int"
            }
            Expr::DoubleLiteral(_) => {
                matches!(class_simple_name(expected), "float")
                    && class_simple_name(actual) == "double"
            }
            _ => false,
        },
        _ => false,
    }
}

pub(super) fn infer_binary_result_type(
    op: &BinaryOp,
    left_ty: &str,
    right_ty: &str,
    class_names: &HashSet<String>,
) -> Result<String, SemanticError> {
    match op {
        BinaryOp::Add => {
            if is_string_type(left_ty) || is_string_type(right_ty) {
                Ok("pulse.lang.String".to_string())
            } else if let Some(result) = numeric_binary_result_type(left_ty, right_ty) {
                Ok(result)
            } else {
                Err(semantic_error(format!(
                    "Operator '+' requires matching numeric operands or String concatenation, got '{}' and '{}'",
                    left_ty, right_ty
                )))
            }
        }
        BinaryOp::Sub | BinaryOp::Mul | BinaryOp::Div | BinaryOp::Mod => {
            numeric_binary_result_type(left_ty, right_ty).ok_or_else(|| {
                semantic_error(format!(
                    "Arithmetic operators require matching numeric operands, got '{}' and '{}'",
                    left_ty, right_ty
                ))
            })
        }
        BinaryOp::Eq | BinaryOp::NotEq => {
            if (left_ty == "null" && is_nullable_type(right_ty, class_names))
                || (right_ty == "null" && is_nullable_type(left_ty, class_names))
                || left_ty == right_ty
            {
                Ok("boolean".to_string())
            } else {
                Err(semantic_error(format!(
                    "Comparison requires matching operand types (or null/reference), got '{}' and '{}'",
                    left_ty, right_ty
                )))
            }
        }
        BinaryOp::Less | BinaryOp::LessEq | BinaryOp::Greater | BinaryOp::GreaterEq => {
            if numeric_binary_result_type(left_ty, right_ty).is_some() {
                Ok("boolean".to_string())
            } else {
                Err(semantic_error(format!(
                    "Relational operators require matching numeric operands, got '{}' and '{}'",
                    left_ty, right_ty
                )))
            }
        }
        BinaryOp::LogicalAnd | BinaryOp::LogicalOr => {
            if left_ty == "boolean" && right_ty == "boolean" {
                Ok("boolean".to_string())
            } else {
                Err(semantic_error(format!(
                    "Logical operators require boolean operands, got '{}' and '{}'",
                    left_ty, right_ty
                )))
            }
        }
        BinaryOp::BitAnd | BinaryOp::BitOr | BinaryOp::BitXor => {
            if left_ty == "boolean" && right_ty == "boolean" {
                Ok("boolean".to_string())
            } else if let Some(result) = integral_binary_result_type(left_ty, right_ty) {
                Ok(result)
            } else {
                Err(semantic_error(format!(
                    "Bitwise operators require boolean operands or integral operands, got '{}' and '{}'",
                    left_ty, right_ty
                )))
            }
        }
        BinaryOp::ShiftLeft | BinaryOp::ShiftRight | BinaryOp::UnsignedShiftRight => {
            if !is_integral_primitive(left_ty) || !is_integral_primitive(right_ty) {
                Err(semantic_error(format!(
                    "Shift operators require integral operands, got '{}' and '{}'",
                    left_ty, right_ty
                )))
            } else {
                Ok(shift_result_type(left_ty).unwrap_or_else(|| left_ty.to_string()))
            }
        }
    }
}

#[cfg(test)]
mod tests {
    use super::primitive_wrapper_type;

    #[test]
    fn primitive_wrapper_map_covers_supported_primitives() {
        let expected = [
            ("byte", "pulse.lang.Byte"),
            ("short", "pulse.lang.Short"),
            ("int", "pulse.lang.Integer"),
            ("long", "pulse.lang.Long"),
            ("float", "pulse.lang.Float"),
            ("double", "pulse.lang.Double"),
            ("char", "pulse.lang.Char"),
            ("boolean", "pulse.lang.Boolean"),
            ("ubyte", "pulse.lang.UByte"),
            ("ushort", "pulse.lang.UShort"),
            ("uint", "pulse.lang.UInteger"),
            ("ulong", "pulse.lang.ULong"),
            ("void", "pulse.lang.Void"),
        ];
        for (primitive, wrapper) in expected {
            assert_eq!(primitive_wrapper_type(primitive), Some(wrapper));
        }
        assert_eq!(primitive_wrapper_type("String"), None);
    }
}
