# Runtime Ownership Policy

Schema intent: `adenc.runtime.ownership.policy.v1`

This policy turns the runtime ownership inventory into a stable boundary contract for shared linking.

## Ownership Classes

### Runtime-Private

These surfaces are owned by the runtime image and must not be imported, aliased, resized, or patched directly by app-owned objects.

Runtime-private categories:
- object/class-id metadata tables
- slot allocator state
- ARC metadata and cycle-detector state
- weak-handle tables
- runtime container registries for strings, arrays, lists, and maps
- runtime diagnostics, ABI/version state, tracing, and scratch buffers

Rule:
- app code may only reach these surfaces through documented runtime procedures and ABI imports

Examples:
- `adenc_rt_obj_class_ids`
- `rt_arc_refcounts_tbl`
- `rt_weak_generation`
- `rt_list_count`
- `rt_map_count`
- `rt_trace_depth`

### App-Visible Through ABI Only

These are callable runtime entrypoints or documented ABI-visible symbols that app codegen may reference, but app code does not own the backing state.

Allowed surface:
- runtime callable procedures exposed through the native runtime contract
- startup/init call boundary
- object construction boundary
- dispatch/type-check helper boundary

Examples:
- `adenc_rt_init`
- `adenc_rt_shutdown`
- `adenc_rt_objectNew`
- `adenc_rt_arcRetain`
- `adenc_rt_arcRelease`
- `adenc_rt_arcCycleTick`
- `adenc_rt_weakNew`
- `adenc_rt_stringFromBytes`
- `adenc_rt_consoleWrite`
- `adenc_rt_consoleWriteLine`
- `adenc_rt_dispatchNullReceiverPanic`
- `adenc_rt_dispatchInvalidTypePanic`

Rule:
- app code may import these symbols as procedures only
- app code must not import runtime backing tables or runtime-private data symbols directly
- runtime initialization sentinels such as `rt_runtime_init_state` and `rt_runtime_init_epoch` remain runtime-private even though app startup calls `adenc_rt_init`
- runtime shutdown tears down runtime-owned bootstrap allocations, but app startup still owns the final `ExitProcess` boundary

### App-Owned

These surfaces are owned by the executable/app image and remain under app publication/layout control.

App-owned categories:
- startup object and startup bootstrap code
- user/class method objects
- app resources and published executable payload
- user object field storage symbols managed by app-owned field-capacity helpers

Rule:
- runtime may consume app-owned procedures and object instances through the documented ABI
- runtime must not depend on app-owned storage layout for its own bookkeeping in the locked end state

## Forbidden Boundary Patterns

These are explicitly disallowed in the locked shared-boundary model.

### Runtime Import of User Field Storage

Forbidden:
- runtime/stdlib image importing symbols produced by `collect_object_field_storage_symbols(...)`
- runtime/stdlib image importing `*_heap_owned` user-field flags
- runtime bookkeeping that mutates app-owned field storage tables through `emit_ensure_slot_capacity_proc(...)`

Reason:
- this creates a same-image coupling and prevents independent shared runtime linking

Policy:
- removed in `E2-06`
- forbidden in the locked shared-boundary contract

### Direct App Access to Runtime Tables

Forbidden:
- app codegen reading or writing runtime-owned tables like `rt_arc_*`, `rt_weak_*`, `rt_list_*`, `rt_map_*`, `rt_arr_*`
- app codegen treating runtime-private global storage as part of executable-owned image layout

Policy:
- access must go through runtime procedures or future documented ABI accessors only

## Ownership Matrix

| Surface Class | Owner | App Import Allowed | App Mutation Allowed | Runtime Import Allowed | Notes |
|---|---|---|---|---|---|
| Runtime metadata/state tables | runtime image | No | No | Yes | Runtime-private |
| Runtime callable procedures | runtime image | Yes | Call-only | Yes | ABI-visible |
| Startup/bootstrap object | app image | N/A | Yes | Yes | Executable-owned |
| User/class method objects | app image | N/A | Yes | Yes | Executable-owned |
| User field storage symbols | app image | Internal app use only | Yes | No | App-owned field-capacity helpers manage growth |
| Compiler resolution caches | compiler process | No | No | No | Not runtime state |

## Locked Rules

- Runtime-global metadata/state is runtime-private by default.
- App-visible access to runtime behavior happens through callable ABI procedures, not data-table imports.
- App-owned objects and startup code remain executable-owned.
- User object field storage is not a valid long-term runtime bookkeeping surface.
- Compiler-process caches are not part of the runtime ownership boundary.
