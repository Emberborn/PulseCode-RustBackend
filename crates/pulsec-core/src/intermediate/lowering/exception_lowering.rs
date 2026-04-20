use crate::{CatchClause, Stmt};

use super::super::{IrBinaryOp, IrInstr, IrTerminator, IrValueKind};
use super::{IrBuilder, LoopContext, TryContext};

impl IrBuilder {
    #[allow(clippy::too_many_arguments)]
    pub(super) fn lower_try(
        &mut self,
        body: &[Stmt],
        catches: &[CatchClause],
        finally_block: Option<&[Stmt]>,
        current: usize,
        loop_ctx: Option<&LoopContext>,
        parent_try_ctx: Option<&TryContext>,
        stmt_index: usize,
        source_line: usize,
    ) -> usize {
        let pending_local = format!("__try{}_pending", stmt_index);
        let source = self.source_loc(stmt_index, source_line);
        self.emit(
            current,
            IrInstr::DeclareLocal {
                name: pending_local.clone(),
                ty: "pulse.lang.Throwable".to_string(),
                source: source.clone(),
            },
        );
        let null_value = self.push_value("null".to_string(), IrValueKind::NullLiteral, stmt_index);
        self.emit(
            current,
            IrInstr::StoreLocal {
                name: pending_local.clone(),
                value: null_value,
                source: source.clone(),
            },
        );

        let after_block = self.new_block();
        let finally_entry = finally_block.map(|_| self.new_block());
        let dispatch_block = self.new_block();
        let rethrow_block = self.new_block();
        let return_dispatch_block = finally_entry.map(|_| self.new_block());
        let return_block = finally_entry.map(|_| self.new_block());
        let pending_return_flag_local = format!("__try{}_returning", stmt_index);
        let pending_return_value_local = self
            .return_type
            .as_ref()
            .filter(|return_ty| return_ty.as_str() != "void")
            .map(|_| format!("__try{}_return_value", stmt_index));

        if finally_entry.is_some() {
            self.emit(
                current,
                IrInstr::DeclareLocal {
                    name: pending_return_flag_local.clone(),
                    ty: "boolean".to_string(),
                    source: source.clone(),
                },
            );
            let false_value =
                self.push_value("boolean".to_string(), IrValueKind::BoolLiteral(false), stmt_index);
            self.emit(
                current,
                IrInstr::StoreLocal {
                    name: pending_return_flag_local.clone(),
                    value: false_value,
                    source: source.clone(),
                },
            );
            if let Some(return_local) = pending_return_value_local.as_ref() {
                self.emit(
                    current,
                    IrInstr::DeclareLocal {
                        name: return_local.clone(),
                        ty: self.return_type.clone().unwrap_or_else(|| "unknown".to_string()),
                        source: source.clone(),
                    },
                );
            }
        }

        let current_try_ctx = finally_entry.map(|entry| TryContext {
            finally_entry: entry,
            pending_return_flag_local: pending_return_flag_local.clone(),
            pending_return_value_local: pending_return_value_local.clone(),
        });

        self.emit(
            current,
            IrInstr::PushExceptionHandler {
                handler_target: dispatch_block,
                source: source.clone(),
            },
        );

        let body_end = self.lower_stmts(
            body,
            current,
            loop_ctx,
            current_try_ctx.as_ref().or(parent_try_ctx),
        );
        if !self.is_terminated(body_end) {
            self.emit(
                body_end,
                IrInstr::PopExceptionHandler {
                    source: source.clone(),
                },
            );
            self.set_terminator(
                body_end,
                IrTerminator::Goto {
                    target: finally_entry.unwrap_or(after_block),
                    source: source.clone(),
                },
            );
        }

        let pending_value = self.push_value(
            "pulse.lang.Throwable".to_string(),
            IrValueKind::TakePendingException,
            stmt_index,
        );
        self.emit(
            dispatch_block,
            IrInstr::StoreLocal {
                name: pending_local.clone(),
                value: pending_value,
                source: source.clone(),
            },
        );

        if !catches.is_empty() {
            let mut next_dispatch_block = dispatch_block;
            for catch_clause in catches {
                let catch_block = self.new_block();
                let next_dispatch = self.new_block();
                let pending_value = self.push_value(
                    "pulse.lang.Throwable".to_string(),
                    IrValueKind::LocalRef(pending_local.clone()),
                    stmt_index,
                );
                let cond = self.push_value(
                    "boolean".to_string(),
                    IrValueKind::InstanceOf {
                        value: pending_value,
                        ty: catch_clause.ty.clone(),
                    },
                    stmt_index,
                );
                self.set_terminator(
                    next_dispatch_block,
                    IrTerminator::Branch {
                        condition: cond,
                        then_target: catch_block,
                        else_target: next_dispatch,
                        source: source.clone(),
                    },
                );

                self.emit(
                    catch_block,
                    IrInstr::DeclareLocal {
                        name: catch_clause.name.clone(),
                        ty: catch_clause.ty.clone(),
                        source: source.clone(),
                    },
                );
                let caught_value = self.push_value(
                    catch_clause.ty.clone(),
                    IrValueKind::LocalRef(pending_local.clone()),
                    stmt_index,
                );
                self.emit(
                    catch_block,
                    IrInstr::StoreLocal {
                        name: catch_clause.name.clone(),
                        value: caught_value,
                        source: source.clone(),
                    },
                );
                self.emit(
                    catch_block,
                    IrInstr::StoreLocal {
                        name: pending_local.clone(),
                        value: null_value,
                        source: source.clone(),
                    },
                );

                let catch_end = self.lower_stmts(
                    &catch_clause.body,
                    catch_block,
                    loop_ctx,
                    current_try_ctx.as_ref().or(parent_try_ctx),
                );
                if !self.is_terminated(catch_end) {
                    self.set_terminator(
                        catch_end,
                        IrTerminator::Goto {
                            target: finally_entry.unwrap_or(after_block),
                            source: source.clone(),
                        },
                    );
                }

                next_dispatch_block = next_dispatch;
            }
            self.set_terminator(
                next_dispatch_block,
                IrTerminator::Goto {
                    target: finally_entry.unwrap_or(rethrow_block),
                    source: source.clone(),
                },
            );
        } else {
            self.set_terminator(
                dispatch_block,
                IrTerminator::Goto {
                    target: finally_entry.unwrap_or(rethrow_block),
                    source: source.clone(),
                },
            );
        }

        if let Some(finally_entry) = finally_entry {
            let finally_end = self.lower_stmts(
                finally_block.unwrap_or(&[]),
                finally_entry,
                loop_ctx,
                parent_try_ctx,
            );
            if !self.is_terminated(finally_end) {
                let pending_value = self.push_value(
                    "pulse.lang.Throwable".to_string(),
                    IrValueKind::LocalRef(pending_local.clone()),
                    stmt_index,
                );
                let cond = self.push_value(
                    "boolean".to_string(),
                    IrValueKind::Binary {
                        op: IrBinaryOp::NotEq,
                        left: pending_value,
                        right: null_value,
                    },
                    stmt_index,
                );
                self.set_terminator(
                    finally_end,
                    IrTerminator::Branch {
                        condition: cond,
                        then_target: rethrow_block,
                        else_target: return_dispatch_block.unwrap_or(after_block),
                        source: source.clone(),
                    },
                );
            }
        }

        if let Some(return_dispatch_block) = return_dispatch_block {
            let returning_value = self.push_value(
                "boolean".to_string(),
                IrValueKind::LocalRef(pending_return_flag_local.clone()),
                stmt_index,
            );
            self.set_terminator(
                return_dispatch_block,
                IrTerminator::Branch {
                    condition: returning_value,
                    then_target: return_block.expect("return block"),
                    else_target: after_block,
                    source: source.clone(),
                },
            );
        }

        if let Some(return_block) = return_block {
            let value = pending_return_value_local.as_ref().map(|return_local| {
                self.push_value(
                    self.return_type.clone().unwrap_or_else(|| "unknown".to_string()),
                    IrValueKind::LocalRef(return_local.clone()),
                    stmt_index,
                )
            });
            self.set_terminator(
                return_block,
                IrTerminator::Return {
                    value,
                    source: source.clone(),
                },
            );
        }

        let pending_throwable = self.push_value(
            "pulse.lang.Throwable".to_string(),
            IrValueKind::LocalRef(pending_local),
            stmt_index,
        );
        self.set_terminator(
            rethrow_block,
            IrTerminator::Throw {
                value: pending_throwable,
                source,
            },
        );

        after_block
    }
}
