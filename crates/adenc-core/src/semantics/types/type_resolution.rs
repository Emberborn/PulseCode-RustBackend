use super::*;

pub(super) fn validate_type_exists_in_scope(
    ty: &str,
    current_package: &str,
    imports: &[ImportDecl],
    simple_to_fqcns: &HashMap<String, Vec<String>>,
    fqcn_names: &HashSet<String>,
    generic_arity: &HashMap<String, usize>,
    available_type_params: &HashSet<String>,
    context: &str,
) -> Result<(), SemanticError> {
    match canonicalize_type_name_in_scope(
        ty,
        current_package,
        imports,
        simple_to_fqcns,
        fqcn_names,
        generic_arity,
        available_type_params,
    ) {
        Ok(_) => Ok(()),
        Err(err) => {
            if err.message.starts_with("Unknown type ") {
                Err(semantic_error(format!("{} in {}", err.message, context)))
            } else {
                Err(err)
            }
        }
    }
}

pub(super) fn canonicalize_type_name(
    ty: &str,
    current_package: &str,
    imports: &[ImportDecl],
    simple_to_fqcns: &HashMap<String, Vec<String>>,
    fqcn_names: &HashSet<String>,
) -> Result<String, SemanticError> {
    let generic_arity = HashMap::new();
    let type_params = HashSet::new();
    canonicalize_type_name_in_scope(
        ty,
        current_package,
        imports,
        simple_to_fqcns,
        fqcn_names,
        &generic_arity,
        &type_params,
    )
}

pub(super) fn canonicalize_type_name_in_scope(
    ty: &str,
    current_package: &str,
    imports: &[ImportDecl],
    simple_to_fqcns: &HashMap<String, Vec<String>>,
    fqcn_names: &HashSet<String>,
    generic_arity: &HashMap<String, usize>,
    available_type_params: &HashSet<String>,
) -> Result<String, SemanticError> {
    let (base, array_suffix) = split_array_suffix(ty);
    let (raw_base, generic_args) = split_generic_type(base)?;

    if available_type_params.contains(raw_base) {
        if !generic_args.is_empty() {
            return Err(semantic_error(format!(
                "Type parameter '{}' cannot declare generic arguments",
                raw_base
            )));
        }
        return Ok(format!("{}{}", raw_base, array_suffix));
    }

    if is_builtin_type(raw_base) {
        if !generic_args.is_empty() {
            return Err(semantic_error(format!(
                "Primitive/builtin type '{}' cannot declare generic arguments",
                raw_base
            )));
        }
        return Ok(format!("{}{}", raw_base, array_suffix));
    }

    let resolved = resolve_type_base_fqcn(
        raw_base,
        current_package,
        imports,
        simple_to_fqcns,
        fqcn_names,
    )?;
    let expected_arity = generic_arity.get(&resolved).copied().unwrap_or(0);
    if generic_args.is_empty() {
        return Ok(format!("{}{}", resolved, array_suffix));
    }
    if expected_arity == 0 {
        return Err(semantic_error(format!(
            "Type '{}' is not generic in the current F1 baseline",
            raw_base
        )));
    }
    if generic_args.len() != expected_arity {
        return Err(semantic_error(format!(
            "Type '{}' expects {} generic argument(s) but got {}",
            raw_base,
            expected_arity,
            generic_args.len()
        )));
    }
    let mut rendered_args = Vec::with_capacity(generic_args.len());
    for arg in &generic_args {
        let canonical_arg = canonicalize_type_name_in_scope(
            arg,
            current_package,
            imports,
            simple_to_fqcns,
            fqcn_names,
            generic_arity,
            available_type_params,
        )?;
        if is_primitive_non_void(canonical_arg.as_str())
            || class_simple_name(&canonical_arg) == "void"
        {
            return Err(semantic_error(format!(
                "Generic argument '{}' must be a reference type",
                arg
            )));
        }
        rendered_args.push(canonical_arg);
    }
    Ok(format!(
        "{}<{}>{}",
        resolved,
        rendered_args.join(", "),
        array_suffix
    ))
}

pub(super) fn split_array_suffix(ty: &str) -> (&str, String) {
    let mut base = ty.trim();
    let mut suffix = String::new();
    while let Some(stripped) = base.strip_suffix("[]") {
        suffix.push_str("[]");
        base = stripped.trim_end();
    }
    (base, suffix)
}

pub(super) fn split_generic_type(ty: &str) -> Result<(&str, Vec<String>), SemanticError> {
    let trimmed = ty.trim();
    let Some(start) = trimmed.find('<') else {
        return Ok((trimmed, Vec::new()));
    };
    let end = trimmed
        .rfind('>')
        .ok_or_else(|| semantic_error(format!("Malformed generic type '{}'", ty)))?;
    if end < start || !trimmed[end + 1..].trim().is_empty() {
        return Err(semantic_error(format!("Malformed generic type '{}'", ty)));
    }

    let raw = trimmed[..start].trim();
    let inner = &trimmed[start + 1..end];
    let mut args = Vec::new();
    let mut depth = 0usize;
    let mut last = 0usize;
    for (idx, ch) in inner.char_indices() {
        match ch {
            '<' => depth += 1,
            '>' => depth = depth.saturating_sub(1),
            ',' if depth == 0 => {
                args.push(inner[last..idx].trim().to_string());
                last = idx + 1;
            }
            _ => {}
        }
    }
    args.push(inner[last..].trim().to_string());
    if raw.is_empty() || args.iter().any(|arg| arg.is_empty()) {
        return Err(semantic_error(format!("Malformed generic type '{}'", ty)));
    }
    Ok((raw, args))
}

pub(super) fn validate_type_param_list(
    type_params: &[String],
    context: &str,
) -> Result<(), SemanticError> {
    let mut seen = HashSet::new();
    for param in type_params {
        if is_builtin_type(param) {
            return Err(semantic_error(format!(
                "Type parameter '{}' is not allowed in {}",
                param, context
            )));
        }
        if !seen.insert(param.as_str()) {
            return Err(semantic_error(format!(
                "Duplicate type parameter '{}' in {}",
                param, context
            )));
        }
    }
    Ok(())
}

pub(super) fn visible_type_params(
    class: &ClassDecl,
    method: Option<&MethodDecl>,
) -> HashSet<String> {
    let mut visible = class.type_params.iter().cloned().collect::<HashSet<_>>();
    if let Some(method) = method {
        visible.extend(method.type_params.iter().cloned());
    }
    visible
}

pub(super) fn resolve_type_base_fqcn(
    base: &str,
    current_package: &str,
    imports: &[ImportDecl],
    simple_to_fqcns: &HashMap<String, Vec<String>>,
    fqcn_names: &HashSet<String>,
) -> Result<String, SemanticError> {
    if base.contains('.') {
        if fqcn_names.contains(base) {
            return Ok(base.to_string());
        }
        return Err(semantic_error(format!("Unknown type '{}'", base)));
    }

    let same_pkg = format!("{}.{}", current_package, base);
    if fqcn_names.contains(&same_pkg) {
        return Ok(same_pkg);
    }

    let mut explicit = Vec::new();
    for import in imports {
        if import.is_static || import.is_wildcard {
            continue;
        }
        if let Some((_, simple)) = import.path.rsplit_once('.') {
            if simple == base && fqcn_names.contains(&import.path) {
                explicit.push(import.path.clone());
            }
        }
    }
    explicit.sort();
    explicit.dedup();
    if explicit.len() > 1 {
        return Err(semantic_error(format!(
            "Ambiguous type reference '{}' in package '{}': {}",
            base,
            current_package,
            explicit.join("; ")
        )));
    }
    if let Some(hit) = explicit.into_iter().next() {
        return Ok(hit);
    }

    let mut wildcard = Vec::new();
    for import in imports {
        if import.is_static || !import.is_wildcard {
            continue;
        }
        let candidate = format!("{}.{}", import.path, base);
        if fqcn_names.contains(&candidate) {
            wildcard.push(candidate);
        }
    }
    wildcard.sort();
    wildcard.dedup();
    if wildcard.len() > 1 {
        return Err(semantic_error(format!(
            "Ambiguous type reference '{}' in package '{}': {}",
            base,
            current_package,
            wildcard.join("; ")
        )));
    }
    if let Some(hit) = wildcard.into_iter().next() {
        return Ok(hit);
    }

    let _ = simple_to_fqcns;
    let mut prelude = Vec::new();
    for package in crate::implicit_prelude_packages() {
        let candidate = format!("{}.{}", package, base);
        if fqcn_names.contains(&candidate) {
            prelude.push(candidate);
        }
    }
    prelude.sort();
    prelude.dedup();
    if prelude.len() > 1 {
        return Err(semantic_error(format!(
            "Ambiguous prelude type reference '{}' in package '{}': {}",
            base,
            current_package,
            prelude.join("; ")
        )));
    }
    if let Some(hit) = prelude.into_iter().next() {
        return Ok(hit);
    }

    Err(semantic_error(format!("Unknown type '{}'", base)))
}

pub(super) fn method_signature_key(method: &MethodDecl) -> String {
    let params = method
        .params
        .iter()
        .map(|p| erase_generic_type_name(p.ty.as_str()))
        .collect::<Vec<_>>()
        .join(",");

    if method.is_constructor {
        format!("ctor({})", params)
    } else {
        format!("{}({})", method.name, params)
    }
}

pub(super) fn erase_generic_type_name(ty: &str) -> String {
    let (base, array_suffix) = split_array_suffix(ty);
    let raw = split_generic_type(base)
        .map(|(raw, _)| raw.to_string())
        .unwrap_or_else(|_| base.to_string());
    format!("{}{}", raw, array_suffix)
}

pub(super) fn substitute_type_params(ty: &str, bindings: &HashMap<String, String>) -> String {
    let (base, array_suffix) = split_array_suffix(ty);
    let Ok((raw, args)) = split_generic_type(base) else {
        return bindings
            .get(base)
            .cloned()
            .unwrap_or_else(|| format!("{}{}", base, array_suffix));
    };

    let substituted_base = bindings
        .get(raw)
        .cloned()
        .unwrap_or_else(|| raw.to_string());
    if args.is_empty() {
        return format!("{}{}", substituted_base, array_suffix);
    }

    let rendered_args = args
        .iter()
        .map(|arg| substitute_type_params(arg, bindings))
        .collect::<Vec<_>>()
        .join(", ");
    format!("{}<{}>{}", substituted_base, rendered_args, array_suffix)
}

pub(super) fn build_type_param_bindings(
    type_params: &[String],
    concrete_args: &[String],
) -> HashMap<String, String> {
    let mut bindings = HashMap::new();
    for (idx, type_param) in type_params.iter().enumerate() {
        let bound = concrete_args
            .get(idx)
            .cloned()
            .unwrap_or_else(|| "aden.lang.Object".to_string());
        bindings.insert(type_param.clone(), bound);
    }
    bindings
}

pub(super) fn bind_missing_type_params(
    bindings: &mut HashMap<String, String>,
    type_params: &[String],
) {
    for type_param in type_params {
        bindings
            .entry(type_param.clone())
            .or_insert_with(|| "aden.lang.Object".to_string());
    }
}

pub(super) fn generic_type_components(ty: &str) -> Option<(String, Vec<String>, String)> {
    let (base, array_suffix) = split_array_suffix(ty);
    let Ok((raw, args)) = split_generic_type(base) else {
        return None;
    };
    if args.is_empty() {
        return None;
    }
    Some((raw.to_string(), args, array_suffix))
}

pub(super) fn generic_type_args(ty: &str) -> Vec<String> {
    generic_type_components(ty)
        .map(|(_, args, _)| args)
        .unwrap_or_default()
}

pub(super) fn instantiate_type_params_with_defaults(
    ty: &str,
    bindings: &HashMap<String, String>,
    type_params: &[String],
) -> String {
    let mut complete = bindings.clone();
    bind_missing_type_params(&mut complete, type_params);
    substitute_type_params(ty, &complete)
}

pub(super) fn collect_type_param_bindings(
    expected: &str,
    actual: &str,
    type_params: &[String],
    bindings: &mut HashMap<String, String>,
) {
    let (expected_base, expected_suffix) = split_array_suffix(expected);
    let (actual_base, actual_suffix) = split_array_suffix(actual);
    if expected_suffix != actual_suffix {
        return;
    }

    if type_params.iter().any(|param| param == expected_base) {
        bindings
            .entry(expected_base.to_string())
            .or_insert_with(|| actual.to_string());
        return;
    }

    let Ok((expected_raw, expected_args)) = split_generic_type(expected_base) else {
        return;
    };
    let Ok((actual_raw, actual_args)) = split_generic_type(actual_base) else {
        return;
    };
    if class_simple_name(expected_raw) != class_simple_name(actual_raw)
        || expected_args.len() != actual_args.len()
    {
        return;
    }
    for (expected_arg, actual_arg) in expected_args.iter().zip(actual_args.iter()) {
        collect_type_param_bindings(expected_arg, actual_arg, type_params, bindings);
    }
}

pub(super) fn collect_generic_arity(
    class_index: &HashMap<String, ClassInfo>,
) -> HashMap<String, usize> {
    let mut out = HashMap::new();
    for (name, info) in class_index {
        if name.contains('.') {
            out.insert(name.clone(), info.generic_arity);
        }
    }
    out
}
