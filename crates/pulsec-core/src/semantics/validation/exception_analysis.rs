use super::*;
use crate::ArrayInitExpr;

fn current_class_self_type(class: &ClassDecl, class_info: &ClassInfo) -> String {
    let fqcn = format!("{}.{}", class_info.package_name, class.name);
    if class_info.type_params.is_empty() {
        fqcn
    } else {
        format!("{}<{}>", fqcn, class_info.type_params.join(", "))
    }
}

fn instantiate_constructor_signature(
    signature: &ConstructorSignature,
    owner_info: &ClassInfo,
    owner_ty: &str,
) -> ConstructorSignature {
    let bindings = build_type_param_bindings(&owner_info.type_params, &generic_type_args(owner_ty));
    ConstructorSignature {
        param_types: signature
            .param_types
            .iter()
            .map(|ty| instantiate_type_params_with_defaults(ty, &bindings, &owner_info.type_params))
            .collect(),
        declared_throws: signature
            .declared_throws
            .iter()
            .map(|ty| instantiate_type_params_with_defaults(ty, &bindings, &owner_info.type_params))
            .collect(),
        is_varargs: signature.is_varargs,
    }
}

pub(super) fn validate_method_exception_contract(
    method: &MethodDecl,
    class: &ClassDecl,
    class_info: &ClassInfo,
    class_names: &HashSet<String>,
    simple_to_fqcns: &HashMap<String, Vec<String>>,
    class_index: &HashMap<String, ClassInfo>,
    fqcn_to_class: &HashMap<String, String>,
    imports: &[ImportDecl],
) -> Result<(), SemanticError> {
    let declared_throws = canonicalize_declared_throws(
        method,
        class,
        class_info,
        simple_to_fqcns,
        class_index,
        imports,
    )?;
    let mut initial_locals = HashMap::new();
    for param in &method.params {
        initial_locals.insert(param.name.clone(), param.ty.clone());
    }
    let escaping = collect_block_checked_exceptions(
        &method.body,
        method,
        class,
        class_info,
        class_names,
        class_index,
        fqcn_to_class,
        imports,
        &initial_locals,
        method.modifiers.contains(&Modifier::Static),
    )?;

    for thrown in escaping {
        if declared_throws
            .iter()
            .any(|declared| is_assignable_class(&thrown, declared, class_index))
        {
            continue;
        }
        return Err(semantic_error(format!(
            "Checked exception '{}' must be caught or declared in '{}.{}'",
            class_simple_name(&thrown),
            class.name,
            method.name
        )));
    }

    Ok(())
}

pub(super) fn validate_declared_throws_clause(
    method: &MethodDecl,
    class: &ClassDecl,
    class_info: &ClassInfo,
    simple_to_fqcns: &HashMap<String, Vec<String>>,
    class_index: &HashMap<String, ClassInfo>,
    imports: &[ImportDecl],
) -> Result<(), SemanticError> {
    let _ = canonicalize_declared_throws(
        method,
        class,
        class_info,
        simple_to_fqcns,
        class_index,
        imports,
    )?;
    Ok(())
}

fn canonicalize_declared_throws(
    method: &MethodDecl,
    class: &ClassDecl,
    class_info: &ClassInfo,
    simple_to_fqcns: &HashMap<String, Vec<String>>,
    class_index: &HashMap<String, ClassInfo>,
    imports: &[ImportDecl],
) -> Result<Vec<String>, SemanticError> {
    let fqcn_names = collect_fqcn_names(class_index);
    let generic_arity = collect_generic_arity(class_index);
    let visible_type_params = visible_type_params(class, Some(method));
    let mut declared = Vec::new();

    for throw_ty in &method.throws {
        validate_type_exists_in_scope(
            throw_ty,
            &class_info.package_name,
            imports,
            simple_to_fqcns,
            &fqcn_names,
            &generic_arity,
            &visible_type_params,
            &format!("throws clause for '{}.{}'", class.name, method.name),
        )?;
        let canonical = canonicalize_type_name_in_scope(
            throw_ty,
            &class_info.package_name,
            imports,
            simple_to_fqcns,
            &fqcn_names,
            &generic_arity,
            &visible_type_params,
        )?;
        if !is_throwable_type(&canonical, class_index) {
            return Err(semantic_error(format!(
                "Throws clause for '{}.{}' must use Throwable types, got '{}'",
                class.name, method.name, canonical
            )));
        }
        if !declared.contains(&canonical) {
            declared.push(canonical);
        }
    }

    Ok(declared)
}

#[allow(clippy::too_many_arguments)]
fn collect_block_checked_exceptions(
    stmts: &[Stmt],
    method: &MethodDecl,
    class: &ClassDecl,
    class_info: &ClassInfo,
    class_names: &HashSet<String>,
    class_index: &HashMap<String, ClassInfo>,
    fqcn_to_class: &HashMap<String, String>,
    imports: &[ImportDecl],
    locals: &HashMap<String, String>,
    in_static_context: bool,
) -> Result<Vec<String>, SemanticError> {
    let mut escaping = Vec::new();
    let mut scoped_locals = locals.clone();
    for stmt in stmts {
        let stmt_ex = collect_stmt_checked_exceptions(
            stmt,
            method,
            class,
            class_info,
            class_names,
            class_index,
            fqcn_to_class,
            imports,
            &mut scoped_locals,
            in_static_context,
        )?;
        merge_exception_set(&mut escaping, stmt_ex);
    }
    Ok(escaping)
}

#[allow(clippy::too_many_arguments)]
fn collect_stmt_checked_exceptions(
    stmt: &Stmt,
    method: &MethodDecl,
    class: &ClassDecl,
    class_info: &ClassInfo,
    class_names: &HashSet<String>,
    class_index: &HashMap<String, ClassInfo>,
    fqcn_to_class: &HashMap<String, String>,
    imports: &[ImportDecl],
    locals: &mut HashMap<String, String>,
    in_static_context: bool,
) -> Result<Vec<String>, SemanticError> {
    match stmt {
        Stmt::VarDecl { ty, name, init, .. } => {
            let mut escaping = Vec::new();
            if let Some(expr) = init {
                merge_exception_set(
                    &mut escaping,
                    collect_expr_checked_exceptions(
                        expr,
                        class,
                        class_info,
                        class_names,
                        class_index,
                        fqcn_to_class,
                        imports,
                        locals,
                        in_static_context,
                    )?,
                );
                let inferred_ty = if ty == "var" {
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
                    )?
                    .ty
                } else {
                    ty.clone()
                };
                locals.insert(name.clone(), inferred_ty);
            } else if ty != "var" {
                locals.insert(name.clone(), ty.clone());
            }
            Ok(escaping)
        }
        Stmt::Assign { target, value, .. } | Stmt::CompoundAssign { target, value, .. } => {
            let mut escaping = collect_expr_checked_exceptions(
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
            merge_exception_set(
                &mut escaping,
                collect_expr_checked_exceptions(
                    value,
                    class,
                    class_info,
                    class_names,
                    class_index,
                    fqcn_to_class,
                    imports,
                    locals,
                    in_static_context,
                )?,
            );
            Ok(escaping)
        }
        Stmt::If {
            condition,
            then_branch,
            else_branch,
            ..
        } => {
            let mut escaping = collect_expr_checked_exceptions(
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
            merge_exception_set(
                &mut escaping,
                collect_block_checked_exceptions(
                    then_branch,
                    method,
                    class,
                    class_info,
                    class_names,
                    class_index,
                    fqcn_to_class,
                    imports,
                    locals,
                    in_static_context,
                )?,
            );
            if let Some(else_branch) = else_branch {
                merge_exception_set(
                    &mut escaping,
                    collect_block_checked_exceptions(
                        else_branch,
                        method,
                        class,
                        class_info,
                        class_names,
                        class_index,
                        fqcn_to_class,
                        imports,
                        locals,
                        in_static_context,
                    )?,
                );
            }
            Ok(escaping)
        }
        Stmt::While {
            condition, body, ..
        }
        | Stmt::DoWhile {
            body, condition, ..
        } => {
            let mut escaping = collect_expr_checked_exceptions(
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
            merge_exception_set(
                &mut escaping,
                collect_block_checked_exceptions(
                    body,
                    method,
                    class,
                    class_info,
                    class_names,
                    class_index,
                    fqcn_to_class,
                    imports,
                    locals,
                    in_static_context,
                )?,
            );
            Ok(escaping)
        }
        Stmt::For {
            init,
            condition,
            update,
            body,
            ..
        } => {
            let mut escaping = Vec::new();
            let mut loop_locals = locals.clone();
            if let Some(init) = init {
                merge_exception_set(
                    &mut escaping,
                    collect_stmt_checked_exceptions(
                        init,
                        method,
                        class,
                        class_info,
                        class_names,
                        class_index,
                        fqcn_to_class,
                        imports,
                        &mut loop_locals,
                        in_static_context,
                    )?,
                );
            }
            if let Some(condition) = condition {
                merge_exception_set(
                    &mut escaping,
                    collect_expr_checked_exceptions(
                        condition,
                        class,
                        class_info,
                        class_names,
                        class_index,
                        fqcn_to_class,
                        imports,
                        &loop_locals,
                        in_static_context,
                    )?,
                );
            }
            if let Some(update) = update {
                merge_exception_set(
                    &mut escaping,
                    collect_stmt_checked_exceptions(
                        update,
                        method,
                        class,
                        class_info,
                        class_names,
                        class_index,
                        fqcn_to_class,
                        imports,
                        &mut loop_locals,
                        in_static_context,
                    )?,
                );
            }
            merge_exception_set(
                &mut escaping,
                collect_block_checked_exceptions(
                    body,
                    method,
                    class,
                    class_info,
                    class_names,
                    class_index,
                    fqcn_to_class,
                    imports,
                    &loop_locals,
                    in_static_context,
                )?,
            );
            Ok(escaping)
        }
        Stmt::ForEach {
            ty,
            name,
            iterable,
            body,
            ..
        } => {
            let mut escaping = collect_expr_checked_exceptions(
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
            let mut loop_locals = locals.clone();
            let inferred_ty = if ty == "var" {
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
                )?
                .ty;
                if iterable_ty.ends_with("[]") {
                    iterable_ty.trim_end_matches("[]").to_string()
                } else {
                    "pulse.lang.Object".to_string()
                }
            } else {
                ty.clone()
            };
            loop_locals.insert(name.clone(), inferred_ty);
            merge_exception_set(
                &mut escaping,
                collect_block_checked_exceptions(
                    body,
                    method,
                    class,
                    class_info,
                    class_names,
                    class_index,
                    fqcn_to_class,
                    imports,
                    &loop_locals,
                    in_static_context,
                )?,
            );
            Ok(escaping)
        }
        Stmt::Switch {
            expr,
            cases,
            default,
            ..
        } => {
            let mut escaping = collect_expr_checked_exceptions(
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
            for case in cases {
                merge_exception_set(
                    &mut escaping,
                    collect_expr_checked_exceptions(
                        &case.label,
                        class,
                        class_info,
                        class_names,
                        class_index,
                        fqcn_to_class,
                        imports,
                        locals,
                        in_static_context,
                    )?,
                );
                merge_exception_set(
                    &mut escaping,
                    collect_block_checked_exceptions(
                        &case.body,
                        method,
                        class,
                        class_info,
                        class_names,
                        class_index,
                        fqcn_to_class,
                        imports,
                        locals,
                        in_static_context,
                    )?,
                );
            }
            if let Some(default) = default {
                merge_exception_set(
                    &mut escaping,
                    collect_block_checked_exceptions(
                        default,
                        method,
                        class,
                        class_info,
                        class_names,
                        class_index,
                        fqcn_to_class,
                        imports,
                        locals,
                        in_static_context,
                    )?,
                );
            }
            Ok(escaping)
        }
        Stmt::Try {
            resources,
            body,
            catches,
            finally_block,
            source_line,
        } => {
            if !resources.is_empty() {
                return collect_stmt_checked_exceptions(
                    &crate::desugar_try_with_resources(
                        resources,
                        body,
                        catches,
                        finally_block.as_deref(),
                        *source_line,
                    ),
                    method,
                    class,
                    class_info,
                    class_names,
                    class_index,
                    fqcn_to_class,
                    imports,
                    locals,
                    in_static_context,
                );
            }
            let mut escaping = collect_block_checked_exceptions(
                body,
                method,
                class,
                class_info,
                class_names,
                class_index,
                fqcn_to_class,
                imports,
                locals,
                in_static_context,
            )?;
            for catch in catches {
                escaping.retain(|thrown| !is_assignable_class(thrown, &catch.ty, class_index));
            }
            for catch in catches {
                let mut catch_locals = locals.clone();
                catch_locals.insert(catch.name.clone(), catch.ty.clone());
                merge_exception_set(
                    &mut escaping,
                    collect_block_checked_exceptions(
                        &catch.body,
                        method,
                        class,
                        class_info,
                        class_names,
                        class_index,
                        fqcn_to_class,
                        imports,
                        &catch_locals,
                        in_static_context,
                    )?,
                );
            }
            if let Some(finally_block) = finally_block {
                merge_exception_set(
                    &mut escaping,
                    collect_block_checked_exceptions(
                        finally_block,
                        method,
                        class,
                        class_info,
                        class_names,
                        class_index,
                        fqcn_to_class,
                        imports,
                        locals,
                        in_static_context,
                    )?,
                );
            }
            Ok(escaping)
        }
        Stmt::Assert {
            condition, message, ..
        } => {
            let mut escaping = collect_expr_checked_exceptions(
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
            if let Some(message) = message {
                merge_exception_set(
                    &mut escaping,
                    collect_expr_checked_exceptions(
                        message,
                        class,
                        class_info,
                        class_names,
                        class_index,
                        fqcn_to_class,
                        imports,
                        locals,
                        in_static_context,
                    )?,
                );
            }
            Ok(escaping)
        }
        Stmt::Throw(expr, ..) => {
            let mut escaping = collect_expr_checked_exceptions(
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
            )?
            .ty;
            if is_checked_exception_type(&thrown, class_index) {
                push_exception(&mut escaping, thrown);
            }
            Ok(escaping)
        }
        Stmt::ExprStmt(expr, ..) => collect_expr_checked_exceptions(
            expr,
            class,
            class_info,
            class_names,
            class_index,
            fqcn_to_class,
            imports,
            locals,
            in_static_context,
        ),
        Stmt::Return(value, ..) => {
            if let Some(value) = value {
                collect_expr_checked_exceptions(
                    value,
                    class,
                    class_info,
                    class_names,
                    class_index,
                    fqcn_to_class,
                    imports,
                    locals,
                    in_static_context,
                )
            } else {
                Ok(Vec::new())
            }
        }
        Stmt::Break { .. } | Stmt::Continue { .. } => Ok(Vec::new()),
    }
}

#[allow(clippy::too_many_arguments)]
fn collect_expr_checked_exceptions(
    expr: &Expr,
    class: &ClassDecl,
    class_info: &ClassInfo,
    class_names: &HashSet<String>,
    class_index: &HashMap<String, ClassInfo>,
    fqcn_to_class: &HashMap<String, String>,
    imports: &[ImportDecl],
    locals: &HashMap<String, String>,
    in_static_context: bool,
) -> Result<Vec<String>, SemanticError> {
    match expr {
        Expr::IntLiteral(_)
        | Expr::LongLiteral(_)
        | Expr::FloatLiteral(_)
        | Expr::DoubleLiteral(_)
        | Expr::CharLiteral(_)
        | Expr::StringLiteral(_)
        | Expr::BoolLiteral(_)
        | Expr::NullLiteral
        | Expr::This
        | Expr::Super
        | Expr::Var(_) => Ok(Vec::new()),
        Expr::MemberAccess { object, .. }
        | Expr::Unary { expr: object, .. }
        | Expr::Cast { expr: object, .. }
        | Expr::InstanceOf { expr: object, .. }
        | Expr::IncDec { target: object, .. } => collect_expr_checked_exceptions(
            object,
            class,
            class_info,
            class_names,
            class_index,
            fqcn_to_class,
            imports,
            locals,
            in_static_context,
        ),
        Expr::ArrayAccess { array, index } => {
            let mut escaping = collect_expr_checked_exceptions(
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
            merge_exception_set(
                &mut escaping,
                collect_expr_checked_exceptions(
                    index,
                    class,
                    class_info,
                    class_names,
                    class_index,
                    fqcn_to_class,
                    imports,
                    locals,
                    in_static_context,
                )?,
            );
            Ok(escaping)
        }
        Expr::Call { callee, args } => {
            let mut escaping = collect_expr_checked_exceptions(
                callee,
                class,
                class_info,
                class_names,
                class_index,
                fqcn_to_class,
                imports,
                locals,
                in_static_context,
            )?;
            for arg in args {
                merge_exception_set(
                    &mut escaping,
                    collect_expr_checked_exceptions(
                        arg,
                        class,
                        class_info,
                        class_names,
                        class_index,
                        fqcn_to_class,
                        imports,
                        locals,
                        in_static_context,
                    )?,
                );
            }
            for thrown in resolve_call_declared_throws(
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
            )? {
                push_exception(&mut escaping, thrown);
            }
            Ok(escaping)
        }
        Expr::Binary { left, right, .. } => {
            let mut escaping = collect_expr_checked_exceptions(
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
            merge_exception_set(
                &mut escaping,
                collect_expr_checked_exceptions(
                    right,
                    class,
                    class_info,
                    class_names,
                    class_index,
                    fqcn_to_class,
                    imports,
                    locals,
                    in_static_context,
                )?,
            );
            Ok(escaping)
        }
        Expr::Conditional {
            condition,
            then_expr,
            else_expr,
        } => {
            let mut escaping = collect_expr_checked_exceptions(
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
            merge_exception_set(
                &mut escaping,
                collect_expr_checked_exceptions(
                    then_expr,
                    class,
                    class_info,
                    class_names,
                    class_index,
                    fqcn_to_class,
                    imports,
                    locals,
                    in_static_context,
                )?,
            );
            merge_exception_set(
                &mut escaping,
                collect_expr_checked_exceptions(
                    else_expr,
                    class,
                    class_info,
                    class_names,
                    class_index,
                    fqcn_to_class,
                    imports,
                    locals,
                    in_static_context,
                )?,
            );
            Ok(escaping)
        }
        Expr::SwitchExpr {
            expr,
            cases,
            default,
        } => {
            let mut escaping = collect_expr_checked_exceptions(
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
            for case in cases {
                merge_exception_set(
                    &mut escaping,
                    collect_expr_checked_exceptions(
                        &case.label,
                        class,
                        class_info,
                        class_names,
                        class_index,
                        fqcn_to_class,
                        imports,
                        locals,
                        in_static_context,
                    )?,
                );
                merge_exception_set(
                    &mut escaping,
                    collect_expr_checked_exceptions(
                        &case.value,
                        class,
                        class_info,
                        class_names,
                        class_index,
                        fqcn_to_class,
                        imports,
                        locals,
                        in_static_context,
                    )?,
                );
            }
            merge_exception_set(
                &mut escaping,
                collect_expr_checked_exceptions(
                    default,
                    class,
                    class_info,
                    class_names,
                    class_index,
                    fqcn_to_class,
                    imports,
                    locals,
                    in_static_context,
                )?,
            );
            Ok(escaping)
        }
        Expr::NewObject { class_name, args } => {
            let mut escaping = Vec::new();
            for arg in args {
                merge_exception_set(
                    &mut escaping,
                    collect_expr_checked_exceptions(
                        arg,
                        class,
                        class_info,
                        class_names,
                        class_index,
                        fqcn_to_class,
                        imports,
                        locals,
                        in_static_context,
                    )?,
                );
            }
            for thrown in resolve_constructor_declared_throws(
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
            )? {
                push_exception(&mut escaping, thrown);
            }
            Ok(escaping)
        }
        Expr::NewArray { lengths, .. } => {
            let mut escaping = Vec::new();
            for length in lengths {
                merge_exception_set(
                    &mut escaping,
                    collect_expr_checked_exceptions(
                        length,
                        class,
                        class_info,
                        class_names,
                        class_index,
                        fqcn_to_class,
                        imports,
                        locals,
                        in_static_context,
                    )?,
                );
            }
            Ok(escaping)
        }
        Expr::NewArrayInitialized { values, .. } => {
            let mut escaping = Vec::new();
            collect_array_init_checked_exceptions(
                values,
                class,
                class_info,
                class_names,
                class_index,
                fqcn_to_class,
                imports,
                locals,
                in_static_context,
                &mut escaping,
            )?;
            Ok(escaping)
        }
    }
}

#[allow(clippy::too_many_arguments)]
fn collect_array_init_checked_exceptions(
    values: &[ArrayInitExpr],
    class: &ClassDecl,
    class_info: &ClassInfo,
    class_names: &HashSet<String>,
    class_index: &HashMap<String, ClassInfo>,
    fqcn_to_class: &HashMap<String, String>,
    imports: &[ImportDecl],
    locals: &HashMap<String, String>,
    in_static_context: bool,
    out: &mut Vec<String>,
) -> Result<(), SemanticError> {
    for value in values {
        match value {
            ArrayInitExpr::Expr(expr) => merge_exception_set(
                out,
                collect_expr_checked_exceptions(
                    expr,
                    class,
                    class_info,
                    class_names,
                    class_index,
                    fqcn_to_class,
                    imports,
                    locals,
                    in_static_context,
                )?,
            ),
            ArrayInitExpr::Nested(nested) => collect_array_init_checked_exceptions(
                nested,
                class,
                class_info,
                class_names,
                class_index,
                fqcn_to_class,
                imports,
                locals,
                in_static_context,
                out,
            )?,
        }
    }
    Ok(())
}

#[allow(clippy::too_many_arguments)]
fn resolve_call_declared_throws(
    callee: &Expr,
    args: &[Expr],
    class: &ClassDecl,
    class_info: &ClassInfo,
    class_names: &HashSet<String>,
    class_index: &HashMap<String, ClassInfo>,
    fqcn_to_class: &HashMap<String, String>,
    imports: &[ImportDecl],
    locals: &HashMap<String, String>,
    in_static_context: bool,
) -> Result<Vec<String>, SemanticError> {
    let arg_types = infer_arg_types(
        args,
        class,
        class_info,
        class_names,
        class_index,
        fqcn_to_class,
        imports,
        locals,
        in_static_context,
    )?;
    let current_class_fqcn = format!("{}.{}", class_info.package_name, class.name);

    let signature = match callee {
        Expr::This => {
            let instantiated_ctors = class_info
                .constructors
                .iter()
                .map(|ctor| {
                    instantiate_constructor_signature(
                        ctor,
                        class_info,
                        &current_class_self_type(class, class_info),
                    )
                })
                .collect::<Vec<_>>();
            select_best_constructor_overload(&arg_types, &instantiated_ctors, class_index)?
                .map(|ctor| MethodSignature {
                    type_params: Vec::new(),
                    param_types: ctor.param_types.clone(),
                    return_type: "void".to_string(),
                    declared_throws: ctor.declared_throws.clone(),
                    is_varargs: ctor.is_varargs,
                    is_static: false,
                    is_final: true,
                    is_abstract: false,
                    visibility: MemberVisibility::Public,
                })
        }
        Expr::Super => {
            let Some(super_class) = class_info.super_class.as_deref() else {
                return Ok(Vec::new());
            };
            let Some(target_class) = class_index.get(super_class) else {
                return Ok(Vec::new());
            };
            let instantiated_ctors = target_class
                .constructors
                .iter()
                .map(|ctor| instantiate_constructor_signature(ctor, target_class, super_class))
                .collect::<Vec<_>>();
            select_best_constructor_overload(&arg_types, &instantiated_ctors, class_index)?
                .map(|ctor| MethodSignature {
                    type_params: Vec::new(),
                    param_types: ctor.param_types.clone(),
                    return_type: "void".to_string(),
                    declared_throws: ctor.declared_throws.clone(),
                    is_varargs: ctor.is_varargs,
                    is_static: false,
                    is_final: true,
                    is_abstract: false,
                    visibility: MemberVisibility::Public,
                })
        }
        Expr::Var(name) => {
            if resolve_class_fqcn(name, &class_info.package_name, imports, class_index)?.is_some() {
                return Ok(Vec::new());
            }
            if let Some(candidates) =
                lookup_method_candidates(&current_class_fqcn, name, class_index)
            {
                let instantiated_candidates = candidates
                    .iter()
                    .map(|candidate| {
                        instantiate_resolved_method_candidate(
                            candidate,
                            class_index,
                            &current_class_fqcn,
                            &arg_types,
                        )
                    })
                    .collect::<Result<Vec<_>, _>>()?;
                select_best_resolved_method_candidate(
                    name,
                    &arg_types,
                    &instantiated_candidates,
                    class_index,
                )?
                .map(|candidate| candidate.signature.clone())
            } else {
                resolve_imported_static_method(
                    name,
                    &arg_types,
                    &class.name,
                    &current_class_fqcn,
                    &class_info.package_name,
                    class_index,
                    fqcn_to_class,
                    imports,
                )?
            }
        }
        Expr::MemberAccess { object, member } => {
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
            let owner_ty = erase_generic_type_name(&receiver.ty);
            let owner = if class_names.contains(&receiver.ty) {
                receiver.ty.clone()
            } else if class_names.contains(&owner_ty) {
                owner_ty
            } else {
                owner_class(&receiver, class_names)?
            };
            let candidates =
                lookup_method_candidates(&owner, member, class_index).ok_or_else(|| {
                    semantic_error(format!(
                        "No method '{}.{}' matches argument types ({})",
                        class_simple_name(&owner),
                        member,
                        arg_types.join(",")
                    ))
                })?;
            let instantiated_candidates = candidates
                .iter()
                .map(|candidate| {
                    instantiate_resolved_method_candidate(
                        candidate,
                        class_index,
                        &receiver.ty,
                        &arg_types,
                    )
                })
                .collect::<Result<Vec<_>, _>>()?;
            select_best_resolved_method_candidate(
                member,
                &arg_types,
                &instantiated_candidates,
                class_index,
            )?
            .map(|candidate| candidate.signature.clone())
        }
        _ => None,
    };

    Ok(signature
        .map(|sig| {
            sig.declared_throws
                .into_iter()
                .filter(|ty| is_checked_exception_type(ty, class_index))
                .collect()
        })
        .unwrap_or_default())
}

#[allow(clippy::too_many_arguments)]
fn resolve_constructor_declared_throws(
    class_name: &str,
    args: &[Expr],
    class: &ClassDecl,
    class_info: &ClassInfo,
    class_names: &HashSet<String>,
    class_index: &HashMap<String, ClassInfo>,
    fqcn_to_class: &HashMap<String, String>,
    imports: &[ImportDecl],
    locals: &HashMap<String, String>,
    in_static_context: bool,
) -> Result<Vec<String>, SemanticError> {
    let arg_types = infer_arg_types(
        args,
        class,
        class_info,
        class_names,
        class_index,
        fqcn_to_class,
        imports,
        locals,
        in_static_context,
    )?;
    let generic_arity = collect_generic_arity(class_index);
    let available_type_params = HashSet::new();
    let simple_to_fqcns = collect_simple_to_fqcns(class_index);
    let canonical_class_ty = canonicalize_type_name_in_scope(
        class_name,
        &class_info.package_name,
        imports,
        &simple_to_fqcns,
        &collect_fqcn_names(class_index),
        &generic_arity,
        &available_type_params,
    )?;
    let class_fqcn = erase_generic_type_name(&canonical_class_ty);
    let target_class = class_index.get(&class_fqcn).ok_or_else(|| {
        semantic_error(format!(
            "Unknown class '{}' in constructor call",
            class_name
        ))
    })?;

    if target_class.constructors.is_empty() && arg_types.is_empty() {
        return Ok(Vec::new());
    }

    let constructor =
        select_best_constructor_overload(&arg_types, &target_class.constructors, class_index)?
            .cloned();
    Ok(constructor
        .map(|ctor| {
            ctor.declared_throws
                .into_iter()
                .filter(|ty| is_checked_exception_type(ty, class_index))
                .collect()
        })
        .unwrap_or_default())
}

#[allow(clippy::too_many_arguments)]
fn infer_arg_types(
    args: &[Expr],
    class: &ClassDecl,
    class_info: &ClassInfo,
    class_names: &HashSet<String>,
    class_index: &HashMap<String, ClassInfo>,
    fqcn_to_class: &HashMap<String, String>,
    imports: &[ImportDecl],
    locals: &HashMap<String, String>,
    in_static_context: bool,
) -> Result<Vec<String>, SemanticError> {
    let mut arg_types = Vec::with_capacity(args.len());
    for arg in args {
        arg_types.push(
            infer_expr_type(
                arg,
                class,
                class_info,
                class_names,
                class_index,
                fqcn_to_class,
                imports,
                locals,
                in_static_context,
            )?
            .ty,
        );
    }
    Ok(arg_types)
}

fn merge_exception_set(out: &mut Vec<String>, items: Vec<String>) {
    for item in items {
        push_exception(out, item);
    }
}

fn push_exception(out: &mut Vec<String>, item: String) {
    if !out.contains(&item) {
        out.push(item);
    }
}
