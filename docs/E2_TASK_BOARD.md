# E2 Task Board: Runtime Ownership Refactor for Linking Boundaries

Status legend: `Todo`, `In Progress`, `Blocked`, `Done (Locked)`.

## Scope
E2 refactors runtime ownership so shared linking boundaries are real and stable. It moves runtime-owned state out of app-owned object storage, defines ABI/import boundaries between executables and shared runtime libraries, and hardens the compiler/runtime contract so shared publication does not depend on accidental single-binary assumptions.

## E2 Strict Done Policy
- E2 is architectural hardening: no task is complete if app/runtime ownership is still entangled in a way that only fat-mode happens to tolerate.
- `Done (Locked)` means ownership boundaries, ABI/import contracts, and initialization responsibilities are explicit, documented, and tested.
- Any task that changes object layout, runtime tables, or initialization/import boundaries must include plan/runtime evidence and executable fixtures.
- No hidden backdoor access from app codegen into runtime-private storage is allowed in the locked state.

## Workstream A: Ownership Boundary Inventory + Contract

| ID | Task | Depends On | Owner | Target | Status | Exit Condition |
|---|---|---|---|---|---|---|
| E2-01 | Inventory all runtime-owned metadata/state currently assumed to live in app-owned image/storage | C2, C3, E1 | Codex | 2026-03-11 11:02 ET (Completed) | Done (Locked) | Inventory doc identifies every runtime-global/stateful surface that must move behind a shared boundary |
| E2-02 | Lock runtime-private vs app-visible ownership policy | E2-01 | Codex | 2026-03-11 11:09 ET (Completed) | Done (Locked) | Ownership matrix is documented and reviewed into a stable contract used by backend/runtime code |
| E2-03 | Define ABI/import boundary between app executables and shared runtime libraries | E2-02, E1-02 | Codex | 2026-03-11 11:18 ET (Completed) | Done (Locked) | Required imports/exports, init sequence, and ownership responsibilities are documented and plan-emitted where relevant |
| E2-04 | Define versioning/compatibility policy for the shared runtime ABI boundary | E2-03 | Codex | 2026-03-11 11:26 ET (Completed) | Done (Locked) | ABI compatibility fields and mismatch policy are documented and testable |

## Workstream B: Runtime State Relocation

| ID | Task | Depends On | Owner | Target | Status | Exit Condition |
|---|---|---|---|---|---|---|
| E2-05 | Move runtime-global metadata tables and allocator state into runtime-owned library storage | E2-02, E2-03 | Codex | 2026-03-11 11:36 ET (Completed) | Done (Locked) | Shared runtime owns its metadata/state independently of app images and fixture apps still execute correctly |
| E2-06 | Remove backend/runtime dependence on user-object field storage for runtime bookkeeping | E2-02, E2-05 | Codex | 2026-03-11 12:01 ET (Completed) | Done (Locked) | Runtime bookkeeping no longer aliases or depends on app object field layout beyond documented ABI contracts |
| E2-07 | Refactor startup/init flow so shared runtime initializes and owns its state before app code executes | E2-03, E2-05 | Codex | 2026-03-11 16:25 ET (Completed) | Done (Locked) | Init order is deterministic, documented, and proven in shared-mode fixtures |
| E2-08 | Lock shutdown/teardown responsibilities across executable/runtime boundaries | E2-05, E2-07 | Codex | 2026-03-11 16:43 ET (Completed) | Done (Locked) | Resource release and teardown rules are defined and validated without app/runtime ownership leaks |

## Workstream C: Compiler + Backend Contract Updates

| ID | Task | Depends On | Owner | Target | Status | Exit Condition |
|---|---|---|---|---|---|---|
| E2-09 | Update native-plan emission to represent runtime ownership/import boundaries explicitly within the shared-output schema defined by E1 | E2-03, E1-02 | Codex | 2026-03-12 03:04 ET (Completed) | Done (Locked) | `native.plan.json` captures explicit shared-boundary ownership/import/lookup metadata and lock tests assert it |
| E2-10 | Refactor backend lowering/codegen paths that currently assume same-image runtime access | E2-05, E2-09 | Codex | 2026-03-12 03:53 ET (Completed) | Done (Locked) | Shared-mode codegen goes through explicit ABI/import paths instead of direct same-image assumptions |
| E2-11 | Lock symbol visibility/import rules for runtime-private vs app-callable surfaces | E2-03, E2-10 | Codex | 2026-03-11 23:42 ET (Completed) | Done (Locked) | Symbol boundary is minimal, documented, and validated in emitted artifacts |
| E2-12 | Add deterministic fail-fast behavior for runtime ABI/import mismatches at launch/link time | E2-04, E2-10 | Codex | 2026-03-12 04:17 ET (Completed) | Done (Locked) | Incompatible shared-boundary builds fail with clear deterministic diagnostics |

## Workstream D: Conformance + Regression Hardening

| ID | Task | Depends On | Owner | Target | Status | Exit Condition |
|---|---|---|---|---|---|---|
| E2-13 | Add fixture suite covering runtime-owned state access through shared boundaries | E2-10 | Codex | 2026-03-12 04:34 ET (Completed) | Done (Locked) | Representative runtime-heavy apps prove state ownership works when runtime lives in a shared library |
| E2-14 | Add regression fixtures for object-model/runtime interactions that previously relied on fat-mode assumptions | E2-06, E2-10 | Codex | 2026-03-12 04:49 ET (Completed) | Done (Locked) | Legacy coupling hazards are locked with executable or artifact-based regression tests |
| E2-15 | Add ABI mismatch/import failure fixtures for launch/link boundary diagnostics | E2-12 | Codex | 2026-03-12 05:05 ET (Completed) | Done (Locked) | Failure-path fixtures assert deterministic mismatch and missing-import behavior |
| E2-16 | Add stress fixtures for runtime state stability under shared-mode churn | E2-05, E2-07 | Codex | 2026-03-12 05:05 ET (Completed) | Done (Locked) | Shared-mode churn/stress runs remain stable and deterministic across repeated executions |

## Workstream E: Docs + Closure

| ID | Task | Depends On | Owner | Target | Status | Exit Condition |
|---|---|---|---|---|---|---|
| E2-17 | Publish runtime ownership/ABI boundary docs and diagrams | E2-02, E2-03, E2-04, E2-11 | Codex | 2026-03-12 05:17 ET (Completed) | Done (Locked) | Docs explain ownership, imports, init, mismatch behavior, and shared-boundary responsibilities clearly |
| E2-18 | Publish E2 closure checklist and evidence index | E2-13, E2-14, E2-15, E2-16, E2-17 | Codex | 2026-03-12 05:17 ET (Completed) | Done (Locked) | Closure docs enumerate required fixtures and link to boundary-lock evidence |
| E2-19 | Run E2 closure verification and roadmap lock | E2-18 | Codex | 2026-03-12 05:17 ET (Completed) | Done (Locked) | E2 tasks/gates are `Done (Locked)` and roadmap references the locked ownership-boundary baseline |

## E2 Gates

| Gate | Definition | Status |
|---|---|---|
| E2-G1 | Runtime/app ownership boundary correctness | Done (Locked) |
| E2-G2 | Shared ABI/import contract correctness | Done (Locked) |
| E2-G3 | Shared init/shutdown lifecycle correctness | Done (Locked) |
| E2-G4 | Failure-path determinism for boundary mismatches | Done (Locked) |
| E2-G5 | Shared-boundary stress/regression stability | Done (Locked) |
| E2-G6 | Docs + closure artifact completeness | Done (Locked) |

## Required Test/Evidence Gates

| Gate ID | Gate | Command / Evidence | Status |
|---|---|---|---|
| E2-G1 | Runtime/app ownership boundary correctness | inventory/contract docs + backend/runtime lock tests + shared fixture runs | Done (Locked) |
| E2-G2 | Shared ABI/import contract correctness | native-plan/artifact assertions for imports, exports, ABI metadata, and explicit shared-boundary lookup metadata | Done (Locked) |
| E2-G3 | Shared init/shutdown lifecycle correctness | executable fixtures for startup, runtime use, and teardown in shared mode | Done (Locked) |
| E2-G4 | Failure-path determinism for boundary mismatches | mismatch/missing-import fixtures with locked diagnostics | Done (Locked) |
| E2-G5 | Shared-boundary stress/regression stability | repeated shared-mode churn fixtures and runtime-heavy regression apps | Done (Locked) |
| E2-G6 | Docs + closure artifact completeness | runtime ownership doc + ABI boundary doc + closure checklist + evidence index | Done (Locked) |

## Suggested First 2 Sprints

### Sprint 1 (Boundary Lock + State Relocation)
- Target tasks: `E2-01`..`E2-10`
- Focus: define the ownership boundary and remove same-image runtime assumptions from the critical runtime state paths
- Exit checks:
  - `E2-G1` and `E2-G2` green at baseline level
  - shared-mode fixtures no longer rely on app-owned runtime state placement

### Sprint 2 (Failure Hardening + Closure)
- Target tasks: `E2-11`..`E2-19`
- Focus: lock visibility/import rules, failure behavior, stress coverage, and closure docs
- Exit checks:
  - `E2-G3`..`E2-G6` green
  - ownership boundary is documented, stable, and verified under failure/stress cases

## Exit Criteria

| Milestone | Exit Criteria |
|---|---|
| E2 | Tasks `E2-01`..`E2-19` and gates `E2-G1`..`E2-G6` are all `Done (Locked)` |
| E2 Deliverable | Shared runtime/library builds use an explicit, versioned ABI/import boundary with runtime-owned state fully decoupled from app-owned storage |
