use super::super::shared::tokens::{
    can_start_type_name, normalize_numeric_literal, parse_integer_literal, split_numeric_literal,
};
use super::*;
use crate::ArrayInitExpr;

impl Parser {
    fn parse_argument_list(&mut self) -> Result<Vec<Expr>, ParseError> {
        let mut args = Vec::new();
        if !self.check_symbol(")") {
            loop {
                args.push(self.parse_expression()?);
                if self.matches_symbol(",") {
                    continue;
                }
                break;
            }
        }
        Ok(args)
    }

    pub(crate) fn looks_like_cast_expression(&self) -> bool {
        if !self.check_symbol("(") || !can_start_type_name(self.peek_n(1)) {
            return false;
        }
        let mut idx = 2usize;
        let mut depth = 0usize;
        while self.peek_n(idx).kind == TokenKind::Symbol && self.peek_n(idx).lexeme == "<" {
            depth += 1;
            idx += 1;
            loop {
                let token = self.peek_n(idx);
                if token.kind == TokenKind::Eof {
                    return false;
                }
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
        }
        while self.peek_n(idx).kind == TokenKind::Symbol && self.peek_n(idx).lexeme == "[" {
            if self.peek_n(idx + 1).kind != TokenKind::Symbol || self.peek_n(idx + 1).lexeme != "]"
            {
                return false;
            }
            idx += 2;
        }
        self.peek_n(idx).kind == TokenKind::Symbol && self.peek_n(idx).lexeme == ")"
    }

    pub(crate) fn parse_cast_type_name(&mut self) -> Result<String, ParseError> {
        let mut name = self.expect_type_name("Expected cast target type")?;
        while self.matches_symbol("[") {
            self.expect_symbol("]")?;
            name.push_str("[]");
        }
        Ok(name)
    }

    pub(crate) fn parse_postfix(&mut self) -> Result<Expr, ParseError> {
        let mut expr = self.parse_primary()?;
        loop {
            if self.matches_symbol("::") {
                return Err(self
                    .error_here("Method references are not supported in the current F1 baseline"));
            }
            if self.matches_symbol("(") {
                let args = self.parse_argument_list()?;
                self.expect_symbol(")")?;
                expr = Expr::Call {
                    callee: Box::new(expr),
                    args,
                };
                continue;
            }
            if self.matches_symbol(".") {
                let member = self.expect_identifier("Expected member name after '.'")?;
                expr = Expr::MemberAccess {
                    object: Box::new(expr),
                    member,
                };
                continue;
            }
            if self.matches_symbol("[") {
                let index = self.parse_expression()?;
                self.expect_symbol("]")?;
                expr = Expr::ArrayAccess {
                    array: Box::new(expr),
                    index: Box::new(index),
                };
                continue;
            }
            if self.matches_symbol_pair("+", "+") {
                expr = Expr::IncDec {
                    target: Box::new(expr),
                    op: IncDecOp::Inc,
                    prefix: false,
                };
                continue;
            }
            if self.matches_symbol_pair("-", "-") {
                expr = Expr::IncDec {
                    target: Box::new(expr),
                    op: IncDecOp::Dec,
                    prefix: false,
                };
                continue;
            }
            break;
        }
        Ok(expr)
    }

    pub(crate) fn parse_primary(&mut self) -> Result<Expr, ParseError> {
        if self.matches_keyword("new") {
            return self.parse_new_expression();
        }
        if self.matches_keyword("switch") {
            return self.parse_switch_expression();
        }
        if self.matches_keyword("true") {
            return Ok(Expr::BoolLiteral(true));
        }
        if self.matches_keyword("false") {
            return Ok(Expr::BoolLiteral(false));
        }
        if self.matches_keyword("null") {
            return Ok(Expr::NullLiteral);
        }
        if self.matches_keyword("this") {
            return Ok(Expr::This);
        }
        if self.matches_keyword("super") {
            return Ok(Expr::Super);
        }
        if self.peek().kind == TokenKind::Number {
            let token = self.peek().clone();
            self.advance();
            return self.parse_number_literal(&token);
        }
        if self.peek().kind == TokenKind::String {
            let token = self.peek().clone();
            self.advance();
            return Ok(Expr::StringLiteral(token.lexeme));
        }
        if self.peek().kind == TokenKind::Char {
            let token = self.peek().clone();
            self.advance();
            let value = token
                .lexeme
                .chars()
                .next()
                .ok_or_else(|| self.error_here("Expected character literal"))?;
            return Ok(Expr::CharLiteral(value));
        }
        if self.matches_symbol("(") {
            if self.check_symbol(")")
                && self.peek_n(1).kind == TokenKind::Symbol
                && self.peek_n(1).lexeme == "->"
            {
                return Err(self.error_here(
                    "Lambda expressions are not supported in the current F1 baseline",
                ));
            }
            let expr = self.parse_expression()?;
            self.expect_symbol(")")?;
            if self.check_symbol("->") {
                return Err(self.error_here(
                    "Lambda expressions are not supported in the current F1 baseline",
                ));
            }
            return Ok(expr);
        }

        if (self.peek().kind == TokenKind::Identifier || self.peek().kind == TokenKind::Keyword)
            && self.peek_n(1).kind == TokenKind::Symbol
            && self.peek_n(1).lexeme == "->"
        {
            return Err(
                self.error_here("Lambda expressions are not supported in the current F1 baseline")
            );
        }

        let name = self.expect_identifier("Expected expression")?;
        Ok(Expr::Var(name))
    }

    fn parse_switch_expression(&mut self) -> Result<Expr, ParseError> {
        self.expect_symbol("(")?;
        let expr = self.parse_expression()?;
        self.expect_symbol(")")?;
        self.expect_symbol("{")?;

        let mut cases = Vec::new();
        let mut default = None;
        while !self.check_symbol("}") {
            if self.matches_keyword("case") {
                let label = self.parse_expression()?;
                self.expect_symbol("->")?;
                if self.check_symbol("{") {
                    return Err(self.error_here(
                        "Switch-expression block arms with 'yield' are not supported in the current pre-self-host slice",
                    ));
                }
                let value = self.parse_expression()?;
                self.expect_symbol(";")?;
                cases.push(SwitchExprCase { label, value });
                continue;
            }
            if self.matches_keyword("default") {
                self.expect_symbol("->")?;
                if self.check_symbol("{") {
                    return Err(self.error_here(
                        "Switch-expression block arms with 'yield' are not supported in the current pre-self-host slice",
                    ));
                }
                let value = self.parse_expression()?;
                self.expect_symbol(";")?;
                default = Some(value);
                continue;
            }
            return Err(self.error_here("Expected 'case' or 'default' in switch expression"));
        }

        self.expect_symbol("}")?;
        let default = default.ok_or_else(|| {
            self.error_here(
                "Switch expression requires a default arm in the current pre-self-host slice",
            )
        })?;
        Ok(Expr::SwitchExpr {
            expr: Box::new(expr),
            cases,
            default: Box::new(default),
        })
    }

    fn parse_new_expression(&mut self) -> Result<Expr, ParseError> {
        let element_ty =
            self.expect_non_array_type_name("Expected array element type after 'new'")?;
        if self.matches_symbol("(") {
            let args = self.parse_argument_list()?;
            self.expect_symbol(")")?;
            if self.check_symbol("{") {
                return Err(self.error_here(
                    "Anonymous class bodies are not supported before self-host; declare a named top-level type instead",
                ));
            }
            return Ok(Expr::NewObject {
                class_name: element_ty,
                args,
            });
        }
        if !self.matches_symbol("[") {
            return Err(self.error_here("Expected '(' or '[' after type name in 'new' expression"));
        }
        let mut lengths = Vec::new();
        let mut saw_empty_dimension = false;
        let mut empty_dimensions = 0usize;
        loop {
            if self.matches_symbol("]") {
                saw_empty_dimension = true;
                empty_dimensions += 1;
            } else {
                if saw_empty_dimension {
                    return Err(self.error_here(
                        "Partially specified multidimensional array creation is not supported yet",
                    ));
                }
                let length = self.parse_expression()?;
                self.expect_symbol("]")?;
                lengths.push(length);
            }
            if !self.matches_symbol("[") {
                break;
            }
        }
        if self.check_symbol("{") {
            if !lengths.is_empty() {
                return Err(self.error_here(
                    "Array initializer expressions cannot follow explicit array lengths",
                ));
            }
            return Ok(Expr::NewArrayInitialized {
                element_ty,
                dimensions: empty_dimensions,
                values: self.parse_array_initializer()?,
            });
        }
        if lengths.is_empty() {
            return Err(self
                .error_here("Array creation must provide at least one length or an initializer"));
        }
        Ok(Expr::NewArray {
            element_ty,
            lengths,
        })
    }

    fn parse_array_initializer(&mut self) -> Result<Vec<ArrayInitExpr>, ParseError> {
        self.expect_symbol("{")?;
        let mut values = Vec::new();
        if !self.check_symbol("}") {
            loop {
                if self.check_symbol("{") {
                    values.push(ArrayInitExpr::Nested(self.parse_array_initializer()?));
                } else {
                    values.push(ArrayInitExpr::Expr(self.parse_expression()?));
                }
                if self.matches_symbol(",") {
                    if self.check_symbol("}") {
                        break;
                    }
                    continue;
                }
                break;
            }
        }
        self.expect_symbol("}")?;
        Ok(values)
    }

    pub(crate) fn parse_number_literal(&self, token: &Token) -> Result<Expr, ParseError> {
        let (numeric, suffix) = split_numeric_literal(token.lexeme.as_str());
        let normalized = normalize_numeric_literal(numeric, token.position, token.lexeme.as_str())?;
        match suffix {
            Some('f') | Some('F') => Ok(Expr::FloatLiteral(normalized)),
            Some('d') | Some('D') => Ok(Expr::DoubleLiteral(normalized)),
            Some('l') | Some('L') => {
                parse_integer_literal(&normalized, token.position, token.lexeme.as_str())
                    .map(Expr::LongLiteral)
            }
            Some(other) => Err(ParseError {
                message: format!("Unsupported numeric literal suffix '{}'", other),
                position: token.position,
            }),
            None => {
                if numeric.contains('.') {
                    Ok(Expr::DoubleLiteral(normalized))
                } else {
                    let value =
                        parse_integer_literal(&normalized, token.position, token.lexeme.as_str())?;
                    if value > i32::MAX as i64 || value < i32::MIN as i64 {
                        return Err(ParseError {
                            position: token.position,
                            message: format!(
                                "Unsuffixed integer literal '{}' exceeds int range",
                                token.lexeme
                            ),
                        });
                    }
                    Ok(Expr::IntLiteral(value))
                }
            }
        }
    }

    pub(crate) fn parse_assignment_target(&mut self) -> Result<Expr, ParseError> {
        let expr = self.parse_postfix()?;
        match expr {
            Expr::Var(_) | Expr::MemberAccess { .. } | Expr::ArrayAccess { .. } => Ok(expr),
            _ => Err(self.error_here("Expected assignment target")),
        }
    }
}
