# Shared Runtime State Layout

Schema intent: `adenc.shared_runtime.state_layout.v1`

This document locks where runtime-global metadata and allocator state live for shared builds.

## Ownership Rule

Runtime-global metadata tables and allocator state live in runtime-owned library storage, not in the app executable image.

Current runtime-owned storage groups:
- object metadata:
  - `adenc_rt_obj_counter`
  - `adenc_rt_obj_class_ids`
  - `adenc_rt_obj_class_ids_init`
  - `adenc_rt_obj_class_ids_heap_owned`
- allocator / slot state:
  - `rt_handle_next`
  - `rt_slot_capacity`
  - `rt_arc_free_head`
  - `rt_arc_free_next_tbl`
  - `rt_arc_heap_owned`
- ARC / weak state:
  - `rt_arc_refcounts_tbl`
  - `rt_arc_kinds_tbl`
  - `rt_arc_flags_tbl`
  - `rt_arc_meta_tbl`
  - `rt_arc_generation_tbl`
  - `rt_weak_next`
  - `rt_weak_free_head`
  - `rt_weak_generation`
- runtime container registries:
  - `rt_arr_*`
  - `rt_list_*`
  - `rt_map_*`
  - `rt_str_*`

Current source of truth:
- `emit_runtime_data_tables(...)`
- runtime/stdlib object emission in `emit_masm_split_program_objects(...)`

## Shared Boundary Contract

For shared mode:
- executable imports procedures only
- runtime-global tables are stored in the runtime library image
- executable-owned startup and user objects do not own runtime metadata capacity or allocator state

## User Field Storage After E2-06

`E2-06` removed the old runtime import of user field-storage symbols.

Current rule:
- runtime metadata/state remains in runtime-owned storage
- user field tables remain app-owned
- app-owned per-class field-capacity helpers grow user field tables after object allocation

## Locked Rules

- runtime metadata/state placement is `runtime_library_storage`
- allocator state placement is `runtime_library_storage`
- app executable does not own runtime-global allocator capacity or ARC metadata tables
- runtime bookkeeping is independent of user field storage
