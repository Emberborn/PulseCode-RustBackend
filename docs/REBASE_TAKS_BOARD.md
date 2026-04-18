# Rebase Task Board: Rust-Backed Target-Adapter Pivot

Status legend: `Todo`, `In Progress`, `Blocked`, `Done (Locked)`.

## Strategic Direction Note (2026-03-21)

Primary scope/policy reference for `RB-00`:

- [Rebase Scope and Return-to-F1 Policy](/D:/Programming/codex/PulseCode/docs/REBASE_SCOPE_AND_RETURN_POLICY.md)

- this board is a temporary execution lane that must close before normal `F1` continuation resumes
- PulseCode is no longer aiming to finish a Windows-first native product backend before it has a truthful multi-target architecture
- the current Windows MASM/COFF/`link.exe` pipeline remains valuable as the current Windows x64 target adapter, host/bootstrap lane, and regression surface
- the strategic destination is now:
  - a Rust-hosted bootstrap compiler/runtime path above the target boundary
  - explicit target adapters below the IR/backend planning boundary
  - immediate executable support for Windows x64 while preserving later target integration boundaries
  - explicit PulseOS, Linux, and macOS target lanes that can be activated later without reintroducing `native-x64` as the whole model
- language, stdlib, docs, validation, and self-sustained-hosting-readiness work on `F1`/`F2`/`F-A` remain real; this board rebases the backend/runtime/targeting spine so those boards stop deepening the wrong assumptions

## Scope
This board rebases PulseCode from a Windows-shaped backend/product trajectory into a Rust-backed bootstrap compiler with explicit target-adapter boundaries. It does not replace `F1`, `F2`, or `F-A`; it is the temporary execution lane required to make those boards honest under the multi-target self-sustained direction.

At closure, the project should no longer behave as if:
- `native-x64` is the only meaningful target
- MASM/COFF/`link.exe` define the backend architecture
- compiler-owned packaging/productization still belongs in `pulsec`
- runtime/service contracts below IR can stay implicit or Windows-shaped

Instead, PulseCode should have:
- a truthful target model
- a real adapter boundary below IR
- an explicit Windows x64 target lane that remains usable as the current host/bootstrap adapter
- an explicit PulseOS first-slice target/runtime contract
- later Linux and macOS lanes that fit the same target model without forcing another architecture rewrite
- clear return-to-`F1` continuity

## Rebase End-State Intent
At rebase closure, PulseCode should be able to say all of the following honestly:
- the compiler frontend/semantics/IR remain live and green on the current Rust-hosted bootstrap path
- target selection is explicit in CLI/manifest/build-plan surfaces
- the backend is modeled as a target-adapter system rather than one hard-coded Windows path
- the Windows x64 path is retained as an immediate real target and the current host/bootstrap adapter, not the sole product destination
- a minimal PulseOS adapter contract exists for startup, runtime services, and artifact/loading expectations
- the architecture leaves room for later Linux and macOS targets without another `native-x64`-shaped collapse
- `F1` can resume on top of this rebased foundation without quietly reintroducing Windows-only assumptions

## Rebase Strict Done Policy
- This board is not complete when the docs merely say the direction changed; the code, contracts, CLI/manifest surfaces, and validation layers must reflect that change.
- `Done (Locked)` means the relevant targeting/backend/runtime boundary is explicit, implemented where required, and guarded by deterministic tests or lock artifacts.
- Windows-specific toolchain behavior may remain where needed for the Windows x64 adapter, but Windows productization work must be explicitly frozen instead of continuing to grow as the strategic default.
- No task closes if it only renames concepts while leaving `native-x64`, MASM, or Windows runtime assumptions hard-coded underneath.
- Because PulseCode is still unreleased, `native-x64` compatibility is temporary migration scaffolding only and must not survive honest rebase closure once the canonical target IDs are wired through the public surfaces.
- PulseOS-target work on this board should be first-slice honest: define what is real now for a PulseOS lane, fence what is still deferred, and do not imply a finished final ABI.
- This board closes only when the return path back into `F1` is documented explicitly and the live handoff/roadmap/contracts all agree.

## Workstream A: Truthful Rebase Scope and Audit

Primary audit inventory reference for `RB-01`:

- [Windows-Coupled Assumption Inventory](/D:/Programming/codex/PulseCode/docs/REBASE_WINDOWS_ASSUMPTION_INVENTORY.md)

Primary classification reference for `RB-02`:

- [Windows-Coupled Assumption Classification Matrix](/D:/Programming/codex/PulseCode/docs/REBASE_WINDOWS_ASSUMPTION_CLASSIFICATION.md)

| ID | Task | Depends On | Owner | Target | Status | Exit Condition |
|---|---|---|---|---|---|---|
| RB-00 | Publish the rebase scope, strategic non-goals, and return-to-`F1` policy | `F1`, `CODEX_HANDOFF_PHASE_F`, `STANDALONE_ROADMAP` | Codex | 2026-03-21 | Done (Locked) | [REBASE_SCOPE_AND_RETURN_POLICY.md](/D:/Programming/codex/PulseCode/docs/REBASE_SCOPE_AND_RETURN_POLICY.md) makes the rebase lane explicit about what it is changing, what it is freezing, why it exists before `F1` continues, and exactly when control returns to `F1-51` |
| RB-01 | Audit all currently live Windows-coupled assumptions across CLI, manifest, backend planning, runtime emission, link/toolchain discovery, and packaging contracts | RB-00 | Codex | 2026-03-21 | Done (Locked) | [REBASE_WINDOWS_ASSUMPTION_INVENTORY.md](/D:/Programming/codex/PulseCode/docs/REBASE_WINDOWS_ASSUMPTION_INVENTORY.md) publishes a categorized inventory of the currently live Windows-coupled assumptions across code, contracts, and validation locks |
| RB-02 | Classify each audited Windows-coupled assumption as one of: `bootstrap adapter`, `target-neutral compiler layer`, `must move behind target adapter`, or `freeze/defer` | RB-01 | Codex | 2026-03-21 | Done (Locked) | [REBASE_WINDOWS_ASSUMPTION_CLASSIFICATION.md](/D:/Programming/codex/PulseCode/docs/REBASE_WINDOWS_ASSUMPTION_CLASSIFICATION.md) classifies every published inventory entry and assigns each one an explicit architectural home plus follow-up task anchors |

## Workstream B: Target Model and Surface Rebase

Primary target taxonomy reference for `RB-03`:

- [Target Taxonomy and Naming Policy](/D:/Programming/codex/PulseCode/docs/TARGET_TAXONOMY_AND_NAMING.md)

| ID | Task | Depends On | Owner | Target | Status | Exit Condition                                                                                                                                                                               |
|---|---|---|---|---|---|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| RB-03 | Replace the single implicit `native-x64` target model with an explicit target taxonomy and naming policy | RB-01, RB-02 | Codex | 2026-03-22 | Done (Locked) | [TARGET_TAXONOMY_AND_NAMING.md](/D:/Programming/codex/PulseCode/docs/TARGET_TAXONOMY_AND_NAMING.md) now publishes canonical target IDs (`windows-x64`, `pulseos-x64`, `linux-x64`), explicit adapter-lane naming, and the retirement of the old `native-x64` public name; the shared source for that taxonomy now exists in `crates/pulsec-cli/src/cli/target_model.rs` |
| RB-04 | Rebase CLI target selection so build surfaces no longer validate only one hard-coded target value | RB-03 | Codex | 2026-03-22 | Done (Locked) | CLI target parsing/help text now accept the canonical target IDs (`windows-x64`, `pulseos-x64`, `linux-x64`) and reject stale single-target assumptions, including the retired `native-x64` public name, deterministically |
| RB-05 | Rebase manifest validation so `[build].target` reflects the new target taxonomy instead of requiring only `native-x64` | RB-03 | Codex | 2026-03-22 | Done (Locked) | Manifest validation, scaffold defaults, and manifest-facing examples now use the canonical target IDs directly, and `native-x64` is removed from the public target surface instead of being retained as compatibility scaffolding |
| RB-06 | Rebase emitted backend plan metadata so the active target adapter, artifact family, runtime ABI family, and bootstrap-vs-strategic status are explicit | RB-03, RB-04, RB-05 | Codex | 2026-03-22 | Done (Locked) | `build.config.plan.json` and `native.plan.json` now emit explicit `target_adapter` metadata that separates requested target lane from the active Windows x64 bootstrap adapter when they differ, and names the active artifact family plus runtime ABI family honestly |

## Workstream C: Backend Boundary Extraction

| ID | Task | Depends On | Owner | Target | Status | Exit Condition |
|---|---|---|---|---|---|---|
| RB-07 | Lock the backend architecture into explicit layers: target-neutral compiler output, Rust-host bootstrap layer, and target-specific adapters | RB-02, RB-06 | Codex | 2026-03-22 | Done (Locked) | [BACKEND_LAYER_ARCHITECTURE.md](/D:/Programming/codex/PulseCode/docs/BACKEND_LAYER_ARCHITECTURE.md) now defines the layer contract, and the backend code tree now mirrors it through `backend/target_neutral`, `backend/host_bootstrap`, and `backend/adapters` instead of exposing one blended Windows pipeline |
| RB-08 | Extract or harden an adapter registry/boundary so target-specific emission/link/runtime choices are selected through one explicit seam | RB-07 | Codex | 2026-03-22 | Done (Locked) | [BACKEND_ADAPTER_REGISTRY.md](/D:/Programming/codex/PulseCode/docs/BACKEND_ADAPTER_REGISTRY.md) now defines the registry seam, and host bootstrap plus plan rendering now resolve target-specific behavior through `backend/adapters` instead of scattered Windows helper imports |
| RB-09 | Stabilize and scope the current Windows MASM/COFF/`link.exe` path as the Windows x64 host/bootstrap adapter | RB-07, RB-08 | Codex | 2026-03-22 | Done (Locked) | [WINDOWS_X64_ADAPTER_SCOPE.md](/D:/Programming/codex/PulseCode/docs/WINDOWS_X64_ADAPTER_SCOPE.md) now defines the retained Windows x64 lane boundary, the Windows matrix is framed as adapter support evidence, and linker/assembler surfaces are explicitly documented as Windows adapter overrides instead of global backend truth |
| RB-10 | Remove or isolate Windows-only assumptions from target-neutral backend planning structures | RB-07, RB-08, RB-09 | Codex | 2026-03-22 | Done (Locked) | [TARGET_NEUTRAL_PLANNING_BOUNDARY.md](/D:/Programming/codex/PulseCode/docs/TARGET_NEUTRAL_PLANNING_BOUNDARY.md) now defines the planning boundary, and target-neutral plan rendering resolves backend contract plus fallback link-plan defaults through the adapter seam instead of hard-coding Windows defaults like `kernel32.lib` |

## Workstream D: Runtime and Intrinsics Boundary Rebase

Primary runtime partition reference for `RB-11`:

- [Runtime Intrinsics Partition](/D:/Programming/codex/PulseCode/docs/RUNTIME_INTRINSICS_PARTITION.md)

Primary host bootstrap runtime reference for `RB-12`:

- [Host Bootstrap Runtime Contract](/D:/Programming/codex/PulseCode/docs/HOST_BOOTSTRAP_RUNTIME_CONTRACT.md)

Primary PulseOS runtime-service reference for `RB-13`:

- [PulseOS Runtime Service ABI Slice](/D:/Programming/codex/PulseCode/docs/PULSEOS_RUNTIME_SERVICE_ABI_SLICE.md)

Primary runtime ownership rebase reference for `RB-14`:

- [Runtime Ownership Rebase](/D:/Programming/codex/PulseCode/docs/RUNTIME_OWNERSHIP_REBASE.md)

Primary artifact split reference for `RB-15`:

- [Target Artifact Contract Split](/D:/Programming/codex/PulseCode/docs/TARGET_ARTIFACT_CONTRACT_SPLIT.md)

| ID | Task | Depends On | Owner | Target | Status | Exit Condition |
|---|---|---|---|---|---|---|
| RB-11 | Audit the current runtime intrinsic surface and separate portable language/runtime contracts from adapter-specific service glue | RB-01, RB-07 | Codex | 2026-03-22 | Done (Locked) | [RUNTIME_INTRINSICS_PARTITION.md](/D:/Programming/codex/PulseCode/docs/RUNTIME_INTRINSICS_PARTITION.md) now consumes `WIN-RT-01`, `WIN-RT-02`, `WIN-RT-03`, and `WIN-RT-05`, [RUNTIME_INTRINSICS_ABI.md](/D:/Programming/codex/PulseCode/docs/RUNTIME_INTRINSICS_ABI.md) now describes the portable runtime contract separately from current Windows x64 adapter notes, and the active Windows service-import inventory is tracked separately in `windows_x64_runtime_service_imports()` |
| RB-12 | Lock the minimum Rust-host bootstrap runtime contract required to keep the compiler and executable validation moving during the transition | RB-11 | Codex | 2026-03-22 | Done (Locked) | [HOST_BOOTSTRAP_RUNTIME_CONTRACT.md](/D:/Programming/codex/PulseCode/docs/HOST_BOOTSTRAP_RUNTIME_CONTRACT.md) now defines the retained lifecycle/core/trace/bootstrap procedure families, `native.plan.json` now emits `host_bootstrap_runtime` with schema `pulsec.host_bootstrap.runtime.v1`, and the active adapter-owned service-import exclusions resolve through the adapter seam instead of being blended back into host-bootstrap runtime truth |
| RB-13 | Define the first PulseOS runtime ABI slice for the meeting milestone surface (`console`, `panic`, `exit`, minimal file/path/service seams as honestly available) | RB-11 | Codex | 2026-03-22 | Done (Locked) | [PULSEOS_RUNTIME_SERVICE_ABI_SLICE.md](/D:/Programming/codex/PulseCode/docs/PULSEOS_RUNTIME_SERVICE_ABI_SLICE.md) now defines the first requested-target PulseOS service boundary, `native.plan.json` now emits `requested_target_runtime_service_abi` with schema `pulsec.pulseos.runtime_service.v1` for `pulseos-x64`, and the contract stays explicitly separate from the retained Windows-backed host bootstrap runtime seam |
| RB-14 | Reorganize ownership boundaries between Pulse stdlib/runtime code, Rust bootstrap runtime code, and adapter-specific loader/syscall glue | RB-12, RB-13 | Codex | 2026-03-22 | Done (Locked) | [RUNTIME_OWNERSHIP_REBASE.md](/D:/Programming/codex/PulseCode/docs/RUNTIME_OWNERSHIP_REBASE.md) now defines the three-way ownership split, `native.plan.json` now emits `runtime_ownership_model` with schema `pulsec.runtime.ownership.rebase.v1`, and the requested-target PulseOS service contract remains adapter-owned implementation territory instead of collapsing back into Windows host-bootstrap runtime truth |

## Workstream E: Artifact, Startup, and Loader Contract Rebase

| ID | Task | Depends On | Owner | Target | Status | Exit Condition |
|---|---|---|---|---|---|---|
| RB-15 | Define the Windows x64 adapter artifact contract separately from the PulseOS artifact contract | RB-06, RB-09 | Codex | 2026-03-22 | Done (Locked) | [TARGET_ARTIFACT_CONTRACT_SPLIT.md](/D:/Programming/codex/PulseCode/docs/TARGET_ARTIFACT_CONTRACT_SPLIT.md) now publishes distinct Windows x64 and PulseOS artifact contracts, `native.plan.json` now emits `artifact_contracts` with separate active-adapter and requested-target contract blocks, and PulseOS artifact expectations no longer hide inside the retained Windows publication story |
| RB-16 | Define the first PulseOS startup entry, loader expectations, and publication layout contract | RB-13, RB-15 | Codex | 2026-03-22 | Done (Locked) | [PULSEOS_STARTUP_LOADER_PUBLICATION_CONTRACT.md](/D:/Programming/codex/PulseCode/docs/PULSEOS_STARTUP_LOADER_PUBLICATION_CONTRACT.md) now publishes distinct Windows x64 and PulseOS startup/loader contracts, `native.plan.json` now emits `startup_loader_contracts` with separate active-adapter and requested-target contract blocks, and the requested PulseOS lane now has an honest first-slice `pulseos_start` plus `bin/<entry> + bin/launch.json` publication contract instead of borrowing Windows bootstrap truth |
| RB-17 | Lock the first executable-loading proof target for PulseOS-bound Pulse artifacts at the contract level, even if execution remains deferred | RB-16 | Codex | 2026-03-22 | Done (Locked) | [PULSEOS_EXECUTABLE_LOADING_PROOF_TARGET.md](/D:/Programming/codex/PulseCode/docs/PULSEOS_EXECUTABLE_LOADING_PROOF_TARGET.md) now defines the first contract-level PulseOS loading proof target, `native.plan.json` now emits `requested_target_executable_loading_proof_target` for `pulseos-x64`, and the project now has an explicit definition of what counts as a PulseOS-targetable executable-loading artifact before adapter execution work resumes |
| RB-17.1 | Remove compiler-owned packaging/install generation so the compiler publishes build artifacts only and downstream tools own installers/packages | RB-17 | Codex | 2026-03-22 | Done (Locked) | [COMPILER_PACKAGING_REMOVAL.md](/D:/Programming/codex/PulseCode/docs/COMPILER_PACKAGING_REMOVAL.md) now records the removed CLI/manifest surface, the no-compatibility policy for unreleased packaging features, and the rule that `pulsec` publishes build outputs while external tooling owns installers/packages |

## Workstream F: Validation, Freeze Policy, and Return To F1

Primary validation-layering reference for `RB-18`:

- [Rebase Validation Layering](/D:/Programming/codex/PulseCode/docs/REBASE_VALIDATION_LAYERING.md)

Primary Windows scope/freeze reference for `RB-19`:

- [Windows x64 Scope / Freeze Policy](/D:/Programming/codex/PulseCode/docs/WINDOWS_X64_SCOPE_FREEZE_POLICY.md)

Primary planning-spine reference for `RB-20`:

- [Rebase Planning Spine Alignment](/D:/Programming/codex/PulseCode/docs/REBASE_PLANNING_SPINE_ALIGNMENT.md)

Primary closure/evidence references for `RB-21`:

- [Rebase Closure Checklist](/D:/Programming/codex/PulseCode/docs/REBASE_CLOSURE_CHECKLIST.md)
- [Rebase Evidence Index](/D:/Programming/codex/PulseCode/docs/REBASE_EVIDENCE_INDEX.md)

| ID | Task | Depends On | Owner | Target | Status | Exit Condition |
|---|---|---|---|---|---|---|
| RB-18 | Rebase validation layering so target-neutral tests, Windows x64 adapter tests, and PulseOS-adapter tests have explicit homes, with later target expansion fitting the same split | RB-06, RB-08, RB-13, RB-16 | Codex | 2026-03-22 | Done (Locked) | [REBASE_VALIDATION_LAYERING.md](/D:/Programming/codex/PulseCode/docs/REBASE_VALIDATION_LAYERING.md) now maps the live suites into target-neutral, Windows x64 adapter, PulseOS requested-target, and later target homes explicitly, and the source files now carry matching ownership comments so validation no longer reads like one blended native lane |
| RB-19 | Publish Windows scope/freeze policy covering MASM, `link.exe`, and other remaining Windows-specific assumptions without reintroducing compiler-owned packaging | RB-09, RB-15, RB-17.1, RB-18 | Codex | 2026-03-22 | Done (Locked) | [WINDOWS_X64_SCOPE_FREEZE_POLICY.md](/D:/Programming/codex/PulseCode/docs/WINDOWS_X64_SCOPE_FREEZE_POLICY.md) now names the retained live Windows x64 scope, the frozen/removed Windows-productization scope, and the no-reentry rules that keep packaging and other Windows-only drift from growing back into compiler scope |
| RB-20 | Update roadmap, backend contract, and handoff docs so the rebase becomes the live planning truth and `F1` resume guidance is corrected | RB-00, RB-13, RB-16, RB-19 | Codex | 2026-03-22 | Done (Locked) | [REBASE_PLANNING_SPINE_ALIGNMENT.md](/D:/Programming/codex/PulseCode/docs/REBASE_PLANNING_SPINE_ALIGNMENT.md) now locks the live planning spine, the active `RB-21` resume point, and the eventual `F1-51` return point without prematurely reactivating `F1` |
| RB-21 | Publish rebase closure checklist/evidence index and explicitly hand control back to `F1_TASK_BOARD` | RB-18, RB-19, RB-20 | Codex | 2026-03-22 | Done (Locked) | [REBASE_CLOSURE_CHECKLIST.md](/D:/Programming/codex/PulseCode/docs/REBASE_CLOSURE_CHECKLIST.md) and [REBASE_EVIDENCE_INDEX.md](/D:/Programming/codex/PulseCode/docs/REBASE_EVIDENCE_INDEX.md) are published, the requested review has cleared the rebase closure package, and control now returns explicitly to `F1_TASK_BOARD` at `F1-51` |

## Rebase Gates

| Gate | Definition | Status |
|---|---|---|
| RB-G1 | Rebase scope, audit, and classification are truthful and complete | Done (Locked) |
| RB-G2 | Target selection and build/manifest/plan surfaces are rebased off the single-target assumption, with no retained `native-x64` public target after migration | Done (Locked) |
| RB-G3 | Backend adapter boundary is explicit and the Windows x64 lane is scoped honestly as an immediate target plus current host/bootstrap path | Done (Locked) |
| RB-G4 | Runtime/Intrinsics ownership and PulseOS first-slice service contract are explicit | Done (Locked) |
| RB-G5 | Artifact/startup/loader contracts are explicit for the Windows x64 lane and the PulseOS lane, and compiler-owned packaging is removed from the build surface | Done (Locked) |
| RB-G6 | Validation, freeze policy, and return-to-`F1` continuity are complete | Done (Locked) |

## Required Test/Evidence Gates

| Gate ID | Gate | Command / Evidence | Status |
|---|---|---|---|
| RB-G1 | Rebase truthfulness | [REBASE_SCOPE_AND_RETURN_POLICY.md](/D:/Programming/codex/PulseCode/docs/REBASE_SCOPE_AND_RETURN_POLICY.md) + [REBASE_WINDOWS_ASSUMPTION_INVENTORY.md](/D:/Programming/codex/PulseCode/docs/REBASE_WINDOWS_ASSUMPTION_INVENTORY.md) + [REBASE_WINDOWS_ASSUMPTION_CLASSIFICATION.md](/D:/Programming/codex/PulseCode/docs/REBASE_WINDOWS_ASSUMPTION_CLASSIFICATION.md) | Done (Locked) |
| RB-G2 | Target/model rebase | CLI/manifest/build-plan validation covering the canonical target taxonomy, explicit `target_adapter` plan metadata, and deterministic failure of stale single-target assumptions | Done (Locked) |
| RB-G3 | Adapter boundary and Windows scope policy | code-level adapter seam + Windows x64 adapter coverage + explicit scope/freeze policy evidence | Done (Locked) |
| RB-G4 | Runtime/Intrinsics rebase | runtime/intrinsics contract docs plus focused tests or lock artifacts proving the portable-vs-adapter split is real | Done (Locked) |
| RB-G5 | Artifact/startup/loader contracts | updated backend contract + artifact/publication/startup docs for Windows x64 lane and PulseOS first-slice lane, plus [COMPILER_PACKAGING_REMOVAL.md](/D:/Programming/codex/PulseCode/docs/COMPILER_PACKAGING_REMOVAL.md) for the removed packaging surface | Done (Locked) |
| RB-G6 | Return-to-`F1` continuity | updated roadmap/handoff docs + rebase closure checklist/evidence index + explicit `F1` resume point | Done (Locked) |

## Suggested First 4 Sprints

### Sprint 1 (Truthful Rebase Lock)
- Target tasks: `RB-00`..`RB-03`
- Focus: make the pivot explicit, inventory the Windows-shaped assumptions, and define the new multi-target model before touching lower boundaries
- Exit checks:
  - `RB-G1` green at baseline level
  - the repo has one truthful vocabulary for Windows x64, PulseOS, generic Linux, and later target lanes

### Sprint 2 (Surface and Boundary Rebase)
- Target tasks: `RB-04`..`RB-10`
- Focus: rebase CLI/manifest/plan surfaces and extract the target-adapter seam while scoping the Windows x64 lane honestly
- Exit checks:
  - `RB-G2` and `RB-G3` green at baseline level
  - no core backend structure still requires the Windows x64 adapter to define the architecture

### Sprint 3 (Runtime + PulseOS Contract)
- Target tasks: `RB-11`..`RB-17.1`
- Focus: define the portable runtime boundary, the bootstrap runtime boundary, and the first PulseOS runtime/startup/artifact contract
- Exit checks:
  - `RB-G4` and `RB-G5` green at baseline level
  - the first PulseOS slice is explicit enough to guide implementation without pretending it is finished

### Sprint 4 (Validation + Return To F1)
- Target tasks: `RB-18`..`RB-21`
- Focus: lock validation layering, publish the Windows scope/freeze policy, update live docs/handoffs, and hand the project back to `F1`
- Exit checks:
  - `RB-G6` green
  - the next agent can resume `F1` without re-litigating the backend direction

## Exit Criteria

| Milestone | Exit Criteria |
|---|---|
| Rebase | Tasks `RB-00`..`RB-21` and gates `RB-G1`..`RB-G6` are all `Done (Locked)` |
| Rebase Deliverable | PulseCode is rebased onto a Rust-hosted target-adapter architecture where Windows x64 remains a usable immediate target and current host/bootstrap lane, the PulseOS first-slice target/runtime contract is explicit, later Linux/macOS expansion fits the same model, and `F1` can resume on a truthful strategic foundation |
