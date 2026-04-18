# C2 Memory + ARC Hardening Summary

## Memory Model
- Strategy: ARC with background cycle detector.
- Handle ABI: v2 `u64` handle (`slot32 + generation32`).
- Slot growth: dynamic, doubling from initial `63`, null reserved at slot `0`.
- Runtime allocator: Win64 process heap (`HeapAlloc`/`HeapFree`).

## ARC Contract
- Header schema: `adenc.arc.header.v1`.
- Words: `kind_tag`, `refcount`, `flags`, `meta_index`.
- Refcount guard: `0xFFFF_FFFE` with deterministic fail-fast on saturation.
- Stale handle policy: deterministic fatal (`Stale runtime handle`).

## Container/Array Semantics
- Arrays: per-instance heap-backed int/string lanes.
- List/Map growth: `init=16`, `factor=2x`, `max=2147483647`.
- Shrink policy: hysteresis multiplier `4`.
- Ownership hooks: retain/release for list/map string/key/value mutation paths.

## Failure Semantics
- Deterministic fatal diagnostics for:
  - array/list/map/string allocation/growth failures,
  - ARC saturation/invalid stale usage,
  - runtime ABI mismatch.

## Debug + Safety Locks
- Debug allocator mode: `PULSEC_DEBUG_ALLOC`.
- Detects invalid ARC retain/release paths (UAF/double-release style misuse) with non-zero exit.

## Compatibility/Threading
- ABI compatibility schema: `adenc.runtime.abi.v1`.
- Runtime init enforces compiler/runtime ABI match.
- Threading contract schema: `adenc.runtime.threading.v1`.
- Current model is locked single-threaded/non-atomic (not thread-safe).
