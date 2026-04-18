# F1 Baseline Audit

Date: 2026-03-11

This document is the truthful starting-point audit for Phase F1. It records what Aden Lang already supports end-to-end, what is frontend/semantic-only, what is still explicitly fenced, and what remains shallow enough that F1 should not over-claim it.

## Audit Scope

Reviewed sources:

- `crates/adenc-core/src/lib.rs`
- `crates/adenc-core/src/parser.rs`
- `crates/adenc-core/src/semantics.rs`
- `crates/adenc-core/src/tests.rs`
- `crates/adenc-cli/src/main.rs`
- `crates/adenc-cli/src/backend.rs`
- `stdlib/src/com/aden/**`
- executable/fixture evidence under `crates/adenc-cli/tests/**`

## End-To-End Supported Baseline

These areas are already materially real across parser, semantics, lowering/backend, runtime, and executable evidence where relevant.

### Project And Build Surface

- package declarations
- imports, wildcard imports, and static imports
- project-mode `check`, `build`, and `test`
- native executable output
- fat and shared output modes

Evidence:

- `crates/adenc-cli/src/main.rs`
- `crates/adenc-cli/src/backend.rs`
- `crates/adenc-cli/tests/fixture_projects.rs`
- `crates/adenc-cli/tests/phase_d_cli.rs`
- `crates/adenc-cli/tests/e3_parity.rs`

### Core Declaration And OOP Surface

- classes
- interfaces
- inheritance with `extends`
- interface implementation with `implements`
- constructors
- fields and methods
- `this`
- `super`
- `abstract`
- `final`
- `@Override`

Important current truth:

- interfaces are real
- interface inheritance through `extends` is still explicitly reserved, not implemented
- annotation support is not general; current real annotation support is effectively `@Override`

Evidence:

- `crates/adenc-core/src/parser.rs`
- `crates/adenc-core/src/semantics.rs`
- tests around abstract/interface/override support in `crates/adenc-core/src/tests.rs`
- dispatch/runtime executable evidence in `crates/adenc-cli/tests/fixture_projects.rs`

### Statements And Control Flow

- local declarations
- assignment and compound assignment
- `if` / `else`
- `while`
- `do-while`
- `for`
- `switch` / `case` / `default`
- `break`
- `continue`
- `return`

Evidence:

- statement parsing in `crates/adenc-core/src/parser.rs`
- condition and flow checks in `crates/adenc-core/src/semantics.rs`
- statement conformance tests in `crates/adenc-core/src/tests.rs`

### Expressions And Type Basics

- primitive literals: integer, long-suffix, float/double token forms already present in AST
- string literals
- boolean literals
- `null`
- unary `!` and numeric negation
- prefix/postfix `++` and `--`
- arithmetic `+ - * /`
- logical `&& ||`
- comparisons and equality
- member access
- method calls
- explicit numeric casts
- `instanceof`
- boxing/unboxing baseline

Important current truth:

- explicit cast support exists now
- `instanceof` is semantically checked and runtime-backed
- type system is still far from Java-complete promotions/conversions

Evidence:

- `crates/adenc-core/src/lib.rs`
- `crates/adenc-core/src/parser.rs`
- `crates/adenc-core/src/semantics.rs`
- cast/`instanceof` tests in `crates/adenc-core/src/tests.rs`

### Runtime And Execution Baseline

- runtime-backed object model
- ARC with cycle-reclamation strategy
- runtime-backed `System.out`/console path
- reflection-lite `Class`
- native startup/init/shutdown path
- shared-runtime boundary

Evidence:

- `crates/adenc-cli/src/backend.rs`
- `docs/SHARED_RUNTIME_ABI.md`
- `docs/RUNTIME_OWNERSHIP_POLICY.md`
- `crates/adenc-cli/tests/stage_locks_c2.rs`
- `crates/adenc-cli/tests/stage_locks_c3.rs`
- `crates/adenc-cli/tests/fixture_projects.rs`

### Current Shipped Stdlib Baseline

Already shipped and documented under `stdlib/src/com/aden/**`:

- `com.aden.lang`
- `com.aden.collections`
- `com.aden.io`
- `com.aden.math`
- `com.aden.time`
- `com.aden.rt`

Important current truth:

- these packages are real source/runtime surfaces
- many APIs are intentionally shallow and should not be described as Java-close-complete yet
- source AdenDoc and generated reference docs now exist for the shipped surface

## Present But Still Partial / Shallow

These areas exist enough to be real, but not enough to over-claim as Java-close-complete.

### Stdlib Surface

- `String` is runtime-backed but still small relative to Java
- `StringBuilder` exists but is still a minimal subset
- wrapper classes exist, but several parse/compare helpers are still shallow or intentionally stub-like in behavior
- collections are real, but non-generic and specialized around current runtime shapes
- IO exists, but is still a narrow text-centric baseline
- time/math packages exist, but are still small

### Reflection

- `Class` exists and is real
- full Java-style reflection/invocation is not real and must not be implied

### Arrays

- array types appear in semantic support, including entry signature support for `String[] args`
- array construction breadth and Java-close array syntax are not complete

## Reserved / Parsed / Tokenized But Not Supported As Real Features

These are the highest-risk over-claim areas because they look present in the lexer or AST, but are not currently a truthful “supported feature” baseline.

### Reserved Modifiers

The frontend recognizes:

- `synchronized`
- `native`
- `strictfp`
- `transient`
- `volatile`
- `async`

Current truth:

- these are reserved in the parser/modifier model
- current semantic behavior fences them with “reserved but not supported”
- they are not runtime-backed language features today

Evidence:

- `Modifier` enum in `crates/adenc-core/src/lib.rs`
- modifier parsing in `crates/adenc-core/src/parser.rs`
- supported-modifier enforcement in `crates/adenc-core/src/semantics.rs`
- `check_rejects_reserved_but_unsupported_modifier_usage` in `crates/adenc-core/src/tests.rs`

### Exceptions As Language Flow

Current truth:

- throwable/exception classes exist in the stdlib
- runtime failure paths exist
- `throw`
- `try`
- `catch`
- `finally`
- declaration-form try-with-resources

are now real language features in the shipped F1 baseline

### Enums

Current truth:

- `enum` is named on the F1 board as missing work
- parser declaration support is not present in the current frontend
- enum runtime semantics are not implemented

### General Annotations

Current truth:

- current practical annotation support is `@Override`
- class/field/method annotations outside that baseline are rejected or unsupported
- there is no broad annotation-processing model yet

### Generics

Current truth:

- compile-time instantiated generics with erased runtime are real for classes, interfaces, and methods
- generic arity is validated and primitive generic arguments are rejected
- instantiated member typing and the current simple generic method inference slice are real at compile time
- runtime lowering still erases generic owners/storage to the selected raw/native shape
- collection-wide generic closure is now also locked through the later collection tasks rather than remaining only planned

### Lambdas, Method References, Ternary, Bitwise/Shift

Current truth:

- these are not part of the current real language baseline
- they remain F1 work, not shipped support

## Not In F1 Baseline Today

These are explicitly not part of the current truthful baseline and should not be implied:

- full Java reflection/invocation
- desktop UI families (`awt`, `swing`)
- Java-close concurrency/threading runtime
- `Optional` utility baseline
- Java-close networking baseline
- external native binding surface

## Stale Or Incorrect Older Docs Found During Audit

These older docs are not safe source-of-truth pages for current behavior:

- `docs/LANGUAGE_GUIDE.md`
- `docs/LANGUAGE_OVERVIEW.md`

Reasons:

- they still contain stale statements about unsupported/runtime-missing areas
- they reference no-longer-accurate feature assumptions such as `async`
- they should be treated as refresh targets under F2, not canonical truth

## Operational F1 Starting Point

F1 should proceed from these audit truths:

1. Aden Lang already has a real executable language/toolchain baseline.
2. A meaningful Java-like OOP/core-control-flow surface is already real.
3. Several Java-looking features are only reserved/fenced and must not be treated as “already partially done”.
4. The stdlib exists, but much of it is still narrow and non-generic.
5. F1’s job is language completion plus honest support-policy locking, not just adding syntax.

## Immediate Follow-On Tasks Unblocked By This Audit

- `F1-01` inventory full Java-close syntax target against current support
- `F1-02` publish required/deferred/Aden-specific support policy
- `F1-03` build the staged dependency graph for frontend/backend/runtime/stdlib/validation work
