use super::*;

pub(super) fn validate_modifiers(modifiers: &[Modifier], context: &str) -> Result<(), SemanticError> {
    let mut seen = HashSet::new();
    for modifier in modifiers {
        if !seen.insert(*modifier) {
            return Err(semantic_error(format!(
                "Duplicate modifier '{}' on {}",
                modifier_name(*modifier),
                context
            )));
        }
    }

    let visibility = modifiers
        .iter()
        .filter(|m| matches!(m, Modifier::Public | Modifier::Private | Modifier::Protected))
        .count();

    if visibility > 1 {
        return Err(semantic_error(format!(
            "Conflicting visibility modifiers on {}",
            context
        )));
    }

    Ok(())
}

pub(super) fn validate_supported_modifiers(
    modifiers: &[Modifier],
    supported: &[Modifier],
    context: &str,
) -> Result<(), SemanticError> {
    for modifier in modifiers {
        if !supported.contains(modifier) {
            return Err(semantic_error(format!(
                "Modifier '{}' is reserved but not supported on {} yet",
                modifier_name(*modifier),
                context
            )));
        }
    }
    Ok(())
}

pub(super) fn validate_main_signature(method: &MethodDecl, class_name: &str) -> Result<(), SemanticError> {
    let has_public = method.modifiers.contains(&Modifier::Public);
    let has_static = method.modifiers.contains(&Modifier::Static);

    if !has_public || !has_static {
        return Err(semantic_error(format!(
            "Entry method '{}.main' must be 'public static'",
            class_name
        )));
    }

    if method.return_type.as_deref() != Some("void") {
        return Err(semantic_error(format!(
            "Entry method '{}.main' must return void",
            class_name
        )));
    }

    if method.params.is_empty() {
        return Ok(());
    }

    if method.params.len() == 1 && method.params[0].ty == "String[]" {
        return Ok(());
    }

    Err(semantic_error(format!(
        "Entry method '{}.main' accepts no args or exactly one 'String[] args' parameter",
        class_name
    )))
}
