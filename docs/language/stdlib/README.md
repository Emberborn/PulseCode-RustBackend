# Stdlib Language Docs

This directory is the canonical home for language-facing documentation for shipped stdlib classes.

Structure rule:
- mirror the stdlib package structure under `stdlib/src/aden/**`
- each doc file corresponds to exactly one `.aden` class/interface/enum
- each reference page is derived from AdenDoc on the source file, including the type plus its documented public fields, constructors, and methods
- regenerate the checked-in reference pages with `scripts/generate-stdlib-docs.ps1`
- the generator overwrites the generated `docs/language/stdlib/aden/**` tree on each run so the checked-in docs stay aligned with current source AdenDoc

Examples:
- `docs/language/stdlib/aden/lang/String.md`
- `docs/language/stdlib/aden/collections/ArrayList.md`

Non-class language docs belong in:
- `docs/language/compiler-backed`
- `docs/language/runtime-backed`
