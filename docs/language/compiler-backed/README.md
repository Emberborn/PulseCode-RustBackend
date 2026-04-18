# Compiler-Backed Language Docs

This directory is the canonical home for language-facing documentation about Aden Lang features
that are primarily implemented or constrained by the compiler/frontend/type system.

Examples:
- syntax-only features
- parser/semantic rules
- type-system behavior
- language-reference material that does not map to a shipped stdlib class
- packages/imports
- declaration forms and modifiers
- statements and control flow
- annotations
- enums
- generics
- constructors
- primitive/reference type rules

Cross-cutting inventory / planning note:
- [../../impl_plan/by-java-version/README.md](/G:/Programming/Rust/Aden Lang/docs/impl_plan/by-java-version/README.md) is the version-first Aden Lang Java inventory, grouped by the Java release where a feature first appeared and then split into smaller spectrum files.
- `../../impl_plan/java-close-implementation-plan.md` remains only as a legacy monolithic artifact while an external process still has it locked.

Non-language operational docs should remain outside `docs/language/`.
