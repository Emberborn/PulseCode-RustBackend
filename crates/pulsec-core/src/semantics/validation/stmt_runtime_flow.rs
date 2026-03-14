use super::*;

#[allow(clippy::too_many_arguments)]
pub(super) fn validate_foreach_stmt(
    ty: &str,
    name: &str,
    iterable: &Expr,
    body: &[Stmt],
    method: &MethodDecl,
    class: &ClassDecl,
    current_class_fqcn: &str,
    class_info: &ClassInfo,
    class_names: &HashSet<String>,
    simple_to_fqcns: &HashMap<String, Vec<String>>,
    class_index: &HashMap<String, ClassInfo>,
    fqcn_to_class: &HashMap<String, String>,
    imports: &[ImportDecl],
    locals: &HashMap<String, String>,
    null_state: &mut HashMap<String, NullState>,
    expected_return: &str,
    in_static_context: bool,
    breakable_depth: usize,
    loop_depth: usize,
    protected_try_depth: usize,
    in_catch_or_finally: bool,
) -> Result<bool, SemanticError> {
    validate_null_deref(iterable, null_state)?;
    validate_unboxing_nullability_in_expr(
        iterable,
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
    let iterable_ty = infer_expr_type(
        iterable,
        class,
        class_info,
        class_names,
        class_index,
        fqcn_to_class,
        imports,
        locals,
        in_static_context,
    )?;

    let native_array_baseline = iterable_ty.ty.ends_with("[]");
    let array_baseline =
        types_compatible("com.pulse.collections.Array", &iterable_ty.ty, class_index);
    let iterable_baseline =
        types_compatible("com.pulse.lang.Iterable", &iterable_ty.ty, class_index);

    if !native_array_baseline && !array_baseline && !iterable_baseline {
        return Err(semantic_error(format!(
            "Foreach source in '{}.{}' must be a native array, com.pulse.lang.Iterable, or com.pulse.collections.Array, got '{}'",
            class.name, method.name, iterable_ty.ty
        )));
    }

    let inferred_ty = if ty == "var" {
        if native_array_baseline {
            iterable_ty
                .ty
                .strip_suffix("[]")
                .unwrap_or(&iterable_ty.ty)
                .to_string()
        } else if iterable_baseline {
            "com.pulse.lang.Object".to_string()
        } else {
            return Err(semantic_error(format!(
                "Foreach local variable inference in '{}.{}' is currently supported for native arrays and com.pulse.lang.Iterable, got '{}'",
                class.name, method.name, iterable_ty.ty
            )));
        }
    } else {
        ty.to_string()
    };

    if native_array_baseline {
        let element_ty = iterable_ty
            .ty
            .strip_suffix("[]")
            .unwrap_or(&iterable_ty.ty)
            .to_string();
        if !types_compatible(&inferred_ty, &element_ty, class_index) {
            return Err(semantic_error(format!(
                "Foreach over native array type '{}' requires loop variable type compatible with '{}', got '{}'",
                iterable_ty.ty, element_ty, inferred_ty
            )));
        }
    }

    if array_baseline && inferred_ty != "int" && !is_string_type(&inferred_ty) {
        return Err(semantic_error(format!(
            "Foreach over com.pulse.collections.Array currently supports loop variables of type 'int' or 'String', got '{}'",
            inferred_ty
        )));
    }

    if iterable_baseline && !types_compatible(&inferred_ty, "com.pulse.lang.Object", class_index) {
        return Err(semantic_error(format!(
            "Foreach over com.pulse.lang.Iterable currently requires loop variable type 'Object' (or an assignable supertype), got '{}'",
            inferred_ty
        )));
    }

    let mut loop_locals = locals.clone();
    loop_locals.insert(name.to_string(), inferred_ty);
    let mut loop_null_state = null_state.clone();
    loop_null_state.insert(
        name.to_string(),
        if is_nullable_type(loop_locals[name].as_str(), class_names) {
            NullState::Unknown
        } else {
            NullState::NonNull
        },
    );

    let mut saw_return = false;
    for nested in body {
        if validate_stmt(
            nested,
            method,
            class,
            current_class_fqcn,
            class_info,
            class_names,
            simple_to_fqcns,
            class_index,
            fqcn_to_class,
            imports,
            &mut loop_locals,
            &mut loop_null_state,
            expected_return,
            in_static_context,
            breakable_depth + 1,
            loop_depth + 1,
            protected_try_depth,
            in_catch_or_finally,
        )? {
            saw_return = true;
        }
    }

    Ok(saw_return)
}

#[allow(clippy::too_many_arguments)]
pub(super) fn validate_switch_stmt(
    expr: &Expr,
    cases: &[crate::SwitchCase],
    default: Option<&[Stmt]>,
    method: &MethodDecl,
    class: &ClassDecl,
    current_class_fqcn: &str,
    class_info: &ClassInfo,
    class_names: &HashSet<String>,
    simple_to_fqcns: &HashMap<String, Vec<String>>,
    class_index: &HashMap<String, ClassInfo>,
    fqcn_to_class: &HashMap<String, String>,
    imports: &[ImportDecl],
    locals: &HashMap<String, String>,
    null_state: &mut HashMap<String, NullState>,
    expected_return: &str,
    in_static_context: bool,
    breakable_depth: usize,
    loop_depth: usize,
    protected_try_depth: usize,
    in_catch_or_finally: bool,
) -> Result<bool, SemanticError> {
    validate_null_deref(expr, null_state)?;
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
    let mut saw_return = false;
    let mut branch_states = vec![null_state.clone()];

    for case in cases {
        if !is_switch_case_literal(&case.label) {
            return Err(semantic_error(format!(
                "Switch case in '{}.{}' must be a literal",
                class.name, method.name
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
                "Switch case type mismatch in '{}.{}': expected '{}', got '{}'",
                class.name, method.name, switch_ty.ty, label_ty.ty
            )));
        }

        let key = switch_case_key(&case.label);
        if !seen_labels.insert(key) {
            return Err(semantic_error(format!(
                "Duplicate switch case label in '{}.{}'",
                class.name, method.name
            )));
        }

        let mut case_locals = locals.clone();
        let mut case_null_state = null_state.clone();
        for nested in &case.body {
            if validate_stmt(
                nested,
                method,
                class,
                current_class_fqcn,
                class_info,
                class_names,
                simple_to_fqcns,
                class_index,
                fqcn_to_class,
                imports,
                &mut case_locals,
                &mut case_null_state,
                expected_return,
                in_static_context,
                breakable_depth + 1,
                loop_depth,
                protected_try_depth,
                in_catch_or_finally,
            )? {
                saw_return = true;
            }
        }
        branch_states.push(case_null_state);
    }

    if let Some(default_body) = default {
        let mut default_locals = locals.clone();
        let mut default_null_state = null_state.clone();
        for nested in default_body {
            if validate_stmt(
                nested,
                method,
                class,
                current_class_fqcn,
                class_info,
                class_names,
                simple_to_fqcns,
                class_index,
                fqcn_to_class,
                imports,
                &mut default_locals,
                &mut default_null_state,
                expected_return,
                in_static_context,
                breakable_depth + 1,
                loop_depth,
                protected_try_depth,
                in_catch_or_finally,
            )? {
                saw_return = true;
            }
        }
        branch_states.push(default_null_state);
    }

    let branch_refs = branch_states.iter().collect::<Vec<_>>();
    *null_state = merge_null_states(null_state, &branch_refs);

    Ok(saw_return)
}

#[allow(clippy::too_many_arguments)]
pub(super) fn validate_assert_stmt(
    condition: &Expr,
    message: Option<&Expr>,
    method: &MethodDecl,
    class: &ClassDecl,
    class_info: &ClassInfo,
    class_names: &HashSet<String>,
    class_index: &HashMap<String, ClassInfo>,
    fqcn_to_class: &HashMap<String, String>,
    imports: &[ImportDecl],
    locals: &HashMap<String, String>,
    null_state: &mut HashMap<String, NullState>,
    in_static_context: bool,
) -> Result<bool, SemanticError> {
    validate_null_deref(condition, null_state)?;
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
            "Assert condition in '{}.{}' must be boolean, got '{}'",
            class.name, method.name, condition_ty.ty
        )));
    }

    if let Some(message) = message {
        validate_null_deref(message, null_state)?;
        validate_unboxing_nullability_in_expr(
            message,
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
        let message_ty = infer_expr_type(
            message,
            class,
            class_info,
            class_names,
            class_index,
            fqcn_to_class,
            imports,
            locals,
            in_static_context,
        )?;
        if !is_string_type(&message_ty.ty) {
            return Err(semantic_error(format!(
                "Assert message in '{}.{}' must be String, got '{}'",
                class.name, method.name, message_ty.ty
            )));
        }
    }

    Ok(false)
}

pub(super) fn validate_break_stmt(
    method: &MethodDecl,
    class: &ClassDecl,
    breakable_depth: usize,
    protected_try_depth: usize,
) -> Result<bool, SemanticError> {
    if protected_try_depth > 0 {
        return Err(semantic_error(format!(
            "'break' is not supported inside try/catch/finally in '{}.{}' for the current F1-16 baseline",
            class.name, method.name
        )));
    }
    if breakable_depth == 0 {
        return Err(semantic_error(format!(
            "'break' is only valid inside loops or switch blocks in '{}.{}'",
            class.name, method.name
        )));
    }
    Ok(false)
}

pub(super) fn validate_continue_stmt(
    method: &MethodDecl,
    class: &ClassDecl,
    loop_depth: usize,
    protected_try_depth: usize,
) -> Result<bool, SemanticError> {
    if protected_try_depth > 0 {
        return Err(semantic_error(format!(
            "'continue' is not supported inside try/catch/finally in '{}.{}' for the current F1-16 baseline",
            class.name, method.name
        )));
    }
    if loop_depth == 0 {
        return Err(semantic_error(format!(
            "'continue' is only valid inside loops in '{}.{}'",
            class.name, method.name
        )));
    }
    Ok(false)
}

#[allow(clippy::too_many_arguments)]
pub(super) fn validate_throw_stmt(
    expr: &Expr,
    method: &MethodDecl,
    class: &ClassDecl,
    class_info: &ClassInfo,
    class_names: &HashSet<String>,
    class_index: &HashMap<String, ClassInfo>,
    fqcn_to_class: &HashMap<String, String>,
    imports: &[ImportDecl],
    locals: &HashMap<String, String>,
    null_state: &mut HashMap<String, NullState>,
    in_static_context: bool,
    in_catch_or_finally: bool,
) -> Result<bool, SemanticError> {
    if in_catch_or_finally {
        return Err(semantic_error(format!(
            "'throw' from catch/finally is not supported yet in '{}.{}' for the current F1-16 baseline",
            class.name, method.name
        )));
    }
    validate_null_deref(expr, null_state)?;
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

    let thrown = infer_expr_type(
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

    if thrown.kind != ExprKind::Value {
        return Err(semantic_error(format!(
            "Throw operand in '{}.{}' must be a throwable value",
            class.name, method.name
        )));
    }

    validate_assignable(
        "com.pulse.lang.Throwable",
        &thrown.ty,
        Some(expr),
        &format!("throw operand in '{}.{}'", class.name, method.name),
        class_names,
        class_index,
    )?;

    match expr {
        Expr::NullLiteral => Err(semantic_error(format!(
            "Throw operand in '{}.{}' cannot be null in the current F1 baseline",
            class.name, method.name
        ))),
        Expr::Var(name) if matches!(null_state.get(name), Some(NullState::Null)) => Err(
            semantic_error(format!(
                "Throw operand '{}' in '{}.{}' is definitely null in the current F1 baseline",
                name, class.name, method.name
            )),
        ),
        _ => Ok(true),
    }
}

#[allow(clippy::too_many_arguments)]
pub(super) fn validate_expr_stmt(
    expr: &Expr,
    class: &ClassDecl,
    class_info: &ClassInfo,
    class_names: &HashSet<String>,
    class_index: &HashMap<String, ClassInfo>,
    fqcn_to_class: &HashMap<String, String>,
    imports: &[ImportDecl],
    locals: &HashMap<String, String>,
    null_state: &mut HashMap<String, NullState>,
    in_static_context: bool,
) -> Result<bool, SemanticError> {
    validate_null_deref(expr, null_state)?;
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
    infer_expr_type(
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
    Ok(false)
}

#[allow(clippy::too_many_arguments)]
pub(super) fn validate_return_stmt(
    value: Option<&Expr>,
    method: &MethodDecl,
    class: &ClassDecl,
    class_info: &ClassInfo,
    class_names: &HashSet<String>,
    class_index: &HashMap<String, ClassInfo>,
    fqcn_to_class: &HashMap<String, String>,
    imports: &[ImportDecl],
    locals: &HashMap<String, String>,
    null_state: &mut HashMap<String, NullState>,
    expected_return: &str,
    in_static_context: bool,
    protected_try_depth: usize,
) -> Result<bool, SemanticError> {
    if protected_try_depth > 0 {
        return Err(semantic_error(format!(
            "'return' is not supported inside try/catch/finally in '{}.{}' for the current F1-16 baseline",
            class.name, method.name
        )));
    }
    if method.is_constructor {
        if value.is_some() {
            return Err(semantic_error(format!(
                "Constructor '{}.{}' cannot return a value",
                class.name, method.name
            )));
        }
        return Ok(false);
    }
    if expected_return == "void" {
        if value.is_some() {
            return Err(semantic_error(format!(
                "Method '{}.{}' returns void and cannot return a value",
                class.name, method.name
            )));
        }
        return Ok(false);
    }

    let expr = value.ok_or_else(|| {
        semantic_error(format!(
            "Method '{}.{}' must return '{}'",
            class.name, method.name, expected_return
        ))
    })?;
    validate_null_deref(expr, null_state)?;
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
    let actual = infer_expr_type(
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
    validate_assignable(
        expected_return,
        &actual.ty,
        Some(expr),
        &format!("return in '{}.{}'", class.name, method.name),
        class_names,
        class_index,
    )?;
    validate_unboxing_nullability(
        expected_return,
        &actual.ty,
        expr,
        null_state,
        &format!("return in '{}.{}'", class.name, method.name),
    )?;
    if method
        .annotations
        .iter()
        .any(|annotation| annotation_simple_name(annotation.name.as_str()) == "NotNull")
    {
        validate_not_null_value(
            expr,
            null_state,
            &format!("return in '{}.{}'", class.name, method.name),
        )?;
    }
    Ok(true)
}
