# Phase D Evidence Index

## Primary Board
- [D_TASK_BOARD.md](/D:/Programming/codex/PulseCode/docs/D_TASK_BOARD.md)

## Command / Project Contracts
- [CLI_COMMAND_CONTRACT.md](/D:/Programming/codex/PulseCode/docs/CLI_COMMAND_CONTRACT.md)
- [PULSEC_MANIFEST_V1.md](/D:/Programming/codex/PulseCode/docs/PULSEC_MANIFEST_V1.md)
- [PULSEC_MANIFEST_EXAMPLES.md](/D:/Programming/codex/PulseCode/docs/PULSEC_MANIFEST_EXAMPLES.md)
- [PROJECT_LAYOUT_CONVENTIONS.md](/D:/Programming/codex/PulseCode/docs/PROJECT_LAYOUT_CONVENTIONS.md)

## Packaging / Installer Contracts
- [PACKAGING_PIPELINE_CONTRACT.md](/D:/Programming/codex/PulseCode/docs/PACKAGING_PIPELINE_CONTRACT.md)
- [WINDOWS_TOOLCHAIN_MATRIX.md](/D:/Programming/codex/PulseCode/docs/WINDOWS_TOOLCHAIN_MATRIX.md)

## Closure / Execution
- [D_CLOSURE_CHECKLIST.md](/D:/Programming/codex/PulseCode/docs/D_CLOSURE_CHECKLIST.md)
- [D_CLI_UX_GUIDE.md](/D:/Programming/codex/PulseCode/docs/D_CLI_UX_GUIDE.md)
- [STANDALONE_ROADMAP.md](/D:/Programming/codex/PulseCode/docs/STANDALONE_ROADMAP.md)

## Lock Suites
- `cargo test -q -p pulsec --test stage_locks_d`
- `cargo test -q -p pulsec --test phase_d_cli`
- `cargo test -q -p pulsec --test packaging_regressions`
- `cargo test -q -p pulsec`

## Key Phase D Coverage
- `lock_d1_01_command_specific_help_contract_is_stable`
- `lock_d2_01_manifest_v1_schema_accepts_documented_sections`
- `lock_d3_05_package_emits_stamped_report_and_stage_metadata`
- `lock_d4_03_package_msi_generates_artifact_with_wix_override`
- `lock_d4_05_real_msi_roundtrip_validates_and_uninstalls_when_tooling_is_available`
- `lock_d4_06_release_package_runs_signtool_hook_when_configured`
- `d5_02_cli_project_lifecycle_runs_end_to_end_on_real_fixture_project`
- `d5_02_cli_workspace_lifecycle_runs_on_real_fixture_members`
- `d5_03_msi_failure_emits_stable_report_and_build_log`
- `d5_03_release_signing_failure_is_deterministic_and_logged`
