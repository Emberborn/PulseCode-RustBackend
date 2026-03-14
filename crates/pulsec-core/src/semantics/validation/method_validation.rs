use super::*;

pub(super) fn validate_method_body(
    method: &MethodDecl,
    class: &ClassDecl,
    current_class_fqcn: &str,
    class_info: &ClassInfo,
    class_names: &HashSet<String>,
    simple_to_fqcns: &HashMap<String, Vec<String>>,
    class_index: &HashMap<String, ClassInfo>,
    fqcn_to_class: &HashMap<String, String>,
    imports: &[ImportDecl],
) -> Result<(), SemanticError> {
    let visible_type_params = visible_type_params(class, Some(method));
    let generic_arity = collect_generic_arity(class_index);
    let expected_return = if method.is_constructor {
        "void".to_string()
    } else {
        let declared_return = method.return_type.clone().ok_or_else(|| {
            semantic_error(format!("Method '{}.{}' missing return type", class.name, method.name))
        })?;
        canonicalize_type_name_in_scope(
            &declared_return,
            &class_info.package_name,
            imports,
            simple_to_fqcns,
            &collect_fqcn_names(class_index),
            &generic_arity,
            &visible_type_params,
        )?
    };

    let mut locals: HashMap<String, String> = HashMap::new();
    let mut null_state: HashMap<String, NullState> = HashMap::new();
    let fqcn_names = collect_fqcn_names(class_index);
    for param in &method.params {
        let param_ty = canonicalize_type_name_in_scope(
            &param.ty,
            &class_info.package_name,
            imports,
            simple_to_fqcns,
            &fqcn_names,
            &generic_arity,
            &visible_type_params,
        )?;
        if locals.insert(param.name.clone(), param_ty).is_some() {
            return Err(semantic_error(format!(
                "Duplicate parameter name '{}' in method '{}.{}'",
                param.name, class.name, method.name
            )));
        }

        null_state.insert(param.name.clone(), NullState::Unknown);
    }

    let in_static_context = method.modifiers.contains(&Modifier::Static);

    for stmt in &method.body {
        validate_stmt(
            stmt,
            method,
            class,
            current_class_fqcn,
            class_info,
            class_names,
            simple_to_fqcns,
            class_index,
            fqcn_to_class,
            imports,
            &mut locals,
            &mut null_state,
            &expected_return,
            in_static_context,
            0,
            0,
            0,
            false,
        )?;
    }

    if !method.is_constructor
        && expected_return != "void"
        && !block_guarantees_return(&method.body)
    {
        return Err(semantic_error(format!(
            "Method '{}.{}' must return '{}' on all paths",
            class.name, method.name, expected_return
        )));
    }

    validate_method_exception_contract(
        method,
        class,
        class_info,
        class_names,
        simple_to_fqcns,
        class_index,
        fqcn_to_class,
        imports,
    )?;

    Ok(())
}
