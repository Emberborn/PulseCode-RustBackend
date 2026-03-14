use super::*;
impl Parser {
    pub(crate) fn parse_block_statements(&mut self) -> Result<Vec<Stmt>, ParseError> {
        let mut stmts = Vec::new();
        while !self.check_symbol("}") {
            if self.is_eof() {
                return Err(self.error_here("Unterminated method body"));
            }
            stmts.push(self.parse_statement()?);
        }
        self.expect_symbol("}")?;
        Ok(stmts)
    }

    pub(crate) fn parse_else_branch(&mut self) -> Result<Vec<Stmt>, ParseError> {
        if self.matches_keyword("if") {
            let source_line = self.current_line();
            self.expect_symbol("(")?;
            let condition = self.parse_expression()?;
            self.expect_symbol(")")?;
            let then_branch = self.parse_required_block("if")?;
            let else_branch = if self.matches_keyword("else") {
                Some(self.parse_else_branch()?)
            } else {
                None
            };
            Ok(vec![Stmt::If {
                condition,
                then_branch,
                else_branch,
                source_line,
            }])
        } else {
            self.parse_required_block("else")
        }
    }

    pub(crate) fn parse_for_init(&mut self) -> Result<Stmt, ParseError> {
        let source_line = self.current_line();
        if self.looks_like_var_decl() {
            let ty = self.expect_type_name("Expected local variable type")?;
            let name = self.expect_identifier("Expected local variable name")?;
            let init = if self.matches_symbol("=") {
                Some(self.parse_expression()?)
            } else {
                None
            };
            return Ok(Stmt::VarDecl {
                ty,
                name,
                init,
                source_line,
            });
        }
        self.try_parse_assignment_statement_without_semicolon()?
            .ok_or_else(|| self.error_here("Expected for-loop initializer"))
    }

    pub(crate) fn parse_for_update(&mut self) -> Result<Stmt, ParseError> {
        self.try_parse_assignment_statement_without_semicolon()?
            .ok_or_else(|| self.error_here("Expected for-loop updater"))
    }

    pub(crate) fn parse_required_block(&mut self, context: &str) -> Result<Vec<Stmt>, ParseError> {
        if !self.matches_symbol("{") {
            return Err(self.error_here(&format!(
                "Expected '{{' to start {} block",
                context
            )));
        }
        self.parse_block_statements()
    }

    pub(crate) fn parse_switch_body(&mut self) -> Result<Vec<Stmt>, ParseError> {
        let mut body = Vec::new();
        while !self.check_symbol("}") && !self.check_keyword("case") && !self.check_keyword("default") {
            body.push(self.parse_statement()?);
        }
        Ok(body)
    }

    pub(crate) fn parse_statement(&mut self) -> Result<Stmt, ParseError> {
        let source_line = self.current_line();
        if self.check_keyword("class")
            || self.check_keyword("interface")
            || self.check_keyword("enum")
            || (self.check_symbol("@")
                && self.peek_n(1).kind == TokenKind::Keyword
                && self.peek_n(1).lexeme == "interface")
        {
            return Err(self.error_here(
                "Local type declarations are not supported before self-host; declare the type at top level",
            ));
        }

        if self.matches_keyword("if") {
            self.expect_symbol("(")?;
            let condition = self.parse_expression()?;
            self.expect_symbol(")")?;
            let then_branch = self.parse_required_block("if")?;
            let else_branch = if self.matches_keyword("else") {
                Some(self.parse_else_branch()?)
            } else {
                None
            };
            return Ok(Stmt::If {
                condition,
                then_branch,
                else_branch,
                source_line,
            });
        }

        if self.matches_keyword("while") {
            self.expect_symbol("(")?;
            let condition = self.parse_expression()?;
            self.expect_symbol(")")?;
            let body = self.parse_required_block("while")?;
            return Ok(Stmt::While {
                condition,
                body,
                source_line,
            });
        }

        if self.matches_keyword("do") {
            let body = self.parse_required_block("do-while")?;
            self.expect_keyword("while")?;
            self.expect_symbol("(")?;
            let condition = self.parse_expression()?;
            self.expect_symbol(")")?;
            self.expect_symbol(";")?;
            return Ok(Stmt::DoWhile {
                body,
                condition,
                source_line,
            });
        }

        if self.matches_keyword("for") {
            self.expect_symbol("(")?;
            let checkpoint = self.current;
            if let Ok(ty) = self.expect_type_name("Expected foreach loop variable type") {
                if let Ok(name) = self.expect_identifier("Expected foreach loop variable name") {
                    if self.matches_symbol(":") {
                        let iterable = self.parse_expression()?;
                        self.expect_symbol(")")?;
                        let body = self.parse_required_block("for")?;
                        return Ok(Stmt::ForEach {
                            ty,
                            name,
                            iterable,
                            body,
                            source_line,
                        });
                    }
                }
            }
            self.current = checkpoint;

            let init = if self.matches_symbol(";") {
                None
            } else {
                let stmt = self.parse_for_init()?;
                self.expect_symbol(";")?;
                Some(Box::new(stmt))
            };

            let condition = if self.matches_symbol(";") {
                None
            } else {
                let expr = self.parse_expression()?;
                self.expect_symbol(";")?;
                Some(expr)
            };

            let update = if self.check_symbol(")") {
                None
            } else {
                Some(Box::new(self.parse_for_update()?))
            };

            self.expect_symbol(")")?;
            let body = self.parse_required_block("for")?;
            return Ok(Stmt::For {
                init,
                condition,
                update,
                body,
                source_line,
            });
        }

        if self.matches_keyword("switch") {
            self.expect_symbol("(")?;
            let expr = self.parse_expression()?;
            self.expect_symbol(")")?;
            self.expect_symbol("{")?;

            let mut cases = Vec::new();
            let mut default = None;
            while !self.check_symbol("}") {
                if self.matches_keyword("case") {
                    let label = self.parse_expression()?;
                    self.expect_symbol(":")?;
                    let body = self.parse_switch_body()?;
                    cases.push(SwitchCase { label, body });
                    continue;
                }
                if self.matches_keyword("default") {
                    self.expect_symbol(":")?;
                    default = Some(self.parse_switch_body()?);
                    continue;
                }
                return Err(self.error_here("Expected 'case' or 'default' in switch body"));
            }

            self.expect_symbol("}")?;
            return Ok(Stmt::Switch {
                expr,
                cases,
                default,
                source_line,
            });
        }

        if self.matches_keyword("try") {
            if self.matches_symbol("(") {
                return Err(self.error_here(
                    "Try-with-resources is not supported in the current F1 baseline",
                ));
            }
            let body = self.parse_required_block("try")?;
            let mut catches = Vec::new();
            while self.matches_keyword("catch") {
                self.expect_symbol("(")?;
                let ty = self.expect_type_name("Expected catch parameter type")?;
                let name = self.expect_identifier("Expected catch parameter name")?;
                self.expect_symbol(")")?;
                let catch_body = self.parse_required_block("catch")?;
                catches.push(CatchClause { ty, name, body: catch_body });
            }
            let finally_block = if self.matches_keyword("finally") {
                Some(self.parse_required_block("finally")?)
            } else {
                None
            };
            if catches.is_empty() && finally_block.is_none() {
                return Err(self.error_here(
                    "Try statement must declare at least one catch or finally block",
                ));
            }
            return Ok(Stmt::Try {
                body,
                catches,
                finally_block,
                source_line,
            });
        }

        self.parse_simple_statement()
    }
}
