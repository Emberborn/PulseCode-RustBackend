use crate::Stmt;

use super::{IrBuilder, LoopContext, TryContext};

impl IrBuilder {
    pub(super) fn lower_stmts(
        &mut self,
        stmts: &[Stmt],
        mut current: usize,
        loop_ctx: Option<&LoopContext>,
        try_ctx: Option<&TryContext>,
    ) -> usize {
        for stmt in stmts {
            if self.is_terminated(current) {
                break;
            }
            current = self.lower_stmt(stmt, current, loop_ctx, try_ctx);
        }
        current
    }

    pub(super) fn lower_stmt(
        &mut self,
        stmt: &Stmt,
        current: usize,
        loop_ctx: Option<&LoopContext>,
        try_ctx: Option<&TryContext>,
    ) -> usize {
        let stmt_index = self.statement_index();
        let source_line = stmt.source_line();
        match stmt {
            Stmt::VarDecl { ty, name, init, .. } => {
                self.lower_var_decl(ty, name, init.as_ref(), current, stmt_index, source_line)
            }
            Stmt::Assign { target, value, .. } => {
                self.lower_assign(target, value, current, stmt_index, source_line)
            }
            Stmt::CompoundAssign { target, op, value, .. } => {
                self.lower_compound_assign(target, *op, value, current, stmt_index, source_line)
            }
            Stmt::ExprStmt(expr, ..) => self.lower_expr_stmt(expr, current, stmt_index, source_line),
            Stmt::Return(value, ..) => self.lower_return(value.as_ref(), current, stmt_index, source_line),
            Stmt::Break { .. } => self.lower_break_or_stop(loop_ctx, current, stmt_index, source_line),
            Stmt::Continue { .. } => {
                self.lower_continue_or_stop(loop_ctx, current, stmt_index, source_line)
            }
            Stmt::Throw(expr, ..) => {
                self.lower_throw_stmt(expr, current, try_ctx, stmt_index, source_line)
            }
            Stmt::Try {
                body,
                catches,
                finally_block,
                ..
            } => self.lower_try(
                body,
                catches,
                finally_block.as_deref(),
                current,
                loop_ctx,
                try_ctx,
                stmt_index,
                source_line,
            ),
            Stmt::Assert { condition, message, .. } => {
                self.lower_assert_stmt(condition, message.as_ref(), current, stmt_index, source_line)
            }
            Stmt::If {
                condition,
                then_branch,
                else_branch,
                ..
            } => self.lower_if_stmt(
                condition,
                then_branch,
                else_branch.as_deref(),
                current,
                loop_ctx,
                try_ctx,
                stmt_index,
                source_line,
            ),
            Stmt::While { condition, body, .. } => {
                self.lower_while_stmt(condition, body, current, try_ctx, stmt_index, source_line)
            }
            Stmt::DoWhile { body, condition, .. } => {
                self.lower_do_while_stmt(body, condition, current, try_ctx, stmt_index, source_line)
            }
            Stmt::For {
                init,
                condition,
                update,
                body,
                ..
            } => self.lower_for_stmt(
                init.as_deref(),
                condition.as_ref(),
                update.as_deref(),
                body,
                current,
                loop_ctx,
                try_ctx,
                stmt_index,
                source_line,
            ),
            Stmt::ForEach {
                ty,
                name,
                iterable,
                body,
                ..
            } => self.lower_foreach(ty, name, iterable, body, current, try_ctx, stmt_index, source_line),
            Stmt::Switch {
                expr,
                cases,
                default,
                ..
            } => self.lower_switch(
                expr,
                cases,
                default.as_deref(),
                current,
                loop_ctx,
                try_ctx,
                stmt_index,
                source_line,
            ),
        }
    }
}
