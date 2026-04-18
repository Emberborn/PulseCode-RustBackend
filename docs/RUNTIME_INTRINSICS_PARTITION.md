# Runtime Intrinsics Partition (`RB-11`)

This document is the source of truth for `RB-11` on [REBASE_TAKS_BOARD.md](/D:/Programming/codex/Aden Lang/docs/REBASE_TAKS_BOARD.md).

It partitions the current runtime surface into:

- portable language/runtime contract
- adapter-specific service glue

This is a partitioning task, not the full bootstrap-runtime contract and not the first AdenOS service ABI. Those land under `RB-12` and `RB-13`.

## Consumed Inventory Rows

`RB-11` consumes these runtime rows from the published rebase audit:

- `WIN-RT-01`
- `WIN-RT-02`
- `WIN-RT-03`
- `WIN-RT-05`

`WIN-RT-04` is only partially touched here. Startup entry, loader lifecycle, and target publication details remain follow-on work for `RB-13`, `RB-15`, and `RB-16`.

## Portable Contract

The following are now treated as portable Aden/runtime contract surfaces rather than Windows-specific truth:

- stdlib/language-facing runtime methods under `com.aden.rt.Intrinsics.*`
- runtime-backed ownership helpers under `com.aden.memory.Memory.*`
- stdlib-owned runtime-backed `System` methods:
  - `System.currentTimeMillis()`
  - `System.nanoTime()`
  - `System.exit(int)`
- backend-private runtime procedures used to implement language/runtime behavior:
  - `adenc_rt_throw`
  - `adenc_rt_traceUpdateTop`

Portable means:

- the symbol or method name is part of the language/runtime contract
- semantics are described independently from any one OS import surface
- later adapters may implement the same contract with different syscall, CRT, or loader mechanisms

Current portable proof surface:

- [RUNTIME_INTRINSICS_ABI.md](/D:/Programming/codex/Aden Lang/docs/RUNTIME_INTRINSICS_ABI.md) now describes the portable contract first and treats Windows x64 ABI details as adapter notes
- `windows_x64_backend_contract().runtime_symbols` remains limited to Aden/runtime bridge symbols rather than raw OS import names

## Adapter-Specific Service Glue

The following are not portable runtime ABI truth. They are current Windows x64 host/bootstrap adapter service glue:

- `GetStdHandle`
- `WriteFile`
- `ExitProcess`
- `GetProcessHeap`
- `HeapAlloc`
- `HeapFree`
- `GetSystemTimeAsFileTime`

Current ownership rule:

- direct OS/service imports belong to the target adapter layer
- they must not be treated as part of the public Aden intrinsic ABI
- the active Windows x64 inventory is tracked separately in `windows_x64_runtime_service_imports()` at [windows_x64/mod.rs](/D:/Programming/codex/Aden Lang/crates/adenc-cli/src/backend/adapters/windows_x64/mod.rs)

Current embedded Windows x64 glue still includes:

- console output backed by `GetStdHandle` + `WriteFile`
- fatal exit backed by `ExitProcess`
- heap-backed allocation/reclamation backed by `GetProcessHeap` + `HeapAlloc` / `HeapFree`
- wall-clock time backed by `GetSystemTimeAsFileTime`

Those implementation details remain real for the retained Windows x64 adapter lane, but they are no longer the portable runtime contract.

## Deliberate Deferrals

`RB-11` does not yet freeze:

- the minimum Rust-host bootstrap runtime/service contract
- the first AdenOS runtime-service ABI slice
- startup entry naming and loader lifecycle as a cross-target contract
- final ownership movement between Aden stdlib/runtime code, Rust bootstrap code, and adapter-owned syscall/loader glue

Those belong to:

- `RB-12`
- `RB-13`
- `RB-14`
- `RB-15`
- `RB-16`

`RB-12` is now published at:

- [HOST_BOOTSTRAP_RUNTIME_CONTRACT.md](/D:/Programming/codex/Aden Lang/docs/HOST_BOOTSTRAP_RUNTIME_CONTRACT.md)

`RB-13` is now published at:

- [PULSEOS_RUNTIME_SERVICE_ABI_SLICE.md](/D:/Programming/codex/Aden Lang/docs/PULSEOS_RUNTIME_SERVICE_ABI_SLICE.md)

`RB-14` is now published at:

- [RUNTIME_OWNERSHIP_REBASE.md](/D:/Programming/codex/Aden Lang/docs/RUNTIME_OWNERSHIP_REBASE.md)

## Consequences For Follow-On Work

- `RB-12` should define the smallest retained bootstrap runtime/service seam needed to keep Windows x64 execution and compiler validation moving.
- `RB-13` now defines the first honest AdenOS runtime-service contract without inheriting Windows imports as the default shape.
- `RB-14` now moves ownership boundaries based on this split instead of leaving stdlib/runtime/adapter logic blended together.
