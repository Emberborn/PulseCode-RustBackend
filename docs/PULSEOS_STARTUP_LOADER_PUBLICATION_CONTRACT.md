# PulseOS Startup, Loader, and Publication Contract (`RB-16`)

This document is the source of truth for `RB-16` on [REBASE_TAKS_BOARD.md](/D:/Programming/codex/PulseCode/docs/REBASE_TAKS_BOARD.md).

It defines the first requested-target PulseOS startup entry, loader expectations, and publication layout contract.

PulseOS should now be read here as its own platform target. This document defines the PulseOS-visible startup/loader/publication contract for that future target lane.

It closes the former `RB-15` deferral where PulseOS artifact contracts were explicit but still left startup/publication shape unresolved.

## Relationship To `RB-13` And `RB-15`

`RB-13` published the first requested-target PulseOS runtime-service capability slice.

`RB-15` then split the Windows x64 and PulseOS artifact lanes so publication truth stopped collapsing into one Windows-only story.

`RB-16` adds the missing startup and loader/publication boundary on top of those earlier contracts.

Source references:

- [PULSEOS_RUNTIME_SERVICE_ABI_SLICE.md](/D:/Programming/codex/PulseCode/docs/PULSEOS_RUNTIME_SERVICE_ABI_SLICE.md)
- [TARGET_ARTIFACT_CONTRACT_SPLIT.md](/D:/Programming/codex/PulseCode/docs/TARGET_ARTIFACT_CONTRACT_SPLIT.md)
- [RUNTIME_OWNERSHIP_REBASE.md](/D:/Programming/codex/PulseCode/docs/RUNTIME_OWNERSHIP_REBASE.md)

## Current Code Source

The current code-owned startup/loader split is resolved through:

- [adapters/mod.rs](/D:/Programming/codex/PulseCode/crates/pulsec-cli/src/backend/adapters/mod.rs)
- [windows_x64/mod.rs](/D:/Programming/codex/PulseCode/crates/pulsec-cli/src/backend/adapters/windows_x64/mod.rs)
- [pulseos_x64/mod.rs](/D:/Programming/codex/PulseCode/crates/pulsec-cli/src/backend/adapters/pulseos_x64/mod.rs)

and emitted into `native.plan.json` through:

- [plan_rendering.rs](/D:/Programming/codex/PulseCode/crates/pulsec-cli/src/backend/analysis/plan_rendering.rs)

Current plan block:

- `startup_loader_contracts`

Schema ids:

- `pulsec.windows_x64.startup_loader_contract.v1`
- `pulsec.pulseos.startup_loader_contract.v1`

## Windows x64 Active Adapter Startup/Loader Contract

The retained Windows x64 active adapter lane is now explicit in the same plan surface.

Current truth:

- status: `current-host-bootstrap-startup-loader-contract`
- implementation: `implemented`
- startup entry symbol: `mainCRTStartup`
- startup entry ABI: `win64-pe-entry`
- loader handoff kind: `pe-loader-direct-entry`
- runtime bootstrap sequence:
  - `mainCRTStartup`
  - `pulsec_rt_init`
  - `app_entry`
  - `pulsec_rt_shutdown`
  - `ExitProcess`

### Fat Mode

Current Windows x64 fat publication truth is:

- publication shape: `single-profile-root-executable`
- published artifacts:
  - `<entry>.exe`
- runtime companion policy: `embedded-runtime-payload`
- loader manifest: none

### Shared Mode

Current Windows x64 shared publication truth is:

- publication shape: `profile-bin-lib-layout`
- published artifacts:
  - `bin/<entry>.exe`
  - `lib/pulsecore-<pulsec-semver>.dll`
  - `lib/pulsecore-<pulsec-semver>.lib`
  - `bin/launch.txt`
- loader manifest schema: `pulsec.shared.launch.v1`
- loader manifest path: `bin/launch.txt`
- runtime companion policy: `peer-runtime-library`

This preserves the current Windows x64 bootstrap lane as a real target without letting it silently define the PulseOS lane.

## PulseOS Requested-Target Startup/Loader Contract

Current requested-target PulseOS first-slice truth is:

- status: `first-slice-startup-loader-contract`
- implementation: `contract-defined-not-yet-implemented`
- startup entry symbol: `pulseos_start`
- startup entry ABI: `pulseos-loader-entry-v1`
- loader handoff kind: `opaque-startup-context-handle`
- runtime bootstrap sequence:
  - `pulseos_start`
  - `pulsec_rt_init`
  - `app_entry`
  - `pulsec_rt_shutdown`
  - `return_i32_exit_code`

The published loader expectations are:

- `map-primary-program-image-before-entry`
- `resolve-pulseos_start-from-primary-image`
- `provide-opaque-startup-context-for-runtime-services`
- `returned-i32-becomes-process-exit-code`
- `read-launch-manifest-from-bin-launch.json`

These expectations intentionally define the adapter seam without freezing final loader bindings, register assignment, or a final startup-block binary layout yet.

## First-Slice Publication Layout

The published first-slice PulseOS layout is now:

- publication shape: `profile-bin-layout-with-launch-manifest`
- published artifacts:
  - `bin/<entry>`
  - `bin/launch.json`
- loader manifest schema: `pulsec.pulseos.launch.v1`
- loader manifest path: `bin/launch.json`

Current naming policy:

- `bin/<entry> + bin/launch.json`

The initial runtime companion policy is intentionally conservative:

- fat requests use `single-image-runtime-bootstrap`
- shared requests currently use `shared-request-collapses-to-single-image-layout`

That means the first requested-target PulseOS shared lane is explicit, but it does not yet claim a second published runtime-library topology. The shared request currently collapses to the same one-image plus launch-manifest publication lane until a later task publishes a real separate runtime companion contract.

## What `startup_loader_contracts` Means In The Plan

`native.plan.json` now emits:

- `startup_loader_contracts.active_adapter`
- `startup_loader_contracts.requested_target`

Current truthful behavior:

- when the requested target is `windows-x64`, both sides name the same Windows x64 startup/loader contract
- when the requested target is `pulseos-x64`, the active adapter side still names the retained Windows x64 startup/loader contract, while the requested-target side names the first-slice PulseOS contract
- when the requested target has no published startup/loader contract yet, the requested-target side may emit `null`

This is what keeps startup and publication truth explicit instead of letting the active Windows bootstrap lane stand in for every target.

## Remaining Deferred Items

The first-slice PulseOS contract still intentionally leaves these items open:

- exact final object/image format and loader binding details
- startup context binary layout
- `argv` / `envp` handoff policy
- separate shared-runtime publication lane
- debug symbol sidecar policy

Those are later adapter-implementation tasks, not excuses to fall back to Windows startup/publication assumptions.

## Consequences For `RB-17`

`RB-17` is now published at [PULSEOS_EXECUTABLE_LOADING_PROOF_TARGET.md](/D:/Programming/codex/PulseCode/docs/PULSEOS_EXECUTABLE_LOADING_PROOF_TARGET.md) and uses this startup/publication contract to define what counts as a PulseOS-targetable executable-loading proof target.

That proof target should assume at least:

- a primary program image published at `bin/<entry>`
- a launch manifest published at `bin/launch.json`
- a startup entry named `pulseos_start`
- an opaque loader handoff that enables the already-published PulseOS runtime-service capability surface
