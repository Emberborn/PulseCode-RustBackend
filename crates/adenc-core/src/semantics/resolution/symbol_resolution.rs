use super::*;

fn current_class_self_type(class: &ClassDecl, class_info: &ClassInfo) -> String {
    let fqcn = format!("{}.{}", class_info.package_name, class.name);
    if class_info.type_params.is_empty() {
        fqcn
    } else {
        format!("{}<{}>", fqcn, class_info.type_params.join(", "))
    }
}

pub(super) fn expr_dotted_name(expr: &Expr) -> Option<String> {
    match expr {
        Expr::Var(name) => Some(name.clone()),
        Expr::MemberAccess { object, member } => {
            let mut path = expr_dotted_name(object.as_ref())?;
            path.push('.');
            path.push_str(member);
            Some(path)
        }
        _ => None,
    }
}

pub(super) fn resolve_qualified_class_receiver(
    expr: &Expr,
    class: &ClassDecl,
    class_info: &ClassInfo,
    class_index: &HashMap<String, ClassInfo>,
    imports: &[ImportDecl],
    locals: &HashMap<String, String>,
) -> Result<Option<ExprType>, SemanticError> {
    let Some(path) = expr_dotted_name(expr) else {
        return Ok(None);
    };
    let Some(root) = path.split('.').next() else {
        return Ok(None);
    };

    if locals.contains_key(root) {
        return Ok(None);
    }

    let current_class_fqcn = format!("{}.{}", class_info.package_name, class.name);
    if lookup_field_in_hierarchy(&current_class_fqcn, root, class_index).is_some() {
        return Ok(None);
    }

    if let Some(class_fqcn) =
        resolve_class_fqcn(&path, &class_info.package_name, imports, class_index)?
    {
        return Ok(Some(class_ref_type(&class_fqcn)));
    }

    Ok(None)
}

pub(super) fn resolve_var_or_class(
    name: &str,
    class: &ClassDecl,
    class_info: &ClassInfo,
    _class_names: &HashSet<String>,
    class_index: &HashMap<String, ClassInfo>,
    fqcn_to_class: &HashMap<String, String>,
    imports: &[ImportDecl],
    locals: &HashMap<String, String>,
    in_static_context: bool,
) -> Result<ExprType, SemanticError> {
    if name == "this" {
        return Ok(value_type(&current_class_self_type(class, class_info)));
    }

    if let Some(local_ty) = locals.get(name) {
        return Ok(value_type(local_ty));
    }

    let current_class_fqcn = format!("{}.{}", class_info.package_name, class.name);
    if let Some((_owner_fqcn, field)) =
        lookup_field_in_hierarchy(&current_class_fqcn, name, class_index)
    {
        if in_static_context && !field.is_static {
            return Err(semantic_error(format!(
                "Cannot access instance field '{}.{}' from static context",
                class.name, name
            )));
        }
        return Ok(value_type(&field.ty));
    }

    if let Some(class_fqcn) =
        resolve_class_fqcn(name, &class_info.package_name, imports, class_index)?
    {
        return Ok(class_ref_type(&class_fqcn));
    }

    if let Some(field_ty) = resolve_imported_static_field(
        name,
        &class.name,
        &current_class_fqcn,
        &class_info.package_name,
        class_index,
        fqcn_to_class,
        imports,
    )? {
        return Ok(value_type(&field_ty));
    }

    Err(semantic_error(format!(
        "Unknown symbol '{}' in class '{}'",
        name, class.name
    )))
}
