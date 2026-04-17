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
    allow_constructor_final_init: bool,
) -> Result<(), SemanticError> {
    let current_fqcn = format!("{}.{}", class_info.package_name, class.name);
    let can_initialize_final = |owner_fqcn: &str, field_name: &str, target_expr: &Expr| {
        if !allow_constructor_final_init || owner_fqcn != current_fqcn {
            return false;
        }
        match target_expr {
            Expr::Var(name) => name == field_name,
            Expr::MemberAccess { object, member } => {
                matches!(object.as_ref(), Expr::This) && member == field_name
            }
            _ => false,
        }
    };
    let fail_for_field =
        |owner_fqcn: &str, field_name: &str, field: &FieldInfo, target_expr: &Expr| {
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
                if can_initialize_final(owner_fqcn, field_name, target_expr) {
                    return Ok(());
                }
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
            if let Some((owner, field)) =
                lookup_field_in_hierarchy(&current_fqcn, name, class_index)
            {
                fail_for_field(&owner, name, &field, target)?;
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
                fail_for_field(&field_owner, member, &field, target)?;
            }
        }
        Expr::ArrayAccess { .. } => {}
        _ => {}
    }

    Ok(())
}
