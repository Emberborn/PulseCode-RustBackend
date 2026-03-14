use super::*;

fn current_class_self_type(class: &ClassDecl, class_info: &ClassInfo) -> String {
    let fqcn = format!("{}.{}", class_info.package_name, class.name);
    if class_info.type_params.is_empty() {
        fqcn
    } else {
        format!("{}<{}>", fqcn, class_info.type_params.join(", "))
    }
}

fn instantiated_class_bindings(
    owner_ty: &str,
    owner_info: &ClassInfo,
) -> HashMap<String, String> {
    build_type_param_bindings(&owner_info.type_params, &generic_type_args(owner_ty))
}

fn substitute_field_type(field: &FieldInfo, owner_info: &ClassInfo, owner_ty: &str) -> String {
    instantiate_type_params_with_defaults(&field.ty, &instantiated_class_bindings(owner_ty, owner_info), &owner_info.type_params)
}

fn instantiate_constructor_signature(
    signature: &ConstructorSignature,
    owner_info: &ClassInfo,
    owner_ty: &str,
) -> ConstructorSignature {
    let bindings = instantiated_class_bindings(owner_ty, owner_info);
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

fn instantiate_method_signature(
    signature: &MethodSignature,
    owner_info: &ClassInfo,
    owner_ty: &str,
    arg_types: &[String],
) -> MethodSignature {
    let mut bindings = instantiated_class_bindings(owner_ty, owner_info);
    let substituted_param_types = signature
        .param_types
        .iter()
        .map(|ty| instantiate_type_params_with_defaults(ty, &bindings, &owner_info.type_params))
        .collect::<Vec<_>>();

    for (expected, actual) in substituted_param_types.iter().zip(arg_types.iter()) {
        collect_type_param_bindings(expected, actual, &signature.type_params, &mut bindings);
    }
    bind_missing_type_params(&mut bindings, &signature.type_params);

    MethodSignature {
        type_params: signature.type_params.clone(),
        param_types: signature
            .param_types
            .iter()
            .map(|ty| {
                instantiate_type_params_with_defaults(
                    ty,
                    &bindings,
                    &owner_info.type_params,
                )
            })
            .collect(),
        return_type: instantiate_type_params_with_defaults(
            &signature.return_type,
            &bindings,
            &owner_info.type_params,
        ),
        declared_throws: signature
            .declared_throws
            .iter()
            .map(|ty| {
                instantiate_type_params_with_defaults(
                    ty,
                    &bindings,
                    &owner_info.type_params,
                )
            })
            .collect(),
        is_varargs: signature.is_varargs,
        is_static: signature.is_static,
        is_final: signature.is_final,
        is_abstract: signature.is_abstract,
        visibility: signature.visibility,
    }
}

fn receiver_allows_cross_package_protected_access(
    receiver: &ExprType,
    current_class_fqcn: &str,
    class_index: &HashMap<String, ClassInfo>,
) -> bool {
    if receiver.kind == ExprKind::ClassRef {
        return true;
    }

    let receiver_owner = erase_generic_type_name(&receiver.ty);
    is_assignable_class(&receiver_owner, current_class_fqcn, class_index)
}

pub(super) fn infer_new_object_type(
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
    null_state: Option<&HashMap<String, NullState>>,
) -> Result<ExprType, SemanticError> {
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

    let generic_arity = collect_generic_arity(class_index);
    let available_type_params = HashSet::new();
    let canonical_class_ty = canonicalize_type_name_in_scope(
        class_name,
        &class_info.package_name,
        imports,
        &HashMap::new(),
        &collect_fqcn_names(class_index),
        &generic_arity,
        &available_type_params,
    )?;
    let class_fqcn = erase_generic_type_name(&canonical_class_ty);
    let target_class = class_index.get(&class_fqcn).ok_or_else(|| {
        semantic_error(format!("Unknown class '{}' in constructor call", class_name))
    })?;
    if target_class.is_abstract {
        return Err(semantic_error(format!(
            "Cannot instantiate abstract class '{}'",
            target_class.simple_name
        )));
    }

    if target_class.constructors.is_empty() && arg_types.is_empty() {
        return Ok(value_type(&canonical_class_ty));
    }

    let instantiated_ctors = target_class
        .constructors
        .iter()
        .map(|ctor| instantiate_constructor_signature(ctor, target_class, &canonical_class_ty))
        .collect::<Vec<_>>();

    if let Some(constructor) =
        select_best_constructor_overload(&arg_types, &instantiated_ctors, class_index)?
    {
        if let Some(state) = null_state {
            validate_unboxing_nullability_for_call_args(
                &constructor.param_types,
                constructor.is_varargs,
                args,
                &arg_types,
                state,
                &format!("constructor call '{}'", target_class.simple_name),
            )?;
        }
        return Ok(value_type(&canonical_class_ty));
    }

    Err(semantic_error(format!(
        "No constructor '{}' matches argument types ({}). Available constructors: {}",
        target_class.simple_name,
        arg_types.join(","),
        format_constructor_signatures(&instantiated_ctors)
    )))
}

pub(super) fn infer_call_type(
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
    null_state: Option<&HashMap<String, NullState>>,
) -> Result<ExprType, SemanticError> {
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

    let current_class_fqcn = format!("{}.{}", class_info.package_name, class.name);

    match callee {
        Expr::Var(name) => {
            if let Some(class_fqcn) =
                resolve_class_fqcn(name, &class_info.package_name, imports, class_index)?
            {
                return Err(semantic_error(format!(
                    "Constructor calls must use Java-like 'new {}(...)' syntax",
                    class_simple_name(&class_fqcn)
                )));
            }

            if let Some((_, candidates)) = lookup_method_candidates(&current_class_fqcn, name, class_index) {
                let instantiated_candidates = candidates
                    .iter()
                    .map(|candidate| {
                        instantiate_method_signature(
                            candidate,
                            class_info,
                            &current_class_self_type(class, class_info),
                            &arg_types,
                        )
                    })
                    .collect::<Vec<_>>();
                let signature = select_best_method_overload(name, &arg_types, &instantiated_candidates, class_index)?
                    .ok_or_else(|| {
                        semantic_error(format!(
                            "No method '{}' matches argument types ({}) in class '{}'. Available overloads: {}",
                            name,
                            arg_types.join(","),
                            class.name,
                            format_method_overloads(name, &instantiated_candidates)
                        ))
                    })?;

                if in_static_context && !signature.is_static {
                    return Err(semantic_error(format!(
                        "Cannot call instance method '{}.{}' from static context",
                        class.name, name
                    )));
                }
                if let Some(state) = null_state {
                    validate_unboxing_nullability_for_call_args(
                        &signature.param_types,
                        signature.is_varargs,
                        args,
                        &arg_types,
                        state,
                        &format!("call '{}.{}'", class.name, name),
                    )?;
                }

                return Ok(value_type(&signature.return_type));
            }

            if let Some(signature) = resolve_imported_static_method(
                name,
                &arg_types,
                &class.name,
                &current_class_fqcn,
                &class_info.package_name,
                class_index,
                fqcn_to_class,
                imports,
            )? {
                if let Some(state) = null_state {
                    validate_unboxing_nullability_for_call_args(
                        &signature.param_types,
                        signature.is_varargs,
                        args,
                        &arg_types,
                        state,
                        &format!("static import call '{}'", name),
                    )?;
                }
                return Ok(value_type(&signature.return_type));
            }

            Err(semantic_error(format!(
                "No method '{}' matches argument types ({}) in class '{}'",
                name,
                arg_types.join(","),
                class.name
            )))
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

            resolve_method_call(
                member,
                &arg_types,
                args,
                &receiver,
                class_names,
                class_index,
                &format!("{}.{}", class_info.package_name, class.name),
                null_state,
            )
        }
        _ => Err(semantic_error(
            "Unsupported call target expression".to_string(),
        )),
    }
}


pub(super) fn resolve_field_access(
    member: &str,
    receiver: &ExprType,
    class_names: &HashSet<String>,
    class_index: &HashMap<String, ClassInfo>,
    current_class_fqcn: &str,
) -> Result<ExprType, SemanticError> {
    if receiver.ty.ends_with("[]") {
        return if receiver.kind == ExprKind::ClassRef {
            Err(semantic_error(format!(
                "Cannot access array member '{}' through class reference",
                member
            )))
        } else if member == "length" {
            Ok(value_type("int"))
        } else {
            Err(semantic_error(format!(
                "Unknown array member '{}'",
                member
            )))
        };
    }

    let owner = owner_class(receiver, class_names)?;
    let class_info = class_index
        .get(owner.as_str())
        .ok_or_else(|| semantic_error(format!("Unknown class '{}'", owner)))?;
    let current_info = class_index
        .get(current_class_fqcn)
        .or_else(|| class_index.get(class_simple_name(current_class_fqcn)))
        .ok_or_else(|| semantic_error(format!("Unknown class '{}'", current_class_fqcn)))?;
    let owner_display = class_info.simple_name.as_str();
    let current_display = current_info.simple_name.as_str();

    if receiver.kind == ExprKind::ClassRef
        && class_info.is_enum
        && class_info.enum_constants.iter().any(|constant| constant == member)
    {
        return Ok(value_type(&owner));
    }

    if class_info.is_enum && class_info.enum_constants.iter().any(|constant| constant == member) {
        return Err(semantic_error(format!(
            "Cannot assign to enum constant '{}.{}'",
            class_info.simple_name, member
        )));
    }

    if let Some((field_owner, field)) = lookup_field_in_hierarchy(owner.as_str(), member, class_index) {
        let field_owner_info = class_index
            .get(field_owner.as_str())
            .ok_or_else(|| semantic_error(format!("Unknown class '{}'", field_owner)))?;
        let field_owner_display = field_owner_info.simple_name.as_str();
        if !is_member_accessible(
            field.visibility,
            &field_owner,
            &field_owner_info.package_name,
            current_class_fqcn,
            &current_info.package_name,
            class_index,
        ) {
            return Err(semantic_error(format!(
                "Cannot access {} field '{}.{}' from class '{}'",
                visibility_name(field.visibility),
                field_owner_display,
                member,
                current_display
            )));
        }
        if field.visibility == MemberVisibility::Protected
            && field_owner_info.package_name != current_info.package_name
            && !receiver_allows_cross_package_protected_access(receiver, current_class_fqcn, class_index)
        {
            return Err(semantic_error(format!(
                "Cannot access protected field '{}.{}' through receiver type '{}' from class '{}'",
                field_owner_display,
                member,
                class_simple_name(&receiver.ty),
                current_display
            )));
        }

        return match receiver.kind {
            ExprKind::ClassRef => {
                if !field.is_static {
                    Err(semantic_error(format!(
                        "Cannot access instance field '{}.{}' through class reference",
                        field_owner_display, member
                    )))
                } else {
                    Ok(value_type(
                        &substitute_field_type(&field, field_owner_info, receiver.ty.as_str()),
                    ))
                }
            }
            ExprKind::Value => {
                if field.is_static {
                    Err(semantic_error(format!(
                        "Cannot access static field '{}.{}' through instance reference",
                        field_owner_display, member
                    )))
                } else {
                    Ok(value_type(
                        &substitute_field_type(&field, field_owner_info, receiver.ty.as_str()),
                    ))
                }
            }
        };
    }

    if lookup_method_candidates(owner.as_str(), member, class_index).is_some() {
        return Err(semantic_error(format!(
            "Method '{}.{}' requires call syntax",
            owner_display, member
        )));
    }

    Err(semantic_error(format!(
        "Unknown member '{}.{}'",
        owner_display, member
    )))
}

pub(super) fn resolve_method_call(
    method: &str,
    arg_types: &[String],
    args: &[Expr],
    receiver: &ExprType,
    class_names: &HashSet<String>,
    class_index: &HashMap<String, ClassInfo>,
    current_class_fqcn: &str,
    null_state: Option<&HashMap<String, NullState>>,
) -> Result<ExprType, SemanticError> {
    let owner = owner_class(receiver, class_names)?;
    let class_info = class_index
        .get(owner.as_str())
        .ok_or_else(|| semantic_error(format!("Unknown class '{}'", owner)))?;
    let current_info = class_index
        .get(current_class_fqcn)
        .or_else(|| class_index.get(class_simple_name(current_class_fqcn)))
        .ok_or_else(|| semantic_error(format!("Unknown class '{}'", current_class_fqcn)))?;
    let owner_display = class_info.simple_name.as_str();
    let current_display = current_info.simple_name.as_str();

    let (method_owner, candidates) = lookup_method_candidates(owner.as_str(), method, class_index).ok_or_else(|| {
        semantic_error(format!(
            "No method '{}.{}' matches argument types ({})",
            owner_display,
            method,
            arg_types.join(",")
        ))
    })?;
    let method_owner_info = class_index
        .get(method_owner.as_str())
        .ok_or_else(|| semantic_error(format!("Unknown class '{}'", method_owner)))?;
    let method_owner_display = method_owner_info.simple_name.as_str();

    let instantiated_candidates = candidates
        .iter()
        .map(|candidate| instantiate_method_signature(candidate, method_owner_info, &receiver.ty, arg_types))
        .collect::<Vec<_>>();

    let signature = select_best_method_overload(method, arg_types, &instantiated_candidates, class_index)?
        .ok_or_else(|| {
            semantic_error(format!(
                "No method '{}.{}' matches argument types ({}). Available overloads: {}",
                method_owner_display,
                method,
                arg_types.join(","),
                format_method_overloads(method, &instantiated_candidates)
            ))
        })?;

    if !is_member_accessible(
        signature.visibility,
        &method_owner,
        &method_owner_info.package_name,
        current_class_fqcn,
        &current_info.package_name,
        class_index,
    ) {
        return Err(semantic_error(format!(
            "Cannot access {} method '{}.{}' from class '{}'",
            visibility_name(signature.visibility),
            method_owner_display,
            method,
            current_display
        )));
    }
    if signature.visibility == MemberVisibility::Protected
        && method_owner_info.package_name != current_info.package_name
        && !receiver_allows_cross_package_protected_access(receiver, current_class_fqcn, class_index)
    {
        return Err(semantic_error(format!(
            "Cannot access protected method '{}.{}' through receiver type '{}' from class '{}'",
            method_owner_display,
            method,
            class_simple_name(&receiver.ty),
            current_display
        )));
    }

    match receiver.kind {
        ExprKind::ClassRef if !signature.is_static => Err(semantic_error(format!(
            "Cannot call instance method '{}.{}' through class reference",
            method_owner_display, method
        ))),
        ExprKind::Value if signature.is_static => Err(semantic_error(format!(
            "Cannot call static method '{}.{}' through instance reference",
            method_owner_display, method
        ))),
        _ => {
            if let Some(state) = null_state {
                validate_unboxing_nullability_for_call_args(
                    &signature.param_types,
                    signature.is_varargs,
                    args,
                    arg_types,
                    state,
                    &format!("call '{}.{}'", method_owner_display, method),
                )?;
            }
            Ok(value_type(&signature.return_type))
        }
    }
}

pub(super) fn owner_class(
    receiver: &ExprType,
    class_names: &HashSet<String>,
) -> Result<String, SemanticError> {
    if class_names.contains(&receiver.ty) {
        return Ok(receiver.ty.clone());
    }

    let erased = erase_generic_type_name(&receiver.ty);
    if class_names.contains(&erased) {
        return Ok(erased);
    }

    Err(semantic_error(format!("Type '{}' has no members", receiver.ty)))
}

pub(super) fn value_type(ty: &str) -> ExprType {
    ExprType {
        ty: ty.to_string(),
        kind: ExprKind::Value,
    }
}

pub(super) fn class_ref_type(ty: &str) -> ExprType {
    ExprType {
        ty: ty.to_string(),
        kind: ExprKind::ClassRef,
    }
}

pub(super) fn lookup_field_in_hierarchy(
    owner_fqcn: &str,
    field_name: &str,
    class_index: &HashMap<String, ClassInfo>,
) -> Option<(String, FieldInfo)> {
    let mut current = owner_fqcn.to_string();
    loop {
        let info = class_index.get(current.as_str())?;
        if let Some(field) = info.fields.get(field_name) {
            return Some((current, field.clone()));
        }
        if let Some(parent) = info.super_class.as_deref() {
            current = parent.to_string();
        } else {
            return None;
        }
    }
}

pub(super) fn lookup_method_candidates(
    owner_fqcn: &str,
    method_name: &str,
    class_index: &HashMap<String, ClassInfo>,
) -> Option<(String, Vec<MethodSignature>)> {
    let mut current = owner_fqcn.to_string();
    loop {
        let info = class_index.get(current.as_str())?;
        if let Some(methods) = info.methods.get(method_name) {
            return Some((current, methods.clone()));
        }
        if let Some((owner, methods)) =
            lookup_method_candidates_in_interfaces(&info.interfaces, method_name, class_index)
        {
            return Some((owner, methods));
        }
        if let Some(parent) = info.super_class.as_deref() {
            current = parent.to_string();
        } else {
            return None;
        }
    }
}

fn lookup_method_candidates_in_interfaces(
    interfaces: &[String],
    method_name: &str,
    class_index: &HashMap<String, ClassInfo>,
) -> Option<(String, Vec<MethodSignature>)> {
    for iface in interfaces {
        let info = class_index.get(iface.as_str())?;
        if let Some(methods) = info.methods.get(method_name) {
            return Some((iface.clone(), methods.clone()));
        }
        if let Some(found) =
            lookup_method_candidates_in_interfaces(&info.interfaces, method_name, class_index)
        {
            return Some(found);
        }
    }
    None
}

