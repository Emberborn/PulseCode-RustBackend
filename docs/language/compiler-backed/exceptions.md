# Exceptions

This page documents the current compiler-backed exception-flow surface.

## Current F1 Exception Model

The current shipped compiler-backed exception model is now split into two honest layers:

- `throw <expr>;` is supported
- `try` / `catch` / `finally` are supported to the current F1-16 structured-region baseline
- method and constructor `throws` clauses are supported
- checked versus unchecked exception typing is enforced during semantic analysis
- `try (<resource>; ...) { ... }` is not supported in the current F1 baseline
- the thrown expression must typecheck as `aden.lang.Throwable` or a subtype
- obvious null throw operands are rejected in semantic analysis for the current F1 baseline

This means Aden now has a real compile-time exception contract plus a real runtime transfer model for Aden-thrown throwable values, even though throwable/detail hardening is still not fully complete.

## Current Throwable Detail Surface

The current `F1-46` throwable hierarchy now provides a Java-close stdlib baseline for:

- detail messages
- cause chaining
- Java-like type-plus-message `toString()` formatting
- `getMessage()`
- `getCause()`
- `initCause(...)`

Current constructor baseline:

- `new Throwable()`
- `new Throwable(String message)`
- `new Throwable(String message, Throwable cause)`
- later cause attachment through `initCause(...)`

The same constructor shape now exists on the shipped `Exception`, `RuntimeException`, and current runtime exception subclasses.

Current formatting model:

- `new Exception().toString()` -> `Exception`
- `new Exception("boom").toString()` -> `Exception: boom`
- uncaught throwable output now includes `Caused by: ...` lines for chained causes

This means throwable detail chaining is now owned by stdlib classes instead of being only an implicit runtime-side convention.

## Checked Vs Unchecked

Current checked-exception rule:

- a throwable is treated as checked if it is a subtype of `aden.lang.Exception`
- subtypes of `aden.lang.RuntimeException` are unchecked

Current semantic enforcement:

- direct `throw` of a checked exception must be caught or declared
- method calls and constructor calls propagate their declared checked exceptions
- checked exceptions escaping a method or constructor must appear in that declaration's `throws` clause
- `try` / `catch` removes checked exceptions that are handled by matching catch clauses
- overriding methods and interface implementations cannot widen checked throws beyond the parent/interface contract

## `throw`

Current `throw` behavior:

- parses as a real statement
- requires a throwable value, not an arbitrary object or primitive
- counts as terminating control flow for return analysis
- participates in checked-exception analysis when the thrown type is checked
- lowers as a real exception transfer in IR/backend/runtime

The current runtime-backed behavior is therefore:

- transfer control to the nearest active Aden exception handler when one exists
- otherwise fall back through the throwable's stdlib `panic()` bridge and terminate through the runtime panic boundary

That is the current shipped F1 exception contract for Aden `throw` values.

## `throws`

Current `throws` behavior:

- methods and constructors can declare `throws TypeA, TypeB`
- each declared type must resolve to `Throwable` or a subtype
- declared checked exceptions satisfy the current compile-time propagation contract
- the declaration now matches recoverable Aden-throw propagation across method boundaries in the shipped runtime model

## Not In This Model Yet

The following remain outside the shipped exception baseline:

- try-with-resources
- Java-style `throw null` behavior

The remaining exception/runtime tasks are now:

- `F1-17`

`F1-29` is now locked: it has the checked/unchecked declaration model, the matching runtime Aden-throw propagation, the stdlib throwable-detail baseline, and the Java-equivalent-or-better diagnostic/source-location hardening required for the shipped F1 exception model.

## Java-equivalent-or-better stack trace surface

The current uncaught Aden-throw diagnostics now include source-aware stack frames in the shipped runtime model:

- uncaught stack frames are printed as `Class.method(File.aden:line)`
- caller frames preserve the active call-site line
- internal fallback helpers such as `Throwable.panic()` are hidden from the user-facing stack trace

## `try` / `catch` / `finally`

Current `F1-16` behavior:

- `try { ... } catch (Type name) { ... }`
- `try { ... } finally { ... }`
- `try { ... } catch (...) { ... } finally { ... }`
- catch parameter types must be `Throwable` or subtypes

Current execution boundary:

- explicit Aden `throw` values can be routed into matching `catch` blocks across method boundaries
- `finally` runs for normal completion and for propagated Aden-throw paths, including callee-to-caller transfer
- uncaught Aden throws continue through active `finally` blocks and then fail fast

Current intentional fences:

- runtime panics from callees are not catchable by this baseline; only Aden `throw` values participate in the structured exception model
- `return`, `break`, and `continue` inside `try` / `catch` / `finally` are fenced for now
- Java-style `throw null` behavior is fenced for now

This means the shipped F1 exception model now has real compile-time declaration/catch checking plus real cross-method runtime transfer for Aden-thrown throwable values. The remaining work is throwable-detail and diagnostic hardening, not basic propagation.

## `try-with-resources`

Current `F1-17` shipped baseline:

- declaration-form resource statements are supported: `try (T resource = expr; U other = expr2) { ... }`
- each declared resource must typecheck as assignable to `aden.lang.AutoCloseable`
- resources close in reverse declaration order
- if a later resource initializer throws, already-open earlier resources still close before the exception continues through the enclosing `catch` / `finally` flow
- resource variables currently follow the declared-resource statement form; later Java-shape work can still return for effectively-final external resource operands if that surface is selected

Current intentional boundary:

- the shipped form is the declaration-style resource list, not the later Java form that can reuse effectively-final external locals
- the current runtime model does not claim full Java suppressed-exception parity
- the lifecycle/ownership contract beneath the syntax is the explicit F1 model locked through `AutoCloseable`, stream close state, and `ResourceScope`

## Related

- [Runtime-backed exceptions and failure](../runtime-backed/exceptions-and-failure.md)
- [F1 task board](../../F1_TASK_BOARD.md)
