# C3 Evidence Index

## Primary Board
- [C3_TASK_BOARD.md](/D:/Programming/codex/Aden Lang/docs/C3_TASK_BOARD.md)

## ABI/Object Model Contracts
- [RUNTIME_INTRINSICS_ABI.md](/D:/Programming/codex/Aden Lang/docs/RUNTIME_INTRINSICS_ABI.md)

## Closure/Execution
- [C3_CLOSURE_CHECKLIST.md](/D:/Programming/codex/Aden Lang/docs/C3_CLOSURE_CHECKLIST.md)
- [MILESTONE-ROADMAP.md](/D:/Programming/codex/Aden Lang/docs/MILESTONE-ROADMAP.md)

## Lock Suites
- `cargo test -q -p adenc --test stage_locks_c3`
- `cargo test -q`

## Key C3 Lock Tests (non-exhaustive)
- `lock_c3_10_safe_devirtualization_fast_paths_preserve_behavioral_parity`
- `lock_c3_11_instanceof_runtime_type_check_boundary_is_locked`
- `lock_c3_12_runtime_type_checks_consume_class_id_table`
- `lock_c3_13_null_virtual_dispatch_receiver_panics_deterministically`
- `lock_c3_14_object_model_abi_mismatch_fails_deterministically`
- `lock_c3_15_semantic_constructor_and_layout_edge_matrix_is_locked`
- `lock_c3_16_polymorphism_and_interface_dispatch_fixture_suite_executes`
- `lock_c3_17_object_model_stress_alloc_churn_polymorphic_calls_are_stable`
- `lock_c3_18_dispatch_heavy_frame_and_win64_abi_guards_are_locked`
