use crate::{BinaryOp, Expr, Stmt, SwitchCase};

use super::super::support::erase_type_for_runtime;
use super::super::{IrBinaryOp, IrInstr, IrTerminator, IrValueKind};
use super::{IrBuilder, LoopContext, TryContext};

impl IrBuilder {
    fn lower_foreach_runtime_ty(&self, declared_ty: &str, iterable_ty: &str) -> String {
        let resolved = if declared_ty == "var" {
            if iterable_ty.ends_with("[]") {
                iterable_ty
                    .strip_suffix("[]")
                    .unwrap_or(iterable_ty)
                    .to_string()
            } else {
                "pulse.lang.Object".to_string()
            }
        } else {
            declared_ty.to_string()
        };
        erase_type_for_runtime(&resolved, &self.visible_type_params)
    }

    pub(super) fn lower_foreach(
        &mut self,
        ty: &str,
        name: &str,
        iterable: &Expr,
        body: &[Stmt],
        current: usize,
        try_ctx: Option<&TryContext>,
        stmt_index: usize,
        source_line: usize,
    ) -> usize {
        let source = self.source_loc(stmt_index, source_line);
        let iterable_value = self.lower_expr(iterable, stmt_index);
        let iterable_ty = self.value_ty(iterable_value);
        let runtime_ty = self.lower_foreach_runtime_ty(ty, &iterable_ty);
        self.local_types
            .insert(name.to_string(), runtime_ty.clone());
        self.emit(
            current,
            IrInstr::DeclareLocal {
                name: name.to_string(),
                ty: runtime_ty,
                source: source.clone(),
            },
        );

        if iterable_ty.ends_with("[]") {
            let array_local = format!("__foreach{}_native_array", stmt_index);
            let index_local = format!("__foreach{}_index", stmt_index);
            let length_local = format!("__foreach{}_length", stmt_index);

            self.local_types
                .insert(array_local.clone(), iterable_ty.clone());
            self.emit(
                current,
                IrInstr::DeclareLocal {
                    name: array_local.clone(),
                    ty: iterable_ty,
                    source: source.clone(),
                },
            );
            self.emit(
                current,
                IrInstr::StoreLocal {
                    name: array_local.clone(),
                    value: iterable_value,
                    source: source.clone(),
                },
            );
            self.local_types
                .insert(index_local.clone(), "int".to_string());
            self.emit(
                current,
                IrInstr::DeclareLocal {
                    name: index_local.clone(),
                    ty: "int".to_string(),
                    source: source.clone(),
                },
            );
            let zero = self.push_value("int".to_string(), IrValueKind::IntLiteral(0), stmt_index);
            self.emit(
                current,
                IrInstr::StoreLocal {
                    name: index_local.clone(),
                    value: zero,
                    source: source.clone(),
                },
            );
            self.local_types
                .insert(length_local.clone(), "int".to_string());
            self.emit(
                current,
                IrInstr::DeclareLocal {
                    name: length_local.clone(),
                    ty: "int".to_string(),
                    source: source.clone(),
                },
            );
            let length_value = self.lower_expr(
                &Expr::MemberAccess {
                    object: Box::new(Expr::Var(array_local.clone())),
                    member: "length".to_string(),
                },
                stmt_index,
            );
            self.emit(
                current,
                IrInstr::StoreLocal {
                    name: length_local.clone(),
                    value: length_value,
                    source: source.clone(),
                },
            );

            let cond_block = self.new_block();
            let body_block = self.new_block();
            let update_block = self.new_block();
            let after_block = self.new_block();

            self.set_terminator(
                current,
                IrTerminator::Goto {
                    target: cond_block,
                    source: source.clone(),
                },
            );

            let cond_value = self.lower_expr(
                &Expr::Binary {
                    left: Box::new(Expr::Var(index_local.clone())),
                    op: BinaryOp::Less,
                    right: Box::new(Expr::Var(length_local.clone())),
                },
                stmt_index,
            );
            self.set_terminator(
                cond_block,
                IrTerminator::Branch {
                    condition: cond_value,
                    then_target: body_block,
                    else_target: after_block,
                    source: source.clone(),
                },
            );

            let item_value = self.lower_expr(
                &Expr::ArrayAccess {
                    array: Box::new(Expr::Var(array_local.clone())),
                    index: Box::new(Expr::Var(index_local.clone())),
                },
                stmt_index,
            );
            self.emit(
                body_block,
                IrInstr::StoreLocal {
                    name: name.to_string(),
                    value: item_value,
                    source: source.clone(),
                },
            );

            let ctx = LoopContext {
                break_target: after_block,
                continue_target: update_block,
            };
            let body_end = self.lower_stmts(body, body_block, Some(&ctx), try_ctx);
            if !self.is_terminated(body_end) {
                self.set_terminator(
                    body_end,
                    IrTerminator::Goto {
                        target: update_block,
                        source: source.clone(),
                    },
                );
            }

            let next_index = self.lower_expr(
                &Expr::Binary {
                    left: Box::new(Expr::Var(index_local.clone())),
                    op: BinaryOp::Add,
                    right: Box::new(Expr::IntLiteral(1)),
                },
                stmt_index,
            );
            self.emit(
                update_block,
                IrInstr::StoreLocal {
                    name: index_local,
                    value: next_index,
                    source: source.clone(),
                },
            );
            self.set_terminator(
                update_block,
                IrTerminator::Goto {
                    target: cond_block,
                    source,
                },
            );
            return after_block;
        }

        if ty == "int" || ty == "String" {
            let array_local = format!("__foreach{}_array", stmt_index);
            let index_local = format!("__foreach{}_index", stmt_index);
            let length_local = format!("__foreach{}_length", stmt_index);
            self.local_types.insert(
                array_local.clone(),
                "pulse.collections.Array".to_string(),
            );

            self.emit(
                current,
                IrInstr::DeclareLocal {
                    name: array_local.clone(),
                    ty: "pulse.collections.Array".to_string(),
                    source: source.clone(),
                },
            );
            self.emit(
                current,
                IrInstr::StoreLocal {
                    name: array_local.clone(),
                    value: iterable_value,
                    source: source.clone(),
                },
            );
            self.local_types
                .insert(index_local.clone(), "int".to_string());
            self.emit(
                current,
                IrInstr::DeclareLocal {
                    name: index_local.clone(),
                    ty: "int".to_string(),
                    source: source.clone(),
                },
            );
            let zero = self.push_value("int".to_string(), IrValueKind::IntLiteral(0), stmt_index);
            self.emit(
                current,
                IrInstr::StoreLocal {
                    name: index_local.clone(),
                    value: zero,
                    source: source.clone(),
                },
            );
            self.local_types
                .insert(length_local.clone(), "int".to_string());
            self.emit(
                current,
                IrInstr::DeclareLocal {
                    name: length_local.clone(),
                    ty: "int".to_string(),
                    source: source.clone(),
                },
            );
            let length_value = self.lower_expr(
                &Expr::Call {
                    callee: Box::new(Expr::MemberAccess {
                        object: Box::new(Expr::Var(array_local.clone())),
                        member: "length".to_string(),
                    }),
                    args: Vec::new(),
                },
                stmt_index,
            );
            self.emit(
                current,
                IrInstr::StoreLocal {
                    name: length_local.clone(),
                    value: length_value,
                    source: source.clone(),
                },
            );

            let cond_block = self.new_block();
            let body_block = self.new_block();
            let update_block = self.new_block();
            let after_block = self.new_block();

            self.set_terminator(
                current,
                IrTerminator::Goto {
                    target: cond_block,
                    source: source.clone(),
                },
            );

            let cond_value = self.lower_expr(
                &Expr::Binary {
                    left: Box::new(Expr::Var(index_local.clone())),
                    op: BinaryOp::Less,
                    right: Box::new(Expr::Var(length_local.clone())),
                },
                stmt_index,
            );
            self.set_terminator(
                cond_block,
                IrTerminator::Branch {
                    condition: cond_value,
                    then_target: body_block,
                    else_target: after_block,
                    source: source.clone(),
                },
            );

            let getter = if ty == "int" { "getInt" } else { "getString" };
            let item_value = self.lower_expr(
                &Expr::Call {
                    callee: Box::new(Expr::MemberAccess {
                        object: Box::new(Expr::Var(array_local.clone())),
                        member: getter.to_string(),
                    }),
                    args: vec![Expr::Var(index_local.clone())],
                },
                stmt_index,
            );
            self.emit(
                body_block,
                IrInstr::StoreLocal {
                    name: name.to_string(),
                    value: item_value,
                    source: source.clone(),
                },
            );

            let ctx = LoopContext {
                break_target: after_block,
                continue_target: update_block,
            };
            let body_end = self.lower_stmts(body, body_block, Some(&ctx), try_ctx);
            if !self.is_terminated(body_end) {
                self.set_terminator(
                    body_end,
                    IrTerminator::Goto {
                        target: update_block,
                        source: source.clone(),
                    },
                );
            }

            let next_index = self.lower_expr(
                &Expr::Binary {
                    left: Box::new(Expr::Var(index_local.clone())),
                    op: BinaryOp::Add,
                    right: Box::new(Expr::IntLiteral(1)),
                },
                stmt_index,
            );
            self.emit(
                update_block,
                IrInstr::StoreLocal {
                    name: index_local,
                    value: next_index,
                    source: source.clone(),
                },
            );
            self.set_terminator(
                update_block,
                IrTerminator::Goto {
                    target: cond_block,
                    source,
                },
            );
            return after_block;
        }

        let iter_local = format!("__foreach{}_iter", stmt_index);
        self.emit(
            current,
            IrInstr::DeclareLocal {
                name: iter_local.clone(),
                ty: "pulse.lang.Iterator".to_string(),
                source: source.clone(),
            },
        );
        self.local_types
            .insert(iter_local.clone(), "pulse.lang.Iterator".to_string());
        let iterator_value = self.lower_expr(
            &Expr::Call {
                callee: Box::new(Expr::MemberAccess {
                    object: Box::new(iterable.clone()),
                    member: "iterator".to_string(),
                }),
                args: Vec::new(),
            },
            stmt_index,
        );
        self.emit(
            current,
            IrInstr::StoreLocal {
                name: iter_local.clone(),
                value: iterator_value,
                source: source.clone(),
            },
        );

        let cond_block = self.new_block();
        let body_block = self.new_block();
        let after_block = self.new_block();
        self.set_terminator(
            current,
            IrTerminator::Goto {
                target: cond_block,
                source: source.clone(),
            },
        );

        let cond_value = self.lower_expr(
            &Expr::Call {
                callee: Box::new(Expr::MemberAccess {
                    object: Box::new(Expr::Var(iter_local.clone())),
                    member: "hasNext".to_string(),
                }),
                args: Vec::new(),
            },
            stmt_index,
        );
        self.set_terminator(
            cond_block,
            IrTerminator::Branch {
                condition: cond_value,
                then_target: body_block,
                else_target: after_block,
                source: source.clone(),
            },
        );

        let next_value = self.lower_expr(
            &Expr::Call {
                callee: Box::new(Expr::MemberAccess {
                    object: Box::new(Expr::Var(iter_local.clone())),
                    member: "next".to_string(),
                }),
                args: Vec::new(),
            },
            stmt_index,
        );
        self.emit(
            body_block,
            IrInstr::StoreLocal {
                name: name.to_string(),
                value: next_value,
                source: source.clone(),
            },
        );

        let ctx = LoopContext {
            break_target: after_block,
            continue_target: cond_block,
        };
        let body_end = self.lower_stmts(body, body_block, Some(&ctx), try_ctx);
        if !self.is_terminated(body_end) {
            self.set_terminator(
                body_end,
                IrTerminator::Goto {
                    target: cond_block,
                    source,
                },
            );
        }

        after_block
    }

    pub(super) fn lower_switch(
        &mut self,
        expr: &Expr,
        cases: &[SwitchCase],
        default: Option<&[Stmt]>,
        current: usize,
        loop_ctx: Option<&LoopContext>,
        try_ctx: Option<&TryContext>,
        stmt_index: usize,
        source_line: usize,
    ) -> usize {
        let after_block = self.new_block();
        let mut dispatch = self.new_block();
        self.set_terminator(
            current,
            IrTerminator::Goto {
                target: dispatch,
                source: self.source_loc(stmt_index, source_line),
            },
        );

        for case in cases {
            let case_block = self.new_block();
            let next_dispatch = self.new_block();
            let left = self.lower_expr(expr, stmt_index);
            let right = self.lower_expr(&case.label, stmt_index);
            let cond = self.push_value(
                "boolean".to_string(),
                IrValueKind::Binary {
                    op: IrBinaryOp::Eq,
                    left,
                    right,
                },
                stmt_index,
            );
            self.set_terminator(
                dispatch,
                IrTerminator::Branch {
                    condition: cond,
                    then_target: case_block,
                    else_target: next_dispatch,
                    source: self.source_loc(stmt_index, source_line),
                },
            );

            let case_ctx = LoopContext {
                break_target: after_block,
                continue_target: loop_ctx
                    .map(|ctx| ctx.continue_target)
                    .unwrap_or(after_block),
            };
            let case_end = self.lower_stmts(&case.body, case_block, Some(&case_ctx), try_ctx);
            if !self.is_terminated(case_end) {
                self.set_terminator(
                    case_end,
                    IrTerminator::Goto {
                        target: after_block,
                        source: self.source_loc(stmt_index, source_line),
                    },
                );
            }
            dispatch = next_dispatch;
        }

        if let Some(default_stmts) = default {
            let default_block = self.new_block();
            self.set_terminator(
                dispatch,
                IrTerminator::Goto {
                    target: default_block,
                    source: self.source_loc(stmt_index, source_line),
                },
            );
            let default_end = self.lower_stmts(default_stmts, default_block, loop_ctx, try_ctx);
            if !self.is_terminated(default_end) {
                self.set_terminator(
                    default_end,
                    IrTerminator::Goto {
                        target: after_block,
                        source: self.source_loc(stmt_index, source_line),
                    },
                );
            }
        } else {
            self.set_terminator(
                dispatch,
                IrTerminator::Goto {
                    target: after_block,
                    source: self.source_loc(stmt_index, source_line),
                },
            );
        }

        after_block
    }
}
