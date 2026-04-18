# Windows Toolchain Matrix (`RB-09` / `RB-17.1` / `RB-19`)

Purpose:

- lock the retained Windows x64 host/bootstrap adapter support matrix for native build and shared-library build
- separate what is fully validated on a real Windows adapter host from what is contract-supported but not yet broadly matrix-tested
- preserve Windows x64 target/host evidence without treating it as the whole project support baseline

Primary references:

- [CLI_COMMAND_CONTRACT.md](/D:/Programming/codex/Aden Lang/docs/CLI_COMMAND_CONTRACT.md)
- [WINDOWS_X64_ADAPTER_SCOPE.md](/D:/Programming/codex/Aden Lang/docs/WINDOWS_X64_ADAPTER_SCOPE.md)
- [COMPILER_PACKAGING_REMOVAL.md](/D:/Programming/codex/Aden Lang/docs/COMPILER_PACKAGING_REMOVAL.md)
- [WINDOWS_X64_SCOPE_FREEZE_POLICY.md](/D:/Programming/codex/Aden Lang/docs/WINDOWS_X64_SCOPE_FREEZE_POLICY.md)

Rebase note (`RB-09`):

- this document is adapter support evidence
- it is not the top-level project support matrix for Aden Lang as a whole

Rebase note (`RB-17.1`):

- compiler-owned packaging/install generation is removed
- MSI/WiX/SignTool/install lifecycle rows are intentionally gone from the retained compiler matrix

Rebase note (`RB-19`):

- this matrix does not authorize new Windows-only compiler scope
- the only retained Windows-only top-level CLI controls are `--linker` and `--assembler`
- installer/signing/productization surface remains frozen out of `adenc`

## Retained Windows Adapter Support Baseline

- OS:
  - Windows x64
- compiler/linker family:
  - MSVC / COFF (`link.exe`)
- assembler family:
  - MASM (`ml64.exe`)

Current validated host used for lock work:

- Windows x64

## Tool Resolution Contract

These resolution rules are Windows x64 adapter support rules, not target-neutral compiler guarantees.

### Native Linker

Resolution precedence:

- CLI override: `--linker <path>`
- env override: `PULSEC_LINKER`
- host discovery

Required for:

- real `.exe` generation
- real shared `.dll` + import `.lib` generation

### Native Assembler

Resolution precedence:

- linker-adjacent discovery from explicit `--linker <path>`
- linker-adjacent discovery from `PULSEC_LINKER`
- linker-adjacent discovery from host linker candidates
- ambient `ml64.exe`

Required for:

- split MASM object generation
- real fat-mode native builds on the current backend
- real shared-mode native builds (`.exe` + `.dll` + `.lib`)

## Native Build Prerequisite Matrix

| Capability | Required tools | Hard requirement | Output when missing |
|---|---|---|---|
| IR/object/native plan emission | none beyond `adenc` toolchain itself | yes | build fails only on compiler/backend errors |
| Native fat `.exe` build | `ml64.exe` + `link.exe` | yes for real exe | build fails deterministically with backend/link diagnostics |
| Native shared build (`.exe` + `.dll` + `.lib`) | `ml64.exe` + `link.exe` | yes | build fails deterministically with backend/link diagnostics |

## Validated Environment Variants

### Native Build Matrix

Pass criteria:

- `native.link.txt` contains `status=linked`
- produced executable exits with code `0`

| Variant | Setup | Command shape | Validation status |
|---|---|---|---|
| Default linker discovery | Host discovery | `adenc build ...` | Validated |
| Explicit linker CLI override | Explicit `--linker` | `adenc build ... --linker "<vs-linker>"` | Validated |
| PULSEC_LINKER | Env override | `PULSEC_LINKER="<vs-linker>" adenc build ...` | Validated |

### Shared Native Build Matrix

Pass criteria:

- `native.link.txt` contains `status=linked` and `mode=shared`
- produced artifacts include executable, runtime DLL, and import library
- runtime lookup metadata is emitted

| Variant | Setup | Command shape | Validation status |
|---|---|---|---|
| Shared default discovery | Host linker/assembler discovery | `adenc build ... --output-mode shared` | Validated |
| Shared explicit linker override | Explicit `--linker` with adjacent `ml64.exe` | `adenc build ... --output-mode shared --linker "<vs-linker>"` | Validated |
| Shared PULSEC_LINKER | Env override with adjacent `ml64.exe` | `PULSEC_LINKER="<vs-linker>" adenc build ... --output-mode shared` | Contract-validated |

## E3 Fat/Shared Parity Validation Matrix

This section locks the supported Phase E parity combinations across native output mode and profile publication shape.

Validated fat/shared fixture corpus:

- `runtime_mix`
- `object_interface_mix`
- `strict_stress_soak`

Supported parity rule:

- supported programs in the locked fixture corpus must produce the same deterministic runtime output in `fat` and `shared` modes
- differences in artifact layout are allowed only where explicitly documented

| Combination | Fat | Shared | Validation status | Evidence |
|---|---|---|---|---|
| Release native build + launch | Yes | Yes | Validated | side-by-side fixture execution |
| Debug native build + launch | Yes | Yes | Validated | debug/release publication parity locks |
| Release distro publication | Yes | Yes | Validated | artifact layout locks |
| Debug distro publication | Yes | Yes | Validated | artifact layout locks |

Shared-only expected additions:

- runtime DLL in build publication outputs
- import library in build publication outputs
- `launch.txt` lookup metadata for runtime resolution

## Supported vs Contract-only Status

| Area | Status | Notes |
|---|---|---|
| Windows x64 + MSVC native build | Supported and validated | retained immediate target and current host/bootstrap adapter path |
| Windows x64 + MSVC shared native build | Supported and validated | requires `ml64.exe` + `link.exe`; emits `.exe` + `.dll` + `.lib` |
| Non-Windows hosts | Not supported | current retained Windows adapter path is Windows-host-specific |
| Non-MSVC linkers | Not supported | ABI/output contract is locked around COFF/MSVC flow |
| Windows hosts without `ml64.exe` | Not supported for shared mode | current backend requires MASM split object generation |

## Contributor Setup Guidance

Minimum setup for native build work:

- Rust toolchain with `cargo`
- MSVC linker toolchain available to `adenc`
- `ml64.exe` available to `adenc` for supported shared builds
