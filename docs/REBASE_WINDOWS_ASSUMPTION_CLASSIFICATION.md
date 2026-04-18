# Windows-Coupled Assumption Classification Matrix

This document is the source-of-truth classification matrix for `RB-02` on [REBASE_TAKS_BOARD.md](/D:/Programming/codex/PulseCode/docs/REBASE_TAKS_BOARD.md).

It classifies every `WIN-*` entry from [REBASE_WINDOWS_ASSUMPTION_INVENTORY.md](/D:/Programming/codex/PulseCode/docs/REBASE_WINDOWS_ASSUMPTION_INVENTORY.md).

This matrix uses the published inventory as input. It does not start a fresh audit.

## Classification Meanings

- `target-neutral compiler layer`
  - the concern belongs above target-specific backend/runtime adapters
  - the current Windows-shaped assumption should be removed from the general compiler/CLI/manifest/docs surface
- `bootstrap adapter`
  - the concern is a legitimate implementation detail of the retained Windows bootstrap/reference adapter
  - it should stay, but only behind an explicit adapter boundary instead of defining the whole architecture
- `must move behind target adapter`
  - the concern is target-specific and currently leaks into shared planning/runtime/validation surfaces
  - it must become explicit adapter-owned contract or implementation data
- `freeze/defer`
  - the concern is no longer strategic for the PulseOS pivot
  - it should be demoted, fenced, and prevented from continuing to expand by inertia

## Classification Summary

- `target-neutral compiler layer`: 6
- `bootstrap adapter`: 6
- `must move behind target adapter`: 11
- `freeze/defer`: 8

Total classified inventory entries: 31

## Matrix

| ID | Classification | Rationale | Primary follow-up |
|---|---|---|---|
| WIN-CLI-01 | `target-neutral compiler layer` | Target selection is a general compiler/CLI concern and should outlive any one adapter; the one-value `native-x64` contract must be replaced by a real taxonomy. | `RB-03`, `RB-04` |
| WIN-CLI-02 | `bootstrap adapter` | `--linker` and `--assembler` are legitimate controls for the retained Windows bootstrap/reference adapter once they stop reading like universal build surface. | `RB-04`, `RB-09`, `RB-19` |
| WIN-CLI-03 | `freeze/defer` | `--wix`, `--signtool`, and `--msi` belong to the Windows productization lane that should be demoted instead of preserved as normal strategic CLI surface. | `RB-04`, `RB-19`, `RB-20` |
| WIN-SCF-01 | `target-neutral compiler layer` | Default scaffolds should not reseed one adapter choice into every new project. | `RB-03`, `RB-05`, `RB-20` |
| WIN-SCF-02 | `freeze/defer` | Windows packaging/productization defaults in scaffolds should not keep reseeding a frozen lane into every new project. | `RB-19`, `RB-20` |
| WIN-CFG-01 | `target-neutral compiler layer` | Build config defaulting belongs to the general compiler layer and must stop silently selecting the Windows lane. | `RB-03`, `RB-04`, `RB-05` |
| WIN-MAN-01 | `target-neutral compiler layer` | Manifest target vocabulary is a general project/build contract, not a Windows adapter contract. | `RB-03`, `RB-05` |
| WIN-PLAN-01 | `must move behind target adapter` | Target triple, object format, and calling convention are adapter-owned contract data and should not remain hard-coded global defaults. | `RB-06`, `RB-07`, `RB-10` |
| WIN-PLAN-02 | `must move behind target adapter` | Artifact family and file kinds vary by target; the plan should describe them per adapter instead of assuming PE executable/shared-library output. | `RB-06`, `RB-15`, `RB-16` |
| WIN-PLAN-03 | `must move behind target adapter` | Loader/runtime lookup rules and `bin`/`lib` layout are target-specific publication contracts. | `RB-15`, `RB-16`, `RB-17` |
| WIN-PLAN-04 | `must move behind target adapter` | `kernel32.lib` is a Windows system input and should not live in target-neutral plan structures. | `RB-06`, `RB-07`, `RB-10` |
| WIN-PLAN-05 | `must move behind target adapter` | Runtime artifact naming and family should be adapter-owned rather than global strategic truth. | `RB-15`, `RB-16` |
| WIN-PLAN-06 | `target-neutral compiler layer` | Build summaries and publication metadata should report the selected adapter truthfully through a target-neutral surface. | `RB-06`, `RB-18`, `RB-20` |
| WIN-RT-01 | `must move behind target adapter` | Direct Windows procedure imports are adapter glue and must not stay blended into shared runtime/emission logic. | `RB-11`, `RB-13`, `RB-14` |
| WIN-RT-02 | `must move behind target adapter` | Console, panic, and exit service wiring belong to the target runtime-service boundary. | `RB-11`, `RB-12`, `RB-13` |
| WIN-RT-03 | `must move behind target adapter` | Allocation/reclamation hooks belong at the runtime/adapter boundary even if the current Windows implementation remains useful as bootstrap support. | `RB-11`, `RB-12`, `RB-13`, `RB-14` |
| WIN-RT-04 | `must move behind target adapter` | Startup entry, time source, and process shutdown sequence are target startup/lifecycle contracts. | `RB-13`, `RB-15`, `RB-16`, `RB-17` |
| WIN-RT-05 | `must move behind target adapter` | Runtime ABI docs need a portable-vs-adapter split instead of continuing to freeze a Windows ABI as the live baseline. | `RB-11`, `RB-13`, `RB-15`, `RB-16` |
| WIN-TC-01 | `bootstrap adapter` | `ml64.exe` discovery is a legitimate retained detail of the Windows bootstrap/reference adapter once isolated from the general architecture. | `RB-08`, `RB-09`, `RB-19` |
| WIN-TC-02 | `bootstrap adapter` | `link.exe`/`lld-link.exe` and Visual Studio discovery belong to the retained Windows bootstrap adapter, not the global backend design. | `RB-08`, `RB-09`, `RB-19` |
| WIN-TC-03 | `bootstrap adapter` | `kernel32.lib` discovery remains valid as Windows bootstrap-adapter support logic once explicitly fenced there. | `RB-09`, `RB-15`, `RB-19` |
| WIN-TC-04 | `bootstrap adapter` | MSVC/PE linker invocation details are still legitimate for the Windows bootstrap lane if they stop defining the whole backend. | `RB-08`, `RB-09`, `RB-15`, `RB-19` |
| WIN-PKG-01 | `freeze/defer` | MSI should stop behaving like a first-class strategic packaging mode for the PulseOS pivot. | `RB-19`, `RB-20` |
| WIN-PKG-02 | `freeze/defer` | WiX is part of the Windows productization lane that should be demoted and frozen rather than expanded. | `RB-19`, `RB-20` |
| WIN-PKG-03 | `freeze/defer` | SignTool-driven release signing belongs to the Windows productization lane and should not drive near-term architecture work. | `RB-19`, `RB-20` |
| WIN-PKG-04 | `freeze/defer` | MSI template/install/registry semantics are Windows installer concerns, not the strategic PulseOS execution path. | `RB-19`, `RB-20` |
| WIN-PKG-05 | `freeze/defer` | MSI payload rules for `.exe`/`.dll`/`.lib` publication should be fenced as Windows packaging specifics instead of shaping the general publication story. | `RB-19`, `RB-20` |
| WIN-DOC-01 | `bootstrap adapter` | The Windows toolchain matrix remains useful as Windows bootstrap-adapter support documentation once demoted from "supported baseline" status. | `RB-09`, `RB-19`, `RB-20` |
| WIN-DOC-02 | `freeze/defer` | Phase D/E Windows productization closure docs should remain as historical/bootstrap references, not as live strategic direction. | `RB-19`, `RB-20` |
| WIN-DOC-03 | `target-neutral compiler layer` | Default onboarding examples should teach the rebased target model, with Windows-specific examples moved to explicit adapter-specific docs if retained. | `RB-03`, `RB-05`, `RB-20` |
| WIN-TEST-01 | `must move behind target adapter` | Validation has to be split into target-neutral coverage, Windows bootstrap-adapter coverage, and future PulseOS-adapter coverage instead of one blended Windows-native lock surface. | `RB-18`, `RB-19`, `RB-20` |

## Consequences For The Next Tasks

- `RB-03` should consume the `target-neutral compiler layer` rows first and define the explicit target taxonomy/naming policy.
- `RB-04` and `RB-05` should use the same rows to rebase CLI and manifest/config validation.
- `RB-06` through `RB-17` should use the `must move behind target adapter` rows to carve target-specific plan/runtime/startup/artifact contracts out of currently blended Windows assumptions.
- `RB-08`, `RB-09`, and `RB-15` should use the `bootstrap adapter` rows to isolate and freeze the retained Windows bootstrap/reference lane honestly.
- `RB-19` and `RB-20` should use the `freeze/defer` rows to demote Windows productization from live strategic default to explicit frozen scope.
