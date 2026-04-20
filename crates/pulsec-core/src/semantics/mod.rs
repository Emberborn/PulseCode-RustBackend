use std::collections::{HashMap, HashSet};

use crate::{
    implicit_prelude_packages, is_builtin_type, BinaryOp, CatchClause, ClassContext, ClassDecl,
    ClassMember, Expr, ImportDecl, IncDecOp, MethodDecl, Modifier, Program, SemanticError, Stmt,
    UnaryOp,
};

#[path = "bootstrap/builtins.rs"]
mod builtins;

#[path = "types/type_utils.rs"]
mod type_utils;
use type_utils::*;

#[path = "types/type_names.rs"]
mod type_names;
use type_names::*;

#[path = "types/type_format.rs"]
mod type_format;
use type_format::*;

#[path = "types/type_relations.rs"]
mod type_relations;
use type_relations::*;

#[path = "types/type_resolution.rs"]
mod type_resolution;
use type_resolution::*;

#[path = "bootstrap/annotations.rs"]
mod annotations;
use annotations::*;

#[path = "types/nullability.rs"]
mod nullability;
use nullability::*;

#[path = "resolution/resolution.rs"]
mod resolution;
use resolution::*;

#[path = "resolution/symbol_resolution.rs"]
mod symbol_resolution;
use symbol_resolution::*;

#[path = "resolution/member_resolution.rs"]
mod member_resolution;
use member_resolution::*;

#[path = "resolution/inheritance.rs"]
mod inheritance;
use inheritance::*;

#[path = "validation/method_validation.rs"]
mod method_validation;
use method_validation::*;

#[path = "validation/stmt_validation.rs"]
mod stmt_validation;
use stmt_validation::*;

#[path = "validation/stmt_control_flow.rs"]
mod stmt_control_flow;
use stmt_control_flow::*;

#[path = "validation/stmt_runtime_flow.rs"]
mod stmt_runtime_flow;
use stmt_runtime_flow::*;

#[path = "validation/field_validation.rs"]
mod field_validation;
use field_validation::*;

#[path = "validation/expr_validation.rs"]
mod expr_validation;
use expr_validation::*;

#[path = "validation/try_validation.rs"]
mod try_validation;
use try_validation::*;
#[path = "validation/exception_analysis.rs"]
mod exception_analysis;
use exception_analysis::*;
#[path = "analysis/program_analysis.rs"]
mod program_analysis;
use program_analysis::*;

#[path = "analysis/class_collection.rs"]
mod class_collection;
use class_collection::*;

#[path = "analysis/member_collection.rs"]
mod member_collection;
use member_collection::*;

#[path = "validation/modifier_validation.rs"]
mod modifier_validation;
use modifier_validation::*;

#[derive(Debug, Clone)]
struct FieldInfo {
    ty: String,
    is_static: bool,
    is_final: bool,
    is_not_null: bool,
    is_runtime_managed: bool,
    visibility: MemberVisibility,
}

#[derive(Debug, Clone, PartialEq, Eq)]
struct MethodSignature {
    type_params: Vec<String>,
    param_types: Vec<String>,
    return_type: String,
    declared_throws: Vec<String>,
    is_varargs: bool,
    is_static: bool,
    is_final: bool,
    is_abstract: bool,
    visibility: MemberVisibility,
}

#[derive(Debug, Clone)]
struct ResolvedMethodCandidate {
    owner_fqcn: String,
    signature: MethodSignature,
}

#[derive(Debug, Clone)]
struct ConstructorSignature {
    param_types: Vec<String>,
    declared_throws: Vec<String>,
    is_varargs: bool,
}

#[derive(Debug, Clone)]
struct ClassInfo {
    simple_name: String,
    package_name: String,
    type_params: Vec<String>,
    super_class: Option<String>,
    interfaces: Vec<String>,
    is_interface: bool,
    is_enum: bool,
    is_abstract: bool,
    is_final: bool,
    enum_constants: Vec<String>,
    generic_arity: usize,
    fields: HashMap<String, FieldInfo>,
    methods: HashMap<String, Vec<MethodSignature>>,
    constructors: Vec<ConstructorSignature>,
}

#[derive(Debug, Clone)]
struct OverrideRequirement {
    class_fqcn: String,
    class_name: String,
    method_name: String,
    param_types: Vec<String>,
    return_type: String,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
enum AnnotationTargetKind {
    Class,
    Field,
    Method,
}

#[derive(Debug, Clone, Copy)]
struct AnnotationSpec {
    simple_name: &'static str,
    targets: &'static [AnnotationTargetKind],
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
enum ExprKind {
    Value,
    ClassRef,
}

#[derive(Debug, Clone)]
struct ExprType {
    ty: String,
    kind: ExprKind,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
enum MemberVisibility {
    Public,
    Protected,
    Private,
    Package,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
enum NullState {
    Unknown,
    Null,
    NonNull,
}

pub fn analyze(program: &Program) -> Result<(), SemanticError> {
    let contexts = default_class_contexts(program);
    analyze_impl(program, &contexts)
}

pub fn analyze_with_class_packages(
    program: &Program,
    class_packages: &HashMap<String, String>,
) -> Result<(), SemanticError> {
    let contexts = build_class_contexts(program, class_packages, &HashMap::new());
    analyze_impl(program, &contexts)
}

pub fn analyze_with_class_packages_and_imports(
    program: &Program,
    class_packages: &HashMap<String, String>,
    class_imports: &HashMap<String, Vec<ImportDecl>>,
) -> Result<(), SemanticError> {
    let contexts = build_class_contexts(program, class_packages, class_imports);
    analyze_impl(program, &contexts)
}

pub fn analyze_with_class_contexts(
    program: &Program,
    class_contexts: &[ClassContext],
) -> Result<(), SemanticError> {
    analyze_impl(program, class_contexts)
}

fn block_guarantees_return(stmts: &[Stmt]) -> bool {
    for stmt in stmts {
        if stmt_guarantees_return(stmt) {
            return true;
        }
    }
    false
}

#[allow(clippy::too_many_arguments)]
fn stmt_guarantees_return(stmt: &Stmt) -> bool {
    match stmt {
        Stmt::Return(..) | Stmt::Throw(..) => true,
        Stmt::If {
            then_branch,
            else_branch,
            ..
        } => else_branch
            .as_ref()
            .map(|else_branch| {
                block_guarantees_return(then_branch) && block_guarantees_return(else_branch)
            })
            .unwrap_or(false),
        Stmt::Switch { cases, default, .. } => {
            let Some(default_body) = default else {
                return false;
            };

            if cases.is_empty() {
                return block_guarantees_return(default_body);
            }

            cases.iter().all(|c| block_guarantees_return(&c.body))
                && block_guarantees_return(default_body)
        }
        Stmt::Try {
            resources,
            body,
            catches,
            finally_block,
            ..
        } => {
            if !resources.is_empty() {
                return false;
            }
            if let Some(finally_block) = finally_block {
                if block_guarantees_return(finally_block) {
                    return true;
                }
            }

            let body_returns = block_guarantees_return(body);
            if catches.is_empty() {
                body_returns
            } else {
                body_returns
                    && catches
                        .iter()
                        .all(|catch_clause| block_guarantees_return(&catch_clause.body))
            }
        }
        Stmt::Assert { .. } => false,
        Stmt::ForEach { .. } => false,
        _ => false,
    }
}

fn build_fqcn_index(class_index: &HashMap<String, ClassInfo>) -> HashMap<String, String> {
    let mut out = HashMap::new();
    for fqcn in class_index.keys() {
        if fqcn.contains('.') {
            out.insert(fqcn.clone(), fqcn.clone());
        }
    }
    out
}

fn is_throwable_type(ty: &str, class_index: &HashMap<String, ClassInfo>) -> bool {
    types_compatible("pulse.lang.Throwable", ty, class_index)
}

fn is_runtime_exception_type(ty: &str, class_index: &HashMap<String, ClassInfo>) -> bool {
    types_compatible("pulse.lang.RuntimeException", ty, class_index)
}

fn is_checked_exception_type(ty: &str, class_index: &HashMap<String, ClassInfo>) -> bool {
    is_throwable_type(ty, class_index) && !is_runtime_exception_type(ty, class_index)
}

fn collect_fqcn_names(class_index: &HashMap<String, ClassInfo>) -> HashSet<String> {
    class_index
        .keys()
        .filter(|name| name.contains('.'))
        .cloned()
        .collect()
}

fn collect_simple_to_fqcns(
    class_index: &HashMap<String, ClassInfo>,
) -> HashMap<String, Vec<String>> {
    let mut out: HashMap<String, Vec<String>> = HashMap::new();
    for fqcn in class_index.keys().filter(|name| name.contains('.')) {
        let simple = class_simple_name(fqcn).to_string();
        out.entry(simple).or_default().push(fqcn.clone());
    }
    for values in out.values_mut() {
        values.sort();
        values.dedup();
    }
    out
}

fn resolve_class_fqcn(
    name: &str,
    current_package: &str,
    imports: &[ImportDecl],
    class_index: &HashMap<String, ClassInfo>,
) -> Result<Option<String>, SemanticError> {
    if name.contains('.') {
        if class_index.contains_key(name) {
            return Ok(Some(name.to_string()));
        }
        return Ok(None);
    }

    let same_package = format!("{}.{}", current_package, name);
    if class_index.contains_key(&same_package) {
        return Ok(Some(same_package));
    }

    let mut explicit = Vec::new();
    for import in imports {
        if import.is_static || import.is_wildcard {
            continue;
        }
        if let Some((_, simple)) = import.path.rsplit_once('.') {
            if simple == name && class_index.contains_key(&import.path) {
                explicit.push(import.path.clone());
            }
        }
    }
    explicit.sort();
    explicit.dedup();
    if explicit.len() > 1 {
        return Err(semantic_error(format!(
            "Ambiguous class reference '{}' in package '{}': {}",
            name,
            current_package,
            explicit.join("; ")
        )));
    }
    if let Some(hit) = explicit.into_iter().next() {
        return Ok(Some(hit));
    }

    let mut wildcard = Vec::new();
    for import in imports {
        if import.is_static || !import.is_wildcard {
            continue;
        }
        let candidate = format!("{}.{}", import.path, name);
        if class_index.contains_key(&candidate) {
            wildcard.push(candidate);
        }
    }
    wildcard.sort();
    wildcard.dedup();
    if wildcard.len() > 1 {
        return Err(semantic_error(format!(
            "Ambiguous class reference '{}' in package '{}': {}",
            name,
            current_package,
            wildcard.join("; ")
        )));
    }
    if let Some(hit) = wildcard.into_iter().next() {
        return Ok(Some(hit));
    }

    let mut prelude = Vec::new();
    for package in implicit_prelude_packages() {
        let candidate = format!("{}.{}", package, name);
        if class_index.contains_key(&candidate) {
            prelude.push(candidate);
        }
    }
    prelude.sort();
    prelude.dedup();
    if prelude.len() > 1 {
        return Err(semantic_error(format!(
            "Ambiguous prelude class reference '{}' in package '{}': {}",
            name,
            current_package,
            prelude.join("; ")
        )));
    }

    Ok(prelude.into_iter().next())
}

fn default_class_contexts(program: &Program) -> Vec<ClassContext> {
    program
        .classes
        .iter()
        .map(|_| ClassContext {
            package_name: program.package.name.clone(),
            imports: program.imports.clone(),
        })
        .collect()
}

fn build_class_contexts(
    program: &Program,
    class_packages: &HashMap<String, String>,
    class_imports: &HashMap<String, Vec<ImportDecl>>,
) -> Vec<ClassContext> {
    program
        .classes
        .iter()
        .map(|class| {
            let fqcn = format!("{}.{}", program.package.name, class.name);
            let package_name = class_packages
                .get(&fqcn)
                .or_else(|| class_packages.get(&class.name))
                .cloned()
                .unwrap_or_else(|| program.package.name.clone());
            let imports = class_imports
                .get(&fqcn)
                .or_else(|| class_imports.get(&class.name))
                .cloned()
                .unwrap_or_else(|| program.imports.clone());
            ClassContext {
                package_name,
                imports,
            }
        })
        .collect()
}

fn resolve_imported_static_field(
    name: &str,
    current_class_name: &str,
    current_class_fqcn: &str,
    current_package: &str,
    class_index: &HashMap<String, ClassInfo>,
    fqcn_to_class: &HashMap<String, String>,
    imports: &[ImportDecl],
) -> Result<Option<String>, SemanticError> {
    let mut matches: Vec<FieldInfo> = Vec::new();

    for import in imports {
        if !import.is_static {
            continue;
        }

        if import.is_wildcard {
            if let Some(owner) = fqcn_to_class.get(&import.path) {
                if let Some(class_info) = class_index.get(owner) {
                    if let Some(field) = class_info.fields.get(name) {
                        if field.is_static
                            && is_member_accessible(
                                field.visibility,
                                owner,
                                &class_info.package_name,
                                current_class_fqcn,
                                current_package,
                                class_index,
                            )
                        {
                            matches.push(field.clone());
                        }
                    }
                }
            }
            continue;
        }

        if let Some((owner_fqcn, member)) = import.path.rsplit_once('.') {
            if member != name {
                continue;
            }
            if let Some(owner) = fqcn_to_class.get(owner_fqcn) {
                if let Some(class_info) = class_index.get(owner) {
                    if let Some(field) = class_info.fields.get(member) {
                        if field.is_static
                            && is_member_accessible(
                                field.visibility,
                                owner,
                                &class_info.package_name,
                                current_class_fqcn,
                                current_package,
                                class_index,
                            )
                        {
                            matches.push(field.clone());
                        }
                    }
                }
            }
        }
    }

    if matches.len() > 1 {
        return Err(semantic_error(format!(
            "Ambiguous static field reference '{}' in class '{}'",
            name, current_class_name
        )));
    }

    Ok(matches.into_iter().next().map(|f| f.ty))
}

fn resolve_imported_static_method(
    name: &str,
    arg_types: &[String],
    current_class_name: &str,
    current_class_fqcn: &str,
    current_package: &str,
    class_index: &HashMap<String, ClassInfo>,
    fqcn_to_class: &HashMap<String, String>,
    imports: &[ImportDecl],
) -> Result<Option<MethodSignature>, SemanticError> {
    #[derive(Clone)]
    struct StaticImportMethodMatch {
        owner_simple: String,
        signature: MethodSignature,
    }

    let mut matches: Vec<StaticImportMethodMatch> = Vec::new();

    for import in imports {
        if !import.is_static {
            continue;
        }

        if import.is_wildcard {
            if let Some(owner) = fqcn_to_class.get(&import.path) {
                if let Some(class_info) = class_index.get(owner) {
                    if let Some(candidates) = class_info.methods.get(name) {
                        for sig in candidates {
                            if sig.is_static
                                && signature_params_match(&sig.param_types, arg_types, class_index)
                                && is_member_accessible(
                                    sig.visibility,
                                    owner,
                                    &class_info.package_name,
                                    current_class_fqcn,
                                    current_package,
                                    class_index,
                                )
                            {
                                matches.push(StaticImportMethodMatch {
                                    owner_simple: class_info.simple_name.clone(),
                                    signature: sig.clone(),
                                });
                            }
                        }
                    }
                }
            }
            continue;
        }

        if let Some((owner_fqcn, member)) = import.path.rsplit_once('.') {
            if member != name {
                continue;
            }
            if let Some(owner) = fqcn_to_class.get(owner_fqcn) {
                if let Some(class_info) = class_index.get(owner) {
                    if let Some(candidates) = class_info.methods.get(member) {
                        for sig in candidates {
                            if sig.is_static
                                && signature_params_match(&sig.param_types, arg_types, class_index)
                                && is_member_accessible(
                                    sig.visibility,
                                    owner,
                                    &class_info.package_name,
                                    current_class_fqcn,
                                    current_package,
                                    class_index,
                                )
                            {
                                matches.push(StaticImportMethodMatch {
                                    owner_simple: class_info.simple_name.clone(),
                                    signature: sig.clone(),
                                });
                            }
                        }
                    }
                }
            }
        }
    }

    if matches.is_empty() {
        return Ok(None);
    }

    let mut best_score: Option<u16> = None;
    let mut best_indices: Vec<usize> = Vec::new();
    for (idx, candidate) in matches.iter().enumerate() {
        if let Some(score) = signature_match_score(
            &candidate.signature.param_types,
            candidate.signature.is_varargs,
            arg_types,
            class_index,
        ) {
            match best_score {
                None => {
                    best_score = Some(score);
                    best_indices.clear();
                    best_indices.push(idx);
                }
                Some(existing) if score < existing => {
                    best_score = Some(score);
                    best_indices.clear();
                    best_indices.push(idx);
                }
                Some(existing) if score == existing => {
                    best_indices.push(idx);
                }
                Some(_) => {}
            }
        }
    }

    if best_indices.is_empty() {
        return Ok(None);
    }

    if best_indices.len() > 1 {
        let options = best_indices
            .iter()
            .map(|idx| {
                let hit = &matches[*idx];
                format!(
                    "{}.{}({})",
                    hit.owner_simple,
                    name,
                    hit.signature.param_types.join(",")
                )
            })
            .collect::<Vec<_>>()
            .join("; ");
        return Err(semantic_error(format!(
            "Ambiguous static method reference '{}({})' in class '{}': {}",
            name,
            arg_types.join(","),
            current_class_name,
            options
        )));
    }

    Ok(best_indices
        .into_iter()
        .next()
        .map(|idx| matches[idx].signature.clone()))
}
