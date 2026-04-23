use super::*;

#[allow(clippy::too_many_arguments)]
pub(super) fn validate_if_stmt(
    condition: &Expr,
    then_branch: &[Stmt],
    else_branch: Option<&[Stmt]>,
    method: &MethodDecl,
    class: &ClassDecl,
    current_class_fqcn: &str,
    class_info: &ClassInfo,
    class_names: &HashSet<String>,
    simple_to_fqcns: &HashMap<String, Vec<String>>,
    class_index: &HashMap<String, ClassInfo>,
    fqcn_to_class: &HashMap<String, String>,
    imports: &[ImportDecl],
    locals: &mut HashMap<String, String>,
    null_state: &mut HashMap<String, NullState>,
    expected_return: &str,
    in_static_context: bool,
    breakable_depth: usize,
    loop_depth: usize,
    protected_try_depth: usize,
    in_catch_or_finally: bool,
) -> Result<bool, SemanticError> {
    let visible_type_params = visible_type_params(class, Some(method));
    validate_null_deref(condition, null_state)?;
    validate_unboxing_nullability_in_expr_in_scope(
        condition,
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
    )?;
    let cond_ty = infer_expr_type_in_scope(
        condition,
        class,
        class_info,
        class_names,
        class_index,
        fqcn_to_class,
        imports,
        locals,
        &visible_type_params,
        in_static_context,
    )?;
    if cond_ty.ty != "boolean" {
        return Err(semantic_error(format!(
            "If condition in '{}.{}' must be boolean, got '{}'",
            class.name, method.name, cond_ty.ty
        )));
    }

    let mut then_locals = locals.clone();
    let mut then_null_state = null_state.clone();
    let mut else_null_state = null_state.clone();
    apply_null_flow_narrowing(condition, &mut then_null_state, &mut else_null_state);
    let mut saw_return = false;
    for nested in then_branch {
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
            &mut then_locals,
            &mut then_null_state,
            expected_return,
            in_static_context,
            breakable_depth,
            loop_depth,
            protected_try_depth,
            in_catch_or_finally,
        )? {
            saw_return = true;
        }
    }

    if let Some(else_stmts) = else_branch {
        let mut else_locals = locals.clone();
        for nested in else_stmts {
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
                &mut else_locals,
                &mut else_null_state,
                expected_return,
                in_static_context,
                breakable_depth,
                loop_depth,
                protected_try_depth,
                in_catch_or_finally,
            )? {
                saw_return = true;
            }
        }
    }

    *null_state = merge_null_state(
        null_state,
        &then_null_state,
        else_branch.as_ref().map(|_| &else_null_state),
    );

    Ok(saw_return)
}

#[allow(clippy::too_many_arguments)]
pub(super) fn validate_while_stmt(
    condition: &Expr,
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
    let visible_type_params = visible_type_params(class, Some(method));
    validate_null_deref(condition, null_state)?;
    validate_unboxing_nullability_in_expr_in_scope(
        condition,
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
    )?;
    let cond_ty = infer_expr_type_in_scope(
        condition,
        class,
        class_info,
        class_names,
        class_index,
        fqcn_to_class,
        imports,
        locals,
        &visible_type_params,
        in_static_context,
    )?;
    if cond_ty.ty != "boolean" {
        return Err(semantic_error(format!(
            "While condition in '{}.{}' must be boolean, got '{}'",
            class.name, method.name, cond_ty.ty
        )));
    }

    let mut body_null_state = null_state.clone();
    let mut exit_null_state = null_state.clone();
    apply_null_flow_narrowing(condition, &mut body_null_state, &mut exit_null_state);
    let mut loop_locals = locals.clone();
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
            &mut body_null_state,
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

    *null_state = merge_null_states(null_state, &[&exit_null_state]);

    Ok(saw_return)
}

#[allow(clippy::too_many_arguments)]
pub(super) fn validate_do_while_stmt(
    body: &[Stmt],
    condition: &Expr,
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
    in_static_context: bool,
    breakable_depth: usize,
    loop_depth: usize,
    protected_try_depth: usize,
    in_catch_or_finally: bool,
    expected_return: &str,
) -> Result<bool, SemanticError> {
    let visible_type_params = visible_type_params(class, Some(method));
    let mut loop_locals = locals.clone();
    let mut body_null_state = null_state.clone();
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
            &mut body_null_state,
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

    let cond_ty = infer_expr_type_in_scope(
        condition,
        class,
        class_info,
        class_names,
        class_index,
        fqcn_to_class,
        imports,
        &loop_locals,
        &visible_type_params,
        in_static_context,
    )?;
    validate_null_deref(condition, &body_null_state)?;
    validate_unboxing_nullability_in_expr_in_scope(
        condition,
        class,
        class_info,
        class_names,
        class_index,
        fqcn_to_class,
        imports,
        &loop_locals,
        &visible_type_params,
        in_static_context,
        &body_null_state,
    )?;
    if cond_ty.ty != "boolean" {
        return Err(semantic_error(format!(
            "Do-while condition in '{}.{}' must be boolean, got '{}'",
            class.name, method.name, cond_ty.ty
        )));
    }

    let mut continue_null_state = body_null_state.clone();
    let mut exit_null_state = body_null_state.clone();
    apply_null_flow_narrowing(condition, &mut continue_null_state, &mut exit_null_state);
    *null_state = merge_null_states(null_state, &[&exit_null_state]);

    Ok(saw_return)
}

#[allow(clippy::too_many_arguments)]
pub(super) fn validate_for_stmt(
    init: Option<&Stmt>,
    condition: Option<&Expr>,
    update: Option<&Stmt>,
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
    let visible_type_params = visible_type_params(class, Some(method));
    let mut loop_locals = locals.clone();
    let mut body_null_state = null_state.clone();
    let mut exit_null_state = null_state.clone();

    if let Some(init_stmt) = init {
        validate_stmt(
            init_stmt,
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
            &mut body_null_state,
            expected_return,
            in_static_context,
            breakable_depth,
            loop_depth,
            protected_try_depth,
            in_catch_or_finally,
        )?;
    }

    if let Some(cond_expr) = condition {
        validate_null_deref(cond_expr, null_state)?;
        validate_unboxing_nullability_in_expr_in_scope(
            cond_expr,
            class,
            class_info,
            class_names,
            class_index,
            fqcn_to_class,
            imports,
            &loop_locals,
            &visible_type_params,
            in_static_context,
            null_state,
        )?;
        let cond_ty = infer_expr_type_in_scope(
            cond_expr,
            class,
            class_info,
            class_names,
            class_index,
            fqcn_to_class,
            imports,
            &loop_locals,
            &visible_type_params,
            in_static_context,
        )?;
        if cond_ty.ty != "boolean" {
            return Err(semantic_error(format!(
                "For condition in '{}.{}' must be boolean, got '{}'",
                class.name, method.name, cond_ty.ty
            )));
        }
        apply_null_flow_narrowing(cond_expr, &mut body_null_state, &mut exit_null_state);
    }

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
            &mut body_null_state,
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

    if let Some(update_stmt) = update {
        validate_stmt(
            update_stmt,
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
            &mut body_null_state,
            expected_return,
            in_static_context,
            breakable_depth + 1,
            loop_depth + 1,
            protected_try_depth,
            in_catch_or_finally,
        )?;
    }

    if condition.is_some() {
        *null_state = merge_null_states(null_state, &[&exit_null_state]);
    }

    Ok(saw_return)
}
