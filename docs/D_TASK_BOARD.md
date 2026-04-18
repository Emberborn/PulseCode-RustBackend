# Phase D Task Board: Historical Toolchain UX + Packaging Archive

Status legend: `Todo`, `In Progress`, `Blocked`, `Done (Locked)`.

## Historical Archive Notice

This board is retained as a historical record of the original pre-rebase Phase D closure, not as live scope.

Current truth:

- `adenc package` is removed
- compiler-owned MSI/WiX/SignTool/install/signing workflows are removed
- old packaging rows below are superseded by [COMPILER_PACKAGING_REMOVAL.md](/D:/Programming/codex/Aden Lang/docs/COMPILER_PACKAGING_REMOVAL.md)
- the active board is [REBASE_TAKS_BOARD.md](/D:/Programming/codex/Aden Lang/docs/REBASE_TAKS_BOARD.md), and `F1_TASK_BOARD` remains paused until rebase closure
- this document should not be used as the live source of truth for current CLI, manifest, validation, or Windows-scope policy

## Scope
Phase D records the original pre-rebase plan that turned Aden Lang toward a usable product toolchain. The CLI/manifest/build/test pieces remain historically relevant, but the packaging/MSI/signing scope below is superseded and no longer part of current compiler scope.

## D Strict Done Policy
- Phase D is productization work, not just feature spikes.
- `Done (Locked)` means command UX, manifest/project behavior, emitted artifacts, diagnostics, and docs are all stabilized with tests.
- Any task that changes CLI output or manifest schema required deterministic fixture coverage in the historical Phase D plan.
- Packaging/install artifact expectations below are archived only and no longer define current compiler requirements.

## Workstream A: CLI Command Surface

| ID | Task | Depends On | Owner | Target | Status | Exit Condition |
|---|---|---|---|---|---|---|
| D1-01 | Lock top-level CLI command contract (`new`, `check`, `build`, `test`, `package`, `help`, `version`) and exit-code policy | C2, C3 | Codex | 2026-03-10 19:05 ET (Completed) | Done (Locked) | Command set, flag naming, exit-code semantics, and human-readable help text are documented and snapshot-tested |
| D1-02 | Implement `adenc new` project scaffolding flow with starter templates and deterministic file layout | D1-01 | Codex | 2026-03-10 19:36 ET (Completed) | Done (Locked) | New-app/library templates generate valid projects with reproducible contents and fixture assertions |
| D1-03 | Unify `adenc check` project-mode UX (entry discovery, manifest-aware source roots, diagnostics summary, strict/friendly modes) | D1-01, D2-01 | Codex | 2026-03-10 20:02 ET (Completed) | Done (Locked) | `check` works cleanly for manifest projects and has deterministic CLI output across success/failure paths |
| D1-04 | Unify `adenc build` project-mode UX (debug/release/profile selection, output dirs, status reporting, artifact summary) | D1-01, D2-01 | Codex | 2026-03-10 20:16 ET (Completed) | Done (Locked) | Build modes are manifest-driven, artifact locations are stable, and summary/status output is snapshot-locked |
| D1-05 | Add `adenc test` command baseline for project fixtures/unit-style test discovery and execution reporting | D1-01, D2-01 | Codex | 2026-03-10 20:39 ET (Completed) | Done (Locked) | Test projects can be discovered/run from CLI with deterministic pass/fail summaries and exit behavior |
| D1-06 | Add `adenc package` command baseline and align `build --msi`/package UX to one stable packaging entrypoint | D1-01, D4-01 | Codex | 2026-03-10 21:05 ET (Completed) | Done (Locked) | Packaging commands are coherent, non-duplicative, and artifact/report output is deterministic |
| D1-07 | Lock CLI diagnostics/UX polish layer (colorless baseline, error formatting, actionable next steps, machine-readable future hooks) | D1-03, D1-04, D1-05 | Codex | 2026-03-10 21:24 ET (Completed) | Done (Locked) | Core commands emit stable, readable, non-ambiguous UX across happy/failure paths and snapshots cover representative flows |

## Workstream B: Project Format + Manifest Model

| ID | Task | Depends On | Owner | Target | Status | Exit Condition |
|---|---|---|---|---|---|---|
| D2-01 | Define and lock `adenc.toml` manifest schema v1 (`package`, `version`, `sources`, `build`, `toolchain`, `package.metadata`) | D1-01 | Codex | 2026-03-10 21:51 ET (Completed) | Done (Locked) | Manifest schema is documented with examples and parser/validation tests lock accepted/rejected forms |
| D2-02 | Implement manifest loader, validation, and normalized project model in CLI | D2-01 | Codex | 2026-03-10 22:28 ET (Completed) | Done (Locked) | CLI resolves manifest data into a stable internal project model with deterministic diagnostics on invalid configs |
| D2-03 | Add project layout conventions (`src`, `tests`, `stdlib opt-in`, build dir, package assets`) with override support | D2-01, D2-02 | Codex | 2026-03-10 22:28 ET (Completed) | Done (Locked) | Default layouts work out-of-box, overrides are validated, and fixtures cover both default and custom layouts |
| D2-04 | Lock target/profile configuration model (debug/release, linker/tool overrides, packaging mode, runtime toggles) | D2-02 | Codex | 2026-03-10 23:04 ET (Completed) | Done (Locked) | Profiles/targets are schema-validated, surfaced in build plans, and exercised by fixture builds |
| D2-05 | Add project metadata required for packaging (`name`, `publisher`, `identifier`, `install scope`, `entrypoints`, `icons/assets`) | D2-01, D4-01 | Codex | 2026-03-10 23:32 ET (Completed) | Done (Locked) | Packaging-required metadata is validated before MSI generation and failure diagnostics are deterministic |
| D2-06 | Add workspace/multi-package manifest baseline for future ecosystem growth | D2-02 | Codex | 2026-03-10 23:58 ET (Completed) | Done (Locked) | Workspace root + member resolution works for `check/build/test/package` and fixture projects prove stable behavior |
| D2-07 | Publish manifest reference docs and example project matrix | D2-01, D2-06 | Codex | 2026-03-11 00:18 ET (Completed) | Done (Locked) | `adenc.toml` reference and sample manifests are complete, cross-linked, and aligned with tests |

## Workstream C: Build/Test/Product Lifecycle Integration

| ID | Task | Depends On | Owner | Target | Status | Exit Condition |
|---|---|---|---|---|---|---|
| D3-01 | Define packaging pipeline contract from manifest project -> built binaries -> staged package inputs -> MSI | D1-04, D2-05 | Codex | 2026-03-11 00:41 ET (Completed) | Done (Locked) | End-to-end packaging stages, intermediate artifacts, and failure boundaries are documented and reflected in CLI behavior |
| D3-02 | Implement deterministic staging directory layout for package-ready outputs | D3-01 | Codex | 2026-03-11 01:24 ET (Completed) | Done (Locked) | Staging outputs have stable folder/file structure and snapshot coverage for app + library style projects |
| D3-03 | Add asset embedding/copy pipeline (icons, license, readme, config/data payloads) | D2-05, D3-02 | Codex | 2026-03-11 01:56 ET (Completed) | Done (Locked) | Assets declared in manifest are validated, staged deterministically, and tested for missing/conflicting cases |
| D3-04 | Add project test-fixture conventions so `adenc test` and packaging gates can reuse the same project corpus | D1-05, D2-03 | Codex | 2026-03-11 02:22 ET (Completed) | Done (Locked) | Fixture conventions are standardized and reused by CLI integration tests across commands |
| D3-05 | Lock reproducible artifact naming/version stamping rules across build/package outputs | D1-04, D2-01, D3-02 | Codex | 2026-03-11 04:13 ET (Completed) | Done (Locked) | Output naming/versioning is deterministic and verified in artifact snapshot tests |

## Workstream D: MSI Generation + Installer Semantics

| ID | Task | Depends On | Owner | Target | Status | Exit Condition |
|---|---|---|---|---|---|---|
| D4-01 | Select and lock MSI authoring strategy/tool boundary (WiX or equivalent), template model, and versioning contract | D3-01 | Codex | 2026-03-11 04:35 ET (Completed) | Done (Locked) | MSI backend choice and template/versioning policy are documented with deterministic invocation contract |
| D4-02 | Implement MSI manifest-to-template translation for app metadata, install dirs, shortcuts, and entrypoints | D4-01, D2-05 | Codex | 2026-03-11 04:55 ET (Completed) | Done (Locked) | Manifest metadata produces stable installer definitions and fixture tests validate generated installer inputs |
| D4-03 | Implement `adenc package --msi` / `adenc build --msi` artifact generation path | D4-01, D4-02 | Codex | 2026-03-11 05:06 ET (Completed) | Done (Locked) | CLI produces MSI artifacts or deterministic failure reports, with artifact presence/schema validated in tests |
| D4-04 | Lock install/uninstall/upgrade semantics (per-user vs per-machine, version upgrades, product codes, side-by-side policy) | D4-02 | Codex | 2026-03-11 05:28 ET (Completed) | Done (Locked) | Installer lifecycle behavior is documented, encoded in metadata generation, and covered by fixture/matrix validation |
| D4-05 | Add installer validation suite (silent install, uninstall, repair/upgrade where feasible, file placement checks) | D4-03, D4-04 | Codex | 2026-03-11 05:54 ET (Completed) | Done (Locked) | Automated validation proves MSI outputs install and uninstall predictably on supported Windows setups |
| D4-06 | Add signed-build pipeline hooks for release packaging (certificate/config placeholders, unsigned fallback policy) | D4-03 | Codex | 2026-03-11 08:05 ET (Completed) | Done (Locked) | Release packaging can optionally sign outputs, unsigned behavior is explicit, and diagnostics are deterministic |

## Workstream E: Toolchain Matrix, Docs, and Release Gates

| ID | Task | Depends On | Owner | Target | Status | Exit Condition |
|---|---|---|---|---|---|---|
| D5-01 | Expand Windows toolchain matrix to include packaging prerequisites and supported environments | D4-01 | Codex | 2026-03-11 08:18 ET (Completed) | Done (Locked) | Matrix doc covers compiler/linker/MSI tool prerequisites and validated environment variants |
| D5-02 | Add CLI integration suite for `new/check/build/test/package` on real fixture projects | D1-02, D1-03, D1-04, D1-05, D1-06 | Codex | 2026-03-11 08:32 ET (Completed) | Done (Locked) | Full command lifecycle is exercised on representative projects with deterministic outputs |
| D5-03 | Add packaging regression suite for MSI/staging artifact snapshots and failure-path diagnostics | D4-03, D4-05 | Codex | 2026-03-11 08:44 ET (Completed) | Done (Locked) | Packaging regressions are caught by snapshot/integration tests across success and expected-failure cases |
| D5-04 | Publish Phase D closure artifacts (`D_CLOSURE_CHECKLIST.md`, packaging evidence index, manifest spec, CLI UX guide) | D2-07, D5-01, D5-02, D5-03 | Codex | 2026-03-11 08:57 ET (Completed) | Done (Locked) | Closure docs are complete, cross-linked, and aligned with the locked command/package surface |
| D5-05 | Run Phase D closure verification (`phase_d` suite + full workspace tests + packaging matrix spot checks) and roadmap lock | D5-04 | Codex | 2026-03-11 09:03 ET (Completed) | Done (Locked) | All Phase D tasks/gates are `Done (Locked)` and roadmap references updated |

## D Gates

| Gate | Definition | Status |
|---|---|---|
| D-G1 | CLI contract stability | Done (Locked) |
| D-G2 | Manifest/project-model correctness | Done (Locked) |
| D-G3 | Build/test/package lifecycle coherence | Done (Locked) |
| D-G4 | MSI generation correctness | Done (Locked) |
| D-G5 | Installer lifecycle correctness | Done (Locked) |
| D-G6 | Packaging toolchain/environment coverage | Done (Locked) |
| D-G7 | Release/signing readiness | Done (Locked) |
| D-G8 | Docs + closure artifact completeness | Done (Locked) |

## Required Test/Evidence Gates

| Gate ID | Gate | Command / Evidence | Status |
|---|---|---|---|
| D-G1 | CLI contract stability | command help/output snapshots for `new/check/build/test/package` | Done (Locked) |
| D-G2 | Manifest/project-model correctness | manifest parser/validator tests + project-layout fixtures | Done (Locked) |
| D-G3 | Build/test/package lifecycle coherence | real project integration suite covering scaffold -> check -> build -> test -> package | Done (Locked) |
| D-G4 | MSI generation correctness | MSI/staging artifact generation tests + schema/template assertions | Done (Locked) |
| D-G5 | Installer lifecycle correctness | install/uninstall/upgrade validation on supported Windows setups | Done (Locked) |
| D-G6 | Packaging toolchain/environment coverage | updated Windows matrix doc + validated prerequisite combinations | Done (Locked) |
| D-G7 | Release/signing readiness | signed/unsigned packaging path tests and documented release policy | Done (Locked) |
| D-G8 | Docs + closure artifact completeness | manifest spec + CLI UX guide + closure checklist + evidence index | Done (Locked) |

## Suggested First 3 Sprints

### Sprint 1 (CLI + Manifest Foundation)
- Target tasks: `D1-01`..`D1-04`, `D2-01`..`D2-03`
- Focus: lock command surface, implement `adenc.toml`, and make project-mode `check/build` first-class
- Exit checks:
  - `D-G1` and `D-G2` green at baseline level
  - `adenc new` generates a project that `adenc check` and `adenc build` can run without manual setup

### Sprint 2 (Test + Packaging Pipeline Foundation)
- Target tasks: `D1-05`, `D1-06`, `D2-04`, `D2-05`, `D3-01`..`D3-05`, `D4-01`, `D4-02`
- Focus: complete project lifecycle and lock the packaging pipeline shape before MSI execution hardening
- Exit checks:
  - `D-G3` green at baseline level
  - package staging and manifest-driven metadata emission are deterministic

### Sprint 3 (MSI + Closure Hardening)
- Target tasks: `D4-03`..`D4-06`, `D5-01`..`D5-05`
- Focus: make installer output real, validate lifecycle behavior, and publish closure evidence
- Exit checks:
  - `D-G4`..`D-G8` green
  - `adenc build --msi` and/or `adenc package --msi` produce validated installable artifacts on supported Windows toolchains

## Exit Criteria

| Milestone | Exit Criteria |
|---|---|
| Phase D | Tasks `D1-01`..`D5-05` and gates `D-G1`..`D-G8` are all `Done (Locked)` |
| Phase D Deliverable | `adenc build --msi` produces an installable Windows artifact from a manifest-driven Aden Lang project |
| Phase E Entry | Phase D exit criteria complete and Phase D toolchain/package UX is documented, tested, and reproducible |
