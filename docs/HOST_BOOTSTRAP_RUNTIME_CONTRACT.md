# Host Bootstrap Runtime Contract (`RB-12`)

This document is the source of truth for `RB-12` on [REBASE_TAKS_BOARD.md](/D:/Programming/codex/PulseCode/docs/REBASE_TAKS_BOARD.md).

It defines the minimum retained Rust-host bootstrap runtime contract needed to keep:

- compiler artifact emission
- native plan emission
- executable validation on the current Windows x64 lane

moving during the multi-target rebase.

It does not define the first PulseOS runtime-service ABI. That is `RB-13`.

## Relationship To `RB-11`

`RB-11` partitioned:

- portable Pulse/runtime contract
- adapter-specific service glue

`RB-12` now locks the smaller retained bootstrap runtime seam that still implements part of that portable contract today.

Source partition reference:

- [RUNTIME_INTRINSICS_PARTITION.md](/D:/Programming/codex/PulseCode/docs/RUNTIME_INTRINSICS_PARTITION.md)

## Current Code Source

The current code-owned host bootstrap runtime contract is resolved in:

- [runtime_contract.rs](/D:/Programming/codex/PulseCode/crates/pulsec-cli/src/backend/host_bootstrap/runtime_contract.rs)

and emitted into `native.plan.json` through:

- [plan_rendering.rs](/D:/Programming/codex/PulseCode/crates/pulsec-cli/src/backend/analysis/plan_rendering.rs)

Schema id:

- `pulsec.host_bootstrap.runtime.v1`

## Minimum Retained Bootstrap Surface

The retained bootstrap runtime contract is intentionally organized by portable procedure families rather than by raw OS imports.

### 1. Lifecycle Procedures

These remain required so current startup/bootstrap paths can initialize and tear down runtime-owned state:

- `pulsec_rt_init`
- `pulsec_rt_shutdown`

### 2. Core Runtime Bridge Procedures

These remain required because current app/runtime lowering still depends on them for object identity and string/class bridging:

- `pulsec_rt_stringFromBytes`
- `pulsec_rt_objectNew`
- `pulsec_rt_objectClassId`
- `pulsec_rt_objectClassName`
- `pulsec_rt_objectHashCode`

### 3. Trace And Exception Procedures

These remain required because the current executable proof surface includes tracing and real throw flow:

- `pulsec_rt_tracePush`
- `pulsec_rt_traceUpdateTop`
- `pulsec_rt_tracePop`
- `pulsec_rt_traceDump`
- `pulsec_rt_pushExceptionHandler`
- `pulsec_rt_popExceptionHandler`
- `pulsec_rt_takePendingException`
- `pulsec_rt_throw`

### 4. Portable Stdlib Bridge Procedures

The current host bootstrap runtime also retains the runtime-callable stdlib bridge procedures currently derived from `default_stdlib_symbols()`.

Current retained bridge families are:

- `console-io`
- `string-and-number-text`
- `time-and-process`
- `array-runtime`
- `list-runtime`
- `map-runtime`
- `memory-ownership`
- `math-helpers`

This is still a real retained bootstrap surface, not a hypothetical future contract. Current build and fixture validation continue to rely on these exported procedures.

## Explicit Exclusions

The following do not belong to the host bootstrap runtime contract:

- raw OS/service imports such as `GetStdHandle`, `WriteFile`, `ExitProcess`, `GetProcessHeap`, `HeapAlloc`, `HeapFree`, and `GetSystemTimeAsFileTime`
- startup entry naming such as `mainCRTStartup`
- system library inputs such as `kernel32.lib`
- artifact publication and loader layout decisions

Those remain adapter-owned.

Current adapter-owned service-import inventory is resolved through the adapter seam, not hard-coded as host-bootstrap runtime truth.

## Ownership Rule

Current ownership split after `RB-12`:

- host bootstrap layer owns the minimum retained portable runtime procedure surface above
- target adapter owns OS/service glue underneath that surface

This is intentionally temporary but explicit. The contract exists so later tasks can reduce or move ownership without pretending the current bootstrap layer is smaller than it really is.

## Consequences For `RB-13` And `RB-14`

- `RB-13` now defines the first PulseOS runtime-service ABI without inheriting the Windows adapter's raw imports or startup naming as defaults.
- `RB-14` is now published at [RUNTIME_OWNERSHIP_REBASE.md](/D:/Programming/codex/PulseCode/docs/RUNTIME_OWNERSHIP_REBASE.md) and uses this retained-bootstrap contract to decide what can move into Pulse stdlib/runtime code, what stays in Rust bootstrap for now, and what must stay adapter-owned.
