# E3 Task Board: Fat vs Shared Build Parity

Status legend: `Todo`, `In Progress`, `Blocked`, `Done (Locked)`.

## Scope
E3 locks behavioral and product parity between fat and shared native output modes. It ensures both modes are valid publication targets, have deterministic packaging/staging behavior, and remain functionally equivalent for supported programs across debug/release and installation flows.

## E3 Strict Done Policy
- E3 does not close when both modes merely compile; it closes when both modes are proved equivalent for supported behavior and distribution flows.
- `Done (Locked)` means parity is backed by executable fixtures, artifact assertions, packaging coverage, and documented support boundaries.
- Any parity claim must be validated by side-by-side fat/shared evidence, not inferred from one mode.
- Packaging/installer tasks are incomplete unless shared-library builds remain runnable after staging/install.

## Workstream A: Parity Contract + Supported-Surface Matrix

| ID | Task | Depends On | Owner | Target | Status | Exit Condition |
|---|---|---|---|---|---|---|
| E3-01 | Define supported parity surface for fat vs shared modes (language/runtime features, packaging expectations, debug/release rules) | E1, E2 | Codex | 2026-03-12 05:42 ET (Completed) | Done (Locked) | Parity support matrix is documented with explicit in-scope/out-of-scope behavior |
| E3-02 | Lock CLI/profile semantics so mode selection does not change unsupported behavior silently | E3-01, D1, D2 | Codex | 2026-03-12 05:44 ET (Completed) | Done (Locked) | Fat/shared mode selection is explicit, diagnostics are stable, and profile semantics are documented |
| E3-03 | Define parity evidence strategy (same fixture corpus, artifact comparisons, output comparisons, staging/install checks) | E3-01 | Codex | 2026-03-12 05:46 ET (Completed) | Done (Locked) | A repeatable parity-validation approach is documented and adopted across tests |

## Workstream B: Executable Behavior Parity

| ID | Task | Depends On | Owner | Target | Status | Exit Condition |
|---|---|---|---|---|---|---|
| E3-04 | Add side-by-side fixture runs that execute the same app in fat and shared modes | E3-03, E1-07, E1-09, E2-10 | Codex | 2026-03-12 06:03 ET (Completed) | Done (Locked) | Representative fixture projects run in both modes with matched deterministic outputs |
| E3-05 | Add parity coverage for runtime-heavy apps (collections, IO, time, object model, dispatch, memory behavior) | E3-04, E2-10 | Codex | 2026-03-12 06:17 ET (Completed) | Done (Locked) | Runtime-heavy fixtures show no supported-mode behavior drift between fat and shared outputs |
| E3-06 | Add parity coverage for failure behavior (panic paths, ABI mismatch handling, missing payload/install errors) | E3-04, E1-13, E2-12 | Codex | 2026-03-12 06:32 ET (Completed) | Done (Locked) | Supported failure paths emit mode-appropriate but parity-locked diagnostics and exit behavior |
| E3-07 | Add debug/release parity rules for executable behavior and developer-visible outputs | E3-02, E3-04 | Codex | 2026-03-12 06:41 ET (Completed) | Done (Locked) | Debug and release behavior differences are explicit, justified, and tested for both modes |

## Workstream C: Artifact, Staging, and Packaging Parity

| ID | Task | Depends On | Owner | Target | Status | Exit Condition |
|---|---|---|---|---|---|---|
| E3-08 | Lock artifact/publication parity rules across fat and shared outputs | E3-01, E1-10 | Codex | 2026-03-12 06:57 ET (Completed) | Done (Locked) | Artifact naming/layout differences are intentional, documented, and snapshot-tested |
| E3-09 | Add staging parity checks for build/package outputs in both modes | E3-08, D3 | Codex | 2026-03-12 07:06 ET (Completed) | Done (Locked) | Staged outputs in fat/shared modes satisfy the same product expectations with locked structural differences |
| E3-10 | Validate MSI behavior for fat vs shared builds, including payload presence and launch success after install | E3-09, D4 | Codex | 2026-03-12 07:31 ET (Completed) | Done (Locked) | Installer outputs remain runnable post-install for both modes and fixtures validate payload correctness |
| E3-11 | Lock upgrade/repair/uninstall parity expectations for shared-library apps vs fat apps | E3-10 | Codex | 2026-03-12 07:44 ET (Completed) | Done (Locked) | Lifecycle semantics are documented and validated for both output modes |

## Workstream D: CI + Regression Gates

| ID | Task | Depends On | Owner | Target | Status | Exit Condition |
|---|---|---|---|---|---|---|
| E3-12 | Add parity CI suite that runs matched fat/shared fixture corpus | E3-04, E3-05, E3-09 | Codex | 2026-03-12 08:12 ET (Completed) | Done (Locked) | CI catches behavioral or artifact drift between output modes automatically |
| E3-13 | Add regression snapshots for supported artifact/layout differences and unsupported-difference diagnostics | E3-08, E3-12 | Codex | 2026-03-12 08:17 ET (Completed) | Done (Locked) | Snapshot coverage locks both expected parity and intentional non-parity presentation |
| E3-14 | Expand Windows validation matrix for fat/shared/package/install combinations | E3-10, D5 | Codex | 2026-03-12 08:23 ET (Completed) | Done (Locked) | Matrix documents and validates supported combinations across toolchain/install environments |

## Workstream E: Docs + Closure

| ID | Task | Depends On | Owner | Target | Status | Exit Condition |
|---|---|---|---|---|---|---|
| E3-15 | Publish fat-vs-shared parity guide and support matrix | E3-01, E3-07, E3-11 | Codex | 2026-03-12 08:37 ET (Completed) | Done (Locked) | Docs explain when to use each mode, expected differences, and locked parity guarantees |
| E3-16 | Publish E3 closure checklist and evidence index | E3-12, E3-13, E3-14, E3-15 | Codex | 2026-03-12 08:40 ET (Completed) | Done (Locked) | Closure docs enumerate required parity evidence and supported environment matrix |
| E3-17 | Run E3 closure verification and roadmap lock | E3-16 | Codex | 2026-03-12 08:48 ET (Completed) | Done (Locked) | E3 tasks/gates are `Done (Locked)` and roadmap references the locked parity baseline |

## E3 Gates

| Gate | Definition | Status |
|---|---|---|
| E3-G1 | Fat/shared behavior parity correctness | Done (Locked) |
| E3-G2 | Fat/shared failure-path parity correctness | Done (Locked) |
| E3-G3 | Artifact/staging parity correctness | Done (Locked) |
| E3-G4 | Packaging/install parity correctness | Done (Locked) |
| E3-G5 | CI/matrix regression coverage | Done (Locked) |
| E3-G6 | Docs + closure artifact completeness | Done (Locked) |

## Required Test/Evidence Gates

| Gate ID | Gate | Command / Evidence | Status |
|---|---|---|---|
| E3-G1 | Fat/shared behavior parity correctness | matched fixture corpus with side-by-side output assertions in both modes | Done (Locked) |
| E3-G2 | Fat/shared failure-path parity correctness | mode-paired failure fixtures and deterministic diagnostics/exit checks | Done (Locked) |
| E3-G3 | Artifact/staging parity correctness | snapshot tests for fat/shared build and staging outputs | Done (Locked) |
| E3-G4 | Packaging/install parity correctness | MSI/install validation for both output modes, including launch after install | Done (Locked) |
| E3-G5 | CI/matrix regression coverage | parity CI suite + Windows validation matrix for fat/shared/package combinations | Done (Locked) |
| E3-G6 | Docs + closure artifact completeness | parity guide + support matrix + closure checklist + evidence index | Done (Locked) |

## Suggested First 2 Sprints

### Sprint 1 (Behavior + Artifact Parity Baseline)
- Target tasks: `E3-01`..`E3-09`
- Focus: define the support matrix and prove the same fixture corpus behaves consistently in fat and shared modes
- Exit checks:
  - `E3-G1`..`E3-G3` green at baseline level
  - staged artifacts for both modes are deterministic and documented

### Sprint 2 (Packaging + Closure Hardening)
- Target tasks: `E3-10`..`E3-17`
- Focus: lock packaging/install parity, CI coverage, matrix validation, and closure docs
- Exit checks:
  - `E3-G4`..`E3-G6` green
  - fat and shared builds are both validated as publishable product modes

## Exit Criteria

| Milestone | Exit Criteria |
|---|---|
| E3 | Tasks `E3-01`..`E3-17` and gates `E3-G1`..`E3-G6` are all `Done (Locked)` |
| E3 Deliverable | Fat and shared native output modes are parity-locked for supported behavior, packaging, and installation flows |
