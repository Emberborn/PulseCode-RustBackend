use crate::{
    Annotation, BinaryOp, CatchClause, ClassDecl, ClassMember, CompileError, Expr, FieldDecl,
    ImportDecl, IncDecOp, MethodDecl, Modifier, PackageDecl, ParamDecl, ParseError, Program, Stmt,
    SwitchCase, SwitchExprCase, Token, TokenKind, TryResource, UnaryOp,
};

#[path = "declarations/mod.rs"]
mod declarations;
#[path = "expressions/mod.rs"]
mod expressions;
#[path = "shared/mod.rs"]
mod shared;
#[path = "statements/mod.rs"]
mod statements;

pub fn parse(source: &str) -> Result<Program, CompileError> {
    parse_with_source_name(source, "<memory>")
}

pub fn parse_with_source_name(source: &str, source_name: &str) -> Result<Program, CompileError> {
    let tokens = crate::lex(source)?;
    let mut parser = Parser::new(tokens, source_name.to_string(), build_line_starts(source));
    Ok(parser.parse_program()?)
}

struct Parser {
    tokens: Vec<Token>,
    current: usize,
    source_name: String,
    line_starts: Vec<usize>,
}

impl Parser {
    fn new(tokens: Vec<Token>, source_name: String, line_starts: Vec<usize>) -> Self {
        Self {
            tokens,
            current: 0,
            source_name,
            line_starts,
        }
    }
}

fn build_line_starts(source: &str) -> Vec<usize> {
    let mut starts = vec![0];
    for (idx, byte) in source.bytes().enumerate() {
        if byte == b'\n' {
            starts.push(idx + 1);
        }
    }
    starts
}
