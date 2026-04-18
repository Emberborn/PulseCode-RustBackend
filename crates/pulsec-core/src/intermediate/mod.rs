use crate::{ClassContext, Program};

#[path = "lowering/mod.rs"]
mod lowering;
#[path = "support.rs"]
mod support;
#[cfg(test)]
#[path = "tests.rs"]
mod tests;

pub type IrValueId = u32;

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct IrProgram {
    pub classes: Vec<IrClass>,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct IrClass {
    pub package_name: String,
    pub name: String,
    pub is_interface: bool,
    pub is_annotation: bool,
    pub is_enum: bool,
    pub enum_constants: Vec<String>,
    pub is_final: bool,
    pub super_class: Option<String>,
    pub interfaces: Vec<String>,
    pub fields: Vec<IrField>,
    pub methods: Vec<IrMethod>,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct IrField {
    pub name: String,
    pub ty: String,
    pub is_static: bool,
    pub init: Option<IrFieldInit>,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum IrFieldInit {
    Int(i64),
    Bool(bool),
    Float(u32),
    Double(u64),
    NewObject {
        class_name: String,
        args: Vec<IrFieldInitArg>,
    },
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum IrFieldInitArg {
    Int(i64),
    Long(i64),
    Bool(bool),
    Char(char),
    String(String),
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct IrMethod {
    pub name: String,
    pub return_type: Option<String>,
    pub is_varargs: bool,
    pub is_static: bool,
    pub is_final: bool,
    pub visibility: IrVisibility,
    pub is_constructor: bool,
    pub params: Vec<IrParam>,
    pub stmt_count: usize,
    pub values: Vec<IrValue>,
    pub blocks: Vec<IrBlock>,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum IrVisibility {
    Public,
    Protected,
    Private,
    Package,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct IrParam {
    pub name: String,
    pub ty: String,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct IrBlock {
    pub id: usize,
    pub instructions: Vec<IrInstr>,
    pub terminator: IrTerminator,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum IrInstr {
    DeclareLocal {
        name: String,
        ty: String,
        source: IrSourceLoc,
    },
    StoreLocal {
        name: String,
        value: IrValueId,
        source: IrSourceLoc,
    },
    Eval {
        value: IrValueId,
        source: IrSourceLoc,
    },
    PushExceptionHandler {
        handler_target: usize,
        source: IrSourceLoc,
    },
    PopExceptionHandler {
        source: IrSourceLoc,
    },
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum IrTerminator {
    Goto {
        target: usize,
        source: IrSourceLoc,
    },
    Branch {
        condition: IrValueId,
        then_target: usize,
        else_target: usize,
        source: IrSourceLoc,
    },
    Return {
        value: Option<IrValueId>,
        source: IrSourceLoc,
    },
    Throw {
        value: IrValueId,
        source: IrSourceLoc,
    },
    Stop,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct IrValue {
    pub id: IrValueId,
    pub ty: String,
    pub kind: IrValueKind,
    pub source: IrSourceLoc,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum IrValueKind {
    IntLiteral(i64),
    StringLiteral(String),
    BoolLiteral(bool),
    NullLiteral,
    ThisRef,
    SuperRef,
    LocalRef(String),
    Unary {
        op: IrUnaryOp,
        operand: IrValueId,
    },
    Binary {
        op: IrBinaryOp,
        left: IrValueId,
        right: IrValueId,
    },
    Conditional {
        condition: IrValueId,
        then_value: IrValueId,
        else_value: IrValueId,
    },
    SwitchExpr {
        expr: IrValueId,
        cases: Vec<(IrValueId, IrValueId)>,
        default: IrValueId,
    },
    NewObject {
        class_name: String,
        args: Vec<IrValueId>,
    },
    ArrayNew {
        element_ty: String,
        lengths: Vec<IrValueId>,
    },
    ArrayNewInitialized {
        element_ty: String,
        dimensions: usize,
        values: Vec<IrValueId>,
    },
    ArrayLength {
        array: IrValueId,
    },
    ArrayGet {
        array: IrValueId,
        index: IrValueId,
        element_ty: String,
    },
    ArraySet {
        array: IrValueId,
        index: IrValueId,
        value: IrValueId,
        element_ty: String,
    },
    Call {
        callee: IrValueId,
        args: Vec<IrValueId>,
    },
    Cast {
        value: IrValueId,
        ty: String,
    },
    InstanceOf {
        value: IrValueId,
        ty: String,
    },
    MemberAccess {
        object: IrValueId,
        member: String,
    },
    TakePendingException,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum IrUnaryOp {
    Not,
    Neg,
    BitNot,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum IrBinaryOp {
    Add,
    Sub,
    Mul,
    Div,
    Mod,
    Eq,
    NotEq,
    Less,
    LessEq,
    Greater,
    GreaterEq,
    BitAnd,
    BitOr,
    BitXor,
    ShiftLeft,
    ShiftRight,
    UnsignedShiftRight,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct IrSourceLoc {
    pub source_file: String,
    pub class_name: String,
    pub method_name: String,
    pub source_line: usize,
    pub statement_index: usize,
}

pub fn lower_to_ir(program: &Program) -> Result<IrProgram, String> {
    let contexts = program
        .classes
        .iter()
        .map(|_| ClassContext {
            package_name: program.package.name.clone(),
            imports: program.imports.clone(),
        })
        .collect::<Vec<_>>();
    lower_to_ir_with_contexts(program, &contexts)
}

pub fn lower_to_ir_with_contexts(
    program: &Program,
    class_contexts: &[ClassContext],
) -> Result<IrProgram, String> {
    lowering::lower_program_with_contexts(program, class_contexts)
}
