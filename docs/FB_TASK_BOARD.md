# F-B Task Board: Self-Sustained Elevation Inventory

Status legend: `Todo`, `In Progress`, `Blocked`, `Done (Locked)`.

## Scope

`F-B` is the pre-Phase-G inventory and ownership-migration board. Its purpose is not to replace `F1`, `F2`, or `F-A`, but to make the transition into Pulse-hosted compilation honest enough for the stronger project goal: self-sustained hosting, not merely a compiler that can compile itself once while still depending on too much Rust-owned logic.

`F-B` exists to answer three questions explicitly before the Phase G transition starts:

- what parts of the current compiler/runtime/tooling stack still live in Rust only because they have not yet been elevated into Pulse
- which of those parts should move into user-facing `stdlib`, which should move into compiler/runtime-facing `authorlib`, and which must remain below the host/bootstrap or target-adapter boundary
- what compiler/runtime/library access rules must exist so Pulse-authored compiler and runtime work can actually replace Rust-owned logic instead of wrapping it cosmetically

`F-B` should not begin from a cold start. Active phases are expected to record intentional defer-to-`F-B` decisions in [FB_CARRY_FORWARD_TRACKER.md](/G:/Programming/Rust/PulseCode/docs/FB_CARRY_FORWARD_TRACKER.md) so the later audit starts with a curated carry-forward list rather than rediscovering every deferred ownership gap from scratch.

## Architectural Direction

The selected library split for the self-sustained transition is now:

- `stdlib`
  - the user-facing standard library
  - intended for ordinary Pulse application/library authors
  - should stay simple and Java-close where that is the chosen product direction
- `authorlib`
  - a compiler/runtime authoring extension library
  - intended for Pulse-authored compiler, runtime, toolchain, and backend-elevation work
  - may expose elevated ownership/memory/runtime construction surfaces that should not be part of ordinary user-facing programming

Current selected `authorlib` policy:

- `authorlib` is not a normal end-user default import surface
- the compiler must always be able to resolve `authorlib` for compiler/runtime/tooling builds, even when a project does not enable it as a user-facing dependency
- `authorlib` is the intended home for Pulse-authored elevated runtime-building surfaces such as ARC/cycle/weak helpers and other backend-elevated language work that should not be normalized into `stdlib`
- anything that can honestly live in Pulse should be classified to `stdlib` or `authorlib` instead of staying Rust-owned by inertia

## Workstreams

### Workstream A: Whole-Program Ownership Inventory

| ID | Task | Depends On | Owner | Target | Status | Exit Condition |
|---|---|---|---|---|---|---|
| FB-01 | Inventory the full compiler/runtime/tooling stack and classify each major subsystem as Pulse-owned today, Rust-owned by necessity, or Rust-owned pending elevation | F1, F2, F-A | - | - | Todo | A truthful whole-program ownership map exists across frontend, semantics, lowering, backend, runtime, stdlib, docs/tooling helpers, build publication, and validation infrastructure |
| FB-02 | Publish the self-sustained hosting ownership policy that distinguishes "must stay below the adapter/runtime boundary" from "can and should move into Pulse" | FB-01 | - | - | Todo | The project has an explicit policy for what may remain Rust-owned and what must be elevated before or during the Phase G transition |
| FB-03 | Identify every remaining Rust-owned helper that blocks a truthful "self-sustained by self-hosting" claim and assign each one to `stdlib`, `authorlib`, later target-adapter work, or a defended retained-host boundary | FB-01, FB-02 | - | - | Todo | No major Rust-owned subsystem is left as an untracked gray area |

### Workstream B: `stdlib` vs `authorlib` Split

| ID | Task | Depends On | Owner | Target | Status | Exit Condition |
|---|---|---|---|---|---|---|
| FB-04 | Define the `authorlib` package/library boundary, naming, visibility expectations, and source-of-truth policy | FB-02 | - | - | Todo | `authorlib` has a written contract instead of existing only as chat intent |
| FB-05 | Classify currently planned Pulse-owned runtime/compiler helpers between user-facing `stdlib` and compiler/runtime-facing `authorlib` | FB-03, FB-04 | - | - | Todo | The library split is explicit enough to prevent accidental leakage of author-only surfaces into the user library |
| FB-06 | Publish the elevated-surface inventory for `authorlib`, including ARC/cycle/weak/runtime-construction surfaces and any other backend-elevated helpers that should not become ordinary end-user APIs | FB-05 | - | - | Todo | The initial `authorlib` surface is intentionally chosen and documented, not ad hoc |

### Workstream C: Compiler and Runtime Access Rules

| ID | Task | Depends On | Owner | Target | Status | Exit Condition |
|---|---|---|---|---|---|---|
| FB-07 | Define compiler resolution rules for `authorlib`, including the rule that compiler/runtime builds can always access it even when ordinary projects do not enable it | FB-04 | - | - | Todo | The compiler-access rule for `authorlib` is explicit and implementation-ready |
| FB-08 | Define runtime-compilation/publication rules for `authorlib` so Pulse-authored runtime work can be compiled when program builds happen without pretending it is part of the user-facing dependency set | FB-04, FB-07 | - | - | Todo | The runtime/build boundary for `authorlib` is explicit enough to guide Phase G implementation work |
| FB-09 | Define validation/doc expectations for `authorlib` so elevated language/runtime surfaces are still documented and tested even if they stay hidden from ordinary users | FB-06, FB-07 | - | - | Todo | `authorlib` has an explicit docs/validation contract rather than being treated as an untracked internal bucket |

### Workstream D: Phase G Readiness

| ID | Task | Depends On | Owner | Target | Status | Exit Condition |
|---|---|---|---|---|---|---|
| FB-10 | Publish the self-sustained transition checklist that names what must be elevated before Phase G can honestly claim a self-sustained-hosting transition | FB-03, FB-06, FB-08 | - | - | Todo | Phase G has a concrete readiness checklist tied to the ownership inventory instead of a vague "rewrite the compiler" goal |
| FB-11 | Publish the `F-B` closure checklist and evidence index | FB-10 | - | - | Todo | `F-B` has a traceable closure package |
| FB-12 | Run `F-B` closure verification and lock the roadmap transition into Phase G | FB-11 | - | - | Todo | `F-B` is `Done (Locked)` and the roadmap can move into the self-sustained-hosting transition honestly |

## Gates

| Gate | Definition | Status |
|---|---|---|
| FB-G1 | Whole-program ownership inventory is complete | Todo |
| FB-G2 | `stdlib` vs `authorlib` split is explicitly documented | Todo |
| FB-G3 | Compiler/runtime access rules for `authorlib` are explicit | Todo |
| FB-G4 | Phase G readiness checklist for self-sustained hosting exists | Todo |
| FB-G5 | Closure evidence is published and linked from the roadmap/handoff | Todo |

## Exit Criteria

| Milestone | Exit Criteria |
|---|---|
| F-B | Tasks `FB-01`..`FB-12` and gates `FB-G1`..`FB-G5` are all `Done (Locked)` |
| F-B Deliverable | PulseCode has a truthful whole-program ownership inventory, a locked `stdlib`/`authorlib` split, explicit compiler/runtime access rules for Pulse-owned elevated work, and a concrete readiness checklist for the self-sustained-hosting transition in Phase G |
