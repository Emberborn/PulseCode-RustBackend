use super::*;

pub(super) fn infer_null_state_from_assignment(
    target_ty: &str,
    value_ty: &str,
    class_names: &HashSet<String>,
) -> NullState {
    if !is_nullable_type(target_ty, class_names) {
        return NullState::Unknown;
    }

    if value_ty == "null" {
        NullState::Null
    } else {
        NullState::NonNull
    }
}

pub(super) fn apply_null_flow_narrowing(
    condition: &Expr,
    then_state: &mut HashMap<String, NullState>,
    else_state: &mut HashMap<String, NullState>,
) {
    if let Some((name, then_non_null)) = null_narrow_target(condition) {
        then_state.insert(
            name.clone(),
            if then_non_null {
                NullState::NonNull
            } else {
                NullState::Null
            },
        );
        else_state.insert(
            name,
            if then_non_null {
                NullState::Null
            } else {
                NullState::NonNull
            },
        );
    }
}

pub(super) fn null_narrow_target(condition: &Expr) -> Option<(String, bool)> {
    match condition {
        Expr::Binary { left, op, right } => match (left.as_ref(), right.as_ref(), op) {
            (Expr::Var(name), Expr::NullLiteral, BinaryOp::NotEq)
            | (Expr::NullLiteral, Expr::Var(name), BinaryOp::NotEq) => {
                Some((name.clone(), true))
            }
            (Expr::Var(name), Expr::NullLiteral, BinaryOp::Eq)
            | (Expr::NullLiteral, Expr::Var(name), BinaryOp::Eq) => Some((name.clone(), false)),
            _ => None,
        },
        _ => None,
    }
}

pub(super) fn merge_null_state(
    original: &HashMap<String, NullState>,
    then_state: &HashMap<String, NullState>,
    else_state: Option<&HashMap<String, NullState>>,
) -> HashMap<String, NullState> {
    let Some(else_state) = else_state else {
        return original.clone();
    };

    let mut out = HashMap::new();
    for key in original.keys() {
        let then_value = then_state.get(key).copied().unwrap_or(NullState::Unknown);
        let else_value = else_state.get(key).copied().unwrap_or(NullState::Unknown);
        out.insert(
            key.clone(),
            if then_value == else_value {
                then_value
            } else {
                NullState::Unknown
            },
        );
    }
    out
}

pub(super) fn merge_null_states(
    original: &HashMap<String, NullState>,
    states: &[&HashMap<String, NullState>],
) -> HashMap<String, NullState> {
    if states.is_empty() {
        return original.clone();
    }

    let mut out = HashMap::new();
    for key in original.keys() {
        let first = states[0].get(key).copied().unwrap_or(NullState::Unknown);
        let merged = if states
            .iter()
            .skip(1)
            .all(|state| state.get(key).copied().unwrap_or(NullState::Unknown) == first)
        {
            first
        } else {
            NullState::Unknown
        };
        out.insert(key.clone(), merged);
    }
    out
}

pub(super) fn validate_null_deref(
    expr: &Expr,
    null_state: &HashMap<String, NullState>,
) -> Result<(), SemanticError> {
    match expr {
        Expr::MemberAccess { object, .. } => {
            if let Expr::Var(name) = object.as_ref() {
                if matches!(null_state.get(name), Some(NullState::Null)) {
                    return Err(semantic_error(format!(
                        "Definite null dereference on variable '{}'",
                        name
                    )));
                }
            }
            validate_null_deref(object, null_state)?;
        }
        Expr::ArrayAccess { array, index } => {
            if let Expr::Var(name) = array.as_ref() {
                if matches!(null_state.get(name), Some(NullState::Null)) {
                    return Err(semantic_error(format!(
                        "Definite null dereference on variable '{}'",
                        name
                    )));
                }
            }
            validate_null_deref(array, null_state)?;
            validate_null_deref(index, null_state)?;
        }
        Expr::Call { callee, args } => {
            validate_null_deref(callee, null_state)?;
            for arg in args {
                validate_null_deref(arg, null_state)?;
            }
        }
        Expr::NewObject { args, .. } => {
            for arg in args {
                validate_null_deref(arg, null_state)?;
            }
        }
        Expr::Unary { expr, .. } => validate_null_deref(expr, null_state)?,
        Expr::Cast { expr, .. } => validate_null_deref(expr, null_state)?,
        Expr::InstanceOf { expr, .. } => validate_null_deref(expr, null_state)?,
        Expr::Binary { left, right, .. } => {
            validate_null_deref(left, null_state)?;
            validate_null_deref(right, null_state)?;
        }
        Expr::Conditional {
            condition,
            then_expr,
            else_expr,
        } => {
            validate_null_deref(condition, null_state)?;
            validate_null_deref(then_expr, null_state)?;
            validate_null_deref(else_expr, null_state)?;
        }
        Expr::NewArray { lengths, .. } => {
            for length in lengths {
                validate_null_deref(length, null_state)?;
            }
        }
        Expr::NewArrayInitialized { values, .. } => {
            for value in values {
                validate_array_init_null_deref(value, null_state)?;
            }
        }
        Expr::IncDec { target, .. } => validate_null_deref(target, null_state)?,
        _ => {}
    }

    Ok(())
}

fn validate_array_init_null_deref(
    value: &crate::ArrayInitExpr,
    null_state: &HashMap<String, NullState>,
) -> Result<(), SemanticError> {
    match value {
        crate::ArrayInitExpr::Expr(expr) => validate_null_deref(expr, null_state),
        crate::ArrayInitExpr::Nested(values) => {
            for nested in values {
                validate_array_init_null_deref(nested, null_state)?;
            }
            Ok(())
        }
    }
}

