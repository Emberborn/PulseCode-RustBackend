# Shared Runtime ABI

Schema intent: `pulsec.shared_runtime.abi.v1`

This document defines the ABI/import boundary between app executables and the shared PulseCode runtime library.

## Boundary Roles

### App Executable

Owns:
- startup/bootstrap object
- user/class method objects
- published executable payload

Responsibilities:
- provide the process entrypoint
- import runtime procedures through the documented ABI surface
- call runtime initialization before user entry execution
- avoid importing runtime-private data tables directly

### Shared Runtime Library

Owns:
- runtime-global metadata/state
- ARC, weak, container, trace, ABI, and scratch tables
- runtime helper procedures
- stdlib/runtime callable surface exported for app use

Responsibilities:
- initialize runtime-owned state
- provide callable runtime entrypoints
- own runtime-private data storage independently of the executable image

## Imported Runtime Procedure Surface

Shared-mode executables may import runtime procedures only. Current ABI-visible procedure surface:

- `pulsec_rt_init`
- `pulsec_rt_shutdown`
- `pulsec_rt_objectNew`
- `pulsec_rt_objectClassId`
- `pulsec_rt_stringFromBytes`
- `pulsec_rt_consoleWrite`
- `pulsec_rt_consoleWriteLine`
- `pulsec_rt_intToString`
- `pulsec_rt_booleanToString`
- `pulsec_rt_arcRetain`
- `pulsec_rt_arcRelease`
- `pulsec_rt_arcCycleTick`
- `pulsec_rt_weakNew`
- `pulsec_rt_weakGet`
- `pulsec_rt_weakClear`
- `pulsec_rt_dispatchNullReceiverPanic`
- `pulsec_rt_dispatchInvalidTypePanic`
- `pulsec_rt_tracePush`
- `pulsec_rt_tracePop`
- `pulsec_rt_traceDump`

Rule:
- imports are procedure-only
- runtime-private data symbols are not ABI-visible to app codegen
- app-side dispatch, `instanceof`, and checked-reference-cast lowering resolve class IDs through `pulsec_rt_objectClassId` instead of importing `pulsec_rt_obj_class_ids`

## Exported Runtime Procedure Surface

Shared-mode runtime libraries export the minimal versioned ABI surface required by executables and stdlib-backed app calls.

Rule:
- exports are procedure-only
- export visibility is `minimal_versioned_abi`
- exported procedures are versioned by `pulsec_toolchain_semver`
- runtime-private data/state symbols are not exported from the DLL surface

Required exported procedure families:
- startup/runtime lifecycle: `pulsec_rt_init`, `pulsec_rt_shutdown`
- object/runtime helpers: `pulsec_rt_objectNew`, `pulsec_rt_objectClassId`
- stdlib/runtime callables: the locked callable symbols from the stdlib/runtime surface, including `pulsec_com_pulse_lang_IO_println__String`, `pulsec_rt_consoleWriteLine`, `pulsec_rt_stringConcat`, `pulsec_rt_arrayNew`, `pulsec_rt_mapPutInt`
- diagnostics/trace procedures: `pulsec_rt_dispatchNullReceiverPanic`, `pulsec_rt_dispatchInvalidTypePanic`, `pulsec_rt_tracePush`, `pulsec_rt_tracePop`, `pulsec_rt_traceDump`

Forbidden private export patterns:
- `rt_*`
- `pulsec_rt_obj_*`
- `pulsec_rt_class_*`

## Runtime-Private Data Boundary

The following classes of state are runtime-private and not importable by the executable:

- object/class-id tables
- allocator/slot state
- ARC metadata tables
- weak reference tables
- runtime container registries
- diagnostics, ABI version state, trace buffers, and scratch buffers

Forbidden:
- executable imports of `rt_arc_*`, `rt_weak_*`, `rt_list_*`, `rt_map_*`, `rt_arr_*`
- executable imports of `pulsec_rt_obj_*`
- DLL exports of `rt_*`
- DLL exports of `pulsec_rt_obj_*`
- DLL exports of `pulsec_rt_class_*`

## Startup / Initialization Sequence

Shared-mode startup contract:
1. executable entrypoint starts in app-owned startup object
2. startup imports and calls `pulsec_rt_init`
3. startup calls the resolved app entry procedure
4. startup calls `pulsec_rt_shutdown`
5. process exit returns through executable-owned shutdown path

Rule:
- runtime initialization must occur before user entry executes
- app entry is never responsible for directly initializing runtime-private tables
- runtime initialization state is owned by the runtime library via `rt_runtime_init_state`
- repeated startup imports may call `pulsec_rt_init`, but initialization is idempotent after the runtime-owned state boundary is established
- runtime shutdown runs before `ExitProcess` and owns teardown of runtime-private bootstrap allocations/state publication
- executable startup remains responsible for the final process exit call

Runtime-owned init sentinels:
- `rt_runtime_init_state`
- `rt_runtime_init_epoch`

Runtime-owned shutdown surface:
- `pulsec_rt_shutdown`

## Versioning and Compatibility Policy

Shared runtime compatibility uses the existing locked runtime ABI and object-model ABI versions, but binds them explicitly to the shared boundary.

Compatibility fields:
- `runtime_abi_schema = pulsec.runtime.abi.v1`
- `runtime_abi_version = 2`
- `object_model_abi_schema = pulsec.object_model.abi.v1`
- `object_model_abi_version = 1`
- `version_source = pulsec_toolchain_semver`

Policy:
- executable and shared runtime must match on runtime ABI version
- executable and shared runtime must match on object-model ABI version
- mismatch policy is `deterministic-fail-fast`
- shared runtime binary naming remains versioned by toolchain semver

Failure semantics:
- runtime ABI mismatch fails during runtime initialization with `Runtime ABI mismatch`
- object-model ABI mismatch fails during runtime initialization with `Object model ABI mismatch`
- mismatched builds are not supported as degraded or warning-only launches
- shared build launch descriptors (`pulsec.shared.launch.v1`) also publish the required ABI versions, mismatch policy, missing-runtime policy, missing-import policy, and required runtime procedure inventory so launch/runtime boundaries are explicit in emitted artifacts

## Removed Coupling

`E2-06` removed the previous runtime dependence on user field-storage symbol inventory.

Current rule:
- runtime-side bookkeeping does not import or resize app-owned user field tables
- app-owned field-capacity helpers manage user field-table growth after object allocation

## Locked Rules

- shared-mode executable imports runtime procedures, not runtime data tables
- shared runtime exports procedure-only minimal ABI symbols, not runtime-private data tables
- startup calls `pulsec_rt_init` before app entry
- runtime owns runtime-private state independently of executable image layout
- user-field storage coupling is removed from the final ABI boundary
- `native.plan.json` emits the shared-boundary contract under `shared_boundary` (`pulsec.shared_boundary.v1`) so ownership, import, and runtime lookup responsibilities are explicit rather than inferred
