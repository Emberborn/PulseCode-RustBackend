use crate::Expr;

use super::super::support::{erase_type_for_runtime, lower_binary_op};
use super::super::{IrInstr, IrTerminator, IrValueKind};
use super::{IrBuilder, LoopContext, TryContext};

impl IrBuilder {
    pub(super) fn lower_var_decl(
        &mut self,
        ty: &str,
        name: &str,
        init: Option<&Expr>,
        current: usize,
        stmt_index: usize,
        source_line: usize,
    ) -> usize {
        let init_lowered = init.map(|expr| self.lower_expr(expr, stmt_index));
        let runtime_ty = if ty == "var" {
            let inferred = init_lowered
                .map(|lowered| self.value_ty(lowered))
                .unwrap_or_else(|| "unknown".to_string());
            erase_type_for_runtime(&inferred, &self.visible_type_params)
        } else {
            erase_type_for_runtime(ty, &self.visible_type_params)
        };
        self.local_types
            .insert(name.to_string(), runtime_ty.clone());
        let source = self.source_loc(stmt_index, source_line);
        self.emit(
            current,
            IrInstr::DeclareLocal {
                name: name.to_string(),
                ty: runtime_ty.clone(),
                source: source.clone(),
            },
        );
        if let Some(lowered) = init_lowered {
            let value = self.coerce_numeric_value(lowered, &runtime_ty, stmt_index);
            self.emit(
                current,
                IrInstr::StoreLocal {
                    name: name.to_string(),
                    value,
                    source,
                },
            );
        }
        current
    }

    pub(super) fn lower_assign(
        &mut self,
        target: &Expr,
        value: &Expr,
        current: usize,
        stmt_index: usize,
        source_line: usize,
    ) -> usize {
        if let Expr::ArrayAccess { array, index } = target {
            let array_id = self.lower_expr(array, stmt_index);
            let index_id = self.lower_expr(index, stmt_index);
            let element_ty = self
                .value_ty(array_id)
                .strip_suffix("[]")
                .unwrap_or("unknown")
                .to_string();
            let lowered = self.lower_expr(value, stmt_index);
            let value_id = self.coerce_numeric_value(lowered, &element_ty, stmt_index);
            let store_value = self.push_value(
                "void".to_string(),
                IrValueKind::ArraySet {
                    array: array_id,
                    index: index_id,
                    value: value_id,
                    element_ty,
                },
                stmt_index,
            );
            self.emit(
                current,
                IrInstr::Eval {
                    value: store_value,
                    source: self.source_loc(stmt_index, source_line),
                },
            );
            return current;
        }
        let source = self.source_loc(stmt_index, source_line);
        let target_value = self.lower_expr(target, stmt_index);
        let target_ty = self.value_ty(target_value);
        let lowered = self.lower_expr(value, stmt_index);
        let value_id = self.coerce_numeric_value(lowered, &target_ty, stmt_index);
        self.emit(
            current,
            IrInstr::Eval {
                value: target_value,
                source: source.clone(),
            },
        );
        self.emit(
            current,
            IrInstr::Eval {
                value: value_id,
                source,
            },
        );
        current
    }

    pub(super) fn lower_compound_assign(
        &mut self,
        target: &Expr,
        op: crate::BinaryOp,
        value: &Expr,
        current: usize,
        stmt_index: usize,
        source_line: usize,
    ) -> usize {
        if let Expr::ArrayAccess { array, index } = target {
            let array_id = self.lower_expr(array, stmt_index);
            let index_id = self.lower_expr(index, stmt_index);
            let element_ty = self
                .value_ty(array_id)
                .strip_suffix("[]")
                .unwrap_or("unknown")
                .to_string();
            let lhs = self.push_value(
                element_ty.clone(),
                IrValueKind::ArrayGet {
                    array: array_id,
                    index: index_id,
                    element_ty: element_ty.clone(),
                },
                stmt_index,
            );
            let rhs = self.lower_expr(value, stmt_index);
            let composed = self.push_value(
                self.value_ty(lhs),
                IrValueKind::Binary {
                    op: lower_binary_op(op),
                    left: lhs,
                    right: rhs,
                },
                stmt_index,
            );
            let composed = self.coerce_numeric_value(composed, &element_ty, stmt_index);
            let store = self.push_value(
                "void".to_string(),
                IrValueKind::ArraySet {
                    array: array_id,
                    index: index_id,
                    value: composed,
                    element_ty,
                },
                stmt_index,
            );
            self.emit(
                current,
                IrInstr::Eval {
                    value: store,
                    source: self.source_loc(stmt_index, source_line),
                },
            );
            return current;
        }
        let source = self.source_loc(stmt_index, source_line);
        let lhs = self.lower_expr(target, stmt_index);
        let rhs = self.lower_expr(value, stmt_index);
        let target_ty = self.value_ty(lhs);
        let composed = self.push_value(
            target_ty.clone(),
            IrValueKind::Binary {
                op: lower_binary_op(op),
                left: lhs,
                right: rhs,
            },
            stmt_index,
        );
        let composed = self.coerce_numeric_value(composed, &target_ty, stmt_index);
        self.emit(
            current,
            IrInstr::Eval {
                value: lhs,
                source: source.clone(),
            },
        );
        self.emit(
            current,
            IrInstr::Eval {
                value: composed,
                source,
            },
        );
        current
    }

    pub(super) fn lower_expr_stmt(
        &mut self,
        expr: &Expr,
        current: usize,
        stmt_index: usize,
        source_line: usize,
    ) -> usize {
        let value = self.lower_expr(expr, stmt_index);
        self.emit(
            current,
            IrInstr::Eval {
                value,
                source: self.source_loc(stmt_index, source_line),
            },
        );
        current
    }

    pub(super) fn lower_return(
        &mut self,
        value: Option<&Expr>,
        current: usize,
        stmt_index: usize,
        source_line: usize,
    ) -> usize {
        let value_id = value.map(|v| {
            let lowered = self.lower_expr(v, stmt_index);
            if let Some(return_ty) = self.return_type.clone() {
                self.coerce_numeric_value(lowered, &return_ty, stmt_index)
            } else {
                lowered
            }
        });
        self.set_terminator(
            current,
            IrTerminator::Return {
                value: value_id,
                source: self.source_loc(stmt_index, source_line),
            },
        );
        current
    }

    pub(super) fn lower_break_or_stop(
        &mut self,
        loop_ctx: Option<&LoopContext>,
        current: usize,
        stmt_index: usize,
        source_line: usize,
    ) -> usize {
        if let Some(ctx) = loop_ctx {
            self.set_terminator(
                current,
                IrTerminator::Goto {
                    target: ctx.break_target,
                    source: self.source_loc(stmt_index, source_line),
                },
            );
        } else {
            self.set_terminator(current, IrTerminator::Stop);
        }
        current
    }

    pub(super) fn lower_continue_or_stop(
        &mut self,
        loop_ctx: Option<&LoopContext>,
        current: usize,
        stmt_index: usize,
        source_line: usize,
    ) -> usize {
        if let Some(ctx) = loop_ctx {
            self.set_terminator(
                current,
                IrTerminator::Goto {
                    target: ctx.continue_target,
                    source: self.source_loc(stmt_index, source_line),
                },
            );
        } else {
            self.set_terminator(current, IrTerminator::Stop);
        }
        current
    }

    pub(super) fn lower_throw_stmt(
        &mut self,
        expr: &Expr,
        current: usize,
        _try_ctx: Option<&TryContext>,
        stmt_index: usize,
        source_line: usize,
    ) -> usize {
        let throwable = self.lower_expr(expr, stmt_index);
        self.set_terminator(
            current,
            IrTerminator::Throw {
                value: throwable,
                source: self.source_loc(stmt_index, source_line),
            },
        );
        current
    }

    pub(super) fn lower_assert_stmt(
        &mut self,
        condition: &Expr,
        message: Option<&Expr>,
        current: usize,
        stmt_index: usize,
        source_line: usize,
    ) -> usize {
        let pass_block = self.new_block();
        let fail_block = self.new_block();
        let condition_value = self.lower_expr(condition, stmt_index);
        self.set_terminator(
            current,
            IrTerminator::Branch {
                condition: condition_value,
                then_target: pass_block,
                else_target: fail_block,
                source: self.source_loc(stmt_index, source_line),
            },
        );

        let fail_call = if let Some(message) = message {
            Expr::Call {
                callee: Box::new(Expr::MemberAccess {
                    object: Box::new(Expr::Var("AssertionError".to_string())),
                    member: "fail".to_string(),
                }),
                args: vec![message.clone()],
            }
        } else {
            Expr::Call {
                callee: Box::new(Expr::MemberAccess {
                    object: Box::new(Expr::Var("AssertionError".to_string())),
                    member: "fail".to_string(),
                }),
                args: Vec::new(),
            }
        };
        let fail_value = self.lower_expr(&fail_call, stmt_index);
        self.emit(
            fail_block,
            IrInstr::Eval {
                value: fail_value,
                source: self.source_loc(stmt_index, source_line),
            },
        );
        self.set_terminator(
            fail_block,
            IrTerminator::Goto {
                target: pass_block,
                source: self.source_loc(stmt_index, source_line),
            },
        );
        pass_block
    }
}
