use super::*;

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

pub(super) fn validate_field_initializer(
    field: &crate::FieldDecl,
    class: &ClassDecl,
    current_fqcn: &str,
    class_info: &ClassInfo,
    class_names: &HashSet<String>,
    class_index: &HashMap<String, ClassInfo>,
    fqcn_to_class: &HashMap<String, String>,
    imports: &[ImportDecl],
) -> Result<(), SemanticError> {
    let Some(init) = field.init.as_ref() else {
        return Ok(());
    };

    validate_null_deref(init, &HashMap::new())?;
    let inferred = infer_expr_type(
        init,
        class,
        class_info,
        class_names,
        class_index,
        fqcn_to_class,
        imports,
        &HashMap::new(),
        field.modifiers.contains(&Modifier::Static),
    )?;
    let expected = class_info
        .fields
        .get(field.name.as_str())
        .map(|f| f.ty.clone())
        .unwrap_or_else(|| field.ty.clone());
    validate_assignable(
        expected.as_str(),
        inferred.ty.as_str(),
        Some(init),
        &format!("field initializer '{}.{}'", current_fqcn, field.name),
        class_names,
        class_index,
    )?;
    validate_unboxing_nullability(
        expected.as_str(),
        inferred.ty.as_str(),
        init,
        &HashMap::new(),
        &format!("field initializer '{}.{}'", current_fqcn, field.name),
    )?;
    if class_info
        .fields
        .get(field.name.as_str())
        .map(|field| field.is_not_null)
        .unwrap_or(false)
    {
        validate_not_null_value(
            init,
            &HashMap::new(),
            &format!("field initializer '{}.{}'", current_fqcn, field.name),
        )?;
    }
    Ok(())
}

pub(super) fn validate_unboxing_nullability_in_expr(
    expr: &Expr,
    class: &ClassDecl,
    class_info: &ClassInfo,
    class_names: &HashSet<String>,
    class_index: &HashMap<String, ClassInfo>,
    fqcn_to_class: &HashMap<String, String>,
    imports: &[ImportDecl],
    locals: &HashMap<String, String>,
    in_static_context: bool,
    null_state: &HashMap<String, NullState>,
) -> Result<(), SemanticError> {
    let visible_type_params = class_info.type_params.iter().cloned().collect::<HashSet<_>>();
    validate_unboxing_nullability_in_expr_in_scope(
        expr,
        class,
        class_info,
        class_names,
        class_index,
        fqcn_to_class,
        imports,
        locals,
        &visible_type_params,
        in_static_context,
        null_state,
    )
}

pub(super) fn validate_unboxing_nullability_in_expr_in_scope(
    expr: &Expr,
    class: &ClassDecl,
    class_info: &ClassInfo,
    class_names: &HashSet<String>,
    class_index: &HashMap<String, ClassInfo>,
    fqcn_to_class: &HashMap<String, String>,
    imports: &[ImportDecl],
    locals: &HashMap<String, String>,
    visible_type_params: &HashSet<String>,
    in_static_context: bool,
    null_state: &HashMap<String, NullState>,
) -> Result<(), SemanticError> {
    match expr {
        Expr::Call { callee, args } => {
            let _ = infer_call_type_in_scope(
                callee,
                args,
                class,
                class_info,
                class_names,
                class_index,
                fqcn_to_class,
                imports,
                locals,
                visible_type_params,
                in_static_context,
                Some(null_state),
            )?;
            validate_unboxing_nullability_in_expr_in_scope(
                callee,
                class,
                class_info,
                class_names,
                class_index,
                fqcn_to_class,
                imports,
                locals,
                visible_type_params,
                in_static_context,
                null_state,
            )?;
            for arg in args {
                validate_unboxing_nullability_in_expr_in_scope(
                    arg,
                    class,
                    class_info,
                    class_names,
                    class_index,
                    fqcn_to_class,
                    imports,
                    locals,
                    visible_type_params,
                    in_static_context,
                    null_state,
                )?;
            }
        }
        Expr::NewObject { class_name, args } => {
            let _ = infer_new_object_type_in_scope(
                class_name,
                args,
                class,
                class_info,
                class_names,
                class_index,
                fqcn_to_class,
                imports,
                locals,
                visible_type_params,
                in_static_context,
                Some(null_state),
            )?;
            for arg in args {
                validate_unboxing_nullability_in_expr_in_scope(
                    arg,
                    class,
                    class_info,
                    class_names,
                    class_index,
                    fqcn_to_class,
                    imports,
                    locals,
                    visible_type_params,
                    in_static_context,
                    null_state,
                )?;
            }
        }
        Expr::MemberAccess { object, .. } => {
            validate_unboxing_nullability_in_expr_in_scope(
                object,
                class,
                class_info,
                class_names,
                class_index,
                fqcn_to_class,
                imports,
                locals,
                visible_type_params,
                in_static_context,
                null_state,
            )?;
        }
        Expr::ArrayAccess { array, index } => {
            validate_unboxing_nullability_in_expr_in_scope(
                array,
                class,
                class_info,
                class_names,
                class_index,
                fqcn_to_class,
                imports,
                locals,
                visible_type_params,
                in_static_context,
                null_state,
            )?;
            validate_unboxing_nullability_in_expr_in_scope(
                index,
                class,
                class_info,
                class_names,
                class_index,
                fqcn_to_class,
                imports,
                locals,
                visible_type_params,
                in_static_context,
                null_state,
            )?;
        }
        Expr::Unary { expr, .. } => {
            validate_unboxing_nullability_in_expr(
                expr,
                class,
                class_info,
                class_names,
                class_index,
                fqcn_to_class,
                imports,
                locals,
                in_static_context,
                null_state,
            )?;
        }
        Expr::Cast { expr, .. } => {
            validate_unboxing_nullability_in_expr(
                expr,
                class,
                class_info,
                class_names,
                class_index,
                fqcn_to_class,
                imports,
                locals,
                in_static_context,
                null_state,
            )?;
        }
        Expr::Binary {
            op: BinaryOp::LogicalAnd,
            ..
        } => {
            let mut current_state = null_state.clone();
            for operand in collect_logical_operands(expr, &BinaryOp::LogicalAnd) {
                validate_unboxing_nullability_in_expr(
                    operand,
                    class,
                    class_info,
                    class_names,
                    class_index,
                    fqcn_to_class,
                    imports,
                    locals,
                    in_static_context,
                    &current_state,
                )?;
                let mut next_state = current_state.clone();
                let mut ignored = current_state.clone();
                apply_null_flow_narrowing(operand, &mut next_state, &mut ignored);
                current_state = next_state;
            }
        }
        Expr::Binary {
            op: BinaryOp::LogicalOr,
            ..
        } => {
            let mut current_state = null_state.clone();
            for operand in collect_logical_operands(expr, &BinaryOp::LogicalOr) {
                validate_unboxing_nullability_in_expr(
                    operand,
                    class,
                    class_info,
                    class_names,
                    class_index,
                    fqcn_to_class,
                    imports,
                    locals,
                    in_static_context,
                    &current_state,
                )?;
                let mut ignored = current_state.clone();
                let mut next_state = current_state.clone();
                apply_null_flow_narrowing(operand, &mut ignored, &mut next_state);
                current_state = next_state;
            }
        }
        Expr::Binary { left, .. } => {
            validate_unboxing_nullability_in_expr(
                left,
                class,
                class_info,
                class_names,
                class_index,
                fqcn_to_class,
                imports,
                locals,
                in_static_context,
                null_state,
            )?;
            if let Expr::Binary { right, .. } = expr {
                validate_unboxing_nullability_in_expr(
                    right,
                    class,
                    class_info,
                    class_names,
                    class_index,
                    fqcn_to_class,
                    imports,
                    locals,
                    in_static_context,
                    null_state,
                )?;
            }
        }
        Expr::Conditional {
            condition,
            then_expr,
            else_expr,
        } => {
            validate_unboxing_nullability_in_expr(
                condition,
                class,
                class_info,
                class_names,
                class_index,
                fqcn_to_class,
                imports,
                locals,
                in_static_context,
                null_state,
            )?;
            validate_unboxing_nullability_in_expr(
                then_expr,
                class,
                class_info,
                class_names,
                class_index,
                fqcn_to_class,
                imports,
                locals,
                in_static_context,
                null_state,
            )?;
            validate_unboxing_nullability_in_expr(
                else_expr,
                class,
                class_info,
                class_names,
                class_index,
                fqcn_to_class,
                imports,
                locals,
                in_static_context,
                null_state,
            )?;
        }
        Expr::NewArray { lengths, .. } => {
            for length in lengths {
                validate_unboxing_nullability_in_expr(
                    length,
                    class,
                    class_info,
                    class_names,
                    class_index,
                    fqcn_to_class,
                    imports,
                    locals,
                    in_static_context,
                    null_state,
                )?;
            }
        }
        Expr::NewArrayInitialized { values, .. } => {
            for value in values {
                validate_unboxing_nullability_in_array_init(
                    value,
                    class,
                    class_info,
                    class_names,
                    class_index,
                    fqcn_to_class,
                    imports,
                    locals,
                    in_static_context,
                    null_state,
                )?;
            }
        }
        Expr::IncDec { target, .. } => {
            validate_unboxing_nullability_in_expr(
                target,
                class,
                class_info,
                class_names,
                class_index,
                fqcn_to_class,
                imports,
                locals,
                in_static_context,
                null_state,
            )?;
        }
        _ => {}
    }

    Ok(())
}

#[allow(clippy::too_many_arguments)]
fn validate_unboxing_nullability_in_array_init(
    value: &crate::ArrayInitExpr,
    class: &ClassDecl,
    class_info: &ClassInfo,
    class_names: &HashSet<String>,
    class_index: &HashMap<String, ClassInfo>,
    fqcn_to_class: &HashMap<String, String>,
    imports: &[ImportDecl],
    locals: &HashMap<String, String>,
    in_static_context: bool,
    null_state: &HashMap<String, NullState>,
) -> Result<(), SemanticError> {
    match value {
        crate::ArrayInitExpr::Expr(expr) => validate_unboxing_nullability_in_expr(
            expr,
            class,
            class_info,
            class_names,
            class_index,
            fqcn_to_class,
            imports,
            locals,
            in_static_context,
            null_state,
        ),
        crate::ArrayInitExpr::Nested(values) => {
            for nested in values {
                validate_unboxing_nullability_in_array_init(
                    nested,
                    class,
                    class_info,
                    class_names,
                    class_index,
                    fqcn_to_class,
                    imports,
                    locals,
                    in_static_context,
                    null_state,
                )?;
            }
            Ok(())
        }
    }
}

pub(super) fn validate_unboxing_nullability(
    expected: &str,
    actual: &str,
    expr: &Expr,
    null_state: &HashMap<String, NullState>,
    _context: &str,
) -> Result<(), SemanticError> {
    if !is_primitive_non_void(expected) {
        return Ok(());
    }
    let Some(actual_primitive) = wrapper_primitive_type(actual) else {
        return Ok(());
    };
    if actual_primitive != class_simple_name(expected) {
        return Ok(());
    }

    match expr {
        Expr::NullLiteral => Err(semantic_error(format!(
            "Cannot unbox null to primitive '{}'",
            expected
        ))),
        Expr::Var(name) if matches!(null_state.get(name), Some(NullState::Null)) => {
            Err(semantic_error(format!(
                "Cannot unbox null variable '{}' to primitive '{}'",
                name, expected
            )))
        }
        _ => Ok(()),
    }
}

pub(super) fn validate_unboxing_nullability_for_call_args(
    expected_params: &[String],
    is_varargs: bool,
    args: &[Expr],
    actual_types: &[String],
    null_state: &HashMap<String, NullState>,
    context: &str,
) -> Result<(), SemanticError> {
    let fixed_count = if is_varargs {
        expected_params.len().saturating_sub(1)
    } else {
        expected_params.len()
    };
    for ((expected, actual), arg) in expected_params
        .iter()
        .take(fixed_count)
        .zip(actual_types.iter().take(fixed_count))
        .zip(args.iter().take(fixed_count))
    {
        validate_unboxing_nullability(expected, actual, arg, null_state, context)?;
    }
    if is_varargs {
        let Some(vararg_array_ty) = expected_params.last() else {
            return Ok(());
        };
        let vararg_element_ty = vararg_array_ty
            .strip_suffix("[]")
            .unwrap_or(vararg_array_ty);
        if actual_types.len() == fixed_count + 1
            && args.len() == fixed_count + 1
            && (actual_types[fixed_count] == *vararg_array_ty
                || class_simple_name(&actual_types[fixed_count])
                    == class_simple_name(vararg_array_ty))
        {
            validate_unboxing_nullability(
                vararg_array_ty,
                &actual_types[fixed_count],
                &args[fixed_count],
                null_state,
                context,
            )?;
        } else {
            for ((actual, arg), _) in actual_types
                .iter()
                .skip(fixed_count)
                .zip(args.iter().skip(fixed_count))
                .zip(std::iter::repeat(()))
            {
                validate_unboxing_nullability(vararg_element_ty, actual, arg, null_state, context)?;
            }
        }
    }
    Ok(())
}
