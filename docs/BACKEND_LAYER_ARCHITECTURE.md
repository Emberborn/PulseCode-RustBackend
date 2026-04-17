# Backend Layer Architecture

This document is the source of truth for `RB-07` on [REBASE_TAKS_BOARD.md](/D:/Programming/codex/PulseCode/docs/REBASE_TAKS_BOARD.md).

It locks the current backend into explicit architectural layers that `RB-08` now uses through the published adapter registry seam.

## Purpose

`RB-07` does not claim that PulseCode already has a finished multi-target adapter registry.

It does claim that the backend is no longer owned as one blended Windows-shaped pipeline. The codebase now has explicit layer ownership for:

- target-neutral compiler output
- Rust-host bootstrap orchestration
- target-specific adapters

## Layer Ownership

| Layer | Owned module | Current implementation shards | Owns | Does not own |
|---|---|---|---|---|
| Target-neutral compiler output | `crates/pulsec-cli/src/backend/target_neutral/mod.rs` | `backend/analysis/plan_rendering.rs`, `backend/analysis/resolution_state.rs` | native-plan rendering, backend planning metadata, backend resolution caches/state | MASM/COFF emission, toolchain discovery, Windows linking |
| Rust-host bootstrap layer | `crates/pulsec-cli/src/backend/host_bootstrap/mod.rs` | `backend/analysis/analysis_support.rs` | `RustHostBootstrapBackend`, artifact orchestration, frame-budget enforcement, handoff from plan layer to active adapter, minimum retained bootstrap runtime contract | target-specific code generation details, Windows toolchain policy |
| Target-specific adapters | `crates/pulsec-cli/src/backend/adapters/mod.rs` | `backend/emission/*`, `backend/support/*` | target-specific emission, link/toolchain behavior, adapter-specific artifact/runtime metadata | target-neutral planning ownership, CLI/manifest target taxonomy |

## Current Adapter State

The only implemented target-specific adapter at `RB-07` is:

- `crates/pulsec-cli/src/backend/adapters/windows_x64/mod.rs`

That adapter currently owns:

- MASM code emission
- COFF object assumptions
- `ml64` / `link.exe` discovery and invocation
- Windows bootstrap artifact family and runtime ABI metadata

PulseOS, Linux, and macOS remain target lanes in the public taxonomy and emitted plan metadata, but they do not yet have implemented adapters underneath them. That is why `RB-06` truthfully emits requested-target metadata separately from the active Windows x64 host-bootstrap adapter metadata.

Future adapter layering should leave room for:

- a `pulseos-x64` adapter family
- a generic `linux-x64` adapter family
- a `macos-arm64` adapter family

Current Windows work must preserve those seams instead of folding more policy back into the Windows adapter.

## Important Boundary Rule

After `RB-07`, the old directories:

- `backend/analysis`
- `backend/emission`
- `backend/support`

should be treated as implementation shards, not the architectural ownership model.

The architectural ownership model is now:

- `backend/target_neutral`
- `backend/host_bootstrap`
- `backend/adapters`

## Relationship To The Next Tasks

- `RB-08` has now published [BACKEND_ADAPTER_REGISTRY.md](/D:/Programming/codex/PulseCode/docs/BACKEND_ADAPTER_REGISTRY.md) as the explicit adapter seam built on top of this layer split.
- `RB-09` has now published [WINDOWS_X64_ADAPTER_SCOPE.md](/D:/Programming/codex/PulseCode/docs/WINDOWS_X64_ADAPTER_SCOPE.md) to scope the retained Windows x64 adapter honestly as the current host/bootstrap lane and immediate real target.
- `RB-10` will continue removing Windows-only assumptions from the target-neutral planning layer.
- `RB-12` now publishes [HOST_BOOTSTRAP_RUNTIME_CONTRACT.md](/D:/Programming/codex/PulseCode/docs/HOST_BOOTSTRAP_RUNTIME_CONTRACT.md) to define what the Rust-host bootstrap layer still owns after the portable-vs-adapter runtime split.
- `RB-14` now publishes [RUNTIME_OWNERSHIP_REBASE.md](/D:/Programming/codex/PulseCode/docs/RUNTIME_OWNERSHIP_REBASE.md) to define what belongs to Pulse code, what still remains in the retained Rust host-bootstrap runtime, and what must stay adapter-owned.

## Locked Result For `RB-07`

`RB-07` is satisfied when all of the following are true:

- this document exists and names the three backend layers explicitly
- the backend code tree contains matching layer modules for target-neutral output, Rust-host bootstrap, and target-specific adapters
- the CLI/backend entrypoint uses the host-bootstrap layer explicitly instead of the old misleading `NoopNativeBackend` naming
- the Windows x64 adapter is named as an adapter layer, not as the whole backend architecture
