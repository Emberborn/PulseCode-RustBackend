use crate::{BinaryOp, Expr, UnaryOp};

use super::super::support::{erase_type_for_runtime, lower_binary_op, resolve_enum_constant};
use super::super::{IrUnaryOp, IrValueId, IrValueKind};
use super::IrBuilder;

impl IrBuilder {
    fn signed_rank(ty: &str) -> Option<u8> {
        match ty {
            "byte" => Some(1),
            "short" => Some(2),
            "char" => Some(2),
            "int" => Some(3),
            "long" => Some(4),
            "float" => Some(5),
            "double" => Some(6),
            _ => None,
        }
    }

    fn unsigned_rank(ty: &str) -> Option<u8> {
        match ty {
            "ubyte" => Some(1),
            "ushort" => Some(2),
            "uint" => Some(3),
            "ulong" => Some(4),
            _ => None,
        }
    }

    fn signed_widen_target_for_unsigned(actual: &str) -> Option<&'static str> {
        match actual {
            "ubyte" => Some("short"),
            "ushort" => Some("int"),
            "uint" => Some("long"),
            "ulong" => Some("float"),
            _ => None,
        }
    }

    fn unsigned_widen_target_for_signed(actual: &str) -> Option<&'static str> {
        match actual {
            "char" => Some("ushort"),
            _ => None,
        }
    }

    fn implicit_numeric_widening_allowed(expected: &str, actual: &str) -> bool {
        if expected == actual {
            return true;
        }
        match (Self::signed_rank(expected), Self::signed_rank(actual)) {
            (Some(expected_rank), Some(actual_rank)) => return actual_rank <= expected_rank,
            _ => {}
        }
        match (Self::unsigned_rank(expected), Self::unsigned_rank(actual)) {
            (Some(expected_rank), Some(actual_rank)) => actual_rank <= expected_rank,
            _ => {
                if let Some(min_expected) = Self::signed_widen_target_for_unsigned(actual) {
                    if let (Some(expected_rank), Some(min_rank)) =
                        (Self::signed_rank(expected), Self::signed_rank(min_expected))
                    {
                        return expected_rank >= min_rank;
                    }
                }
                if let Some(min_expected) = Self::unsigned_widen_target_for_signed(actual) {
                    if let (Some(expected_rank), Some(min_rank)) =
                        (Self::unsigned_rank(expected), Self::unsigned_rank(min_expected))
                    {
                        return expected_rank >= min_rank;
                    }
                }
                false
            }
        }
    }

    fn lowered_numeric_binary_ty(left_ty: &str, right_ty: &str) -> String {
        let left = left_ty.rsplit('.').next().unwrap_or(left_ty);
        let right = right_ty.rsplit('.').next().unwrap_or(right_ty);
        match (Self::signed_rank(left), Self::signed_rank(right)) {
            (Some(left_rank), Some(right_rank)) => {
                let ty = if left_rank >= right_rank { left } else { right };
                match ty {
                    "byte" | "short" | "char" => "int".to_string(),
                    _ => ty.to_string(),
                }
            }
            _ => match (Self::unsigned_rank(left), Self::unsigned_rank(right)) {
                (Some(left_rank), Some(right_rank)) => {
                    if left_rank.max(right_rank) >= 4 {
                        "ulong".to_string()
                    } else {
                        "uint".to_string()
                    }
                }
                _ => match (Self::signed_rank(left), Self::unsigned_rank(right)) {
                    (Some(signed_rank), Some(unsigned_rank)) => {
                        if signed_rank >= 5 {
                            left.to_string()
                        } else {
                            match unsigned_rank {
                                1 | 2 => match left {
                                    "long" => "long".to_string(),
                                    _ => "int".to_string(),
                                },
                                3 => "long".to_string(),
                                _ => "int".to_string(),
                            }
                        }
                    }
                    _ => match (Self::unsigned_rank(left), Self::signed_rank(right)) {
                        (Some(unsigned_rank), Some(signed_rank)) => {
                            if signed_rank >= 5 {
                                right.to_string()
                            } else {
                                match unsigned_rank {
                                    1 | 2 => match right {
                                        "long" => "long".to_string(),
                                        _ => "int".to_string(),
                                    },
                                    3 => "long".to_string(),
                                    _ => "int".to_string(),
                                }
                            }
                        }
                        _ => "int".to_string(),
                    },
                },
            },
        }
    }

    fn is_integral_ty(ty: &str) -> bool {
        matches!(
            ty.rsplit('.').next().unwrap_or(ty),
            "byte" | "short" | "int" | "long" | "char" | "ubyte" | "ushort" | "uint" | "ulong"
        )
    }

    fn lowered_integral_binary_ty(left_ty: &str, right_ty: &str) -> Option<String> {
        if !Self::is_integral_ty(left_ty) || !Self::is_integral_ty(right_ty) {
            return None;
        }
        Some(Self::lowered_numeric_binary_ty(left_ty, right_ty))
    }

    fn lowered_shift_ty(left_ty: &str) -> Option<String> {
        match left_ty.rsplit('.').next().unwrap_or(left_ty) {
            "byte" | "short" | "char" => Some("int".to_string()),
            "ubyte" | "ushort" => Some("uint".to_string()),
            "int" => Some("int".to_string()),
            "uint" => Some("uint".to_string()),
            "long" => Some("long".to_string()),
            "ulong" => Some("ulong".to_string()),
            _ => None,
        }
    }

    pub(super) fn coerce_numeric_value(
        &mut self,
        value_id: IrValueId,
        target_ty: &str,
        statement_index: usize,
    ) -> IrValueId {
        let actual_ty = self.value_ty(value_id);
        let actual = actual_ty.rsplit('.').next().unwrap_or(&actual_ty);
        let target = target_ty.rsplit('.').next().unwrap_or(target_ty);
        if actual == target {
            return value_id;
        }
        if Self::implicit_numeric_widening_allowed(target, actual)
            || (matches!(target, "float" | "double")
                && matches!(
                    actual,
                    "byte"
                        | "short"
                        | "int"
                        | "long"
                        | "char"
                        | "ubyte"
                        | "ushort"
                        | "uint"
                        | "ulong"
                        | "float"
                        | "double"
                ))
        {
            return self.push_value(
                target_ty.to_string(),
                IrValueKind::Cast {
                    value: value_id,
                    ty: target_ty.to_string(),
                },
                statement_index,
            );
        }
        value_id
    }

    fn lower_float_bits(raw: &str) -> i64 {
        let parsed = raw.parse::<f32>().unwrap_or(0.0f32) as f64;
        parsed.to_bits() as i64
    }

    fn lower_double_bits(raw: &str) -> i64 {
        raw.parse::<f64>().unwrap_or(0.0f64).to_bits() as i64
    }

    fn lower_array_initializer_value(
        &mut self,
        value: &crate::ArrayInitExpr,
        element_ty: &str,
        dimensions: usize,
        statement_index: usize,
    ) -> IrValueId {
        match value {
            crate::ArrayInitExpr::Expr(expr) => {
                let value_id = self.lower_expr(expr, statement_index);
                if dimensions == 1 {
                    self.coerce_numeric_value(value_id, element_ty, statement_index)
                } else {
                    value_id
                }
            }
            crate::ArrayInitExpr::Nested(values) => {
                let nested_values = values
                    .iter()
                    .map(|value| {
                        self.lower_array_initializer_value(
                            value,
                            element_ty,
                            dimensions - 1,
                            statement_index,
                        )
                    })
                    .collect::<Vec<_>>();
                self.push_value(
                    format!("{}{}", element_ty, "[]".repeat(dimensions - 1)),
                    IrValueKind::ArrayNewInitialized {
                        element_ty: element_ty.to_string(),
                        dimensions: dimensions - 1,
                        values: nested_values,
                    },
                    statement_index,
                )
            }
        }
    }

    pub(super) fn lower_expr(&mut self, expr: &Expr, statement_index: usize) -> IrValueId {
        match expr {
            Expr::IntLiteral(v) => {
                self.push_value("int".to_string(), IrValueKind::IntLiteral(*v), statement_index)
            }
            Expr::LongLiteral(v) => {
                self.push_value("long".to_string(), IrValueKind::IntLiteral(*v), statement_index)
            }
            Expr::FloatLiteral(raw) => {
                self.push_value(
                    "float".to_string(),
                    IrValueKind::IntLiteral(Self::lower_float_bits(raw)),
                    statement_index,
                )
            }
            Expr::DoubleLiteral(raw) => {
                self.push_value(
                    "double".to_string(),
                    IrValueKind::IntLiteral(Self::lower_double_bits(raw)),
                    statement_index,
                )
            }
            Expr::CharLiteral(v) => self.push_value(
                "char".to_string(),
                IrValueKind::IntLiteral(*v as i64),
                statement_index,
            ),
            Expr::StringLiteral(v) => self.push_value(
                "String".to_string(),
                IrValueKind::StringLiteral(v.clone()),
                statement_index,
            ),
            Expr::BoolLiteral(v) => self.push_value(
                "boolean".to_string(),
                IrValueKind::BoolLiteral(*v),
                statement_index,
            ),
            Expr::NullLiteral => {
                self.push_value("null".to_string(), IrValueKind::NullLiteral, statement_index)
            }
            Expr::This => {
                self.push_value(self.class_name.clone(), IrValueKind::ThisRef, statement_index)
            }
            Expr::Super => {
                self.push_value(self.class_name.clone(), IrValueKind::SuperRef, statement_index)
            }
            Expr::Var(v) => self.push_value(
                "unknown".to_string(),
                IrValueKind::LocalRef(v.clone()),
                statement_index,
            ),
            Expr::Unary { op, expr } => {
                let operand = self.lower_expr(expr, statement_index);
                let ir_op = match op {
                    UnaryOp::Not => IrUnaryOp::Not,
                    UnaryOp::Neg => IrUnaryOp::Neg,
                    UnaryOp::BitNot => IrUnaryOp::BitNot,
                };
                let ty = match op {
                    UnaryOp::Not => "boolean".to_string(),
                    UnaryOp::Neg => self.value_ty(operand),
                    UnaryOp::BitNot => Self::lowered_shift_ty(&self.value_ty(operand))
                        .unwrap_or_else(|| self.value_ty(operand)),
                };
                self.push_value(
                    ty,
                    IrValueKind::Unary {
                        op: ir_op,
                        operand,
                    },
                    statement_index,
                )
            }
            Expr::Cast { ty, expr } => {
                let value = self.lower_expr(expr, statement_index);
                let runtime_ty = erase_type_for_runtime(ty, &self.visible_type_params);
                self.push_value(
                    runtime_ty.clone(),
                    IrValueKind::Cast {
                        value,
                        ty: runtime_ty,
                    },
                    statement_index,
                )
            }
            Expr::InstanceOf { expr, ty } => {
                let value = self.lower_expr(expr, statement_index);
                let runtime_ty = erase_type_for_runtime(ty, &self.visible_type_params);
                self.push_value(
                    "boolean".to_string(),
                    IrValueKind::InstanceOf {
                        value,
                        ty: runtime_ty,
                    },
                    statement_index,
                )
            }
            Expr::Binary { left, op, right } => {
                if matches!(op, BinaryOp::LogicalAnd | BinaryOp::LogicalOr) {
                    let condition = self.lower_expr(left, statement_index);
                    let right_value = self.lower_expr(right, statement_index);
                    let short_value = self.push_value(
                        "boolean".to_string(),
                        IrValueKind::BoolLiteral(matches!(op, BinaryOp::LogicalOr)),
                        statement_index,
                    );
                    return match op {
                        BinaryOp::LogicalAnd => self.push_value(
                            "boolean".to_string(),
                            IrValueKind::Conditional {
                                condition,
                                then_value: right_value,
                                else_value: short_value,
                            },
                            statement_index,
                        ),
                        BinaryOp::LogicalOr => self.push_value(
                            "boolean".to_string(),
                            IrValueKind::Conditional {
                                condition,
                                then_value: short_value,
                                else_value: right_value,
                            },
                            statement_index,
                        ),
                        _ => unreachable!(),
                    };
                }
                let mut left_id = self.lower_expr(left, statement_index);
                let mut right_id = self.lower_expr(right, statement_index);
                let left_ty = self.value_ty(left_id);
                let right_ty = self.value_ty(right_id);
                let ty = match op {
                    BinaryOp::Add => {
                        if left_ty == "String" || right_ty == "String" {
                            "String".to_string()
                        } else {
                            Self::lowered_numeric_binary_ty(&left_ty, &right_ty)
                        }
                    }
                    BinaryOp::Sub | BinaryOp::Mul | BinaryOp::Div => {
                        Self::lowered_numeric_binary_ty(&left_ty, &right_ty)
                    }
                    BinaryOp::BitAnd | BinaryOp::BitOr | BinaryOp::BitXor => {
                        if left_ty == "boolean" && right_ty == "boolean" {
                            "boolean".to_string()
                        } else {
                            Self::lowered_integral_binary_ty(&left_ty, &right_ty)
                                .unwrap_or_else(|| "unknown".to_string())
                        }
                    }
                    BinaryOp::ShiftLeft | BinaryOp::ShiftRight | BinaryOp::UnsignedShiftRight => {
                        Self::lowered_shift_ty(&left_ty)
                            .unwrap_or_else(|| left_ty.clone())
                    }
                    BinaryOp::Eq
                    | BinaryOp::NotEq
                    | BinaryOp::Less
                    | BinaryOp::LessEq
                    | BinaryOp::Greater
                    | BinaryOp::GreaterEq => "boolean".to_string(),
                    BinaryOp::LogicalAnd | BinaryOp::LogicalOr => unreachable!(),
                };
                if matches!(
                    op,
                    BinaryOp::Add
                        | BinaryOp::Sub
                        | BinaryOp::Mul
                        | BinaryOp::Div
                        | BinaryOp::BitAnd
                        | BinaryOp::BitOr
                        | BinaryOp::BitXor
                ) && ty != "String"
                    && ty != "boolean"
                {
                    left_id = self.coerce_numeric_value(left_id, &ty, statement_index);
                    right_id = self.coerce_numeric_value(right_id, &ty, statement_index);
                } else if matches!(
                    op,
                    BinaryOp::ShiftLeft | BinaryOp::ShiftRight | BinaryOp::UnsignedShiftRight
                ) {
                    left_id = self.coerce_numeric_value(left_id, &ty, statement_index);
                }
                self.push_value(
                    ty,
                    IrValueKind::Binary {
                        op: lower_binary_op(*op),
                        left: left_id,
                        right: right_id,
                    },
                    statement_index,
                )
            }
            Expr::Conditional {
                condition,
                then_expr,
                else_expr,
            } => {
                let condition_id = self.lower_expr(condition, statement_index);
                let mut then_id = self.lower_expr(then_expr, statement_index);
                let mut else_id = self.lower_expr(else_expr, statement_index);
                let then_ty = self.value_ty(then_id);
                let else_ty = self.value_ty(else_id);
                let ty = if then_ty == "null" {
                    else_ty
                } else {
                    then_ty
                };
                then_id = self.coerce_numeric_value(then_id, &ty, statement_index);
                else_id = self.coerce_numeric_value(else_id, &ty, statement_index);
                self.push_value(
                    ty,
                    IrValueKind::Conditional {
                        condition: condition_id,
                        then_value: then_id,
                        else_value: else_id,
                    },
                    statement_index,
                )
            }
            Expr::SwitchExpr { expr, cases, default } => {
                let switch_id = self.lower_expr(expr, statement_index);
                let mut default_id = self.lower_expr(default, statement_index);
                let mut lowered_cases = Vec::new();
                let mut result_ty = self.value_ty(default_id);

                for case in cases {
                    let label_id = self.lower_expr(&case.label, statement_index);
                    let value_id = self.lower_expr(&case.value, statement_index);
                    let case_ty = self.value_ty(value_id);
                    if result_ty == "null" {
                        result_ty = case_ty.clone();
                    } else if let Some(promoted) =
                        Self::lowered_integral_binary_ty(&result_ty, &case_ty)
                            .or_else(|| {
                                if Self::signed_rank(&result_ty).is_some()
                                    || Self::unsigned_rank(&result_ty).is_some()
                                {
                                    Some(Self::lowered_numeric_binary_ty(&result_ty, &case_ty))
                                } else {
                                    None
                                }
                            })
                    {
                        result_ty = promoted;
                    }
                    lowered_cases.push((label_id, value_id));
                }

                default_id = self.coerce_numeric_value(default_id, &result_ty, statement_index);
                let lowered_cases = lowered_cases
                    .into_iter()
                    .map(|(label_id, value_id)| {
                        (
                            label_id,
                            self.coerce_numeric_value(value_id, &result_ty, statement_index),
                        )
                    })
                    .collect::<Vec<_>>();

                self.push_value(
                    result_ty,
                    IrValueKind::SwitchExpr {
                        expr: switch_id,
                        cases: lowered_cases,
                        default: default_id,
                    },
                    statement_index,
                )
            }
            Expr::NewObject { class_name, args } => {
                let arg_ids = args
                    .iter()
                    .map(|arg| self.lower_expr(arg, statement_index))
                    .collect::<Vec<_>>();
                self.push_value(
                    class_name.clone(),
                    IrValueKind::NewObject {
                        class_name: class_name.clone(),
                        args: arg_ids,
                    },
                    statement_index,
                )
            }
            Expr::NewArray { element_ty, lengths } => {
                let length_ids = lengths
                    .iter()
                    .map(|length| self.lower_expr(length, statement_index))
                    .collect::<Vec<_>>();
                self.push_value(
                    format!("{}{}", element_ty, "[]".repeat(lengths.len())),
                    IrValueKind::ArrayNew {
                        element_ty: element_ty.clone(),
                        lengths: length_ids,
                    },
                    statement_index,
                )
            }
            Expr::NewArrayInitialized {
                element_ty,
                dimensions,
                values,
            } => {
                let value_ids = values
                    .iter()
                    .map(|value| {
                        self.lower_array_initializer_value(
                            value,
                            element_ty,
                            *dimensions,
                            statement_index,
                        )
                    })
                    .collect::<Vec<_>>();
                self.push_value(
                    format!("{}{}", element_ty, "[]".repeat(*dimensions)),
                    IrValueKind::ArrayNewInitialized {
                        element_ty: element_ty.clone(),
                        dimensions: *dimensions,
                        values: value_ids,
                    },
                    statement_index,
                )
            }
            Expr::Call { callee, args } => {
                let callee_id = self.lower_expr(callee, statement_index);
                let arg_ids = args
                    .iter()
                    .map(|arg| self.lower_expr(arg, statement_index))
                    .collect::<Vec<_>>();
                self.push_value(
                    "unknown".to_string(),
                    IrValueKind::Call {
                        callee: callee_id,
                        args: arg_ids,
                    },
                    statement_index,
                )
            }
            Expr::MemberAccess { object, member } => {
                if let Some((enum_ty, ordinal)) =
                    resolve_enum_constant(expr, member, &self.enum_constants)
                {
                    return self.push_value(
                        enum_ty,
                        IrValueKind::IntLiteral(ordinal),
                        statement_index,
                    );
                }
                let object_id = self.lower_expr(object, statement_index);
                let object_ty = self.value_ty(object_id);
                if member == "length" && object_ty.ends_with("[]") {
                    return self.push_value(
                        "int".to_string(),
                        IrValueKind::ArrayLength { array: object_id },
                        statement_index,
                    );
                }
                self.push_value(
                    "unknown".to_string(),
                    IrValueKind::MemberAccess {
                        object: object_id,
                        member: member.clone(),
                    },
                    statement_index,
                )
            }
            Expr::ArrayAccess { array, index } => {
                let array_id = self.lower_expr(array, statement_index);
                let index_id = self.lower_expr(index, statement_index);
                let array_ty = self.value_ty(array_id);
                let element_ty = array_ty
                    .strip_suffix("[]")
                    .unwrap_or("unknown")
                    .to_string();
                self.push_value(
                    element_ty.clone(),
                    IrValueKind::ArrayGet {
                        array: array_id,
                        index: index_id,
                        element_ty,
                    },
                    statement_index,
                )
            }
            Expr::IncDec { target, .. } => self.lower_expr(target, statement_index),
        }
    }
}
