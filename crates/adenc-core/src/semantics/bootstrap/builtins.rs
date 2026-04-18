use super::*;
use std::fs;
use std::path::{Path, PathBuf};

pub(super) fn inject_builtin_library_symbols(
    class_names: &mut HashSet<String>,
    fqcn_names: &mut HashSet<String>,
    simple_to_fqcns: &mut HashMap<String, Vec<String>>,
    class_index: &mut HashMap<String, ClassInfo>,
) -> Result<(), SemanticError> {
    let stdlib_classes = load_stdlib_class_info()?;

    for (fqcn, info) in stdlib_classes {
        class_names.insert(fqcn.clone());
        class_names.insert(info.simple_name.clone());
        fqcn_names.insert(fqcn.clone());
        simple_to_fqcns
            .entry(info.simple_name.clone())
            .or_default()
            .push(fqcn.clone());

        class_index.insert(fqcn.clone(), info.clone());
        class_index.entry(info.simple_name.clone()).or_insert(info);
    }

    for values in simple_to_fqcns.values_mut() {
        values.sort();
        values.dedup();
    }

    Ok(())
}

fn load_stdlib_class_info() -> Result<Vec<(String, ClassInfo)>, SemanticError> {
    let stdlib_root = stdlib_source_root();
    let mut files = Vec::new();
    collect_aden_files(stdlib_root.as_path(), &mut files)?;
    files.sort();

    let mut programs = Vec::new();
    for path in files {
        let src = fs::read_to_string(&path).map_err(|err| {
            semantic_error(format!(
                "Failed to read stdlib source '{}': {err}",
                path.display()
            ))
        })?;
        let program = crate::parse(&src).map_err(|err| {
            semantic_error(format!(
                "Failed to parse stdlib source '{}': {}",
                path.display(),
                err
            ))
        })?;
        programs.push(program);
    }

    let mut fqcn_names = HashSet::new();
    let mut simple_to_fqcns: HashMap<String, Vec<String>> = HashMap::new();
    let mut declared_generic_arity = HashMap::new();

    for program in &programs {
        for class in &program.classes {
            let fqcn = format!("{}.{}", program.package.name, class.name);
            fqcn_names.insert(fqcn.clone());
            simple_to_fqcns
                .entry(class.name.clone())
                .or_default()
                .push(fqcn.clone());
            declared_generic_arity.insert(fqcn, class.type_params.len());
        }
    }

    for values in simple_to_fqcns.values_mut() {
        values.sort();
        values.dedup();
    }

    let mut out = Vec::new();
    for program in &programs {
        let current_package = &program.package.name;
        for class in &program.classes {
            let class_type_params = class.type_params.iter().cloned().collect::<HashSet<_>>();
            let fqcn = format!("{}.{}", current_package, class.name);
            let super_class = class
                .extends
                .as_deref()
                .map(|name| {
                    canonicalize_type_name_in_scope(
                        name,
                        current_package,
                        &program.imports,
                        &simple_to_fqcns,
                        &fqcn_names,
                        &declared_generic_arity,
                        &class_type_params,
                    )
                })
                .transpose()?;
            let interfaces = class
                .implements
                .iter()
                .map(|name| {
                    canonicalize_type_name_in_scope(
                        name,
                        current_package,
                        &program.imports,
                        &simple_to_fqcns,
                        &fqcn_names,
                        &declared_generic_arity,
                        &class_type_params,
                    )
                })
                .collect::<Result<Vec<_>, _>>()?;

            let mut fields = HashMap::new();
            let mut methods: HashMap<String, Vec<MethodSignature>> = HashMap::new();
            let mut constructors = Vec::new();

            for member in &class.members {
                match member {
                    ClassMember::Field(field) => {
                        let field_ty = canonicalize_type_name_in_scope(
                            field.ty.as_str(),
                            current_package,
                            &program.imports,
                            &simple_to_fqcns,
                            &fqcn_names,
                            &declared_generic_arity,
                            &class_type_params,
                        )?;
                        fields.insert(
                            field.name.clone(),
                            FieldInfo {
                                ty: field_ty,
                                is_static: field.modifiers.contains(&Modifier::Static),
                                is_final: field.modifiers.contains(&Modifier::Final),
                                is_not_null: has_annotation(&field.annotations, "NotNull"),
                                is_runtime_managed: fqcn == "aden.lang.System"
                                    && field.name == "out",
                                visibility: visibility_from_modifiers(&field.modifiers),
                            },
                        );
                    }
                    ClassMember::Method(method) => {
                        let method_type_params = visible_type_params(class, Some(method));
                        let param_types = method
                            .params
                            .iter()
                            .map(|param| {
                                canonicalize_type_name_in_scope(
                                    param.ty.as_str(),
                                    current_package,
                                    &program.imports,
                                    &simple_to_fqcns,
                                    &fqcn_names,
                                    &declared_generic_arity,
                                    &method_type_params,
                                )
                            })
                            .collect::<Result<Vec<_>, _>>()?;
                        if method.is_constructor {
                            constructors.push(ConstructorSignature {
                                param_types,
                                declared_throws: Vec::new(),
                                is_varargs: method
                                    .params
                                    .last()
                                    .map(|p| p.is_varargs)
                                    .unwrap_or(false),
                            });
                            continue;
                        }

                        let return_type = canonicalize_type_name_in_scope(
                            method.return_type.as_deref().unwrap_or("void"),
                            current_package,
                            &program.imports,
                            &simple_to_fqcns,
                            &fqcn_names,
                            &declared_generic_arity,
                            &method_type_params,
                        )?;
                        methods
                            .entry(method.name.clone())
                            .or_default()
                            .push(MethodSignature {
                                type_params: method.type_params.clone(),
                                param_types,
                                return_type,
                                declared_throws: Vec::new(),
                                is_varargs: false,
                                is_static: method.modifiers.contains(&Modifier::Static),
                                is_final: method.modifiers.contains(&Modifier::Final),
                                is_abstract: if class.is_interface {
                                    !method.has_body
                                        && !method.modifiers.contains(&Modifier::Static)
                                        && !method.modifiers.contains(&Modifier::Private)
                                        && !method.modifiers.contains(&Modifier::Default)
                                } else {
                                    method.modifiers.contains(&Modifier::Abstract)
                                },
                                visibility: visibility_from_modifiers(&method.modifiers),
                            });
                    }
                }
            }

            out.push((
                fqcn,
                augment_runtime_bootstrap_surface(ClassInfo {
                    simple_name: class.name.clone(),
                    package_name: current_package.clone(),
                    type_params: class.type_params.clone(),
                    super_class,
                    interfaces,
                    is_interface: class.is_interface,
                    is_enum: class.is_enum,
                    is_abstract: class.modifiers.contains(&Modifier::Abstract)
                        || class.is_interface,
                    is_final: class.modifiers.contains(&Modifier::Final),
                    enum_constants: class.enum_constants.clone(),
                    generic_arity: class.type_params.len(),
                    fields,
                    methods,
                    constructors,
                }),
            ));
        }
    }

    Ok(out)
}

fn collect_aden_files(dir: &Path, files: &mut Vec<PathBuf>) -> Result<(), SemanticError> {
    for entry in fs::read_dir(dir).map_err(|err| {
        semantic_error(format!(
            "Failed to enumerate stdlib directory '{}': {err}",
            dir.display()
        ))
    })? {
        let entry = entry.map_err(|err| {
            semantic_error(format!(
                "Failed to read stdlib directory entry under '{}': {err}",
                dir.display()
            ))
        })?;
        let path = entry.path();
        if path.is_dir() {
            collect_aden_files(path.as_path(), files)?;
        } else if path.extension().and_then(|ext| ext.to_str()) == Some("aden") {
            files.push(path);
        }
    }
    Ok(())
}

fn stdlib_source_root() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..")
        .join("stdlib")
        .join("src")
        .join("aden")
}

fn has_annotation(annotations: &[crate::Annotation], expected_simple_name: &str) -> bool {
    annotations
        .iter()
        .any(|annotation| annotation_simple_name(annotation.name.as_str()) == expected_simple_name)
}

fn augment_runtime_bootstrap_surface(mut info: ClassInfo) -> ClassInfo {
    match info.simple_name.as_str() {
        "ConsoleWriter" => {
            augment_console_methods(&mut info.methods, false, true);
        }
        "PrintStream" => {
            augment_console_methods(&mut info.methods, false, false);
        }
        "IO" => {
            augment_console_methods(&mut info.methods, true, false);
        }
        _ => {}
    }
    info
}

fn augment_console_methods(
    methods: &mut HashMap<String, Vec<MethodSignature>>,
    is_static: bool,
    is_abstract: bool,
) {
    for name in ["println", "print"] {
        let entry = methods.entry(name.to_string()).or_default();
        for ty in ["long", "float", "double", "char"] {
            if entry
                .iter()
                .any(|method| method.param_types == [ty.to_string()])
            {
                continue;
            }
            entry.push(console_method_signature(ty, is_static, is_abstract));
        }
    }
}

fn console_method_signature(param_ty: &str, is_static: bool, is_abstract: bool) -> MethodSignature {
    MethodSignature {
        type_params: Vec::new(),
        param_types: vec![param_ty.to_string()],
        return_type: "void".to_string(),
        declared_throws: Vec::new(),
        is_varargs: false,
        is_static,
        is_final: false,
        is_abstract,
        visibility: MemberVisibility::Public,
    }
}
