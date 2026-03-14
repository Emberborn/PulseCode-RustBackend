use super::*;

pub(super) fn analyze_impl(
    program: &Program,
    class_contexts: &[ClassContext],
) -> Result<(), SemanticError> {
    if class_contexts.len() != program.classes.len() {
        return Err(semantic_error(format!(
            "Class context count mismatch: {} contexts for {} classes",
            class_contexts.len(),
            program.classes.len()
        )));
    }

    let DeclaredClassSet {
        mut class_names,
        mut fqcn_names,
        class_fqcns,
        mut simple_to_fqcns,
        declared_generic_arity,
        declared_annotation_fqcns,
    } = collect_declared_classes(program, class_contexts)?;
    let mut class_index: HashMap<String, ClassInfo> = HashMap::new();
    let mut entrypoint_count = 0usize;
    let mut override_requirements = Vec::new();

    builtins::inject_builtin_library_symbols(
        &mut class_names,
        &mut fqcn_names,
        &mut simple_to_fqcns,
        &mut class_index,
    )?;

    for (idx, class) in program.classes.iter().enumerate() {
        validate_type_param_list(
            &class.type_params,
            &format!("type parameters for '{}'", class.name),
        )?;
        let info = collect_class_members(
            class,
            &class_fqcns[idx],
            &class_contexts[idx],
            &simple_to_fqcns,
            &fqcn_names,
            &declared_generic_arity,
            &declared_annotation_fqcns,
            &mut entrypoint_count,
            &mut override_requirements,
        )?;
        class_index.insert(class_fqcns[idx].clone(), info.clone());
        class_index.entry(class.name.clone()).or_insert(info);
    }

    validate_class_relationships(&class_fqcns, &class_index, &override_requirements)?;
    validate_member_bodies(
        program,
        &class_fqcns,
        class_contexts,
        &class_names,
        &simple_to_fqcns,
        &class_index,
    )?;

    if entrypoint_count == 0 {
        return Err(semantic_error(
            "No entry method found. Add 'public static void main()' or 'public static void main(String[] args)'"
                .to_string(),
        ));
    }

    if entrypoint_count > 1 {
        return Err(semantic_error(
            "Multiple entry methods found. Keep exactly one main entrypoint".to_string(),
        ));
    }

    Ok(())
}
