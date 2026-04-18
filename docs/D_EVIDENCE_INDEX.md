# Phase D Evidence Index

Historical archive note:

- this index records the original pre-rebase Phase D closure package
- compiler-owned packaging evidence in the older Phase D docs is superseded by [COMPILER_PACKAGING_REMOVAL.md](/D:/Programming/codex/Aden Lang/docs/COMPILER_PACKAGING_REMOVAL.md)
- removed commands/suites such as `packaging_regressions` are no longer reproducible current evidence and should not be used as active validation instructions

## Primary Board
- [D_TASK_BOARD.md](/D:/Programming/codex/Aden Lang/docs/D_TASK_BOARD.md)

## Command / Project Contracts
- [CLI_COMMAND_CONTRACT.md](/D:/Programming/codex/Aden Lang/docs/CLI_COMMAND_CONTRACT.md)
- [PULSEC_MANIFEST_V1.md](/D:/Programming/codex/Aden Lang/docs/PULSEC_MANIFEST_V1.md)
- [PULSEC_MANIFEST_EXAMPLES.md](/D:/Programming/codex/Aden Lang/docs/PULSEC_MANIFEST_EXAMPLES.md)
- [PROJECT_LAYOUT_CONVENTIONS.md](/D:/Programming/codex/Aden Lang/docs/PROJECT_LAYOUT_CONVENTIONS.md)

## Historical Packaging / Installer Contracts
- [PACKAGING_PIPELINE_CONTRACT.md](/D:/Programming/codex/Aden Lang/docs/PACKAGING_PIPELINE_CONTRACT.md) (archived, superseded)
- [COMPILER_PACKAGING_REMOVAL.md](/D:/Programming/codex/Aden Lang/docs/COMPILER_PACKAGING_REMOVAL.md)
- [WINDOWS_TOOLCHAIN_MATRIX.md](/D:/Programming/codex/Aden Lang/docs/WINDOWS_TOOLCHAIN_MATRIX.md)

## Closure / Execution
- [D_CLOSURE_CHECKLIST.md](/D:/Programming/codex/Aden Lang/docs/D_CLOSURE_CHECKLIST.md)
- [D_CLI_UX_GUIDE.md](/D:/Programming/codex/Aden Lang/docs/D_CLI_UX_GUIDE.md)
- [STANDALONE_ROADMAP.md](/D:/Programming/codex/Aden Lang/docs/STANDALONE_ROADMAP.md)

## Lock Suites
- `cargo test -q -p adenc --test stage_locks_d`
- `cargo test -q -p adenc --test phase_d_cli`
- `cargo test -q -p adenc`

## Key Phase D Coverage
- `lock_d1_01_command_specific_help_contract_is_stable`
- `lock_d2_01_manifest_v1_schema_accepts_documented_sections`
- `d5_02_cli_project_lifecycle_runs_end_to_end_on_real_fixture_project`
- `d5_02_cli_workspace_lifecycle_runs_on_real_fixture_members`
