use super::*;

impl Parser {
    pub(crate) fn synchronized_wrapper_body(
        &self,
        monitor_local: String,
        monitor: Expr,
        body: Vec<Stmt>,
        source_line: usize,
    ) -> Vec<Stmt> {
        vec![
            Stmt::VarDecl {
                ty: "var".to_string(),
                name: monitor_local.clone(),
                init: Some(monitor),
                source_line,
            },
            Stmt::ExprStmt(
                Expr::Call {
                    callee: Box::new(Expr::MemberAccess {
                        object: Box::new(Expr::Var(monitor_local.clone())),
                        member: "enter".to_string(),
                    }),
                    args: Vec::new(),
                },
                source_line,
            ),
            Stmt::Try {
                resources: Vec::new(),
                body,
                catches: Vec::new(),
                finally_block: Some(vec![Stmt::ExprStmt(
                    Expr::Call {
                        callee: Box::new(Expr::MemberAccess {
                            object: Box::new(Expr::Var(monitor_local)),
                            member: "exit".to_string(),
                        }),
                        args: Vec::new(),
                    },
                    source_line,
                )]),
                source_line,
            },
        ]
    }

    fn class_visibility_modifiers(&self, class_modifiers: &[Modifier]) -> Vec<Modifier> {
        let mut visibility = Vec::new();
        for modifier in [Modifier::Public, Modifier::Protected, Modifier::Private] {
            if class_modifiers.contains(&modifier) {
                visibility.push(modifier);
            }
        }
        visibility
    }

    fn rewrite_synchronized_methods(
        &mut self,
        class_name: &str,
        class_modifiers: &[Modifier],
        members: &mut Vec<ClassMember>,
    ) {
        let has_instance_sync = members.iter().any(|member| {
            matches!(
                member,
                ClassMember::Method(method)
                    if method.has_body
                        && !method.is_constructor
                        && method.modifiers.contains(&Modifier::Synchronized)
                        && !method.modifiers.contains(&Modifier::Static)
            )
        });
        let has_static_sync = members.iter().any(|member| {
            matches!(
                member,
                ClassMember::Method(method)
                    if method.has_body
                        && !method.is_constructor
                        && method.modifiers.contains(&Modifier::Synchronized)
                        && method.modifiers.contains(&Modifier::Static)
            )
        });
        if !has_instance_sync && !has_static_sync {
            return;
        }

        let instance_monitor_field = "__pulse_instance_sync_monitor".to_string();
        let static_monitor_field = "__pulse_static_sync_monitor".to_string();

        if has_static_sync {
            members.insert(
                0,
                ClassMember::Field(FieldDecl {
                    annotations: Vec::new(),
                    modifiers: vec![Modifier::Private, Modifier::Static],
                    ty: "pulse.concurrent.Monitor".to_string(),
                    name: static_monitor_field.clone(),
                    init: Some(Expr::NewObject {
                        class_name: "pulse.concurrent.Monitor".to_string(),
                        args: Vec::new(),
                    }),
                }),
            );
        }

        if has_instance_sync {
            members.insert(
                0,
                ClassMember::Field(FieldDecl {
                    annotations: Vec::new(),
                    modifiers: vec![Modifier::Private],
                    ty: "pulse.concurrent.Monitor".to_string(),
                    name: instance_monitor_field.clone(),
                    init: None,
                }),
            );
        }

        for member in members.iter_mut() {
            let ClassMember::Method(method) = member else {
                continue;
            };
            if method.is_constructor && has_instance_sync {
                let source_line = method.body.first().map(|stmt| stmt.source_line()).unwrap_or(0);
                method.body.insert(
                    0,
                    Stmt::Assign {
                        target: Expr::MemberAccess {
                            object: Box::new(Expr::This),
                            member: instance_monitor_field.clone(),
                        },
                        value: Expr::NewObject {
                            class_name: "pulse.concurrent.Monitor".to_string(),
                            args: Vec::new(),
                        },
                        source_line,
                    },
                );
                continue;
            }
            if !method.has_body
                || method.is_constructor
                || !method.modifiers.contains(&Modifier::Synchronized)
            {
                continue;
            }
            method.modifiers.retain(|modifier| *modifier != Modifier::Synchronized);
            let source_line = method.body.first().map(|stmt| stmt.source_line()).unwrap_or(0);
            let monitor = if method.modifiers.contains(&Modifier::Static) {
                Expr::Var(static_monitor_field.clone())
            } else {
                Expr::Var(instance_monitor_field.clone())
            };
            let monitor_local = self.next_synthetic_local_name("sync_monitor");
            method.body = self.synchronized_wrapper_body(
                monitor_local,
                monitor,
                method.body.clone(),
                source_line,
            );
        }

        if has_instance_sync
            && !members.iter().any(|member| {
                matches!(
                    member,
                    ClassMember::Method(method) if method.is_constructor
                )
            })
        {
            members.push(ClassMember::Method(MethodDecl {
                annotations: Vec::new(),
                modifiers: self.class_visibility_modifiers(class_modifiers),
                name: class_name.to_string(),
                source_file: self.source_name.clone(),
                type_params: Vec::new(),
                params: Vec::new(),
                throws: Vec::new(),
                return_type: None,
                is_constructor: true,
                has_body: true,
                body: vec![Stmt::Assign {
                    target: Expr::MemberAccess {
                        object: Box::new(Expr::This),
                        member: instance_monitor_field,
                    },
                    value: Expr::NewObject {
                        class_name: "pulse.concurrent.Monitor".to_string(),
                        args: Vec::new(),
                    },
                    source_line: 0,
                }],
            }));
        }
    }

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
            return Err(self
                .error_here("Expected 'class', 'interface', 'enum', or '@interface' declaration"));
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
                return Err(self.error_here("Interfaces cannot use 'implements'; use 'extends'"));
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
        self.rewrite_synchronized_methods(&name, &modifiers, &mut members);
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
