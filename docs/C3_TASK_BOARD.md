# C3 Task Board: Object Model + Dispatch Hardening

Status legend: `Todo`, `In Progress`, `Blocked`, `Done (Locked)`.

## Scope
C3 turns the current class model into a locked object-model contract suitable for large OOP programs and future self-hosting. It expands the roadmap's C3 "Object Model" section into executable tasks, gates, and closure criteria.

## Workstream A: Object Layout Contract

| ID | Task | Depends On | Owner | Target | Status | Exit Condition |
|---|---|---|---|---|---|---|
| C3-01 | Lock instance object header + field layout schema (offset rules, alignment, inherited field placement) | C2 | Codex | 2026-03-10 | Done (Locked) | `RUNTIME_INTRINSICS_ABI.md` documents deterministic layout contract and lock tests assert emitted metadata |
| C3-02 | Lock static-field storage model (class-owned storage, initialization order, visibility/runtime access rules) | C3-01 | Codex | 2026-03-10 | Done (Locked) | static field reads/writes are deterministic and fixture-validated |
| C3-03 | Lock constructor invocation model (`this` construction state, constructor chaining semantics, failure behavior) | C3-01 | Codex | 2026-03-10 | Done (Locked) | constructor-order and partial-init behavior validated in semantic + native fixtures |
| C3-04 | Lock class allocation contract for variable class sizes (per-class size metadata + allocator integration) | C3-01 | Codex | 2026-03-10 | Done (Locked) | native plan + runtime asm expose class-size metadata and allocation path is deterministic |
| C3-05 | Emit object-model metadata in native plan (`runtime.object_model.*`) and add plan-lock assertions | C3-01, C3-02, C3-04 | Codex | 2026-03-10 | Done (Locked) | `native.plan.json` contains object-model schema + lock tests validate fields |

## Workstream B: Dispatch + Inheritance Runtime Semantics

| ID | Task | Depends On | Owner | Target | Status | Exit Condition |
|---|---|---|---|---|---|---|
| C3-06 | Lock vtable/interface dispatch schema (slot assignment policy, deterministic ordering, versioning policy) | C3-01 | Codex | 2026-03-10 | Done (Locked) | vtable schema documented and slot maps are deterministic across builds |
| C3-07 | Implement runtime virtual dispatch path for instance calls (class hierarchy aware, no static-call fallback) | C3-06 | Codex | 2026-03-10 | Done (Locked) | dynamic dispatch fixtures prove override target resolution at runtime |
| C3-08 | Implement interface dispatch bridge (interface slot maps + concrete target resolution) | C3-06, C3-07 | Codex | 2026-03-10 | Done (Locked) | interface-typed call fixtures execute correct concrete methods |
| C3-09 | Lock override/super-call runtime behavior (super dispatch, final overrides, abstract contract failures, annotation override contracts) | C3-07 | Codex | 2026-03-10 | Done (Locked) | semantic + runtime fixtures validate override/super matrix and `@Override` annotation contracts |
| C3-10 | Add safe devirtualization rules (final/private/static call fast-paths) with parity checks | C3-07, C3-09 | Codex | 2026-03-10 | Done (Locked) | optimized and non-optimized call paths are behaviorally equivalent in fixtures |

## Workstream C: Type Safety + Runtime Checks

| ID | Task | Depends On | Owner | Target | Status | Exit Condition |
|---|---|---|---|---|---|---|
| C3-11 | Lock runtime cast/check boundary (`instanceof`, checked cast panic contract) | C3-06 | Codex | 2026-03-10 | Done (Locked) | deterministic cast success/failure behavior and diagnostics are fixture-locked |
| C3-12 | Add runtime type-id/class-id metadata emission for objects and dispatch tables | C3-01, C3-06 | Codex | 2026-03-10 | Done (Locked) | all allocated objects carry class-id path used by cast/dispatch checks |
| C3-13 | Lock null + type-check semantics at runtime dispatch boundaries | C3-07, C3-11 | Codex | 2026-03-10 | Done (Locked) | null/type misuse paths fail deterministically without memory corruption |
| C3-14 | Lock object-model ABI compatibility policy (schema version + fail-fast mismatch behavior) | C3-05, C3-12 | Codex | 2026-03-10 | Done (Locked) | mismatch fixtures fail deterministically and docs define compatibility contract |

## Workstream D: Conformance + Hardening Gates

| ID | Task | Depends On | Owner | Target | Status | Exit Condition |
|---|---|---|---|---|---|---|
| C3-15 | Add semantic fixture suite for class-layout and constructor edge cases | C3-01, C3-03 | Codex | 2026-03-10 | Done (Locked) | parser/semantic fixtures cover legal + failure matrix |
| C3-16 | Add executable fixture suite for polymorphism + interface dispatch | C3-07, C3-08 | Codex | 2026-03-10 | Done (Locked) | runtime outputs prove correct target dispatch across hierarchy/interface graphs |
| C3-17 | Add regression fixture for object-model stress (alloc/churn + polymorphic calls) | C3-04, C3-07 | Codex | 2026-03-10 | Done (Locked) | repeated runs pass with deterministic output and no runtime instability |
| C3-18 | Add frame/ABI guard assertions specific to dispatch-heavy call graphs | C3-10 | Codex | 2026-03-10 | Done (Locked) | lock tests prove bounded frames and Win64 ABI conformance under virtual/interface calls |
| C3-19 | Publish C3 closure docs (`C3_CLOSURE_CHECKLIST.md`, evidence index, updated ABI/object-model spec) | C3-15, C3-16, C3-17, C3-18 | Codex | 2026-03-10 | Done (Locked) | closure docs complete and cross-linked |
| C3-20 | C3 closure verification run (`stage_locks_c3` + full `cargo test`) and roadmap lock | C3-19 | Codex | 2026-03-10 | Done (Locked) | all C3 tasks/gates marked `Done (Locked)` and roadmap references updated |

## C3 Gates

| Gate | Definition | Status |
|---|---|---|
| C3-G1 | Object layout determinism (instance/static layout + constructor state rules) | Done (Locked) |
| C3-G2 | Runtime dispatch correctness (virtual + interface) | Done (Locked) |
| C3-G3 | Override/super semantics correctness | Done (Locked) |
| C3-G4 | Runtime type safety (casts/null/type checks) | Done (Locked) |
| C3-G5 | ABI/object-model compatibility checks | Done (Locked) |
| C3-G6 | Dispatch-heavy ABI/frame stability | Done (Locked) |
| C3-G7 | Stress/regression stability for object model | Done (Locked) |
| C3-G8 | Docs + closure artifact completeness | Done (Locked) |

## Exit Criteria

| Milestone | Exit Criteria |
|---|---|
| C3 | Tasks `C3-01`..`C3-20` and gates `C3-G1`..`C3-G8` are all `Done (Locked)` |
| Phase C Exit | C2 + C3 exit criteria complete and Phase C deliverable gates in roadmap are satisfied |

C3-01 progress notes:
- object layout schema lock added in runtime ABI docs (`pulsec.object.layout.v1`).
- native plan now emits `runtime.object_model` with locked instance layout fields (`header_bytes`, `field_slot_bytes`, `alignment_bytes`, deterministic field/inheritance ordering policy).
- stage lock added: `cargo test -q -p pulsec --test stage_locks_c3` (`lock_c3_01_object_layout_contract_is_documented_and_emitted`).

C3-02 progress notes:
- static-storage schema lock added in runtime ABI docs (`pulsec.static.storage.v1`).
- native plan now emits `runtime.object_model.static_storage` with owner/symbol model, init-order lock, and static access rules.
- stage lock added: `lock_c3_02_static_field_storage_contract_and_runtime_flow_are_locked` (docs + plan + executable static-field flow).

C3-03 progress notes:
- constructor-model schema lock added in runtime ABI docs (`pulsec.constructor.model.v1`).
- native plan now emits `runtime.object_model.constructor_model` with receiver-allocation, chaining, and failure-mode policy locks.
- stage lock added: `lock_c3_03_constructor_invocation_contract_is_documented_and_emitted`.

C3-04 progress notes:
- class-allocation schema lock added in runtime ABI docs (`pulsec.class.alloc.v1`).
- native plan now emits `runtime.object_model.allocation` with size-formula lock and deterministic `class_size_table` metadata rows.
- stage lock added: `lock_c3_04_class_allocation_contract_emits_variable_class_sizes`.

C3-05 progress notes:
- object-model plan-emission lock completed for `runtime.object_model.*` sections.
- backend unit locks and C3 stage lock now assert presence of `instance_layout`, `static_storage`, `constructor_model`, and `allocation`.
- stage lock added: `lock_c3_05_object_model_plan_sections_are_complete`.

C3-06 progress notes:
- dispatch schema lock added in runtime ABI docs (`pulsec.dispatch.schema.v1`).
- native plan now emits `runtime.object_model.dispatch` with deterministic slot-assignment policy and slot-table metadata.
- stage lock added: `lock_c3_06_dispatch_schema_is_documented_and_emitted`.

C3-07 progress notes:
- backend method/staticness resolution is now strict-owner + superclass-chain aware (no unrelated global cross-class fallback).
- backend unit locks added for superclass-chain resolution and fallback hardening.
- statement-level unqualified in-class calls (`name(...)`) are now lowered in method-body emission (previously skipped in statement context).
- runtime virtual dispatch now resolves non-static class-hierarchy calls by receiver runtime class-id and routes to override targets deterministically.
- stage lock added: `lock_c3_07_virtual_dispatch_runtime_override_resolution_is_locked`.

C3-08 progress notes:
- runtime interface-dispatch bridge now resolves interface-typed calls by receiver runtime class-id to implementing concrete method symbols.
- compiler/runtime bridge map includes class interface implementation metadata with superclass-inherited interface coverage.
- stage lock added: `lock_c3_08_interface_dispatch_bridge_runtime_resolution_is_locked`.

C3-09 progress notes:
- runtime super-call dispatch now preserves super receiver identity and binds to immediate superclass method target (non-virtual super dispatch).
- semantic final-override and abstract-instantiation contracts are stage-locked through build-failure diagnostics.
- annotation processor baseline added for `@Override` (validates superclass/interface contract, rejects static/constructor misuse, and fails unsupported annotation usage).
- stage locks added:
  - `lock_c3_09_super_dispatch_runtime_behavior_is_locked`
  - `lock_c3_09_final_override_is_rejected_semantically`
  - `lock_c3_09_abstract_instantiation_contract_failure_is_rejected_semantically`
  - `lock_c3_09_override_annotation_contract_failure_is_rejected_semantically`
  - `lock_c3_09_override_annotation_interface_contract_is_accepted`

C3-10 progress notes:
- safe devirtualization fast-paths implemented for static/super/direct-call-safe cases:
  - `final` method calls
  - `private` method calls
  - instance calls where resolved owner class is `final`
- native plan dispatch contract now emits explicit `devirtualization` policy metadata with parity requirement lock.
- stage lock added:
  - `lock_c3_10_safe_devirtualization_fast_paths_preserve_behavioral_parity`

C3-11 progress notes:
- `instanceof` operator added to parser/semantics/IR/backend runtime lowering.
- semantic checks enforce reference-only operand/target constraints and unknown-target diagnostics.
- runtime lowering checks receiver runtime class-id against assignable target class/interface sets and yields deterministic boolean result (`null instanceof T` => `false`).
- checked reference casts now enforce runtime assignability for non-null receivers and fail fast on mismatch (`Invalid cast`).
- cast parser now supports reference targets (`(Derived) baseRef`) in addition to numeric targets.
- stage lock added:
  - `lock_c3_11_instanceof_runtime_type_check_boundary_is_locked`
  - `lock_c3_11_checked_reference_cast_success_is_locked`
  - `lock_c3_11_checked_reference_cast_failure_is_locked`

C3-12 progress notes:
- type-id metadata schema lock added in runtime ABI docs (`pulsec.typeid.schema.v1`).
- native plan now emits `runtime.object_model.type_ids.class_table` with deterministic class-id ordering metadata.
- stage lock added: `lock_c3_12_type_id_schema_is_documented_and_emitted`.
- backend unit locks now assert class-id table consumption in:
  - virtual dispatch emission (`emit_virtual_dispatch_call`)
  - `instanceof` emission (`emit_instanceof_check`)
  - checked cast emission (`emit_checked_reference_cast`)
- stage lock added: `lock_c3_12_runtime_type_checks_consume_class_id_table`.

C3-13 progress notes:
- runtime dispatch call emission now enforces receiver validity at dispatch boundaries:
  - null receiver (`0`) triggers deterministic fail-fast panic (`Null dispatch receiver`)
  - non-assignable runtime class-id at dispatch boundary triggers deterministic fail-fast panic (`Invalid dispatch receiver type`)
- stage locks added:
  - `lock_c3_13_null_virtual_dispatch_receiver_panics_deterministically`
  - `lock_c3_13_null_interface_dispatch_receiver_panics_deterministically`

C3-14 progress notes:
- object-model ABI compatibility schema lock added in runtime ABI docs (`pulsec.object_model.abi.v1`).
- native plan now emits `runtime.object_model.abi_compatibility` with compiler/runtime version lock fields.
- runtime init now enforces object-model ABI mismatch fail-fast before runtime table initialization.
- stage locks added:
  - `lock_c3_14_object_model_abi_contract_is_documented_and_emitted`
  - `lock_c3_14_object_model_abi_mismatch_fails_deterministically`

C3-15 progress notes:
- semantic fixture matrix lock added for class-layout/constructor edge behavior:
  - legal fixture: inherited field/constructor shape compiles successfully
  - failure fixture: constructor arity mismatch fails deterministically
  - failure fixture: private inherited-field access fails deterministically
- stage lock added:
  - `lock_c3_15_semantic_constructor_and_layout_edge_matrix_is_locked`

C3-16 progress notes:
- executable polymorphism/interface fixture suite lock added for multi-shape dispatch graph.
- runtime output now lock-validates class-hierarchy override and interface target resolution together.
- stage lock added:
  - `lock_c3_16_polymorphism_and_interface_dispatch_fixture_suite_executes`

C3-17 progress notes:
- object-model stress regression fixture lock added for alloc/churn + polymorphic interface calls in looped execution.
- executable determinism lock validates repeated process runs produce stable output.
- stage lock added:
  - `lock_c3_17_object_model_stress_alloc_churn_polymorphic_calls_are_stable`

C3-18 progress notes:
- dispatch-heavy frame/ABI guard lock added:
  - asserts Win64 outgoing stack-arg slots (`[rsp+32]`, `[rsp+40]`) for >4 arg dispatch path
  - asserts bounded frame size and no legacy fixed scratch offsets
- stage lock added:
  - `lock_c3_18_dispatch_heavy_frame_and_win64_abi_guards_are_locked`

C3-19 progress notes:
- closure artifact package published:
  - `docs/C3_CLOSURE_CHECKLIST.md`
  - `docs/C3_EVIDENCE_INDEX.md`
- roadmap/ABI references synchronized to C3 lock status.

C3-20 progress notes:
- closure verification run completed:
  - `cargo test -q -p pulsec --test stage_locks_c3`
  - `cargo test -q`
- C3 board/gates and milestone roadmap are now fully locked through C3-20.

