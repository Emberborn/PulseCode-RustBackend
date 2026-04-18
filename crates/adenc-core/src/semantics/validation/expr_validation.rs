use super::*;
use crate::ArrayInitExpr;

#[derive(Clone, Copy, PartialEq, Eq)]
enum NativeArrayLane {
    IntLike,
    WideScalar,
    Reference,
}

fn collect_logical_operands<'a>(expr: &'a Expr, op: &BinaryOp) -> Vec<&'a Expr> {
    let mut current = expr;
    let mut tail = Vec::new();
    loop {
        match current {
            Expr::Binary {
                left,
                op: current_op,
                right,
            } if current_op == op => {
                tail.push(right.as_ref());
                current = left.as_ref();
            }
            _ => break,
        }
    }
    let mut out = vec![current];
    while let Some(next) = tail.pop() {
        out.push(next);
    }
    out
}

fn current_class_self_type(class: &ClassDecl, class_info: &ClassInfo) -> String {
    let fqcn = format!("{}.{}", class_info.package_name, class.name);
    if class_info.type_params.is_empty() {
        fqcn
    } else {
        format!("{}<{}>", fqcn, class_info.type_params.join(", "))
    }
}

pub(super) fn infer_expr_type(
    expr: &Expr,
    class: &ClassDecl,
    class_info: &ClassInfo,
    class_names: &HashSet<String>,
    class_index: &HashMap<String, ClassInfo>,
    fqcn_to_class: &HashMap<String, String>,
    imports: &[ImportDecl],
    locals: &HashMap<String, String>,
    in_static_context: bool,
) -> Result<ExprType, SemanticError> {
    match expr {
        Expr::IntLiteral(_) => Ok(value_type("int")),
        Expr::LongLiteral(_) => Ok(value_type("long")),
        Expr::FloatLiteral(_) => Ok(value_type("float")),
        Expr::DoubleLiteral(_) => Ok(value_type("double")),
        Expr::CharLiteral(_) => Ok(value_type("char")),
        Expr::StringLiteral(_) => Ok(value_type("String")),
        Expr::BoolLiteral(_) => Ok(value_type("boolean")),
        Expr::NullLiteral => Ok(value_type("null")),
        Expr::This => {
            if in_static_context {
                Err(semantic_error(format!(
                    "Cannot use 'this' in static method '{}'",
                    class.name
                )))
            } else {
                Ok(value_type(&current_class_self_type(class, class_info)))
            }
        }
        Expr::Super => {
            if in_static_context {
                return Err(semantic_error(format!(
                    "Cannot use 'super' in static method '{}'",
                    class.name
                )));
            }
            let super_class = class_info.super_class.as_deref().ok_or_else(|| {
                semantic_error(format!(
                    "Cannot use 'super' in class '{}' without an extends clause",
                    class.name
                ))
            })?;
            Ok(value_type(super_class))
        }
        Expr::Var(name) => resolve_var_or_class(
            name,
            class,
            class_info,
            class_names,
            class_index,
            fqcn_to_class,
            imports,
            locals,
            in_static_context,
        ),
        Expr::MemberAccess { object, member } => {
            if let Some(class_ref) = resolve_qualified_class_receiver(
                expr,
                class,
                class_info,
                class_index,
                imports,
                locals,
            )? {
                return Ok(class_ref);
            }

            let receiver = infer_expr_type(
                object,
                class,
                class_info,
                class_names,
                class_index,
                fqcn_to_class,
                imports,
                locals,
                in_static_context,
            )?;
            if receiver.kind == ExprKind::ClassRef {
                let owner = owner_class(&receiver, class_names)?;
                if let Some(info) = class_index.get(&owner) {
                    if info.is_enum
                        && info
                            .enum_constants
                            .iter()
                            .any(|constant| constant == member)
                    {
                        return Ok(value_type(&owner));
                    }
                }
            }
            resolve_field_access(
                member,
                &receiver,
                class_names,
                class_index,
                &format!("{}.{}", class_info.package_name, class.name),
            )
        }
        Expr::ArrayAccess { array, index } => {
            let array_ty = infer_expr_type(
                array,
                class,
                class_info,
                class_names,
                class_index,
                fqcn_to_class,
                imports,
                locals,
                in_static_context,
            )?;
            if !array_ty.ty.ends_with("[]") {
                return Err(semantic_error(format!(
                    "Cannot index non-array expression of type '{}'",
                    array_ty.ty
                )));
            }
            let index_ty = infer_expr_type(
                index,
                class,
                class_info,
                class_names,
                class_index,
                fqcn_to_class,
                imports,
                locals,
                in_static_context,
            )?;
            if index_ty.ty != "int" {
                return Err(semantic_error(format!(
                    "Native array index expression must be 'int', got '{}'",
                    index_ty.ty
                )));
            }
            let element_ty = array_ty
                .ty
                .strip_suffix("[]")
                .unwrap_or(&array_ty.ty)
                .to_string();
            Ok(value_type(&element_ty))
        }
        Expr::Call { callee, args } => infer_call_type(
            callee,
            args,
            class,
            class_info,
            class_names,
            class_index,
            fqcn_to_class,
            imports,
            locals,
            in_static_context,
            None,
        ),
        Expr::NewObject { class_name, args } => infer_new_object_type(
            class_name,
            args,
            class,
            class_info,
            class_names,
            class_index,
            fqcn_to_class,
            imports,
            locals,
            in_static_context,
            None,
        ),
        Expr::Unary { op, expr } => {
            let inner_ty = infer_expr_type(
                expr,
                class,
                class_info,
                class_names,
                class_index,
                fqcn_to_class,
                imports,
                locals,
                in_static_context,
            )?;
            match op {
                UnaryOp::Not => {
                    if inner_ty.ty == "boolean" {
                        Ok(value_type("boolean"))
                    } else {
                        Err(semantic_error(format!(
                            "Unary '!' requires boolean operand, got '{}'",
                            inner_ty.ty
                        )))
                    }
                }
                UnaryOp::Neg => {
                    if is_numeric_primitive(&inner_ty.ty) {
                        Ok(value_type(&inner_ty.ty))
                    } else {
                        Err(semantic_error(format!(
                            "Unary '-' requires numeric operand, got '{}'",
                            inner_ty.ty
                        )))
                    }
                }
                UnaryOp::BitNot => {
                    if let Some(result) = unary_integral_promotion_type(&inner_ty.ty) {
                        Ok(value_type(&result))
                    } else {
                        Err(semantic_error(format!(
                            "Unary '~' requires integral operand, got '{}'",
                            inner_ty.ty
                        )))
                    }
                }
            }
        }
        Expr::Cast { ty, expr } => {
            let cast_ty = ty.clone();
            let cast_simple = class_simple_name(&cast_ty);
            if !is_builtin_type(cast_simple)
                && !class_names.contains(&cast_ty)
                && !class_index.contains_key(&cast_ty)
            {
                return Err(semantic_error(format!(
                    "Unknown cast type '{}' in class '{}'",
                    cast_ty, class.name
                )));
            }
            let inner_ty = infer_expr_type(
                expr,
                class,
                class_info,
                class_names,
                class_index,
                fqcn_to_class,
                imports,
                locals,
                in_static_context,
            )?;

            if cast_ty == inner_ty.ty {
                return Ok(value_type(&cast_ty));
            }

            if is_numeric_primitive(&cast_ty) && is_numeric_primitive(&inner_ty.ty) {
                return Ok(value_type(&cast_ty));
            }

            if types_compatible(&cast_ty, &inner_ty.ty, class_index)
                || types_compatible(&inner_ty.ty, &cast_ty, class_index)
            {
                return Ok(value_type(&cast_ty));
            }

            Err(semantic_error(format!(
                "Invalid cast from '{}' to '{}'",
                inner_ty.ty, cast_ty
            )))
        }
        Expr::InstanceOf { expr, ty } => {
            let target_ty = ty.clone();
            let target_simple = class_simple_name(&target_ty);
            if is_builtin_type(target_simple) {
                return Err(semantic_error(format!(
                    "'instanceof' target type '{}' must be a reference type",
                    target_ty
                )));
            }
            if !class_names.contains(&target_ty) && !class_index.contains_key(&target_ty) {
                return Err(semantic_error(format!(
                    "Unknown type '{}' in instanceof expression",
                    target_ty
                )));
            }
            let inner_ty = infer_expr_type(
                expr,
                class,
                class_info,
                class_names,
                class_index,
                fqcn_to_class,
                imports,
                locals,
                in_static_context,
            )?;
            if inner_ty.ty == "null" {
                return Ok(value_type("boolean"));
            }
            if is_numeric_primitive(&inner_ty.ty)
                || inner_ty.ty == "boolean"
                || inner_ty.ty == "void"
            {
                return Err(semantic_error(format!(
                    "Left operand of 'instanceof' must be a reference type, got '{}'",
                    inner_ty.ty
                )));
            }
            Ok(value_type("boolean"))
        }
        Expr::IncDec {
            target,
            op,
            prefix: _,
        } => {
            if !is_assignable_target(target) {
                return Err(semantic_error(format!(
                    "Operator '{}' requires an assignable target",
                    incdec_name(*op)
                )));
            }
            validate_target_mutability(
                target,
                class,
                class_info,
                class_names,
                class_index,
                fqcn_to_class,
                imports,
                locals,
                in_static_context,
                false,
            )?;

            let target_ty = infer_expr_type(
                target,
                class,
                class_info,
                class_names,
                class_index,
                fqcn_to_class,
                imports,
                locals,
                in_static_context,
            )?;

            if target_ty.kind != ExprKind::Value || !is_numeric_primitive(&target_ty.ty) {
                return Err(semantic_error(format!(
                    "Operator '{}' requires numeric target, got '{}'",
                    incdec_name(*op),
                    target_ty.ty
                )));
            }

            Ok(value_type(&target_ty.ty))
        }
        Expr::Binary { left, op, right } => match op {
            BinaryOp::LogicalAnd | BinaryOp::LogicalOr => {
                for operand in collect_logical_operands(expr, op) {
                    let operand_ty = infer_expr_type(
                        operand,
                        class,
                        class_info,
                        class_names,
                        class_index,
                        fqcn_to_class,
                        imports,
                        locals,
                        in_static_context,
                    )?;
                    if operand_ty.ty != "boolean" {
                        return Err(semantic_error(format!(
                            "Logical operators require boolean operands, got '{}'",
                            operand_ty.ty
                        )));
                    }
                }
                Ok(value_type("boolean"))
            }
            BinaryOp::Add => {
                let left_ty = infer_expr_type(
                    left,
                    class,
                    class_info,
                    class_names,
                    class_index,
                    fqcn_to_class,
                    imports,
                    locals,
                    in_static_context,
                )?;
                let right_ty = infer_expr_type(
                    right,
                    class,
                    class_info,
                    class_names,
                    class_index,
                    fqcn_to_class,
                    imports,
                    locals,
                    in_static_context,
                )?;
                if is_string_type(&left_ty.ty) || is_string_type(&right_ty.ty) {
                    Ok(value_type("aden.lang.String"))
                } else if let Some(result) = numeric_binary_result_type(&left_ty.ty, &right_ty.ty) {
                    Ok(value_type(&result))
                } else {
                    Err(semantic_error(format!(
                            "Operator '+' requires matching numeric operands or String concatenation, got '{}' and '{}'",
                            left_ty.ty, right_ty.ty
                        )))
                }
            }
            BinaryOp::Sub | BinaryOp::Mul | BinaryOp::Div | BinaryOp::Mod => {
                let left_ty = infer_expr_type(
                    left,
                    class,
                    class_info,
                    class_names,
                    class_index,
                    fqcn_to_class,
                    imports,
                    locals,
                    in_static_context,
                )?;
                let right_ty = infer_expr_type(
                    right,
                    class,
                    class_info,
                    class_names,
                    class_index,
                    fqcn_to_class,
                    imports,
                    locals,
                    in_static_context,
                )?;
                if let Some(result) = numeric_binary_result_type(&left_ty.ty, &right_ty.ty) {
                    Ok(value_type(&result))
                } else {
                    Err(semantic_error(format!(
                        "Arithmetic operators require matching numeric operands, got '{}' and '{}'",
                        left_ty.ty, right_ty.ty
                    )))
                }
            }
            BinaryOp::Eq | BinaryOp::NotEq => {
                let left_ty = infer_expr_type(
                    left,
                    class,
                    class_info,
                    class_names,
                    class_index,
                    fqcn_to_class,
                    imports,
                    locals,
                    in_static_context,
                )?;
                let right_ty = infer_expr_type(
                    right,
                    class,
                    class_info,
                    class_names,
                    class_index,
                    fqcn_to_class,
                    imports,
                    locals,
                    in_static_context,
                )?;
                if types_compatible(&left_ty.ty, &right_ty.ty, class_index)
                    || (left_ty.ty == "null" && is_nullable_type(&right_ty.ty, class_names))
                    || (right_ty.ty == "null" && is_nullable_type(&left_ty.ty, class_names))
                {
                    Ok(value_type("boolean"))
                } else {
                    Err(semantic_error(format!(
                            "Comparison requires matching operand types (or null/reference), got '{}' and '{}'",
                            left_ty.ty, right_ty.ty
                        )))
                }
            }
            BinaryOp::Less | BinaryOp::LessEq | BinaryOp::Greater | BinaryOp::GreaterEq => {
                let left_ty = infer_expr_type(
                    left,
                    class,
                    class_info,
                    class_names,
                    class_index,
                    fqcn_to_class,
                    imports,
                    locals,
                    in_static_context,
                )?;
                let right_ty = infer_expr_type(
                    right,
                    class,
                    class_info,
                    class_names,
                    class_index,
                    fqcn_to_class,
                    imports,
                    locals,
                    in_static_context,
                )?;
                if numeric_binary_result_type(&left_ty.ty, &right_ty.ty).is_some() {
                    Ok(value_type("boolean"))
                } else {
                    Err(semantic_error(format!(
                        "Relational operators require matching numeric operands, got '{}' and '{}'",
                        left_ty.ty, right_ty.ty
                    )))
                }
            }
            BinaryOp::BitAnd | BinaryOp::BitOr | BinaryOp::BitXor => {
                let left_ty = infer_expr_type(
                    left,
                    class,
                    class_info,
                    class_names,
                    class_index,
                    fqcn_to_class,
                    imports,
                    locals,
                    in_static_context,
                )?;
                let right_ty = infer_expr_type(
                    right,
                    class,
                    class_info,
                    class_names,
                    class_index,
                    fqcn_to_class,
                    imports,
                    locals,
                    in_static_context,
                )?;
                if left_ty.ty == "boolean" && right_ty.ty == "boolean" {
                    Ok(value_type("boolean"))
                } else if let Some(result) = integral_binary_result_type(&left_ty.ty, &right_ty.ty)
                {
                    Ok(value_type(&result))
                } else {
                    Err(semantic_error(format!(
                            "Bitwise operators require boolean operands or integral operands, got '{}' and '{}'",
                            left_ty.ty, right_ty.ty
                        )))
                }
            }
            BinaryOp::ShiftLeft | BinaryOp::ShiftRight | BinaryOp::UnsignedShiftRight => {
                let left_ty = infer_expr_type(
                    left,
                    class,
                    class_info,
                    class_names,
                    class_index,
                    fqcn_to_class,
                    imports,
                    locals,
                    in_static_context,
                )?;
                let right_ty = infer_expr_type(
                    right,
                    class,
                    class_info,
                    class_names,
                    class_index,
                    fqcn_to_class,
                    imports,
                    locals,
                    in_static_context,
                )?;
                if !is_integral_primitive(&left_ty.ty) || !is_integral_primitive(&right_ty.ty) {
                    Err(semantic_error(format!(
                        "Shift operators require integral operands, got '{}' and '{}'",
                        left_ty.ty, right_ty.ty
                    )))
                } else {
                    Ok(value_type(
                        shift_result_type(&left_ty.ty)
                            .unwrap_or_else(|| left_ty.ty.clone())
                            .as_str(),
                    ))
                }
            }
        },
        Expr::Conditional {
            condition,
            then_expr,
            else_expr,
        } => {
            let condition_ty = infer_expr_type(
                condition,
                class,
                class_info,
                class_names,
                class_index,
                fqcn_to_class,
                imports,
                locals,
                in_static_context,
            )?;
            if condition_ty.ty != "boolean" {
                return Err(semantic_error(format!(
                    "Ternary condition must be boolean, got '{}'",
                    condition_ty.ty
                )));
            }

            let then_ty = infer_expr_type(
                then_expr,
                class,
                class_info,
                class_names,
                class_index,
                fqcn_to_class,
                imports,
                locals,
                in_static_context,
            )?;
            let else_ty = infer_expr_type(
                else_expr,
                class,
                class_info,
                class_names,
                class_index,
                fqcn_to_class,
                imports,
                locals,
                in_static_context,
            )?;

            if then_ty.ty == else_ty.ty {
                return Ok(value_type(&then_ty.ty));
            }

            if let Some(result) = numeric_binary_result_type(&then_ty.ty, &else_ty.ty) {
                return Ok(value_type(&result));
            }

            if then_ty.ty == "null" && is_nullable_type(&else_ty.ty, class_names) {
                return Ok(value_type(&else_ty.ty));
            }

            if else_ty.ty == "null" && is_nullable_type(&then_ty.ty, class_names) {
                return Ok(value_type(&then_ty.ty));
            }

            if types_compatible(&then_ty.ty, &else_ty.ty, class_index) {
                return Ok(value_type(&then_ty.ty));
            }

            if types_compatible(&else_ty.ty, &then_ty.ty, class_index) {
                return Ok(value_type(&else_ty.ty));
            }

            Err(semantic_error(format!(
                "Ternary branches must have compatible types, got '{}' and '{}'",
                then_ty.ty, else_ty.ty
            )))
        }
        Expr::SwitchExpr {
            expr,
            cases,
            default,
        } => {
            let switch_ty = infer_expr_type(
                expr,
                class,
                class_info,
                class_names,
                class_index,
                fqcn_to_class,
                imports,
                locals,
                in_static_context,
            )?;

            let mut seen_labels = HashSet::new();
            let mut result_ty = infer_expr_type(
                default,
                class,
                class_info,
                class_names,
                class_index,
                fqcn_to_class,
                imports,
                locals,
                in_static_context,
            )?;

            for case in cases {
                if !is_switch_case_literal(&case.label) {
                    return Err(semantic_error(format!(
                        "Switch expression case in '{}' must be a literal",
                        class.name
                    )));
                }
                let label_ty = infer_expr_type(
                    &case.label,
                    class,
                    class_info,
                    class_names,
                    class_index,
                    fqcn_to_class,
                    imports,
                    locals,
                    in_static_context,
                )?;
                if label_ty.ty != switch_ty.ty {
                    return Err(semantic_error(format!(
                        "Switch expression case type mismatch in '{}': expected '{}', got '{}'",
                        class.name, switch_ty.ty, label_ty.ty
                    )));
                }
                let key = switch_case_key(&case.label);
                if !seen_labels.insert(key) {
                    return Err(semantic_error(format!(
                        "Duplicate switch expression case label in '{}'",
                        class.name
                    )));
                }
                let case_ty = infer_expr_type(
                    &case.value,
                    class,
                    class_info,
                    class_names,
                    class_index,
                    fqcn_to_class,
                    imports,
                    locals,
                    in_static_context,
                )?;

                if result_ty.ty == case_ty.ty {
                    continue;
                }
                if let Some(result) = numeric_binary_result_type(&result_ty.ty, &case_ty.ty) {
                    result_ty = value_type(&result);
                    continue;
                }
                if result_ty.ty == "null" && is_nullable_type(&case_ty.ty, class_names) {
                    result_ty = value_type(&case_ty.ty);
                    continue;
                }
                if case_ty.ty == "null" && is_nullable_type(&result_ty.ty, class_names) {
                    continue;
                }
                if types_compatible(&result_ty.ty, &case_ty.ty, class_index) {
                    continue;
                }
                if types_compatible(&case_ty.ty, &result_ty.ty, class_index) {
                    result_ty = value_type(&case_ty.ty);
                    continue;
                }
                return Err(semantic_error(format!(
                    "Switch expression arms must have compatible types, got '{}' and '{}'",
                    result_ty.ty, case_ty.ty
                )));
            }

            Ok(result_ty)
        }
        Expr::NewArray {
            element_ty,
            lengths,
        } => {
            validate_native_array_element_type(element_ty, class_names, class_index)?;
            for length in lengths {
                let length_ty = infer_expr_type(
                    length,
                    class,
                    class_info,
                    class_names,
                    class_index,
                    fqcn_to_class,
                    imports,
                    locals,
                    in_static_context,
                )?;
                if length_ty.ty != "int" {
                    return Err(semantic_error(format!(
                        "Array length expression must be 'int', got '{}'",
                        length_ty.ty
                    )));
                }
            }

            Ok(value_type(&format!(
                "{}{}",
                element_ty,
                "[]".repeat(lengths.len())
            )))
        }
        Expr::NewArrayInitialized {
            element_ty,
            dimensions,
            values,
        } => {
            validate_native_array_element_type(element_ty, class_names, class_index)?;
            validate_native_array_initializer(
                values,
                element_ty,
                *dimensions,
                class,
                class_info,
                class_names,
                class_index,
                fqcn_to_class,
                imports,
                locals,
                in_static_context,
            )?;
            Ok(value_type(&format!(
                "{}{}",
                element_ty,
                "[]".repeat(*dimensions)
            )))
        }
    }
}

fn validate_native_array_element_type(
    element_ty: &str,
    class_names: &HashSet<String>,
    class_index: &HashMap<String, ClassInfo>,
) -> Result<NativeArrayLane, SemanticError> {
    let simple = class_simple_name(element_ty);
    if element_ty.contains('<') {
        return Err(semantic_error(format!(
            "Generic native array element type '{}' is not supported yet",
            element_ty
        )));
    }
    if matches!(
        simple,
        "byte" | "short" | "int" | "char" | "boolean" | "ubyte" | "ushort" | "uint"
    ) {
        return Ok(NativeArrayLane::IntLike);
    }
    if matches!(simple, "long" | "ulong" | "float" | "double") {
        return Ok(NativeArrayLane::WideScalar);
    }
    if matches!(simple, "void") {
        return Err(semantic_error(format!(
            "Native array creation does not yet support '{}' element types",
            simple
        )));
    }
    if element_ty.ends_with("[]")
        || is_string_type(element_ty)
        || class_names.contains(element_ty)
        || class_index.contains_key(element_ty)
        || class_simple_name(element_ty) == "Object"
    {
        return Ok(NativeArrayLane::Reference);
    }
    Err(semantic_error(format!(
        "Unknown native array element type '{}'",
        element_ty
    )))
}

#[allow(clippy::too_many_arguments)]
fn validate_native_array_initializer(
    values: &[ArrayInitExpr],
    element_ty: &str,
    dimensions: usize,
    class: &ClassDecl,
    class_info: &ClassInfo,
    class_names: &HashSet<String>,
    class_index: &HashMap<String, ClassInfo>,
    fqcn_to_class: &HashMap<String, String>,
    imports: &[ImportDecl],
    locals: &HashMap<String, String>,
    in_static_context: bool,
) -> Result<(), SemanticError> {
    if dimensions == 0 {
        return Err(semantic_error(
            "Native array initializer must declare at least one array dimension".to_string(),
        ));
    }
    let lane = validate_native_array_element_type(element_ty, class_names, class_index)?;
    for value in values {
        if dimensions == 1 {
            match value {
                ArrayInitExpr::Nested(_) => {
                    return Err(semantic_error(
                        "Nested native array initializer depth does not match the declared array dimensions"
                            .to_string(),
                    ));
                }
                ArrayInitExpr::Expr(expr) => {
                    let expr_ty = infer_expr_type(
                        expr,
                        class,
                        class_info,
                        class_names,
                        class_index,
                        fqcn_to_class,
                        imports,
                        locals,
                        in_static_context,
                    )?;
                    match lane {
                        NativeArrayLane::IntLike | NativeArrayLane::WideScalar => {
                            if !types_compatible(element_ty, &expr_ty.ty, class_index) {
                                return Err(semantic_error(format!(
                                    "Native array initializer value of type '{}' is not compatible with '{}'",
                                    expr_ty.ty, element_ty
                                )));
                            }
                        }
                        NativeArrayLane::Reference => {
                            if expr_ty.ty != "null"
                                && !types_compatible(element_ty, &expr_ty.ty, class_index)
                            {
                                return Err(semantic_error(format!(
                                    "Native array initializer value of type '{}' is not compatible with '{}'",
                                    expr_ty.ty, element_ty
                                )));
                            }
                        }
                    }
                }
            }
        } else {
            let nested_element_ty = format!("{}{}", element_ty, "[]".repeat(dimensions - 1));
            match value {
                ArrayInitExpr::Nested(values) => validate_native_array_initializer(
                    values,
                    element_ty,
                    dimensions - 1,
                    class,
                    class_info,
                    class_names,
                    class_index,
                    fqcn_to_class,
                    imports,
                    locals,
                    in_static_context,
                )?,
                ArrayInitExpr::Expr(expr) => {
                    let expr_ty = infer_expr_type(
                        expr,
                        class,
                        class_info,
                        class_names,
                        class_index,
                        fqcn_to_class,
                        imports,
                        locals,
                        in_static_context,
                    )?;
                    if expr_ty.ty != "null"
                        && !types_compatible(&nested_element_ty, &expr_ty.ty, class_index)
                    {
                        return Err(semantic_error(format!(
                            "Native array initializer value of type '{}' is not compatible with '{}'",
                            expr_ty.ty, nested_element_ty
                        )));
                    }
                }
            }
        }
    }
    Ok(())
}
