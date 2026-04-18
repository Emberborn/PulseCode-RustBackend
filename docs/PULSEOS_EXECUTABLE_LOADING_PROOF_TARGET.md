# AdenOS Executable-Loading Proof Target (`RB-17`)

This document is the source of truth for `RB-17` on [REBASE_TAKS_BOARD.md](/D:/Programming/codex/Aden Lang/docs/REBASE_TAKS_BOARD.md).

It defines the first contract-level executable-loading proof target for AdenOS-bound Aden artifacts.

AdenOS should now be read here as its own platform target. This proof target is about what a future AdenOS loader/platform path must satisfy before execution claims are honest.

It does not claim that the AdenOS adapter executes programs yet. It defines what a future adapter/loader pair must satisfy before the project can honestly say a Aden artifact is AdenOS-targetable.

## Relationship To `RB-13`, `RB-15`, And `RB-16`

`RB-13` published the requested-target AdenOS runtime-service capability slice.

`RB-15` split the Windows x64 and AdenOS artifact lanes.

`RB-16` then published the first AdenOS startup entry, loader expectations, and publication layout.

`RB-17` turns those three earlier contracts into one explicit proof target for executable loading.

Source references:

- [PULSEOS_RUNTIME_SERVICE_ABI_SLICE.md](/D:/Programming/codex/Aden Lang/docs/PULSEOS_RUNTIME_SERVICE_ABI_SLICE.md)
- [TARGET_ARTIFACT_CONTRACT_SPLIT.md](/D:/Programming/codex/Aden Lang/docs/TARGET_ARTIFACT_CONTRACT_SPLIT.md)
- [PULSEOS_STARTUP_LOADER_PUBLICATION_CONTRACT.md](/D:/Programming/codex/Aden Lang/docs/PULSEOS_STARTUP_LOADER_PUBLICATION_CONTRACT.md)

## Current Code Source

The current code-owned proof target is resolved through:

- [adapters/mod.rs](/D:/Programming/codex/Aden Lang/crates/adenc-cli/src/backend/adapters/mod.rs)
- [adenos_x64/mod.rs](/D:/Programming/codex/Aden Lang/crates/adenc-cli/src/backend/adapters/adenos_x64/mod.rs)

and emitted into `native.plan.json` through:

- [plan_rendering.rs](/D:/Programming/codex/Aden Lang/crates/adenc-cli/src/backend/analysis/plan_rendering.rs)

Current plan block:

- `requested_target_executable_loading_proof_target`

Schema id:

- `adenc.adenos.loading_proof_target.v1`

## Contract Status

Current locked truth:

- target: `adenos-x64`
- proof status: `first-contract-level-loading-target`
- implementation status: `proof-contract-defined-execution-deferred`
- validation mode: `contract-shape-only`

That status is deliberate. This contract is a proof target, not an execution claim.

## Required Contract Inputs

The current proof target requires these earlier published contracts:

- startup/loader contract schema: `adenc.adenos.startup_loader_contract.v1`
- artifact contract schema: `adenc.adenos.artifact_contract.v1`
- runtime-service contract schema: `adenc.adenos.runtime_service.v1`

This means a future implementation must satisfy all three published AdenOS requested-target contracts together, not cherry-pick one while silently inheriting Windows bootstrap behavior for the rest.

## Required Published Artifacts

The current proof target requires:

- `bin/<entry>`
- `bin/launch.json`

The current required startup entry is:

- `adenos_start`

The current required loader manifest is:

- schema: `adenc.adenos.launch.v1`
- path: `bin/launch.json`

## Required Loader Capabilities

The current proof target requires the loader/publication path to satisfy:

- `map-primary-program-image-before-entry`
- `resolve-adenos_start-from-primary-image`
- `provide-opaque-startup-context-for-runtime-services`
- `surface-launch-manifest-metadata-from-bin-launch.json`
- `propagate-returned-i32-as-process-exit-code`

These are the minimum capability statements that make the earlier startup and runtime-service contracts executable-loading-relevant instead of just descriptive.

## Required Runtime Bootstrap Sequence

The current proof target requires this runtime bootstrap sequence:

- `adenos_start`
- `adenc_rt_init`
- `app_entry`
- `adenc_rt_shutdown`
- `return_i32_exit_code`

That sequence remains contract-level truth even though no AdenOS adapter implementation executes it yet.

## Success Conditions

The current proof target is satisfied only if all of the following are true:

- the primary program image is published at `bin/<entry>`
- the launch manifest is published at `bin/launch.json`
- the startup entry symbol `adenos_start` is resolvable
- the loader handoff enables the already-published AdenOS runtime-service capability surface
- the runtime bootstrap sequence can reach app entry and return an `i32` process exit code

## Explicit Excluded Claims

The current proof target intentionally does not claim:

- real loader execution is already implemented
- the final Linux-substrate binding details are already frozen
- startup context binary layout is frozen
- syscall numbers or trap encoding are frozen
- a separate AdenOS shared-runtime publication lane already exists

Those remain later adapter-implementation work. `RB-17` only locks what the future proof has to demonstrate.

## What `requested_target_executable_loading_proof_target` Means In The Plan

When the requested target is `adenos-x64`, `native.plan.json` now emits:

- `requested_target_executable_loading_proof_target`

with schema:

- `adenc.adenos.loading_proof_target.v1`

When the requested target is not `adenos-x64`, that plan field currently emits `null`.

This prevents the project from pretending every target lane already has the same executable-loading proof target.

## Consequences For `RB-18`

`RB-18` should use this published proof target to split validation honestly:

- target-neutral plan/contract tests
- retained Windows x64 adapter tests
- AdenOS requested-target contract/proof tests

That way the new AdenOS proof surface stops living only in broad stage-lock coverage and gets a clear long-term validation home.
