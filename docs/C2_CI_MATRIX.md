# C2 CI Matrix

## Required C2 Jobs

| Job | Command | Purpose |
|---|---|---|
| C2 Locks | `cargo test -q -p pulsec --test stage_locks_c2` | Lock gates for ARC/cycle/container/ABI/threading/debug/runtime behavior |
| Full Workspace | `cargo test -q` | Regression coverage across all crates/tests |

## Soak/Trend Inputs
- `PULSEC_SOAK_TREND_ITERS` (default `8`, minimum `5`)
- `PULSEC_SOAK_PEAK_SPREAD_BYTES` (default `12582912`)
- `PULSEC_SOAK_PEAK_DRIFT_BYTES` (default `8388608`)

## Debug/Compatibility Inputs
- `PULSEC_DEBUG_ALLOC` enables debug allocator fail-fast checks.
- `PULSEC_FORCE_RUNTIME_ABI_VERSION` supports controlled ABI mismatch lock testing.

## Pass Criteria
- C2 lock suite: all tests pass.
- Full workspace suite: all tests pass.
- C2 gate mapping in [C2_TASK_BOARD.md](/D:/Programming/codex/PulseCode/docs/C2_TASK_BOARD.md) remains `Done (Locked)` for `C2-G1`..`C2-G12`.
