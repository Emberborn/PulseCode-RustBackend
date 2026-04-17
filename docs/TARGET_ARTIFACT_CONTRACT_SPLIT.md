# Target Artifact Contract Split (`RB-15`)

This document is the source of truth for `RB-15` on [REBASE_TAKS_BOARD.md](/D:/Programming/codex/PulseCode/docs/REBASE_TAKS_BOARD.md).

It separates the retained Windows x64 adapter artifact contract from the requested-target PulseOS artifact contract.

PulseOS should now be read here as its own platform artifact lane.

The formerly deferred PulseOS startup entry, loader handoff, and publication layout are now published separately in [PULSEOS_STARTUP_LOADER_PUBLICATION_CONTRACT.md](/D:/Programming/codex/PulseCode/docs/PULSEOS_STARTUP_LOADER_PUBLICATION_CONTRACT.md).

## Relationship To Earlier Rebase Contracts

`RB-06` made the active artifact family explicit in plan metadata.

`RB-13` published the requested-target PulseOS runtime-service slice.

`RB-14` published the three-way ownership split and locked artifact/publication shape as adapter-owned.

`RB-15` now answers the narrower artifact question:

- what is the current Windows x64 artifact contract?
- what is the current requested-target PulseOS artifact contract?
- how are they different in plan truth today?

Source references:

- [PULSEOS_RUNTIME_SERVICE_ABI_SLICE.md](/D:/Programming/codex/PulseCode/docs/PULSEOS_RUNTIME_SERVICE_ABI_SLICE.md)
- [RUNTIME_OWNERSHIP_REBASE.md](/D:/Programming/codex/PulseCode/docs/RUNTIME_OWNERSHIP_REBASE.md)

## Current Code Source

The current code-owned artifact split is resolved through:

- [adapters/mod.rs](/D:/Programming/codex/PulseCode/crates/pulsec-cli/src/backend/adapters/mod.rs)
- [windows_x64/mod.rs](/D:/Programming/codex/PulseCode/crates/pulsec-cli/src/backend/adapters/windows_x64/mod.rs)
- [pulseos_x64/mod.rs](/D:/Programming/codex/PulseCode/crates/pulsec-cli/src/backend/adapters/pulseos_x64/mod.rs)

and emitted into `native.plan.json` through:

- [plan_rendering.rs](/D:/Programming/codex/PulseCode/crates/pulsec-cli/src/backend/analysis/plan_rendering.rs)

Current plan block:

- `artifact_contracts`

## Windows x64 Adapter Artifact Contract

Schema id:

- `pulsec.windows_x64.artifact_contract.v1`

Current truth:

- status: `current-host-bootstrap-artifact-contract`
- implementation: `implemented`
- target: `windows-x64`

### Fat Mode

Current Windows x64 fat contract is:

- artifact family: `windows-pe-coff-fat-executable`
- executable artifact kind: `pe-coff-exe`
- runtime packaging: `embedded-runtime-payload`
- publication shape: `single-profile-root-executable`
- companion artifacts: none

### Shared Mode

Current Windows x64 shared contract is:

- artifact family: `windows-pe-coff-shared-runtime`
- executable artifact kind: `pe-coff-exe-plus-shared-runtime`
- runtime packaging: `peer-runtime-library`
- publication shape: `profile-bin-lib-layout`
- companion artifacts:
  - `runtime_library`
  - `runtime_import_library`
  - `runtime_lookup_metadata`

Naming policy:

- `<entry>.exe + pulsecore-<pulsec-semver>.dll/.lib + launch.txt`

This is the retained active adapter contract and the current host/bootstrap publication truth.

## PulseOS Requested-Target Artifact Contract

Schema id:

- `pulsec.pulseos.artifact_contract.v1`

Current truth:

- status: `first-slice-artifact-contract`
- implementation: `contract-defined-not-yet-implemented`
- target: `pulseos-x64`

Current first-slice artifact contract is intentionally narrower:

- artifact family: `pulseos-program-image-contract`
- fat executable artifact kind: `pulseos-program-image`
- fat runtime packaging: `single-image-runtime-bootstrap`
- shared runtime packaging: `shared-request-collapses-to-single-image-runtime-bootstrap`
- publication shape: `profile-bin-layout-with-launch-manifest`
- fat requested output mode status: `first-slice-loader-layout-published`
- shared requested output mode status: `shared-request-collapses-to-first-slice-single-image-layout`

Current remaining deferred items include:

- startup context binary layout
- `argv` / `envp` publication policy
- separate shared-runtime publication lane
- debug metadata publication policy

Naming policy:

- `bin/<entry> + bin/launch.json`

This is still deliberate. `RB-15` keeps the artifact family split explicit, while [PULSEOS_STARTUP_LOADER_PUBLICATION_CONTRACT.md](/D:/Programming/codex/PulseCode/docs/PULSEOS_STARTUP_LOADER_PUBLICATION_CONTRACT.md) now carries the startup and loader/publication mechanics that were intentionally deferred here.

This should now also be read as the PulseOS-visible platform artifact contract that may later share lower Linux ELF/publication machinery with `linux-x64` where honest.

## What `artifact_contracts` Means In The Plan

`native.plan.json` now emits:

- `artifact_contracts.active_adapter`
- `artifact_contracts.requested_target`

Current truthful behavior:

- when the requested target is `windows-x64`, both sides name the same Windows x64 artifact contract
- when the requested target is `pulseos-x64`, the active adapter side still names the retained Windows x64 artifact contract, while the requested-target side names the PulseOS first-slice artifact contract
- when the requested target has no published artifact contract yet, the requested-target side may emit `null`

This is what prevents one native publication story from silently standing in for every target lane.

## Explicit Non-Goals

`RB-15` itself does not freeze:

- PulseOS startup entry symbol
- PulseOS loader handoff details
- PulseOS final publication directory layout
- PulseOS runtime lookup metadata format

Those are now published separately in [PULSEOS_STARTUP_LOADER_PUBLICATION_CONTRACT.md](/D:/Programming/codex/PulseCode/docs/PULSEOS_STARTUP_LOADER_PUBLICATION_CONTRACT.md).

## Consequences For `RB-16`

- `RB-16` is now published at [PULSEOS_STARTUP_LOADER_PUBLICATION_CONTRACT.md](/D:/Programming/codex/PulseCode/docs/PULSEOS_STARTUP_LOADER_PUBLICATION_CONTRACT.md) and defines PulseOS startup, loader expectations, and publication layout on top of the requested-target artifact contract published here.
- `RB-19` should keep Windows productization policy separate from this retained Windows x64 adapter artifact contract.
