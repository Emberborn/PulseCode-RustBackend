use crate::{BinaryOp, Expr, UnaryOp};
use std::collections::HashMap;

use super::super::support::{erase_type_for_runtime, lower_binary_op, resolve_enum_constant};
use super::super::{IrUnaryOp, IrValueId, IrValueKind};
use super::IrBuilder;

impl IrBuilder {
    fn split_array_suffix(ty: &str) -> (&str, &str) {
        let mut base_end = ty.len();
        while ty[..base_end].ends_with("[]") {
            base_end -= 2;
        }
        (&ty[..base_end], &ty[base_end..])
    }

    fn split_generic_type(ty: &str) -> Option<(&str, Vec<String>)> {
        let start = ty.find('<')?;
        if !ty.ends_with('>') {
            return None;
        }
        let raw = &ty[..start];
        let mut args = Vec::new();
        let mut current = String::new();
        let mut depth = 0usize;
        for ch in ty[start + 1..ty.len() - 1].chars() {
            match ch {
                '<' => {
                    depth += 1;
                    current.push(ch);
                }
                '>' => {
                    if depth == 0 {
                        return None;
                    }
                    depth -= 1;
                    current.push(ch);
                }
                ',' if depth == 0 => {
                    args.push(current.trim().to_string());
                    current.clear();
                }
                _ => current.push(ch),
            }
        }
        if !current.is_empty() {
            args.push(current.trim().to_string());
        }
        Some((raw, args))
    }

    fn substitute_type_params(ty: &str, bindings: &HashMap<String, String>) -> String {
        let (base, array_suffix) = Self::split_array_suffix(ty);
        let Some((raw, args)) = Self::split_generic_type(base) else {
            return bindings
                .get(base)
                .cloned()
                .unwrap_or_else(|| format!("{}{}", base, array_suffix));
        };
        let substituted_base = bindings
            .get(raw)
            .cloned()
            .unwrap_or_else(|| raw.to_string());
        if args.is_empty() {
            return format!("{}{}", substituted_base, array_suffix);
        }
        let rendered_args = args
            .iter()
            .map(|arg| Self::substitute_type_params(arg, bindings))
            .collect::<Vec<_>>()
            .join(", ");
        format!("{}<{}>{}", substituted_base, rendered_args, array_suffix)
    }

    fn bind_owner_type_params(&self, owner: &str, return_ty: &str) -> String {
        let Some((raw_owner, concrete_args)) = Self::split_generic_type(owner) else {
            return return_ty.to_string();
        };
        let owner_key = raw_owner.rsplit('.').next().unwrap_or(raw_owner);
        let Some(type_params) = self
            .class_type_params
            .get(raw_owner)
            .or_else(|| self.class_type_params.get(owner_key))
        else {
            return return_ty.to_string();
        };
        let bindings = type_params
            .iter()
            .enumerate()
            .map(|(idx, param)| {
                (
                    param.clone(),
                    concrete_args
                        .get(idx)
                        .cloned()
                        .unwrap_or_else(|| "Object".to_string()),
                )
            })
            .collect::<HashMap<_, _>>();
        Self::substitute_type_params(return_ty, &bindings)
    }

    fn collect_logical_chain<'a>(left: &'a Expr, right: &'a Expr, op: &BinaryOp) -> Vec<&'a Expr> {
        let mut current = left;
        let mut tail = Vec::new();
        tail.push(right);
        loop {
            match current {
                Expr::Binary { left, op: current_op, right } if current_op == op => {
                    tail.push(right.as_ref());
                    current = left.as_ref();
                }
                _ => break,
            }
        }
        let mut out = vec![current];
        while let Some(next) = tail.pop() {
            out.push(next);
        }
        out
    }

    fn infer_expr_type_from_ast(&self, expr: &Expr) -> Option<String> {
        match expr {
            Expr::IntLiteral(_) => Some("int".to_string()),
            Expr::LongLiteral(_) => Some("long".to_string()),
            Expr::FloatLiteral(_) => Some("float".to_string()),
            Expr::DoubleLiteral(_) => Some("double".to_string()),
            Expr::BoolLiteral(_) => Some("boolean".to_string()),
            Expr::CharLiteral(_) => Some("char".to_string()),
            Expr::StringLiteral(_) => Some("String".to_string()),
            Expr::NullLiteral => Some("null".to_string()),
            Expr::This => Some(self.class_name.clone()),
            Expr::Super => self
                .super_class_name
                .clone()
                .or_else(|| Some("Object".to_string())),
            Expr::Var(name) => self
                .declared_local_types
                .get(name)
                .or_else(|| self.declared_field_types.get(name))
                .cloned()
                .or_else(|| {
                    self.local_types
                        .get(name)
                        .or_else(|| self.field_types.get(name))
                        .cloned()
                })
                .or_else(|| Some(name.clone())),
            Expr::Unary { op, expr } => {
                let operand_ty = self.infer_expr_type_from_ast(expr)?;
                match op {
                    UnaryOp::Not => Some("boolean".to_string()),
                    UnaryOp::Neg => Some(operand_ty),
                    UnaryOp::BitNot => {
                        Self::lowered_shift_ty(&operand_ty).or_else(|| Some(operand_ty))
                    }
                }
            }
            Expr::Cast { ty, .. } => Some(erase_type_for_runtime(ty, &self.visible_type_params)),
            Expr::InstanceOf { .. } => Some("boolean".to_string()),
            Expr::Binary { left, op, right } => {
                match op {
                    BinaryOp::LogicalAnd
                    | BinaryOp::LogicalOr
                    | BinaryOp::Eq
                    | BinaryOp::NotEq
                    | BinaryOp::Less
                    | BinaryOp::LessEq
                    | BinaryOp::Greater
                    | BinaryOp::GreaterEq => Some("boolean".to_string()),
                    _ => {
                        let left_ty = self.infer_expr_type_from_ast(left)?;
                        let right_ty = self.infer_expr_type_from_ast(right)?;
                        match op {
                            BinaryOp::Add if left_ty == "String" || right_ty == "String" => {
                                Some("String".to_string())
                            }
                            BinaryOp::Add
                            | BinaryOp::Sub
                            | BinaryOp::Mul
                            | BinaryOp::Div
                            | BinaryOp::Mod => {
                                Some(Self::lowered_numeric_binary_ty(&left_ty, &right_ty))
                            }
                            BinaryOp::BitAnd | BinaryOp::BitOr | BinaryOp::BitXor => {
                                if left_ty == "boolean" && right_ty == "boolean" {
                                    Some("boolean".to_string())
                                } else {
                                    Self::lowered_integral_binary_ty(&left_ty, &right_ty)
                                }
                            }
                            BinaryOp::ShiftLeft
                            | BinaryOp::ShiftRight
                            | BinaryOp::UnsignedShiftRight => {
                                Self::lowered_shift_ty(&left_ty).or_else(|| Some(left_ty))
                            }
                            _ => None,
                        }
                    }
                }
            }
            Expr::Conditional {
                then_expr,
                else_expr,
                ..
            } => {
                let then_ty = self.infer_expr_type_from_ast(then_expr)?;
                let else_ty = self.infer_expr_type_from_ast(else_expr)?;
                if then_ty == "null" {
                    Some(else_ty)
                } else {
                    Some(then_ty)
                }
            }
            Expr::SwitchExpr { cases, default, .. } => {
                let mut result_ty = self.infer_expr_type_from_ast(default)?;
                for case in cases {
                    let case_ty = self.infer_expr_type_from_ast(&case.value)?;
                    if result_ty == "null" {
                        result_ty = case_ty;
                    } else if let Some(promoted) =
                        Self::lowered_integral_binary_ty(&result_ty, &case_ty).or_else(|| {
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
                }
                Some(result_ty)
            }
            Expr::NewObject { class_name, .. } => Some(class_name.clone()),
            Expr::NewArray {
                element_ty,
                lengths,
            } => Some(format!("{}{}", element_ty, "[]".repeat(lengths.len()))),
            Expr::NewArrayInitialized {
                element_ty,
                dimensions,
                ..
            } => Some(format!("{}{}", element_ty, "[]".repeat(*dimensions))),
            Expr::Call { callee, args } => {
                let arg_types = args
                    .iter()
                    .map(|arg| self.infer_expr_type_from_ast(arg))
                    .collect::<Option<Vec<_>>>()?;
                self.infer_call_target(callee, &arg_types)
                    .map(|(_, return_ty, _)| return_ty)
            }
            Expr::MemberAccess { object, member } => {
                if let Some((enum_ty, _)) = resolve_enum_constant(expr, member, &self.enum_constants)
                {
                    return Some(enum_ty);
                }
                let object_ty = self.infer_expr_type_from_ast(object)?;
                if member == "length" && object_ty.ends_with("[]") {
                    return Some("int".to_string());
                }
                match &**object {
                    Expr::This | Expr::Super => self
                        .declared_field_types
                        .get(member)
                        .cloned()
                        .or_else(|| self.field_types.get(member).cloned()),
                    _ => self.lookup_field_type(&object_ty, member),
                }
            }
            Expr::ArrayAccess { array, .. } => self
                .infer_expr_type_from_ast(array)?
                .strip_suffix("[]")
                .map(|ty| ty.to_string()),
            Expr::IncDec { target, .. } => self.infer_expr_type_from_ast(target),
        }
    }

    fn wrapper_primitive_type_name(ty: &str) -> Option<&'static str> {
        match ty.rsplit('.').next().unwrap_or(ty) {
            "Byte" => Some("byte"),
            "Short" => Some("short"),
            "Integer" => Some("int"),
            "Long" => Some("long"),
            "Float" => Some("float"),
            "Double" => Some("double"),
            "Char" => Some("char"),
            "Boolean" => Some("boolean"),
            "UByte" => Some("ubyte"),
            "UShort" => Some("ushort"),
            "UInteger" => Some("uint"),
            "ULong" => Some("ulong"),
            _ => None,
        }
    }

    pub(super) fn coerce_runtime_value(
        &mut self,
        value_id: IrValueId,
        target_ty: &str,
        statement_index: usize,
    ) -> IrValueId {
        let actual_ty = self.value_ty(value_id);
        let actual = actual_ty.rsplit('.').next().unwrap_or(&actual_ty);
        let target = target_ty.rsplit('.').next().unwrap_or(target_ty);
        if target == "Object" && Self::wrapper_primitive_type_name(actual).is_some() {
            return self.push_value(
                target_ty.to_string(),
                IrValueKind::Cast {
                    value: value_id,
                    ty: target_ty.to_string(),
                },
                statement_index,
            );
        }
        self.coerce_numeric_value(value_id, target_ty, statement_index)
    }

    fn lower_string_value_of(
        &mut self,
        value_id: IrValueId,
        statement_index: usize,
    ) -> IrValueId {
        let value_ty = self.value_ty(value_id);
        if value_ty == "String" {
            return value_id;
        }
        if value_ty == "null" {
            return self.push_value(
                "String".to_string(),
                IrValueKind::StringLiteral("null".to_string()),
                statement_index,
            );
        }

        let owner_id = self.push_value(
            "String".to_string(),
            IrValueKind::LocalRef("String".to_string()),
            statement_index,
        );
        let callee_id = self.push_value(
            "unknown".to_string(),
            IrValueKind::MemberAccess {
                object: owner_id,
                member: "valueOf".to_string(),
            },
            statement_index,
        );
        self.push_value(
            "String".to_string(),
            IrValueKind::Call {
                callee: callee_id,
                args: vec![value_id],
            },
            statement_index,
        )
    }

    fn lookup_method_return_type(
        &self,
        owner: &str,
        member: &str,
        arg_types: &[String],
    ) -> Option<String> {
        let raw_owner = owner.split('<').next().unwrap_or(owner);
        let simple = raw_owner.rsplit('.').next().unwrap_or(raw_owner);
        self.method_return_types
            .get(&(simple.to_string(), member.to_string(), arg_types.to_vec()))
            .cloned()
            .map(|return_ty| self.bind_owner_type_params(owner, &return_ty))
    }

    fn lookup_unique_method_return_type(&self, member: &str, arity: usize) -> Option<String> {
        let mut found: Option<String> = None;
        for ((_, method_name, param_types), return_ty) in &self.method_return_types {
            if method_name != member || param_types.len() != arity {
                continue;
            }
            match &found {
                None => found = Some(return_ty.clone()),
                Some(existing) if existing == return_ty => {}
                Some(_) => return None,
            }
        }
        found
    }

    fn lookup_field_type(&self, owner: &str, member: &str) -> Option<String> {
        self.global_field_types
            .get(&(owner.to_string(), member.to_string()))
            .cloned()
            .or_else(|| {
                let simple = owner.rsplit('.').next().unwrap_or(owner);
                self.global_field_types
                    .get(&(simple.to_string(), member.to_string()))
                    .cloned()
            })
    }

    fn compatible_method_signature(
        &self,
        owner: &str,
        member: &str,
        arg_types: &[String],
    ) -> Option<(Vec<String>, String, bool)> {
        let raw_owner = owner.split('<').next().unwrap_or(owner);
        let simple_owner = raw_owner.rsplit('.').next().unwrap_or(raw_owner);
        let mut match_found: Option<(Vec<String>, String, bool)> = None;
        for ((candidate_owner, method_name, sig), return_ty) in &self.method_return_types {
            if candidate_owner != simple_owner || method_name != member {
                continue;
            }
            let is_varargs = *self
                .method_varargs
                .get(&(candidate_owner.clone(), method_name.clone(), sig.clone()))
                .unwrap_or(&false);
            if !is_varargs {
                continue;
            }
            if sig.is_empty() {
                continue;
            }
            let fixed_count = sig.len() - 1;
            if arg_types.len() < fixed_count {
                continue;
            }
            let mut compatible = true;
            for idx in 0..fixed_count {
                if sig[idx] != arg_types[idx] {
                    compatible = false;
                    break;
                }
            }
            if !compatible {
                continue;
            }
            let vararg_array_ty = sig.last().cloned().unwrap_or_default();
            let Some(vararg_element_ty) = vararg_array_ty.strip_suffix("[]") else {
                continue;
            };
            if arg_types.len() == sig.len() && arg_types.last() == Some(&vararg_array_ty) {
                match_found = Some((sig.clone(), return_ty.clone(), true));
                break;
            }
            for actual_ty in arg_types.iter().skip(fixed_count) {
                if actual_ty != vararg_element_ty {
                    compatible = false;
                    break;
                }
            }
            if compatible {
                match match_found {
                    None => match_found = Some((sig.clone(), return_ty.clone(), true)),
                    Some(_) => return None,
                }
            }
        }
        match_found
    }

    fn infer_call_target(
        &self,
        callee: &Expr,
        arg_types: &[String],
    ) -> Option<(Vec<String>, String, bool)> {
        match callee {
            Expr::This => Some((arg_types.to_vec(), "void".to_string(), false)),
            Expr::Super => Some((arg_types.to_vec(), "void".to_string(), false)),
            Expr::Var(name) => self
                .lookup_method_return_type(&self.class_name, name, arg_types)
                .map(|return_ty| (arg_types.to_vec(), return_ty, false))
                .or_else(|| {
                    self.lookup_method_return_type(name, name, arg_types)
                        .map(|return_ty| (arg_types.to_vec(), return_ty, false))
                })
                .or_else(|| self.compatible_method_signature(&self.class_name, name, arg_types))
                .or_else(|| self.compatible_method_signature(name, name, arg_types))
                .or_else(|| {
                    self.lookup_unique_method_return_type(name, arg_types.len())
                        .map(|return_ty| (arg_types.to_vec(), return_ty, false))
                }),
            Expr::MemberAccess { object, member } => {
                let owner = match &**object {
                    Expr::Super => self
                        .super_class_name
                        .clone()
                        .unwrap_or_else(|| "Object".to_string()),
                    _ => self.infer_expr_type_from_ast(object)?,
                };
                self.lookup_method_return_type(&owner, member, arg_types)
                    .map(|return_ty| (arg_types.to_vec(), return_ty, false))
                    .or_else(|| self.compatible_method_signature(&owner, member, arg_types))
                    .or_else(|| {
                        if matches!(&**object, Expr::Super) {
                            self.lookup_method_return_type(&self.class_name, member, arg_types)
                                .map(|return_ty| (arg_types.to_vec(), return_ty, false))
                                .or_else(|| {
                                    self.compatible_method_signature(
                                        &self.class_name,
                                        member,
                                        arg_types,
                                    )
                                })
                        } else {
                            None
                        }
                    })
            }
            _ => None,
        }
    }

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
                    if let (Some(expected_rank), Some(min_rank)) = (
                        Self::unsigned_rank(expected),
                        Self::unsigned_rank(min_expected),
                    ) {
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
        raw.parse::<f32>().unwrap_or(0.0f32).to_bits() as i64
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
                    self.coerce_runtime_value(value_id, element_ty, statement_index)
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
            Expr::IntLiteral(v) => self.push_value(
                "int".to_string(),
                IrValueKind::IntLiteral(*v),
                statement_index,
            ),
            Expr::LongLiteral(v) => self.push_value(
                "long".to_string(),
                IrValueKind::IntLiteral(*v),
                statement_index,
            ),
            Expr::FloatLiteral(raw) => self.push_value(
                "float".to_string(),
                IrValueKind::IntLiteral(Self::lower_float_bits(raw)),
                statement_index,
            ),
            Expr::DoubleLiteral(raw) => self.push_value(
                "double".to_string(),
                IrValueKind::IntLiteral(Self::lower_double_bits(raw)),
                statement_index,
            ),
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
            Expr::NullLiteral => self.push_value(
                "null".to_string(),
                IrValueKind::NullLiteral,
                statement_index,
            ),
            Expr::This => self.push_value(
                self.class_name.clone(),
                IrValueKind::ThisRef,
                statement_index,
            ),
            Expr::Super => self.push_value(
                self.class_name.clone(),
                IrValueKind::SuperRef,
                statement_index,
            ),
            Expr::Var(v) => self.push_value(
                self.declared_local_types
                    .get(v)
                    .or_else(|| self.declared_field_types.get(v))
                    .cloned()
                    .or_else(|| {
                        self.local_types
                            .get(v)
                            .or_else(|| self.field_types.get(v))
                            .cloned()
                    })
                    .unwrap_or_else(|| "unknown".to_string()),
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
                    IrValueKind::Unary { op: ir_op, operand },
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
                    let operands = Self::collect_logical_chain(left, right, op);
                    let short_value = self.push_value(
                        "boolean".to_string(),
                        IrValueKind::BoolLiteral(matches!(op, BinaryOp::LogicalOr)),
                        statement_index,
                    );
                    let mut current_value = self.lower_expr(operands[0], statement_index);
                    for operand in operands.iter().skip(1) {
                        let next_value = self.lower_expr(operand, statement_index);
                        current_value = match op {
                            BinaryOp::LogicalAnd => self.push_value(
                                "boolean".to_string(),
                                IrValueKind::Conditional {
                                    condition: current_value,
                                    then_value: next_value,
                                    else_value: short_value,
                                },
                                statement_index,
                            ),
                            BinaryOp::LogicalOr => self.push_value(
                                "boolean".to_string(),
                                IrValueKind::Conditional {
                                    condition: current_value,
                                    then_value: short_value,
                                    else_value: next_value,
                                },
                                statement_index,
                            ),
                            _ => unreachable!(),
                        };
                    }
                    return current_value;
                }
                let mut left_id = self.lower_expr(left, statement_index);
                let mut right_id = self.lower_expr(right, statement_index);
                let left_ty = self.value_ty(left_id);
                let right_ty = self.value_ty(right_id);
                if matches!(op, BinaryOp::Add) && (left_ty == "String" || right_ty == "String") {
                    left_id = self.lower_string_value_of(left_id, statement_index);
                    right_id = self.lower_string_value_of(right_id, statement_index);
                    let callee_id = self.push_value(
                        "unknown".to_string(),
                        IrValueKind::MemberAccess {
                            object: left_id,
                            member: "concat".to_string(),
                        },
                        statement_index,
                    );
                    return self.push_value(
                        "String".to_string(),
                        IrValueKind::Call {
                            callee: callee_id,
                            args: vec![right_id],
                        },
                        statement_index,
                    );
                }
                let ty = match op {
                    BinaryOp::Add => {
                        if left_ty == "String" || right_ty == "String" {
                            "String".to_string()
                        } else {
                            Self::lowered_numeric_binary_ty(&left_ty, &right_ty)
                        }
                    }
                    BinaryOp::Sub | BinaryOp::Mul | BinaryOp::Div | BinaryOp::Mod => {
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
                        Self::lowered_shift_ty(&left_ty).unwrap_or_else(|| left_ty.clone())
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
                        | BinaryOp::Mod
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
                let ty = if then_ty == "null" { else_ty } else { then_ty };
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
            Expr::SwitchExpr {
                expr,
                cases,
                default,
            } => {
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
                        Self::lowered_integral_binary_ty(&result_ty, &case_ty).or_else(|| {
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
            Expr::NewArray {
                element_ty,
                lengths,
            } => {
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
                let callee_id = match &**callee {
                    Expr::This => {
                        let object_id = self.lower_expr(callee, statement_index);
                        self.push_value(
                            "unknown".to_string(),
                            IrValueKind::MemberAccess {
                                object: object_id,
                                member: self
                                    .class_name
                                    .rsplit('.')
                                    .next()
                                    .unwrap_or(&self.class_name)
                                    .to_string(),
                            },
                            statement_index,
                        )
                    }
                    Expr::Super => {
                        let owner = self
                            .super_class_name
                            .clone()
                            .unwrap_or_else(|| "Object".to_string());
                        let ctor_name = owner.rsplit('.').next().unwrap_or(&owner).to_string();
                        let object_id = self.lower_expr(callee, statement_index);
                        self.push_value(
                            "unknown".to_string(),
                            IrValueKind::MemberAccess {
                                object: object_id,
                                member: ctor_name,
                            },
                            statement_index,
                        )
                    }
                    _ => self.lower_expr(callee, statement_index),
                };
                let mut arg_ids = args
                    .iter()
                    .map(|arg| self.lower_expr(arg, statement_index))
                    .collect::<Vec<_>>();
                let arg_types = arg_ids
                    .iter()
                    .map(|arg| self.value_ty(*arg))
                    .collect::<Vec<_>>();
                let mut ty = "unknown".to_string();
                if let Some((resolved_sig, return_ty, is_varargs)) =
                    self.infer_call_target(callee, &arg_types)
                {
                    ty = return_ty;
                    if is_varargs && !resolved_sig.is_empty() {
                        let fixed_count = resolved_sig.len() - 1;
                        let vararg_array_ty = resolved_sig.last().cloned().unwrap_or_default();
                        let direct_array_pass = arg_types.len() == resolved_sig.len()
                            && arg_types.last() == Some(&vararg_array_ty);
                        if !direct_array_pass {
                            let element_ty = vararg_array_ty
                                .strip_suffix("[]")
                                .unwrap_or(vararg_array_ty.as_str())
                                .to_string();
                            let mut packaged_args = arg_ids[..fixed_count].to_vec();
                            let vararg_values = arg_ids[fixed_count..]
                                .iter()
                                .map(|arg| {
                                    self.coerce_runtime_value(*arg, &element_ty, statement_index)
                                })
                                .collect::<Vec<_>>();
                            let array_id = self.push_value(
                                vararg_array_ty,
                                IrValueKind::ArrayNewInitialized {
                                    element_ty,
                                    dimensions: 1,
                                    values: vararg_values,
                                },
                                statement_index,
                            );
                            packaged_args.push(array_id);
                            arg_ids = packaged_args;
                        }
                    }
                }
                self.push_value(
                    ty,
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
                let member_ty = match &**object {
                    Expr::Var(name) => {
                        let owner = self
                            .declared_local_types
                            .get(name)
                            .or_else(|| self.declared_field_types.get(name))
                            .cloned()
                            .or_else(|| {
                                self.local_types
                                    .get(name)
                                    .or_else(|| self.field_types.get(name))
                                    .cloned()
                            })
                            .unwrap_or_else(|| name.clone());
                        self.lookup_field_type(&owner, member)
                    }
                    Expr::This | Expr::Super => self
                        .declared_field_types
                        .get(member)
                        .cloned()
                        .or_else(|| self.field_types.get(member).cloned()),
                    _ => self.lookup_field_type(&object_ty, member),
                }
                .unwrap_or_else(|| "unknown".to_string());
                self.push_value(
                    member_ty,
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
                let element_ty = array_ty.strip_suffix("[]").unwrap_or("unknown").to_string();
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
