# PulseOS Runtime Service ABI Slice (`RB-13`)

This document is the source of truth for `RB-13` on [REBASE_TAKS_BOARD.md](/D:/Programming/codex/PulseCode/docs/REBASE_TAKS_BOARD.md).

It defines the first requested-target PulseOS runtime-service ABI slice for the meeting milestone surface.

PulseOS should now be read here as its own platform target with PulseOS-visible service semantics.

It is intentionally smaller than a full OS ABI and intentionally separate from the retained Windows-backed host bootstrap runtime contract.

## Relationship To `RB-11` And `RB-12`

`RB-11` partitioned:

- portable Pulse/runtime contract
- adapter-specific service glue

`RB-12` then locked the minimum retained Rust-host bootstrap runtime seam needed to keep current executable validation moving.

`RB-13` now defines the requested-target PulseOS service boundary that later adapter work should aim at instead of inheriting Windows host-bootstrap imports or startup naming as defaults.

Source references:

- [RUNTIME_INTRINSICS_PARTITION.md](/D:/Programming/codex/PulseCode/docs/RUNTIME_INTRINSICS_PARTITION.md)
- [HOST_BOOTSTRAP_RUNTIME_CONTRACT.md](/D:/Programming/codex/PulseCode/docs/HOST_BOOTSTRAP_RUNTIME_CONTRACT.md)

## Current Code Source

The current code-owned PulseOS first-slice contract is published in:

- [pulseos_x64/mod.rs](/D:/Programming/codex/PulseCode/crates/pulsec-cli/src/backend/adapters/pulseos_x64/mod.rs)

and emitted into `native.plan.json` through:

- [plan_rendering.rs](/D:/Programming/codex/PulseCode/crates/pulsec-cli/src/backend/analysis/plan_rendering.rs)

Schema id:

- `pulsec.pulseos.runtime_service.v1`

## Contract Status

The current locked status is:

- `target_id = pulseos-x64`
- `contract_status = first-slice-meeting-milestone`
- `implementation_status = contract-defined-not-yet-implemented`

That status is deliberate. This document defines the requested-target contract slice. It does not claim that the full PulseOS adapter, loader, or executable publication path exists yet.

## Meeting Milestone Surface

### 1. Console

Current required console capabilities are:

- `pulseos.console.write_utf8`
- `pulseos.console.write_line_utf8`

The first slice only freezes the capability surface and UTF-8 text expectation. It does not yet freeze device names, console handles, or syscall numbers.

### 2. Panic

Current required panic capability is:

- `pulseos.panic.abort_utf8`

Current panic rule:

- panic is non-returning abort with diagnostic text

This is a termination boundary, not a promise of unwind support.

### 3. Process Exit

Current required process capability is:

- `pulseos.process.exit_i32`

Current exit rule:

- exit code type is `i32`

### 4. Minimal Path/File Seams

Current minimum path and file seams are:

- `pulseos.path.program_dir_utf8`
- `pulseos.file.open_read`
- `pulseos.file.read`
- `pulseos.file.close`

These are intentionally the smallest seams needed to avoid re-hard-coding Windows assumptions while the PulseOS shape is still settling.

They should be read as PulseOS-visible platform seams, not promises that raw Linux substrate APIs are the public PulseOS surface.

Current handle rule:

- file handles remain opaque and reserved, not frozen into a final binary layout

### 5. Minimal Service Seams

Current minimum service-seam capabilities are:

- `pulseos.service.connect`
- `pulseos.service.request`
- `pulseos.service.close`

These name the existence of a service boundary without freezing the final service payload binary layout yet.

## ABI Ground Rules

The first slice now freezes these transport assumptions:

- diagnostic and console text use UTF-8
- exit uses `i32`
- panic is non-returning
- file/service handles are opaque reserved handles, not finalized structure layouts

The `RB-13` service slice itself intentionally does not freeze:

- how those PulseOS-visible capabilities bind onto generic Linux substrate services underneath
- syscall numbers or trap encoding
- startup entry symbol and loader handoff
- artifact publication layout
- path normalization and current-working-directory semantics
- service payload binary layout

The startup and publication pieces are now published separately in [PULSEOS_STARTUP_LOADER_PUBLICATION_CONTRACT.md](/D:/Programming/codex/PulseCode/docs/PULSEOS_STARTUP_LOADER_PUBLICATION_CONTRACT.md), while Linux-substrate binding details, path policy, and service payload binary layout remain later tasks because PulseOS itself is still in flight.

## Plan Surface

When the requested target is `pulseos-x64`, `native.plan.json` now emits:

- `requested_target_runtime_service_abi`

with schema:

- `pulsec.pulseos.runtime_service.v1`

When the requested target is not `pulseos-x64`, that plan field currently emits `null` instead of pretending every target already has the same service contract.

This keeps the requested-target contract explicit without confusing it with the current Windows x64 host/bootstrap adapter contract.

## Consequences For `RB-14` And `RB-16`

- `RB-14` is now published at [RUNTIME_OWNERSHIP_REBASE.md](/D:/Programming/codex/PulseCode/docs/RUNTIME_OWNERSHIP_REBASE.md) and uses this published service boundary to move ownership cleanly between Pulse stdlib/runtime code, Rust bootstrap code, and adapter-owned loader/syscall glue.
- `RB-15` is now published at [TARGET_ARTIFACT_CONTRACT_SPLIT.md](/D:/Programming/codex/PulseCode/docs/TARGET_ARTIFACT_CONTRACT_SPLIT.md) and keeps the PulseOS artifact story explicit without pretending startup/loader work is done.
- `RB-16` is now published at [PULSEOS_STARTUP_LOADER_PUBLICATION_CONTRACT.md](/D:/Programming/codex/PulseCode/docs/PULSEOS_STARTUP_LOADER_PUBLICATION_CONTRACT.md) and defines the first PulseOS startup entry and loader/publication contract on top of this service slice and the published artifact split instead of inventing a different runtime boundary later.
