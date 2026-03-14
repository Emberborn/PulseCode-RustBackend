# Runtime Ownership Inventory

Schema intent: `pulsec.runtime.ownership.inventory.v1`

This inventory locks the runtime-owned metadata and state surfaces that must live behind the shared runtime boundary for Phase E. It also records the current app-image couplings that block real `.dll` emission.

## Runtime-Owned Global State

These surfaces are runtime-private and belong in the shared runtime image, not in app-owned object images.

### Core Object Metadata

- `pulsec_rt_obj_counter`
- `pulsec_rt_obj_class_ids`
- `pulsec_rt_obj_class_ids_init`
- `pulsec_rt_obj_class_ids_heap_owned`

Purpose:
- global object slot count
- class-id lookup table
- runtime-owned growth state for class-id storage

Current source:
- `emit_runtime_data_tables(...)`
- runtime/stdlib object emitted from `emit_masm_split_program_objects(...)`

### Handle / Slot Allocator State

- `rt_handle_next`
- `rt_slot_capacity`
- `rt_arc_free_head`
- `rt_arc_free_next_tbl`
- `rt_arc_heap_owned`

Purpose:
- global runtime slot allocator
- slot-capacity growth state
- free-list bookkeeping

Current source:
- `emit_runtime_data_tables(...)`

### ARC Metadata Tables

- `rt_arc_refcounts_tbl`
- `rt_arc_kinds_tbl`
- `rt_arc_flags_tbl`
- `rt_arc_meta_tbl`
- `rt_arc_generation_tbl`
- `rt_arc_cycle_epoch`
- `rt_arc_cycle_young_cursor`
- `rt_arc_cycle_last_reclaimed`
- `rt_arc_cycle_zero_reclaim_streak`

Purpose:
- per-handle ARC metadata
- cycle collector cadence and lag tracking

Current source:
- `emit_runtime_data_tables(...)`
- consumed by `emit_arc_retain_proc(...)`, `emit_arc_release_proc(...)`, `emit_arc_cycle_*`

### Weak Reference Tables

- `rt_weak_next`
- `rt_weak_free_head`
- `rt_weak_heap_owned`
- `rt_weak_free_next_ptr`
- `rt_weak_target_slot_ptr`
- `rt_weak_target_gen_ptr`
- `rt_weak_generation_ptr`
- `rt_weak_free_next`
- `rt_weak_target_slot`
- `rt_weak_target_gen`
- `rt_weak_generation`

Purpose:
- weak-handle free list
- weak target/generation lookup

Current source:
- `emit_runtime_data_tables(...)`
- consumed by `emit_weak_*`

### String / Array / List / Map Runtime Tables

- string:
  - `rt_str_count`
  - `rt_str_lens_ptr`
  - `rt_str_data_ptr`
- array:
  - `rt_arr_count`
  - `rt_arr_len`
  - `rt_arr_alive`
  - `rt_arr_i_ptr`
  - `rt_arr_s_ptr`
  - `rt_arr_heap_owned`
  - `rt_arr_len_ptr`
  - `rt_arr_alive_ptr`
  - `rt_arr_i_ptr_ptr`
  - `rt_arr_s_ptr_ptr`
- list:
  - `rt_list_count`
  - `rt_list_size`
  - `rt_list_cap`
  - `rt_list_alive`
  - `rt_list_kind`
  - `rt_list_i_ptr`
  - `rt_list_s_ptr`
  - `rt_list_heap_owned`
  - `rt_list_size_ptr`
  - `rt_list_cap_ptr`
  - `rt_list_alive_ptr`
  - `rt_list_kind_ptr`
  - `rt_list_i_ptr_ptr`
  - `rt_list_s_ptr_ptr`
- map:
  - `rt_map_count`
  - `rt_map_size`
  - `rt_map_cap`
  - `rt_map_alive`
  - `rt_map_keys_ptr`
  - `rt_map_tags_ptr`
  - `rt_map_i_ptr`
  - `rt_map_s_ptr`
  - `rt_map_heap_owned`
  - `rt_map_size_ptr`
  - `rt_map_cap_ptr`
  - `rt_map_alive_ptr`
  - `rt_map_keys_ptr_ptr`
  - `rt_map_tags_ptr_ptr`
  - `rt_map_i_ptr_ptr`
  - `rt_map_s_ptr_ptr`

Purpose:
- runtime container registries
- container capacity and pointer tables
- heap-ownership bookkeeping for runtime-managed storage

Current source:
- `emit_runtime_data_tables(...)`
- consumed by `emit_array_*`, `emit_list_*`, `emit_map_*`

### Runtime Diagnostics / Compatibility / Scratch State

- ABI / compatibility:
  - `rt_compiler_abi_expected`
  - `rt_runtime_abi_version`
  - `rt_compiler_object_model_abi_expected`
  - `rt_runtime_object_model_abi_version`
- debug allocator / errors:
  - `rt_debug_alloc_mode`
  - `rt_debug_arc_retain_err`
  - `rt_debug_arc_release_err`
- trace / diagnostics:
  - `rt_trace_depth`
  - `rt_trace_ptrs`
  - `rt_trace_lens`
  - `rt_trace_hdr`
  - `rt_trace_prefix`
- runtime scratch:
  - `rt_tmpbuf`
  - `rt_tmp_concat`
  - `rt_tmp_concat_len`
  - `rt_tmp_arr_slot`
  - `rt_tmp_arr_len`
  - `rt_tmp_arr_bytes`
  - `rt_tmp_size`
  - `rt_tmp_arg_key`
  - `rt_tmp_arg_val`
  - `rt_tmp_ptr_a`
  - `rt_tmp_ptr_b`
  - `rt_tmp_ptr_c`
  - `rt_tmp_ptr_d`

Purpose:
- compatibility checks
- runtime diagnostics
- global scratch/stateful helper buffers

Current source:
- `emit_runtime_data_tables(...)`
- consumed by trace, panic, parse, string, and allocator helpers

## Former App-Image Coupling Removed In E2-06

This was the specific surface that prevented the runtime object from being a real standalone shared library before `E2-06`.

### User Object Field Storage Symbols

Source:
- `collect_object_field_storage_symbols(...)`
- consumed in split stdlib/runtime emission inside `emit_masm_split_program_objects(...)`

Former behavior:
- runtime/stdlib object declared `extrn` for every user object field storage symbol
- runtime/stdlib object also declared `extrn` for the corresponding `*_heap_owned` symbol
- `emit_ensure_slot_capacity_proc(...)` used this imported symbol list to resize/patch app-owned field storage tables

Resolution in `E2-06`:
- runtime no longer imports user object field storage
- runtime bookkeeping no longer resizes app-owned field tables
- app-owned per-class field-capacity helpers now grow user field tables after object allocation

Locked result:
- runtime-global metadata/state remains runtime-owned
- user field tables remain app-owned
- runtime bookkeeping is independent of app field storage

## Not Part of the Shared Runtime Ownership Target

These are compiler-process data structures, not runtime-library state:

- `CLASS_SUPER_RESOLUTION`
- `CLASS_ID_RESOLUTION`
- `INTERFACE_TYPES_RESOLUTION`
- `CLASS_INTERFACES_RESOLUTION`
- `CLASS_FINALITY_RESOLUTION`
- `METHOD_FINALITY_RESOLUTION`
- `METHOD_VISIBILITY_RESOLUTION`

These remain compiler/backend-side caches used during lowering/codegen and should not be treated as shared runtime globals.
