# F2 Task Board: Docs and Developer Experience

Status legend: `Todo`, `In Progress`, `Blocked`, `Done (Locked)`.

## Scope
F2 turns Aden Lang from a project that can be worked on by insiders into one that external developers can realistically learn, adopt, navigate, and succeed with. It covers the language specification, reference and tutorial documentation, style guidance, API documentation generation, starter templates, onboarding flows, and the developer-experience contract around docs staying aligned with the actual language/toolchain. Feature documentation is expected to land during F1; F2 turns that growing body of truthful docs into a coherent, externally usable documentation system, including the distinction between public `stdlib` guidance and any later `adklib` documentation needed for compiler/runtime authors.

## F2 Strict Done Policy
- F2 is not complete when docs merely exist; they must be accurate, navigable, and aligned with current compiler/runtime behavior.
- `Done (Locked)` means the docs/template/tooling surface is versioned, testable where possible, and usable by someone who is not already carrying repo context.
- Any user-facing command, syntax, or stdlib API documented in F2 must be backed by the current implementation or explicitly marked as future/deferred.
- F2 does not excuse undocumented features during F1; it organizes, validates, and externalizes docs as features are added.
- Generated documentation tooling only counts when it is reproducible and integrated into the broader dev workflow.

## Workstream A: Information Architecture and Source-of-Truth Policy

| ID | Task | Depends On | Owner | Target | Status | Exit Condition |
|---|---|---|---|---|---|---|
| F2-01 | Audit all current docs and classify them as current, stale, historical, or internal-only | F1 | - | - | Todo | A repo-wide docs inventory exists and stale/obsolete docs are clearly identified |
| F2-02 | Define source-of-truth policy for language, stdlib, CLI, runtime ABI, roadmap, and closure docs | F2-01 | - | - | Todo | Each major subject has one canonical doc family and cross-links enforce that structure |
| F2-03 | Lock language-facing docs structure under `docs/language/{compiler-backed,runtime-backed,stdlib}` and classify what belongs there versus general docs | F2-01, F2-02 | - | - | Todo | Language-facing documentation has a fixed home, stdlib docs follow package structure, and non-language docs remain outside that tree |
| F2-04 | Add versioning/update policy so docs track language/toolchain evolution without ambiguity | F2-02 | - | - | Todo | Docs carry clear status/version/update expectations and stale-doc drift is operationally managed |

## Workstream B: Language Reference and Specification

| ID | Task | Depends On | Owner | Target | Status | Exit Condition |
|---|---|---|---|---|---|---|
| F2-05 | Publish a formal-ish language specification baseline for the selected F1 Java-close subset | F1-68, F1-70 | - | - | Todo | A readable spec exists covering declarations, statements, expressions, types, and core semantics |
| F2-06 | Expand syntax reference into grammar-oriented reference pages with examples and edge-case notes | F2-05 | - | - | Todo | Syntax reference is deeper than tutorials and clearly separates syntax from semantics |
| F2-07 | Publish semantic rules reference (type conversions, overloads, visibility, nullability, exceptions, generics policy) | F2-05 | - | - | Todo | Core semantic rules are documented in one discoverable reference surface |
| F2-08 | Document intentional Aden-vs-Java differences and supported subset boundaries | F2-05, F1-68 | - | - | Todo | Compatibility boundaries are explicit and easy to find for external developers |
| F2-09 | Add cookbook/reference examples for common language features and cross-feature interactions | F2-06, F2-07 | - | - | Todo | Developers can find concrete working examples for major language features |

## Workstream C: Stdlib and API Documentation

| ID | Task | Depends On | Owner | Target | Status | Exit Condition |
|---|---|---|---|---|---|---|
| F2-10 | Expand stdlib docs from class inventory to signature-level API reference | F1-69 | - | - | Todo | API docs cover classes, methods, constructors, and behavior notes at signature granularity |
| F2-11 | Define API doc generation strategy from stdlib/compiler metadata or source AdenDoc annotations | F2-10 | - | - | Todo | API doc generation pipeline is designed around the real Aden source/doc model and is reproducible |
| F2-12 | Implement API docs generator baseline for shipped stdlib surface | F2-11 | - | - | Todo | Generated API docs can be produced deterministically and integrated into docs output |
| F2-13 | Add behavior notes/examples for core stdlib families (`lang`, collections, io, math, time, util-style helpers) | F2-10 | - | - | Todo | API docs include enough examples/notes to be practical, not just signature dumps |
| F2-14 | Cross-link API docs to language/reference docs and compatibility notes | F2-10, F2-12, F2-13 | - | - | Todo | Users can move cleanly between language rules and API surfaces without dead ends |
| F2-14A | Require JavaDoc-style AdenDoc coverage for shipped stdlib `.aden` files and document multiline AdenDoc conventions | F1, F2-03 | - | - | Todo | Current stdlib source documents each shipped class/interface plus its public constructors, methods, and public fields with `/** ... */` blocks before full docs generation lands |

## Workstream D: Developer Guides, Tutorials, and Templates

| ID | Task | Depends On | Owner | Target | Status | Exit Condition |
|---|---|---|---|---|---|---|
| F2-15 | Publish a getting-started guide from install to first successful build/run/package | D, F1 | - | - | Todo | A new developer can go from zero to a working project using only the published docs |
| F2-16 | Publish project-structure and package-layout guide for real-world Aden Lang apps | D2, F1 | - | - | Todo | Project organization guidance is clear and consistent with manifest/build behavior |
| F2-17 | Publish official style guide and conventions baseline | F2-05, F2-15 | - | - | Todo | A stable style guide exists for formatting, naming, package structure, and code organization |
| F2-18 | Create starter templates for common project types (console app, library, collections/io app, larger multi-file app) | D1, D2, F1 | - | - | Todo | Starter templates are useful, maintained, and aligned with the actual recommended workflow |
| F2-19 | Add template-specific docs and walkthroughs that explain the generated project layout | F2-18 | - | - | Todo | Templates teach, not just scaffold, and are backed by docs that stay current |
| F2-20 | Publish migration/adoption guidance for Java-oriented developers evaluating Aden Lang | F2-08, F2-15, F2-17 | - | - | Todo | Java-familiar users can quickly understand similarities, differences, and current limits |

## Workstream E: Tooling UX Documentation and Contributor Experience

| ID | Task | Depends On | Owner | Target | Status | Exit Condition |
|---|---|---|---|---|---|---|
| F2-21 | Publish CLI reference for `new`, `check`, `build`, `test`, `package`, profiles, and packaging flows | D1, D2, D3, D4 | - | - | Todo | CLI reference is complete, accurate, and aligned with command snapshots/contracts |
| F2-22 | Publish build-mode guide covering fat/shared output, packaging, and install-time considerations | E1, E2, E3 | - | - | Todo | Build-mode guidance is clear enough for external developers to choose the right output mode |
| F2-23 | Publish contributor guide for repo layout, major docs, task boards, fixtures, and validation flows | C2, C3, D, E, F1 | - | - | Todo | New contributors can orient themselves without tribal knowledge |
| F2-24 | Add docs maintenance workflow, docs-example conformance checks, and lint/check integration for link health, stale references, and generated docs | F2-02, F2-12 | - | - | Todo | Docs quality has automated checks, published examples stay truthful, and broken/stale docs are easier to catch |

## Workstream F: External-Developer Validation and Closure

| ID | Task | Depends On | Owner | Target | Status | Exit Condition |
|---|---|---|---|---|---|---|
| F2-25 | Create external-developer validation checklist for docs/tutorial/template usability | F2-15, F2-18, F2-21 | - | - | Todo | There is a repeatable usability review checklist for external-facing docs and templates |
| F2-26 | Run repo-wide docs refresh to reconcile stale guides with current runtime/build reality | F2-01, F2-05, F2-10, F2-21 | - | - | Todo | Major stale-doc mismatches are removed and current docs agree with the implementation baseline |
| F2-27 | Publish validation-system docs for external developers (testing/conformance matrix, docs-check workflow, benchmark/reference links where surfaced) | F2-24, F2-26 | - | - | Todo | External users and contributors can understand how docs and examples are kept trustworthy |
| F2-28 | Publish F2 closure checklist and evidence index | F2-24, F2-25, F2-26, F2-27 | - | - | Todo | Closure docs cross-link the language spec, API docs, guides, templates, and validation evidence |
| F2-29 | Run F2 closure verification and roadmap lock | F2-28 | - | - | Todo | F2 tasks/gates are `Done (Locked)` and roadmap reflects the locked docs/devex baseline |

## F2 Gates

| Gate | Definition | Status |
|---|---|---|
| F2-G1 | Docs information architecture and source-of-truth policy are stable | Todo |
| F2-G2 | Language reference/spec is complete for the selected F1 baseline | Todo |
| F2-G3 | Stdlib/API documentation is practical and reproducible | Todo |
| F2-G4 | Guides, tutorials, and templates are useful to external developers | Todo |
| F2-G5 | CLI/build/contributor documentation is accurate and navigable | Todo |
| F2-G6 | Docs quality and closure artifacts are complete | Todo |

## Required Test/Evidence Gates

| Gate ID | Gate | Command / Evidence | Status |
|---|---|---|---|
| F2-G1 | Information architecture and source-of-truth policy | docs inventory, canonical-doc map, and cross-link review evidence | Todo |
| F2-G2 | Language reference/spec | language spec + syntax/semantics reference pages aligned with current implementation/tests | Todo |
| F2-G3 | Stdlib/API documentation | generated API docs pipeline + reviewed signature/reference docs for shipped stdlib surface | Todo |
| F2-G4 | Guides, tutorials, and templates | walkthrough validation from install/scaffold to successful build/run/package | Todo |
| F2-G5 | Tooling and contributor docs | CLI/build/contributor guides plus snapshot/alignment checks against actual command behavior | Todo |
| F2-G6 | Docs quality and closure artifacts | docs checks/lints + docs-example conformance + validation-system docs + closure checklist + evidence index + stale-doc reconciliation pass | Todo |

## Suggested First 3 Sprints

### Sprint 1 (Truthful Docs Foundation)
- Target tasks: `F2-01`..`F2-09`
- Focus: establish the docs architecture and get the language/reference layer truthful and navigable
- Exit checks:
  - `F2-G1` and `F2-G2` green at baseline level
  - the language docs no longer depend on insider context

### Sprint 2 (API Docs + Templates)
- Target tasks: `F2-10`..`F2-20`
- Focus: make stdlib docs, tutorials, templates, and adoption guidance genuinely useful
- Exit checks:
  - `F2-G3` and `F2-G4` green at baseline level
  - a new developer can scaffold and understand a project using the published materials

### Sprint 3 (Tooling Docs + Closure)
- Target tasks: `F2-21`..`F2-28`
- Focus: finish CLI/build/contributor guidance, docs automation, stale-doc cleanup, and closure evidence
- Exit checks:
  - `F2-G5` and `F2-G6` green
  - the docs surface is cohesive, current, and maintainable

## Exit Criteria

| Milestone | Exit Criteria |
|---|---|
| F2 | Tasks `F2-01`..`F2-29` and gates `F2-G1`..`F2-G6` are all `Done (Locked)` |
| F2 Deliverable | External developers can learn, navigate, and use Aden Lang through a complete, accurate, and maintainable documentation/devex surface |
