# E1 Task Board: Real Shared-Library Native Output

Status legend: `Todo`, `In Progress`, `Blocked`, `Done (Locked)`.

## Scope
E1 turns shared-library native output from scaffolding into a real product mode. It covers build-mode contracts, native emission for `.dll` artifacts, runtime/stdlib publication as reusable libraries, deterministic distribution layout, and validation that shared-mode builds are runnable and supportable on Windows.

## E1 Strict Done Policy
- E1 is not complete when config fields exist; it closes only when real `.exe` + `.dll` artifacts are emitted and executed.
- `Done (Locked)` means backend emission, import/export contracts, publication layout, docs, and fixture coverage are all stable.
- Any task that changes emitted binary shape, distribution layout, or build-mode UX must include deterministic artifact assertions.
- Shared-library tasks must include executable evidence, not just plan/schema evidence.

## Workstream A: Shared Build Mode Contract

| ID | Task | Depends On | Owner | Target | Status | Exit Condition |
|---|---|---|---|---|---|---|
| E1-01 | Lock shared-build terminology and mode contract (`fat`, `shared`, publication layout, user-facing flags) | D1, D2 | Codex | 2026-03-11 09:56 ET (Completed) | Done (Locked) | Build-mode vocabulary, CLI flags, and artifact expectations are documented and snapshot-tested |
| E1-02 | Define native-plan schema for shared outputs (`app.exe`, runtime/stdlib `.dll`, import libs, manifests/metadata`) | E1-01 | Codex | 2026-03-11 10:08 ET (Completed) | Done (Locked) | `native.plan.json` captures shared artifact topology and lock tests assert required fields |
| E1-03 | Lock naming/versioning rules for shared runtime and stdlib binaries | E1-01 | Codex | 2026-03-11 10:15 ET (Completed) | Done (Locked) | Published `.dll` names, version suffix rules, and import-lib names are deterministic and documented |
| E1-04 | Add shared-build mode selection to manifest/profile model | E1-01, D2 | Codex | 2026-03-11 09:56 ET (Completed) | Done (Locked) | Project profiles can request fat vs shared output deterministically and invalid combinations are diagnosed clearly |

## Workstream B: Native Backend Shared Artifact Emission

| ID | Task | Depends On | Owner | Target | Status | Exit Condition |
|---|---|---|---|---|---|---|
| E1-05 | Implement backend split between app-owned objects and shared-library-owned objects for link planning | E1-02, E2-05, E2-06 | Codex | 2026-03-11 10:36 ET (Completed) | Done (Locked) | Link planning distinguishes executable-owned and library-owned objects without duplicate symbol/runtime ownership conflicts |
| E1-06 | Emit real shared-library artifacts for runtime/stdlib (`.dll` + import `.lib` / Windows link boundary) | E1-03, E1-05, E2-03, E2-05 | Codex | 2026-03-11 17:15 ET (Completed) | Done (Locked) | Build produces real shared-library outputs consumed by app executables in fixture builds |
| E1-07 | Remove stub-success fallback from product builds and hard-fail on backend/link failure with deterministic logs/reports | E1-06 | Codex | 2026-03-11 22:05 ET (Completed) | Done (Locked) | Failed native emission/link never publishes a fake runnable artifact; build/package fail deterministically while still writing actionable logs/evidence |
| E1-08 | Emit executable import linkage against shared runtime/stdlib binaries | E1-06, E1-07, E2-07 | Codex | 2026-03-11 23:05 ET (Completed) | Done (Locked) | App executables link and launch against generated shared libraries with deterministic import wiring |
| E1-09 | Lock exported symbol policy for shared runtime/stdlib surface | E1-06, E2-11 | Codex | 2026-03-11 23:42 ET (Completed) | Done (Locked) | Exported/native-visible symbol set is documented, minimal, versioned, and covered by artifact assertions |
| E1-10 | Add startup/bootstrap path for shared-mode executable initialization | E1-08, E2-07 | Codex | 2026-03-11 23:56 ET (Completed) | Done (Locked) | Shared-mode apps initialize runtime successfully and fixture outputs prove startup parity for supported flows |

## Workstream C: Publication Layout + Distribution Surface

| ID | Task | Depends On | Owner | Target | Status | Exit Condition |
|---|---|---|---|---|---|---|
| E1-11 | Define deterministic distribution layout for shared outputs (`bin`, `lib`, runtime payloads, metadata) | E1-03, E1-06 | Codex | 2026-03-12 00:17 ET (Completed) | Done (Locked) | Shared publication directory layout is locked and validated by snapshot fixtures |
| E1-12 | Add runtime/stdlib publication pipeline for local build outputs and package staging | E1-11, D3 | Codex | 2026-03-12 00:33 ET (Completed) | Done (Locked) | Shared artifacts are staged/published consistently for build and package flows |
| E1-13 | Add debug/release publication rules for shared binaries (PDBs, symbols, debug payload handling) | E1-11, D2 | Codex | 2026-03-12 00:45 ET (Completed) | Done (Locked) | Debug/release outputs differ only by locked, documented rules and artifact snapshots validate both modes |
| E1-14 | Add dependency metadata for locating shared runtime payloads at launch/install time | E1-11, E1-12 | Codex | 2026-03-12 01:02 ET (Completed) | Done (Locked) | Launch/runtime lookup rules are deterministic and packaging/staging artifacts contain the required metadata |

## Workstream D: Fixture Matrix + Toolchain Validation

| ID | Task | Depends On | Owner | Target | Status | Exit Condition |
|---|---|---|---|---|---|---|
| E1-15 | Add executable fixtures that build and run in shared mode for representative app shapes | E1-08, E1-10 | Codex | 2026-03-12 01:14 ET (Completed) | Done (Locked) | Real fixture projects execute successfully in shared mode with deterministic output |
| E1-16 | Add artifact-lock tests for `.dll`, import-lib, and publication layout shape | E1-06, E1-11 | Codex | 2026-03-12 01:25 ET (Completed) | Done (Locked) | Tests assert presence, naming, and expected metadata/schema of shared artifacts |
| E1-17 | Expand Windows toolchain matrix for shared-library generation/linking prerequisites | E1-06 | Codex | 2026-03-12 01:34 ET (Completed) | Done (Locked) | Matrix doc covers supported shared-build toolchain variants and expected outcomes |
| E1-18 | Add failure-path fixtures for missing shared payloads, bad publication layouts, backend/link failures, and incompatible profile requests | E1-07, E1-12, E1-14 | Codex | 2026-03-12 02:00 ET (Completed) | Done (Locked) | Failure diagnostics are deterministic and no silent fallback hides shared-mode breakage |

## Workstream E: Docs + Closure

| ID | Task | Depends On | Owner | Target | Status | Exit Condition |
|---|---|---|---|---|---|---|
| E1-19 | Publish shared-build contract docs (`shared build mode`, distribution layout, export policy, hard-fail policy) | E1-03, E1-07, E1-09, E1-11 | Codex | 2026-03-12 02:24 ET (Completed) | Done (Locked) | Phase docs are complete, cross-linked, and aligned with emitted artifacts |
| E1-20 | Publish E1 evidence index and closure checklist | E1-15, E1-16, E1-17, E1-18, E1-19 | Codex | 2026-03-12 02:24 ET (Completed) | Done (Locked) | Closure docs enumerate all required commands/artifacts and link to locking evidence |
| E1-21 | Run E1 closure verification and roadmap lock | E1-20 | Codex | 2026-03-12 02:31 ET (Completed) | Done (Locked) | E1 tasks/gates are `Done (Locked)` and roadmap references the locked shared-output baseline |

## E1 Gates

| Gate | Definition | Status |
|---|---|---|
| E1-G1 | Shared build-mode contract stability | Done (Locked) |
| E1-G2 | Real shared artifact emission correctness | Done (Locked) |
| E1-G3 | Shared executable bootstrap correctness | Done (Locked) |
| E1-G4 | Distribution/publication layout correctness + no-stub fake-artifact leakage | Done (Locked) |
| E1-G5 | Shared-mode toolchain/environment coverage | Done (Locked) |
| E1-G6 | Docs + closure artifact completeness | Done (Locked) |

## Required Test/Evidence Gates

| Gate ID | Gate | Command / Evidence | Status |
|---|---|---|---|
| E1-G1 | Shared build-mode contract stability | CLI help/output snapshots + plan-lock tests for shared mode | Done (Locked) |
| E1-G2 | Real shared artifact emission correctness | fixture builds assert runnable `.exe` + emitted `.dll` + import-boundary artifacts | Done (Locked) |
| E1-G3 | Shared executable bootstrap correctness | runtime fixture suite for startup/init and representative stdlib/runtime flows | Done (Locked) |
| E1-G4 | Distribution/publication layout correctness + no-stub fake-artifact leakage | snapshot tests for build/package staging layouts in shared mode + failure-path assertions that backend/link errors do not publish fake runnable artifacts | Done (Locked) |
| E1-G5 | Shared-mode toolchain/environment coverage | updated Windows matrix with shared-build variants and expected outcomes | Done (Locked) |
| E1-G6 | Docs + closure artifact completeness | shared build contract docs + evidence index + closure checklist | Done (Locked) |

## Suggested First 2 Sprints

### Sprint 1 (Mode Contract + Artifact Emission)
- Target tasks: `E1-01`..`E1-10`
- Focus: make shared mode real in backend/link planning and get first runnable `.exe` + `.dll` fixture green
- Exit checks:
  - `E1-G1` and `E1-G2` green at baseline level
  - at least one runtime-backed fixture project builds and runs in shared mode

### Sprint 2 (Publication + Closure Hardening)
- Target tasks: `E1-11`..`E1-21`
- Focus: lock publication layout, toolchain coverage, failure paths, and closure docs
- Exit checks:
  - `E1-G3`..`E1-G6` green
  - shared-mode outputs are package/staging ready and documented

## Exit Criteria

| Milestone | Exit Criteria |
|---|---|
| E1 | Tasks `E1-01`..`E1-21` and gates `E1-G1`..`E1-G6` are all `Done (Locked)` |
| E1 Deliverable | `adenc build` emits real runnable shared-library native outputs (`.exe` + `.dll`) with deterministic distribution layout |
