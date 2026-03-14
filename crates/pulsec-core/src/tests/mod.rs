use crate::{
    analyze_with_class_contexts, check, lex, lower_to_ir, parse, ClassContext, Program, TokenKind,
};

fn analyze_merged_with_contexts(sources: &[&str]) -> Result<(), crate::SemanticError> {
    let parsed = sources
        .iter()
        .map(|src| parse(src).expect("source should parse"))
        .collect::<Vec<_>>();
    let root = parsed.first().expect("at least one source");

    let mut classes = Vec::new();
    let mut contexts = Vec::new();
    for program in &parsed {
        for class in &program.classes {
            classes.push(class.clone());
            contexts.push(ClassContext {
                package_name: program.package.name.clone(),
                imports: program.imports.clone(),
            });
        }
    }

    let merged = Program {
        package: root.package.clone(),
        imports: root.imports.clone(),
        classes,
    };
    analyze_with_class_contexts(&merged, &contexts)
}

#[path = "lex_and_parse.rs"]
mod lex_and_parse;
#[path = "f1_baselines.rs"]
mod f1_baselines;
#[path = "semantic_rules.rs"]
mod semantic_rules;
#[path = "multi_source_analysis.rs"]
mod multi_source_analysis;
#[path = "stdlib_surface.rs"]
mod stdlib_surface;
