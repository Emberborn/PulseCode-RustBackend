use crate::{BinaryOp, ClassContext, Expr, MethodDecl, Program, UnaryOp};
use std::collections::{HashMap, HashSet};

use super::{IrBinaryOp, IrFieldInit, IrFieldInitArg};

pub(super) fn lower_binary_op(op: BinaryOp) -> IrBinaryOp {
    match op {
        BinaryOp::Add => IrBinaryOp::Add,
        BinaryOp::Sub => IrBinaryOp::Sub,
        BinaryOp::Mul => IrBinaryOp::Mul,
        BinaryOp::Div => IrBinaryOp::Div,
        BinaryOp::Mod => IrBinaryOp::Mod,
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
    field_ty: &str,
    enum_constants: &HashMap<String, (String, HashMap<String, i64>)>,
    field_constants: &HashMap<String, IrFieldInit>,
) -> Option<IrFieldInit> {
    match init? {
        Expr::IntLiteral(v) => Some(IrFieldInit::Int(*v)),
        Expr::LongLiteral(v) => Some(IrFieldInit::Int(*v)),
        Expr::CharLiteral(v) => Some(IrFieldInit::Int(*v as i64)),
        Expr::FloatLiteral(raw) if field_ty.rsplit('.').next().unwrap_or(field_ty) == "float" => {
            raw.parse::<f32>().ok().map(|value| IrFieldInit::Float(value.to_bits()))
        }
        Expr::DoubleLiteral(raw)
            if field_ty.rsplit('.').next().unwrap_or(field_ty) == "double" =>
        {
            raw.parse::<f64>()
                .ok()
                .map(|value| IrFieldInit::Double(value.to_bits()))
        }
        Expr::BoolLiteral(v) => Some(IrFieldInit::Bool(*v)),
        Expr::NewObject { class_name, args } => {
            let lowered_args = args
                .iter()
                .map(lower_field_initializer_arg)
                .collect::<Option<Vec<_>>>()?;
            Some(IrFieldInit::NewObject {
                class_name: class_name.clone(),
                args: lowered_args,
            })
        }
        Expr::MemberAccess { member, .. } => resolve_enum_constant(init?, member, enum_constants)
            .map(|(_, ordinal)| IrFieldInit::Int(ordinal))
            .or_else(|| lookup_field_constant(init?, field_constants))
            .or_else(|| lower_cast_field_initializer(field_ty, init?, field_constants)),
        Expr::Unary {
            op: UnaryOp::Neg,
            expr,
        } => match expr.as_ref() {
            Expr::IntLiteral(v) => Some(IrFieldInit::Int(-*v)),
            Expr::LongLiteral(v) => Some(IrFieldInit::Int(-*v)),
            _ => lower_cast_field_initializer(field_ty, init?, field_constants),
        },
        Expr::Cast { ty, expr } => lower_cast_field_initializer(ty, expr.as_ref(), field_constants)
            .or_else(|| lower_field_initializer(Some(expr.as_ref()), field_ty, enum_constants, field_constants)),
        Expr::Var(_) => lookup_field_constant(init?, field_constants)
            .or_else(|| lower_cast_field_initializer(field_ty, init?, field_constants)),
        _ => lower_cast_field_initializer(field_ty, init?, field_constants),
    }
}

fn lower_field_initializer_arg(expr: &Expr) -> Option<IrFieldInitArg> {
    match expr {
        Expr::IntLiteral(v) => Some(IrFieldInitArg::Int(*v)),
        Expr::LongLiteral(v) => Some(IrFieldInitArg::Long(*v)),
        Expr::BoolLiteral(v) => Some(IrFieldInitArg::Bool(*v)),
        Expr::CharLiteral(v) => Some(IrFieldInitArg::Char(*v)),
        Expr::StringLiteral(v) => Some(IrFieldInitArg::String(v.clone())),
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
        table.insert(
            fqcn,
            (
                format!("{}.{}", class_contexts[idx].package_name, class.name),
                constants,
            ),
        );
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

fn lower_cast_field_initializer(
    target_ty: &str,
    expr: &Expr,
    field_constants: &HashMap<String, IrFieldInit>,
) -> Option<IrFieldInit> {
    let target = target_ty.rsplit('.').next().unwrap_or(target_ty);
    match target {
        "byte" => lower_numeric_literal_as_i64(expr, field_constants)
            .map(|value| (value as i8) as i64)
            .map(IrFieldInit::Int),
        "short" => lower_numeric_literal_as_i64(expr, field_constants)
            .map(|value| (value as i16) as i64)
            .map(IrFieldInit::Int),
        "int" => lower_numeric_literal_as_i64(expr, field_constants)
            .map(|value| value.clamp(i32::MIN as i64, i32::MAX as i64))
            .map(IrFieldInit::Int),
        "long" => lower_numeric_literal_as_i64(expr, field_constants).map(IrFieldInit::Int),
        "char" => lower_numeric_literal_as_i64(expr, field_constants)
            .map(|value| (value as u16) as i64)
            .map(IrFieldInit::Int),
        "ubyte" => lower_numeric_literal_as_i64(expr, field_constants)
            .map(|value| (value as u8) as i64)
            .map(IrFieldInit::Int),
        "ushort" => lower_numeric_literal_as_i64(expr, field_constants)
            .map(|value| (value as u16) as i64)
            .map(IrFieldInit::Int),
        "uint" => lower_numeric_literal_as_i64(expr, field_constants)
            .map(|value| (value as u32) as i64)
            .map(IrFieldInit::Int),
        "ulong" => lower_numeric_literal_as_i64(expr, field_constants).map(IrFieldInit::Int),
        "float" => lower_numeric_literal_as_f64(expr, field_constants)
            .map(|value| IrFieldInit::Float((value as f32).to_bits())),
        "double" => lower_numeric_literal_as_f64(expr, field_constants)
            .map(|value| IrFieldInit::Double(value.to_bits())),
        "boolean" => lower_bool_literal(expr, field_constants).map(IrFieldInit::Bool),
        _ => None,
    }
}

fn lower_numeric_literal_as_i64(
    expr: &Expr,
    field_constants: &HashMap<String, IrFieldInit>,
) -> Option<i64> {
    match expr {
        Expr::IntLiteral(v) | Expr::LongLiteral(v) => Some(*v),
        Expr::CharLiteral(v) => Some(*v as i64),
        Expr::Var(name) => match field_constants.get(name) {
            Some(IrFieldInit::Int(value)) => Some(*value),
            _ => None,
        },
        Expr::MemberAccess { .. } => match lookup_field_constant(expr, field_constants) {
            Some(IrFieldInit::Int(value)) => Some(value),
            _ => None,
        },
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
        } => lower_numeric_literal_as_i64(expr.as_ref(), field_constants).map(|v| -v),
        Expr::Cast { expr, .. } => lower_numeric_literal_as_i64(expr.as_ref(), field_constants),
        Expr::Binary { left, op, right } => {
            let left = lower_numeric_literal_as_i64(left.as_ref(), field_constants)?;
            let right = lower_numeric_literal_as_i64(right.as_ref(), field_constants)?;
            match op {
                BinaryOp::Add => Some(left.wrapping_add(right)),
                BinaryOp::Sub => Some(left.wrapping_sub(right)),
                BinaryOp::Mul => Some(left.wrapping_mul(right)),
                BinaryOp::Div => {
                    if right == 0 {
                        None
                    } else if left == i64::MIN && right == -1 {
                        Some(i64::MIN)
                    } else {
                        Some(left / right)
                    }
                }
                BinaryOp::Mod => {
                    if right == 0 {
                        None
                    } else if left == i64::MIN && right == -1 {
                        Some(0)
                    } else {
                        Some(left % right)
                    }
                }
                BinaryOp::BitAnd => Some(left & right),
                BinaryOp::BitOr => Some(left | right),
                BinaryOp::BitXor => Some(left ^ right),
                BinaryOp::ShiftLeft => Some(left.wrapping_shl((right & 63) as u32)),
                BinaryOp::ShiftRight => Some(left.wrapping_shr((right & 63) as u32)),
                BinaryOp::UnsignedShiftRight => {
                    let shifted = ((left as u64) >> ((right & 63) as u32)) as i64;
                    Some(shifted)
                }
                BinaryOp::Eq
                | BinaryOp::NotEq
                | BinaryOp::Less
                | BinaryOp::LessEq
                | BinaryOp::Greater
                | BinaryOp::GreaterEq
                | BinaryOp::LogicalAnd
                | BinaryOp::LogicalOr => None,
            }
        }
        _ => None,
    }
}

fn lower_numeric_literal_as_f64(
    expr: &Expr,
    field_constants: &HashMap<String, IrFieldInit>,
) -> Option<f64> {
    match expr {
        Expr::IntLiteral(v) | Expr::LongLiteral(v) => Some(*v as f64),
        Expr::CharLiteral(v) => Some(*v as u32 as f64),
        Expr::FloatLiteral(raw) => raw.parse::<f32>().ok().map(|value| value as f64),
        Expr::DoubleLiteral(raw) => raw.parse::<f64>().ok(),
        Expr::Var(name) => match field_constants.get(name) {
            Some(IrFieldInit::Int(value)) => Some(*value as f64),
            Some(IrFieldInit::Float(bits)) => Some(f32::from_bits(*bits) as f64),
            Some(IrFieldInit::Double(bits)) => Some(f64::from_bits(*bits)),
            _ => None,
        },
        Expr::MemberAccess { .. } => match lookup_field_constant(expr, field_constants) {
            Some(IrFieldInit::Int(value)) => Some(value as f64),
            Some(IrFieldInit::Float(bits)) => Some(f32::from_bits(bits) as f64),
            Some(IrFieldInit::Double(bits)) => Some(f64::from_bits(bits)),
            _ => None,
        },
        Expr::Unary {
            op: UnaryOp::Neg,
            expr,
        } => lower_numeric_literal_as_f64(expr.as_ref(), field_constants).map(|value| -value),
        Expr::Cast { expr, .. } => lower_numeric_literal_as_f64(expr.as_ref(), field_constants),
        Expr::Binary { left, op, right } => {
            let left = lower_numeric_literal_as_f64(left.as_ref(), field_constants)?;
            let right = lower_numeric_literal_as_f64(right.as_ref(), field_constants)?;
            match op {
                BinaryOp::Add => Some(left + right),
                BinaryOp::Sub => Some(left - right),
                BinaryOp::Mul => Some(left * right),
                BinaryOp::Div => Some(left / right),
                BinaryOp::Mod => Some(left % right),
                _ => None,
            }
        }
        _ => None,
    }
}

fn lower_bool_literal(expr: &Expr, field_constants: &HashMap<String, IrFieldInit>) -> Option<bool> {
    match expr {
        Expr::BoolLiteral(v) => Some(*v),
        Expr::Var(name) => match field_constants.get(name) {
            Some(IrFieldInit::Bool(value)) => Some(*value),
            _ => None,
        },
        Expr::MemberAccess { .. } => match lookup_field_constant(expr, field_constants) {
            Some(IrFieldInit::Bool(value)) => Some(value),
            _ => None,
        },
        Expr::Cast { expr, .. } => lower_bool_literal(expr.as_ref(), field_constants),
        _ => None,
    }
}

fn lookup_field_constant(
    expr: &Expr,
    field_constants: &HashMap<String, IrFieldInit>,
) -> Option<IrFieldInit> {
    match expr {
        Expr::Var(name) => field_constants.get(name).cloned(),
        Expr::MemberAccess { .. } => {
            let key = flatten_member_path(expr)?;
            field_constants.get(key.as_str()).cloned()
        }
        _ => None,
    }
}

pub(super) fn visible_type_params(
    class: &crate::ClassDecl,
    method: &MethodDecl,
) -> HashSet<String> {
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
