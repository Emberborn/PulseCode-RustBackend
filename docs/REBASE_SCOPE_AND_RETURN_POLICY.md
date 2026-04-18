# Rebase Scope and Return-to-F1 Policy

This document is the source of truth for `RB-00` on [REBASE_TAKS_BOARD.md](/D:/Programming/codex/Aden Lang/docs/REBASE_TAKS_BOARD.md).

## Purpose

The rebase board exists to stop Aden Lang from quietly continuing down a Windows-first backend/product path after the project mission changed to a multi-target self-sustained direction: Windows x64 remains the current executable lane, while AdenOS, generic Linux, and later targets must fit preserved adapter/compiler boundaries instead of being blocked out by Windows-shaped assumptions.

This is not a rewrite of the whole project and it is not a pause on language work forever. It is a temporary execution lane that must make the backend/runtime/targeting spine honest before normal `F1` continuation resumes.

## Why This Rebase Exists

Without this rebase, the project risks finishing the wrong things first:

- hard-coding `native-x64` as if it were the only real target
- treating MASM/COFF/`link.exe` as the backend architecture instead of one adapter
- deepening Windows packaging/productization work that does not move the truthful multi-target architecture forward
- leaving runtime/service boundaries implicit and Windows-shaped below IR
- resuming `F1` feature growth on top of assumptions that later have to be broken apart anyway

The rebase exists so the frontend, stdlib, validation, and self-sustained-hosting-readiness work can continue on top of a truthful backend direction instead of accumulating more Windows-coupled debt.

## What This Rebase Is Changing

The rebase changes the project from:

- one implicit Windows-native backend story
- one implied target (`native-x64`)
- one blended ownership model for frontend, backend planning, runtime glue, link strategy, and artifact publication

to:

- a Rust-hosted bootstrap compiler above the target boundary
- explicit target adapters below the target-neutral compiler/backend planning layer
- an explicit Windows x64 target lane that also serves as the current host/bootstrap adapter
- an explicit AdenOS target/runtime contract that remains independent from generic Linux
- later target lanes such as generic Linux or macOS fitting the same preserved architecture when activated
- a documented return path back to `F1`

## In Scope

This rebase is in scope for:

- target taxonomy and naming policy
- CLI/manifest/build-plan target truthfulness
- backend adapter boundaries and target selection seams
- runtime/intrinsics ownership boundaries
- Windows x64 target-lane scope policy and Windows-productization freeze policy
- AdenOS first-slice runtime/startup/artifact/loading contracts
- validation layering that separates target-neutral, Windows x64 adapter, AdenOS requested-target, and later target follow-on coverage
- handoff/roadmap/contract updates needed so new agents enter the correct lane
- explicit preservation of adapter/compiler boundaries so current Windows work does not block later Linux, macOS, or AdenOS integration

## Strategic Non-Goals

This rebase is explicitly not trying to:

- finish Aden Lang as a Windows-first product before the multi-target architecture is made honest
- complete MSI/WiX/signing/distribution polish as if Windows productization were still the destination
- replace the current Windows MASM/COFF path immediately with a full new backend before the architecture is clarified
- claim a finished AdenOS ABI or later Linux/macOS ABI before the relevant first slice is honestly defined
- supersede `F1`, `F2`, or `F-A` as the long-term language/stdlib/docs/library boards
- reopen already-green language/frontend work unless it is directly affected by the backend/runtime/targeting rebase

## What Continues Unchanged

The following work remains real and valuable during the rebase:

- parser, semantics, type system, and IR work in Rust
- stdlib growth and Java-close language-surface closure tracked on `F1`
- docs and documentation workflow tracked on `F2`
- future library/binding and annotation-processor migration work tracked on `F-A`
- regression repair required to keep the current bootstrap compiler truthful and green
- focused validation of current shipped language/runtime behavior

These boards remain the continuity plan. The rebase board exists so they stop deepening the wrong target/runtime assumptions while they continue.

## What Is Frozen or Demoted During the Rebase

The following work is frozen, demoted, or allowed only when needed for bootstrap confidence or regression repair:

- treating `native-x64` as the only meaningful target
- treating Windows-native output as the product destination
- expanding MASM/COFF/`link.exe` architecture assumptions outside the Windows x64 adapter lane
- MSI/WiX/signing/productization work that does not directly support bootstrap validation
- new Windows-specific runtime/service assumptions below IR

The Windows x64 lane remains an immediate real target and the current host/bootstrap lane, but Windows-first productization is not the strategic destination.

## Execution Policy During the Rebase

While the rebase board is active:

- [REBASE_TAKS_BOARD.md](/D:/Programming/codex/Aden Lang/docs/REBASE_TAKS_BOARD.md) is the active execution board
- [F1_TASK_BOARD.md](/D:/Programming/codex/Aden Lang/docs/F1_TASK_BOARD.md) is paused as an execution lane
- `F1`, `F2`, and `F-A` remain continuity/reference boards and should still shape design decisions
- new work below the IR boundary should be judged against the target-adapter architecture, not against a Windows-product destination
- current Windows work must preserve the adapter/compiler seams needed for later Linux, macOS, and AdenOS targets

## Return-to-F1 Policy

`F1` does not resume just because the docs mention AdenOS. `F1` resumes only when the rebase board is honestly closed.

That means all of the following must be true:

- `RB-00`..`RB-21` are `Done (Locked)`
- `RB-G1`..`RB-G6` are green
- the handoff, roadmap, backend contract, and rebase board all agree on the same active architecture
- the Windows x64 lane is explicit as an immediate supported target and current host/bootstrap lane, while Windows-first productization extras are explicitly frozen or deferred
- the AdenOS first-slice runtime/startup/artifact contract is explicit enough to guide implementation honestly
- target selection/build-plan/runtime ownership surfaces no longer quietly assume one Windows-native path

Closure note:

- the requested code review after publication of the `RB-21` closure package has now cleared
- the rebase board is therefore honestly closed
- control now returns to `F1_TASK_BOARD` at `F1-51`

## First F1 Return Point

Once the rebase board closes honestly, control returns to:

- [F1_TASK_BOARD.md](/D:/Programming/codex/Aden Lang/docs/F1_TASK_BOARD.md)
- `F1-51` `ArrayList` / `LinkedList` practical CRUD/iteration/query helpers

That return point is already chosen so the rebase does not force the project to re-litigate where language/stdlib work resumes next.

## Document Precedence

When docs disagree during the rebase, use this order:

1. [REBASE_TAKS_BOARD.md](/D:/Programming/codex/Aden Lang/docs/REBASE_TAKS_BOARD.md)
2. [REBASE_SCOPE_AND_RETURN_POLICY.md](/D:/Programming/codex/Aden Lang/docs/REBASE_SCOPE_AND_RETURN_POLICY.md)
3. [CODEX_HANDOFF_PHASE_F.md](/D:/Programming/codex/Aden Lang/docs/CODEX_HANDOFF_PHASE_F.md)
4. [NATIVE_BACKEND_CONTRACT.md](/D:/Programming/codex/Aden Lang/docs/NATIVE_BACKEND_CONTRACT.md)
5. [PULSEOS_LINUX_BACKED_TARGET_DIRECTION.md](/D:/Programming/codex/Aden Lang/docs/PULSEOS_LINUX_BACKED_TARGET_DIRECTION.md)
6. [STANDALONE_ROADMAP.md](/D:/Programming/codex/Aden Lang/docs/STANDALONE_ROADMAP.md)
7. [F1_TASK_BOARD.md](/D:/Programming/codex/Aden Lang/docs/F1_TASK_BOARD.md) and the rest of the F1/F2/F-A continuity docs

## RB-00 Closure Evidence

`RB-00` is satisfied when all of the following are true:

- this scope/policy document exists and is linked from the active handoff/roadmap/board entry points
- the active handoff tells new agents to start on the rebase board rather than `F1`
- the project docs explicitly state that `F1` is paused until the rebase board closes
- the first post-rebase `F1` return point is explicit

`RB-G1` evidence is now complete through:

- [REBASE_SCOPE_AND_RETURN_POLICY.md](/D:/Programming/codex/Aden Lang/docs/REBASE_SCOPE_AND_RETURN_POLICY.md)
- [REBASE_WINDOWS_ASSUMPTION_INVENTORY.md](/D:/Programming/codex/Aden Lang/docs/REBASE_WINDOWS_ASSUMPTION_INVENTORY.md)
- [REBASE_WINDOWS_ASSUMPTION_CLASSIFICATION.md](/D:/Programming/codex/Aden Lang/docs/REBASE_WINDOWS_ASSUMPTION_CLASSIFICATION.md)

The `RB-01` inventory now lives at:

- [REBASE_WINDOWS_ASSUMPTION_INVENTORY.md](/D:/Programming/codex/Aden Lang/docs/REBASE_WINDOWS_ASSUMPTION_INVENTORY.md)

The `RB-02` classification matrix now lives at:

- [REBASE_WINDOWS_ASSUMPTION_CLASSIFICATION.md](/D:/Programming/codex/Aden Lang/docs/REBASE_WINDOWS_ASSUMPTION_CLASSIFICATION.md)
