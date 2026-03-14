# Windows Toolchain Matrix (D5-01)

Date:
- 2026-03-11

Purpose:
- lock the supported Windows host matrix for native build, shared-library build, staged packaging, MSI packaging, and release-signing hooks
- separate what is fully validated on a real host from what is contract-supported but not yet broadly matrix-tested

Primary references:
- `docs/CLI_COMMAND_CONTRACT.md`
- `docs/PACKAGING_PIPELINE_CONTRACT.md`
- `docs/PULSEC_MANIFEST_V1.md`

## Supported Host Baseline

- OS:
  - Windows x64
- compiler/linker family:
  - MSVC / COFF (`link.exe`)
- installer backend:
  - WiX CLI `v6`
- signing hook backend:
  - Microsoft `signtool.exe`
- package/install validation tools:
  - `msiexec.exe`

Current validated host used for lock work:
- Windows x64
- MSVC toolchain path:
  - `C:\Program Files\Microsoft Visual Studio\18\Community\VC\Tools\MSVC\14.50.35717\bin\Hostx64\x64`
- WiX path:
  - `C:\Program Files\WiX Toolset v6.0\bin\wix.exe`

## Tool Resolution Contract

### Native linker

Resolution precedence:
- CLI override: `--linker <path>`
- env override: `PULSEC_LINKER`
- host discovery

Required for:
- real `.exe` generation
- real shared `.dll` + import `.lib` generation
- staged release artifact generation when executable output is expected
- MSI generation indirectly, because MSI packaging requires a real executable payload

### Native assembler

Resolution precedence:
- linker-adjacent discovery from explicit `--linker <path>`
- linker-adjacent discovery from `PULSEC_LINKER`
- linker-adjacent discovery from host linker candidates
- ambient `ml64.exe`

Required for:
- split MASM object generation
- real fat-mode native builds on the current backend
- real shared-mode native builds (`.exe` + `.dll` + import `.lib`)

Shared-mode note:
- shared output currently requires split runtime/app object emission, so `ml64.exe` availability is a hard prerequisite for supported shared builds

### WiX CLI

Resolution precedence:
- CLI override: `--wix <path>`
- manifest override: `[toolchain].wix`
- env override: `PULSEC_WIX_CLI`
- host discovery fallback

Required for:
- `pulsec package --msi`
- `pulsec build --msi`
- MSI validation flows in the D4 real-host suite

Locked version contract:
- WiX `v6`

### SignTool

Resolution precedence:
- CLI override: `--signtool <path>`
- manifest override: `[toolchain].signtool`
- env override: `PULSEC_SIGNTOOL`
- host discovery fallback

Required for:
- optional release signing when `signing_mode = "signtool"`

Not required for:
- unsigned release packaging
- debug packaging

## Packaging Prerequisite Matrix

| Capability | Required tools | Hard requirement | Output when missing |
|---|---|---|---|
| IR/object/native plan emission | none beyond `pulsec` toolchain itself | yes | build fails only on compiler/backend errors |
| Native fat `.exe` build | `ml64.exe` + `link.exe` | yes for real exe | build fails deterministically with backend/link diagnostics |
| Native shared build (`.exe` + `.dll` + `.lib`) | `ml64.exe` + `link.exe` | yes | build fails deterministically with backend/link diagnostics |
| Staged packaging | executable strongly expected; linker needed for real app payload | soft for layout, hard for runnable output | staged tree still materializes, report reflects actual executable presence |
| MSI packaging | `link.exe` + `wix.exe` | yes | deterministic `PULSEC:E_PACKAGE_FAILED` with package report/build log |
| Silent install/uninstall validation | `msiexec.exe` + valid `.msi` | yes for lifecycle tests | validation suite is skipped when tooling unavailable |
| Release signing | `signtool.exe` + signing identity config | optional | package remains explicitly `unsigned` unless SignTool invocation actually runs and succeeds |

## Validated Environment Variants

### Native build matrix

Fixture used:
- `crates/pulsec-cli/tests/fixtures/strict_stress_soak`
- entry:
  - `src/strict_stress_soak/Main.pulse`

Pass criteria:
- `native.link.txt` contains `status=linked`
- produced `main.exe` exits with code `0`
- output is deterministic:
  - `soak_ok`
  - `20145`

| Variant | Setup | Command shape | Validation status |
|---|---|---|---|
| A | Default linker discovery | `pulsec build ...` | Validated |
| B | Explicit linker CLI override | `pulsec build ... --linker "<vs-linker>"` | Validated |
| C | env override | `PULSEC_LINKER="<vs-linker>" pulsec build ...` | Validated |

### Shared native build matrix

Fixtures used:
- `crates/pulsec-cli/tests/fixtures/runtime_mix`
- `crates/pulsec-cli/tests/fixtures/strict_stress_soak`
- `crates/pulsec-cli/tests/fixtures/object_interface_mix`

Pass criteria:
- `native.link.txt` contains `status=linked` and `mode=shared`
- produced artifacts include:
  - `main.exe`
  - `pulsecore-<pulsec-semver>.dll`
  - `pulsecore-<pulsec-semver>.lib`
- shared executable exits with code `0`
- runtime lookup metadata is emitted:
  - build output `bin/launch.txt`
  - staged output `staging/bin/launch.txt`

| Variant | Setup | Command shape | Validation status |
|---|---|---|---|
| S1 | Default linker/assembler discovery | `pulsec build ... --output-mode shared` | Validated |
| S2 | Explicit linker CLI override with adjacent `ml64.exe` | `pulsec build ... --output-mode shared --linker "<vs-linker>"` | Validated |
| S3 | env override with adjacent `ml64.exe` | `PULSEC_LINKER="<vs-linker>" pulsec build ... --output-mode shared` | Contract-validated |

### MSI packaging matrix

Validated on real Windows host:
- WiX `v6` generation path produces real `.msi`
- `wix msi validate` passes
- silent install/uninstall succeeds
- repair succeeds
- same-identity `0.1.0 -> 0.2.0` upgrade succeeds

Validated command paths:
- `pulsec package --msi --wix <path>`
- `pulsec build --msi --wix <path>`

### Release signing matrix

Validated contract paths:
- explicit unsigned release policy:
  - `signing_mode = "unsigned"` -> package succeeds with `signing_status=unsigned`
- explicit SignTool hook:
  - `signing_mode = "signtool"` + `--signtool <path>` + signing identity config -> signing hook executes and package reports `signing_status=signed`

Current validation level:
- fake SignTool lock coverage only
- real certificate-backed signing has not yet been broadly host-matrix validated

## E3 Fat/Shared Parity Validation Matrix

This section locks the supported Phase E parity combinations across native output mode,
profile publication shape, staging, MSI packaging, and installed launch behavior.

Validated fat/shared fixture corpus:
- `runtime_mix`
- `object_interface_mix`
- `strict_stress_soak`

Supported parity rule:
- supported programs in the locked fixture corpus must produce the same deterministic
  runtime output in `fat` and `shared` modes
- differences in artifact layout are allowed only where explicitly documented:
  - fat profile outputs are flat
  - shared profile outputs use `bin/`, `lib/`, and debug-only `metadata/`

| Combination | Fat | Shared | Validation status | Evidence |
|---|---|---|---|---|
| Release native build + launch | Yes | Yes | Validated | side-by-side fixture execution |
| Debug native build + launch | Yes | Yes | Validated | debug/release publication parity locks |
| Release distro publication | Yes | Yes | Validated | artifact layout locks |
| Debug distro publication | Yes | Yes | Validated | artifact layout locks |
| Staged package output | Yes | Yes | Validated | staging parity regressions |
| MSI generation | Yes | Yes | Validated | real WiX generation + template locks |
| MSI install + launch | Yes | Yes | Validated | real-host install validation |
| MSI repair/upgrade/uninstall | Yes | Yes | Validated | lifecycle parity validation |

Shared-only expected additions:
- runtime DLL in staged/package/install payloads
- import library in staged/package build outputs
- `launch.txt` lookup metadata for `../lib` or `../libraries` runtime resolution

Supported non-parity presentation:
- shared-mode missing-runtime diagnostics are explicit and are not expected to match
  fat-mode payload errors byte-for-byte
- shared debug diagnostics are published under `metadata/`, while fat debug diagnostics
  are published at profile root

## Supported vs Contract-only Status

| Area | Status | Notes |
|---|---|---|
| Windows x64 + MSVC native build | Supported and validated | primary contributor path |
| Windows x64 + MSVC shared native build | Supported and validated | requires `ml64.exe` + `link.exe`; emits `.exe` + `.dll` + `.lib` |
| Windows x64 + WiX v6 MSI packaging | Supported and validated | real MSI roundtrip tests exist |
| Windows x64 + unsigned release packaging | Supported and validated | deterministic report/plan artifacts |
| Windows x64 + SignTool hook execution | Supported and contract-validated | fake-tool lock tests cover behavior; real cert provisioning remains environment-specific |
| Non-Windows hosts | Not supported | native backend/installer pipeline are Windows-specific in Phase D |
| Non-MSVC linkers | Not supported | ABI/output contract is locked around COFF/MSVC flow |
| Windows hosts without `ml64.exe` | Not supported for shared mode | current backend requires MASM split object generation |
| WiX versions outside v6 contract | Not supported | not part of locked packaging surface |

## Contributor Setup Guidance

Minimum setup for native build work:
- Rust toolchain with `cargo`
- MSVC linker toolchain available to `pulsec`
- `ml64.exe` available to `pulsec` for supported shared builds

Minimum setup for MSI work:
- native build prerequisites
- WiX Toolset `v6`

Minimum setup for release-signing experiments:
- MSI or staged packaging prerequisites
- `signtool.exe`
- signing identity material:
  - certificate path via `signing_certificate`
  - or subject via `signing_subject`
  - optional timestamp service via `signing_timestamp_url`

Recommended explicit configuration over ambient PATH:
- `[toolchain].wix`
- `[toolchain].signtool`
- CLI overrides for reproducible local debugging:
  - `--linker <path>`
  - `--wix <path>`
  - `--signtool <path>`

## Notes

- The backend retries transient `LNK1104` file-lock failures to reduce flaky stub fallback during repeated fixture runs.
- Shared-mode builds are locked around MASM split object generation and do not currently support a no-assembler path.
- MSI and release signing are layered on top of the executable build path; installer/package stages are not a substitute for successful native artifact production.
- Unsigned release packaging is an accepted first-class outcome in the current contract as long as the report and signing plan make that state explicit.
