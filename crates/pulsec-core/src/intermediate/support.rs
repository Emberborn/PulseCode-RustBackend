use crate::{BinaryOp, ClassContext, Expr, MethodDecl, Program, UnaryOp};
use std::collections::{HashMap, HashSet};

use super::{IrBinaryOp, IrFieldInit};

pub(super) fn lower_binary_op(op: BinaryOp) -> IrBinaryOp {
    match op {
        BinaryOp::Add => IrBinaryOp::Add,
        BinaryOp::Sub => IrBinaryOp::Sub,
        BinaryOp::Mul => IrBinaryOp::Mul,
        BinaryOp::Div => IrBinaryOp::Div,
        BinaryOp::Eq => IrBinaryOp::Eq,
        BinaryOp::NotEq => IrBinaryOp::NotEq,
        BinaryOp::Less => IrBinaryOp::Less,
        BinaryOp::LessEq => IrBinaryOp::LessEq,
        BinaryOp::Greater => IrBinaryOp::Greater,
        BinaryOp::GreaterEq => IrBinaryOp::GreaterEq,
        BinaryOp::BitAnd => IrBinaryOp::BitAnd,
        BinaryOp::BitOr => IrBinaryOp::BitOr,
        BinaryOp::BitXor => IrBinaryOp::BitXor,
        BinaryOp::ShiftLeft => IrBinaryOp::ShiftLeft,
        BinaryOp::ShiftRight => IrBinaryOp::ShiftRight,
        BinaryOp::UnsignedShiftRight => IrBinaryOp::UnsignedShiftRight,
        BinaryOp::LogicalAnd | BinaryOp::LogicalOr => {
            unreachable!("logical operators lower through conditional short-circuiting")
        }
    }
}

pub(super) fn lower_field_initializer(
    init: Option<&Expr>,
    enum_constants: &HashMap<String, (String, HashMap<String, i64>)>,
) -> Option<IrFieldInit> {
    match init? {
        Expr::IntLiteral(v) => Some(IrFieldInit::Int(*v)),
        Expr::LongLiteral(v) => Some(IrFieldInit::Int(*v)),
        Expr::CharLiteral(v) => Some(IrFieldInit::Int(*v as i64)),
        Expr::BoolLiteral(v) => Some(IrFieldInit::Bool(*v)),
        Expr::MemberAccess { member, .. } => resolve_enum_constant(init?, member, enum_constants)
            .map(|(_, ordinal)| IrFieldInit::Int(ordinal)),
        Expr::Unary {
            op: UnaryOp::Neg,
            expr,
        } => match expr.as_ref() {
            Expr::IntLiteral(v) => Some(IrFieldInit::Int(-*v)),
            Expr::LongLiteral(v) => Some(IrFieldInit::Int(-*v)),
            _ => None,
        },
        Expr::Cast { ty, expr } => lower_cast_field_initializer(ty, expr.as_ref())
            .or_else(|| lower_field_initializer(Some(expr.as_ref()), enum_constants)),
        _ => None,
    }
}

pub(super) fn build_enum_constant_table(
    program: &Program,
    class_contexts: &[ClassContext],
) -> HashMap<String, (String, HashMap<String, i64>)> {
    let mut table = HashMap::new();
    for (idx, class) in program.classes.iter().enumerate() {
        if !class.is_enum {
            continue;
        }
        let fqcn = format!("{}.{}", class_contexts[idx].package_name, class.name);
        let constants = class
            .enum_constants
            .iter()
            .enumerate()
            .map(|(ordinal, constant)| (constant.clone(), ordinal as i64))
            .collect::<HashMap<_, _>>();
        table.insert(class.name.clone(), (fqcn.clone(), constants.clone()));
        table.insert(fqcn, (format!("{}.{}", class_contexts[idx].package_name, class.name), constants));
    }
    table
}

pub(super) fn resolve_enum_constant(
    expr: &Expr,
    member: &str,
    enum_constants: &HashMap<String, (String, HashMap<String, i64>)>,
) -> Option<(String, i64)> {
    let owner = flatten_member_path(match expr {
        Expr::MemberAccess { object, .. } => object.as_ref(),
        _ => return None,
    })?;
    let (enum_ty, constants) = enum_constants.get(owner.as_str())?;
    let ordinal = *constants.get(member)?;
    Some((enum_ty.clone(), ordinal))
}

fn flatten_member_path(expr: &Expr) -> Option<String> {
    match expr {
        Expr::Var(name) => Some(name.clone()),
        Expr::MemberAccess { object, member } => {
            let mut path = flatten_member_path(object)?;
            path.push('.');
            path.push_str(member);
            Some(path)
        }
        _ => None,
    }
}

fn lower_cast_field_initializer(target_ty: &str, expr: &Expr) -> Option<IrFieldInit> {
    let target = target_ty.rsplit('.').next().unwrap_or(target_ty);
    match target {
        "int" => lower_numeric_literal_as_i64(expr)
            .map(|value| value.clamp(i32::MIN as i64, i32::MAX as i64))
            .map(IrFieldInit::Int),
        "long" => lower_numeric_literal_as_i64(expr).map(IrFieldInit::Int),
        "boolean" => lower_bool_literal(expr).map(IrFieldInit::Bool),
        _ => None,
    }
}

fn lower_numeric_literal_as_i64(expr: &Expr) -> Option<i64> {
    match expr {
        Expr::IntLiteral(v) | Expr::LongLiteral(v) => Some(*v),
        Expr::CharLiteral(v) => Some(*v as i64),
        Expr::FloatLiteral(raw) | Expr::DoubleLiteral(raw) => {
            let parsed = raw.parse::<f64>().ok()?;
            if parsed.is_nan() {
                return Some(0);
            }
            if parsed >= i64::MAX as f64 {
                return Some(i64::MAX);
            }
            if parsed <= i64::MIN as f64 {
                return Some(i64::MIN);
            }
            Some(parsed.trunc() as i64)
        }
        Expr::Unary {
            op: UnaryOp::Neg,
            expr,
        } => lower_numeric_literal_as_i64(expr.as_ref()).map(|v| -v),
        Expr::Cast { expr, .. } => lower_numeric_literal_as_i64(expr.as_ref()),
        _ => None,
    }
}

fn lower_bool_literal(expr: &Expr) -> Option<bool> {
    match expr {
        Expr::BoolLiteral(v) => Some(*v),
        Expr::Cast { expr, .. } => lower_bool_literal(expr.as_ref()),
        _ => None,
    }
}

pub(super) fn visible_type_params(class: &crate::ClassDecl, method: &MethodDecl) -> HashSet<String> {
    let mut visible = class.type_params.iter().cloned().collect::<HashSet<_>>();
    visible.extend(method.type_params.iter().cloned());
    visible
}

pub(super) fn erase_type_for_runtime(ty: &str, visible_type_params: &HashSet<String>) -> String {
    let (base, suffix) = split_array_suffix(ty);
    if visible_type_params.contains(base) {
        return format!("Object{}", suffix);
    }
    let raw = split_generic_type(base)
        .map(|(raw, _)| raw.to_string())
        .unwrap_or_else(|_| base.to_string());
    format!("{}{}", raw, suffix)
}

fn split_array_suffix(ty: &str) -> (&str, String) {
    let mut base = ty.trim();
    let mut suffix = String::new();
    while let Some(stripped) = base.strip_suffix("[]") {
        suffix.push_str("[]");
        base = stripped.trim_end();
    }
    (base, suffix)
}

fn split_generic_type(ty: &str) -> Result<(&str, Vec<String>), ()> {
    let trimmed = ty.trim();
    let Some(start) = trimmed.find('<') else {
        return Ok((trimmed, Vec::new()));
    };
    let Some(end) = trimmed.rfind('>') else {
        return Err(());
    };
    if end < start || !trimmed[end + 1..].trim().is_empty() {
        return Err(());
    }
    let raw = trimmed[..start].trim();
    let inner = &trimmed[start + 1..end];
    let mut args = Vec::new();
    let mut depth = 0usize;
    let mut last = 0usize;
    for (idx, ch) in inner.char_indices() {
        match ch {
            '<' => depth += 1,
            '>' => depth = depth.saturating_sub(1),
            ',' if depth == 0 => {
                args.push(inner[last..idx].trim().to_string());
                last = idx + 1;
            }
            _ => {}
        }
    }
    args.push(inner[last..].trim().to_string());
    Ok((raw, args))
}
