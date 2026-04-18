# E2 Evidence Index

## Primary Board

- [E2_TASK_BOARD.md](/D:/Programming/codex/Aden Lang/docs/E2_TASK_BOARD.md)

## Runtime Ownership + ABI Contracts

- [SHARED_RUNTIME_ABI.md](/D:/Programming/codex/Aden Lang/docs/SHARED_RUNTIME_ABI.md)
- [RUNTIME_OWNERSHIP_INVENTORY.md](/D:/Programming/codex/Aden Lang/docs/RUNTIME_OWNERSHIP_INVENTORY.md)
- [RUNTIME_OWNERSHIP_POLICY.md](/D:/Programming/codex/Aden Lang/docs/RUNTIME_OWNERSHIP_POLICY.md)
- [SHARED_RUNTIME_STATE_LAYOUT.md](/D:/Programming/codex/Aden Lang/docs/SHARED_RUNTIME_STATE_LAYOUT.md)
- [CLI_COMMAND_CONTRACT.md](/D:/Programming/codex/Aden Lang/docs/CLI_COMMAND_CONTRACT.md)
- [COMPILER_PACKAGING_REMOVAL.md](/D:/Programming/codex/Aden Lang/docs/COMPILER_PACKAGING_REMOVAL.md)

## Lock Suites

- `cargo test -q -p adenc --test fixture_projects`
- `cargo test -q -p adenc --test stage_locks_c3`
- `cargo test -q -p adenc --test stage_locks_d`
- `cargo test -q -p adenc --test phase_d_cli`
- `cargo test -q -p adenc`

## Key E2 Coverage

- `e2_03_shared_runtime_abi_doc_and_plan_lock_import_boundary`
- `e2_04_shared_runtime_abi_compatibility_policy_is_locked`
- `e2_05_shared_runtime_state_layout_is_locked_to_runtime_library_storage`
- `e2_07_runtime_init_and_startup_bootstrap_are_locked`
- `e2_08_runtime_shutdown_boundary_is_locked`
- `e2_09_shared_boundary_plan_emits_explicit_ownership_import_and_lookup_metadata`
- `e2_10_virtual_dispatch_codegen_uses_runtime_class_id_proc_boundary`
- `e2_10_instanceof_and_checked_cast_codegen_use_runtime_class_id_proc_boundary`
- `cli_build_shared_runtime_abi_mismatch_fails_deterministically_at_launch`
- `cli_build_shared_object_model_abi_mismatch_fails_deterministically_at_launch`
- `cli_build_executes_runtime_owned_collections_state_in_shared_mode`
- `cli_build_shared_null_virtual_dispatch_receiver_panics_deterministically`
- `cli_build_shared_checked_reference_cast_failure_is_locked`
- `cli_build_executes_strict_stress_soak_repeatedly_in_shared_mode`

## Roadmap Reference

- [STANDALONE_ROADMAP.md](/D:/Programming/codex/Aden Lang/docs/STANDALONE_ROADMAP.md)
