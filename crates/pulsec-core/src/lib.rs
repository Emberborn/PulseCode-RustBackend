use thiserror::Error;

pub(crate) mod parser;
pub(crate) mod semantics;
pub mod intermediate;

#[cfg(test)]
mod tests;

pub use parser::{parse, parse_with_source_name};
pub use intermediate::{
    lower_to_ir, lower_to_ir_with_contexts, IrClass, IrField, IrMethod, IrParam, IrProgram,
    IrVisibility,
};
pub use semantics::{
    analyze, analyze_with_class_contexts, analyze_with_class_packages,
    analyze_with_class_packages_and_imports,
};

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum TokenKind {
    Identifier,
    Number,
    String,
    Char,
    Keyword,
    Symbol,
    Eof,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct Token {
    pub kind: TokenKind,
    pub lexeme: String,
    pub position: usize,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct Program {
    pub package: PackageDecl,
    pub imports: Vec<ImportDecl>,
    pub classes: Vec<ClassDecl>,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct ClassContext {
    pub package_name: String,
    pub imports: Vec<ImportDecl>,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct PackageDecl {
    pub name: String,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct ImportDecl {
    pub path: String,
    pub is_static: bool,
    pub is_wildcard: bool,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct ClassDecl {
    pub annotations: Vec<Annotation>,
    pub modifiers: Vec<Modifier>,
    pub name: String,
    pub type_params: Vec<String>,
    pub is_interface: bool,
    pub is_annotation: bool,
    pub is_enum: bool,
    pub extends: Option<String>,
    pub implements: Vec<String>,
    pub enum_constants: Vec<String>,
    pub members: Vec<ClassMember>,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct Annotation {
    pub name: String,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum ClassMember {
    Field(FieldDecl),
    Method(MethodDecl),
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum Modifier {
    Public,
    Private,
    Protected,
    Default,
    Static,
    Abstract,
    Final,
    Synchronized,
    Native,
    Strictfp,
    Transient,
    Volatile,
    Async,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct FieldDecl {
    pub annotations: Vec<Annotation>,
    pub modifiers: Vec<Modifier>,
    pub ty: String,
    pub name: String,
    pub init: Option<Expr>,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct MethodDecl {
    pub annotations: Vec<Annotation>,
    pub modifiers: Vec<Modifier>,
    pub name: String,
    pub source_file: String,
    pub type_params: Vec<String>,
    pub params: Vec<ParamDecl>,
    pub throws: Vec<String>,
    pub return_type: Option<String>,
    pub is_constructor: bool,
    pub has_body: bool,
    pub body: Vec<Stmt>,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct ParamDecl {
    pub ty: String,
    pub name: String,
    pub is_varargs: bool,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum Stmt {
    VarDecl {
        ty: String,
        name: String,
        init: Option<Expr>,
        source_line: usize,
    },
    Assign {
        target: Expr,
        value: Expr,
        source_line: usize,
    },
    CompoundAssign {
        target: Expr,
        op: BinaryOp,
        value: Expr,
        source_line: usize,
    },
    If {
        condition: Expr,
        then_branch: Vec<Stmt>,
        else_branch: Option<Vec<Stmt>>,
        source_line: usize,
    },
    While {
        condition: Expr,
        body: Vec<Stmt>,
        source_line: usize,
    },
    DoWhile {
        body: Vec<Stmt>,
        condition: Expr,
        source_line: usize,
    },
    For {
        init: Option<Box<Stmt>>,
        condition: Option<Expr>,
        update: Option<Box<Stmt>>,
        body: Vec<Stmt>,
        source_line: usize,
    },
    ForEach {
        ty: String,
        name: String,
        iterable: Expr,
        body: Vec<Stmt>,
        source_line: usize,
    },
    Switch {
        expr: Expr,
        cases: Vec<SwitchCase>,
        default: Option<Vec<Stmt>>,
        source_line: usize,
    },
    Try {
        body: Vec<Stmt>,
        catches: Vec<CatchClause>,
        finally_block: Option<Vec<Stmt>>,
        source_line: usize,
    },
    Assert {
        condition: Expr,
        message: Option<Expr>,
        source_line: usize,
    },
    Break {
        source_line: usize,
    },
    Continue {
        source_line: usize,
    },
    Throw(Expr, usize),
    ExprStmt(Expr, usize),
    Return(Option<Expr>, usize),
}

impl Stmt {
    pub fn source_line(&self) -> usize {
        match self {
            Stmt::VarDecl { source_line, .. }
            | Stmt::Assign { source_line, .. }
            | Stmt::CompoundAssign { source_line, .. }
            | Stmt::If { source_line, .. }
            | Stmt::While { source_line, .. }
            | Stmt::DoWhile { source_line, .. }
            | Stmt::For { source_line, .. }
            | Stmt::ForEach { source_line, .. }
            | Stmt::Switch { source_line, .. }
            | Stmt::Try { source_line, .. }
            | Stmt::Assert { source_line, .. }
            | Stmt::Break { source_line }
            | Stmt::Continue { source_line }
            | Stmt::Throw(_, source_line)
            | Stmt::ExprStmt(_, source_line)
            | Stmt::Return(_, source_line) => *source_line,
        }
    }
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct SwitchCase {
    pub label: Expr,
    pub body: Vec<Stmt>,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct SwitchExprCase {
    pub label: Expr,
    pub value: Expr,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct CatchClause {
    pub ty: String,
    pub name: String,
    pub body: Vec<Stmt>,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum Expr {
    IntLiteral(i64),
    LongLiteral(i64),
    FloatLiteral(String),
    DoubleLiteral(String),
    CharLiteral(char),
    StringLiteral(String),
    BoolLiteral(bool),
    NullLiteral,
    This,
    Super,
    Var(String),
    MemberAccess {
        object: Box<Expr>,
        member: String,
    },
    ArrayAccess {
        array: Box<Expr>,
        index: Box<Expr>,
    },
    Call {
        callee: Box<Expr>,
        args: Vec<Expr>,
    },
    IncDec {
        target: Box<Expr>,
        op: IncDecOp,
        prefix: bool,
    },
    Unary {
        op: UnaryOp,
        expr: Box<Expr>,
    },
    Cast {
        ty: String,
        expr: Box<Expr>,
    },
    InstanceOf {
        expr: Box<Expr>,
        ty: String,
    },
    Binary {
        left: Box<Expr>,
        op: BinaryOp,
        right: Box<Expr>,
    },
    Conditional {
        condition: Box<Expr>,
        then_expr: Box<Expr>,
        else_expr: Box<Expr>,
    },
    SwitchExpr {
        expr: Box<Expr>,
        cases: Vec<SwitchExprCase>,
        default: Box<Expr>,
    },
    NewObject {
        class_name: String,
        args: Vec<Expr>,
    },
    NewArray {
        element_ty: String,
        lengths: Vec<Expr>,
    },
    NewArrayInitialized {
        element_ty: String,
        dimensions: usize,
        values: Vec<ArrayInitExpr>,
    },
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum ArrayInitExpr {
    Expr(Expr),
    Nested(Vec<ArrayInitExpr>),
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum IncDecOp {
    Inc,
    Dec,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum UnaryOp {
    Not,
    Neg,
    BitNot,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum BinaryOp {
    Add,
    Sub,
    Mul,
    Div,
    Eq,
    NotEq,
    Less,
    LessEq,
    Greater,
    GreaterEq,
    LogicalAnd,
    LogicalOr,
    BitAnd,
    BitOr,
    BitXor,
    ShiftLeft,
    ShiftRight,
    UnsignedShiftRight,
}

#[derive(Debug, Error)]
pub enum CompileError {
    #[error(transparent)]
    Lex(#[from] LexError),
    #[error(transparent)]
    Parse(#[from] ParseError),
    #[error(transparent)]
    Semantic(#[from] SemanticError),
}

#[derive(Debug, Error)]
pub enum LexError {
    #[error("Unterminated string at position {0}")]
    UnterminatedString(usize),
    #[error("Unterminated char literal at position {0}")]
    UnterminatedChar(usize),
    #[error("Unterminated block comment at position {0}")]
    UnterminatedBlockComment(usize),
    #[error("Invalid escape sequence '{1}' in {2} at position {0}")]
    InvalidEscape(usize, String, &'static str),
    #[error("Invalid char literal at position {0}: {1}")]
    InvalidCharLiteral(usize, String),
    #[error("Invalid numeric literal at position {0}: {1}")]
    InvalidNumericLiteral(usize, String),
}

#[derive(Debug, Error)]
#[error("Parse error at position {position}: {message}")]
pub struct ParseError {
    pub position: usize,
    pub message: String,
}

#[derive(Debug, Error)]
#[error("Semantic error: {message}")]
pub struct SemanticError {
    pub message: String,
}

pub fn lex(source: &str) -> Result<Vec<Token>, LexError> {
    let mut chars = source.char_indices().peekable();
    let mut tokens = Vec::new();

    while let Some((idx, ch)) = chars.peek().copied() {
        match ch {
            c if c.is_whitespace() || c == '\u{feff}' => {
                chars.next();
            }
            '/' => {
                let mut lookahead = chars.clone();
                lookahead.next();
                match lookahead.peek().copied() {
                    Some((_, '/')) => {
                        // Skip line comment.
                        chars.next();
                        chars.next();
                        while let Some((_, c2)) = chars.peek().copied() {
                            if c2 == '\n' || c2 == '\r' {
                                break;
                            }
                            chars.next();
                        }
                    }
                    Some((_, '*')) => {
                        // Skip block or doc comment (`/* ... */`, `/** ... */`).
                        let start = idx;
                        chars.next();
                        chars.next();
                        let mut prev = '\0';
                        let mut terminated = false;
                        while let Some((_, c2)) = chars.next() {
                            if prev == '*' && c2 == '/' {
                                terminated = true;
                                break;
                            }
                            prev = c2;
                        }
                        if !terminated {
                            return Err(LexError::UnterminatedBlockComment(start));
                        }
                    }
                    _ => {
                        tokens.push(Token {
                            kind: TokenKind::Symbol,
                            lexeme: ch.to_string(),
                            position: idx,
                        });
                        chars.next();
                    }
                }
            }
            c if c.is_ascii_alphabetic() || c == '_' => {
                let start = idx;
                let mut text = String::new();
                while let Some((_, c2)) = chars.peek().copied() {
                    if c2.is_ascii_alphanumeric() || c2 == '_' {
                        text.push(c2);
                        chars.next();
                    } else {
                        break;
                    }
                }
                let kind = if is_keyword(&text) {
                    TokenKind::Keyword
                } else {
                    TokenKind::Identifier
                };
                tokens.push(Token {
                    kind,
                    lexeme: text,
                    position: start,
                });
            }
            c if c.is_ascii_digit() => {
                let start = idx;
                let text = consume_number_literal(&mut chars);
                validate_number_literal(&text, start)?;
                tokens.push(Token {
                    kind: TokenKind::Number,
                    lexeme: text,
                    position: start,
                });
            }
            '"' => {
                let start = idx;
                chars.next();
                let mut text = String::new();
                let mut terminated = false;
                while let Some((pos, c2)) = chars.next() {
                    match c2 {
                        '"' => {
                            terminated = true;
                            break;
                        }
                        '\\' => {
                            text.push(parse_escape_sequence(&mut chars, pos, "string literal")?);
                        }
                        '\n' | '\r' => return Err(LexError::UnterminatedString(start)),
                        _ => text.push(c2),
                    }
                }
                if !terminated {
                    return Err(LexError::UnterminatedString(start));
                }
                tokens.push(Token {
                    kind: TokenKind::String,
                    lexeme: text,
                    position: start,
                });
            }
            '\'' => {
                let start = idx;
                chars.next();
                let value = match chars.next() {
                    Some((_, '\\')) => parse_escape_sequence(&mut chars, start, "char literal")?,
                    Some((_, '\'')) => {
                        return Err(LexError::InvalidCharLiteral(
                            start,
                            "Char literal cannot be empty".to_string(),
                        ))
                    }
                    Some((_, '\n' | '\r')) | None => return Err(LexError::UnterminatedChar(start)),
                    Some((_, value)) => value,
                };
                match chars.next() {
                    Some((_, '\'')) => {
                        tokens.push(Token {
                            kind: TokenKind::Char,
                            lexeme: value.to_string(),
                            position: start,
                        });
                    }
                    Some((_, _)) => {
                        return Err(LexError::InvalidCharLiteral(
                            start,
                            "Char literal must contain exactly one character or escape".to_string(),
                        ))
                    }
                    None => return Err(LexError::UnterminatedChar(start)),
                }
            }
            '-' => {
                chars.next();
                if matches!(chars.peek().copied(), Some((_, '>'))) {
                    chars.next();
                    tokens.push(Token {
                        kind: TokenKind::Symbol,
                        lexeme: "->".to_string(),
                        position: idx,
                    });
                } else {
                    tokens.push(Token {
                        kind: TokenKind::Symbol,
                        lexeme: "-".to_string(),
                        position: idx,
                    });
                }
            }
            ':' => {
                chars.next();
                if matches!(chars.peek().copied(), Some((_, ':'))) {
                    chars.next();
                    tokens.push(Token {
                        kind: TokenKind::Symbol,
                        lexeme: "::".to_string(),
                        position: idx,
                    });
                } else {
                    tokens.push(Token {
                        kind: TokenKind::Symbol,
                        lexeme: ":".to_string(),
                        position: idx,
                    });
                }
            }
            '.' => {
                chars.next();
                if matches!(chars.peek().copied(), Some((_, '.'))) {
                    let mut lookahead = chars.clone();
                    lookahead.next();
                    if matches!(lookahead.peek().copied(), Some((_, '.'))) {
                        chars.next();
                        chars.next();
                        tokens.push(Token {
                            kind: TokenKind::Symbol,
                            lexeme: "...".to_string(),
                            position: idx,
                        });
                        continue;
                    }
                }
                tokens.push(Token {
                    kind: TokenKind::Symbol,
                    lexeme: ".".to_string(),
                    position: idx,
                });
            }
            _ => {
                tokens.push(Token {
                    kind: TokenKind::Symbol,
                    lexeme: ch.to_string(),
                    position: idx,
                });
                chars.next();
            }
        }
    }

    tokens.push(Token {
        kind: TokenKind::Eof,
        lexeme: String::new(),
        position: source.len(),
    });
    Ok(tokens)
}

pub fn check(source: &str) -> Result<Program, CompileError> {
    let program = parse(source)?;
    analyze(&program)?;
    Ok(program)
}

pub(crate) fn is_builtin_type(ty: &str) -> bool {
    matches!(
        ty,
        "byte"
            | "short"
            | "int"
            | "long"
            | "float"
            | "double"
            | "char"
            | "boolean"
            | "void"
            | "ubyte"
            | "ushort"
            | "uint"
            | "ulong"
    )
}

fn is_keyword(text: &str) -> bool {
    matches!(
        text,
        "package"
            | "import"
            | "class"
            | "enum"
            | "let"
            | "return"
            | "throw"
            | "try"
            | "catch"
            | "finally"
            | "assert"
            | "this"
            | "true"
            | "false"
            | "null"
            | "byte"
            | "short"
            | "int"
            | "long"
            | "float"
            | "double"
            | "char"
            | "boolean"
            | "void"
            | "ubyte"
            | "ushort"
            | "uint"
            | "ulong"
            | "public"
            | "private"
            | "protected"
            | "default"
            | "static"
            | "extends"
            | "implements"
            | "interface"
            | "abstract"
            | "final"
            | "super"
            | "synchronized"
            | "native"
            | "strictfp"
            | "transient"
            | "volatile"
            | "async"
            | "if"
            | "else"
            | "while"
            | "do"
            | "for"
            | "switch"
            | "yield"
            | "throws"
            | "case"
            | "break"
            | "continue"
            | "instanceof"
            | "new"
    )
}

fn parse_escape_sequence(
    chars: &mut std::iter::Peekable<std::str::CharIndices<'_>>,
    position: usize,
    context: &'static str,
) -> Result<char, LexError> {
    let Some((_, escaped)) = chars.next() else {
        return Err(LexError::UnterminatedString(position));
    };
    match escaped {
        'n' => Ok('\n'),
        'r' => Ok('\r'),
        't' => Ok('\t'),
        'b' => Ok('\u{0008}'),
        'f' => Ok('\u{000C}'),
        '0' => Ok('\0'),
        '\\' => Ok('\\'),
        '\'' => Ok('\''),
        '"' => Ok('"'),
        'u' => {
            let mut value = String::new();
            for _ in 0..4 {
                let Some((_, digit)) = chars.next() else {
                    return Err(LexError::InvalidEscape(
                        position,
                        "\\u".to_string(),
                        context,
                    ));
                };
                if !digit.is_ascii_hexdigit() {
                    return Err(LexError::InvalidEscape(
                        position,
                        format!("\\u{value}{digit}"),
                        context,
                    ));
                }
                value.push(digit);
            }
            let code = u32::from_str_radix(&value, 16).map_err(|_| {
                LexError::InvalidEscape(position, format!("\\u{value}"), context)
            })?;
            char::from_u32(code).ok_or_else(|| {
                LexError::InvalidEscape(position, format!("\\u{value}"), context)
            })
        }
        other => Err(LexError::InvalidEscape(
            position,
            format!("\\{other}"),
            context,
        )),
    }
}

fn consume_number_literal(
    chars: &mut std::iter::Peekable<std::str::CharIndices<'_>>,
) -> String {
    let mut text = String::new();
    let Some((_, first)) = chars.next() else {
        return text;
    };
    text.push(first);

    if first == '0' {
        if let Some((_, prefix)) = chars.peek().copied() {
            if matches!(prefix, 'x' | 'X') {
                text.push(prefix);
                chars.next();
                consume_while(chars, &mut text, |c| c.is_ascii_hexdigit() || c == '_');
                consume_invalid_numeric_tail(chars, &mut text);
                consume_numeric_suffix(chars, &mut text, true);
                return text;
            }
            if matches!(prefix, 'b' | 'B') {
                text.push(prefix);
                chars.next();
                consume_while(chars, &mut text, |c| matches!(c, '0' | '1' | '_'));
                consume_invalid_numeric_tail(chars, &mut text);
                consume_numeric_suffix(chars, &mut text, true);
                return text;
            }
        }
    }

    consume_while(chars, &mut text, |c| c.is_ascii_digit() || c == '_');

    if matches!(chars.peek().copied(), Some((_, '.'))) {
        let mut lookahead = chars.clone();
        lookahead.next();
        if matches!(lookahead.peek().copied(), Some((_, d)) if d.is_ascii_digit()) {
            text.push('.');
            chars.next();
            consume_while(chars, &mut text, |c| c.is_ascii_digit() || c == '_');
        }
    }

    consume_invalid_numeric_tail(chars, &mut text);
    let allow_long_suffix = !text.contains('.');
    consume_numeric_suffix(chars, &mut text, allow_long_suffix);
    text
}

fn consume_while<F>(
    chars: &mut std::iter::Peekable<std::str::CharIndices<'_>>,
    text: &mut String,
    mut predicate: F,
) where
    F: FnMut(char) -> bool,
{
    while let Some((_, c)) = chars.peek().copied() {
        if !predicate(c) {
            break;
        }
        text.push(c);
        chars.next();
    }
}

fn consume_invalid_numeric_tail(
    chars: &mut std::iter::Peekable<std::str::CharIndices<'_>>,
    text: &mut String,
) {
    while let Some((_, c)) = chars.peek().copied() {
        if !(c.is_ascii_alphanumeric() || c == '_') {
            break;
        }
        text.push(c);
        chars.next();
    }
}

fn consume_numeric_suffix(
    chars: &mut std::iter::Peekable<std::str::CharIndices<'_>>,
    text: &mut String,
    allow_long_suffix: bool,
) {
    if let Some((_, suffix)) = chars.peek().copied() {
        if matches!(suffix, 'f' | 'F' | 'd' | 'D') || (allow_long_suffix && matches!(suffix, 'l' | 'L')) {
            text.push(suffix);
            chars.next();
        }
    }
}

fn validate_number_literal(text: &str, position: usize) -> Result<(), LexError> {
    let (body, suffix) = split_numeric_suffix(text);
    if body.is_empty() {
        return Err(LexError::InvalidNumericLiteral(
            position,
            "Literal body cannot be empty".to_string(),
        ));
    }
    if body.contains('.') {
        if matches!(suffix, Some('l' | 'L')) {
            return Err(LexError::InvalidNumericLiteral(
                position,
                format!("Long suffix is not valid on floating literal '{text}'"),
            ));
        }
        let parts: Vec<&str> = body.split('.').collect();
        if parts.len() != 2 || parts[0].is_empty() || parts[1].is_empty() {
            return Err(LexError::InvalidNumericLiteral(
                position,
                format!("Floating literal '{text}' must contain digits on both sides of '.'"),
            ));
        }
        validate_numeric_group(parts[0], 10, position, text)?;
        validate_numeric_group(parts[1], 10, position, text)?;
        let normalized = format!(
            "{}.{}",
            parts[0].replace('_', ""),
            parts[1].replace('_', "")
        );
        normalized.parse::<f64>().map_err(|_| {
            LexError::InvalidNumericLiteral(position, format!("Invalid floating literal '{text}'"))
        })?;
        return Ok(());
    }

    let (digits, radix) = if let Some(rest) = body.strip_prefix("0x").or_else(|| body.strip_prefix("0X"))
    {
        (rest, 16)
    } else if let Some(rest) = body.strip_prefix("0b").or_else(|| body.strip_prefix("0B")) {
        (rest, 2)
    } else if body.len() > 1 && body.starts_with('0') {
        (&body[1..], 8)
    } else {
        (body, 10)
    };

    validate_numeric_group(digits, radix, position, text)?;
    let normalized = digits.replace('_', "");
    i64::from_str_radix(&normalized, radix).map_err(|_| {
        LexError::InvalidNumericLiteral(position, format!("Invalid numeric literal '{text}'"))
    })?;
    Ok(())
}

fn split_numeric_suffix(text: &str) -> (&str, Option<char>) {
    let mut chars = text.chars();
    let last = chars.next_back();
    match last {
        Some(suffix @ ('l' | 'L' | 'f' | 'F' | 'd' | 'D')) => (&text[..text.len() - 1], Some(suffix)),
        _ => (text, None),
    }
}

fn validate_numeric_group(
    text: &str,
    radix: u32,
    position: usize,
    original: &str,
) -> Result<(), LexError> {
    if text.is_empty() {
        return Err(LexError::InvalidNumericLiteral(
            position,
            format!("Numeric literal '{original}' is missing digits"),
        ));
    }
    let bytes = text.as_bytes();
    if bytes.first() == Some(&b'_') || bytes.last() == Some(&b'_') || text.contains("__") {
        return Err(LexError::InvalidNumericLiteral(
            position,
            format!("Numeric literal '{original}' has invalid underscore placement"),
        ));
    }
    for ch in text.chars().filter(|c| *c != '_') {
        let ok = match radix {
            2 => matches!(ch, '0' | '1'),
            8 => matches!(ch, '0'..='7'),
            10 => ch.is_ascii_digit(),
            16 => ch.is_ascii_hexdigit(),
            _ => false,
        };
        if !ok {
            return Err(LexError::InvalidNumericLiteral(
                position,
                format!("Numeric literal '{original}' contains invalid digit '{ch}'"),
            ));
        }
    }
    Ok(())
}
