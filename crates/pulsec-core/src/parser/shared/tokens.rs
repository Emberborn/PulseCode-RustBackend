use super::super::*;

impl Parser {
    pub(crate) fn current_line(&self) -> usize {
        self.line_of_position(self.peek().position)
    }

    pub(crate) fn line_of_position(&self, position: usize) -> usize {
        match self.line_starts.binary_search(&position) {
            Ok(idx) => idx + 1,
            Err(idx) => idx.max(1),
        }
    }

    pub(crate) fn expect_keyword(&mut self, expected: &str) -> Result<(), ParseError> {
        if self.matches_keyword(expected) {
            Ok(())
        } else {
            Err(self.error_here(&format!("Expected keyword '{expected}'")))
        }
    }

    pub(crate) fn expect_symbol(&mut self, expected: &str) -> Result<(), ParseError> {
        if self.matches_symbol(expected) {
            Ok(())
        } else {
            Err(self.error_here(&format!("Expected symbol '{expected}'")))
        }
    }

    pub(crate) fn expect_identifier(&mut self, message: &str) -> Result<String, ParseError> {
        if self.peek().kind == TokenKind::Identifier {
            let name = self.peek().lexeme.clone();
            self.advance();
            Ok(name)
        } else {
            Err(self.error_here(message))
        }
    }

    pub(crate) fn expect_type_name(&mut self, message: &str) -> Result<String, ParseError> {
        let mut name = self.expect_non_array_type_name(message)?;

        while self.matches_symbol("[") {
            self.expect_symbol("]")?;
            name.push_str("[]");
        }

        Ok(name)
    }

    pub(crate) fn expect_non_array_type_name(
        &mut self,
        message: &str,
    ) -> Result<String, ParseError> {
        let kind = self.peek().kind.clone();
        if kind != TokenKind::Identifier && kind != TokenKind::Keyword {
            return Err(self.error_here(message));
        }

        let mut name = self.peek().lexeme.clone();
        self.advance();

        if self.matches_symbol("<") {
            let mut args = Vec::new();
            loop {
                args.push(self.expect_type_name("Expected generic type argument")?);
                if self.matches_symbol(",") {
                    continue;
                }
                break;
            }
            self.expect_symbol(">")?;
            name.push('<');
            name.push_str(args.join(", ").as_str());
            name.push('>');
        }

        Ok(name)
    }

    pub(crate) fn parse_optional_type_params(&mut self) -> Result<Vec<String>, ParseError> {
        if !self.matches_symbol("<") {
            return Ok(Vec::new());
        }

        let mut params = Vec::new();
        loop {
            params.push(self.expect_identifier("Expected type parameter name")?);
            if self.matches_symbol(",") {
                continue;
            }
            break;
        }
        self.expect_symbol(">")?;
        Ok(params)
    }

    pub(crate) fn expect_path(&mut self) -> Result<String, ParseError> {
        let mut parts = Vec::new();
        parts.push(self.expect_identifier("Expected dotted path")?);

        while self.matches_symbol(".") {
            parts.push(self.expect_identifier("Expected identifier after '.'")?);
        }

        Ok(parts.join("."))
    }

    pub(crate) fn expect_import_path(&mut self) -> Result<(String, bool), ParseError> {
        let mut parts = Vec::new();
        parts.push(self.expect_identifier("Expected import path")?);

        let mut wildcard = false;
        while self.matches_symbol(".") {
            if self.matches_symbol("*") {
                wildcard = true;
                break;
            }
            parts.push(self.expect_identifier("Expected identifier after '.'")?);
        }

        Ok((parts.join("."), wildcard))
    }

    pub(crate) fn matches_keyword(&mut self, expected: &str) -> bool {
        if self.check_keyword(expected) {
            self.advance();
            true
        } else {
            false
        }
    }

    pub(crate) fn matches_symbol(&mut self, expected: &str) -> bool {
        if self.check_symbol(expected) {
            self.advance();
            true
        } else {
            false
        }
    }

    pub(crate) fn matches_symbol_pair(&mut self, first: &str, second: &str) -> bool {
        if self.check_symbol(first)
            && self.peek_n(1).kind == TokenKind::Symbol
            && self.peek_n(1).lexeme == second
        {
            self.advance();
            self.advance();
            true
        } else {
            false
        }
    }

    pub(crate) fn matches_symbol_sequence(&mut self, expected: &[&str]) -> bool {
        if expected.is_empty() {
            return false;
        }
        for (idx, symbol) in expected.iter().enumerate() {
            if self.peek_n(idx).kind != TokenKind::Symbol || self.peek_n(idx).lexeme != *symbol {
                return false;
            }
        }
        for _ in expected {
            self.advance();
        }
        true
    }

    pub(crate) fn check_keyword(&self, expected: &str) -> bool {
        let token = self.peek();
        token.kind == TokenKind::Keyword && token.lexeme == expected
    }

    pub(crate) fn check_symbol(&self, expected: &str) -> bool {
        let token = self.peek();
        token.kind == TokenKind::Symbol && token.lexeme == expected
    }

    pub(crate) fn peek(&self) -> &Token {
        &self.tokens[self.current]
    }

    pub(crate) fn peek_n(&self, n: usize) -> &Token {
        let index = (self.current + n).min(self.tokens.len().saturating_sub(1));
        &self.tokens[index]
    }

    pub(crate) fn advance(&mut self) {
        if !self.is_eof() {
            self.current += 1;
        }
    }

    pub(crate) fn is_eof(&self) -> bool {
        self.peek().kind == TokenKind::Eof
    }

    pub(crate) fn error_here(&self, message: &str) -> ParseError {
        ParseError {
            position: self.peek().position,
            message: message.to_string(),
        }
    }
}

pub(crate) fn can_start_type_name(token: &Token) -> bool {
    token.kind == TokenKind::Identifier || token.kind == TokenKind::Keyword
}

pub(crate) fn split_numeric_literal(lexeme: &str) -> (&str, Option<char>) {
    let mut chars = lexeme.chars();
    let last = chars.next_back();
    match last {
        Some(suffix @ ('l' | 'L' | 'f' | 'F' | 'd' | 'D')) => {
            (&lexeme[..lexeme.len() - 1], Some(suffix))
        }
        _ => (lexeme, None),
    }
}

pub(crate) fn normalize_numeric_literal(
    body: &str,
    position: usize,
    original: &str,
) -> Result<String, ParseError> {
    if body.contains('.') {
        let parts: Vec<&str> = body.split('.').collect();
        if parts.len() != 2 {
            return Err(ParseError {
                position,
                message: format!("Invalid floating literal '{original}'"),
            });
        }
        return Ok(format!(
            "{}.{}",
            parts[0].replace('_', ""),
            parts[1].replace('_', "")
        ));
    }
    if let Some(rest) = body.strip_prefix("0x").or_else(|| body.strip_prefix("0X")) {
        return Ok(format!("0x{}", rest.replace('_', "")));
    }
    if let Some(rest) = body.strip_prefix("0b").or_else(|| body.strip_prefix("0B")) {
        return Ok(format!("0b{}", rest.replace('_', "")));
    }
    Ok(body.replace('_', ""))
}

pub(crate) fn parse_integer_literal(
    normalized: &str,
    position: usize,
    original: &str,
) -> Result<i64, ParseError> {
    if let Some(rest) = normalized
        .strip_prefix("0x")
        .or_else(|| normalized.strip_prefix("0X"))
    {
        return i64::from_str_radix(rest, 16).map_err(|_| ParseError {
            position,
            message: format!("Invalid hexadecimal literal '{original}'"),
        });
    }
    if let Some(rest) = normalized
        .strip_prefix("0b")
        .or_else(|| normalized.strip_prefix("0B"))
    {
        return i64::from_str_radix(rest, 2).map_err(|_| ParseError {
            position,
            message: format!("Invalid binary literal '{original}'"),
        });
    }
    if normalized.len() > 1 && normalized.starts_with('0') {
        return i64::from_str_radix(&normalized[1..], 8).map_err(|_| ParseError {
            position,
            message: format!("Invalid octal literal '{original}'"),
        });
    }
    normalized.parse::<i64>().map_err(|_| ParseError {
        position,
        message: format!("Invalid integer literal '{original}'"),
    })
}
