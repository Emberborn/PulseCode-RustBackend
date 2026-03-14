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
                ty: "com.pulse.lang.Throwable".to_string(),
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

        self.emit(
            current,
            IrInstr::PushExceptionHandler {
                handler_target: dispatch_block,
                source: source.clone(),
            },
        );

        let body_end = self.lower_stmts(body, current, loop_ctx, Some(&TryContext));
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
            "com.pulse.lang.Throwable".to_string(),
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
                    "com.pulse.lang.Throwable".to_string(),
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

                let catch_end =
                    self.lower_stmts(&catch_clause.body, catch_block, loop_ctx, parent_try_ctx);
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
                    "com.pulse.lang.Throwable".to_string(),
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
                        else_target: after_block,
                        source: source.clone(),
                    },
                );
            }
        }

        let pending_throwable = self.push_value(
            "com.pulse.lang.Throwable".to_string(),
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
