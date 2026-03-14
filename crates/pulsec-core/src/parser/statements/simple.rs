use super::*;
use super::super::shared::tokens::can_start_type_name;

impl Parser {
    pub(crate) fn parse_simple_statement(&mut self) -> Result<Stmt, ParseError> {
        let source_line = self.current_line();
        if self.matches_keyword("break") {
            self.expect_symbol(";")?;
            return Ok(Stmt::Break { source_line });
        }

        if self.matches_keyword("assert") {
            let condition = self.parse_expression()?;
            let message = if self.matches_symbol(":") {
                Some(self.parse_expression()?)
            } else {
                None
            };
            self.expect_symbol(";")?;
            return Ok(Stmt::Assert {
                condition,
                message,
                source_line,
            });
        }

        if self.matches_keyword("synchronized") {
            return Err(self.error_here(
                "Synchronized statements are not supported in the current F1 baseline",
            ));
        }

        if self.matches_keyword("continue") {
            self.expect_symbol(";")?;
            return Ok(Stmt::Continue { source_line });
        }

        if self.matches_keyword("throw") {
            let expr = self.parse_expression()?;
            self.expect_symbol(";")?;
            return Ok(Stmt::Throw(expr, source_line));
        }

        if self.matches_keyword("yield") {
            return Err(self.error_here(
                "Switch-expression block arms with 'yield' are not supported in the current pre-self-host slice",
            ));
        }

        if self.matches_keyword("return") {
            if self.matches_symbol(";") {
                return Ok(Stmt::Return(None, source_line));
            }
            let expr = self.parse_expression()?;
            self.expect_symbol(";")?;
            return Ok(Stmt::Return(Some(expr), source_line));
        }

        if self.looks_like_var_decl() {
            let ty = self.expect_type_name("Expected local variable type")?;
            let name = self.expect_identifier("Expected local variable name")?;
            let init = if self.matches_symbol("=") {
                Some(self.parse_expression()?)
            } else {
                None
            };
            self.expect_symbol(";")?;
            return Ok(Stmt::VarDecl {
                ty,
                name,
                init,
                source_line,
            });
        }

        if let Some(stmt) = self.try_parse_assignment_statement()? {
            return Ok(stmt);
        }

        let expr = self.parse_expression()?;
        self.expect_symbol(";")?;
        Ok(Stmt::ExprStmt(expr, source_line))
    }

    pub(crate) fn looks_like_var_decl(&self) -> bool {
        if !can_start_type_name(self.peek()) {
            return false;
        }
        let mut idx = 0usize;
        if !can_start_type_name(self.peek_n(idx)) {
            return false;
        }
        idx += 1;
        while self.peek_n(idx).kind == TokenKind::Symbol && self.peek_n(idx).lexeme == "." {
            idx += 1;
            if self.peek_n(idx).kind != TokenKind::Identifier {
                return false;
            }
            idx += 1;
        }
        if self.peek_n(idx).kind == TokenKind::Symbol && self.peek_n(idx).lexeme == "<" {
            let mut depth = 0usize;
            while self.peek_n(idx).kind != TokenKind::Eof {
                let token = self.peek_n(idx);
                if token.kind == TokenKind::Symbol {
                    match token.lexeme.as_str() {
                        "<" => depth += 1,
                        ">" => {
                            depth = depth.saturating_sub(1);
                            if depth == 0 {
                                idx += 1;
                                break;
                            }
                        }
                        _ => {}
                    }
                }
                idx += 1;
            }
            if depth != 0 {
                return false;
            }
        }
        while self.peek_n(idx).kind == TokenKind::Symbol && self.peek_n(idx).lexeme == "[" {
            if self.peek_n(idx + 1).kind != TokenKind::Symbol || self.peek_n(idx + 1).lexeme != "]" {
                return false;
            }
            idx += 2;
        }
        self.peek_n(idx).kind == TokenKind::Identifier
    }

    pub(crate) fn try_parse_assignment_statement(&mut self) -> Result<Option<Stmt>, ParseError> {
        let checkpoint = self.current;
        let stmt = self.try_parse_assignment_statement_without_semicolon()?;
        if stmt.is_some() {
            self.expect_symbol(";")?;
            return Ok(stmt);
        }
        self.current = checkpoint;
        Ok(None)
    }

    pub(crate) fn try_parse_assignment_statement_without_semicolon(
        &mut self,
    ) -> Result<Option<Stmt>, ParseError> {
        let checkpoint = self.current;
        let target = match self.parse_assignment_target() {
            Ok(target) => target,
            Err(_) => {
                self.current = checkpoint;
                return Ok(None);
            }
        };

        if self.matches_symbol("=") {
            let value = self.parse_expression()?;
            return Ok(Some(Stmt::Assign {
                target,
                value,
                source_line: self.line_of_position(self.tokens[checkpoint].position),
            }));
        }

        let compound_op = if self.matches_symbol("+") && self.matches_symbol("=") {
            Some(BinaryOp::Add)
        } else if self.matches_symbol("-") && self.matches_symbol("=") {
            Some(BinaryOp::Sub)
        } else if self.matches_symbol("*") && self.matches_symbol("=") {
            Some(BinaryOp::Mul)
        } else if self.matches_symbol("/") && self.matches_symbol("=") {
            Some(BinaryOp::Div)
        } else if self.matches_symbol("&") && self.matches_symbol("=") {
            Some(BinaryOp::BitAnd)
        } else if self.matches_symbol("|") && self.matches_symbol("=") {
            Some(BinaryOp::BitOr)
        } else if self.matches_symbol("^") && self.matches_symbol("=") {
            Some(BinaryOp::BitXor)
        } else if self.matches_symbol_sequence(&["<", "<", "="]) {
            Some(BinaryOp::ShiftLeft)
        } else if self.matches_symbol_sequence(&[">", ">", ">", "="]) {
            Some(BinaryOp::UnsignedShiftRight)
        } else if self.matches_symbol_sequence(&[">", ">", "="]) {
            Some(BinaryOp::ShiftRight)
        } else {
            None
        };

        if let Some(op) = compound_op {
            let value = self.parse_expression()?;
            return Ok(Some(Stmt::CompoundAssign {
                target,
                op,
                value,
                source_line: self.line_of_position(self.tokens[checkpoint].position),
            }));
        }

        self.current = checkpoint;
        Ok(None)
    }
}
