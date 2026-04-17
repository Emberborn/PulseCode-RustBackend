use super::*;

pub(super) fn is_assignable_target(expr: &Expr) -> bool {
    matches!(
        expr,
        Expr::Var(_) | Expr::MemberAccess { .. } | Expr::ArrayAccess { .. }
    )
}

pub(super) fn is_switch_case_literal(expr: &Expr) -> bool {
    matches!(
        expr,
        Expr::IntLiteral(_) | Expr::CharLiteral(_) | Expr::StringLiteral(_) | Expr::BoolLiteral(_)
    )
}

pub(super) fn switch_case_key(expr: &Expr) -> String {
    match expr {
        Expr::IntLiteral(value) => format!("int:{value}"),
        Expr::CharLiteral(value) => format!("char:{}", *value as u32),
        Expr::StringLiteral(value) => format!("str:{value}"),
        Expr::BoolLiteral(value) => format!("bool:{value}"),
        _ => "invalid".to_string(),
    }
}

pub(super) fn incdec_name(op: IncDecOp) -> &'static str {
    match op {
        IncDecOp::Inc => "++",
        IncDecOp::Dec => "--",
    }
}

pub(super) fn format_method_overloads(name: &str, methods: &[MethodSignature]) -> String {
    if methods.is_empty() {
        return "none".to_string();
    }

    methods
        .iter()
        .map(|m| format!("{}({})", name, format_params(&m.param_types, m.is_varargs)))
        .collect::<Vec<_>>()
        .join("; ")
}

pub(super) fn format_constructor_signatures(constructors: &[ConstructorSignature]) -> String {
    if constructors.is_empty() {
        return "none".to_string();
    }

    constructors
        .iter()
        .map(|ctor| format!("({})", format_params(&ctor.param_types, ctor.is_varargs)))
        .collect::<Vec<_>>()
        .join("; ")
}

fn format_params(param_types: &[String], is_varargs: bool) -> String {
    if !is_varargs || param_types.is_empty() {
        return param_types.join(",");
    }
    let mut rendered = param_types[..param_types.len() - 1].to_vec();
    let vararg = param_types[param_types.len() - 1]
        .strip_suffix("[]")
        .unwrap_or(param_types[param_types.len() - 1].as_str());
    rendered.push(format!("{vararg}..."));
    rendered.join(",")
}

pub(super) fn visibility_name(visibility: MemberVisibility) -> &'static str {
    match visibility {
        MemberVisibility::Public => "public",
        MemberVisibility::Protected => "protected",
        MemberVisibility::Private => "private",
        MemberVisibility::Package => "package-private",
    }
}
