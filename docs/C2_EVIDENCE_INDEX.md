# C2 Evidence Index

## Primary Board
- [C2_TASK_BOARD.md](/D:/Programming/codex/PulseCode/docs/C2_TASK_BOARD.md)

## ABI/Runtime Contracts
- [RUNTIME_INTRINSICS_ABI.md](/D:/Programming/codex/PulseCode/docs/RUNTIME_INTRINSICS_ABI.md)
- [C2_MEMORY_ARC.md](/D:/Programming/codex/PulseCode/docs/C2_MEMORY_ARC.md)
- [C2_CYCLE_STRATEGY.md](/D:/Programming/codex/PulseCode/docs/C2_CYCLE_STRATEGY.md)

## Closure/Execution
- [C2_CLOSURE_CHECKLIST.md](/D:/Programming/codex/PulseCode/docs/C2_CLOSURE_CHECKLIST.md)
- [C2_CI_MATRIX.md](/D:/Programming/codex/PulseCode/docs/C2_CI_MATRIX.md)

## Lock Suites
- `cargo test -q -p pulsec --test stage_locks_c2`
- `cargo test -q`

## Key Lock Tests (non-exhaustive)
- `lock_c2_21_debug_allocator_double_release_panics_deterministically`
- `lock_c2_22_soak_memory_trend_is_stable`
- `lock_c2_23_threading_contract_is_documented_and_emitted`
- `lock_c2_24_runtime_abi_mismatch_fails_deterministically`
