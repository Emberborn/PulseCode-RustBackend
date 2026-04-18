# Selfhost Package Map

This document defines the initial package map for the Pulse-side compiler and
runtime projects.

It exists so `compiler` and `runtime` grow through real domain packages from
the start instead of drifting into one-off scaffolding or large migration blobs.

Reference rule set:

- [SELFHOST_PORTING_RULES.md](/G:/Programming/Rust/PulseCode/docs/SELFHOST_PORTING_RULES.md)

## Direction

The package map is intentionally:

- small
- domain-oriented
- easy to navigate
- easy to split further later

It is not intended to predict the final full compiler/runtime package tree in
one shot. It is the first honest structure that real subsystem slices should use.

## `compiler`

Root package:

- `compiler.*`

Initial package tree:

- `compiler.entry`
  - program entrypoints
  - high-level stage identity
  - minimal top-level orchestration while the compiler program is still growing
- `compiler.frontend`
  - parser-facing and source-loading-facing compiler frontend slices
  - later split into narrower packages such as parsing/tokenization only if real
    code size requires it
- `compiler.semantics`
  - semantic analysis, resolution, and validation slices
- `compiler.lowering`
  - IR-facing lowering slices
- `compiler.backend`
  - backend planning/emission slices
  - later expected to split into nested domains such as `backend.planning`,
    `backend.emission`, and target-specific emission packages
- `compiler.host`
  - temporary host/provider/bootstrap interaction surfaces needed while Rust
    still exists as retained bootstrap
- `compiler.tests`
  - compiler behavior locks and focused test utilities

Rules for `compiler`:

- do not let `frontend`, `semantics`, `lowering`, or `backend` become mega-packages
- split them further as soon as a slice stops being comfortably readable
- do not mirror Rust mega-files one-to-one

## `runtime`

Root package:

- `runtime.*`

Initial package tree:

- `runtime.entry`
  - runtime program entrypoints
  - stage identity
  - top-level startup wiring
- `runtime.startup`
  - startup/shutdown/bootstrap-runtime flow
- `runtime.memory`
  - ARC, cycle, weak, and explicit ownership/runtime memory support
- `runtime.handles`
  - object/handle/runtime slot/state identity surfaces
- `runtime.strings`
  - string representation, string helpers, and text-runtime support
- `runtime.interop`
  - runtime-facing interop support and foreign-boundary helpers that belong to
    the runtime program rather than the public `pulse.interop.*` API shape
- `runtime.io`
  - runtime-owned file/process/console/service glue that belongs to the runtime
    program
- `runtime.tests`
  - runtime behavior locks and focused test utilities

Rules for `runtime`:

- keep runtime ownership/memory code just as readable as compiler code
- low-level does not justify giant files
- if a subsystem wants more than one responsibility, split the package and class
  shape early

## Migration Rule

When a real subsystem slice moves:

1. choose the narrowest honest package in this map
2. if none fits cleanly, extend the package map first
3. then port the slice

Do not dump code into `entry` just because it is already there.

## Current Baseline

The current scaffolds should already follow this map:

- `compiler.entry.*`
- `runtime.entry.*`
- `compiler.tests.*`
- `runtime.tests.*`

That keeps the first real code moves aligned with the intended long-term shape.
