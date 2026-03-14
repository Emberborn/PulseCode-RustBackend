use super::*;

pub(super) fn annotation_simple_name(name: &str) -> &str {
    name.rsplit('.').next().unwrap_or(name)
}

pub(super) fn annotation_spec(simple_name: &str) -> Option<AnnotationSpec> {
    match simple_name {
        "Override" => Some(AnnotationSpec {
            simple_name: "Override",
            targets: &[AnnotationTargetKind::Method],
        }),
        "NotNull" => Some(AnnotationSpec {
            simple_name: "NotNull",
            targets: &[AnnotationTargetKind::Field, AnnotationTargetKind::Method],
        }),
        "Test" => Some(AnnotationSpec {
            simple_name: "Test",
            targets: &[AnnotationTargetKind::Method],
        }),
        _ => None,
    }
}

pub(super) fn validate_annotation_uses(
    annotations: &[crate::Annotation],
    target: AnnotationTargetKind,
    context: &str,
    current_package: &str,
    imports: &[ImportDecl],
    simple_to_fqcns: &HashMap<String, Vec<String>>,
    fqcn_names: &HashSet<String>,
    declared_annotation_fqcns: &HashSet<String>,
) -> Result<HashSet<String>, SemanticError> {
    let mut seen = HashSet::new();
    for annotation in annotations {
        let simple = annotation_simple_name(annotation.name.as_str());
        if let Some(spec) = annotation_spec(simple) {
            if !spec.targets.contains(&target) {
                return Err(semantic_error(format!(
                    "Annotation '@{}' is not allowed on {}",
                    annotation.name, context
                )));
            }
            if !seen.insert(spec.simple_name.to_string()) {
                return Err(semantic_error(format!(
                    "Duplicate annotation '@{}' on {}",
                    annotation.name, context
                )));
            }
            continue;
        }

        let canonical = canonicalize_type_name(
            annotation.name.as_str(),
            current_package,
            imports,
            simple_to_fqcns,
            fqcn_names,
        )
        .map_err(|_| {
            semantic_error(format!(
                "Unknown annotation '@{}' on {}",
                annotation.name, context
            ))
        })?;
        if !declared_annotation_fqcns.contains(&canonical) {
            return Err(semantic_error(format!(
                "Type '{}' used as annotation on {} is not an annotation declaration",
                annotation.name, context
            )));
        }
        if !seen.insert(simple.to_string()) {
            return Err(semantic_error(format!(
                "Duplicate annotation '@{}' on {}",
                annotation.name, context
            )));
        }
    }
    Ok(seen)
}

pub(super) fn validate_not_null_type_target(ty: &str, context: &str) -> Result<(), SemanticError> {
    if is_primitive_non_void(ty) || class_simple_name(ty) == "void" {
        return Err(semantic_error(format!(
            "Annotation '@NotNull' is not meaningful on primitive/void type '{}' in {}",
            ty, context
        )));
    }
    Ok(())
}

pub(super) fn validate_test_annotation(method: &MethodDecl, class: &ClassDecl) -> Result<(), SemanticError> {
    if !method.modifiers.contains(&Modifier::Public) || !method.modifiers.contains(&Modifier::Static)
    {
        return Err(semantic_error(format!(
            "Annotation '@Test' requires method '{}.{}' to be public static",
            class.name, method.name
        )));
    }
    if method.return_type.as_deref() != Some("void") {
        return Err(semantic_error(format!(
            "Annotation '@Test' requires method '{}.{}' to return void",
            class.name, method.name
        )));
    }
    if !method.params.is_empty() {
        return Err(semantic_error(format!(
            "Annotation '@Test' requires method '{}.{}' to declare no parameters",
            class.name, method.name
        )));
    }
    if !method.has_body {
        return Err(semantic_error(format!(
            "Annotation '@Test' requires method '{}.{}' to declare a body",
            class.name, method.name
        )));
    }
    Ok(())
}

pub(super) fn validate_not_null_value(
    expr: &Expr,
    null_state: &HashMap<String, NullState>,
    context: &str,
) -> Result<(), SemanticError> {
    match expr {
        Expr::NullLiteral => Err(semantic_error(format!(
            "Annotation '@NotNull' forbids null in {}",
            context
        ))),
        Expr::Var(name) if matches!(null_state.get(name), Some(NullState::Null)) => {
            Err(semantic_error(format!(
                "Annotation '@NotNull' forbids nullable value '{}' in {}",
                name, context
            )))
        }
        _ => Ok(()),
    }
}

pub(super) fn validate_not_null_assignment_target(
    target: &Expr,
    value: &Expr,
    class: &ClassDecl,
    class_info: &ClassInfo,
    class_names: &HashSet<String>,
    class_index: &HashMap<String, ClassInfo>,
    fqcn_to_class: &HashMap<String, String>,
    imports: &[ImportDecl],
    locals: &HashMap<String, String>,
    in_static_context: bool,
    null_state: &HashMap<String, NullState>,
    context: &str,
) -> Result<(), SemanticError> {
    if !target_requires_not_null(
        target,
        class,
        class_info,
        class_names,
        class_index,
        fqcn_to_class,
        imports,
        locals,
        in_static_context,
    )? {
        return Ok(());
    }
    validate_not_null_value(value, null_state, context)
}

pub(super) fn target_requires_not_null(
    target: &Expr,
    class: &ClassDecl,
    class_info: &ClassInfo,
    class_names: &HashSet<String>,
    class_index: &HashMap<String, ClassInfo>,
    fqcn_to_class: &HashMap<String, String>,
    imports: &[ImportDecl],
    locals: &HashMap<String, String>,
    in_static_context: bool,
) -> Result<bool, SemanticError> {
    match target {
        Expr::Var(name) => Ok(class_info
            .fields
            .get(name.as_str())
            .map(|field| field.is_not_null)
            .unwrap_or(false)),
        Expr::MemberAccess { object, member } => {
            let object_ty = infer_expr_type(
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
            let owner_name = match object_ty.kind {
                ExprKind::ClassRef => object_ty.ty.clone(),
                ExprKind::Value => object_ty.ty.clone(),
            };
            Ok(class_index
                .get(owner_name.as_str())
                .and_then(|owner| owner.fields.get(member.as_str()))
                .map(|field| field.is_not_null)
                .unwrap_or(false))
        }
        _ => Ok(false),
    }
}

