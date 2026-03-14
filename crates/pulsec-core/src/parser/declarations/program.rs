use super::*;

impl Parser {
    pub(crate) fn parse_program(&mut self) -> Result<Program, ParseError> {
        let package = self.parse_package_decl()?;

        let mut imports = Vec::new();
        while self.matches_keyword("import") {
            imports.push(self.parse_import_decl()?);
        }

        let mut classes = Vec::new();
        while !self.is_eof() {
            classes.push(self.parse_class_decl()?);
        }

        if classes.is_empty() {
            return Err(self.error_here("Expected at least one class declaration"));
        }

        Ok(Program {
            package,
            imports,
            classes,
        })
    }

    fn parse_package_decl(&mut self) -> Result<PackageDecl, ParseError> {
        self.expect_keyword("package")?;
        let name = self.expect_path()?;
        self.expect_symbol(";")?;
        Ok(PackageDecl { name })
    }

    fn parse_import_decl(&mut self) -> Result<ImportDecl, ParseError> {
        let is_static = self.matches_keyword("static");
        let (path, is_wildcard) = self.expect_import_path()?;
        self.expect_symbol(";")?;
        Ok(ImportDecl {
            path,
            is_static,
            is_wildcard,
        })
    }

    fn parse_class_decl(&mut self) -> Result<ClassDecl, ParseError> {
        let annotations = self.parse_annotations()?;
        let modifiers = self.parse_modifiers();
        let (is_interface, is_annotation, is_enum) = if self.matches_keyword("class") {
            (false, false, false)
        } else if self.check_symbol("@")
            && self.peek_n(1).kind == TokenKind::Keyword
            && self.peek_n(1).lexeme == "interface"
        {
            self.expect_symbol("@")?;
            self.expect_keyword("interface")?;
            (true, true, false)
        } else if self.matches_keyword("interface") {
            (true, false, false)
        } else if self.matches_keyword("enum") {
            (false, false, true)
        } else {
            return Err(self.error_here(
                "Expected 'class', 'interface', 'enum', or '@interface' declaration",
            ));
        };
        let name = self.expect_identifier("Expected class name")?;
        let type_params = self.parse_optional_type_params()?;
        if is_enum {
            let enum_constants = self.parse_enum_constants()?;
            return Ok(ClassDecl {
                annotations,
                modifiers,
                name,
                type_params,
                is_interface: false,
                is_annotation: false,
                is_enum: true,
                extends: None,
                implements: Vec::new(),
                enum_constants,
                members: Vec::new(),
            });
        }
        let saw_extends = self.matches_keyword("extends");
        let extends = if saw_extends {
            if is_interface {
                None
            } else {
                Some(self.expect_path()?)
            }
        } else {
            None
        };
        let implements = if is_interface && saw_extends {
            self.parse_type_path_list("Expected interface name after 'extends'")?
        } else if self.matches_keyword("implements") {
            if is_interface {
                return Err(self.error_here(
                    "Interfaces cannot use 'implements'; use 'extends'",
                ));
            }
            self.parse_type_path_list("Expected interface name after 'implements'")?
        } else {
            Vec::new()
        };
        self.expect_symbol("{")?;

        let mut members = Vec::new();
        while !self.check_symbol("}") {
            if self.is_eof() {
                return Err(self.error_here("Unterminated class body"));
            }
            members.push(self.parse_class_member(&name, is_interface || is_annotation)?);
        }

        self.expect_symbol("}")?;
        Ok(ClassDecl {
            annotations,
            modifiers,
            name,
            type_params,
            is_interface,
            is_annotation,
            is_enum,
            extends,
            implements,
            enum_constants: Vec::new(),
            members,
        })
    }

    fn parse_enum_constants(&mut self) -> Result<Vec<String>, ParseError> {
        self.expect_symbol("{")?;
        let mut constants = Vec::new();
        while !self.check_symbol("}") {
            let name = self.expect_identifier("Expected enum constant name")?;
            constants.push(name);
            if self.matches_symbol(",") {
                if self.check_symbol("}") {
                    break;
                }
                continue;
            }
            break;
        }
        self.expect_symbol("}")?;
        if constants.is_empty() {
            return Err(self.error_here("Enum declaration must define at least one constant"));
        }
        Ok(constants)
    }
}
