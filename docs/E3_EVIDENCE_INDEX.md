# E3 Evidence Index

## Primary Board

- [E3_TASK_BOARD.md](/D:/Programming/codex/PulseCode/docs/E3_TASK_BOARD.md)

## Parity Contracts

- [E3_PARITY_GUIDE.md](/D:/Programming/codex/PulseCode/docs/E3_PARITY_GUIDE.md)
- [E3_PARITY_SUPPORT_MATRIX.md](/D:/Programming/codex/PulseCode/docs/E3_PARITY_SUPPORT_MATRIX.md)
- [E3_PARITY_EVIDENCE_STRATEGY.md](/D:/Programming/codex/PulseCode/docs/E3_PARITY_EVIDENCE_STRATEGY.md)
- [CLI_COMMAND_CONTRACT.md](/D:/Programming/codex/PulseCode/docs/CLI_COMMAND_CONTRACT.md)
- [PROJECT_LAYOUT_CONVENTIONS.md](/D:/Programming/codex/PulseCode/docs/PROJECT_LAYOUT_CONVENTIONS.md)
- [PACKAGING_PIPELINE_CONTRACT.md](/D:/Programming/codex/PulseCode/docs/PACKAGING_PIPELINE_CONTRACT.md)
- [WINDOWS_TOOLCHAIN_MATRIX.md](/D:/Programming/codex/PulseCode/docs/WINDOWS_TOOLCHAIN_MATRIX.md)

## Lock Suites

- `cargo test -q -p pulsec --test e3_parity`
- `cargo test -q -p pulsec --test fixture_projects`
- `cargo test -q -p pulsec --test phase_d_cli`
- `cargo test -q -p pulsec --test packaging_regressions`
- `cargo test -q -p pulsec --test stage_locks`
- `cargo test -q -p pulsec --test stage_locks_d`
- `cargo test -q -p pulsec`

## Key E3 Coverage

- `e3_12_parity_ci_suite_runs_matched_fat_shared_fixture_corpus`
- `cli_build_executes_same_fixture_corpus_with_side_by_side_fat_shared_parity`
- `cli_build_executes_runtime_heavy_app_with_side_by_side_fat_shared_parity`
- `cli_build_executes_strict_stress_soak_with_repeated_fat_shared_parity`
- `cli_build_executes_failure_paths_with_side_by_side_fat_shared_parity`
- `cli_build_shared_boundary_failure_diagnostics_remain_explicit_and_deterministic`
- `e3_07_debug_release_behavior_and_developer_visible_outputs_are_locked_for_fat_and_shared`
- `lock_e3_08_fat_and_shared_artifact_publication_parity_rules_are_explicit`
- `e3_09_fat_and_shared_staging_outputs_satisfy_the_same_product_expectations`
- `lock_e3_10_shared_msi_template_includes_runtime_payloads`
- `lock_e3_10_real_msi_fat_and_shared_installs_are_runnable_with_expected_payloads`
- `lock_e3_11_real_msi_fat_and_shared_repair_upgrade_and_uninstall_parity_are_stable`
- `lock_e3_13_supported_fat_shared_differences_and_shared_only_diagnostics_are_snapshot_locked`
- `lock_e3_14_windows_matrix_covers_fat_shared_package_install_parity`

## Roadmap Reference

- [STANDALONE_ROADMAP.md](/D:/Programming/codex/PulseCode/docs/STANDALONE_ROADMAP.md)
