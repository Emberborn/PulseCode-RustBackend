use crate::{ClassContext, ClassMember, MethodDecl, Program};
use std::collections::{HashMap, HashSet};

use super::super::support::{
    build_enum_constant_table, erase_type_for_runtime, lower_field_initializer, visible_type_params,
};
use super::super::{
    IrBlock, IrClass, IrInstr, IrMethod, IrParam, IrProgram, IrSourceLoc, IrTerminator, IrValue,
    IrValueId, IrValueKind, IrVisibility,
};

fn default_super_class(class: &crate::ClassDecl) -> Option<String> {
    if class.is_interface || class.is_enum || class.name == "Object" {
        return None;
    }
    Some("pulse.lang.Object".to_string())
}

fn collect_static_field_constants(
    program: &Program,
    class_contexts: &[ClassContext],
    enum_constants: &HashMap<String, (String, HashMap<String, i64>)>,
) -> HashMap<String, super::super::IrFieldInit> {
    let mut global_field_constants = HashMap::new();
    let max_passes = program.classes.len().saturating_mul(4).max(1);

    for _ in 0..max_passes {
        let mut changed = false;

        for (idx, class) in program.classes.iter().enumerate() {
            let mut field_constants = global_field_constants.clone();
            let package_name = class_contexts[idx].package_name.clone();
            let fqcn = format!("{}.{}", package_name, class.name);

            for member in &class.members {
                let ClassMember::Field(field) = member else {
                    continue;
                };
                let is_static = field
                    .modifiers
                    .iter()
                    .any(|m| matches!(m, crate::Modifier::Static));
                if !is_static {
                    continue;
                }

                let init = lower_field_initializer(
                    field.init.as_ref(),
                    field.ty.as_str(),
                    enum_constants,
                    &field_constants,
                );
                let Some(constant) = init else {
                    continue;
                };

                let keys = [
                    field.name.clone(),
                    format!("{}.{}", class.name, field.name),
                    format!("{}.{}", fqcn, field.name),
                ];
                for key in keys {
                    if global_field_constants.get(&key) != Some(&constant) {
                        global_field_constants.insert(key.clone(), constant.clone());
                        changed = true;
                    }
                    field_constants.insert(key, constant.clone());
                }
            }
        }

        if !changed {
            break;
        }
    }

    global_field_constants
}

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
    let class_type_params = build_class_type_param_table(program, class_contexts);
    let method_return_types = build_method_return_type_table(program);
    let method_param_types = build_method_param_type_table(program);
    let method_varargs = build_method_varargs_table(program);
    let global_field_types = build_field_type_table(program, class_contexts);
    let mut classes = Vec::new();
    let global_field_constants =
        collect_static_field_constants(program, class_contexts, &enum_constants);

    for (idx, class) in program.classes.iter().enumerate() {
        let mut fields = Vec::new();
        let mut methods = Vec::new();
        let visible_type_params = class.type_params.iter().cloned().collect::<HashSet<_>>();
        let mut field_constants = global_field_constants.clone();
        let package_name = class_contexts[idx].package_name.clone();
        let fqcn = format!("{}.{}", package_name, class.name);

        for member in &class.members {
            match member {
                ClassMember::Field(field) => {
                    let is_static = field
                        .modifiers
                        .iter()
                        .any(|m| matches!(m, crate::Modifier::Static));
                    let init = lower_field_initializer(
                        field.init.as_ref(),
                        field.ty.as_str(),
                        &enum_constants,
                        &field_constants,
                    );
                    if is_static {
                        if let Some(ref constant) = init {
                            field_constants.insert(field.name.clone(), constant.clone());
                            field_constants
                                .insert(format!("{}.{}", class.name, field.name), constant.clone());
                            field_constants
                                .insert(format!("{}.{}", fqcn, field.name), constant.clone());
                        }
                    }
                    fields.push(super::IrField {
                        name: field.name.clone(),
                        ty: erase_type_for_runtime(field.ty.as_str(), &visible_type_params),
                        is_static,
                        init,
                    });
                }
                ClassMember::Method(method) => methods.push(lower_method(
                    class,
                    method,
                    &enum_constants,
                    &class_type_params,
                    &method_return_types,
                    &method_param_types,
                    &method_varargs,
                    &global_field_types,
                )),
            }
        }

        classes.push(IrClass {
            package_name,
            name: class.name.clone(),
            is_interface: class.is_interface,
            is_annotation: class.is_annotation,
            is_enum: class.is_enum,
            enum_constants: class.enum_constants.clone(),
            is_final: class
                .modifiers
                .iter()
                .any(|m| matches!(m, crate::Modifier::Final)),
            super_class: class.extends.clone().or_else(|| default_super_class(class)),
            interfaces: class.implements.clone(),
            fields,
            methods,
        });
    }

    Ok(IrProgram { classes })
}

fn lower_method(
    class: &crate::ClassDecl,
    method: &MethodDecl,
    enum_constants: &HashMap<String, (String, HashMap<String, i64>)>,
    class_type_params: &HashMap<String, Vec<String>>,
    method_return_types: &HashMap<(String, String, Vec<String>), String>,
    method_param_types: &HashMap<(String, String, Vec<String>), Vec<String>>,
    method_varargs: &HashMap<(String, String, Vec<String>), bool>,
    global_field_types: &HashMap<(String, String), String>,
) -> IrMethod {
    let mut builder = IrBuilder::new(
        class.name.clone(),
        class.extends.clone().or_else(|| default_super_class(class)),
        method.name.clone(),
        method.source_file.clone(),
    );
    builder.visible_type_params = visible_type_params(class, method);
    builder.enum_constants = enum_constants.clone();
    builder.class_type_params = class_type_params.clone();
    builder.method_return_types = method_return_types.clone();
    builder.method_param_types = method_param_types.clone();
    builder.method_varargs = method_varargs.clone();
    builder.global_field_types = global_field_types.clone();
    builder.return_type = method
        .return_type
        .as_ref()
        .map(|ty| erase_type_for_runtime(ty, &builder.visible_type_params));
    for member in &class.members {
        let ClassMember::Field(field) = member else {
            continue;
        };
        builder.field_types.insert(
            field.name.clone(),
            erase_type_for_runtime(field.ty.as_str(), &builder.visible_type_params),
        );
        builder
            .declared_field_types
            .insert(field.name.clone(), field.ty.clone());
    }
    for param in &method.params {
        builder.local_types.insert(
            param.name.clone(),
            erase_type_for_runtime(param.ty.as_str(), &builder.visible_type_params),
        );
        builder
            .declared_local_types
            .insert(param.name.clone(), param.ty.clone());
    }
    let entry = builder.entry_block();
    let exit = builder.lower_stmts(&method.body, entry, None, None);
    if !builder.is_terminated(exit) {
        let source = builder.source_loc(builder.next_statement_index.saturating_sub(1), 0);
        if method.return_type.as_deref() == Some("void") || method.is_constructor {
            builder.set_terminator(
                exit,
                IrTerminator::Return {
                    value: None,
                    source,
                },
            );
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
    if modifiers
        .iter()
        .any(|m| matches!(m, crate::Modifier::Public))
    {
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

fn build_method_return_type_table(
    program: &Program,
) -> HashMap<(String, String, Vec<String>), String> {
    let mut out = HashMap::new();
    for class in &program.classes {
        let visible = class.type_params.iter().cloned().collect::<HashSet<_>>();
        for member in &class.members {
            let ClassMember::Method(method) = member else {
                continue;
            };
            let param_types = method
                .params
                .iter()
                .map(|param| erase_type_for_runtime(&param.ty, &visible))
                .collect::<Vec<_>>();
            let return_ty = method
                .return_type
                .as_ref()
                .cloned()
                .unwrap_or_else(|| "void".to_string());
            out.insert(
                (class.name.clone(), method.name.clone(), param_types),
                return_ty,
            );
        }
    }
    out
}

fn build_class_type_param_table(
    program: &Program,
    class_contexts: &[ClassContext],
) -> HashMap<String, Vec<String>> {
    let mut out = HashMap::new();
    for (idx, class) in program.classes.iter().enumerate() {
        let params = class.type_params.clone();
        out.insert(class.name.clone(), params.clone());
        out.insert(
            format!("{}.{}", class_contexts[idx].package_name, class.name),
            params,
        );
    }
    out
}

fn build_method_param_type_table(
    program: &Program,
) -> HashMap<(String, String, Vec<String>), Vec<String>> {
    let mut out = HashMap::new();
    for class in &program.classes {
        let visible = class.type_params.iter().cloned().collect::<HashSet<_>>();
        for member in &class.members {
            let ClassMember::Method(method) = member else {
                continue;
            };
            let param_types = method
                .params
                .iter()
                .map(|param| erase_type_for_runtime(&param.ty, &visible))
                .collect::<Vec<_>>();
            out.insert(
                (class.name.clone(), method.name.clone(), param_types.clone()),
                param_types,
            );
        }
    }
    out
}

fn build_method_varargs_table(program: &Program) -> HashMap<(String, String, Vec<String>), bool> {
    let mut out = HashMap::new();
    for class in &program.classes {
        let visible = class.type_params.iter().cloned().collect::<HashSet<_>>();
        for member in &class.members {
            let ClassMember::Method(method) = member else {
                continue;
            };
            let param_types = method
                .params
                .iter()
                .map(|param| erase_type_for_runtime(&param.ty, &visible))
                .collect::<Vec<_>>();
            out.insert(
                (class.name.clone(), method.name.clone(), param_types),
                method.params.last().map(|p| p.is_varargs).unwrap_or(false),
            );
        }
    }
    out
}

fn build_field_type_table(
    program: &Program,
    class_contexts: &[ClassContext],
) -> HashMap<(String, String), String> {
    let mut out = HashMap::new();
    for (idx, class) in program.classes.iter().enumerate() {
        let visible = class.type_params.iter().cloned().collect::<HashSet<_>>();
        let fqcn = format!("{}.{}", class_contexts[idx].package_name, class.name);
        for member in &class.members {
            let ClassMember::Field(field) = member else {
                continue;
            };
            let ty = erase_type_for_runtime(&field.ty, &visible);
            out.insert((class.name.clone(), field.name.clone()), ty.clone());
            out.insert((fqcn.clone(), field.name.clone()), ty);
        }
    }
    out
}

pub(crate) struct LoopContext {
    pub(super) break_target: usize,
    pub(super) continue_target: usize,
}

pub(crate) struct TryContext;

pub(crate) struct IrBuilder {
    pub(super) class_name: String,
    pub(super) super_class_name: Option<String>,
    pub(super) method_name: String,
    pub(super) source_file: String,
    pub(super) return_type: Option<String>,
    pub(super) visible_type_params: HashSet<String>,
    pub(super) enum_constants: HashMap<String, (String, HashMap<String, i64>)>,
    pub(super) class_type_params: HashMap<String, Vec<String>>,
    pub(super) method_return_types: HashMap<(String, String, Vec<String>), String>,
    pub(super) method_param_types: HashMap<(String, String, Vec<String>), Vec<String>>,
    pub(super) method_varargs: HashMap<(String, String, Vec<String>), bool>,
    pub(super) local_types: HashMap<String, String>,
    pub(super) field_types: HashMap<String, String>,
    pub(super) declared_local_types: HashMap<String, String>,
    pub(super) declared_field_types: HashMap<String, String>,
    pub(super) global_field_types: HashMap<(String, String), String>,
    pub(super) next_statement_index: usize,
    pub(super) next_value_id: IrValueId,
    pub(super) values: Vec<IrValue>,
    pub(super) blocks: Vec<IrBlock>,
}

impl IrBuilder {
    fn new(
        class_name: String,
        super_class_name: Option<String>,
        method_name: String,
        source_file: String,
    ) -> Self {
        Self {
            class_name,
            super_class_name,
            method_name,
            source_file,
            return_type: None,
            visible_type_params: HashSet::new(),
            enum_constants: HashMap::new(),
            class_type_params: HashMap::new(),
            method_return_types: HashMap::new(),
            method_param_types: HashMap::new(),
            method_varargs: HashMap::new(),
            local_types: HashMap::new(),
            field_types: HashMap::new(),
            declared_local_types: HashMap::new(),
            declared_field_types: HashMap::new(),
            global_field_types: HashMap::new(),
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
