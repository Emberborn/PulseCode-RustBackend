use crate::{ClassContext, ClassMember, MethodDecl, Program};
use std::collections::{HashMap, HashSet};

use super::super::support::{
    build_enum_constant_table, erase_type_for_runtime, lower_field_initializer,
    visible_type_params,
};
use super::super::{
    IrBlock, IrClass, IrInstr, IrMethod, IrParam, IrProgram, IrSourceLoc, IrTerminator, IrValue,
    IrValueId, IrValueKind, IrVisibility,
};

pub(crate) fn lower_program_with_contexts(
    program: &Program,
    class_contexts: &[ClassContext],
) -> Result<IrProgram, String> {
    if class_contexts.len() != program.classes.len() {
        return Err(format!(
            "IR lowering context mismatch: {} contexts for {} classes",
            class_contexts.len(),
            program.classes.len()
        ));
    }

    let enum_constants = build_enum_constant_table(program, class_contexts);
    let classes = program
        .classes
        .iter()
        .enumerate()
        .map(|(idx, class)| {
            let mut fields = Vec::new();
            let mut methods = Vec::new();

            for member in &class.members {
                match member {
                    ClassMember::Field(field) => fields.push(super::IrField {
                        name: field.name.clone(),
                        ty: erase_type_for_runtime(
                            field.ty.as_str(),
                            &class.type_params.iter().cloned().collect(),
                        ),
                        is_static: field
                            .modifiers
                            .iter()
                            .any(|m| matches!(m, crate::Modifier::Static)),
                        init: lower_field_initializer(field.init.as_ref(), &enum_constants),
                    }),
                    ClassMember::Method(method) => {
                        methods.push(lower_method(class, method, &enum_constants))
                    }
                }
            }

            IrClass {
                package_name: class_contexts[idx].package_name.clone(),
                name: class.name.clone(),
                is_interface: class.is_interface,
                is_annotation: class.is_annotation,
                is_enum: class.is_enum,
                enum_constants: class.enum_constants.clone(),
                is_final: class
                    .modifiers
                    .iter()
                    .any(|m| matches!(m, crate::Modifier::Final)),
                super_class: class.extends.clone(),
                interfaces: class.implements.clone(),
                fields,
                methods,
            }
        })
        .collect();

    Ok(IrProgram { classes })
}

fn lower_method(
    class: &crate::ClassDecl,
    method: &MethodDecl,
    enum_constants: &HashMap<String, (String, HashMap<String, i64>)>,
) -> IrMethod {
    let mut builder = IrBuilder::new(
        class.name.clone(),
        method.name.clone(),
        method.source_file.clone(),
    );
    builder.visible_type_params = visible_type_params(class, method);
    builder.enum_constants = enum_constants.clone();
    builder.return_type = method
        .return_type
        .as_ref()
        .map(|ty| erase_type_for_runtime(ty, &builder.visible_type_params));
    for param in &method.params {
        builder.local_types.insert(
            param.name.clone(),
            erase_type_for_runtime(param.ty.as_str(), &builder.visible_type_params),
        );
    }
    let entry = builder.entry_block();
    let exit = builder.lower_stmts(&method.body, entry, None, None);
    if !builder.is_terminated(exit) {
        let source = builder.source_loc(builder.next_statement_index.saturating_sub(1), 0);
        if method.return_type.as_deref() == Some("void") || method.is_constructor {
            builder.set_terminator(exit, IrTerminator::Return { value: None, source });
        } else {
            builder.set_terminator(exit, IrTerminator::Stop);
        }
    }

    let (values, blocks) = builder.finish();

    IrMethod {
        name: method.name.clone(),
        return_type: method
            .return_type
            .as_ref()
            .map(|ty| erase_type_for_runtime(ty, &visible_type_params(class, method))),
        is_varargs: method.params.last().map(|p| p.is_varargs).unwrap_or(false),
        is_static: method
            .modifiers
            .iter()
            .any(|m| matches!(m, crate::Modifier::Static)),
        is_final: method
            .modifiers
            .iter()
            .any(|m| matches!(m, crate::Modifier::Final)),
        visibility: lower_visibility(&method.modifiers),
        is_constructor: method.is_constructor,
        params: method
            .params
            .iter()
            .map(|p| IrParam {
                name: p.name.clone(),
                ty: erase_type_for_runtime(p.ty.as_str(), &visible_type_params(class, method)),
            })
            .collect(),
        stmt_count: method.body.len(),
        values,
        blocks,
    }
}

fn lower_visibility(modifiers: &[crate::Modifier]) -> IrVisibility {
    if modifiers.iter().any(|m| matches!(m, crate::Modifier::Public)) {
        IrVisibility::Public
    } else if modifiers
        .iter()
        .any(|m| matches!(m, crate::Modifier::Protected))
    {
        IrVisibility::Protected
    } else if modifiers
        .iter()
        .any(|m| matches!(m, crate::Modifier::Private))
    {
        IrVisibility::Private
    } else {
        IrVisibility::Package
    }
}

pub(crate) struct LoopContext {
    pub(super) break_target: usize,
    pub(super) continue_target: usize,
}

pub(crate) struct TryContext;

pub(crate) struct IrBuilder {
    pub(super) class_name: String,
    pub(super) method_name: String,
    pub(super) source_file: String,
    pub(super) return_type: Option<String>,
    pub(super) visible_type_params: HashSet<String>,
    pub(super) enum_constants: HashMap<String, (String, HashMap<String, i64>)>,
    pub(super) local_types: HashMap<String, String>,
    pub(super) next_statement_index: usize,
    pub(super) next_value_id: IrValueId,
    pub(super) values: Vec<IrValue>,
    pub(super) blocks: Vec<IrBlock>,
}

impl IrBuilder {
    fn new(class_name: String, method_name: String, source_file: String) -> Self {
        Self {
            class_name,
            method_name,
            source_file,
            return_type: None,
            visible_type_params: HashSet::new(),
            enum_constants: HashMap::new(),
            local_types: HashMap::new(),
            next_statement_index: 0,
            next_value_id: 0,
            values: Vec::new(),
            blocks: vec![IrBlock {
                id: 0,
                instructions: Vec::new(),
                terminator: IrTerminator::Stop,
            }],
        }
    }

    fn entry_block(&self) -> usize {
        0
    }

    pub(super) fn statement_index(&mut self) -> usize {
        let idx = self.next_statement_index;
        self.next_statement_index += 1;
        idx
    }

    pub(super) fn source_loc(&self, statement_index: usize, source_line: usize) -> IrSourceLoc {
        IrSourceLoc {
            source_file: self.source_file.clone(),
            class_name: self.class_name.clone(),
            method_name: self.method_name.clone(),
            source_line,
            statement_index,
        }
    }

    pub(super) fn new_block(&mut self) -> usize {
        let id = self.blocks.len();
        self.blocks.push(IrBlock {
            id,
            instructions: Vec::new(),
            terminator: IrTerminator::Stop,
        });
        id
    }

    pub(super) fn emit(&mut self, block: usize, instr: IrInstr) {
        self.blocks[block].instructions.push(instr);
    }

    pub(super) fn is_terminated(&self, block: usize) -> bool {
        !matches!(self.blocks[block].terminator, IrTerminator::Stop)
    }

    pub(super) fn set_terminator(&mut self, block: usize, term: IrTerminator) {
        self.blocks[block].terminator = term;
    }

    pub(super) fn value_ty(&self, id: IrValueId) -> String {
        self.values
            .get(id as usize)
            .map(|v| match &v.kind {
                IrValueKind::LocalRef(name) if v.ty == "unknown" => self
                    .local_types
                    .get(name)
                    .cloned()
                    .unwrap_or_else(|| v.ty.clone()),
                _ => v.ty.clone(),
            })
            .unwrap_or_else(|| "unknown".to_string())
    }

    pub(super) fn push_value(
        &mut self,
        ty: String,
        kind: IrValueKind,
        statement_index: usize,
    ) -> IrValueId {
        let id = self.next_value_id;
        self.next_value_id += 1;
        self.values.push(IrValue {
            id,
            ty,
            kind,
            source: self.source_loc(statement_index, 0),
        });
        id
    }

    fn finish(self) -> (Vec<IrValue>, Vec<IrBlock>) {
        (self.values, self.blocks)
    }
}
