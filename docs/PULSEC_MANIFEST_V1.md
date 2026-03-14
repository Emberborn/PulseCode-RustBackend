# PulseCode Manifest Schema v1 (`pulsec.toml`)

This document defines the locked schema for D2-01.

Example manifest matrix:
- `docs/PULSEC_MANIFEST_EXAMPLES.md`

## Required fields

- package manifests: `[package].name` and `[package].version` (semantic `x.y.z`)
- workspace manifests: `[workspace].members`

## Supported sections

- `[package]`
  - `name` (string)
  - `version` (string)
- `[sources]`
  - `root` (legacy compatibility alias; default: `"src/main/pulse"`)
  - `main_pulse` (string, default: `"src/main/pulse"`)
  - `main_resources` (string, default: `"src/main/resources"`)
  - `test_pulse` (string, default: `"src/test/pulse"`)
  - `test_resources` (string, default: `"src/test/resources"`)
  - `api_pulse` (string, default: `"src/api/pulse"`)
  - `api_resources` (string, default: `"src/api/resources"`)
  - `docs` (string, default: `"docs"`)
  - `libraries` (string, default: `"libraries"`)
  - `entry` (string, optional)
- `[build]`
  - `profile` (string, optional: `"debug"` or `"release"`)
  - `target` (string, optional: `"native-x64"`)
  - `packaging_mode` (string, optional: `"staged"` or `"msi"`)
  - `output_mode` (string, optional: `"fat"` or `"shared"`; legacy aliases `"single_exe"` and `"exe_with_dlls"` are accepted)
  - `output_entry` (string, required when `output_mode = "shared"`)
  - `runtime_debug_allocator` (string, optional: `"on"` or `"off"`)
  - `runtime_cycle_collector` (string, optional: `"on"` or `"off"`)
  - `out_dir` (string, optional)
  - `asm_dir` (string, optional; default `"build/asm"`)
  - `generated_dir` (string, optional; default `"build/generated"`)
  - `assets_dir` (string, optional; default `"build/assets"`)
  - `sanity_dir` (string, optional; default `"build/sanity"`)
  - `tmp_dir` (string, optional; default `"build/tmp"`)
  - `distro_dir` (string, optional; default `"build/distro"`)
- `[toolchain]`
  - `linker` (string, optional)
  - `assembler` (string, optional)
  - `wix` (string, optional)
  - `signtool` (string, optional)
- `[workspace]`
  - `members` (string, required for workspace mode; comma-separated member project paths)
- `[package.metadata]`
  - arbitrary string key/value pairs
  - packaging convention keys:
    - `publisher`, `identifier`, `install_scope`, `entrypoints`
    - `icons`, `assets`, `license`, `readme`, `config`, `data`, `libraries`
    - release signing keys:
      - `signing_mode` (`unsigned` or `signtool`)
      - `signing_certificate`
      - `signing_subject`
      - `signing_timestamp_url`

## Validation rules

- Unknown sections are rejected.
- Unknown keys inside known fixed sections are rejected.
- Duplicate keys inside a section are rejected.
- Non-quoted manifest values are rejected.
- `[workspace].members` must resolve to at least one member path.
- Workspace member manifests cannot themselves declare `[workspace]`.
- `[build].profile` must be `debug` or `release` when present.
- `[build].target` must be `native-x64` when present.
- `[build].packaging_mode` must be `staged` or `msi` when present.
- `[package.metadata].signing_mode` must be `unsigned` or `signtool` when present.
- `[build].output_mode` must be `fat` or `shared` when present. Legacy aliases `single_exe` and `exe_with_dlls` are accepted and canonicalized.
- `[build].output_entry` is required when `[build].output_mode = "shared"`.
- `native.plan.json` emitted for builds records output topology by canonical mode:
  - `fat`: application executable + embedded runtime payload
  - `shared`: application executable + runtime library + import library + runtime lookup metadata
- Shared runtime/stdlib binary naming is toolchain-scoped and deterministic:
  - runtime library: `pulsecore-<pulsec-semver>.dll`
  - import library: `pulsecore-<pulsec-semver>.lib`
  - version source: compiler/toolchain semantic version (`pulsec` package version)
- runtime toggle keys must be `on` or `off` when present.
- `[package].name` must match `[A-Za-z0-9_-]+`.
- `[package].version` must match numeric semantic form `x.y.z`.
- Layout override keys in `[sources]`/`[build]` must be non-empty strings.
- MSI packaging mode requires non-empty metadata values for:
  - `[package].name`
  - `[package.metadata].publisher`
  - `[package.metadata].identifier`
  - `[package.metadata].install_scope` (`per-user` or `per-machine`)
  - `[package.metadata].entrypoints`
  - `[package.metadata].icons`
  - `[package.metadata].assets`

## Example

```toml
[package]
name = "demo_app"
version = "1.0.0"

[sources]
main_pulse = "src/main/pulse"
main_resources = "src/main/resources"
test_pulse = "src/test/pulse"
test_resources = "src/test/resources"
api_pulse = "src/api/pulse"
api_resources = "src/api/resources"
docs = "docs"
libraries = "libraries"
entry = "app/main/Main.pulse"

[build]
profile = "release"
target = "native-x64"
packaging_mode = "staged"
output_mode = "fat"
output_entry = "main"
runtime_debug_allocator = "off"
runtime_cycle_collector = "on"
out_dir = "build/distro/release"
asm_dir = "build/asm"
generated_dir = "build/generated"
assets_dir = "build/assets"
sanity_dir = "build/sanity"
tmp_dir = "build/tmp"
distro_dir = "build/distro"

[toolchain]
linker = "C:/toolchain/link.exe"
assembler = "C:/toolchain/ml64.exe"
wix = "C:/toolchain/wix.exe"
signtool = "C:/toolchain/signtool.exe"

[package.metadata]
publisher = "Pulse Labs"
identifier = "com.pulse.demo_app"
signing_mode = "unsigned"
```

### Workspace example

```toml
[workspace]
members = "apps/core, libs/util"
```

## Locked test coverage

- Unit validation in `crates/pulsec-cli/src/main.rs`:
  - `manifest_v1_accepts_full_schema_sections`
  - `manifest_v1_rejects_unknown_section_and_key`
  - `manifest_v1_rejects_missing_required_package_fields`
  - `manifest_v1_rejects_invalid_version_and_profile`
  - `manifest_v1_rejects_invalid_signing_mode`
- CLI lock coverage in `crates/pulsec-cli/tests/stage_locks_d.rs`:
  - `lock_d2_01_manifest_v1_schema_accepts_documented_sections`
  - `lock_d2_01_manifest_v1_rejects_unknown_sections_and_keys`
  - `lock_d2_01_manifest_v1_rejects_missing_package_name_or_version`
  - `lock_d2_02_project_model_defaults_follow_gradle_layout`
  - `lock_d2_03_layout_overrides_are_respected`
  - `lock_d2_03_empty_layout_override_is_rejected`
  - `lock_d2_04_build_config_plan_surfaces_resolved_target_profile_and_runtime_toggles`
  - `lock_d2_04_cli_overrides_take_precedence_over_manifest`
  - `lock_d2_04_invalid_target_or_runtime_toggle_is_rejected`
  - `lock_d2_05_msi_packaging_requires_manifest_metadata`
  - `lock_d2_05_msi_packaging_rejects_invalid_install_scope`
  - `lock_d2_05_split_output_requires_build_output_entry`
  - `lock_d2_06_workspace_check_runs_all_members`
  - `lock_d2_06_workspace_build_runs_all_members`
  - `lock_d2_06_workspace_test_runs_member_test_fixtures`
  - `lock_d2_06_workspace_package_runs_all_members`
  - `lock_d3_03_manifest_payloads_are_staged_into_windows_layout`
