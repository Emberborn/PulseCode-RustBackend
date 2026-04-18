# Runtime Pointer Fix Report

This report captures the runtime/backend debugging work that led from the earlier temporary workarounds to the actual fix.

## Shipped Fixes

### 1. Real root-cause fix: map capacity pointer dereference

File:
- [runtime_emitters.rs](/D:/Programming/codex/PulseCode/crates/pulsec-cli/src/backend/emission/runtime_emitters.rs)

Area:
- `emit_map_new_proc`

Problem:
- two generated reads used `dword ptr [rt_map_cap_ptr+r10*4]`
- `rt_map_cap_ptr` is the global pointer variable that points to the map-capacity table
- indexing that symbol directly treated the pointer variable itself like inline table storage
- this produced slot-sensitive bogus capacity reads and later heap corruption during map growth

Fix:
- both bad reads now:
  - load the table pointer from `[rt_map_cap_ptr]`
  - then index into the pointed-to table with `[rax+r10*4]`

Result:
- reduced repros that previously crashed now succeed
- the real stress fixture now succeeds again

### 2. Earlier real fix kept as part of this debugging chain: stale ARC release helper

File:
- [masm_codegen.rs](/D:/Programming/codex/PulseCode/crates/pulsec-cli/src/backend/emission/masm_codegen.rs)

Area:
- `emit_arc_release_from_eax`

Problem:
- the helper was releasing `qword ptr [rsp+32]` instead of the actual handle currently in `rax`
- this produced invalid ARC releases in queue-heavy paths under the debug allocator

Fix:
- the helper now passes the actual handle in `rax` to `pulsec_rt_arcRelease`

Result:
- the queue-only invalid ARC release failure was removed
- this fix remained valid and was not reverted

## Temporary Debugging Changes That Were Reverted

### 1. Slot-capacity experiment

File:
- [mod.rs](/D:/Programming/codex/PulseCode/crates/pulsec-cli/src/backend/mod.rs)

Temporary change:
- `HANDLE_SLOT_INITIAL_CAPACITY` was raised from `63` to `255`

Purpose:
- test whether the crash was caused by an early slot-table growth boundary

Outcome:
- it did not fix the bug
- it was reverted back to `63`

This was only a probe and is not part of the shipped fix.

### 2. Caller-side ARC argument boundary experiment

File:
- [masm_codegen.rs](/D:/Programming/codex/PulseCode/crates/pulsec-cli/src/backend/emission/masm_codegen.rs)

Temporary idea:
- remove caller-side ARC retains/releases around method-call arguments

Purpose:
- test whether nested wrapper calls with fresh string arguments were over-retaining or over-releasing across call boundaries

Outcome:
- no effect on the failing repro
- reverted

This was only a probe and is not part of the shipped fix.

## Non-Product Debugging Artifacts Added

These were added only to narrow the bug and should be treated as debugging probes, not shipped language features.

Probe roots created under:
- [tmp_runtime_mix_probe](/D:/Programming/codex/PulseCode/tmp_runtime_mix_probe)

Notable probe cases created during this debugging thread:
- `object_only`
- `map_only`
- `queue_only`
- `static_mix`
- `queue_shifted`
- `map_shifted`
- `map_ctor_shifted`
- `direct_map_shifted`
- `map_shifted_size`
- `map_shifted_put_once`
- `map_shifted_reused_key`
- `map_wrapper_growth`
- `direct_map_slot3_growth`

Purpose of these probes:
- distinguish wrapper-field issues from raw runtime-handle issues
- distinguish no-growth map paths from map-growth paths
- determine whether the crash depended on earlier object allocations
- determine whether fresh string churn was required to reproduce the failure

## Documentation Updates Made During This Fix

File:
- [CODEX_HANDOFF_PHASE_F.md](/D:/Programming/codex/PulseCode/docs/CODEX_HANDOFF_PHASE_F.md)

Change:
- removed the stale “field-backed handle corruption” narrative
- recorded the actual root cause as the bad `rt_map_cap_ptr` table access in runtime map allocation/growth work
- reset the next resume point back to `F1-23`

## What Did Not Change

- no stdlib source was changed in the final shipped fix
- no language docs/board items were changed as part of the runtime fix itself
- the fix was fully in runtime/backend code

## Validation Used

Focused validation that passed:

```powershell
cargo test -q -p pulsec --bins --manifest-path "D:\Programming\codex\PulseCode\Cargo.toml"
cargo test -q -p pulsec --test fixture_projects cli_build_executes_strict_stress_soak_with_repeated_fat_shared_parity --manifest-path "D:\Programming\codex\PulseCode\Cargo.toml"
cargo test -q -p pulsec --test stage_locks lock_m3_16_stress_soak_fixture_check --manifest-path "D:\Programming\codex\PulseCode\Cargo.toml" -- --exact --test-threads=1
```

User-run full test result after the fix:
- full workspace run was green

