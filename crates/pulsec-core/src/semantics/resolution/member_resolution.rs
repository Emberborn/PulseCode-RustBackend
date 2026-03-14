use super::*;

pub(super) fn validate_target_mutability(
    target: &Expr,
    class: &ClassDecl,
    class_info: &ClassInfo,
    class_names: &HashSet<String>,
    class_index: &HashMap<String, ClassInfo>,
    fqcn_to_class: &HashMap<String, String>,
    imports: &[ImportDecl],
    locals: &HashMap<String, String>,
    in_static_context: bool,
) -> Result<(), SemanticError> {
    let fail_for_field = |owner_fqcn: &str, field_name: &str, field: &FieldInfo| {
        let owner_display = class_index
            .get(owner_fqcn)
            .map(|i| i.simple_name.clone())
            .unwrap_or_else(|| class_simple_name(owner_fqcn).to_string());
        if field.is_runtime_managed {
            return Err(semantic_error(format!(
                "Cannot assign to runtime-managed field '{}.{}'",
                owner_display, field_name
            )));
        }
        if field.is_final {
            return Err(semantic_error(format!(
                "Cannot assign to final field '{}.{}'",
                owner_display, field_name
            )));
        }
        Ok(())
    };

    match target {
        Expr::Var(name) => {
            if locals.contains_key(name) {
                return Ok(());
            }
            let current_fqcn = format!("{}.{}", class_info.package_name, class.name);
            if let Some((owner, field)) =
                lookup_field_in_hierarchy(&current_fqcn, name, class_index)
            {
                fail_for_field(&owner, name, &field)?;
            }
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
            let owner = owner_class(&receiver, class_names)?;
            if receiver.kind == ExprKind::ClassRef {
                if let Some(owner_info) = class_index.get(&owner) {
                    if owner_info.is_enum
                        && owner_info
                            .enum_constants
                            .iter()
                            .any(|constant| constant == member)
                    {
                        return Err(semantic_error(format!(
                            "Cannot assign to enum constant '{}.{}'",
                            owner_info.simple_name, member
                        )));
                    }
                }
            }
            if let Some((field_owner, field)) =
                lookup_field_in_hierarchy(&owner, member, class_index)
            {
                fail_for_field(&field_owner, member, &field)?;
            }
        }
        Expr::ArrayAccess { .. } => {}
        _ => {}
    }

    Ok(())
}
