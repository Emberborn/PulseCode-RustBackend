use super::*;

impl Parser {
    pub(crate) fn parse_class_member(
        &mut self,
        class_name: &str,
        in_interface: bool,
    ) -> Result<ClassMember, ParseError> {
        let annotations = self.parse_annotations()?;
        let modifiers = self.parse_modifiers();
        if self.check_keyword("class")
            || self.check_keyword("interface")
            || self.check_keyword("enum")
            || (self.check_symbol("@")
                && self.peek_n(1).kind == TokenKind::Keyword
                && self.peek_n(1).lexeme == "interface")
        {
            return Err(self.error_here(
                "Nested type declarations are not supported yet; declare the type at top level",
            ));
        }
        let method_type_params = self.parse_optional_type_params()?;
        let first = self.expect_type_name("Expected member type or constructor name")?;

        if self.check_symbol("(") {
            if in_interface {
                return Err(self.error_here("Interfaces cannot declare constructors"));
            }
            if !method_type_params.is_empty() {
                return Err(self.error_here(
                    "Constructors cannot declare type parameters in the current F1 generics baseline",
                ));
            }
            return Ok(ClassMember::Method(self.parse_constructor_decl(
                annotations,
                modifiers,
                class_name,
                first,
            )?));
        }

        let member_name = self.expect_identifier("Expected member name")?;

        if self.check_symbol("(") {
            Ok(ClassMember::Method(self.parse_method_decl(
                annotations,
                modifiers,
                method_type_params,
                first,
                member_name,
                in_interface,
            )?))
        } else {
            if !method_type_params.is_empty() {
                return Err(
                    self.error_here("Field declarations cannot use method-type-parameter syntax")
                );
            }
            if in_interface {
                return Err(self.error_here("Interfaces cannot declare fields yet"));
            }
            let init = if self.matches_symbol("=") {
                Some(self.parse_expression()?)
            } else {
                None
            };
            self.expect_symbol(";")?;
            Ok(ClassMember::Field(FieldDecl {
                annotations,
                modifiers,
                ty: first,
                name: member_name,
                init,
            }))
        }
    }

    pub(crate) fn parse_constructor_decl(
        &mut self,
        annotations: Vec<Annotation>,
        modifiers: Vec<Modifier>,
        class_name: &str,
        constructor_name: String,
    ) -> Result<MethodDecl, ParseError> {
        if constructor_name != class_name {
            return Err(self.error_here("Only class-named constructors may omit return type"));
        }

        let params = self.parse_params()?;
        let throws = self.parse_throws_clause()?;
        self.expect_symbol("{")?;
        let body = self.parse_block_statements()?;

        Ok(MethodDecl {
            annotations,
            modifiers,
            name: constructor_name,
            source_file: self.source_name.clone(),
            type_params: Vec::new(),
            params,
            throws,
            return_type: None,
            is_constructor: true,
            has_body: true,
            body,
        })
    }

    pub(crate) fn parse_method_decl(
        &mut self,
        annotations: Vec<Annotation>,
        mut modifiers: Vec<Modifier>,
        type_params: Vec<String>,
        return_type: String,
        name: String,
        in_interface: bool,
    ) -> Result<MethodDecl, ParseError> {
        let params = self.parse_params()?;
        let throws = self.parse_throws_clause()?;
        let is_abstract = modifiers.contains(&Modifier::Abstract);
        let (body, has_body) = if is_abstract || in_interface {
            if self.matches_symbol(";") {
                if in_interface {
                    if !modifiers.contains(&Modifier::Public)
                        && !modifiers.contains(&Modifier::Private)
                    {
                        modifiers.push(Modifier::Public);
                    }
                    if !modifiers.contains(&Modifier::Abstract)
                        && !modifiers.contains(&Modifier::Static)
                        && !modifiers.contains(&Modifier::Private)
                        && !modifiers.contains(&Modifier::Default)
                    {
                        modifiers.push(Modifier::Abstract);
                    }
                }
                (Vec::new(), false)
            } else {
                self.expect_symbol("{")?;
                if in_interface
                    && !modifiers.contains(&Modifier::Public)
                    && !modifiers.contains(&Modifier::Private)
                {
                    modifiers.push(Modifier::Public);
                }
                (self.parse_block_statements()?, true)
            }
        } else {
            self.expect_symbol("{")?;
            (self.parse_block_statements()?, true)
        };

        Ok(MethodDecl {
            annotations,
            modifiers,
            name,
            source_file: self.source_name.clone(),
            type_params,
            params,
            throws,
            return_type: Some(return_type),
            is_constructor: false,
            has_body,
            body,
        })
    }

    fn parse_throws_clause(&mut self) -> Result<Vec<String>, ParseError> {
        if !self.matches_keyword("throws") {
            return Ok(Vec::new());
        }

        let mut throws = Vec::new();
        loop {
            throws.push(self.expect_type_name("Expected throwable type after 'throws'")?);
            if !self.matches_symbol(",") {
                break;
            }
        }
        Ok(throws)
    }
}
