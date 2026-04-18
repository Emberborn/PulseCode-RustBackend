# C1.5 Task Board (M2-M3)

## How to use
- Status values: `Todo`, `In Progress`, `Blocked`, `Done`.
- Update `Owner`, `Target`, and `Status` per task as work progresses.
- A milestone is complete only when all tasks and all milestone gates are `Done`.

## C1.5 Strict Done Policy
- C1.5 is hardening, not baseline/prototype work.
- `Done` means fully closed with implementation + tests + docs + roadmap alignment.
- No task may be marked `Done` on scaffold-only or semantic-only coverage when runtime/fixture coverage is part of its gate.
- `M2` closes only when tasks `M2-01`..`M2-14` and gates `M2-G1`..`M2-G7` are all `Done`.

## M2 Runtime + Boxing Core Lock

| ID | Task | Depends On | Owner | Target | Status | Done When |
|---|---|---|---|---|---|---|
| M2-01 | Add primitive-wrapper type map in semantic layer (`byte->Byte`, `int->Integer`, `uint->UInteger`, etc.) | - | Codex | 2026-03-09 | Done | Map exists in code + unit tests for all supported primitives |
| M2-02 | Implement wrapper class skeletons in `stdlib/src/com/pulse/lang` for `Byte`, `Short`, `Integer`, `Long`, `Float`, `Double`, `Char`, `Boolean` | M2-01 | Codex | 2026-03-09 | Done | All classes compile and are importable |
| M2-03 | Implement unsigned wrapper class skeletons `UByte`, `UShort`, `UInteger`, `ULong` | M2-01 | Codex | 2026-03-09 | Done | All classes compile and are importable |
| M2-04 | Implement `Void` wrapper class contract for reflective/generic compatibility | M2-01 | Codex | 2026-03-09 | Done | `Void` compiles and is documented |
| M2-05 | Add boxing insertion rules at assignment boundaries | M2-01 | Codex | 2026-03-09 | Done | Primitive->wrapper assignment paths pass semantic + fixture tests |
| M2-06 | Add unboxing insertion rules at assignment boundaries | M2-01 | Codex | 2026-03-09 | Done | Wrapper->primitive assignment paths pass semantic + fixture tests |
| M2-07 | Add boxing/unboxing in method call argument matching and return typing | M2-05, M2-06 | Codex | 2026-03-09 | Done | Mixed call signatures resolve deterministically |
| M2-08 | Lock overload resolution precedence for primitive vs wrapper candidates | M2-07 | Codex | 2026-03-09 | Done | Overload conformance tests pass for ambiguous cases |
| M2-09 | Define signed/unsigned cast and overflow diagnostics table | M2-01 | Codex | 2026-03-09 | Done | Conversion rules doc + semantic tests align |
| M2-10 | Implement wrapper APIs: `valueOf`, parse methods, primitive extractors, `equals`, compare helpers | M2-02, M2-03 | Codex | 2026-03-10 | Done | API surface is fully implemented and executable fixtures pass |
| M2-11 | Complete core bootstrap classes `Object`, `Class`, `Comparable`, `Iterable`, `Iterator`, `StringBuilder` deltas | M2-02 | Codex | 2026-03-10 | Done | Core classes compile and are used in at least one fixture |
| M2-12 | Add nullability enforcement for wrappers (nullable) vs primitives (non-null) in boxing flows | M2-06 | Codex | 2026-03-10 | Done | Nullability conformance tests pass |
| M2-13 | Add native executable fixtures for wrapper APIs and failure modes | M2-10 | Codex | 2026-03-10 | Done | Deterministic output + deterministic non-zero exits on invalid parse/cast |
| M2-14 | Update freeze docs with boxing/cast tables and examples | M2-08, M2-09 | Codex | 2026-03-10 | Done | `docs/M1_SEMANTICS_FREEZE.md` and related docs updated |

## M2 Test Gates (all required)

| Gate ID | Gate | Command / Evidence | Status |
|---|---|---|---|
| M2-G1 | Boxing round-trip conformance | `cargo test -q` includes all primitive/wrapper pair tests | Done |
| M2-G2 | Nullability boundary conformance | semantic tests for primitive non-null + wrapper nullable paths | Done |
| M2-G3 | Overload dispatch conformance | fixture tests for mixed primitive/wrapper overloads | Done |
| M2-G4 | Numeric conversion matrix conformance | matrix tests for widening/narrowing/cast diagnostics | Done |
| M2-G5 | Native wrapper runtime fixtures | `pulsec build` + run fixture executables with stable output | Done |
| M2-G6 | Freeze-doc lock | docs updated and cross-checked with tests | Done |
| M2-G7 | Casting/literal conformance lock suites | `cargo test -p pulsec --test stage_locks_casting` and `cargo test -p pulsec --test stage_locks_casting_failures` are green, including negative truncation + boxed literal mapping (`Long a = 20`) | Done (Locked) |

## M3 Stdlib Surface Completion + Runtime Hardening

| ID | Task | Depends On | Owner | Target | Status | Done When |
|---|---|---|---|---|---|---|
| M3-01 | Finalize `Throwable`, `Exception`, `RuntimeException` base hierarchy | M2-11 | Codex | 2026-03-10 | Done | Exception base classes compile and are referenced by runtime errors |
| M3-02 | Finalize core runtime exceptions (`IllegalArgumentException`, `IllegalStateException`, `NullPointerException`, `IndexOutOfBoundsException`, `UnsupportedOperationException`, `NumberFormatException`) | M3-01 | Codex | 2026-03-10 | Done | All classes compile and error paths use correct type |
| M3-03 | Finalize `Collection` and `List` contracts | M2-11 | Codex | 2026-03-10 | Done | Interface conformance tests pass |
| M3-04 | Finalize `ArrayList` behavior and bounds semantics | M3-03 | Codex | 2026-03-10 | Done | CRUD/bounds tests pass in semantic + executable fixtures |
| M3-05 | Finalize `LinkedList` | M3-03 | Codex | 2026-03-10 | Done | Core operations tested |
| M3-06 | Finalize `Set` + `HashSet` | M3-03 | Codex | 2026-03-10 | Done | Uniqueness + iteration tests pass |
| M3-07 | Finalize `Map` + `HashMap` | M3-03 | Codex | 2026-03-10 | Done | Put/get/remove/contains tests pass |
| M3-08 | Finalize `Queue` + `Deque` | M3-03 | Codex | 2026-03-10 | Done | FIFO/deque behavior tests pass |
| M3-09 | Finalize `Math` API and numeric edge behavior | M2-09 | Codex | 2026-03-10 | Done | Deterministic math fixtures pass |
| M3-10 | Finalize `Random` deterministic seeded mode for testability | M3-09 | Codex | 2026-03-10 | Done | Seeded tests are reproducible |
| M3-11 | Finalize `File`, `Path`, `Files` contracts | M2-11 | Codex | 2026-03-10 | Done | File/path fixtures pass on Windows |
| M3-12 | Finalize `InputStream` and `OutputStream` | M3-11 | Codex | 2026-03-10 | Done | Stream fixtures pass |
| M3-13 | Finalize `Instant` and `Duration` | M2-11 | Codex | 2026-03-10 | Done | Time API fixtures pass |
| M3-14 | Expand runtime intrinsic ABI coverage for all M3 runtime-backed APIs | M3-04, M3-07, M3-11, M3-12, M3-13 | Codex | 2026-03-10 | Done | ABI symbols documented + mapped + tested |
| M3-15 | Add real multi-file fixture suites for collections/io/time/math/object-interface mixes | M3-08, M3-12, M3-13 | Codex | 2026-03-10 | Done | Fixtures run via `pulsec check` and `pulsec build` |
| M3-16 | Add stress/soak suite for allocation, collection churn, string churn, loop-heavy workloads | M3-15 | Codex | 2026-03-10 | Done | `stress_soak` fixture + repeated build/run integration test is stable |
| M3-17 | Validate Windows toolchain matrix (`ml64`/`link.exe` path variants) | M3-15 | Codex | 2026-03-10 | Done | `docs/WINDOWS_TOOLCHAIN_MATRIX.md` committed with pass/fail notes |
| M3-18 | Publish C1.5 closure artifacts (ABI docs, stdlib index, completion checklist) | M3-14, M3-17 | Codex | 2026-03-10 | Done | Closure docs published and cross-linked (`RUNTIME_INTRINSICS_ABI`, `STDLIB_API_INDEX`, `C1_5_CLOSURE_CHECKLIST`) |

## M3 Test Gates (all required)

| Gate ID | Gate | Command / Evidence | Status |
|---|---|---|---|
| M3-G1 | Fixture project coverage | `cargo test -p pulsec --test stage_locks gate_m3_g1_fixture_project_coverage -- --exact` and `cargo test -p pulsec --test fixture_projects` pass | Done |
| M3-G2 | Collections behavior coverage | `cargo test -p pulsec --test stage_locks gate_m3_g2_collections_behavior_coverage -- --exact` passes | Done |
| M3-G3 | IO and stream behavior coverage | `cargo test -p pulsec --test stage_locks gate_m3_g3_io_stream_behavior_coverage -- --exact` passes | Done |
| M3-G4 | Time and math behavior coverage | `cargo test -p pulsec --test stage_locks gate_m3_g4_time_math_determinism_coverage -- --exact` passes | Done |
| M3-G5 | Stress/soak stability | repeated build+run stress suite without nondeterministic failures | Done |
| M3-G6 | Toolchain matrix pass | documented pass on supported Windows contributor setups | Done |
| M3-G7 | Docs closure pass | ABI + stdlib API index + C1.5 checklist marked complete | Done |

## Exit Criteria

| Milestone | Exit Criteria |
|---|---|
| M2 | Tasks `M2-01`..`M2-14` and gates `M2-G1`..`M2-G7` are all `Done` |
| M3 | Tasks `M3-01`..`M3-18` and gates `M3-G1`..`M3-G7` are all `Done` |
| C1.5 | M2 and M3 are `Done`; then Phase F self-hosting may begin |

## Suggested First 2 Sprints

### Sprint 1 (M2 foundation)

Objective:
- Establish and validate boxing/unboxing architecture and wrapper class implementation.

Planned tasks:
- `M2-01` primitive-wrapper type map
- `M2-02` signed wrapper class skeletons
- `M2-03` unsigned wrapper class skeletons
- `M2-04` `Void` wrapper contract
- `M2-05` boxing insertion at assignment boundaries
- `M2-06` unboxing insertion at assignment boundaries
- `M2-09` signed/unsigned cast+overflow diagnostics table

Suggested implementation order:
1. `M2-01`
2. `M2-02`, `M2-03`, `M2-04`
3. `M2-05`, `M2-06`
4. `M2-09`

Sprint 1 exit checks:
- `cargo test -q` stays green
- New semantic tests for primitive<->wrapper assignment pass
- Wrapper class imports compile in multi-file fixtures
- No regressions in existing unsigned primitive tests

### Sprint 2 (M2 closure)

Objective:
- Close M2 behavior and lock docs/tests for runtime-facing consistency.

Planned tasks:
- `M2-07` boxing/unboxing in call args and returns
- `M2-08` overload precedence lock
- `M2-10` wrapper APIs (`valueOf`, parse, extractors, compare)
- `M2-11` core bootstrap classes delta completion
- `M2-12` nullability boundary enforcement
- `M2-13` native executable fixtures for wrapper APIs/failures
- `M2-14` freeze-doc update with boxing/cast tables

Suggested implementation order:
1. `M2-07`, `M2-08`
2. `M2-10`, `M2-11`
3. `M2-12`
4. `M2-13`
5. `M2-14`

Sprint 2 exit checks:
- M2 gates `M2-G1`..`M2-G7` all marked `Done`
- Deterministic fixture outputs captured for wrapper API happy/failure paths
- Freeze docs aligned with implementation and tests

## Sprint Tracking Snapshot

| Sprint | Target Tasks | Must-Pass Gates | Exit State |
|---|---|---|---|
| Sprint 1 | `M2-01`..`M2-06`, `M2-09` | semantic + compile checks | Foundation complete |
| Sprint 2 | `M2-07`..`M2-14` | `M2-G1`..`M2-G7` | M2 complete |
