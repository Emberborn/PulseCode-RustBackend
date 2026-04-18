# Milestone 1 Semantics Freeze (+ C1.5 Addendum)

## Status
Frozen on March 9, 2026 for backend handoff stability.
Updated on March 10, 2026 with C1.5 M2 hardening lock (boxing/wrapper/nullability/conversion rules).

## Goal
This freeze defines the semantic contract that backend/IR work can rely on without ongoing frontend churn.

## Language Contract (Frozen)
- Package declaration is required (`package x.y;`).
- Class-based OOP model with fields, methods, and constructors.
- Modifiers supported: `public`, `private`, `protected`, `static`, `async`.
- Primitive/value types: `byte`, `short`, `int`, `long`, `float`, `double`, `char`, `boolean`, `void`.
- Unsigned extensions: `ubyte`, `ushort`, `uint`, `ulong`.
- `String` is class-based (`com.aden.lang.String`) and implicitly available via prelude resolution.
- Statements: local declarations, assignment/compound assignment, return, expression statements, `if/else`, `while`, `do-while`, `for`, `switch/case/default`, `break`, `continue`.
- Expressions: literals, names, `this`, member access, calls, unary (`!`, `-`), binary arithmetic/comparison/logical, prefix/postfix `++/--`, `null`.

## Entrypoint Contract (Frozen)
Exactly one entry method must exist:
- `public static void main()`
- or `public static void main(String[] args)`

## Type and Flow Contract (Frozen)
- Declaration types are canonicalized to package-qualified class identity.
- Assignment and return type checks are strict.
- Overload and constructor resolution is deterministic by match precedence:
  1. exact type match
  2. boxing/unboxing match
  3. broader assignable class match
  Ambiguous best matches are rejected with explicit diagnostics.
- `if/while/for/do-while` conditions must be `boolean`.
- Definite return is enforced for non-`void` methods.
- `null` is valid for reference types only.
- Null-flow narrowing in conditionals is supported for `x == null` / `x != null`.
- Definite null dereference diagnostics are enforced.
- Boxing/unboxing lock:
  - Primitive <-> wrapper pairing is supported at assignment/call/return boundaries for direct pairs (`int` <-> `Integer`, etc.).
  - Definite-null wrapper -> primitive unboxing is rejected at assignment/call/return boundaries.
  - Non-null narrowed branches allow safe unboxing.
- Numeric conversion lock:
  - Implicit primitive numeric cross-conversions are rejected (`signed->unsigned`, `unsigned->signed`, widening/narrowing).
  - Explicit numeric cast syntax is implemented and required for cross-primitive conversion paths.
  - Source-of-truth matrix: `docs/NUMERIC_CONVERSION_MATRIX.md`.

## Visibility Contract (Frozen)
- `public`: everywhere.
- `private`: same class only.
- `protected`: currently package-visible until inheritance is implemented.
- package-private (no modifier): same package only.

## Module and Import Contract (Frozen)
- Multi-file `adenc check` resolves imports from disk with cycle detection.
- Same-package class auto-loading under source root is supported.
- Cross-package class usage requires import.
- Duplicate import and ambiguous import diagnostics are enforced.
- Class resolution precedence is frozen as:
  1. Same package
  2. Explicit class imports
  3. Wildcard imports
  4. `com.aden` prelude class fallback

## Standard Library Baseline (Frozen)
Standard library namespace is `com.aden`.

Baseline packages/classes:
- `com.aden.lang.System`
- `com.aden.lang.IO`
- `com.aden.lang.PrintStream`
- `com.aden.lang.ConsoleWriter`
- `com.aden.lang.Object`
- `com.aden.lang.Class`
- `com.aden.lang.Comparable`
- `com.aden.lang.Iterable`
- `com.aden.lang.Iterator`
- `com.aden.lang.StringBuilder`
- `com.aden.lang.String`
- `com.aden.lang.Strings`
- wrappers: `Byte`, `Short`, `Integer`, `Long`, `Float`, `Double`, `Char`, `Boolean`, `UByte`, `UShort`, `UInteger`, `ULong`, `Void`
- `com.aden.io.Console`
- `com.aden.io.File`
- `com.aden.math.Math`
- `com.aden.collections.Array`
- `com.aden.collections.List`
- `com.aden.collections.Map`
- `com.aden.rt.Intrinsics`

Import rules:
- `com.aden` imports are validated against known baseline packages/classes.
- Too-broad imports like `import com;` / `import com.aden;` are rejected.
- Unknown `com.aden.*` imports are rejected.
- Static imports from known `com.aden` classes are supported.

Wrapper runtime API lock:
- Wrapper class APIs include `valueOf`, `parse`, primitive extractors, `equals`, and `compare`.
- Runtime intrinsics include parse surface used by wrappers:
  - `Intrinsics.parseInt(String) -> int`
  - `Intrinsics.parseBoolean(String) -> boolean`
- Failure behavior for invalid parse is deterministic panic + non-zero process exit in executable fixtures.

## Out of Scope for M1 Freeze
- Inheritance, interfaces, enums, generics, annotations.
- Exceptions (`try/catch/finally`, `throw`).
- Lambdas and ternary operator.
- Backend codegen/runtime/GC/exe/msi output.

## Test Gate (Frozen)
M1 is considered complete only if all are green:
- `adenc-core` semantic/unit tests.
- `adenc` CLI tests.
- Integration multi-file tests.
- Real fixture projects under `crates/adenc-cli/tests/fixtures`.

