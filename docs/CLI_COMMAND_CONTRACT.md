# PulseCode CLI Command Contract (Phase D1-01)

This document locks the top-level `pulsec` command surface and exit-code policy.

## Top-level Commands

- `pulsec new`
- `pulsec check`
- `pulsec build`
- `pulsec test`
- `pulsec package`
- `pulsec help`
- `pulsec version`

## Top-level Aliases

- `pulsec --help` and `pulsec -h` map to `pulsec help`.
- `pulsec --version` and `pulsec -V` map to `pulsec version`.

## Command Usage (Current Baseline)

- `pulsec new <project-name> [--template <app|lib>] [--path <dir>]`
- `pulsec check [<entry.pulse>] [--project-root <dir>] [--source-root <dir>] [--strict-package|--friendly]`
- `pulsec build [<entry.pulse>] [--project-root <dir>] [--source-root <dir>] [--profile <debug|release>] [--target <native-x64>] [--packaging-mode <staged|msi>] [--runtime-debug-allocator <on|off>] [--runtime-cycle-collector <on|off>] [--out-dir <dir>] [--linker <path>] [--assembler <path>] [--wix <path>] [--signtool <path>] [--msi]`
- `pulsec test [--project-root <dir>] [--source-root <dir>] [--strict-package|--friendly]`
- `pulsec package [<entry.pulse>] [--project-root <dir>] [--source-root <dir>] [--profile <debug|release>] [--target <native-x64>] [--packaging-mode <staged|msi>] [--runtime-debug-allocator <on|off>] [--runtime-cycle-collector <on|off>] [--out-dir <dir>] [--staging-dir <dir>] [--linker <path>] [--assembler <path>] [--wix <path>] [--signtool <path>] [--msi]`

## Flag Naming Contract

- Common:
  - `--strict-package`
  - `--friendly` (check mode)
  - `--source-root <dir>`
  - `--project-root <dir>` (check/build mode)
- New-only:
  - `--template <app|lib>`
  - `--path <dir>`
- Build-only:
  - `--profile <debug|release>`
  - `--target <native-x64>`
  - `--packaging-mode <staged|msi>`
  - `--runtime-debug-allocator <on|off>`
  - `--runtime-cycle-collector <on|off>`
  - `--out-dir <dir>`
  - `--linker <path>`
  - `--assembler <path>`
  - `--wix <path>`
  - `--signtool <path>`
  - `--msi` (routes through package pipeline)
- Test-only:
  - discovery root defaults to `<project>/tests`
- Package-only:
  - `--staging-dir <dir>`

`--linker` is invalid for `check`.

## Check Project-mode Behavior

- If `pulsec.toml` is found (from `--project-root`, entry parent, or current directory), `check` resolves `[sources].root` and `[sources].entry` when explicit CLI values are not provided.
- If root manifest declares `[workspace].members`, `check --project-root <workspace-root>` runs `check` across each member project and emits workspace summary lines.
- If no entry is passed and manifest entry is absent, `check` falls back to source-root discovery (`src/app/main/Main.pulse` first, then single-file source trees).
- `--strict-package` enforces package layout as an error.
- `--friendly` keeps package-layout mismatches as warnings while preserving deterministic success/failure summaries.

## Build Project-mode Behavior

- If `pulsec.toml` is found (from `--project-root`, entry parent, or current directory), `build` resolves `[sources].root` and `[sources].entry` when explicit CLI values are not provided.
- If root manifest declares `[workspace].members`, `build --project-root <workspace-root>` runs `build` across each member project and emits workspace summary lines.
- Profile selection precedence is CLI `--profile` then manifest `[build].profile` then default `release`.
- Output directory selection precedence is CLI `--out-dir` then manifest `[build].out_dir` then default:
  - manifest/profile-driven mode: `<project>/build/distro/<profile>`
  - direct legacy mode: `<root>/build`
- Build summary output reports profile, project mode, source root, and output directory deterministically.
- Build summary and resolved config artifacts surface manifest-driven output topology:
  - `output_mode=fat` (default)
  - `output_mode=shared` with required `output_entry`
- Build emits a resolved config artifact with schema `pulsec.build.config.v1`:
  - direct-mode baseline: `build/build.config.plan.json`
  - manifest `debug` profile: `build/distro/debug/<name>-<version>-build.config.plan.json`
  - manifest `release` profile: `build/tmp/<name>-<version>-build.config.plan.json`
- Native plan topology now exposes output-mode artifact intent with schema `pulsec.native.plan.v1`:
  - `fat` mode: `app_executable` + embedded `runtime_payload`
  - `shared` mode: `app_executable` + `runtime_library` (`pulsecore-<pulsec-semver>.dll`) + `runtime_import_library` (`pulsecore-<pulsec-semver>.lib`) + runtime lookup metadata
- Native plan also locks link-planning ownership buckets:
  - `startup_objects`
  - `app_owned_objects`
  - `runtime_owned_objects`
  - `system_inputs`
  - shared mode distinguishes `app_executable` consumption from `runtime_library` consumption
- Shared mode native plans also emit `shared_runtime_abi` with:
  - schema `pulsec.shared_runtime.abi.v1`
  - procedure-only runtime import surface
  - app-side dispatch/type-check lowering resolves class IDs through `pulsec_rt_objectClassId`
  - procedure-only runtime export surface with `visibility=minimal_versioned_abi`
  - shared-boundary compatibility fields for runtime ABI v2 and object-model ABI v1
  - `runtime_state_layout` locking runtime metadata/allocator placement to `runtime_library_storage`
  - `transition_status.user_field_storage_imports = removed_in_e2_06`
  - forbidden runtime data import patterns
  - forbidden private export patterns (`rt_*`, `pulsec_rt_obj_*`, `pulsec_rt_class_*`)
  - startup lifecycle sequence `startup_entry -> pulsec_rt_init -> app_entry -> pulsec_rt_shutdown -> ExitProcess`
  - runtime-owned init sentinels `rt_runtime_init_state` and `rt_runtime_init_epoch` guarding idempotent bootstrap
- Shared mode native plans also emit `shared_boundary` with:
  - schema `pulsec.shared_boundary.v1`
  - explicit participants (`app_executable`, `shared_runtime_library`)
  - explicit ownership boundary (`app_owned`, `runtime_owned`)
  - explicit import boundary (`app_import_kind=import_library`, runtime-private data imports forbidden)
  - explicit `runtime_lookup_metadata` for published build and staged package launch resolution
- `pulsec build --output-mode shared` now emits a real `pulsecore-<pulsec-version>.dll` plus `pulsecore-<pulsec-version>.lib` and links `main.exe` against that import boundary
- Manifest/profile shared builds publish a nested runnable layout:
  - `build/distro/<profile>/bin` for the stamped executable plus runtime payload/resources
  - `build/distro/<profile>/lib` for `pulsecore-<pulsec-version>.dll` and `pulsecore-<pulsec-version>.lib`
  - `build/distro/debug/metadata` for shared debug diagnostics and `stamp.txt`
- Shared profile publication rules are:
  - `release`: `bin/` + `lib/` only
  - `debug`: `bin/` + `lib/` + `metadata/`
  - no `.pdb` or sidecar symbol outputs are currently published in shared mode
- Shared builds publish `bin/launch.txt` with schema `pulsec.shared.launch.v1`:
  - `mode=shared`
  - `runtime_load=peer_runtime_library`
  - `lookup_policy=relative-sibling-runtime`
  - shared-boundary compatibility metadata:
    - `runtime_abi_schema=pulsec.runtime.abi.v1`
    - `runtime_abi_version=2`
    - `object_model_abi_schema=pulsec.object_model.abi.v1`
    - `object_model_abi_version=1`
    - `mismatch_policy=deterministic-fail-fast`
    - `missing_runtime_policy=deterministic-fail-fast`
    - `missing_import_policy=deterministic-fail-fast`
    - deterministic mismatch diagnostics for `Runtime ABI mismatch` and `Object model ABI mismatch`
    - required runtime procedure inventory via `required_runtime_imports=...`
  - published build outputs resolve runtime via `../lib/pulsecore-<pulsec-version>.dll`
- Shared-mode import wiring is explicit in emitted artifacts:
  - native plan link target `app_executable` declares `linkage_kind=import_library`
  - native plan declares `runtime_load=peer_runtime_library`
  - shared link reports include `app_import_linkage=import_library` and `app_runtime_load=peer_runtime_library`
  - shared link reports include `startup_object=<.../Startup.obj>`
  - shared link reports include `startup_bootstrap=mainCRTStartup->pulsec_rt_init->app_entry->pulsec_rt_shutdown->ExitProcess`
  - shared link reports include `runtime_export_policy=procedure_only|minimal_versioned_abi` plus the exported procedure inventory
- Product builds hard-fail on backend or linker failure:
  - no stub-success executable is published
  - `native.link.txt` is still emitted with deterministic failure evidence
  - `status=backend-failed` and `status=not-linked` are terminal build failures
- Shared-mode failure boundaries are also locked:
  - missing `output_entry` for manifest/profile shared builds fails validation before build output is published
  - shared link failure publishes deterministic `native.link.txt` evidence but no `.exe`, `.dll`, or `.lib`
  - removing the shared runtime library after build causes the executable launch to fail rather than silently degrading

## E3 Parity Baseline

- `--output-mode fat` and `--output-mode shared` select different publication/runtime topologies, not different language semantics for supported programs.
- Mode selection must never silently weaken unsupported behavior:
  - shared-only requirements stay explicit, for example required `output_entry`
  - shared-only failure causes stay explicit, for example missing runtime library payload or ABI mismatch
- Parity claims must be validated side-by-side:
  - same fixture corpus
  - same supported program behavior expectations
  - same packaging/install success expectations
- Profile semantics stay explicit across both modes:
  - `release` publishes runnable product output only
  - `debug` publishes runnable product output plus documented diagnostics for that mode

## Test Command Behavior

- `pulsec test [--project-root <dir>] [--source-root <dir>] [--strict-package|--friendly]`
- If root manifest declares `[workspace].members`, `test --project-root <workspace-root>` runs test discovery/execution across member projects and emits workspace summary lines.
- Discovery scans `<project>/tests` recursively for `*.pulse`.
- Each discovered test file is validated through the compiler pipeline (baseline execution contract).
- Deterministic reporting:
  - discovery header
  - per-test `[PASS]` / `[FAIL]`
  - stable summary `passed/failed/total` with mode
- Exit behavior:
  - `0` when all discovered tests pass
  - `1` when any test fails or when no test files are discovered

## Package Command Behavior

- `pulsec package` is the stable packaging entrypoint.
- If root manifest declares `[workspace].members`, `package --project-root <workspace-root>` runs package pipeline across each member and emits workspace summary lines.
- `pulsec package` reuses the `src/test/pulse` fixture corpus as a package gate:
  - when tests are present, they are compile-validated before staging
  - package fails when fixture checks fail
- Baseline packaging mode stages deterministic packaging metadata and emits a package report:
  - `<project>/build/distro/package/package.report.txt`
- Deterministic package-ready staging subtree:
  - `<project>/build/staging/bin`
  - `<project>/build/staging/assets`
  - `<project>/build/staging/icons`
  - `<project>/build/staging/licenses`
  - `<project>/build/staging/docs`
  - `<project>/build/staging/config`
  - `<project>/build/staging/data`
  - `<project>/build/staging/metadata`
  - `<project>/build/staging/logs`
  - `<project>/build/staging/obj`
- `build --msi` and `package --msi` both route through the same package pipeline contract.
- MSI mode validates required manifest metadata before backend execution.
  - Missing metadata fields fail with `PULSEC:E_PACKAGE_FAILED`.
  - Invalid `[package.metadata].install_scope` fails unless value is `per-user` or `per-machine`.
- Current MSI behavior:
  - WiX contract/template artifacts are emitted under `build/distro/package`
  - MSI build is invoked and emits `<artifact-stamp>.msi` on success
  - failure remains deterministic with package report + MSI build log and `PULSEC:E_PACKAGE_FAILED`
  - release packaging emits a deterministic signing plan and surfaces either `signed`, `unsigned`, or `skipped` state in `package.report.txt`

Manifest schema reference for project-mode resolution:
- `docs/PULSEC_MANIFEST_V1.md`
- `docs/PULSEC_MANIFEST_EXAMPLES.md`
- `docs/PROJECT_LAYOUT_CONVENTIONS.md`
- `docs/PACKAGING_PIPELINE_CONTRACT.md`

## Exit-code Policy

- `0`: success
- `1`: command execution failure (compile/build/runtime command path)
- `2`: command/argument usage error
- `3`: command recognized but not implemented

## Diagnostics UX Contract

- Colorless baseline: CLI output must not emit ANSI color escape sequences.
- Error envelope is stable and machine-readable:
  - `error[<code>]: <message>`
  - `diag.code=<code>`
  - `hint: <actionable next step>`
- Current diagnostic codes:
  - `PULSEC:E_USAGE`
  - `PULSEC:E_COMMAND`
  - `PULSEC:E_CHECK_FAILED`
  - `PULSEC:E_BUILD_FAILED`
  - `PULSEC:E_TEST_FAILED`
  - `PULSEC:E_PACKAGE_FAILED`

## Lock Tests

- `crates/pulsec-cli/tests/stage_locks_d.rs`
  - `lock_d1_01_help_contract_lists_commands_and_exit_policy`
  - `lock_d1_01_version_contract_is_stable`
  - `lock_d1_01_missing_command_is_usage_error`
  - `lock_d1_01_unknown_command_is_usage_error`
  - `lock_d1_01_command_specific_help_contract_is_stable`
  - `lock_d1_02_new_app_scaffold_is_deterministic_and_buildable`
  - `lock_d1_02_new_lib_scaffold_is_deterministic_and_checkable`
  - `lock_d1_02_new_rejects_existing_target_dir`
  - `lock_d1_03_check_manifest_project_mode_resolves_entry_and_source_root`
  - `lock_d1_03_check_strict_and_friendly_modes_are_deterministic`
  - `lock_d1_03_check_failure_summary_includes_context`
  - `lock_d1_04_build_manifest_project_mode_defaults_to_release_profile`
  - `lock_d1_04_build_manifest_profile_and_cli_out_dir_are_honored`
  - `lock_d1_04_build_direct_mode_default_profile_and_status_summary_are_stable`
  - `lock_d1_04_build_direct_mode_release_profile_routes_to_profile_output_dir`
  - `lock_d1_05_test_discovers_and_reports_passing_project_tests`
  - `lock_d1_05_test_reports_failures_and_exits_non_zero`
  - `lock_d1_05_test_no_files_is_deterministic_failure`
  - `lock_d1_06_package_staged_baseline_is_deterministic`
  - `lock_d1_06_build_msi_and_package_msi_share_entrypoint_contract`
  - `lock_d3_01_packaging_uses_build_output_as_staging_root`
  - `lock_d3_02_package_layout_is_deterministic_for_app_template`
  - `lock_d3_02_package_layout_is_deterministic_for_lib_template`
  - `lock_d3_03_manifest_payloads_are_staged_into_windows_layout`
  - `lock_d3_04_package_reuses_test_fixture_corpus_as_gate`
  - `lock_d3_04_package_fails_when_fixture_tests_fail`
  - `lock_d1_07_diagnostic_envelope_is_machine_readable_and_actionable`
  - `lock_d1_07_diagnostics_remain_colorless_across_failure_paths`
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
