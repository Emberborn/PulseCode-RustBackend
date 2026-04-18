# Stage Lock Tests (M2 + M3)

Purpose:
- Prevent drift by pinning one or more compile/build/runtime checks to each completed stage item.
- Keep stage evidence executable and repeatable.

Test targets:
- `crates/adenc-cli/tests/stage_locks.rs`
- `crates/adenc-cli/tests/stage_locks_casting.rs`
- `crates/adenc-cli/tests/stage_locks_casting_failures.rs`
- `crates/adenc-cli/tests/stage_locks_c2.rs`

Run command:

```powershell
cargo test -p adenc --test stage_locks
```

Casting lock commands (run separately to keep expected-failure output isolated):

```powershell
cargo test -p adenc --test stage_locks_casting
cargo test -p adenc --test stage_locks_casting_failures
```

C2 lock command:

```powershell
cargo test -p adenc --test stage_locks_c2
```

`stage_locks_c2.rs`:
- `lock_c2_01_arc_header_contract_is_documented_and_emitted_in_native_plan`
- `lock_c2_02_arc_fast_path_null_noop_behavior_executes`
- `lock_c2_03_arc_release_slow_path_teardown_sequence_executes`
- `lock_c2_04_arc_insertion_boundaries_emit_retain_release_sequences`
- `lock_c2_05_cycle_detector_cadence_and_symbols_are_locked`
- `lock_c2_06_weak_reference_runtime_support_is_locked`
- `lock_c2_07_arc_failure_semantics_are_locked`
- `lock_c2_allocator_reuses_reclaimed_arc_slots`
- `lock_c2_weak_allocator_exhaustion_panics_deterministically`
- `lock_c2_weak_clear_recycles_token_capacity`
- `lock_c2_generation_wraparound_is_fail_fast_and_locked`
- `lock_c2_08_array_heap_allocation_contract_is_locked`
- `lock_c2_08_slot_capacity_grows_beyond_legacy_limit`
- `lock_c2_10_container_shrink_hysteresis_executes`
- `lock_c2_11_list_string_ownership_retain_and_clear_release`
- `lock_c2_11_map_string_ownership_replace_and_clear_release`
- `lock_c2_12_array_oom_behavior_panics_deterministically`
- `lock_c2_12_list_growth_scales_without_panic`
- `lock_c2_12_map_growth_scales_without_panic`
- `lock_c2_12_string_growth_panics_deterministically`

## Casting Locks

`stage_locks_casting.rs` (success-path locks):
- `lock_cast_01_suffix_literals_typecheck`
- `lock_cast_02_contextual_literals_typecheck`
- `lock_cast_03_explicit_numeric_casts_typecheck`
- `lock_cast_04_field_initializers_with_casts_typecheck`
- `lock_cast_05_explicit_truncation_casts_negative_values_typecheck`
- `lock_cast_06_boxed_long_contextual_int_literal_assignment_typecheck`
- `lock_cast_07_unparenthesized_negative_decimal_cast_typecheck`

`stage_locks_casting_failures.rs` (failure-path locks):
- `lock_cast_fail_01_rejects_invalid_cast_boolean_to_int`
- `lock_cast_fail_02_rejects_byte_overflow_literal_assignment`
- `lock_cast_fail_03_rejects_large_unsuffixed_literal_for_long_target`
- `lock_cast_fail_04_rejects_long_to_int_without_cast`
- `lock_cast_fail_05_rejects_float_to_int_without_cast`

## M2 Stage Locks

| Stage | Lock Test |
|---|---|
| M2-01 | `lock_m2_01_wrapper_map_semantics` |
| M2-02 | `lock_m2_02_signed_wrapper_skeletons_importable` |
| M2-03 | `lock_m2_03_unsigned_wrapper_skeletons_importable` |
| M2-04 | `lock_m2_04_void_wrapper_contract` |
| M2-05 | `lock_m2_05_boxing_assignment` |
| M2-06 | `lock_m2_06_unboxing_assignment` |
| M2-07 | `lock_m2_07_boxing_in_call_and_return` |
| M2-08 | `lock_m2_08_overload_precedence` |
| M2-09 | `lock_m2_09_numeric_conversion_diagnostics` |
| M2-10 | `lock_m2_10_wrapper_api_surface` |
| M2-11 | `lock_m2_11_core_bootstrap_classes` |
| M2-12 | `lock_m2_12_wrapper_nullability_enforced` |
| M2-13 | `lock_m2_13_wrapper_runtime_failure_fixture` |
| M2-14 | `lock_m2_14_freeze_docs_present` |

## M3 Stage Locks

| Stage | Lock Test |
|---|---|
| M3-01 | `lock_m3_01_exception_hierarchy_available` |
| M3-02 | `lock_m3_02_runtime_exception_set_available` |
| M3-03 | `lock_m3_03_collection_list_contracts` |
| M3-04 | `lock_m3_04_arraylist_surface` |
| M3-05 | `lock_m3_05_linkedlist_surface` |
| M3-06 | `lock_m3_06_set_hashset_surface` |
| M3-07 | `lock_m3_07_map_hashmap_surface` |
| M3-08 | `lock_m3_08_queue_deque_surface` |
| M3-09 | `lock_m3_09_math_surface` |
| M3-10 | `lock_m3_10_random_seeded_surface` |
| M3-11 | `lock_m3_11_file_path_files_surface` |
| M3-12 | `lock_m3_12_stream_surface` |
| M3-13 | `lock_m3_13_time_surface` |
| M3-14 | `lock_m3_14_abi_doc_and_lock_tests_exist` |
| M3-15 | `lock_m3_15_multifile_fixture_projects_check` |
| M3-16 | `lock_m3_16_stress_soak_fixture_check` |
| M3-17 | `lock_m3_17_windows_matrix_doc_exists` |
| M3-18 | `lock_m3_18_closure_docs_exist` |

## M3 Gate Locks

| Gate | Lock Test |
|---|---|
| M3-G1 | `gate_m3_g1_fixture_project_coverage` |
| M3-G2 | `gate_m3_g2_collections_behavior_coverage` |
| M3-G3 | `gate_m3_g3_io_stream_behavior_coverage` |
| M3-G4 | `gate_m3_g4_time_math_determinism_coverage` |
| M3-G5 | `cli_build_executes_stress_soak_repeatedly` (`fixture_projects`) |
| M3-G6 | `docs/WINDOWS_TOOLCHAIN_MATRIX.md` + matrix validation runs |
| M3-G7 | `docs/RUNTIME_INTRINSICS_ABI.md`, `docs/STDLIB_API_INDEX.md`, `docs/C1_5_CLOSURE_CHECKLIST.md` |
