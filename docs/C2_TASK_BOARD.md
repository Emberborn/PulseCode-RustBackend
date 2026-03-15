# C2 Task Board (Automatic Memory Management + Runtime Hardening)

## How to use
- Status values: `Todo`, `In Progress`, `Blocked`, `Done`.
- Update `Owner`, `Target`, and `Status` per task as work progresses.
- C2 closes only when all tasks and all C2 gates are `Done`.

## C2 Strict Done Policy
- C2 is production hardening, not baseline/prototype work.
- `Done` means implementation + stress validation + docs + CI evidence.
- No task may be marked `Done` without executable fixture evidence when runtime behavior is in scope.

## Workstream A: ARC Core + Cycle Strategy Lock

| ID | Task | Depends On | Owner | Target | Status | Done When |
|---|---|---|---|---|---|---|
| C2-01 | Lock ARC object/header layout for object/array/string/collection handles (refcount size, saturation guard, metadata fields) | - | Codex | 2026-03-10 | Done (Locked) | Header contract documented + runtime/ABI tests pass |
| C2-02 | Implement ARC retain/release fast-path + null/no-op behavior | C2-01 | Codex | 2026-03-10 | Done (Locked) | Deterministic retain/release behavior validated in unit tests |
| C2-03 | Implement ARC slow-path and teardown sequencing | C2-02 | Codex | 2026-03-10 | Done (Locked) | Teardown order deterministic + no missed-release cases in fixtures |
| C2-04 | Implement deterministic retain/release insertion across assignment/call/return/field/container mutation boundaries | C2-02 | Codex | 2026-03-10 | Done (Locked) | Insertion-point lock tests pass |
| C2-05 | Lock and implement cycle strategy: background trial-deletion detector + generational cadence | C2-03 | Codex | 2026-03-10 | Done (Locked) | Young/full cycle passes run deterministically and reclaim eligible cycles |
| C2-06 | Implement weak-reference runtime support (optimization/escape hatch) | C2-05 | Codex | 2026-03-10 | Done (Locked) | Weak-ref cache/listener patterns validated |
| C2-07 | Lock ARC failure semantics (refcount saturation, detector lag behavior) | C2-05 | Codex | 2026-03-10 | Done (Locked) | Failure-path diagnostics deterministic and documented |

## Workstream B: Container Growth + Heap Semantics

| ID | Task | Depends On | Owner | Target | Status | Done When |
|---|---|---|---|---|---|---|
| C2-08 | Define heap allocation policy and alignment guarantees for runtime objects, including dynamic per-array backing storage (remove fixed table caps) | C2-01 | Codex | 2026-03-10 | Done (Locked) | Allocation contract documented and emitted in native plan; allocator lock tests pass |
| C2-09 | Implement `Array/List/ArrayList/Map` growth policy (init capacity, growth factor, copy/realloc rules) | C2-08 | Codex | 2026-03-10 | Done (Locked) | Resize behavior deterministic in fixture runs |
| C2-10 | Implement shrink policy with anti-thrashing hysteresis | C2-09 | Codex | 2026-03-10 | Done (Locked) | Repeated grow/shrink tests show stable behavior |
| C2-11 | Lock retain/release ownership semantics for add/remove/replace/clear and map key/value paths | C2-04, C2-09 | Codex | 2026-03-10 | Done (Locked) | Ownership conformance tests pass for nested containers |
| C2-12 | Lock OOM and allocation-failure behavior for runtime/container operations | C2-08 | Codex | 2026-03-10 | Done (Locked) | Deterministic fatal/diagnostic behavior validated in failure fixtures |

C2-08 progress notes:
- native runtime arrays now allocate per-instance int/string lane buffers on heap (`HeapAlloc`) sized from requested length.
- ARC teardown now frees array heap buffers (`HeapFree`) and clears array lane pointers deterministically.
- fixed shared array element tables were removed from runtime emit.
- runtime handle-slot capacity now grows at runtime (tuned `initial=63`, doubling) under ABI v2 32/32 handle semantics, with deterministic failure behavior on allocator/growth failure paths.
- current runtime handle-slot space uses ABI v2 `slot32` semantics: dynamic growth from `initial=63` up to the `u32` slot domain hard ceiling (`4294967295` slot-capacity value, with slot `0` reserved as null).
- current runtime array max length is `2147483647` elements (`int` max); `arrayNew(2147483647)` is accepted by bounds and then governed by deterministic allocator/OOM behavior.
- current runtime list/map max capacity is also `2147483647` elements/entries (`int` max) with deterministic exhaustion failure beyond that cap.
- allocator policy/alignment contract is locked in docs + `native.plan.json` (`pulsec.alloc.policy.v1`) and covered by C2 stage-lock tests.

C2-12 progress notes:
- deterministic array-allocation failure path is now runtime-enforced (`Array allocation failed`, non-zero exit).
- C2 lock coverage added for oversized array allocation failure behavior in split native mode.
- deterministic list/map/string growth/allocation failure paths are now runtime-enforced (`List capacity exhausted`, `Map capacity exhausted`, `String allocation failed`, `List allocation failed`, `Map allocation failed`).
- C2 lock coverage added for list/map/string growth failure behavior in split native mode.

C2-09 progress notes:
- list/map runtime storage now uses per-instance heap-backed lanes with explicit runtime capacity tracking (`init_capacity=16`, growth factor `2/1`, max `2147483647`).
- list/map growth uses allocate-copy-free semantics with deterministic metadata updates on success.
- stale-handle and ARC teardown paths were hardened for dynamic list/map storage (slot/generation safety preserved).
- C2 lock tests now assert growth succeeds for > init-capacity workloads (`lock_c2_12_list_growth_scales_without_panic`, `lock_c2_12_map_growth_scales_without_panic`).

C2-10 progress notes:
- list/map clear paths now support shrink with hysteresis (`hysteresis_trigger_multiplier=4`) to avoid aggressive reallocation thrash.
- `Intrinsics.mapClear(int)` was added to the runtime ABI surface and `Map`/`HashMap` clear paths now use it.
- C2 lock coverage now includes repeated grow/clear validation (`lock_c2_10_container_shrink_hysteresis_executes`).

C2-11 progress notes:
- runtime container mutation paths now emit retain/release ownership hooks:
  - `listAddString` retains inserted String handles.
  - `listClear`, `mapPut` (replace), `mapClear`, and ARC teardown for list/map release owned String/key handles deterministically.
- list runtime now tracks element-kind lane state (`rt_list_kind`) so release paths only run for String-backed list payloads.
- C2 lock coverage now includes ownership-specific executable/asm locks:
  - `lock_c2_11_list_string_ownership_retain_and_clear_release`
  - `lock_c2_11_map_string_ownership_replace_and_clear_release`

## Workstream C: ABI v2 Transition Hardening (64-bit Handles)

| ID | Task | Depends On | Owner | Target | Status | Done When |
|---|---|---|---|---|---|---|
| C2-13 | Lock ABI v2 contract (`u64` handles, symbol/version policy, null/stale semantics, compatibility model) | C2-01 | Codex | 2026-03-10 | Done (Locked) | `RUNTIME_INTRINSICS_ABI.md` defines `abi_version=v2` + 64-bit handle schema with deterministic mismatch behavior |
| C2-14 | Migrate compiler/stdlib intrinsic surface from handle-`int` to handle-`long` (semantic/typecheck + stdlib call sites) | C2-13 | Codex | 2026-03-10 | Done (Locked) | `com.pulse.rt.Intrinsics` handle-bearing APIs are `long`-based and all `check/build` fixtures pass |
| C2-15 | Migrate backend/runtime to 64-bit handle ops and dynamic metadata tables (remove fixed-slot ceiling behavior) | C2-13, C2-14 | Codex | 2026-03-10 | Done (Locked) | Runtime uses heap-backed growable metadata domains; handle ops are 64-bit end-to-end with deterministic OOM |
| C2-16 | Add ABI v2 lock fixtures (compat mismatch, stale/generation checks, growth beyond legacy limits) | C2-15 | Codex | 2026-03-10 | Done (Locked) | Stage-lock fixtures prove v2 invariants (markers, stale/generation, growth > legacy limits); runtime mismatch fail-fast is now locked by C2-24 |
| C2-16.1 | Finalize ABI v2 32/32 handle packing + low-capacity hardening (slot32 + high-32 generation) | C2-16 | Codex | 2026-03-10 | Done (Locked) | Runtime encode/decode paths use 32-bit slot + 32-bit generation packing consistently, bootstrap capacity is tuned to `initial=63`, low-capacity fixtures are validated (`>=1`), and full suite is green at tuned baseline |
| C2-16.2 | Raise container max-cap and allocation byte math to full `int` domain (`2147483647`) with 64-bit heap-size emission | C2-16.1 | Codex | 2026-03-10 | Done (Locked) | Array/list/map cap checks are locked to `int` max, runtime byte-size temp lane is 64-bit (`dq`), growth/new paths emit 64-bit `HeapAlloc` size arguments, and lock/full suites are green |

C2-13 progress notes:
- native build plan now emits runtime ABI marker (`"abi_version": "v2"`).
- ABI v2 contract section was added to `docs/RUNTIME_INTRINSICS_ABI.md` (version lock + compatibility model + target 64-bit handle schema).
- stage-lock/native-plan tests were updated to assert ABI version metadata presence.

C2-14 progress notes:
- stdlib `com.pulse.rt.Intrinsics` handle-bearing APIs were migrated to `long` (`array*`, `list*`, `map*`, `arcRetain/arcRelease`, `weak*`).
- stdlib collection/io handle fields were migrated to `long` (`Array`, `ArrayList`, `LinkedList`, `Map`, `HashMap`, `HashSet`, `Files`).
- semantic builtin metadata for `com.pulse.rt.Intrinsics` was migrated to `long` signatures so typecheck aligns with stdlib surface.
- C2/core lock fixtures were updated for `long` handle usage; full `cargo test` is green.

C2-15 progress notes:
- backend call argument marshalling now preserves `long/ulong` width across Win64 call boundaries (`rcx/rdx/r8/r9`, `qword` spill/load paths) instead of truncating through 32-bit moves.
- backend method param/local storage paths now use typed width for `long/ulong` (`qword` in stack locals/params), and return-preserve spill paths now retain full `rax` width.
- backend long-literal emission now uses 64-bit immediates (`mov rax, <literal>`) for `long/ulong`-typed literals, with lock coverage to prevent regression.
- ARC retain/release call boundaries now pass handle values through `rcx/rax` instead of `ecx/eax`, removing another implicit 32-bit truncation point in ABI v2 paths.
- panic and console-write handle call paths now pass through `rcx/rax` in runtime/error codegen paths (no handle downcast in those bridges).
- split/full backend runtime data-table declarations are now centralized in one emit helper, so dynamic metadata-domain migration can be done once and applied consistently.
- runtime table row declarations now derive from handle-capacity constants in the shared helper (no scattered hardcoded `65536` rows), preventing cap/row mismatch during migration.
- legacy fixed ceiling paths were lifted from 16-bit-era limits into ABI v2 32/32 slot/generation handling, removing hardcoded narrow-slot saturation behavior across backend/runtime emission.
- weak allocator lock coverage now validates growth past early fixed-era slot ceilings without early exhaustion, while retaining emitted weak-exhaustion diagnostic symbols in runtime asm.
- C2 lock suite and full workspace tests remain green after 64-bit propagation changes.
- ARC metadata lanes now grow through `pulsec_rt_ensureSlotCapacity` with heap-backed table swap/copy semantics (refcount/kind/flags/meta/generation/free-next).
- Win64 call-site safety fixes were applied for slot-growth paths (shadow-space + volatile register preservation in `weakNew` and ARC slot alloc paths).
- remaining C2-15 scope: migrate non-ARC metadata domains (`rt_arr_*`, `rt_list_*`, `rt_map_*`, `rt_weak_*`) from fixed static `dup(...)` tables to heap-backed growable tables, then remove the remaining configured ceiling.
- migration inventory is now enumerated from backend emission surface (direct indexed table access hotspots):
  - high-frequency tables: `rt_arc_refcounts`, `rt_arc_generation`, `rt_arc_kinds`, `rt_map_*`, `rt_list_*`
  - medium/low-frequency tables: `rt_arr_*`, `rt_arc_flags/meta/free_next`, `rt_weak_*`
  - trace arrays (`rt_trace_*`) remain static/non-slot domains and are out of no-ceiling slot-table scope.
- weak-table migration chunk completed:
  - runtime emits weak table pointer roots (`rt_weak_free_next_ptr`, `rt_weak_target_slot_ptr`, `rt_weak_target_gen_ptr`, `rt_weak_generation_ptr`) and initializes them in `pulsec_rt_init`.
  - `weakNew`, `weakGet`, and `weakClear` were switched from direct static-table indexing to pointer-based addressing via those roots.
  - `pulsec_rt_ensureSlotCapacity` now allocates/copies/swaps/frees weak metadata lanes alongside ARC lanes, with `rt_weak_heap_owned` tracking heap ownership for deterministic cleanup.
- ARC table growth migration chunk completed:
  - ARC table storage symbols were separated (`*_tbl`) and runtime code now accesses ARC lanes through register-based aliases (`rt_arc_refcounts/kinds/flags/meta/generation/free_next`) initialized in `pulsec_rt_init`.
  - alias collisions were resolved by renaming the ARC generation overflow diagnostic symbol to `rt_arc_gen_overflow_err`.
  - `pulsec_rt_ensureSlotCapacity` now allocates/copies/swaps ARC table bases and updates runtime capacity deterministically.
- non-ARC metadata growth migration chunk completed:
  - `pulsec_rt_ensureSlotCapacity` now grows/copies/swaps/frees array/list/map metadata lanes via pointer roots (`rt_arr_*_ptr`, `rt_list_*_ptr`, `rt_map_*_ptr`) for both `dd` and `dq` lane types.
  - per-domain heap ownership flags (`rt_arr_heap_owned`, `rt_list_heap_owned`, `rt_map_heap_owned`) are now respected during growth and set once migration to heap-backed tables occurs.
  - lock and fixture evidence remained green after migration (`stage_locks_c2`, strict/repeated soak fixture executes, full `cargo test`).
- fixed-ceiling removal completed for runtime handle slots:
  - runtime bootstrap table rows now use initial capacity (`63 + 1`) instead of max-ceiling rows.
  - slot-growth behavior follows ABI v2 32/32 handle semantics (`slot32 + generation32`) rather than legacy bounded-ceiling assumptions.
  - lock tests now assert removal of the legacy `1048575` growth compare immediate in emitted runtime asm.
- C2-16 fixture lock set completed:
  - ABI v2 marker lock validates `native.plan.json` + runtime asm carry `abi_version=v2` and slot-mask growth ceiling paths.
  - forged generation mismatch lock validates deterministic stale-handle panic behavior.
  - >65535 growth lock validates runtime slot growth beyond legacy 16-bit-era thresholds.
- non-ARC pointer-root migration hardening:
  - array/list/map runtime accesses were switched to pointer-root lanes (`rt_arr_*_ptr`, `rt_list_*_ptr`, `rt_map_*_ptr`) in allocation, clear, get/set, and teardown paths.
  - split stdlib `IO.asm` x64 addressing regression was fixed (`rax+rcx*` addressing; no mixed-width index addressing).
  - list/map growth-cap metadata clobber bug was fixed (pointer load no longer overwrites new-cap register before store).
  - executable soak fixtures are green again (`strict_stress_soak`, `stress_soak`) and full `cargo test` is green after these fixes.
- C2-16.1 hardening completed:
  - handle packing/unpacking now consistently uses ABI v2 `slot32 | (generation32 << 32)` across runtime encode/decode call paths.
  - stale-handle guards now validate generation from the high 32 bits deterministically.
  - `pulsec_rt_ensureSlotCapacity` now grows string metadata lanes alongside ARC/array/list/map/weak lanes.
  - `pulsec_rt_stringFromBytes` now preserves volatile source inputs across growth calls (prevents growth-boundary copy faults).
  - object-instance field slot capacity is aligned with the runtime initial-capacity baseline.
  - low-capacity validation is complete: `1,3,7,15,31,63,127,255,511,1023` pass fixture gates; `0` fails as expected.
- C2-16.2 hardening completed:
  - array/list/map runtime cap checks now lock to `2147483647` (`int` max) instead of `536870911`.
  - runtime temp byte-size lane for container allocation is now `dq` (`rt_tmp_arr_bytes`) and allocator calls now pass full-width `r8` size.
  - list/map grow math was hardened to avoid signed overflow behavior near the upper `int` range while preserving deterministic failure semantics at cap/OOM boundaries.

## Workstream D: Backend Stack-Frame + ABI Call Hardening

| ID | Task | Depends On | Owner | Target | Status | Done When |
|---|---|---|---|---|---|---|
| C2-17 | Implement per-method stack-frame planner (no blanket `sub rsp`) | - | Codex | 2026-03-10 | Done (Locked) | Frame sizing is computed from per-method locals + binary-temp slots + ARC spill lanes (no fixed `1024/3072` scratch offsets) and lock tests assert bounded prologues |
| C2-18 | Enforce Win64 call-site alignment + shadow-space correctness + outgoing stack-arg planning | C2-17 | Codex | 2026-03-10 | Done (Locked) | Calls with >4 total args emit outgoing stack args in Win64 call area (`[rsp+32+]`), callee param decoding reads incoming stack args correctly, and ABI conformance fixture coverage is green |
| C2-19 | Add frame-size guard/lint thresholds in build/test pipeline | C2-17 | Codex | 2026-03-10 | Done (Locked) | Build enforces frame fail-threshold with deterministic diagnostics, native plan exposes frame budget metadata, and lock fixtures validate lint/fail behavior |
| C2-20 | Add regression checks for `runtime_mix` (`GameLoop.asm`) frame inflation | C2-17 | Codex | 2026-03-10 | Done (Locked) | Runtime-mix lock fixture asserts bounded `GameLoop.asm` prologue/frame size and executable stability (`runtime_mix_ok`) |

C2-17 progress notes:
- MASM method frame sizing now derives from real per-method requirements (locals/params + binary temp slots + ARC arg/release scratch), removing fixed scratch assumptions in frame planning.
- binary expression temps now use dense per-method temp slots (no `value.id` sparse-offset inflation).
- method call ARC spill offsets now derive from per-method frame layout instead of fixed bases.
- lock test `lock_c2_17_method_frames_do_not_use_fixed_scratch_offsets` validates generated method asm avoids legacy `[rsp+1024]` / `[rsp+3072]` scratch references and stays bounded for simple methods.

C2-18 progress notes:
- call lowering now supports outgoing stack args for >4 total Win64 call args and writes them in the correct call area (`[rsp+32+]`) while preserving register arg lanes.
- callee parameter materialization now decodes stack-passed incoming args (static: param index `>=4`; instance: param index `>=3`) from incoming stack offsets and stores them into local param slots.
- prior `>4` / `>3` call-shape rejections in MASM call lowering were removed; same lowering path now handles varied call shapes through shared arg boundary logic.
- lock test `lock_c2_18_win64_outgoing_stack_args_work_for_static_and_instance_calls` validates executable behavior for static and instance 5-arg calls and asserts outgoing stack-arg emission in generated asm.

C2-19 progress notes:
- frame budget thresholds are now locked in backend (`warn=1024B`, `fail=4096B`) and emitted in `native.plan.json` under `runtime.memory_model.frame_budget`.
- build pipeline now enforces fail-threshold deterministically before native codegen; oversized methods fail with explicit offender method diagnostics.
- lock coverage:
  - plan-lock assertions now validate frame-budget metadata in C2 stage-lock tests.
  - `lock_c2_19_frame_budget_lint_fails_build_with_clear_diagnostic` validates deterministic lint failure path and method-name diagnostics.

C2-20 progress notes:
- runtime-mix regression lock `lock_c2_20_runtime_mix_gameloop_frame_is_bounded_and_executable` now validates `GameLoop.asm` frame prologue remains bounded (`sub rsp <= 4096`) in split-native mode.
- same lock verifies runtime behavior remains stable by running produced fixture executable and asserting `runtime_mix_ok`.
- this closes Workstream D execution locks (`C2-17`..`C2-20`) at current C2 scope.

C2-21 progress notes:
- runtime debug-allocator mode toggle was added (`PULSEC_DEBUG_ALLOC=1|true|yes|on`) and is emitted in `native.plan.json` under `runtime.memory_model.debug_allocator.enabled`.
- ARC retain/release invalid-handle paths now fail-fast in debug mode with deterministic diagnostics:
  - `Debug allocator: invalid ARC retain`
  - `Debug allocator: invalid ARC release`
- lock tests added and passing:
  - `lock_c2_21_debug_allocator_double_release_panics_deterministically`
  - `lock_c2_21_debug_allocator_retain_after_release_panics_deterministically`
- full regression verification after rollout is green (`cargo test -q`).

C2-22 progress notes:
- leak/stability soak lock test added: `lock_c2_22_soak_memory_trend_is_stable`.
- lock executes repeated `strict_stress_soak` build+run cycles and enforces:
  - no stub fallback (`status=linked` required),
  - deterministic runtime output (`soak_ok`, checksum `40415`),
  - bounded memory trend via peak working-set spread/drift thresholds over post-warmup iterations.
- trend thresholds are configurable for CI environments:
  - `PULSEC_SOAK_TREND_ITERS` (default `8`, min `5`),
  - `PULSEC_SOAK_PEAK_SPREAD_BYTES` (default `12582912`),
  - `PULSEC_SOAK_PEAK_DRIFT_BYTES` (default `8388608`).
- verification is green: `cargo test -q -p pulsec --test stage_locks_c2` and full `cargo test -q`.

C2-23 progress notes:
- runtime threading contract is now explicitly locked in `docs/RUNTIME_INTRINSICS_ABI.md` (`C2-23 threading model lock`):
  - `schema: pulsec.runtime.threading.v1`
  - `model: single-threaded`
  - `arc_atomicity: non-atomic`
  - `runtime_thread_safety: not-thread-safe`
  - `container_thread_safety: not-thread-safe`
- native plan emission now includes `runtime.memory_model.threading` with the same fields.
- lock coverage added:
  - backend unit lock: `c2_23_native_plan_contains_threading_contract`
  - stage lock: `lock_c2_23_threading_contract_is_documented_and_emitted`
- full regression verification is green (`cargo test -q`).

C2-24 progress notes:
- runtime ABI compatibility contract is now locked in docs (`C2-24 runtime ABI compatibility lock`) with schema `pulsec.runtime.abi.v1`.
- native plan now emits `runtime.abi_compatibility` fields:
  - `compiler_abi_version`
  - `runtime_abi_version`
  - `mismatch_policy: deterministic-fail-fast`
- runtime init now checks `rt_runtime_abi_version` vs `rt_compiler_abi_expected` before runtime-table initialization and exits non-zero on mismatch with `Runtime ABI mismatch`.
- lock coverage added:
  - backend unit lock: `c2_24_native_plan_contains_abi_compatibility_contract`
  - stage lock: `lock_c2_24_runtime_abi_mismatch_fails_deterministically`
- controlled mismatch testing is supported via `PULSEC_FORCE_RUNTIME_ABI_VERSION`; full suite is green (`cargo test -q`).

C2-25 progress notes:
- closure artifact package is now published and cross-linked:
  - [C2_CLOSURE_CHECKLIST.md](/D:/Programming/codex/PulseCode/docs/C2_CLOSURE_CHECKLIST.md)
  - [C2_MEMORY_ARC.md](/D:/Programming/codex/PulseCode/docs/C2_MEMORY_ARC.md)
  - [C2_CYCLE_STRATEGY.md](/D:/Programming/codex/PulseCode/docs/C2_CYCLE_STRATEGY.md)
  - [C2_CI_MATRIX.md](/D:/Programming/codex/PulseCode/docs/C2_CI_MATRIX.md)
  - [C2_EVIDENCE_INDEX.md](/D:/Programming/codex/PulseCode/docs/C2_EVIDENCE_INDEX.md)
- C2 closure evidence:
  - `cargo test -q -p pulsec --test stage_locks_c2` is green (`33/33`)
  - `cargo test -q` is green (full workspace)
- C2 tasks and gates are now fully locked (`C2-01`..`C2-25`, `C2-G1`..`C2-G12`).

## Workstream E: Reliability + CI + Tooling Gates

| ID | Task | Depends On | Owner | Target | Status | Done When |
|---|---|---|---|---|---|---|
| C2-21 | Add deterministic debug allocator mode (poisoning/guards for UAF + double-release detection) | C2-08 | Codex | 2026-03-10 | Done (Locked) | Debug allocator catches targeted invalid-memory fixtures |
| C2-22 | Add leak/stability CI soak job with trend-based failure thresholds | C2-11, C2-12 | Codex | 2026-03-10 | Done (Locked) | CI gate fails on memory growth trend regressions |
| C2-23 | Lock threading memory model (ARC atomicity + container/runtime thread-safety boundaries) | C2-04 | Codex | 2026-03-10 | Done (Locked) | Concurrency contract documented + lock tests added |
| C2-24 | Add runtime ABI versioning + compiler/runtime compatibility checks | C2-13, C2-15 | Codex | 2026-03-10 | Done (Locked) | ABI mismatch is detected and fails deterministically |
| C2-25 | Publish C2 closure artifacts (`C2 closure checklist`, allocator/ARC docs, cycle strategy docs, CI matrix) | C2-22, C2-23, C2-24, C2-20 | Codex | 2026-03-10 | Done (Locked) | C2 closure docs complete and cross-linked |

## C2 Test Gates (all required)

| Gate ID | Gate | Command / Evidence | Status |
|---|---|---|---|
| C2-G1 | ARC operation correctness | targeted ARC insertion/teardown tests + fixture runs | Done (Locked) |
| C2-G2 | Cycle reclamation correctness | deterministic cycle fixtures (parent/child, doubly-linked, observer) | Done (Locked) |
| C2-G3 | Weak-reference behavior | cache/listener weak-ref fixtures pass | Done (Locked) |
| C2-G4 | Container growth/shrink semantics | capacity/retention/hysteresis fixtures pass | Done (Locked) |
| C2-G5 | OOM/failure determinism | failure fixtures emit deterministic diagnostics/exits | Done (Locked) |
| C2-G6 | ABI v2 transition correctness | 64-bit handle fixtures + compatibility invariants + generation/stale locks pass | Done (Locked) |
| C2-G7 | Debug allocator detection | UAF/double-release fixture checks pass in debug mode | Done (Locked) |
| C2-G8 | Leak/soak CI stability | repeated soak runs pass trend thresholds | Done (Locked) |
| C2-G9 | Threading model conformance | atomicity/thread-safety lock tests pass | Done (Locked) |
| C2-G10 | Runtime ABI version compatibility | mismatch tests fail deterministically, match tests pass | Done (Locked) |
| C2-G11 | Docs and closure package | closure checklist + strategy docs + evidence index complete | Done (Locked) |
| C2-G12 | Stack-frame/Win64 ABI call correctness | prologue bounds + alignment/shadow-space/outgoing-args fixtures pass | Done (Locked) |

## Suggested First 2 Sprints

### Sprint 1 (Core memory contracts)
- Target tasks: `C2-01`..`C2-07`, `C2-08`
- Focus: ARC contract + cycle strategy lock + allocator baseline
- Exit checks:
  - `C2-G1` green at baseline level
  - cycle strategy implemented (`C2-05`) with deterministic fixture proof
  - no regressions in existing fixture suites

### Sprint 2 (Runtime behavior + ABI v2 transition)
- Target tasks: `C2-09`..`C2-16`
- Focus: container growth/shrink semantics + OOM behavior + ABI v2 transition
- Exit checks:
  - `C2-G4`, `C2-G5`, `C2-G6` green
  - ABI mismatch fixtures fail deterministically
  - lock tests prove growth beyond legacy slot limits

## Exit Criteria

| Milestone | Exit Criteria |
|---|---|
| C2 | Tasks `C2-01`..`C2-25` and gates `C2-G1`..`C2-G12` are all `Done` |
| Phase C Exit | C2 exit criteria complete and Phase C deliverable gates in roadmap are all satisfied |

