# Runtime Handle Audit Report

This report records the focused audit requested after the map pointer-root bug fix.

Scope of the audit:
- ARC runtime handle tables
- collection runtime root-pointer tables
- backend field storage width rules for handle-carrying fields
- obvious remaining pointer-root indexing mistakes in runtime emitters

## Audit Goal

Verify whether the earlier shortcut pattern:
- treating a pointer-root symbol like inline table storage

was still present across ARC and collection runtime paths after the recent fix.

## What Was Checked

### 1. Pointer-root indexing in runtime emitters

Searched for direct indexed access patterns against pointer-root globals in:
- [runtime_emitters.rs](/D:/Programming/codex/PulseCode/crates/pulsec-cli/src/backend/emission/runtime_emitters.rs)
- related backend support/codegen files

Focus:
- `rt_arr_*_ptr`
- `rt_list_*_ptr`
- `rt_map_*_ptr`
- any direct `[...] + index` use on the pointer-root symbol itself instead of on the dereferenced table

Result:
- the real remaining bug found was the two bad `rt_map_cap_ptr` reads already fixed
- after that correction, no additional direct pointer-root indexing bugs of the same class were found in the audited array/list/map runtime paths

### 2. Width/layout checks (`dd` vs `dq`)

Checked:
- [masm_support.rs](/D:/Programming/codex/PulseCode/crates/pulsec-cli/src/backend/support/masm_support.rs)
- [program_emitters.rs](/D:/Programming/codex/PulseCode/crates/pulsec-cli/src/backend/emission/program_emitters.rs)
- [masm_codegen.rs](/D:/Programming/codex/PulseCode/crates/pulsec-cli/src/backend/emission/masm_codegen.rs)

Focus:
- tables of scalar metadata use `dd`
- tables of pointers/handles use `dq`
- instance field tables for handle/wide-integer fields use `dq`

Result:
- runtime collection root tables look consistent:
  - sizes/capacities/alive/kind/refcount/meta/generation/free-next use `dd`
  - pointer tables and handle-bearing tables use `dq`
- backend field storage rules are consistent with the current design:
  - `uses_qword_field_storage(...)`
  - handle-like and wide integer fields use `qword`

### 3. ARC table access patterns

Checked ARC runtime access in:
- [runtime_emitters.rs](/D:/Programming/codex/PulseCode/crates/pulsec-cli/src/backend/emission/runtime_emitters.rs)

Focus:
- `rt_arc_refcounts`
- `rt_arc_kinds`
- `rt_arc_flags`
- `rt_arc_meta`
- `rt_arc_generation`
- `rt_arc_free_next`

Result:
- these are direct runtime tables, not pointer-root indirections
- the audited indexed access patterns are consistent with that design
- no equivalent “forgot to dereference the root pointer” bug was found there

## Findings

## Confirmed fixed

### A. Map capacity pointer-root bug

File:
- [runtime_emitters.rs](/D:/Programming/codex/PulseCode/crates/pulsec-cli/src/backend/emission/runtime_emitters.rs)

Status:
- fixed

This was the actual remaining pointer-root bug in the collection runtime path.

### B. Stale ARC release helper bug

File:
- [masm_codegen.rs](/D:/Programming/codex/PulseCode/crates/pulsec-cli/src/backend/emission/masm_codegen.rs)

Status:
- fixed

This was not the same pointer-root issue, but it was a real handle/ARC bug found during the same debugging chain.

## Not found in this audit

After the targeted sweep, I did not find additional bugs of the same class in the audited ARC/array/list/map runtime root-pointer paths:
- no additional direct indexing off `rt_arr_*_ptr` roots
- no additional direct indexing off `rt_list_*_ptr` roots
- no additional direct indexing off `rt_map_*_ptr` roots beyond the fixed `rt_map_cap_ptr` case

So for the specific shortcut pattern you were worried about, the audited remaining surface looks clean.

## Important Architectural Note

There is still one separate runtime-model inconsistency worth calling out:

- strings / arrays / lists / maps return generation-packed handles
- object construction still returns the raw object slot from `pulsec_rt_objectNew`

That is not the same bug as the pointer-root mistake, and it was not required to fix the current crash.
It is also not yet proven to be wrong in the current object model, because a large amount of object code still assumes slot-style object identity.

So:
- this audit does **not** mark that as a bug fix
- it is a separate architecture follow-up worth deciding explicitly later

## Bottom Line

For the specific “pointer-root shortcut” issue:
- the real remaining collection-runtime instance was found and fixed
- the targeted ARC/collection audit did not find more of the same pattern afterward

That means the earlier pointer-root hack is no longer known to be present in the audited ARC and collection runtime paths.

