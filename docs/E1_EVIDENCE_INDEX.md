# E1 Evidence Index

## Primary Board

- [E1_TASK_BOARD.md](/D:/Programming/codex/PulseCode/docs/E1_TASK_BOARD.md)

## Shared Build Contracts

- [E1_SHARED_BUILD_GUIDE.md](/D:/Programming/codex/PulseCode/docs/E1_SHARED_BUILD_GUIDE.md)
- [CLI_COMMAND_CONTRACT.md](/D:/Programming/codex/PulseCode/docs/CLI_COMMAND_CONTRACT.md)
- [SHARED_RUNTIME_ABI.md](/D:/Programming/codex/PulseCode/docs/SHARED_RUNTIME_ABI.md)
- [PROJECT_LAYOUT_CONVENTIONS.md](/D:/Programming/codex/PulseCode/docs/PROJECT_LAYOUT_CONVENTIONS.md)
- [PACKAGING_PIPELINE_CONTRACT.md](/D:/Programming/codex/PulseCode/docs/PACKAGING_PIPELINE_CONTRACT.md)
- [WINDOWS_TOOLCHAIN_MATRIX.md](/D:/Programming/codex/PulseCode/docs/WINDOWS_TOOLCHAIN_MATRIX.md)

## Lock Suites

- `cargo test -q -p pulsec --test fixture_projects`
- `cargo test -q -p pulsec --test stage_locks_d`
- `cargo test -q -p pulsec --test phase_d_cli`
- `cargo test -q -p pulsec --test packaging_regressions`
- `cargo test -q -p pulsec`

## Key E1 Coverage

- `cli_build_executes_runtime_mix_fixture_project_in_shared_mode`
- `cli_build_executes_strict_stress_soak_fixture_project_in_shared_mode`
- `cli_build_executes_object_interface_mix_fixture_project_in_shared_mode`
- `cli_build_shared_hard_fails_when_linker_is_unavailable_and_no_fake_artifacts_publish`
- `cli_build_shared_launch_metadata_detects_missing_runtime_library_payload`
- `lock_e1_16_shared_artifacts_and_publication_layout_are_deterministic`
- `lock_e1_18_shared_profile_request_requires_output_entry_and_fails_deterministically`
- `e1_11_shared_profile_build_publishes_bin_lib_and_metadata_layout`
- `e1_13_shared_profile_debug_release_publication_rules_are_locked`
- `e1_12_shared_package_staging_reuses_shared_build_outputs_consistently`

## Roadmap Reference

- [STANDALONE_ROADMAP.md](/D:/Programming/codex/PulseCode/docs/STANDALONE_ROADMAP.md)
