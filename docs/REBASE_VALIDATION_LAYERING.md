# Rebase Validation Layering

Status: Done (Locked)  
Date locked: 2026-03-22

## Purpose

`RB-18` closes the old validation ambiguity where the current Windows executable lane could be mistaken for proof of every target lane.

This document makes the validation split explicit:

- target-neutral compiler/project validation proves portable CLI, manifest, plan, and language/runtime behavior
- Windows x64 adapter validation proves the retained executable/codegen/link/runtime lane that exists today
- AdenOS requested-target validation proves AdenOS contract and plan truth without pretending the adapter executes yet
- later Linux or macOS validation must fit the same split instead of reusing Windows evidence as proxy truth

## Layer Rules

### Target-Neutral Compiler and Project Validation

This layer owns validation for:

- canonical public target IDs and target selection surfaces
- CLI, manifest, scaffold, and project-layout behavior
- emitted plan metadata that may name non-Windows requested targets honestly
- portable language/runtime/stdlib behavior that is not asserting Windows-specific linker, startup, or publication mechanics

This layer may use the current host/bootstrap lane as a transport for executable proof, but it must treat that as a way to exercise portable behavior rather than as proof of a Windows-specific adapter contract.

Primary homes:

- `crates/adenc-cli/tests/stage_locks_d.rs`
- `crates/adenc-cli/tests/phase_d_cli.rs`
- the target-neutral executable corpus inside `crates/adenc-cli/tests/fixture_projects.rs`

Current `fixture_projects.rs` target-neutral subfamily includes tests that primarily assert:

- language/runtime/stdlib behavior
- deterministic front-to-back Aden execution semantics
- plan/runtime symbol inventories that are not claiming target-specific publication or startup behavior

### Cross-Cutting Contract Locks

This layer owns the planning/docs/handoff spine rather than executable target proof.

Primary home:

- `crates/adenc-cli/tests/stage_locks.rs`

Role:

- lock rebase docs, handoff docs, roadmap truth, and board state
- lock F1 continuity docs while the rebase is active
- lock requested-target contract publication without claiming runtime execution

`stage_locks.rs` is intentionally cross-cutting. It is not itself proof that a target adapter executes.

### Windows x64 Adapter Validation

This layer owns validation for the retained real executable lane that exists today:

- MASM/COFF/codegen/runtime emission behavior
- linker/assembler/toolchain-backed behavior
- Windows x64 startup/publication/runtime boundary details
- fat/shared executable parity on the current host/bootstrap adapter
- adapter-owned runtime/object model execution gates

Primary homes:

- `crates/adenc-cli/src/backend/tests/mod.rs`
- `crates/adenc-cli/tests/stage_locks_c2.rs`
- `crates/adenc-cli/tests/stage_locks_c3.rs`
- `crates/adenc-cli/tests/e3_parity.rs`
- the Windows adapter parity/failure/publication subfamily inside `crates/adenc-cli/tests/fixture_projects.rs`

Current `fixture_projects.rs` Windows x64 adapter subfamily includes tests that assert things like:

- linker-unavailable failure behavior
- shared launch/runtime payload lookup behavior
- ABI mismatch launch failures
- side-by-side fat/shared parity behavior on the retained Windows x64 executable lane

### AdenOS Requested-Target Contract / Proof Validation

This layer owns validation for what the requested `adenos-x64` lane means today without claiming executable support:

- requested-target runtime-service contract
- requested-target artifact contract
- requested-target startup/loader/publication contract
- requested-target executable-loading proof target
- requested-target plan metadata remaining explicit while the active adapter is still Windows x64 host/bootstrap

This should now be read as AdenOS platform-contract proof, not as proof that the adapter executes yet.

Primary homes:

- `crates/adenc-cli/src/backend/tests/mod.rs` for `RB-13` through `RB-17` plan/contract emission checks
- `crates/adenc-cli/tests/stage_locks.rs` for `RB-13` through `RB-18` doc/board/handoff locks
- `crates/adenc-cli/tests/stage_locks_d.rs` for requested-target CLI/manifest/build-plan snapshots that keep `adenos-x64` visible and honest

Passing this layer does not mean AdenOS executes yet. It means the requested-target contract is published and locked honestly.

### Linux Expansion Slot

`linux-x64` is already part of the canonical public target taxonomy, but it does not yet have adapter execution or a published first-slice contract equivalent to AdenOS.

When Linux work activates, it must fit the same split:

- target-neutral surfaces continue to validate canonical target selection and plan truth
- requested-target Linux contracts get their own plan/doc locks
- Linux adapter execution/parity tests get their own adapter-owned home instead of piggybacking on Windows x64 parity evidence

The same rule applies later to `macos-arm64`.

## Mixed-Suite Honesty Rules

- A passing Windows x64 executable/parity test is never proof of AdenOS or Linux execution.
- A passing AdenOS requested-target plan/contract test is never proof of AdenOS execution.
- `fixture_projects.rs` is currently mixed on purpose; until later extraction work, new tests added there must be honest about whether they belong to the target-neutral executable corpus or the Windows x64 adapter overlay.
- New adapter execution suites for AdenOS or Linux should get their own file homes instead of extending `e3_parity.rs` as if all adapters shared one parity lane.
- When a new test does not have an honest existing home, create a new layer-specific home rather than hiding it in the nearest legacy file.

## Current File-to-Layer Map

| Home | Layer | Current responsibility |
|---|---|---|
| `crates/adenc-cli/tests/stage_locks_d.rs` | target-neutral | CLI, manifest, scaffold, canonical target, and build-plan surface locks |
| `crates/adenc-cli/tests/phase_d_cli.rs` | target-neutral | project lifecycle and publication behavior that stays above adapter-specific runtime claims |
| `crates/adenc-cli/tests/fixture_projects.rs` | mixed | portable executable corpus plus retained Windows x64 parity/failure overlay by test family |
| `crates/adenc-cli/tests/stage_locks.rs` | cross-cutting | board, handoff, roadmap, and contract locks for rebase/F1 continuity |
| `crates/adenc-cli/src/backend/tests/mod.rs` | Windows x64 adapter + requested-target contract | active adapter contract/codegen/runtime plan checks plus requested-target AdenOS contract emissions |
| `crates/adenc-cli/tests/stage_locks_c2.rs` | Windows x64 adapter | runtime/ARC execution and contract locks |
| `crates/adenc-cli/tests/stage_locks_c3.rs` | Windows x64 adapter | object-model, dispatch, and runtime execution locks |
| `crates/adenc-cli/tests/e3_parity.rs` | Windows x64 adapter | fat/shared parity evidence on the retained Windows x64 executable lane |

## Closure Standard

`RB-18` is only honest while all of the following remain true:

- the validation docs say which layer owns which test home
- the code comments at the top of the live suites match that ownership split
- the handoff and roadmap point the next agent at this layer map instead of implying one blended native lane
- later target work extends the split instead of collapsing back into "Windows executable proof means the backend is done"
