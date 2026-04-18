use super::super::shared::tokens::can_start_type_name;
use super::*;

impl Parser {
    pub(crate) fn parse_type_path_list(
        &mut self,
        first_message: &str,
    ) -> Result<Vec<String>, ParseError> {
        let mut out = Vec::new();
        if !can_start_type_name(self.peek()) {
            return Err(self.error_here(first_message));
        }
        out.push(self.expect_type_name(first_message)?);
        while self.matches_symbol(",") {
            out.push(self.expect_type_name(first_message)?);
        }
        Ok(out)
    }

    pub(crate) fn parse_annotations(&mut self) -> Result<Vec<Annotation>, ParseError> {
        let mut out = Vec::new();
        while self.check_symbol("@") {
            self.expect_symbol("@")?;
            let name = self.expect_path()?;
            if self.matches_symbol("(") {
                self.expect_symbol(")")?;
            }
            out.push(Annotation { name });
        }
        Ok(out)
    }

    pub(crate) fn parse_params(&mut self) -> Result<Vec<ParamDecl>, ParseError> {
        self.expect_symbol("(")?;

        let mut params = Vec::new();
        if !self.check_symbol(")") {
            let mut saw_varargs = false;
            loop {
                if saw_varargs {
                    return Err(self.error_here("Varargs parameter must be the last parameter"));
                }
                let mut ty = self.expect_type_name("Expected parameter type")?;
                let mut is_varargs = false;
                if self.matches_symbol("...") {
                    ty.push_str("[]");
                    saw_varargs = true;
                    is_varargs = true;
                }
                let name = self.expect_identifier("Expected parameter name")?;
                params.push(ParamDecl {
                    ty,
                    name,
                    is_varargs,
                });

                if self.matches_symbol(",") {
                    continue;
                }
                break;
            }
        }

        self.expect_symbol(")")?;
        Ok(params)
    }

    pub(crate) fn parse_modifiers(&mut self) -> Vec<Modifier> {
        let mut modifiers = Vec::new();

        while let Some(modifier) = self.current_modifier() {
            modifiers.push(modifier);
            self.advance();
        }

        modifiers
    }

    fn current_modifier(&self) -> Option<Modifier> {
        let token = self.peek();
        if token.kind != TokenKind::Keyword {
            return None;
        }

        match token.lexeme.as_str() {
            "public" => Some(Modifier::Public),
            "private" => Some(Modifier::Private),
            "protected" => Some(Modifier::Protected),
            "default" => Some(Modifier::Default),
            "static" => Some(Modifier::Static),
            "abstract" => Some(Modifier::Abstract),
            "final" => Some(Modifier::Final),
            "synchronized" => Some(Modifier::Synchronized),
            "native" => Some(Modifier::Native),
            "strictfp" => Some(Modifier::Strictfp),
            "transient" => Some(Modifier::Transient),
            "volatile" => Some(Modifier::Volatile),
            "async" => Some(Modifier::Async),
            _ => None,
        }
    }
}
