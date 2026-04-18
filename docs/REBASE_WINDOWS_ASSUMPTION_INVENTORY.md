# Windows-Coupled Assumption Inventory

This document is the source-of-truth inventory for `RB-01` on [REBASE_TAKS_BOARD.md](/D:/Programming/codex/PulseCode/docs/REBASE_TAKS_BOARD.md).

It records the currently live places where PulseCode still assumes Windows-native output as the default backend reality.

Architectural classification now lives in:

- [REBASE_WINDOWS_ASSUMPTION_CLASSIFICATION.md](/D:/Programming/codex/PulseCode/docs/REBASE_WINDOWS_ASSUMPTION_CLASSIFICATION.md)

## Audit Scope

This inventory covers the live surfaces named by `RB-01`:

- CLI target and command surfaces
- project scaffold templates
- manifest and build-config validation
- backend planning and artifact topology
- runtime emission and startup/runtime ABI assumptions
- toolchain and linker discovery
- packaging, installer, and signing contracts
- live docs and validation locks that currently freeze the Windows-shaped story

Historical milestone docs are only included when they still lock or materially shape current behavior.

## Inventory Summary

- CLI and manifest surface: 7 entries
- backend planning and artifact topology: 6 entries
- runtime emission and startup/runtime ABI: 5 entries
- toolchain and linker discovery: 4 entries
- packaging, installer, and signing surface: 5 entries
- docs and validation locks: 4 entries

Total inventoried Windows-coupled assumptions: 31

## CLI and Manifest Surface

| ID | Current assumption | Evidence | Why it matters for the rebase |
|---|---|---|---|
| WIN-CLI-01 | The CLI accepts exactly one target value: `native-x64`. | `crates/pulsec-cli/src/cli/command_line.rs`<br>`crates/pulsec-cli/src/cli/output.rs`<br>`docs/CLI_COMMAND_CONTRACT.md`<br>`docs/D_CLI_UX_GUIDE.md` | The command surface still models target selection as a single Windows-native value instead of an adapter taxonomy. |
| WIN-CLI-02 | CLI help and usage text present `--linker` and `--assembler` as normal build/package surface area for the current Windows-native lane. | `crates/pulsec-cli/src/cli/output.rs`<br>`docs/CLI_COMMAND_CONTRACT.md`<br>`docs/D_CLI_UX_GUIDE.md` | Adapter-specific Windows bootstrap tool overrides are still exposed as default top-level CLI surface instead of explicit adapter-scoped controls. |
| WIN-CLI-03 | CLI help and usage text present `--wix`, `--signtool`, and `--msi` as normal build/package surface area. | `crates/pulsec-cli/src/cli/output.rs`<br>`docs/CLI_COMMAND_CONTRACT.md`<br>`docs/D_CLI_UX_GUIDE.md` | The user-facing command contract still presents Windows installer/signing productization controls as normal workflow rather than frozen or demoted scope. |
| WIN-SCF-01 | `pulsec new` scaffolds a manifest that hard-codes `target = "native-x64"`. | `crates/pulsec-cli/src/cli/project/mod.rs` | New projects currently reseed the old single-target model even if later CLI/manifest validation is rebased. |
| WIN-SCF-02 | `pulsec new` scaffolds Windows-shaped package metadata defaults such as `install_scope = "per-user"` and `signing_mode = "unsigned"`. | `crates/pulsec-cli/src/cli/project/mod.rs` | New projects currently reseed the old Windows packaging/productization lane even if target selection is rebased correctly. |
| WIN-CFG-01 | Build invocation resolution defaults the target to `native-x64` when the user does not specify one. | `crates/pulsec-cli/src/cli/config/mod.rs` | The default execution lane is still one hard-coded Windows target rather than an explicit bootstrap adapter choice. |
| WIN-MAN-01 | Manifest schema and validation require `[build].target = "native-x64"` when present. | `crates/pulsec-cli/src/cli/manifest/mod.rs`<br>`docs/PULSEC_MANIFEST_V1.md` | The manifest contract still encodes one meaningful target instead of a rebased target taxonomy. |

## Backend Planning and Artifact Topology

| ID | Current assumption | Evidence | Why it matters for the rebase |
|---|---|---|---|
| WIN-PLAN-01 | The default backend contract is hard-coded to `x86_64-pc-windows-msvc`, `coff`, and `system`. | `crates/pulsec-cli/src/backend/support/policy_support.rs`<br>`docs/NATIVE_BACKEND_CONTRACT.md` | Target triple, object format, and calling convention are still a Windows/MSVC default contract instead of adapter-selected data. |
| WIN-PLAN-02 | The native plan/output topology only models `.exe`, `.dll`, and `.lib` artifacts. | `crates/pulsec-cli/src/backend/analysis/plan_rendering.rs`<br>`crates/pulsec-cli/src/cli/build/mod.rs`<br>`docs/CLI_COMMAND_CONTRACT.md` | Published artifact families still assume PE executable and DLL/import-library output as the universal native story. |
| WIN-PLAN-03 | Shared-mode runtime lookup metadata assumes neighbor DLL loading from `bin/` and `lib/`. | `crates/pulsec-cli/src/backend/analysis/plan_rendering.rs`<br>`docs/CLI_COMMAND_CONTRACT.md`<br>`docs/E1_SHARED_BUILD_GUIDE.md` | The loader/publication contract is still based on Windows shared-library layout conventions. |
| WIN-PLAN-04 | Link-plan rendering hard-codes `kernel32.lib` as a system input. | `crates/pulsec-cli/src/backend/analysis/plan_rendering.rs` | Core backend planning still assumes Windows system libraries below the target-neutral layer. |
| WIN-PLAN-05 | Shared runtime artifact naming is hard-coded to `pulsecore-<version>.dll` and `pulsecore-<version>.lib`. | `crates/pulsec-cli/src/backend/analysis/plan_rendering.rs`<br>`docs/PULSEC_MANIFEST_V1.md` | The strategic shared/runtime artifact family is still expressed in Windows-native terms. |
| WIN-PLAN-06 | Build/publication logs and artifact summaries still describe the build result as native artifacts rooted in one Windows-native lane. | `crates/pulsec-cli/src/cli/build/mod.rs`<br>`crates/pulsec-cli/tests/stage_locks_d.rs` | The published build surface still reinforces one implicit Windows-native backend story. |

## Runtime Emission and Startup / ABI Surface

| ID | Current assumption | Evidence | Why it matters for the rebase |
|---|---|---|---|
| WIN-RT-01 | Generated program/runtime assembly imports Windows console/process/time/heap procedures directly. | `crates/pulsec-cli/src/backend/emission/program_emitters.rs`<br>`crates/pulsec-cli/src/backend/emission/runtime_emitters.rs` | Adapter-specific service glue is still embedded directly in emitted runtime/program code. |
| WIN-RT-02 | Runtime shims call `GetStdHandle`, `WriteFile`, and `ExitProcess` for console output and fatal exit behavior. | `crates/pulsec-cli/src/backend/emission/runtime_emitters.rs` | Console, panic, and exit behavior are still hard-bound to Windows APIs instead of an explicit runtime service boundary. |
| WIN-RT-03 | Runtime allocation and reclamation use `GetProcessHeap` plus `HeapAlloc` / `HeapFree`. | `crates/pulsec-cli/src/backend/emission/runtime_emitters.rs`<br>`docs/RUNTIME_INTRINSICS_ABI.md`<br>`docs/C2_MEMORY_ARC.md` | Memory ownership/runtime allocation is still implemented in Windows process-heap terms. |
| WIN-RT-04 | Runtime-backed time/process startup docs and plans still use `GetSystemTimeAsFileTime`, `mainCRTStartup`, and `ExitProcess`. | `crates/pulsec-cli/src/backend/emission/program_emitters.rs`<br>`crates/pulsec-cli/src/backend/analysis/plan_rendering.rs`<br>`docs/CLI_COMMAND_CONTRACT.md`<br>`docs/E2_RUNTIME_BOUNDARY_GUIDE.md` | The startup and lifecycle contract is still Windows CRT/process-model shaped. |
| WIN-RT-05 | The runtime ABI docs still name the target as `x86_64-pc-windows-msvc` with Win64 system ABI assumptions. | `docs/RUNTIME_INTRINSICS_ABI.md`<br>`docs/C2_TASK_BOARD.md`<br>`docs/C3_TASK_BOARD.md` | The documented runtime ABI boundary is still Windows-specific, which blocks a truthful PulseOS-first target contract. |

## Toolchain and Linker Discovery

| ID | Current assumption | Evidence | Why it matters for the rebase |
|---|---|---|---|
| WIN-TC-01 | Assembler discovery searches for `ml64.exe` beside the linker, via `PULSEC_LINKER`, via discovered Visual Studio toolchains, and via ambient `ml64.exe`. | `crates/pulsec-cli/src/backend/support/toolchain_linking.rs`<br>`crates/pulsec-cli/src/backend/emission/program_emitters.rs`<br>`crates/pulsec-cli/src/backend/emission/runtime_emitters.rs` | The assembler contract is still MASM-specific and Windows-host-specific. |
| WIN-TC-02 | Linker discovery searches for `link.exe`, `lld-link.exe`, and Visual Studio install roots under `C:\\Program Files\\Microsoft Visual Studio`. | `crates/pulsec-cli/src/backend/support/toolchain_linking.rs` | The linker discovery policy is still entirely Windows/MSVC shaped. |
| WIN-TC-03 | System library discovery searches Windows Kits for `kernel32.lib`. | `crates/pulsec-cli/src/backend/support/toolchain_linking.rs` | The current system import contract assumes Windows SDK layout and Windows base libraries. |
| WIN-TC-04 | Link invocations use MSVC-style flags such as `/MACHINE:X64`, `/SUBSYSTEM:CONSOLE`, `/ENTRY:mainCRTStartup`, `/DLL`, and `/IMPLIB:` while producing `main.exe`. | `crates/pulsec-cli/src/backend/support/toolchain_linking.rs` | The live linker boundary is still a direct MSVC/PE invocation contract rather than an adapter seam. |

## Packaging, Installer, and Signing Surface

| ID | Current assumption | Evidence | Why it matters for the rebase |
|---|---|---|---|
| WIN-PKG-01 | Packaging keeps MSI as a first-class build/package mode. | `crates/pulsec-cli/src/cli/package/mod.rs`<br>`docs/CLI_COMMAND_CONTRACT.md`<br>`docs/PACKAGING_PIPELINE_CONTRACT.md` | The packaging surface still treats Windows installer generation as part of the normal strategic pipeline. |
| WIN-PKG-02 | WiX is the locked MSI backend, with discovery focused on `ProgramFiles` and `wix.exe` / `wix`. | `crates/pulsec-cli/src/cli/package/mod.rs`<br>`docs/PACKAGING_PIPELINE_CONTRACT.md`<br>`docs/WINDOWS_TOOLCHAIN_MATRIX.md` | The installer backend contract is explicitly Windows-specific and still first-class in current packaging flow. |
| WIN-PKG-03 | Release signing assumes `signtool.exe` semantics and Windows-style signing workflows. | `crates/pulsec-cli/src/cli/package/mod.rs`<br>`docs/PACKAGING_PIPELINE_CONTRACT.md` | The release-signing pipeline is still anchored to a Windows tool and Windows artifact types. |
| WIN-PKG-04 | MSI template generation hard-codes WiX XML plus Windows install roots, shortcuts, and registry ownership (`ProgramFiles64Folder`, `LocalAppDataFolder`, `ProgramMenuFolder`, `DesktopFolder`, `HKLM`, `HKCU`). | `crates/pulsec-cli/src/cli/package/mod.rs`<br>`docs/PACKAGING_PIPELINE_CONTRACT.md` | Installer layout and lifecycle semantics are still expressed entirely in Windows deployment terms. |
| WIN-PKG-05 | MSI payload rules assume a staged executable in `bin/` and library payloads limited to `.dll` / `.lib`. | `crates/pulsec-cli/src/cli/package/mod.rs`<br>`docs/PACKAGING_PIPELINE_CONTRACT.md` | Package publication still assumes Windows executable and import-library payload families. |

## Live Docs and Validation Locks

| ID | Current assumption | Evidence | Why it matters for the rebase |
|---|---|---|---|
| WIN-DOC-01 | The Windows toolchain matrix still declares Windows x64 + MSVC + WiX v6 + SignTool as the supported host baseline. | `docs/WINDOWS_TOOLCHAIN_MATRIX.md` | The live environment/support doc still describes the Windows lane as the main supported product toolchain. |
| WIN-DOC-02 | Phase D/E docs and closure contracts still lock Windows packaging and shared-library productization deliverables. | `docs/D_TASK_BOARD.md`<br>`docs/D_CLOSURE_CHECKLIST.md`<br>`docs/E1_TASK_BOARD.md`<br>`docs/E3_TASK_BOARD.md` | These docs still shape expectations around Windows product output even after the strategic pivot. |
| WIN-DOC-03 | User-facing manifest examples still teach `native-x64`, WiX, and SignTool as the normal example path. | `docs/PULSEC_MANIFEST_EXAMPLES.md` | Even if code and schema are rebased, stale example docs will keep onboarding users and future agents into the old Windows-first model. |
| WIN-TEST-01 | Lock tests and fixture tests still freeze `native-x64`, `.exe` / `.dll` / `.lib`, `mainCRTStartup -> ... -> ExitProcess`, and WiX/MSI behavior as current truth. | `crates/pulsec-cli/tests/stage_locks_d.rs`<br>`crates/pulsec-cli/tests/fixture_projects.rs`<br>`crates/pulsec-cli/tests/packaging_regressions.rs`<br>`crates/pulsec-cli/tests/stage_locks_c2.rs`<br>`crates/pulsec-cli/tests/stage_locks_c3.rs` | Rebase work must update or re-home these locks deliberately; otherwise the old Windows-native assumptions remain test-enforced. |

## Notes For Follow-On Work

This inventory now has a published classification matrix at:

- [REBASE_WINDOWS_ASSUMPTION_CLASSIFICATION.md](/D:/Programming/codex/PulseCode/docs/REBASE_WINDOWS_ASSUMPTION_CLASSIFICATION.md)

`RB-03` and later tasks should use this inventory plus that classification matrix as working input rather than starting a fresh audit.
