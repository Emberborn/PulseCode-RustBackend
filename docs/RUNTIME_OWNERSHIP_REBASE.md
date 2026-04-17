# Runtime Ownership Rebase (`RB-14`)

This document is the source of truth for `RB-14` on [REBASE_TAKS_BOARD.md](/D:/Programming/codex/PulseCode/docs/REBASE_TAKS_BOARD.md).

It reorganizes runtime ownership into an explicit three-way split between:

- Pulse stdlib/runtime code
- Rust host-bootstrap runtime code
- adapter-specific loader/syscall/service glue

It does not replace the earlier E2 shared-boundary ownership docs. It builds on them and rebases them onto the multi-target adapter architecture.

## Relationship To Earlier Ownership Docs

The earlier E2 docs still matter:

- [RUNTIME_OWNERSHIP_INVENTORY.md](/D:/Programming/codex/PulseCode/docs/RUNTIME_OWNERSHIP_INVENTORY.md)
- [RUNTIME_OWNERSHIP_POLICY.md](/D:/Programming/codex/PulseCode/docs/RUNTIME_OWNERSHIP_POLICY.md)
- [SHARED_RUNTIME_ABI.md](/D:/Programming/codex/PulseCode/docs/SHARED_RUNTIME_ABI.md)

Those documents lock:

- runtime-private vs app-visible shared-boundary ownership
- the app/runtime import boundary
- runtime-private state categories

`RB-14` keeps those rules and adds the rebase-specific question that E2 did not need to answer:

- which surfaces should belong to Pulse code
- which surfaces still remain in Rust host bootstrap runtime code
- which surfaces must stay adapter-owned

## Relationship To `RB-12` And `RB-13`

- [HOST_BOOTSTRAP_RUNTIME_CONTRACT.md](/D:/Programming/codex/PulseCode/docs/HOST_BOOTSTRAP_RUNTIME_CONTRACT.md) defines the minimum retained Rust-host bootstrap runtime seam.
- [PULSEOS_RUNTIME_SERVICE_ABI_SLICE.md](/D:/Programming/codex/PulseCode/docs/PULSEOS_RUNTIME_SERVICE_ABI_SLICE.md) defines the requested-target PulseOS service boundary.

`RB-14` uses those as fixed inputs and answers the ownership question around them.

## Current Code Source

The code-owned ownership model is resolved in:

- [ownership_model.rs](/D:/Programming/codex/PulseCode/crates/pulsec-cli/src/backend/host_bootstrap/ownership_model.rs)

and emitted into `native.plan.json` through:

- [plan_rendering.rs](/D:/Programming/codex/PulseCode/crates/pulsec-cli/src/backend/analysis/plan_rendering.rs)

Schema id:

- `pulsec.runtime.ownership.rebase.v1`

## Three-Way Ownership Split

### 1. Pulse-Owned Surface

Pulse stdlib/runtime code owns the language-facing contract surface.

Current namespace families:

- `pulse.lang.*`
- `pulse.io.*`
- `com.pulse.collections.*`
- `com.pulse.math.*`
- `com.pulse.memory.*`
- `com.pulse.rt.*`

Ownership rule:

- language-facing behavior belongs in Pulse stdlib/runtime code unless it genuinely requires retained bootstrap runtime machinery or adapter-owned OS/service glue

This means Pulse should own the public behavior contract even when a temporary Rust implementation still exists under the hood today.

### 2. Rust Host-Bootstrap Runtime-Owned Surface

The Rust host-bootstrap runtime still owns the retained implementation surface that current validation depends on.

Current retained procedure families:

- `lifecycle`
- `core-runtime-bridge`
- `trace-exception`
- `portable-stdlib-bridge`

Current retained portable bridge families:

- `console-io`
- `string-and-number-text`
- `time-and-process`
- `array-runtime`
- `list-runtime`
- `map-runtime`
- `memory-ownership`
- `math-helpers`

Current runtime-private state families still retained in the Rust path:

- `object-and-class-id-metadata`
- `slot-allocator-state`
- `arc-and-cycle-state`
- `weak-reference-state`
- `container-registries`
- `trace-abi-and-scratch-state`

These are the current runtime-private implementation/state families behind the existing executable proof lane. They are not reclassified as Pulse-owned just because the public behavior contract belongs to Pulse.

### 3. Adapter-Owned Surface

Target adapters own the OS-facing and load/publication-facing glue underneath the public runtime contract.

Current adapter-owned categories:

- `startup-entry-and-exit-boundary`
- `system-service-imports`
- `system-link-inputs`
- `loader-and-publication-shape`
- `requested-target-runtime-service-implementation`

Current Windows x64 host/bootstrap evidence remains the active adapter import inventory:

- `GetStdHandle`
- `WriteFile`
- `ExitProcess`
- `GetProcessHeap`
- `HeapAlloc`
- `HeapFree`
- `GetSystemTimeAsFileTime`

When the requested target is `pulseos-x64`, the requested-target service contract schema is now:

- `pulsec.pulseos.runtime_service.v1`

That requested-target contract is adapter-owned implementation territory. It is not a reason to pull raw service capability implementation back into the Pulse stdlib or the retained Rust bootstrap runtime contract.

## Locked Anti-Collapse Rules

The following ownership collapses are now explicitly forbidden:

- public Pulse-facing runtime and stdlib surface must not be recast as adapter-owned
- runtime-private bootstrap state must not be treated as app-owned or stdlib-owned storage
- Windows raw service imports must not be treated as portable runtime defaults or as PulseOS defaults
- startup, loader handoff, and publication layout must stay adapter-owned instead of quietly slipping back into the host-bootstrap runtime contract

## Continuity With Shared-Boundary Ownership

`RB-14` does not reopen the E2 app-vs-runtime-library boundary.

That earlier boundary still stands:

- executable/app image owns startup/bootstrap objects and user/class method objects
- runtime image owns runtime-private state and callable runtime procedures

`RB-14` sits inside the runtime side of that larger story and prevents the rebase from blurring:

- Pulse-owned public behavior
- Rust bootstrap-owned retained implementation/state
- adapter-owned OS/service/load/publication glue

## Plan Surface

`native.plan.json` now emits:

- `runtime_ownership_model`

with schema:

- `pulsec.runtime.ownership.rebase.v1`

The emitted block makes all three ownership layers explicit and also records:

- the retained host-bootstrap runtime schema
- the current active adapter service-import inventory
- whether the requested target currently has a published requested-target service contract

For `pulseos-x64`, that plan block publishes:

- `requested_target_service_contract_schema = pulsec.pulseos.runtime_service.v1`
- `requested_target_service_contract_status = published-first-slice-contract`

For non-PulseOS requested targets, that field currently emits `null` with:

- `requested_target_service_contract_status = not-published-for-this-target`

## Consequences For `RB-15` And Later

- `RB-15` is now published at [TARGET_ARTIFACT_CONTRACT_SPLIT.md](/D:/Programming/codex/PulseCode/docs/TARGET_ARTIFACT_CONTRACT_SPLIT.md) and keeps Windows x64 artifact ownership separate from PulseOS artifact ownership using this ownership split instead of letting artifact/publication policy drift back into the host-bootstrap runtime.
- `RB-16` should define PulseOS startup and loader contracts as adapter-owned behavior on top of this split.
- later self-host migration work should move behavior toward Pulse-owned code where possible, but only by shrinking the retained Rust bootstrap/runtime surface explicitly.
