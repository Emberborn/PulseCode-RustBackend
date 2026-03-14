# Runtime Intrinsics ABI (Phase C Baseline)

## Purpose
Define a stable boundary between:
- PulseCode stdlib surface APIs (implemented in `.pulse` over time), and
- thin native runtime shims needed for platform primitives.

This keeps backend/platform details behind a narrow ABI while letting most runtime logic move into PulseCode source.

## ABI Version Lock (C2-13)
- Locked transition target: `abi_version = v2` (64-bit handle ABI).
- Compiler build artifacts (`native.plan.json`) must emit runtime ABI version metadata.
- Compatibility policy:
  - compiler/runtime ABI version mismatch is deterministic fail-fast (non-zero exit with diagnostic).
  - v2 transition hardening tracks compatibility checks under C2 (`C2-13`/`C2-16`/`C2-24`).
- Transition state: C2-24 lock enforces runtime init mismatch fail-fast and native plan compatibility metadata.

## Current Status
- Baseline intrinsic owner class is available in semantics/import system:
  - `com.pulse.rt.Intrinsics`
- Native backend maps intrinsic calls to runtime symbols.
- Public console API surface now includes:
  - `com.pulse.lang.System.out.println(...)` / `print(...)`
  - `com.pulse.lang.IO.println(...)` / `print(...)` (alias convenience)
- `System.out` is currently treated as a runtime-managed singleton handle in backend lowering.
  - It is intentionally not initialized via PulseCode source.
  - The language surface is locked as immutable (`public static final`) and semantic assignment to `System.out` is rejected.
  - `stdlib/src/com/pulse/lang/IO.pulse` and `PrintStream.pulse` now delegate to `Intrinsics.consoleWrite*`.
 - `com.pulse.lang.String` class surface exists and delegates to String intrinsics:
   - `length()`
   - `concat(String)`
   - `valueOf(int|boolean)` (static)
- M3 coverage lock:
  - `com.pulse.collections` (`Array`, `ArrayList`, `LinkedList`, `HashSet`, `HashMap`, queue/deque adapters)
  - `com.pulse.io` (`File`, `Files`, `Path`, `InputStream`, `OutputStream`)
  - `com.pulse.math.Random`
  use the intrinsic set below (primarily `array*`, `list*`, `map*`, and String conversion/concat intrinsics).
  No additional native ABI symbols were introduced for these surfaces in C1.5.

## Intrinsic Surface (Current)
- `Intrinsics.consoleWrite(String|int|boolean) -> void`
- `Intrinsics.consoleWriteLine(String|int|boolean) -> void`
- `Intrinsics.panic(String) -> void` (prints message and terminates process with non-zero exit)
- `Intrinsics.stringConcat(String, String) -> String`
- `Intrinsics.stringLength(String) -> int`
- `Intrinsics.intToString(int) -> String`
- `Intrinsics.booleanToString(boolean) -> String`
- `Intrinsics.parseInt(String) -> int`
- `Intrinsics.parseBoolean(String) -> boolean`
- `Intrinsics.objectClassName(Object) -> String`
- `Intrinsics.objectHashCode(Object) -> int`
- `Class.runtimeSimpleName(String) -> String`
- `Class.runtimePackageName(String) -> String`
- `String.runtimeCharAt(String, int) -> char`
- `Double.runtimeCharAt(String, int) -> char`
- `Long.runtimeParse(String) -> long`
- `Long.runtimeToString(long) -> String`
- `UInteger.runtimeParse(String) -> uint`
- `UInteger.runtimeToString(uint) -> String`
- `ULong.runtimeParse(String) -> ulong`
- `ULong.runtimeToString(ulong) -> String`
- floating wrapper parse/format does not add new runtime ABI in F1; `Float` / `Double` text conversion is currently stdlib-owned on top of the shipped numeric/string surface
- `String.runtimeSubstring(String, int, int) -> String`
- `String.runtimeFromChar(char) -> String`
- Collections/array runtime surface:
  - `Intrinsics.arrayNew(int) -> long`
  - `Intrinsics.arrayNewMulti(int, long) -> long`
  - `Intrinsics.arrayLength(long) -> int`
  - `Intrinsics.arrayGetInt(long, int) -> int`
  - `Intrinsics.arraySetInt(long, int, int) -> void`
  - `Intrinsics.arrayGetLong(long, int) -> long`
  - `Intrinsics.arraySetLong(long, int, long) -> void`
  - `Intrinsics.arrayGetString(long, int) -> String`
  - `Intrinsics.arraySetString(long, int, String) -> void`
  - `Intrinsics.listNew() -> long`
  - `Intrinsics.listSize(long) -> int`
  - `Intrinsics.listClear(long) -> void`
  - `Intrinsics.listAddInt(long, int) -> void`
  - `Intrinsics.listAddString(long, String) -> void`
  - `Intrinsics.listGetInt(long, int) -> int`
  - `Intrinsics.listGetString(long, int) -> String`
  - `Intrinsics.mapNew() -> long`
  - `Intrinsics.mapSize(long) -> int`
  - `Intrinsics.mapClear(long) -> void`
  - `Intrinsics.mapContainsKey(long, String) -> boolean`
  - `Intrinsics.mapPut(long, String, String) -> void`
  - `Intrinsics.mapPutInt(long, String, int) -> void`
  - `Intrinsics.mapGet(long, String) -> String`
  - `Intrinsics.mapGetInt(long, String) -> int`
  - `Memory.retain(long) -> long`
  - `Memory.release(long) -> void`
  - `Memory.cycleYoungPass() -> int`
  - `Memory.cycleFullPass() -> int`
  - `Memory.cycleTick() -> int`
  - `Memory.weakNew(String) -> long`
  - `Memory.weakGet(long) -> String`
  - `Memory.weakClear(long) -> void`

## Native Symbols (Current)
- `pulsec_rt_consoleWrite`
- `pulsec_rt_consoleWriteLine`
- `pulsec_rt_panic`
- Planned/locked naming for String bridge:
  - `pulsec_rt_stringConcat`
  - `pulsec_rt_stringLength`
  - `pulsec_rt_intToString`
  - `pulsec_rt_booleanToString`
  - `pulsec_rt_parseInt`
  - `pulsec_rt_parseBoolean`
  - `pulsec_rt_longToString`
  - `pulsec_rt_parseLong`
  - `pulsec_rt_uintToString`
  - `pulsec_rt_parseUInt`
  - `pulsec_rt_ulongToString`
  - `pulsec_rt_parseULong`
  - `pulsec_rt_objectClassName`
  - `pulsec_rt_objectHashCode`
  - `pulsec_rt_classSimpleName`
  - `pulsec_rt_classPackageName`
  - `pulsec_rt_stringCharAt`
  - `pulsec_rt_stringSubstring`
  - `pulsec_rt_charToString`
  - internal helper used by backend/runtime bridge:
    - `pulsec_rt_stringFromBytes`

Collections/array bridge:
- `pulsec_rt_arrayNew`
- `pulsec_rt_arrayNewMulti`
- `pulsec_rt_arrayLength`
- `pulsec_rt_arrayGetInt`
- `pulsec_rt_arraySetInt`
- `pulsec_rt_arrayGetLong`
- `pulsec_rt_arraySetLong`
- `pulsec_rt_arrayGetString`
- `pulsec_rt_arraySetString`
- `pulsec_rt_listNew`
- `pulsec_rt_listSize`
- `pulsec_rt_listClear`
- `pulsec_rt_listAddInt`
- `pulsec_rt_listAddString`
- `pulsec_rt_listGetInt`
- `pulsec_rt_listGetString`
- `pulsec_rt_mapNew`
- `pulsec_rt_mapSize`
- `pulsec_rt_mapClear`
- `pulsec_rt_mapContainsKey`
- `pulsec_rt_mapPut`
- `pulsec_rt_mapPutInt`
- `pulsec_rt_mapGet`
- `pulsec_rt_mapGetInt`
- `pulsec_rt_arcRetain`
- `pulsec_rt_arcRelease`
- `pulsec_rt_arcCycleYoungPass`
- `pulsec_rt_arcCycleFullPass`
- `pulsec_rt_arcCycleTick`
- `pulsec_rt_weakNew`
- `pulsec_rt_weakGet`
- `pulsec_rt_weakClear`

F1 exception/runtime support surface:
- `pulsec_rt_throw`
- `pulsec_rt_traceUpdateTop`

These two symbols are runtime-private backend targets, not stdlib-facing `Intrinsics` methods:
- `pulsec_rt_throw`
  - consumes the current pending throwable handle and transfers control through the runtime exception-handler stack
  - if no handler is active, uncaught output falls back through the stdlib-owned `Throwable.panic()` path
- `pulsec_rt_traceUpdateTop`
  - updates the top runtime trace frame before executable statement regions
  - powers source-aware uncaught stack traces in the shipped F1 model

## String Interop Lock (C1.2)
Locked for current Phase C baseline:
- PulseCode `String` values are represented as opaque runtime handles in backend codegen.
- Current backend bridge passes/returns String handles through scalar integer register slots (Win64 ABI baseline).
- String literals are materialized through runtime helper `pulsec_rt_stringFromBytes(ptr, len) -> handle`.
- `null` lowers to zero handle.
- All String high-level operations must route through the intrinsic ABI boundary (directly or through stdlib `com.pulse.lang.String` methods):
  - `Intrinsics.stringConcat`
  - `Intrinsics.stringLength`
  - `Intrinsics.intToString`
  - `Intrinsics.booleanToString`

Current native runtime baseline behavior:
- runtime String/object handle tables use slot-indexed metadata with runtime slot-capacity growth (`initial=63`, doubling to max `4294967295`)
- `stringConcat`, `stringLength`, `intToString`, `booleanToString` have concrete runtime implementations in the shim
- console write intrinsics consume String handles and write resolved bytes to stdout

Contract stability notes:
- Symbol names above are now locked for C1/C2 implementation phases.
- Runtime/backend may change internal String object layout later, but must preserve this intrinsic call surface or version it explicitly.

## ARC Header Contract (C2-01)
Locked ARC/header contract for runtime handles used by object/array/string/collection runtime paths:

- Header schema id: `pulsec.arc.header.v1`
- Handle representation:
  - kind: `u64-handle (slot32 + generation32)`
  - `null` handle: `0`
  - slot bits: low 32 bits (`handle & 0x00000000FFFFFFFF`)
  - generation/version bits: upper 32 bits (`handle >> 32`)
  - runtime slot capacity grows at runtime from `63` using doubling growth, up to max `4294967295` in the current C2 lock.
- Header word layout (`4 x 32-bit words`):
  - word 0: `kind_tag`
  - word 1: `refcount`
  - word 2: `flags`
  - word 3: `meta_index`
- Refcount contract:
  - width: `32` bits
  - `refcount_saturation_guard`: `4294967294` (`0xFFFF_FFFE`)
  - overflow/saturation semantics are fail-fast and deterministic (detailed in C2 failure-semantics tasks)
- Kind tags:
  - object: `1`
  - array: `2`
  - string: `3`
  - collection: `4`

## ABI v2 Handle Contract (Locked)
- Handle wire type: `u64`.
- `null` handle: `0`.
- Slot/generation representation:
  - slot bits: low `32` bits (`handle & 0x00000000FFFFFFFF`)
  - generation/version bits: high `32` bits (`handle >> 32`)
- Stale-handle policy:
  - stale slot/generation mismatch is deterministic panic/fail-fast in runtime-backed APIs.
- Capacity policy:
  - runtime metadata domains must be heap-backed and growable (no fixed static slot ceiling behavior).
  - deterministic OOM/failure semantics remain mandatory.

Build artifact lock:
- `build/native.plan.json` must include `runtime.memory_model` with:
  - `strategy: "arc"`
  - `header_schema: "pulsec.arc.header.v1"`
  - `allocator.schema: "pulsec.alloc.policy.v1"`
  - `allocator.backend: "win64-process-heap"`
  - full `arc_header` layout fields above

C2-02 fast-path lock:
- `arcRetain(0)` and `arcRelease(0)` are deterministic no-ops.
- invalid handles are deterministic no-ops in current runtime baseline.
- encoded handles with generation/version are validated against `rt_arc_generation[slot]`.
- retain fails fast at `refcount_saturation_guard` (no wraparound) via deterministic `panic("ARC refcount saturation")`.

C2-03 slow-path + teardown lock:
- `arcRelease(handle)` decrements refcount; when it reaches `0`, teardown is invoked deterministically.
- allocation uses a unified global slot allocator (`rt_handle_next`) shared by string/array/list/map runtime domains.
- teardown now pushes reclaimed slots into ARC free-list state (`rt_arc_free_head` + `rt_arc_free_next`) for deterministic slot reuse.
- teardown sequencing is kind-aware using `arc_header.kind_tag` + `meta_index`:
  - string: clears length and payload bytes for the handle slot
  - array: clears length and releases heap-backed element storage for int/string lanes
  - collection/list: clears list size and element slots
  - collection/map: clears map size and key/tag/value slots
- after teardown, ARC header words are reset for the handle slot (`refcount`, `kind_tag`, `flags`, `meta_index`).
- runtime handle APIs (`list*`, `array*`, `map*`, `stringLength`) now enforce stale-handle failure:
  - if handle is in-range but released (`refcount == 0`), runtime emits deterministic `panic("Stale runtime handle")`.
  - if handle generation/version does not match the current slot generation, runtime emits deterministic `panic("Stale runtime handle")`.
  - stale-handle use is non-recoverable and exits non-zero.

C2-08 heap/allocation hardening (completed and locked):
- array runtime storage is moving to per-array heap-backed buffers (one 32-bit int lane + one 64-bit handle lane per array instance).
- fixed shared array element tables are no longer part of the target contract.
- `arrayNew(length)` storage sizing is based on requested runtime length (`length * 8` bytes per lane), bounded by runtime memory/OOM behavior rather than fixed table index caps.
- `arrayNewMulti(dimCount, lengthsPtr)` recursively builds nested arrays by composing `arrayNew` and `arraySetString` over the reference lane.
- allocation path uses `GetProcessHeap` + `HeapAlloc`/`HeapFree` in native runtime shims.
- alignment contract for array lanes: allocator-provided Win64 heap alignment (satisfies 4-byte element alignment for primitive int lanes and 8-byte alignment for handle lanes).
- allocator policy lock (`runtime.memory_model.allocator`):
  - `schema: "pulsec.alloc.policy.v1"`
  - `backend: "win64-process-heap"`
  - `slot_capacity: 4294967295`
  - `slot_capacity_initial: 63`
  - `slot_capacity_growth: runtime-doubling`
  - `alignment.pointer_bytes: 8`
  - `alignment.lane_bytes.int: 4`
  - `alignment.lane_bytes.handle: 8`
  - `array_storage.backing: "per-instance-heap"`
  - `container_storage.list.init_capacity: 16`
  - `container_storage.list.max_capacity: 2147483647`
  - `container_storage.list.growth_factor: 2/1`
  - `container_storage.list.shrink.hysteresis_trigger_multiplier: 4`
  - `container_storage.map.init_capacity: 16`
  - `container_storage.map.max_capacity: 2147483647`
  - `container_storage.map.growth_factor: 2/1`
  - `container_storage.map.shrink.hysteresis_trigger_multiplier: 4`
  - `failure_mode: "deterministic-fatal"`
- deterministic failure contract for array allocation:
  - if requested lane size overflows runtime-safe sizing bounds, runtime emits `Array allocation failed` and exits non-zero.
  - if heap allocation fails for either lane, runtime emits `Array allocation failed` and exits non-zero.
- deterministic growth/allocation failure contract for current container/string runtime paths:
  - list/map growth is dynamic (reallocate/copy) from init capacity using locked growth policy above.
  - list/map allocation or max-capacity failure emits deterministic fatal diagnostics (`List capacity exhausted` / `Map capacity exhausted`) and exits non-zero.
  - string allocation/growth overflow emits `String allocation failed` and exits non-zero.
  - list/map slot-allocation exhaustion emits `List allocation failed` / `Map allocation failed` and exits non-zero.

C2-23 threading model lock:
- current runtime contract is explicitly single-threaded:
  - `model: "single-threaded"`
  - `arc_atomicity: "non-atomic"`
  - `runtime_thread_safety: "not-thread-safe"`
  - `container_thread_safety: "not-thread-safe"`
- `native.plan.json` lock surface (`runtime.memory_model.threading`):
  - `schema: "pulsec.runtime.threading.v1"`
  - fields above are required and must remain stable for C2.
- boundary policy at current C2 scope:
  - no thread-safe/atomic ARC guarantees are provided.
  - runtime/container APIs are not safe for concurrent cross-thread mutation.
  - future threading work must version this contract (do not silently change semantics under the same schema id).

C2-24 runtime ABI compatibility lock:
- runtime init now enforces ABI compatibility before allocator/runtime table initialization.
- locked compatibility metadata is emitted under `native.plan.json`:
  - `runtime.abi_compatibility.schema = "pulsec.runtime.abi.v1"`
  - `runtime.abi_compatibility.compiler_abi_version = 2`
  - `runtime.abi_compatibility.runtime_abi_version = <emitted runtime abi>`
  - `runtime.abi_compatibility.mismatch_policy = "deterministic-fail-fast"`
- mismatch behavior:
  - if `runtime_abi_version != compiler_abi_version`, runtime exits non-zero with `Runtime ABI mismatch`.
- test/lock hook:
  - `PULSEC_FORCE_RUNTIME_ABI_VERSION` allows controlled mismatch emission for fixture/lock validation.

C3-01 object layout contract:
- instance object layout schema id is locked:
  - `runtime.object_model.schema: "pulsec.object.layout.v1"`
  - `runtime.object_model.layout_version: 1`
- current deterministic instance layout lock (`runtime.object_model.instance_layout`):
  - `header_bytes: 16`
  - `field_slot_bytes: 8`
  - `alignment_bytes: 8`
  - `field_ordering: "declaration-order"`
  - `inherited_field_placement: "base-prefix-then-derived"`
- inherited placement policy meaning:
  - base-class instance fields occupy the leading field slots.
  - derived-class instance fields are appended after inherited slots in declaration order.
  - future C3 object-allocation/runtime work may expand metadata surface, but this ordering contract is stable under schema `pulsec.object.layout.v1`.

C3-02 static-field storage contract:
- static storage schema is locked in native plan metadata:
  - `runtime.object_model.static_storage.schema: "pulsec.static.storage.v1"`
- static storage owner/symbol model:
  - `owner_model: "class-owned"`
  - `symbol_model: "per-class-field-symbol"`
- deterministic initialization order lock:
  - `initialization_order: "declaration-order-within-class"`
- static access policy lock:
  - `class_reference_read: "allowed"`
  - `class_reference_write: "allowed"`
  - `instance_reference_read: "forbidden"`
  - `instance_reference_write: "forbidden"`
- runtime/emit intent:
  - static fields are materialized as deterministic class-owned data symbols in native output.
  - static read/write behavior must remain deterministic across build/run fixtures under this schema.

C3-03 constructor invocation contract:
- constructor model schema is locked in native plan metadata:
  - `runtime.object_model.constructor_model.schema: "pulsec.constructor.model.v1"`
- constructor receiver/chaining lock:
  - `receiver_allocation: "allocated-before-body"`
  - `chaining: "explicit-this-super-unsupported"`
  - `implicit_super: "not-emitted"`
  - `return_behavior: "implicit-receiver"`
  - `failure_mode: "deterministic-fatal"`
- current scope note:
  - constructor bodies execute with an already-allocated receiver identity in backend lowering.
  - explicit constructor chaining (`this(...)` / `super(...)`) remains unsupported in current language surface and is locked as such for this schema.

C3-04 class allocation metadata contract:
- class allocation schema is locked in native plan metadata:
  - `runtime.object_model.allocation.schema: "pulsec.class.alloc.v1"`
- class-size model lock:
  - `size_formula: "header_bytes + (instance_field_count * field_slot_bytes)"`
  - `allocator_integration: "slot-allocator-with-class-size-metadata"`
  - `class_size_table`: deterministic per-class metadata rows containing:
    - `class`
    - `instance_field_count`
    - `inherited_instance_field_count` (currently `0` in runtime metadata baseline)
    - `instance_size_bytes`
- compatibility note:
  - this metadata lock formalizes variable logical class sizes by instance-field count.
  - runtime allocation remains slot-id based in current bridge path while class-size metadata is emitted deterministically for future allocator expansion.

C3-05 object-model plan emission lock:
- `native.plan.json` must emit `runtime.object_model` with all locked sections:
  - `instance_layout`
  - `static_storage`
  - `constructor_model`
  - `allocation`
- plan-lock tests must assert schema/version fields and required subkeys for each section.

C3-06 dispatch schema contract:
- dispatch schema is locked in native plan metadata:
  - `runtime.object_model.dispatch.schema: "pulsec.dispatch.schema.v1"`
- slot assignment policy lock:
  - `slot_assignment: "deterministic-lexicographic-signature"`
  - `slot_table`: deterministic class/method slot map emitted in plan metadata
- current implementation note:
  - runtime virtual/interface dispatch remains a planned runtime path (`virtual_call_mode` / `interface_call_mode` metadata) while schema and slot-map determinism are locked.

C3-07 runtime virtual dispatch contract:
- instance calls must resolve by receiver runtime class identity, not static-owner direct binding.
- runtime object allocation records receiver class id in runtime class-id table (`pulsec_rt_obj_class_ids`) keyed by object id.
- non-static class-hierarchy callsites compare runtime class id and route to the matching override symbol deterministically.
- if no override class-id match exists, callsites deterministically fall back to the resolved owner-chain default symbol.

C3-08 interface dispatch bridge contract:
- interface-typed instance calls must resolve through receiver runtime class-id to a concrete implementing method symbol.
- implementing classes are resolved from compiler-known interface implementation metadata (including superclass-inherited interface obligations).
- bridge dispatch compares receiver class-id against implementing class targets and invokes the matching concrete method deterministically.
- if no implementation match exists at runtime, dispatch falls back deterministically to the owner-chain default symbol path.

C3-09 override/super-call runtime contract:
- `super.method(...)` receiver identity is preserved in IR/runtime lowering and dispatches to immediate superclass target deterministically.
- super dispatch is non-virtual: subclass override selection is bypassed for `super.*` calls.
- final-override contract remains semantic fail-fast (`cannot override final method`) and is locked by build-failure fixtures.
- abstract contract failures remain semantic fail-fast (`Cannot instantiate abstract class ...`) and are lock-validated in stage tests.
- annotation processor contract baseline:
  - `@Override` is validated semantically and must bind to a superclass or interface method contract.
  - `@Override` on static methods or constructors is rejected semantically.
  - unknown/unsupported annotations currently fail fast in semantic analysis.

C3-10 safe devirtualization contract:
- direct-call fast paths are allowed only when behavior is equivalent to runtime virtual dispatch:
  - static calls
  - `super.*` calls (already non-virtual)
  - resolved target method is `final`
  - resolved target method is `private`
  - resolved owner class is `final`
- dispatch plan metadata lock (`runtime.object_model.dispatch.devirtualization`):
  - `mode: "safe-fast-paths"`
  - `rules: ["static-direct", "super-direct", "final-method-direct", "private-method-direct", "final-class-direct"]`
  - `parity_requirement: "behavioral-equivalence-with-runtime-dispatch"`

C3-11 runtime type-check boundary:
- `instanceof` expression runtime contract:
  - receiver value `null` yields `false`.
  - non-null receiver resolves runtime class-id from object class-id table.
  - result is `true` when runtime class-id is assignable to target class/interface; otherwise `false`.
- semantic front-door contract:
  - `instanceof` target must be a reference type and resolvable class/interface.
  - `instanceof` left operand must be reference-typed (or `null`).
- checked reference-cast runtime contract:
  - reference casts are checked at runtime for non-null receivers.
  - cast success preserves receiver handle/value.
  - cast mismatch triggers deterministic fail-fast panic with `Invalid cast`.
  - `null` reference casts are allowed and preserve `null`.

C3-12 runtime type-id/class-id contract:
- type-id schema is locked in native plan metadata:
  - `runtime.object_model.type_ids.schema: "pulsec.typeid.schema.v1"`
  - `class_id_width_bits: 32`
  - `source: "deterministic-class-order"`
  - `class_table`: deterministic class-id mapping entries
- runtime consumption lock:
  - virtual dispatch compares runtime object class-id loaded from `pulsec_rt_obj_class_ids`.
  - `instanceof` checks compare runtime object class-id loaded from `pulsec_rt_obj_class_ids`.
  - checked reference casts compare runtime object class-id loaded from `pulsec_rt_obj_class_ids`.

C3-13 dispatch-boundary null/type safety contract:
- runtime instance dispatch guard behavior is deterministic:
  - receiver handle `0` is invalid for instance dispatch and fails fast with `Null dispatch receiver`.
  - receiver runtime class-id not assignable to dispatch owner contract fails fast with `Invalid dispatch receiver type`.
- dispatch guards apply at runtime virtual/interface dispatch boundaries and must terminate with non-zero exit on misuse.

C3-14 object-model ABI compatibility contract:
- object-model ABI schema is locked in native plan metadata:
  - `runtime.object_model.abi_compatibility.schema: "pulsec.object_model.abi.v1"`
  - `version: 1`
  - `compiler_object_model_abi_version: 1`
  - `runtime_object_model_abi_version: <emitted runtime object-model ABI>`
  - `mismatch_policy: "deterministic-fail-fast"`
- compatibility policy note:
  - runtime init enforces object-model ABI compatibility before table initialization.
  - if `runtime_object_model_abi_version != compiler_object_model_abi_version`, runtime exits non-zero with `Object model ABI mismatch`.
  - `PULSEC_FORCE_OBJECT_MODEL_ABI_VERSION` allows controlled mismatch emission for fixture/lock validation.

C2-04 insertion-boundary lock:
- native codegen emits deterministic ARC boundary hooks for ARC-managed values at:
  - local/parameter assignment boundaries (`release old`, `retain new`)
  - field-write boundaries (`release old`, `retain new`)
  - call-argument boundaries (`retain` before call, `release` after call)
  - return boundary (`retain` of ARC-managed return handle before method exit)
- lock evidence:
  - `cargo test -p pulsec --test stage_locks_c2`
  - `lock_c2_04_arc_insertion_boundaries_emit_retain_release_sequences` validates generated asm contains ARC calls and executable behavior remains deterministic.

C2-11 container ownership lock:
- runtime container mutation paths now enforce deterministic String/key ownership transfer:
  - `listAddString` retains inserted String handles.
  - `listClear` and list ARC teardown release owned String handles before lane cleanup.
  - `mapPut`/`mapPutInt` release replaced String values when applicable.
  - map insertions retain key handles (and retained String values for `mapPut`).
  - `mapClear` and map ARC teardown release owned key/value handles before lane cleanup.
- lock evidence:
  - `cargo test -p pulsec --test stage_locks_c2`
  - `lock_c2_11_list_string_ownership_retain_and_clear_release`
  - `lock_c2_11_map_string_ownership_replace_and_clear_release`

C2-05 cycle-strategy lock:
- intrinsic ABI surface is locked for cycle cadence operations:
  - `arcCycleYoungPass()`: bounded young-generation pass
  - `arcCycleFullPass()`: full-heap pass
  - `arcCycleTick()`: cadence entrypoint (young by default, full on fixed interval)
- native plan lock (`runtime.memory_model.cycle_detector`):
  - `schema: "pulsec.arc.cycle.v1"`
  - `strategy: "trial-deletion"`
  - `cadence.young_window: 64`
  - `cadence.full_interval_ticks: 8`
- runtime lock behavior:
  - young pass advances deterministic cursor and scans a fixed window
  - full pass scans full handle range deterministically
  - both passes reclaim eligible dead slots (`refcount == 0 && kind_tag != 0`) via teardown

C2-06 weak-reference lock:
- weak-reference runtime ABI surface is locked:
  - `weakNew(String) -> weakHandle`
  - `weakGet(weakHandle) -> String|null`
  - `weakClear(weakHandle) -> void`
- weak handles are generation/version validated and stale weak-token use is non-recoverable (`panic("Stale runtime handle")`).
- `weakGet` resolves to `null` (runtime handle `0`) when the target object was released/recycled or cleared, enabling cache/listener weak-reference patterns.
- weak allocator exhaustion (`rt_weak_next >= rt_slot_capacity` after growth reaches max `4294967295`) is deterministic fail-fast (`Weak handle table exhausted`, non-zero exit), not silent `0` return.
- weak token slots are recycled on `weakClear` via free-list state (`rt_weak_free_head` + `rt_weak_free_next`) so long-running clear/reallocate patterns do not permanently exhaust tokens.

C2-07 failure-semantics lock:
- retain saturation behavior is deterministic and fail-fast:
  - guard compare uses `refcount_saturation_guard` (`4294967294`)
  - guard breach triggers `panic("ARC refcount saturation")`
- cycle detector lag behavior is deterministic and tracked:
  - `arcCycleTick` tracks consecutive zero-reclaim ticks
  - lock threshold: `zero_reclaim_lag_limit = 1024`
  - streak clamps at the threshold and remains queryable via runtime state (no silent wraparound)
- native plan lock:
  - `runtime.memory_model.cycle_detector.failure_semantics.zero_reclaim_lag_limit = 1024`
  - `runtime.memory_model.cycle_detector.failure_semantics.lag_action = "track"`
- generation wraparound behavior is deterministic fail-fast:
  - ARC handle generation increment overflow is non-recoverable (`ARC generation overflow`, non-zero exit)
  - weak token generation increment overflow is non-recoverable (`Weak generation overflow`, non-zero exit)
  - no `wrap-to-1` generation behavior is allowed in locked runtime paths

## ABI Notes
- Target: `x86_64-pc-windows-msvc`
- Calling convention: Win64 system ABI
- Current value bridge for console intrinsics:
  - backend lowers literals to byte buffers
  - runtime write symbol takes `(ptr, len)` in standard register ABI slots

## F1 Exception/Trace Runtime Growth

F1 language completion added runtime-backed exception and trace support beyond the older C-phase intrinsic list:

- IR now lowers structured throw flow through:
  - handler-frame installation/removal
  - pending-exception retrieval
  - real throw terminators
- native runtime now maintains an exception-handler stack for Pulse `throw` values
- uncaught Pulse throws now print source-aware stack frames in:
  - `Class.method(File.pulse:line)`

Current F1 runtime/ABI contract:
- public stdlib-facing intrinsic growth remains intentionally narrow
- exception propagation is implemented through backend/runtime-private symbols rather than new user-callable `Intrinsics.*` methods
- shared/fat builds must both provide:
  - `pulsec_rt_throw`
  - `pulsec_rt_traceUpdateTop`
- internal fallback helpers like `Throwable.panic()` are not part of the user-facing stack trace surface

## Next Steps
1. Harden runtime String storage policy (capacity/growth strategy and overflow behavior) as C2 memory model work lands.
2. Add memory-management hooks (`alloc`/ARC cycle helpers) to this document before implementation.
3. Keep intrinsic list minimal and versioned; avoid leaking high-level stdlib behaviors into native ABI.

## Related Closure Docs
- `docs/STDLIB_API_INDEX.md`
- `docs/C1_5_CLOSURE_CHECKLIST.md`
- `docs/WINDOWS_TOOLCHAIN_MATRIX.md`
