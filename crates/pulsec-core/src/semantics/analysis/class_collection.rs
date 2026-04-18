use super::*;

pub(super) struct DeclaredClassSet {
    pub(super) class_names: HashSet<String>,
    pub(super) fqcn_names: HashSet<String>,
    pub(super) class_fqcns: Vec<String>,
    pub(super) simple_to_fqcns: HashMap<String, Vec<String>>,
    pub(super) declared_generic_arity: HashMap<String, usize>,
    pub(super) declared_annotation_fqcns: HashSet<String>,
}

pub(super) fn collect_declared_classes(
    program: &Program,
    class_contexts: &[ClassContext],
) -> Result<DeclaredClassSet, SemanticError> {
    let mut class_names: HashSet<String> = HashSet::new();
    let mut fqcn_names: HashSet<String> = HashSet::new();
    let mut class_fqcns = Vec::with_capacity(program.classes.len());

    for (idx, class) in program.classes.iter().enumerate() {
        let class_fqcn = format!("{}.{}", class_contexts[idx].package_name, class.name);
        if !fqcn_names.insert(class_fqcn.clone()) {
            return Err(semantic_error(format!(
                "Duplicate class declaration '{}'",
                class_fqcn
            )));
        }
        class_names.insert(class_fqcn.clone());
        class_names.insert(class.name.clone());
        class_fqcns.push(class_fqcn);
    }

    let declared_generic_arity: HashMap<String, usize> = program
        .classes
        .iter()
        .enumerate()
        .map(|(idx, class)| (class_fqcns[idx].clone(), class.type_params.len()))
        .collect();

    let mut simple_to_fqcns: HashMap<String, Vec<String>> = HashMap::new();
    for (idx, class) in program.classes.iter().enumerate() {
        simple_to_fqcns
            .entry(class.name.clone())
            .or_default()
            .push(class_fqcns[idx].clone());
    }

    let declared_annotation_fqcns: HashSet<String> = program
        .classes
        .iter()
        .enumerate()
        .filter_map(|(idx, class)| class.is_annotation.then(|| class_fqcns[idx].clone()))
        .collect();

    Ok(DeclaredClassSet {
        class_names,
        fqcn_names,
        class_fqcns,
        simple_to_fqcns,
        declared_generic_arity,
        declared_annotation_fqcns,
    })
}

pub(super) fn validate_class_relationships(
    class_fqcns: &[String],
    class_index: &HashMap<String, ClassInfo>,
    override_requirements: &[OverrideRequirement],
) -> Result<(), SemanticError> {
    for class_fqcn in class_fqcns {
        validate_inheritance_chain(class_fqcn, class_index)?;
        let class_info = class_index
            .get(class_fqcn)
            .expect("class info should exist");
        if class_info.is_interface {
            validate_interface_inheritance(class_fqcn, class_index)?;
        }
        for implemented in &class_info.interfaces {
            let implemented_erased = erase_generic_type_name(implemented);
            let iface = class_index.get(&implemented_erased).ok_or_else(|| {
                semantic_error(format!(
                    "Unknown interface '{}' for '{}'",
                    implemented, class_info.simple_name
                ))
            })?;
            if !iface.is_interface {
                return Err(semantic_error(format!(
                    "Class '{}' cannot implement non-interface type '{}'",
                    class_info.simple_name, iface.simple_name
                )));
            }
        }
        if let Some(super_name) = class_info.super_class.as_deref() {
            let super_name_erased = erase_generic_type_name(super_name);
            let super_info = class_index.get(&super_name_erased).ok_or_else(|| {
                semantic_error(format!(
                    "Unknown superclass '{}' for '{}'",
                    super_name, class_fqcn
                ))
            })?;
            if super_info.is_interface {
                return Err(semantic_error(format!(
                    "Class '{}' cannot extend interface '{}'; use implements",
                    class_info.simple_name, super_info.simple_name
                )));
            }
            if super_info.is_final {
                return Err(semantic_error(format!(
                    "Class '{}' cannot extend final class '{}'",
                    class_info.simple_name, super_info.simple_name
                )));
            }
            validate_override_rules(class_info, super_info, class_index)?;
        }
        if !class_info.is_abstract && !class_info.is_interface {
            validate_interface_implementations(class_info, class_index)?;
        }
    }

    for requirement in override_requirements {
        validate_override_annotation_requirement(requirement, class_index)?;
    }

    Ok(())
}

pub(super) fn validate_member_bodies(
    program: &Program,
    class_fqcns: &[String],
    class_contexts: &[ClassContext],
    class_names: &HashSet<String>,
    simple_to_fqcns: &HashMap<String, Vec<String>>,
    class_index: &HashMap<String, ClassInfo>,
) -> Result<(), SemanticError> {
    let fqcn_to_class = build_fqcn_index(class_index);

    for (idx, class) in program.classes.iter().enumerate() {
        let current_fqcn = &class_fqcns[idx];
        let class_info = class_index
            .get(current_fqcn)
            .expect("class info should exist");
        let imports = class_contexts[idx].imports.as_slice();

        for member in &class.members {
            match member {
                ClassMember::Field(field) => {
                    validate_field_initializer(
                        field,
                        class,
                        current_fqcn,
                        class_info,
                        class_names,
                        class_index,
                        &fqcn_to_class,
                        imports,
                    )?;
                }
                ClassMember::Method(method) => {
                    validate_declared_throws_clause(
                        method,
                        class,
                        class_info,
                        simple_to_fqcns,
                        class_index,
                        imports,
                    )?;
                    if method.modifiers.contains(&Modifier::Abstract) {
                        continue;
                    }
                    validate_method_body(
                        method,
                        class,
                        current_fqcn,
                        class_info,
                        class_names,
                        simple_to_fqcns,
                        class_index,
                        &fqcn_to_class,
                        imports,
                    )?;
                }
            }
        }
    }

    Ok(())
}
