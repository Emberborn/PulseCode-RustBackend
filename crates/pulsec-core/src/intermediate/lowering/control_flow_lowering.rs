use crate::{Expr, Stmt};

use super::super::IrTerminator;
use super::{IrBuilder, LoopContext, TryContext};

impl IrBuilder {
    pub(super) fn lower_if_stmt(
        &mut self,
        condition: &Expr,
        then_branch: &[Stmt],
        else_branch: Option<&[Stmt]>,
        current: usize,
        loop_ctx: Option<&LoopContext>,
        try_ctx: Option<&TryContext>,
        stmt_index: usize,
        source_line: usize,
    ) -> usize {
        let cond_value = self.lower_expr(condition, stmt_index);
        let then_block = self.new_block();
        let else_block = self.new_block();
        let join_block = self.new_block();
        self.set_terminator(
            current,
            IrTerminator::Branch {
                condition: cond_value,
                then_target: then_block,
                else_target: else_block,
                source: self.source_loc(stmt_index, source_line),
            },
        );

        let then_end = self.lower_stmts(then_branch, then_block, loop_ctx, try_ctx);
        if !self.is_terminated(then_end) {
            self.set_terminator(
                then_end,
                IrTerminator::Goto {
                    target: join_block,
                    source: self.source_loc(stmt_index, source_line),
                },
            );
        }

        let else_end = if let Some(else_stmts) = else_branch {
            self.lower_stmts(else_stmts, else_block, loop_ctx, try_ctx)
        } else {
            else_block
        };
        if !self.is_terminated(else_end) {
            self.set_terminator(
                else_end,
                IrTerminator::Goto {
                    target: join_block,
                    source: self.source_loc(stmt_index, source_line),
                },
            );
        }

        join_block
    }

    pub(super) fn lower_while_stmt(
        &mut self,
        condition: &Expr,
        body: &[Stmt],
        current: usize,
        try_ctx: Option<&TryContext>,
        stmt_index: usize,
        source_line: usize,
    ) -> usize {
        let cond_block = self.new_block();
        let body_block = self.new_block();
        let after_block = self.new_block();

        self.set_terminator(
            current,
            IrTerminator::Goto {
                target: cond_block,
                source: self.source_loc(stmt_index, source_line),
            },
        );
        let cond_value = self.lower_expr(condition, stmt_index);
        self.set_terminator(
            cond_block,
            IrTerminator::Branch {
                condition: cond_value,
                then_target: body_block,
                else_target: after_block,
                source: self.source_loc(stmt_index, source_line),
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
                    source: self.source_loc(stmt_index, source_line),
                },
            );
        }
        after_block
    }

    pub(super) fn lower_do_while_stmt(
        &mut self,
        body: &[Stmt],
        condition: &Expr,
        current: usize,
        try_ctx: Option<&TryContext>,
        stmt_index: usize,
        source_line: usize,
    ) -> usize {
        let body_block = self.new_block();
        let cond_block = self.new_block();
        let after_block = self.new_block();
        self.set_terminator(
            current,
            IrTerminator::Goto {
                target: body_block,
                source: self.source_loc(stmt_index, source_line),
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
                    source: self.source_loc(stmt_index, source_line),
                },
            );
        }

        let cond_value = self.lower_expr(condition, stmt_index);
        self.set_terminator(
            cond_block,
            IrTerminator::Branch {
                condition: cond_value,
                then_target: body_block,
                else_target: after_block,
                source: self.source_loc(stmt_index, source_line),
            },
        );
        after_block
    }

    pub(super) fn lower_for_stmt(
        &mut self,
        init: Option<&Stmt>,
        condition: Option<&Expr>,
        update: Option<&Stmt>,
        body: &[Stmt],
        current: usize,
        loop_ctx: Option<&LoopContext>,
        try_ctx: Option<&TryContext>,
        stmt_index: usize,
        source_line: usize,
    ) -> usize {
        let mut block = current;
        if let Some(init_stmt) = init {
            block = self.lower_stmt(init_stmt, block, loop_ctx, try_ctx);
        }

        let cond_block = self.new_block();
        let body_block = self.new_block();
        let update_block = self.new_block();
        let after_block = self.new_block();

        if !self.is_terminated(block) {
            self.set_terminator(
                block,
                IrTerminator::Goto {
                    target: cond_block,
                    source: self.source_loc(stmt_index, source_line),
                },
            );
        }

        if let Some(cond) = condition {
            let cond_value = self.lower_expr(cond, stmt_index);
            self.set_terminator(
                cond_block,
                IrTerminator::Branch {
                    condition: cond_value,
                    then_target: body_block,
                    else_target: after_block,
                    source: self.source_loc(stmt_index, source_line),
                },
            );
        } else {
            self.set_terminator(
                cond_block,
                IrTerminator::Goto {
                    target: body_block,
                    source: self.source_loc(stmt_index, source_line),
                },
            );
        }

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
                    source: self.source_loc(stmt_index, source_line),
                },
            );
        }

        let update_end = if let Some(update_stmt) = update {
            self.lower_stmt(update_stmt, update_block, Some(&ctx), try_ctx)
        } else {
            update_block
        };
        if !self.is_terminated(update_end) {
            self.set_terminator(
                update_end,
                IrTerminator::Goto {
                    target: cond_block,
                    source: self.source_loc(stmt_index, source_line),
                },
            );
        }

        after_block
    }
}
