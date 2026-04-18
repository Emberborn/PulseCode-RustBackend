# Target-Neutral Planning Boundary

This document is the source of truth for `RB-10` on [REBASE_TAKS_BOARD.md](/D:/Programming/codex/PulseCode/docs/REBASE_TAKS_BOARD.md).

`RB-10` removes the remaining Windows-only assumptions that were still sitting inside target-neutral backend planning structures. It does not claim that all artifact, publication, runtime, or loader contracts are now target-neutral; those later tasks remain on `RB-11`, `RB-13`, `RB-15`, and `RB-16`.

## Inputs

`RB-10` is grounded in the published classification matrix, especially:

- `WIN-PLAN-01`
- `WIN-PLAN-04`

Those rows are classified `must move behind target adapter`, which means target-neutral planning must stop hard-coding:

- Windows target triple / object format / calling convention as a global default contract
- `kernel32.lib` as a target-neutral link-plan system input

## What Changed

At `RB-10`, target-neutral plan rendering now resolves two adapter-owned inputs through the registry seam:

- active backend contract
- fallback planned link topology

That means `crates/pulsec-cli/src/backend/analysis/plan_rendering.rs` no longer needs to know:

- the Windows x64 target triple
- the COFF object format
- the Win64 calling convention
- the `kernel32.lib` system input

Those values now come from the active adapter path under:

- `crates/pulsec-cli/src/backend/adapters/mod.rs`
- `crates/pulsec-cli/src/backend/adapters/windows_x64/mod.rs`

## Current Boundary

Target-neutral planning now owns:

- plan structure layout
- plan summary rendering
- target-agnostic memory/object/runtime metadata that is already frozen elsewhere
- adapter-metadata presentation through the `target_adapter` block

The active adapter now owns:

- target backend contract data
- fallback link-plan defaults
- target-specific system link inputs

## Important Non-Goal

`RB-10` does not finish the artifact/publication split.

These Windows-shaped surfaces are still intentionally left for later tasks:

- `.exe` / `.dll` / `.lib` publication families
- runtime lookup metadata layout
- shared-runtime publication contract
- startup/lifecycle contract details such as `ExitProcess`

Those stay deferred because they belong to:

- `RB-11` to `RB-14` for runtime/service boundary work
- `RB-15` to `RB-17` for artifact/startup/loader contract work

## Code-Level Rule

After `RB-10`, target-neutral planning code must not introduce new hard-coded target-specific link/system input assumptions.

If a plan renderer needs target-specific planning defaults, it should resolve them through the adapter registry seam instead of embedding Windows values locally.

## Relationship To Later Tasks

- `RB-11` will begin the runtime/intrinsics portable-vs-adapter split
- `RB-15` will separate the Windows x64 artifact contract from the PulseOS artifact contract
- `RB-16` will define the first PulseOS startup and publication contract

## Locked Result For `RB-10`

`RB-10` is satisfied when all of the following are true:

- this document exists and names `WIN-PLAN-01` and `WIN-PLAN-04` as the consumed rows
- target-neutral plan rendering resolves backend contract data through the adapter registry
- target-neutral plan rendering resolves fallback link-plan defaults through the adapter registry
- target-neutral planning source no longer hard-codes `kernel32.lib`
- the current Windows x64 adapter remains the owner of the retained Windows link-plan defaults
