use super::*;

pub(super) fn collect_class_members(
    class: &ClassDecl,
    class_fqcn: &str,
    class_context: &ClassContext,
    simple_to_fqcns: &HashMap<String, Vec<String>>,
    fqcn_names: &HashSet<String>,
    declared_generic_arity: &HashMap<String, usize>,
    declared_annotation_fqcns: &HashSet<String>,
    entrypoint_count: &mut usize,
    override_requirements: &mut Vec<OverrideRequirement>,
) -> Result<ClassInfo, SemanticError> {
    let class_type_params: HashSet<String> = class.type_params.iter().cloned().collect();
    validate_class_shape(
        class,
        class_context,
        simple_to_fqcns,
        fqcn_names,
        declared_annotation_fqcns,
    )?;

    let super_class = collect_super_class(
        class,
        class_fqcn,
        class_context,
        simple_to_fqcns,
        fqcn_names,
        declared_generic_arity,
        &class_type_params,
    )?;
    let implemented_interfaces = collect_implemented_interfaces(
        class,
        class_context,
        simple_to_fqcns,
        fqcn_names,
        declared_generic_arity,
        &class_type_params,
    )?;

    let mut field_names: HashSet<String> = HashSet::new();
    let mut method_signatures = HashSet::new();
    let mut fields: HashMap<String, FieldInfo> = HashMap::new();
    let mut methods: HashMap<String, Vec<MethodSignature>> = HashMap::new();
    let mut constructors = Vec::new();

    validate_enum_constants(class)?;

    for member in &class.members {
        match member {
            ClassMember::Field(field) => collect_field_member(
                field,
                class,
                class_context,
                simple_to_fqcns,
                fqcn_names,
                declared_generic_arity,
                declared_annotation_fqcns,
                &class_type_params,
                &mut field_names,
                &mut fields,
            )?,
            ClassMember::Method(method) => collect_method_member(
                method,
                class,
                class_fqcn,
                class_context,
                simple_to_fqcns,
                fqcn_names,
                declared_generic_arity,
                declared_annotation_fqcns,
                &mut method_signatures,
                &mut methods,
                &mut constructors,
                entrypoint_count,
                override_requirements,
            )?,
        }
    }

    Ok(ClassInfo {
        simple_name: class.name.clone(),
        package_name: class_context.package_name.clone(),
        type_params: class.type_params.clone(),
        super_class,
        interfaces: implemented_interfaces,
        is_interface: class.is_interface,
        is_enum: class.is_enum,
        is_abstract: class.is_interface || class.modifiers.contains(&Modifier::Abstract),
        is_final: class.modifiers.contains(&Modifier::Final),
        enum_constants: class.enum_constants.clone(),
        generic_arity: class.type_params.len(),
        fields,
        methods,
        constructors,
    })
}

fn validate_class_shape(
    class: &ClassDecl,
    class_context: &ClassContext,
    simple_to_fqcns: &HashMap<String, Vec<String>>,
    fqcn_names: &HashSet<String>,
    declared_annotation_fqcns: &HashSet<String>,
) -> Result<(), SemanticError> {
    let _ = validate_annotation_uses(
        &class.annotations,
        AnnotationTargetKind::Class,
        &format!("class '{}'", class.name),
        &class_context.package_name,
        &class_context.imports,
        simple_to_fqcns,
        fqcn_names,
        declared_annotation_fqcns,
    )?;
    validate_modifiers(&class.modifiers, &format!("class '{}'", class.name))?;
    let supported_class_modifiers: &[Modifier] = if class.is_interface {
        &[Modifier::Public, Modifier::Abstract]
    } else if class.is_enum {
        &[Modifier::Public, Modifier::Private, Modifier::Protected, Modifier::Final]
    } else {
        &[
            Modifier::Public,
            Modifier::Private,
            Modifier::Protected,
            Modifier::Abstract,
            Modifier::Final,
        ]
    };
    validate_supported_modifiers(
        &class.modifiers,
        supported_class_modifiers,
        &format!("class '{}'", class.name),
    )?;
    if class.modifiers.contains(&Modifier::Abstract) && class.modifiers.contains(&Modifier::Final) {
        return Err(semantic_error(format!(
            "Class '{}' cannot be both abstract and final",
            class.name
        )));
    }
    if class.is_interface && class.modifiers.contains(&Modifier::Final) {
        return Err(semantic_error(format!(
            "Interface '{}' cannot be final",
            class.name
        )));
    }
    if class.is_enum && class.modifiers.contains(&Modifier::Abstract) {
        return Err(semantic_error(format!(
            "Enum '{}' cannot be abstract in the current F1 baseline",
            class.name
        )));
    }
    if class.is_annotation && !class.members.is_empty() {
        return Err(semantic_error(format!(
            "Annotation declaration '{}': members are not supported yet in the current F1 baseline",
            class.name
        )));
    }
    Ok(())
}

fn collect_super_class(
    class: &ClassDecl,
    class_fqcn: &str,
    class_context: &ClassContext,
    simple_to_fqcns: &HashMap<String, Vec<String>>,
    fqcn_names: &HashSet<String>,
    declared_generic_arity: &HashMap<String, usize>,
    class_type_params: &HashSet<String>,
) -> Result<Option<String>, SemanticError> {
    let Some(extends_name) = class.extends.as_deref() else {
        return Ok(None);
    };

    validate_type_exists_in_scope(
        extends_name,
        &class_context.package_name,
        &class_context.imports,
        simple_to_fqcns,
        fqcn_names,
        declared_generic_arity,
        class_type_params,
        &format!("extends clause for class '{}'", class.name),
    )?;
    let canonical = canonicalize_type_name_in_scope(
        extends_name,
        &class_context.package_name,
        &class_context.imports,
        simple_to_fqcns,
        fqcn_names,
        declared_generic_arity,
        class_type_params,
    )?;
    if is_builtin_type(canonical.as_str()) || canonical.ends_with("[]") {
        return Err(semantic_error(format!(
            "Class '{}' cannot extend non-class type '{}'",
            class.name, canonical
        )));
    }
    if canonical == class_fqcn {
        return Err(semantic_error(format!(
            "Class '{}' cannot extend itself",
            class.name
        )));
    }
    Ok(Some(canonical))
}

fn collect_implemented_interfaces(
    class: &ClassDecl,
    class_context: &ClassContext,
    simple_to_fqcns: &HashMap<String, Vec<String>>,
    fqcn_names: &HashSet<String>,
    declared_generic_arity: &HashMap<String, usize>,
    class_type_params: &HashSet<String>,
) -> Result<Vec<String>, SemanticError> {
    let mut implemented_interfaces = Vec::new();
    for interface_name in &class.implements {
        validate_type_exists_in_scope(
            interface_name,
            &class_context.package_name,
            &class_context.imports,
            simple_to_fqcns,
            fqcn_names,
            declared_generic_arity,
            class_type_params,
            &format!("implements clause for class '{}'", class.name),
        )?;
        let canonical = canonicalize_type_name_in_scope(
            interface_name,
            &class_context.package_name,
            &class_context.imports,
            simple_to_fqcns,
            fqcn_names,
            declared_generic_arity,
            class_type_params,
        )?;
        if is_builtin_type(canonical.as_str()) || canonical.ends_with("[]") {
            return Err(semantic_error(format!(
                "Class '{}' cannot implement non-interface type '{}'",
                class.name, canonical
            )));
        }
        implemented_interfaces.push(canonical);
    }
    implemented_interfaces.sort();
    implemented_interfaces.dedup();
    Ok(implemented_interfaces)
}

fn validate_enum_constants(class: &ClassDecl) -> Result<(), SemanticError> {
    if !class.is_enum {
        return Ok(());
    }
    let mut seen = HashSet::new();
    for constant in &class.enum_constants {
        if !seen.insert(constant.as_str()) {
            return Err(semantic_error(format!(
                "Duplicate enum constant '{}.{}'",
                class.name, constant
            )));
        }
    }
    Ok(())
}

#[allow(clippy::too_many_arguments)]
fn collect_field_member(
    field: &crate::FieldDecl,
    class: &ClassDecl,
    class_context: &ClassContext,
    simple_to_fqcns: &HashMap<String, Vec<String>>,
    fqcn_names: &HashSet<String>,
    declared_generic_arity: &HashMap<String, usize>,
    declared_annotation_fqcns: &HashSet<String>,
    class_type_params: &HashSet<String>,
    field_names: &mut HashSet<String>,
    fields: &mut HashMap<String, FieldInfo>,
) -> Result<(), SemanticError> {
    let field_annotations = validate_annotation_uses(
        &field.annotations,
        AnnotationTargetKind::Field,
        &format!("field '{}.{}'", class.name, field.name),
        &class_context.package_name,
        &class_context.imports,
        simple_to_fqcns,
        fqcn_names,
        declared_annotation_fqcns,
    )?;
    if !field_names.insert(field.name.clone()) {
        return Err(semantic_error(format!(
            "Duplicate field '{}.{}'",
            class.name, field.name
        )));
    }

    validate_modifiers(
        &field.modifiers,
        &format!("field '{}.{}'", class.name, field.name),
    )?;
    validate_supported_modifiers(
        &field.modifiers,
        &[
            Modifier::Public,
            Modifier::Private,
            Modifier::Protected,
            Modifier::Static,
            Modifier::Final,
        ],
        &format!("field '{}.{}'", class.name, field.name),
    )?;
    validate_type_exists_in_scope(
        &field.ty,
        &class_context.package_name,
        &class_context.imports,
        simple_to_fqcns,
        fqcn_names,
        declared_generic_arity,
        class_type_params,
        &format!("field '{}.{}'", class.name, field.name),
    )?;
    let field_ty = canonicalize_type_name_in_scope(
        &field.ty,
        &class_context.package_name,
        &class_context.imports,
        simple_to_fqcns,
        fqcn_names,
        declared_generic_arity,
        class_type_params,
    )?;

    fields.insert(
        field.name.clone(),
        FieldInfo {
            ty: field_ty,
            is_static: field.modifiers.contains(&Modifier::Static),
            is_final: field.modifiers.contains(&Modifier::Final),
            is_not_null: field_annotations.contains("NotNull"),
            is_runtime_managed: false,
            visibility: visibility_from_modifiers(&field.modifiers),
        },
    );

    if field_annotations.contains("NotNull") {
        let declared = fields
            .get(field.name.as_str())
            .expect("field inserted")
            .ty
            .clone();
        validate_not_null_type_target(
            declared.as_str(),
            &format!("field '{}.{}'", class.name, field.name),
        )?;
    }

    Ok(())
}

#[allow(clippy::too_many_arguments)]
fn collect_method_member(
    method: &MethodDecl,
    class: &ClassDecl,
    class_fqcn: &str,
    class_context: &ClassContext,
    simple_to_fqcns: &HashMap<String, Vec<String>>,
    fqcn_names: &HashSet<String>,
    declared_generic_arity: &HashMap<String, usize>,
    declared_annotation_fqcns: &HashSet<String>,
    method_signatures: &mut HashSet<String>,
    methods: &mut HashMap<String, Vec<MethodSignature>>,
    constructors: &mut Vec<ConstructorSignature>,
    entrypoint_count: &mut usize,
    override_requirements: &mut Vec<OverrideRequirement>,
) -> Result<(), SemanticError> {
    validate_type_param_list(
        &method.type_params,
        &format!("type parameters for method '{}.{}'", class.name, method.name),
    )?;
    let method_type_params = visible_type_params(class, Some(method));
    let method_annotations = validate_annotation_uses(
        &method.annotations,
        AnnotationTargetKind::Method,
        &format!("method '{}.{}'", class.name, method.name),
        &class_context.package_name,
        &class_context.imports,
        simple_to_fqcns,
        fqcn_names,
        declared_annotation_fqcns,
    )?;
    let has_override_annotation = method_annotations.contains("Override");
    let has_not_null_annotation = method_annotations.contains("NotNull");
    let has_test_annotation = method_annotations.contains("Test");
    let signature = method_signature_key(method);
    if !method_signatures.insert(signature.clone()) {
        return Err(semantic_error(format!(
            "Duplicate method signature '{}' in class '{}'",
            signature, class.name
        )));
    }

    validate_modifiers(
        &method.modifiers,
        &format!("method '{}.{}'", class.name, method.name),
    )?;
    let supported_method_modifiers: &[Modifier] = if class.is_interface {
        &[
            Modifier::Public,
            Modifier::Private,
            Modifier::Static,
            Modifier::Abstract,
            Modifier::Default,
        ]
    } else {
        &[
            Modifier::Public,
            Modifier::Private,
            Modifier::Protected,
            Modifier::Static,
            Modifier::Abstract,
            Modifier::Final,
        ]
    };
    validate_supported_modifiers(
        &method.modifiers,
        supported_method_modifiers,
        &format!("method '{}.{}'", class.name, method.name),
    )?;

    if method.is_constructor && method.name != class.name {
        return Err(semantic_error(format!(
            "Constructor '{}' must match class name '{}'",
            method.name, class.name
        )));
    }

    let interface_is_private = class.is_interface && method.modifiers.contains(&Modifier::Private);
    let interface_is_static = class.is_interface && method.modifiers.contains(&Modifier::Static);
    let interface_is_default = class.is_interface && method.modifiers.contains(&Modifier::Default);
    let interface_is_abstract = class.is_interface
        && !interface_is_private
        && !interface_is_static
        && !interface_is_default
        && !method.has_body;

    for param in &method.params {
        validate_type_exists_in_scope(
            &param.ty,
            &class_context.package_name,
            &class_context.imports,
            simple_to_fqcns,
            fqcn_names,
            declared_generic_arity,
            &method_type_params,
            &format!("parameter '{}.{}({})'", class.name, method.name, param.name),
        )?;
    }
    let canonical_param_types = method
        .params
        .iter()
        .map(|p| {
            canonicalize_type_name_in_scope(
                &p.ty,
                &class_context.package_name,
                &class_context.imports,
                simple_to_fqcns,
                fqcn_names,
                declared_generic_arity,
                &method_type_params,
            )
        })
        .collect::<Result<Vec<_>, _>>()?;
    let canonical_throws = method
        .throws
        .iter()
        .map(|throw_ty| {
            validate_type_exists_in_scope(
                throw_ty,
                &class_context.package_name,
                &class_context.imports,
                simple_to_fqcns,
                fqcn_names,
                declared_generic_arity,
                &method_type_params,
                &format!("throws clause for '{}.{}'", class.name, method.name),
            )?;
            let canonical = canonicalize_type_name_in_scope(
                throw_ty,
                &class_context.package_name,
                &class_context.imports,
                simple_to_fqcns,
                fqcn_names,
                declared_generic_arity,
                &method_type_params,
            )?;
            Ok(canonical)
        })
        .collect::<Result<Vec<_>, SemanticError>>()?;

    if method.is_constructor {
        if has_override_annotation {
            return Err(semantic_error(format!(
                "Annotation '@Override' is not allowed on constructor '{}.{}'",
                class.name, method.name
            )));
        }
        constructors.push(ConstructorSignature {
            param_types: canonical_param_types.clone(),
            declared_throws: canonical_throws,
            is_varargs: method.params.last().map(|p| p.is_varargs).unwrap_or(false),
        });
    } else {
        let return_type = method.return_type.as_deref().ok_or_else(|| {
            semantic_error(format!(
                "Method '{}.{}' is missing a return type",
                class.name, method.name
            ))
        })?;

        validate_type_exists_in_scope(
            return_type,
            &class_context.package_name,
            &class_context.imports,
            simple_to_fqcns,
            fqcn_names,
            declared_generic_arity,
            &method_type_params,
            &format!("method return '{}.{}'", class.name, method.name),
        )?;
        let canonical_return_type = canonicalize_type_name_in_scope(
            return_type,
            &class_context.package_name,
            &class_context.imports,
            simple_to_fqcns,
            fqcn_names,
            declared_generic_arity,
            &method_type_params,
        )?;
        let override_return_type = canonical_return_type.clone();

        methods
            .entry(method.name.clone())
            .or_default()
            .push(MethodSignature {
                type_params: method.type_params.clone(),
                param_types: canonical_param_types.clone(),
                return_type: canonical_return_type,
                declared_throws: canonical_throws,
                is_varargs: method.params.last().map(|p| p.is_varargs).unwrap_or(false),
                is_static: method.modifiers.contains(&Modifier::Static),
                is_final: method.modifiers.contains(&Modifier::Final),
                is_abstract: if class.is_interface {
                    interface_is_abstract
                } else {
                    method.modifiers.contains(&Modifier::Abstract)
                },
                visibility: visibility_from_modifiers(&method.modifiers),
            });

        if has_override_annotation {
            if method.modifiers.contains(&Modifier::Static) {
                return Err(semantic_error(format!(
                    "Annotation '@Override' is not allowed on static method '{}.{}'",
                    class.name, method.name
                )));
            }
            override_requirements.push(OverrideRequirement {
                class_fqcn: class_fqcn.to_string(),
                class_name: class.name.clone(),
                method_name: method.name.clone(),
                param_types: canonical_param_types,
                return_type: override_return_type,
            });
        }

        if has_not_null_annotation {
            validate_not_null_type_target(
                return_type,
                &format!("method '{}.{}'", class.name, method.name),
            )?;
        }

        if has_test_annotation {
            validate_test_annotation(method, class)?;
        }
    }

    if class.is_interface {
        if method.modifiers.contains(&Modifier::Protected) {
            return Err(semantic_error(format!(
                "Interface method '{}.{}' cannot be protected",
                class.name, method.name
            )));
        }
        if method.modifiers.contains(&Modifier::Final) {
            return Err(semantic_error(format!(
                "Interface method '{}.{}' cannot be final",
                class.name, method.name
            )));
        }
        if interface_is_default {
            if interface_is_private || interface_is_static || method.modifiers.contains(&Modifier::Abstract) {
                return Err(semantic_error(format!(
                    "Default interface method '{}.{}' cannot be private, static, or abstract",
                    class.name, method.name
                )));
            }
            if !method.has_body {
                return Err(semantic_error(format!(
                    "Default interface method '{}.{}' must declare a body",
                    class.name, method.name
                )));
            }
        } else if interface_is_private {
            if method.modifiers.contains(&Modifier::Abstract) {
                return Err(semantic_error(format!(
                    "Private interface method '{}.{}' cannot be abstract",
                    class.name, method.name
                )));
            }
            if !method.has_body {
                return Err(semantic_error(format!(
                    "Private interface method '{}.{}' must declare a body",
                    class.name, method.name
                )));
            }
        } else if interface_is_static {
            if method.modifiers.contains(&Modifier::Abstract) {
                return Err(semantic_error(format!(
                    "Static interface method '{}.{}' cannot be abstract",
                    class.name, method.name
                )));
            }
            if !method.has_body {
                return Err(semantic_error(format!(
                    "Static interface method '{}.{}' must declare a body",
                    class.name, method.name
                )));
            }
        } else if method.has_body {
            return Err(semantic_error(format!(
                "Interface instance method '{}.{}' with a body must use the 'default' modifier",
                class.name, method.name
            )));
        }
    }

    if method.modifiers.contains(&Modifier::Abstract) {
        if method.is_constructor {
            return Err(semantic_error(format!(
                "Constructor '{}.{}' cannot be abstract",
                class.name, method.name
            )));
        }
        if !class.modifiers.contains(&Modifier::Abstract) && !class.is_interface {
            return Err(semantic_error(format!(
                "Class '{}' must be abstract to declare abstract method '{}'",
                class.name, method.name
            )));
        }
        if class.is_interface {
            if interface_is_private
                || interface_is_static
                || method.modifiers.contains(&Modifier::Final)
                || interface_is_default
            {
                return Err(semantic_error(format!(
                    "Interface abstract method '{}.{}' cannot be private, static, default, or final",
                    class.name, method.name
                )));
            }
        } else if method.modifiers.contains(&Modifier::Private)
            || method.modifiers.contains(&Modifier::Static)
            || method.modifiers.contains(&Modifier::Final)
        {
            return Err(semantic_error(format!(
                "Abstract method '{}.{}' cannot be private, static, or final",
                class.name, method.name
            )));
        }
        if method.has_body {
            return Err(semantic_error(format!(
                "Abstract method '{}.{}' must not have a body",
                class.name, method.name
            )));
        }
    } else if !method.has_body {
        return Err(semantic_error(format!(
            "Non-abstract method '{}.{}' must declare a body",
            class.name, method.name
        )));
    }

    if !class.is_interface && !method.is_constructor && method.name == "main" {
        validate_main_signature(method, &class.name)?;
        *entrypoint_count += 1;
    }

    if method.is_constructor {
        if has_test_annotation {
            return Err(semantic_error(format!(
                "Annotation '@Test' is not allowed on constructor '{}.{}'",
                class.name, method.name
            )));
        }
        if has_not_null_annotation {
            return Err(semantic_error(format!(
                "Annotation '@NotNull' is not allowed on constructor '{}.{}'",
                class.name, method.name
            )));
        }
    }

    Ok(())
}
