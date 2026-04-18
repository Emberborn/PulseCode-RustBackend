use super::*;

fn current_class_self_type(class: &ClassDecl, class_info: &ClassInfo) -> String {
    let fqcn = format!("{}.{}", class_info.package_name, class.name);
    if class_info.type_params.is_empty() {
        fqcn
    } else {
        format!("{}<{}>", fqcn, class_info.type_params.join(", "))
    }
}

fn resolved_method_signature_key(signature: &MethodSignature) -> String {
    format!(
        "{}({})#{}",
        if signature.is_static {
            "static"
        } else {
            "instance"
        },
        signature.param_types.join(","),
        signature.return_type
    )
}

pub(super) fn instantiate_resolved_method_candidate(
    candidate: &ResolvedMethodCandidate,
    class_index: &HashMap<String, ClassInfo>,
    owner_ty: &str,
    arg_types: &[String],
) -> Result<ResolvedMethodCandidate, SemanticError> {
    let owner_fqcn = erase_generic_type_name(&candidate.owner_fqcn);
    let owner_info = class_index
        .get(owner_fqcn.as_str())
        .ok_or_else(|| semantic_error(format!("Unknown class '{}'", candidate.owner_fqcn)))?;
    Ok(ResolvedMethodCandidate {
        owner_fqcn,
        signature: instantiate_method_signature(
            &candidate.signature,
            owner_info,
            owner_ty,
            arg_types,
        ),
    })
}

pub(super) fn select_best_resolved_method_candidate<'a>(
    name: &str,
    arg_types: &[String],
    candidates: &'a [ResolvedMethodCandidate],
    class_index: &HashMap<String, ClassInfo>,
) -> Result<Option<&'a ResolvedMethodCandidate>, SemanticError> {
    let mut unique_indices: Vec<usize> = Vec::new();
    for (idx, candidate) in candidates.iter().enumerate() {
        let duplicate = unique_indices.iter().any(|existing_idx| {
            let existing = &candidates[*existing_idx].signature;
            let same_type = |left: &str, right: &str| {
                let left_erased = erase_generic_type_name(left);
                let right_erased = erase_generic_type_name(right);
                left == right
                    || left_erased == right_erased
                    || class_simple_name(left) == class_simple_name(right)
                    || class_simple_name(&left_erased) == class_simple_name(&right_erased)
            };
            existing.is_static == candidate.signature.is_static
                && existing.param_types.len() == candidate.signature.param_types.len()
                && existing
                    .param_types
                    .iter()
                    .zip(candidate.signature.param_types.iter())
                    .all(|(left, right)| same_type(left, right))
                && same_type(&existing.return_type, &candidate.signature.return_type)
        });
        if !duplicate {
            unique_indices.push(idx);
        }
    }

    let signatures = unique_indices
        .iter()
        .map(|idx| candidates[*idx].signature.clone())
        .collect::<Vec<_>>();
    let Some(signature) = select_best_method_overload(name, arg_types, &signatures, class_index)?
    else {
        return Ok(None);
    };
    Ok(unique_indices
        .into_iter()
        .find_map(|idx| (candidates[idx].signature == *signature).then_some(&candidates[idx])))
}

fn instantiated_class_bindings(owner_ty: &str, owner_info: &ClassInfo) -> HashMap<String, String> {
    build_type_param_bindings(&owner_info.type_params, &generic_type_args(owner_ty))
}

fn substitute_field_type(field: &FieldInfo, owner_info: &ClassInfo, owner_ty: &str) -> String {
    instantiate_type_params_with_defaults(
        &field.ty,
        &instantiated_class_bindings(owner_ty, owner_info),
        &owner_info.type_params,
    )
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
            .map(|ty| instantiate_type_params_with_defaults(ty, &bindings, &owner_info.type_params))
            .collect(),
        return_type: instantiate_type_params_with_defaults(
            &signature.return_type,
            &bindings,
            &owner_info.type_params,
        ),
        declared_throws: signature
            .declared_throws
            .iter()
            .map(|ty| instantiate_type_params_with_defaults(ty, &bindings, &owner_info.type_params))
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
        Expr::This => {
            if in_static_context {
                return Err(semantic_error(format!(
                    "Cannot use 'this' in static method '{}'",
                    class.name
                )));
            }
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
            if class_info.constructors.is_empty() && arg_types.is_empty() {
                return Ok(value_type("void"));
            }
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
                        &format!("constructor chain '{}.{}'", class.name, class.name),
                    )?;
                }
                return Ok(value_type("void"));
            }
            Err(semantic_error(format!(
                "No constructor '{}' matches argument types ({}). Available constructors: {}",
                class.name,
                arg_types.join(","),
                format_constructor_signatures(&instantiated_ctors)
            )))
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
            let target_class = class_index.get(super_class).ok_or_else(|| {
                semantic_error(format!(
                    "Unknown superclass '{}' in constructor chain",
                    super_class
                ))
            })?;
            let instantiated_ctors = target_class
                .constructors
                .iter()
                .map(|ctor| instantiate_constructor_signature(ctor, target_class, super_class))
                .collect::<Vec<_>>();
            if target_class.constructors.is_empty() && arg_types.is_empty() {
                return Ok(value_type("void"));
            }
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
                        &format!(
                            "super constructor chain '{}.{}'",
                            class.name,
                            class_simple_name(super_class)
                        ),
                    )?;
                }
                return Ok(value_type("void"));
            }
            Err(semantic_error(format!(
                "No constructor '{}' matches argument types ({}). Available constructors: {}",
                class_simple_name(super_class),
                arg_types.join(","),
                format_constructor_signatures(&instantiated_ctors)
            )))
        }
        Expr::Var(name) => {
            if let Some(class_fqcn) =
                resolve_class_fqcn(name, &class_info.package_name, imports, class_index)?
            {
                return Err(semantic_error(format!(
                    "Constructor calls must use Java-like 'new {}(...)' syntax",
                    class_simple_name(&class_fqcn)
                )));
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
                            &current_class_self_type(class, class_info),
                            &arg_types,
                        )
                    })
                    .collect::<Result<Vec<_>, _>>()?;
                let candidate =
                    select_best_resolved_method_candidate(name, &arg_types, &instantiated_candidates, class_index)?
                    .ok_or_else(|| {
                        semantic_error(format!(
                            "No method '{}' matches argument types ({}) in class '{}'. Available overloads: {}",
                            name,
                            arg_types.join(","),
                            class.name,
                            format_method_overloads(
                                name,
                                &instantiated_candidates
                                    .iter()
                                    .map(|candidate| candidate.signature.clone())
                                    .collect::<Vec<_>>(),
                            )
                        ))
                    })?;
                let signature = &candidate.signature;

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
            Err(semantic_error(format!("Unknown array member '{}'", member)))
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
        && class_info
            .enum_constants
            .iter()
            .any(|constant| constant == member)
    {
        return Ok(value_type(&owner));
    }

    if class_info.is_enum
        && class_info
            .enum_constants
            .iter()
            .any(|constant| constant == member)
    {
        return Err(semantic_error(format!(
            "Cannot assign to enum constant '{}.{}'",
            class_info.simple_name, member
        )));
    }

    if let Some((field_owner, field)) =
        lookup_field_in_hierarchy(owner.as_str(), member, class_index)
    {
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
            && !receiver_allows_cross_package_protected_access(
                receiver,
                current_class_fqcn,
                class_index,
            )
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
                    Ok(value_type(&substitute_field_type(
                        &field,
                        field_owner_info,
                        receiver.ty.as_str(),
                    )))
                }
            }
            ExprKind::Value => {
                if field.is_static {
                    Err(semantic_error(format!(
                        "Cannot access static field '{}.{}' through instance reference",
                        field_owner_display, member
                    )))
                } else {
                    Ok(value_type(&substitute_field_type(
                        &field,
                        field_owner_info,
                        receiver.ty.as_str(),
                    )))
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

    let candidates =
        lookup_method_candidates(owner.as_str(), method, class_index).ok_or_else(|| {
            semantic_error(format!(
                "No method '{}.{}' matches argument types ({})",
                owner_display,
                method,
                arg_types.join(",")
            ))
        })?;

    let instantiated_candidates = candidates
        .iter()
        .map(|candidate| {
            instantiate_resolved_method_candidate(candidate, class_index, &receiver.ty, arg_types)
        })
        .collect::<Result<Vec<_>, _>>()?;

    let candidate = select_best_resolved_method_candidate(
        method,
        arg_types,
        &instantiated_candidates,
        class_index,
    )?
    .ok_or_else(|| {
        semantic_error(format!(
            "No method '{}.{}' matches argument types ({}). Available overloads: {}",
            owner_display,
            method,
            arg_types.join(","),
            format_method_overloads(
                method,
                &instantiated_candidates
                    .iter()
                    .map(|candidate| candidate.signature.clone())
                    .collect::<Vec<_>>(),
            )
        ))
    })?;
    let method_owner = &candidate.owner_fqcn;
    let signature = &candidate.signature;
    let method_owner_info = class_index
        .get(method_owner.as_str())
        .ok_or_else(|| semantic_error(format!("Unknown class '{}'", method_owner)))?;
    let method_owner_display = method_owner_info.simple_name.as_str();

    if !is_member_accessible(
        signature.visibility,
        method_owner,
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
        && !receiver_allows_cross_package_protected_access(
            receiver,
            current_class_fqcn,
            class_index,
        )
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

    Err(semantic_error(format!(
        "Type '{}' has no members",
        receiver.ty
    )))
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
    let mut current = erase_generic_type_name(owner_fqcn);
    loop {
        let info = class_index.get(current.as_str())?;
        if let Some(field) = info.fields.get(field_name) {
            return Some((current, field.clone()));
        }
        if let Some(parent) = info.super_class.as_deref() {
            current = erase_generic_type_name(parent);
        } else {
            return None;
        }
    }
}

pub(super) fn lookup_method_candidates(
    owner_fqcn: &str,
    method_name: &str,
    class_index: &HashMap<String, ClassInfo>,
) -> Option<Vec<ResolvedMethodCandidate>> {
    let owner_fqcn = erase_generic_type_name(owner_fqcn);
    let info = class_index.get(&owner_fqcn)?;
    let mut out = Vec::new();
    let mut seen = HashSet::new();

    if info.is_interface {
        collect_method_candidates_in_interface_hierarchy(
            &owner_fqcn,
            method_name,
            class_index,
            &mut out,
            &mut seen,
            &mut HashSet::new(),
        )?;
        collect_method_candidates_in_class_hierarchy(
            "aden.lang.Object",
            method_name,
            class_index,
            &mut out,
            &mut seen,
        )?;
    } else {
        collect_method_candidates_in_class_hierarchy(
            &owner_fqcn,
            method_name,
            class_index,
            &mut out,
            &mut seen,
        )?;
        collect_method_candidates_from_class_interfaces(
            &owner_fqcn,
            method_name,
            class_index,
            &mut out,
            &mut seen,
            &mut HashSet::new(),
        )?;
    }

    if out.is_empty() {
        None
    } else {
        Some(out)
    }
}

fn collect_method_candidates_in_class_hierarchy(
    owner_fqcn: &str,
    method_name: &str,
    class_index: &HashMap<String, ClassInfo>,
    out: &mut Vec<ResolvedMethodCandidate>,
    seen: &mut HashSet<String>,
) -> Option<()> {
    let owner_fqcn = erase_generic_type_name(owner_fqcn);
    let info = class_index.get(&owner_fqcn)?;
    if let Some(methods) = info.methods.get(method_name) {
        for signature in methods {
            let key = resolved_method_signature_key(signature);
            if seen.insert(key) {
                out.push(ResolvedMethodCandidate {
                    owner_fqcn: owner_fqcn.clone(),
                    signature: signature.clone(),
                });
            }
        }
    }
    if let Some(parent) = info.super_class.as_deref() {
        let parent_erased = erase_generic_type_name(parent);
        collect_method_candidates_in_class_hierarchy(
            &parent_erased,
            method_name,
            class_index,
            out,
            seen,
        )?;
    }
    Some(())
}

fn collect_method_candidates_from_class_interfaces(
    owner_fqcn: &str,
    method_name: &str,
    class_index: &HashMap<String, ClassInfo>,
    out: &mut Vec<ResolvedMethodCandidate>,
    seen: &mut HashSet<String>,
    visited_ifaces: &mut HashSet<String>,
) -> Option<()> {
    let owner_fqcn = erase_generic_type_name(owner_fqcn);
    let info = class_index.get(&owner_fqcn)?;
    for iface in &info.interfaces {
        let iface_erased = erase_generic_type_name(iface);
        collect_method_candidates_in_interface_hierarchy(
            &iface_erased,
            method_name,
            class_index,
            out,
            seen,
            visited_ifaces,
        )?;
    }
    if let Some(parent) = info.super_class.as_deref() {
        let parent_erased = erase_generic_type_name(parent);
        collect_method_candidates_from_class_interfaces(
            &parent_erased,
            method_name,
            class_index,
            out,
            seen,
            visited_ifaces,
        )?;
    }
    Some(())
}

fn collect_method_candidates_in_interface_hierarchy(
    iface_fqcn: &str,
    method_name: &str,
    class_index: &HashMap<String, ClassInfo>,
    out: &mut Vec<ResolvedMethodCandidate>,
    seen: &mut HashSet<String>,
    visited_ifaces: &mut HashSet<String>,
) -> Option<()> {
    let iface_fqcn = erase_generic_type_name(iface_fqcn);
    if !visited_ifaces.insert(iface_fqcn.clone()) {
        return Some(());
    }
    let info = class_index.get(&iface_fqcn)?;
    if let Some(methods) = info.methods.get(method_name) {
        for signature in methods {
            let key = resolved_method_signature_key(signature);
            if seen.insert(key) {
                out.push(ResolvedMethodCandidate {
                    owner_fqcn: iface_fqcn.clone(),
                    signature: signature.clone(),
                });
            }
        }
    }
    for parent in &info.interfaces {
        let parent_erased = erase_generic_type_name(parent);
        collect_method_candidates_in_interface_hierarchy(
            &parent_erased,
            method_name,
            class_index,
            out,
            seen,
            visited_ifaces,
        )?;
    }
    Some(())
}
