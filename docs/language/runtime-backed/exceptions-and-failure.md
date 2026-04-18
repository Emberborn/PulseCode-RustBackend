# Exceptions And Failure

This page documents the current runtime-backed failure model.

## Current State

Aden has throwable/runtime-exception class surfaces in the stdlib, but the full exception execution model remains part of the active language-completion roadmap.

This means the docs must distinguish:

- throwable and exception type availability
- runtime failure behavior that already exists
- the not-yet-final exception-flow model

## Runtime Failure Today

Current runtime-backed failures include:

- panic-style runtime termination paths
- null-related failures
- bounds and invalid-state failures where runtime checks are emitted
- uncaught throwable values that terminate through the throwable panic path

## Current `throw` Runtime Contract

`throw` is now implemented to the current shipped F1 exception runtime model.

Current behavior:

- the thrown value must typecheck as `Throwable` or a subtype
- lowering transfers through the runtime exception-handler stack for Aden `throw` values
- uncaught throwables still fall back through the stdlib-facing `Throwable.panic()` bridge
- that bridge currently terminates through `Intrinsics.panic(String)`

This is now a real cross-method throwable transfer model for Aden `throw` values, while broader throwable/detail work remains later.

## Current Throwable Detail Output

The runtime-backed uncaught throwable boundary now uses the stdlib throwable hierarchy for the primary failure text:

- uncaught throwable text comes from `Throwable.panic()`
- `Throwable.panic()` now renders `toString()` plus chained `Caused by: ...` entries
- stack traces are printed after that throwable text

Current uncaught shape therefore looks like:

```text
Exception: outer
Caused by: RuntimeException: inner
Stack trace:
  at app.core.Main.main(Main.aden:16)
```

This means throwable message/cause/toString behavior is now primarily stdlib-owned. The remaining runtime-side diagnostics gap is richer source-location detail, not basic cause-chain text.

## Current `try` / `catch` / `finally` Runtime Contract

The current `F1-35` runtime contract adds structured exception regions with a real runtime handler-frame model:

- explicit Aden `throw` values propagate across method boundaries through runtime-installed handler frames
- matching `catch` blocks can now observe those propagated throws in caller methods
- `finally` executes on normal completion and on propagated Aden-throw paths
- uncaught structured throws still run active `finally` blocks and then terminate through the throwable panic path

Important boundary:

- this runtime model is for Aden `throw` values, not for every runtime panic
- a callee that terminates directly through the runtime panic path is still not catchable by the caller in the current baseline
- control-transfer cases that remain fenced (`return`, `break`, `continue` inside protected try regions) still belong to later work

## Roadmap Boundary

The Phase F work still needs to lock:

- the exact exception execution strategy
- catch/finally behavior
- the supported subset versus later expansion

Compiler-side checked/unchecked propagation rules now exist, and the runtime boundary is now strong enough for cross-method Aden-throw propagation, but still narrower than full Java throwable diagnostics:

- `throws` clauses are compile-time contracts today
- checked exceptions from calls/constructors are enforced by semantic analysis
- uncaught checked exceptions still terminate through the current fail-fast runtime path once control reaches the uncaught boundary
- current stack traces now include source file and line data for uncaught Aden-throw flows
- caller frames preserve the active call-site line instead of only the callee method name
- internal fallback helpers like `Throwable.panic()` do not leak into user-facing traces

The truthful boundary after `F1-101` is therefore:

- Aden `throw` values propagate and can be caught across method boundaries
- uncaught throwable values still terminate fail-fast
- uncaught throwable output now includes stdlib-owned cause-chain text
- runtime panic paths are still distinct from structured throwable propagation
- Current stack traces now include source file and line data
- stack traces now capture the cross-method frame chain with `Class.method(File.aden:line)` formatting for the shipped F1 throw model

## Related

- [Object Lifetime And GC](./object-lifetime-and-gc.md)
- [Program Entry And Execution](./program-entry-and-execution.md)
