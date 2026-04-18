use super::*;

pub(super) fn validate_stmt(
    stmt: &Stmt,
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
    match stmt {
        Stmt::VarDecl { ty, name, init, .. } => {
            let var_ty = if ty == "var" {
                let Some(expr) = init else {
                    return Err(semantic_error(format!(
                        "Local variable inference in '{}.{}({})' requires an initializer",
                        class.name, method.name, name
                    )));
                };
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
                let inferred = infer_expr_type(
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
                if inferred.ty == "null" {
                    return Err(semantic_error(format!(
                        "Local variable inference in '{}.{}({})' cannot infer from 'null'",
                        class.name, method.name, name
                    )));
                }
                if inferred.ty == "void" {
                    return Err(semantic_error(format!(
                        "Local variable inference in '{}.{}({})' cannot infer type from 'void' expression",
                        class.name, method.name, name
                    )));
                }
                inferred.ty
            } else {
                let fqcn_names = collect_fqcn_names(class_index);
                let generic_arity = collect_generic_arity(class_index);
                let visible_type_params = visible_type_params(class, Some(method));
                validate_type_exists_in_scope(
                    ty,
                    &class_info.package_name,
                    imports,
                    simple_to_fqcns,
                    &fqcn_names,
                    &generic_arity,
                    &visible_type_params,
                    &format!("local variable '{}.{}({})'", class.name, method.name, name),
                )?;
                canonicalize_type_name_in_scope(
                    ty,
                    &class_info.package_name,
                    imports,
                    simple_to_fqcns,
                    &fqcn_names,
                    &generic_arity,
                    &visible_type_params,
                )?
            };

            if locals.contains_key(name) {
                return Err(semantic_error(format!(
                    "Duplicate local variable '{}' in method '{}.{}'",
                    name, class.name, method.name
                )));
            }

            if let Some(expr) = init {
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
                    &var_ty,
                    &actual.ty,
                    Some(expr),
                    &format!("initializer for '{}.{}({})'", class.name, method.name, name),
                    class_names,
                    class_index,
                )?;
                validate_unboxing_nullability(
                    &var_ty,
                    &actual.ty,
                    expr,
                    null_state,
                    &format!("initializer for '{}.{}({})'", class.name, method.name, name),
                )?;
                null_state.insert(
                    name.clone(),
                    infer_null_state_from_assignment(&var_ty, &actual.ty, class_names),
                );
            } else {
                null_state.insert(name.clone(), NullState::Unknown);
            }

            locals.insert(name.clone(), var_ty);
            Ok(false)
        }
        Stmt::Assign { target, value, .. } => {
            validate_null_deref(value, null_state)?;
            validate_unboxing_nullability_in_expr(
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
                method.is_constructor,
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
            if target_ty.kind != ExprKind::Value {
                return Err(semantic_error(format!(
                    "Invalid assignment target in '{}.{}'",
                    class.name, method.name
                )));
            }

            let value_ty = infer_expr_type(
                value,
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
                &target_ty.ty,
                &value_ty.ty,
                Some(value),
                &format!("assignment in '{}.{}'", class.name, method.name),
                class_names,
                class_index,
            )?;
            validate_unboxing_nullability(
                &target_ty.ty,
                &value_ty.ty,
                value,
                null_state,
                &format!("assignment in '{}.{}'", class.name, method.name),
            )?;
            validate_not_null_assignment_target(
                target,
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
                &format!("assignment in '{}.{}'", class.name, method.name),
            )?;

            if let Expr::Var(name) = target {
                null_state.insert(
                    name.clone(),
                    infer_null_state_from_assignment(&target_ty.ty, &value_ty.ty, class_names),
                );
            }
            Ok(false)
        }
        Stmt::CompoundAssign {
            target, op, value, ..
        } => {
            validate_null_deref(value, null_state)?;
            validate_unboxing_nullability_in_expr(
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
            if target_ty.kind != ExprKind::Value {
                return Err(semantic_error(format!(
                    "Invalid assignment target in '{}.{}'",
                    class.name, method.name
                )));
            }

            let value_ty = infer_expr_type(
                value,
                class,
                class_info,
                class_names,
                class_index,
                fqcn_to_class,
                imports,
                locals,
                in_static_context,
            )?;
            let result_ty = infer_binary_result_type(op, &target_ty.ty, &value_ty.ty, class_names)?;

            validate_assignable(
                &target_ty.ty,
                &result_ty,
                None,
                &format!("compound assignment in '{}.{}'", class.name, method.name),
                class_names,
                class_index,
            )?;
            Ok(false)
        }
        Stmt::If {
            condition,
            then_branch,
            else_branch,
            ..
        } => validate_if_stmt(
            condition,
            then_branch,
            else_branch.as_deref(),
            method,
            class,
            current_class_fqcn,
            class_info,
            class_names,
            simple_to_fqcns,
            class_index,
            fqcn_to_class,
            imports,
            locals,
            null_state,
            expected_return,
            in_static_context,
            breakable_depth,
            loop_depth,
            protected_try_depth,
            in_catch_or_finally,
        ),
        Stmt::While {
            condition, body, ..
        } => validate_while_stmt(
            condition,
            body,
            method,
            class,
            current_class_fqcn,
            class_info,
            class_names,
            simple_to_fqcns,
            class_index,
            fqcn_to_class,
            imports,
            locals,
            null_state,
            expected_return,
            in_static_context,
            breakable_depth,
            loop_depth,
            protected_try_depth,
            in_catch_or_finally,
        ),
        Stmt::DoWhile {
            body, condition, ..
        } => validate_do_while_stmt(
            body,
            condition,
            method,
            class,
            current_class_fqcn,
            class_info,
            class_names,
            simple_to_fqcns,
            class_index,
            fqcn_to_class,
            imports,
            locals,
            null_state,
            in_static_context,
            breakable_depth,
            loop_depth,
            protected_try_depth,
            in_catch_or_finally,
            expected_return,
        ),
        Stmt::For {
            init,
            condition,
            update,
            body,
            ..
        } => validate_for_stmt(
            init.as_deref(),
            condition.as_ref(),
            update.as_deref(),
            body,
            method,
            class,
            current_class_fqcn,
            class_info,
            class_names,
            simple_to_fqcns,
            class_index,
            fqcn_to_class,
            imports,
            locals,
            null_state,
            expected_return,
            in_static_context,
            breakable_depth,
            loop_depth,
            protected_try_depth,
            in_catch_or_finally,
        ),
        Stmt::ForEach {
            ty,
            name,
            iterable,
            body,
            ..
        } => validate_foreach_stmt(
            ty,
            name,
            iterable,
            body,
            method,
            class,
            current_class_fqcn,
            class_info,
            class_names,
            simple_to_fqcns,
            class_index,
            fqcn_to_class,
            imports,
            locals,
            null_state,
            expected_return,
            in_static_context,
            breakable_depth,
            loop_depth,
            protected_try_depth,
            in_catch_or_finally,
        ),
        Stmt::Switch {
            expr,
            cases,
            default,
            ..
        } => validate_switch_stmt(
            expr,
            cases,
            default.as_deref(),
            method,
            class,
            current_class_fqcn,
            class_info,
            class_names,
            simple_to_fqcns,
            class_index,
            fqcn_to_class,
            imports,
            locals,
            null_state,
            expected_return,
            in_static_context,
            breakable_depth,
            loop_depth,
            protected_try_depth,
            in_catch_or_finally,
        ),
        Stmt::Try {
            resources,
            body,
            catches,
            finally_block,
            ..
        } => validate_try_stmt(
            resources,
            body,
            catches,
            finally_block.as_deref(),
            method,
            class,
            current_class_fqcn,
            class_info,
            class_names,
            simple_to_fqcns,
            class_index,
            fqcn_to_class,
            imports,
            locals,
            null_state,
            expected_return,
            in_static_context,
            breakable_depth,
            loop_depth,
            protected_try_depth,
        ),
        Stmt::Assert {
            condition, message, ..
        } => validate_assert_stmt(
            condition,
            message.as_ref(),
            method,
            class,
            class_info,
            class_names,
            class_index,
            fqcn_to_class,
            imports,
            locals,
            null_state,
            in_static_context,
        ),
        Stmt::Break { .. } => {
            validate_break_stmt(method, class, breakable_depth, protected_try_depth)
        }
        Stmt::Continue { .. } => {
            validate_continue_stmt(method, class, loop_depth, protected_try_depth)
        }
        Stmt::Throw(expr, ..) => validate_throw_stmt(
            expr,
            method,
            class,
            class_info,
            class_names,
            class_index,
            fqcn_to_class,
            imports,
            locals,
            null_state,
            in_static_context,
            in_catch_or_finally,
        ),
        Stmt::ExprStmt(expr, ..) => validate_expr_stmt(
            expr,
            class,
            class_info,
            class_names,
            class_index,
            fqcn_to_class,
            imports,
            locals,
            null_state,
            in_static_context,
        ),
        Stmt::Return(value, ..) => validate_return_stmt(
            value.as_ref(),
            method,
            class,
            class_info,
            class_names,
            class_index,
            fqcn_to_class,
            imports,
            locals,
            null_state,
            expected_return,
            in_static_context,
            protected_try_depth,
        ),
    }
}
