# Backend Adapter Registry

This document is the source of truth for `RB-08` on [REBASE_TAKS_BOARD.md](/D:/Programming/codex/Aden Lang/docs/REBASE_TAKS_BOARD.md).

`RB-08` hardens the adapter boundary from the `RB-07` layer split into one explicit registry seam. Target-specific emission, linking, runtime ABI metadata, and host-bootstrap fallback decisions must now flow through that seam instead of scattered helper imports.

## Purpose

The adapter registry exists so Aden Lang can keep Windows x64 usable as the current host/bootstrap lane without letting Windows-specific backend details leak back into target-neutral planning or future AdenOS, Linux, and macOS adapter work.

The registry is the code-level boundary between:

- target-neutral backend planning and plan metadata
- Rust-host bootstrap orchestration
- target-specific adapter implementations

## Registry Surface

The registry lives at:

- `crates/adenc-cli/src/backend/adapters/mod.rs`

The current explicit seam is:

- `TargetAdapter`
- `resolve_host_bootstrap_target_adapter(...)`
- `resolve_active_backend_contract(...)`
- `resolve_plan_target_adapter_metadata(...)`

`TargetAdapter` is the only adapter-facing trait that host bootstrap and target-neutral plan rendering should use for target-specific behavior.

## Current Ownership

The registry owns selection of:

- active host/bootstrap adapter
- active backend contract
- adapter-specific artifact family metadata
- adapter-specific runtime ABI metadata
- adapter-specific emission and link operations

The registry does not own:

- CLI/manifest target taxonomy
- target-neutral plan rendering structure
- language/frontend semantics

## Current Implemented Adapter

The only implemented adapter at `RB-08` is:

- `crates/adenc-cli/src/backend/adapters/windows_x64/mod.rs`

That adapter currently owns:

- MASM emission entrypoints
- COFF object assumptions
- Windows toolchain discovery and link invocation
- Windows bootstrap artifact/runtime ABI families
- native failure-report writing for the current host/bootstrap lane

## Current Resolution Truth

Current registry behavior is intentionally honest:

- `windows-x64` resolves to the Windows x64 adapter directly
- `adenos-x64` currently resolves through the same host/bootstrap adapter seam while still preserving AdenOS as the requested public target in plan metadata
- `linux-x64` currently resolves through the same host/bootstrap adapter seam while still preserving generic Linux as the requested public target in plan metadata
- `macos-arm64` currently resolves through the same host/bootstrap adapter seam while still preserving macOS Apple Silicon as the requested public target in plan metadata

This means the registry already supports multi-target selection at the public surface, but only one concrete adapter is implemented underneath it today.

## Required Boundary Rule

After `RB-08`, new code must not bypass the registry by importing target-specific Windows emission, linking, or runtime metadata helpers directly from:

- `backend/host_bootstrap`
- `backend/target_neutral`

Those layers should talk to target-specific behavior only through the adapter registry seam.

## Current Call Paths

At `RB-08`, the seam is real in two critical places:

- `crates/adenc-cli/src/backend/host_bootstrap/mod.rs`
  - `RustHostBootstrapBackend` resolves the active adapter and uses trait calls for emission, failure reporting, and linking
- `crates/adenc-cli/src/backend/analysis/plan_rendering.rs`
  - target contract resolution and `target_adapter` plan metadata now resolve through registry helpers instead of hard-wiring the Windows contract path

## Relationship To The Next Tasks

- `RB-09` has now published [WINDOWS_X64_ADAPTER_SCOPE.md](/D:/Programming/codex/Aden Lang/docs/WINDOWS_X64_ADAPTER_SCOPE.md) to scope the retained Windows x64 adapter honestly as the immediate target and current host/bootstrap lane
- `RB-10` has now published [TARGET_NEUTRAL_PLANNING_BOUNDARY.md](/D:/Programming/codex/Aden Lang/docs/TARGET_NEUTRAL_PLANNING_BOUNDARY.md) so target-neutral planning resolves adapter-owned defaults through this seam instead of hard-coding Windows assumptions
- `RB-13` and later adapter work should add new target implementations under this registry instead of widening the Windows adapter's ownership
- future AdenOS, Linux, and macOS work should land as their own adapters under this registry instead of leaking target-specific assumptions into target-neutral or Windows bootstrap layers

## Locked Result For `RB-08`

`RB-08` is satisfied when all of the following are true:

- this document exists and names the adapter registry seam explicitly
- `backend/host_bootstrap` no longer imports Windows adapter helper functions directly for emission/link/runtime decisions
- target-neutral plan rendering resolves active backend contract and adapter metadata through registry helpers
- current Windows x64 adapter behavior remains reachable through the registry without collapsing the layer split from `RB-07`
