use super::*;

pub(super) fn validate_override_annotation_requirement(
    requirement: &OverrideRequirement,
    class_index: &HashMap<String, ClassInfo>,
) -> Result<(), SemanticError> {
    if overrides_super_method(requirement, class_index)
        || implements_interface_contract_method(requirement, class_index)?
    {
        return Ok(());
    }

    Err(semantic_error(format!(
        "Method '{}.{}({})' uses @Override but does not override a superclass or interface method",
        requirement.class_name,
        requirement.method_name,
        requirement.param_types.join(",")
    )))
}

pub(super) fn overrides_super_method(
    requirement: &OverrideRequirement,
    class_index: &HashMap<String, ClassInfo>,
) -> bool {
    let Some(class_info) = class_index.get(requirement.class_fqcn.as_str()) else {
        return false;
    };
    let mut current = class_info.super_class.clone();
    while let Some(parent_ty) = current {
        let parent_erased = erase_generic_type_name(&parent_ty);
        let Some(parent_info) = class_index.get(parent_erased.as_str()) else {
            return false;
        };
        let bindings =
            build_type_param_bindings(&parent_info.type_params, &generic_type_args(&parent_ty));
        if let Some(parent_methods) = parent_info.methods.get(requirement.method_name.as_str()) {
            if parent_methods.iter().any(|parent_sig| {
                let instantiated = instantiate_method_signature(parent_sig, &bindings);
                instantiated.param_types == requirement.param_types
                    && instantiated.return_type == requirement.return_type
                    && !parent_sig.is_static
            }) {
                return true;
            }
        }
        current = parent_info
            .super_class
            .as_ref()
            .map(|parent| substitute_type_params(parent, &bindings));
    }
    false
}

pub(super) fn implements_interface_contract_method(
    requirement: &OverrideRequirement,
    class_index: &HashMap<String, ClassInfo>,
) -> Result<bool, SemanticError> {
    let mut interfaces = Vec::new();
    let mut seen = HashSet::new();
    collect_interfaces_for_class(
        requirement.class_fqcn.as_str(),
        class_index,
        &mut interfaces,
        &mut seen,
    )?;

    let mut required_methods = Vec::new();
    for iface in interfaces {
        collect_interface_methods(iface.as_str(), class_index, &mut required_methods, true)?;
    }

    Ok(required_methods.iter().any(|(name, sig)| {
        name == requirement.method_name.as_str()
            && sig.param_types == requirement.param_types
            && sig.return_type == requirement.return_type
            && !sig.is_static
    }))
}

pub(super) fn collect_interfaces_for_class(
    class_fqcn: &str,
    class_index: &HashMap<String, ClassInfo>,
    out: &mut Vec<String>,
    seen: &mut HashSet<String>,
) -> Result<(), SemanticError> {
    let info = class_index.get(class_fqcn).ok_or_else(|| {
        semantic_error(format!(
            "Unknown class '{}' while validating annotation requirements",
            class_fqcn
        ))
    })?;

    for iface in &info.interfaces {
        if seen.insert(iface.clone()) {
            out.push(iface.clone());
        }
    }

    if let Some(parent) = info.super_class.as_deref() {
        let parent_erased = erase_generic_type_name(parent);
        collect_interfaces_for_class(&parent_erased, class_index, out, seen)?;
    }

    Ok(())
}

pub(super) fn validate_interface_inheritance(
    iface_fqcn: &str,
    class_index: &HashMap<String, ClassInfo>,
) -> Result<(), SemanticError> {
    let iface_fqcn = erase_generic_type_name(iface_fqcn);
    let iface = class_index
        .get(&iface_fqcn)
        .ok_or_else(|| semantic_error(format!("Unknown interface '{}'", iface_fqcn)))?;
    if !iface.is_interface {
        return Ok(());
    }
    let mut active = HashSet::new();
    validate_interface_inheritance_inner(&iface_fqcn, &iface_fqcn, class_index, &mut active)
}

fn validate_interface_inheritance_inner(
    root_iface_fqcn: &str,
    current_iface_fqcn: &str,
    class_index: &HashMap<String, ClassInfo>,
    active: &mut HashSet<String>,
) -> Result<(), SemanticError> {
    let iface = class_index
        .get(current_iface_fqcn)
        .ok_or_else(|| semantic_error(format!("Unknown interface '{}'", current_iface_fqcn)))?;
    for parent in &iface.interfaces {
        let parent_erased = erase_generic_type_name(parent);
        if parent_erased == root_iface_fqcn || !active.insert(parent_erased.clone()) {
            return Err(semantic_error(format!(
                "Interface inheritance cycle detected involving '{}'",
                class_simple_name(root_iface_fqcn)
            )));
        }
        let parent_info = class_index.get(&parent_erased).ok_or_else(|| {
            semantic_error(format!(
                "Unknown parent interface '{}' for '{}'",
                parent,
                class_simple_name(root_iface_fqcn)
            ))
        })?;
        if !parent_info.is_interface {
            return Err(semantic_error(format!(
                "Interface '{}' cannot extend non-interface type '{}'",
                class_simple_name(root_iface_fqcn),
                parent_info.simple_name
            )));
        }
        validate_interface_inheritance_inner(root_iface_fqcn, &parent_erased, class_index, active)?;
        active.remove(&parent_erased);
    }
    Ok(())
}

pub(super) fn validate_inheritance_chain(
    class_fqcn: &str,
    class_index: &HashMap<String, ClassInfo>,
) -> Result<(), SemanticError> {
    let mut visited = HashSet::new();
    let mut current = erase_generic_type_name(class_fqcn);
    while let Some(info) = class_index.get(current.as_str()) {
        let Some(parent) = info.super_class.as_deref() else {
            return Ok(());
        };
        let parent_erased = erase_generic_type_name(parent);
        if !visited.insert(parent_erased.clone()) {
            return Err(semantic_error(format!(
                "Inheritance cycle detected involving '{}'",
                class_simple_name(class_fqcn)
            )));
        }
        if !class_index.contains_key(&parent_erased) {
            return Err(semantic_error(format!(
                "Unknown superclass '{}' for '{}'",
                parent,
                class_simple_name(class_fqcn)
            )));
        }
        current = parent_erased;
    }
    Ok(())
}

pub(super) fn validate_override_rules(
    class_info: &ClassInfo,
    super_info: &ClassInfo,
    class_index: &HashMap<String, ClassInfo>,
) -> Result<(), SemanticError> {
    let super_bindings = class_info
        .super_class
        .as_ref()
        .map(|parent| build_type_param_bindings(&super_info.type_params, &generic_type_args(parent)))
        .unwrap_or_default();
    for (method_name, methods) in &class_info.methods {
        if let Some(parent_methods) = super_info.methods.get(method_name) {
            for method in methods {
                for parent in parent_methods {
                    let parent = instantiate_method_signature(parent, &super_bindings);
                    if method.param_types != parent.param_types {
                        continue;
                    }
                    if parent.is_final {
                        return Err(semantic_error(format!(
                            "Method '{}.{}({})' cannot override final method in '{}'",
                            class_info.simple_name,
                            method_name,
                            method.param_types.join(","),
                            super_info.simple_name
                        )));
                    }
                    if method.return_type != parent.return_type {
                        return Err(semantic_error(format!(
                            "Method '{}.{}({})' must keep return type '{}' when overriding",
                            class_info.simple_name,
                            method_name,
                            method.param_types.join(","),
                            parent.return_type
                        )));
                    }
                    for declared in &method.declared_throws {
                        if !is_checked_exception_type(declared, class_index) {
                            continue;
                        }
                        if parent.declared_throws.iter().any(|parent_declared| {
                            is_assignable_class(declared, parent_declared, class_index)
                        }) {
                            continue;
                        }
                        return Err(semantic_error(format!(
                            "Method '{}.{}({})' cannot widen checked throws beyond overridden method",
                            class_info.simple_name,
                            method_name,
                            method.param_types.join(",")
                        )));
                    }
                }
            }
        }
    }
    Ok(())
}

pub(super) fn validate_interface_implementations(
    class_info: &ClassInfo,
    class_index: &HashMap<String, ClassInfo>,
) -> Result<(), SemanticError> {
    let mut required: Vec<(String, MethodSignature)> = Vec::new();
    for iface in &class_info.interfaces {
        collect_interface_methods(iface, class_index, &mut required, false)?;
    }

    for (method_name, sig) in required {
        let Some(impl_sig) =
            find_instance_method_in_class_hierarchy(class_info, &method_name, &sig, class_index)
        else {
            return Err(semantic_error(format!(
                "Class '{}' must implement interface method '{}({})'",
                class_info.simple_name,
                method_name,
                sig.param_types.join(",")
            )));
        };

        if impl_sig.return_type != sig.return_type {
            return Err(semantic_error(format!(
                "Class '{}' method implementation for '{}({})' must return '{}'",
                class_info.simple_name,
                method_name,
                sig.param_types.join(","),
                sig.return_type
            )));
        }
        if impl_sig.visibility != MemberVisibility::Public {
            return Err(semantic_error(format!(
                "Class '{}' must implement interface method '{}({})' as public",
                class_info.simple_name,
                method_name,
                sig.param_types.join(",")
            )));
        }
        for declared in &impl_sig.declared_throws {
            if !is_checked_exception_type(declared, class_index) {
                continue;
            }
            if sig
                .declared_throws
                .iter()
                .any(|iface_declared| is_assignable_class(declared, iface_declared, class_index))
            {
                continue;
            }
            return Err(semantic_error(format!(
                "Class '{}' implementation of '{}({})' cannot widen checked throws beyond the interface contract",
                class_info.simple_name,
                method_name,
                sig.param_types.join(",")
            )));
        }
    }
    Ok(())
}

pub(super) fn collect_interface_methods(
    iface_ty: &str,
    class_index: &HashMap<String, ClassInfo>,
    out: &mut Vec<(String, MethodSignature)>,
    include_default_methods: bool,
) -> Result<(), SemanticError> {
    let iface_fqcn = erase_generic_type_name(iface_ty);
    let iface = class_index
        .get(&iface_fqcn)
        .ok_or_else(|| semantic_error(format!("Unknown interface '{}'", iface_fqcn)))?;
    if !iface.is_interface {
        return Err(semantic_error(format!(
            "Type '{}' is not an interface",
            iface.simple_name
        )));
    }

    let interface_args = generic_type_args(iface_ty);
    let bindings = build_type_param_bindings(&iface.type_params, &interface_args);

    for (name, signatures) in &iface.methods {
        for sig in signatures {
            if sig.is_static || sig.visibility == MemberVisibility::Private {
                continue;
            }
            if !include_default_methods && !sig.is_abstract {
                continue;
            }
            let instantiated = instantiate_interface_method_signature(sig, &bindings);
            if out.iter().any(|(n, existing)| {
                n == name
                    && existing.param_types == instantiated.param_types
                    && existing.return_type == instantiated.return_type
            }) {
                continue;
            }
            out.push((name.clone(), instantiated));
        }
    }

    for parent in &iface.interfaces {
        let instantiated_parent = substitute_type_params(parent, &bindings);
        collect_interface_methods(
            &instantiated_parent,
            class_index,
            out,
            include_default_methods,
        )?;
    }

    Ok(())
}

fn instantiate_interface_method_signature(
    sig: &MethodSignature,
    bindings: &HashMap<String, String>,
) -> MethodSignature {
    instantiate_method_signature(sig, bindings)
}

fn instantiate_method_signature(
    sig: &MethodSignature,
    bindings: &HashMap<String, String>,
) -> MethodSignature {
    MethodSignature {
        type_params: sig.type_params.clone(),
        param_types: sig
            .param_types
            .iter()
            .map(|ty| substitute_type_params(ty, bindings))
            .collect(),
        return_type: substitute_type_params(&sig.return_type, bindings),
        declared_throws: sig
            .declared_throws
            .iter()
            .map(|ty| substitute_type_params(ty, bindings))
            .collect(),
        is_varargs: sig.is_varargs,
        is_static: sig.is_static,
        is_final: sig.is_final,
        is_abstract: sig.is_abstract,
        visibility: sig.visibility,
    }
}

fn owner_type_param_bindings(info: &ClassInfo, owner_ty: &str) -> HashMap<String, String> {
    let args = generic_type_args(owner_ty);
    if args.is_empty() && !info.type_params.is_empty() {
        return info
            .type_params
            .iter()
            .map(|param| (param.clone(), param.clone()))
            .collect();
    }
    build_type_param_bindings(&info.type_params, &args)
}

pub(super) fn find_instance_method_in_class_hierarchy(
    class_info: &ClassInfo,
    method_name: &str,
    target: &MethodSignature,
    class_index: &HashMap<String, ClassInfo>,
) -> Option<MethodSignature> {
    let mut current = format!("{}.{}", class_info.package_name, class_info.simple_name);
    let mut current_ty = current.clone();
    loop {
        let info = class_index.get(current.as_str())?;
        if let Some(methods) = info.methods.get(method_name) {
            let bindings = owner_type_param_bindings(info, &current_ty);
            for sig in methods {
                let instantiated = instantiate_method_signature(sig, &bindings);
                if instantiated.param_types == target.param_types
                    && !sig.is_static
                    && !sig.is_abstract
                {
                    return Some(instantiated);
                }
            }
        }
        for iface in &info.interfaces {
            let iface_erased = erase_generic_type_name(iface);
            if let Some(sig) = find_instance_method_in_interface_hierarchy(
                &iface_erased,
                method_name,
                target,
                class_index,
            ) {
                return Some(sig);
            }
        }

        if let Some(parent) = info.super_class.as_deref() {
            current_ty = substitute_type_params(
                parent,
                &owner_type_param_bindings(info, &current_ty),
            );
            current = erase_generic_type_name(&current_ty);
        } else {
            return None;
        }
    }
}

fn find_instance_method_in_interface_hierarchy(
    iface_fqcn: &str,
    method_name: &str,
    target: &MethodSignature,
    class_index: &HashMap<String, ClassInfo>,
) -> Option<MethodSignature> {
    let iface_fqcn = erase_generic_type_name(iface_fqcn);
    let iface = class_index.get(&iface_fqcn)?;
    if let Some(methods) = iface.methods.get(method_name) {
        for sig in methods {
            if sig.param_types == target.param_types && !sig.is_static && !sig.is_abstract {
                return Some(sig.clone());
            }
        }
    }
    for parent in &iface.interfaces {
        let parent_erased = erase_generic_type_name(parent);
        if let Some(sig) = find_instance_method_in_interface_hierarchy(
            &parent_erased,
            method_name,
            target,
            class_index,
        ) {
            return Some(sig);
        }
    }
    None
}

pub(super) fn visibility_from_modifiers(modifiers: &[Modifier]) -> MemberVisibility {
    if modifiers.contains(&Modifier::Public) {
        MemberVisibility::Public
    } else if modifiers.contains(&Modifier::Protected) {
        MemberVisibility::Protected
    } else if modifiers.contains(&Modifier::Private) {
        MemberVisibility::Private
    } else {
        MemberVisibility::Package
    }
}

pub(super) fn is_member_accessible(
    visibility: MemberVisibility,
    owner: &str,
    owner_package: &str,
    current_class: &str,
    current_package: &str,
    class_index: &HashMap<String, ClassInfo>,
) -> bool {
    match visibility {
        MemberVisibility::Public => true,
        MemberVisibility::Private => {
            owner == current_class || class_simple_name(owner) == class_simple_name(current_class)
        }
        MemberVisibility::Protected => {
            owner_package == current_package
                || is_assignable_class(current_class, owner, class_index)
        }
        MemberVisibility::Package => owner_package == current_package,
    }
}
