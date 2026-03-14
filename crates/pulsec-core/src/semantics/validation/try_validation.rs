use super::*;

pub(super) fn validate_try_stmt(
    body: &[Stmt],
    catches: &[CatchClause],
    finally_block: Option<&[Stmt]>,
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
) -> Result<bool, SemanticError> {
    if catches.is_empty() && finally_block.is_none() {
        return Err(semantic_error(format!(
            "Try statement in '{}.{}' must declare at least one catch or finally block",
            class.name, method.name
        )));
    }

    let fqcn_names = collect_fqcn_names(class_index);
    let generic_arity = collect_generic_arity(class_index);
    let visible_type_params = visible_type_params(class, Some(method));

    let mut try_locals = locals.clone();
    let mut try_null_state = null_state.clone();
    let mut try_returns = false;
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
            &mut try_locals,
            &mut try_null_state,
            expected_return,
            in_static_context,
            breakable_depth,
            loop_depth,
            protected_try_depth + 1,
            false,
        )? {
            try_returns = true;
        }
    }

    let mut catch_returns = catches.is_empty();
    let mut branch_states = vec![try_null_state];
    for catch_clause in catches {
        validate_type_exists_in_scope(
            catch_clause.ty.as_str(),
            &class_info.package_name,
            imports,
            simple_to_fqcns,
            &fqcn_names,
            &generic_arity,
            &visible_type_params,
            &format!(
                "catch parameter '{}.{}({})'",
                class.name, method.name, catch_clause.name
            ),
        )?;
        let catch_ty = canonicalize_type_name_in_scope(
            catch_clause.ty.as_str(),
            &class_info.package_name,
            imports,
            simple_to_fqcns,
            &fqcn_names,
            &generic_arity,
            &visible_type_params,
        )?;
        validate_assignable(
            "com.pulse.lang.Throwable",
            &catch_ty,
            None,
            &format!("catch parameter in '{}.{}'", class.name, method.name),
            class_names,
            class_index,
        )?;

        let mut catch_locals = locals.clone();
        if catch_locals.contains_key(&catch_clause.name) {
            return Err(semantic_error(format!(
                "Duplicate local variable '{}' in method '{}.{}'",
                catch_clause.name, class.name, method.name
            )));
        }
        catch_locals.insert(catch_clause.name.clone(), catch_ty);

        let mut catch_null_state = null_state.clone();
        catch_null_state.insert(catch_clause.name.clone(), NullState::NonNull);

        let mut this_catch_returns = false;
        for nested in &catch_clause.body {
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
                &mut catch_locals,
                &mut catch_null_state,
                expected_return,
                in_static_context,
                breakable_depth,
                loop_depth,
                protected_try_depth + 1,
                true,
            )? {
                this_catch_returns = true;
            }
        }
        catch_returns &= this_catch_returns;
        branch_states.push(catch_null_state);
    }

    let mut finally_returns = false;
    if let Some(finally_stmts) = finally_block {
        let mut finally_locals = locals.clone();
        let merged_before_finally =
            merge_null_states(null_state, &branch_states.iter().collect::<Vec<_>>());
        let mut finally_null_state = merged_before_finally;
        for nested in finally_stmts {
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
                &mut finally_locals,
                &mut finally_null_state,
                expected_return,
                in_static_context,
                breakable_depth,
                loop_depth,
                protected_try_depth + 1,
                true,
            )? {
                finally_returns = true;
            }
        }
        *null_state = finally_null_state;
    } else {
        let branch_refs = branch_states.iter().collect::<Vec<_>>();
        *null_state = merge_null_states(null_state, &branch_refs);
    }

    Ok(finally_returns || (try_returns && catch_returns))
}

