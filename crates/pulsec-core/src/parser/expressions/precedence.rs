use super::*;

impl Parser {
    pub(crate) fn parse_expression(&mut self) -> Result<Expr, ParseError> {
        self.parse_conditional()
    }

    pub(crate) fn parse_conditional(&mut self) -> Result<Expr, ParseError> {
        let condition = self.parse_logical_or()?;
        if !self.matches_symbol("?") {
            return Ok(condition);
        }

        let then_expr = self.parse_expression()?;
        self.expect_symbol(":")?;
        let else_expr = self.parse_conditional()?;
        Ok(Expr::Conditional {
            condition: Box::new(condition),
            then_expr: Box::new(then_expr),
            else_expr: Box::new(else_expr),
        })
    }

    pub(crate) fn parse_logical_or(&mut self) -> Result<Expr, ParseError> {
        let mut expr = self.parse_logical_and()?;
        while self.matches_symbol_pair("|", "|") {
            let right = self.parse_logical_and()?;
            expr = Expr::Binary {
                left: Box::new(expr),
                op: BinaryOp::LogicalOr,
                right: Box::new(right),
            };
        }
        Ok(expr)
    }

    pub(crate) fn parse_logical_and(&mut self) -> Result<Expr, ParseError> {
        let mut expr = self.parse_bitwise_or()?;
        while self.matches_symbol_pair("&", "&") {
            let right = self.parse_bitwise_or()?;
            expr = Expr::Binary {
                left: Box::new(expr),
                op: BinaryOp::LogicalAnd,
                right: Box::new(right),
            };
        }
        Ok(expr)
    }

    pub(crate) fn parse_bitwise_or(&mut self) -> Result<Expr, ParseError> {
        let mut expr = self.parse_bitwise_xor()?;
        while self.check_symbol("|")
            && !(self.peek_n(1).kind == TokenKind::Symbol && self.peek_n(1).lexeme == "|")
        {
            self.advance();
            let right = self.parse_bitwise_xor()?;
            expr = Expr::Binary {
                left: Box::new(expr),
                op: BinaryOp::BitOr,
                right: Box::new(right),
            };
        }
        Ok(expr)
    }

    pub(crate) fn parse_bitwise_xor(&mut self) -> Result<Expr, ParseError> {
        let mut expr = self.parse_bitwise_and()?;
        while self.matches_symbol("^") {
            let right = self.parse_bitwise_and()?;
            expr = Expr::Binary {
                left: Box::new(expr),
                op: BinaryOp::BitXor,
                right: Box::new(right),
            };
        }
        Ok(expr)
    }

    pub(crate) fn parse_bitwise_and(&mut self) -> Result<Expr, ParseError> {
        let mut expr = self.parse_equality()?;
        while self.check_symbol("&")
            && !(self.peek_n(1).kind == TokenKind::Symbol && self.peek_n(1).lexeme == "&")
        {
            self.advance();
            let right = self.parse_equality()?;
            expr = Expr::Binary {
                left: Box::new(expr),
                op: BinaryOp::BitAnd,
                right: Box::new(right),
            };
        }
        Ok(expr)
    }

    pub(crate) fn parse_equality(&mut self) -> Result<Expr, ParseError> {
        let mut expr = self.parse_comparison()?;
        loop {
            let op = if self.matches_symbol_pair("=", "=") {
                Some(BinaryOp::Eq)
            } else if self.matches_symbol_pair("!", "=") {
                Some(BinaryOp::NotEq)
            } else {
                None
            };
            let Some(op) = op else { break };
            let right = self.parse_comparison()?;
            expr = Expr::Binary {
                left: Box::new(expr),
                op,
                right: Box::new(right),
            };
        }
        Ok(expr)
    }

    pub(crate) fn parse_comparison(&mut self) -> Result<Expr, ParseError> {
        let mut expr = self.parse_shift()?;
        loop {
            let op = if self.matches_symbol_pair("<", "=") {
                Some(BinaryOp::LessEq)
            } else if self.matches_symbol_pair(">", "=") {
                Some(BinaryOp::GreaterEq)
            } else if self.matches_symbol("<") {
                Some(BinaryOp::Less)
            } else if self.matches_symbol(">") {
                Some(BinaryOp::Greater)
            } else if self.matches_keyword("instanceof") {
                let ty = self.expect_type_name("Expected type after 'instanceof'")?;
                expr = Expr::InstanceOf {
                    expr: Box::new(expr),
                    ty,
                };
                continue;
            } else {
                None
            };
            let Some(op) = op else { break };
            let right = self.parse_shift()?;
            expr = Expr::Binary {
                left: Box::new(expr),
                op,
                right: Box::new(right),
            };
        }
        Ok(expr)
    }

    pub(crate) fn parse_shift(&mut self) -> Result<Expr, ParseError> {
        let mut expr = self.parse_additive()?;
        loop {
            let op = if self.matches_symbol_sequence(&[">", ">", ">"]) {
                Some(BinaryOp::UnsignedShiftRight)
            } else if self.matches_symbol_pair("<", "<") {
                Some(BinaryOp::ShiftLeft)
            } else if self.matches_symbol_pair(">", ">") {
                Some(BinaryOp::ShiftRight)
            } else {
                None
            };
            let Some(op) = op else { break };
            let right = self.parse_additive()?;
            expr = Expr::Binary {
                left: Box::new(expr),
                op,
                right: Box::new(right),
            };
        }
        Ok(expr)
    }

    pub(crate) fn parse_additive(&mut self) -> Result<Expr, ParseError> {
        let mut expr = self.parse_multiplicative()?;
        loop {
            let op = if self.matches_symbol("+") {
                Some(BinaryOp::Add)
            } else if self.matches_symbol("-") {
                Some(BinaryOp::Sub)
            } else {
                None
            };
            let Some(op) = op else { break };
            let right = self.parse_multiplicative()?;
            expr = Expr::Binary {
                left: Box::new(expr),
                op,
                right: Box::new(right),
            };
        }
        Ok(expr)
    }

    pub(crate) fn parse_multiplicative(&mut self) -> Result<Expr, ParseError> {
        let mut expr = self.parse_unary()?;
        loop {
            let op = if self.matches_symbol("*") {
                Some(BinaryOp::Mul)
            } else if self.matches_symbol("/") {
                Some(BinaryOp::Div)
            } else {
                None
            };
            let Some(op) = op else { break };
            let right = self.parse_unary()?;
            expr = Expr::Binary {
                left: Box::new(expr),
                op,
                right: Box::new(right),
            };
        }
        Ok(expr)
    }

    pub(crate) fn parse_unary(&mut self) -> Result<Expr, ParseError> {
        if self.matches_symbol_pair("+", "+") {
            let target = self.parse_assignment_target()?;
            return Ok(Expr::IncDec { target: Box::new(target), op: IncDecOp::Inc, prefix: true });
        }
        if self.matches_symbol_pair("-", "-") {
            let target = self.parse_assignment_target()?;
            return Ok(Expr::IncDec { target: Box::new(target), op: IncDecOp::Dec, prefix: true });
        }
        if self.matches_symbol("!") {
            let expr = self.parse_unary()?;
            return Ok(Expr::Unary { op: UnaryOp::Not, expr: Box::new(expr) });
        }
        if self.matches_symbol("~") {
            let expr = self.parse_unary()?;
            return Ok(Expr::Unary { op: UnaryOp::BitNot, expr: Box::new(expr) });
        }
        if self.matches_symbol("-") {
            let expr = self.parse_unary()?;
            return Ok(Expr::Unary { op: UnaryOp::Neg, expr: Box::new(expr) });
        }
        if self.looks_like_cast_expression() {
            self.expect_symbol("(")?;
            let ty = self.parse_cast_type_name()?;
            self.expect_symbol(")")?;
            let expr = self.parse_unary()?;
            return Ok(Expr::Cast { ty, expr: Box::new(expr) });
        }
        self.parse_postfix()
    }
}
