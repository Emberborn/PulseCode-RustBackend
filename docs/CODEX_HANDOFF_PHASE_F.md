# Codex Handoff: Phase F Continuation

This handoff replaces the older implementation/C3 handoffs. It is intended for the next Codex window and should be treated as the current execution brief.

## Strategic Pivot (2026-03-21)

The project mission changed during Phase F:

- PulseCode is now the Rust-hosted bootstrap compiler and language/runtime workbench for a multi-target self-sustained path
- self-hosting is now the transition mechanism rather than the end goal; the actual destination is a self-sustained compiler/runtime stack that can target multiple operating systems honestly while shrinking Rust down to the defended host/bootstrap and adapter boundary
- Windows x64 is the current executable target lane; PulseOS, generic Linux, and macOS Apple Silicon remain preserved later target lanes
- the current Windows MASM/COFF/`link.exe` path remains useful as the current Windows x64 target adapter, host/bootstrap backend, and regression surface, but it is no longer the singular architecture or product destination
- new backend/runtime work below the IR boundary should prioritize explicit target-adapter boundaries that keep Windows x64 targetable while preserving clean integration room for later PulseOS, Linux, and macOS targets
- `pulseos-x64` now means a distinct PulseOS platform target contract
- `linux-x64` remains a distinct later public target
- `native-x64` is now retired from the public target surface; current CLI, manifest, and scaffold surfaces use only the canonical public targets (`windows-x64`, `pulseos-x64`, `linux-x64`, `macos-arm64`)
- compiler-owned packaging/install generation has been removed from `pulsec`; downstream tools own installers/packages if needed
- frontend, semantics, IR, stdlib, docs, validation, and self-sustained-hosting readiness work on the F1/F2/F-A boards remain active and must continue
- do not reintroduce compiler-owned packaging/productization surfaces during the rebase

When older roadmap language conflicts with this pivot, follow the rebase board, this handoff, the native backend contract, the standalone roadmap, and then the F1/F2/F-A/F-B continuity docs as the live direction.

## Self-Sustained Direction (2026-04-10)

The newer project rule is stronger than the older "self-host" wording:

- self-sustained hosting is the transition mechanism, not the end-state goal
- the actual target is self-sustained hosting, meaning Pulse should own everything it realistically can
- `stdlib` remains the ordinary user-facing library
- `authorlib` is the privileged Pulse-owned extension library for compiler/runtime/toolchain authoring work
- the compiler must always be able to resolve `authorlib` for compiler/runtime builds even when a user project does not enable it as a normal dependency
- the import/prelude model must stop depending on hand-maintained builtin class/package registries; `pulse.*` / `author.*` resolution should derive from the real stdlib tree, the default-import contract must be documented explicitly, and the implicit prelude package list must have one compiler-owned source of truth
- the future Pulse-side compiler/runtime test model is not a copy of Rust bring-up locks: Rust keeps the broad board/roadmap/doc lock burden while Pulse-side tests should center feature/behavior locks, ABI/runtime/stdlib contracts, diagnostics, and failure modes
- a dedicated pre-Phase-G `F-B` inventory pass now exists to classify what still has to move from Rust into Pulse before the Phase G transition can be claimed honestly
- the current working rule is to push active work toward self-sustained completion now when it fits the current phase cleanly, but not to force disproportionate ownership/elevation work too early
- when that later self-sustained work is real but not correctly sequenced yet, it must be written into [FB_CARRY_FORWARD_TRACKER.md](/G:/Programming/Rust/PulseCode/docs/FB_CARRY_FORWARD_TRACKER.md) so `F-B` starts with a lighter audit load
- the first concrete Pulse-side feature-lock homes now exist in:
  - [prelude_contract.rs](/G:/Programming/Rust/PulseCode/crates/pulsec-core/src/tests/prelude_contract.rs)
  - [pulse_feature_locks.rs](/G:/Programming/Rust/PulseCode/crates/pulsec-cli/tests/pulse_feature_locks.rs)

## Current F1 Surface Snapshot (2026-04-14)

The active `F1-97` lane sits on top of a substantial shipped F1 baseline.

Important current surface truths:

- the language is already executable across a meaningful Java-close subset, not only parser/bootstrap scaffolding
- real shipped language surface includes:
  - packages/imports/static imports
  - classes/interfaces/inheritance/constructors/fields/methods
  - `this`, `super`, `abstract`, `final`, override validation
  - `if`, `while`, `do-while`, `for`, `switch`, `break`, `continue`, `return`
  - arrays, foreach, ternary, bitwise/shift operators, local `var`
  - explicit casts, `instanceof`, and the current compile-time-instantiated / erased-runtime generics baseline
  - shipped exception-flow baseline with `throw`, `try` / `catch` / `finally`, and declaration-form try-with-resources
- the current public stdlib surface already lives under:
  - `pulse.lang`
  - `pulse.collections`
  - `pulse.io`
  - `pulse.math`
  - `pulse.time`
  - `pulse.util`
  - `pulse.rt`
- the current practical utility baseline already includes reusable parser/text helpers such as `pulse.util.TextCursor`
- the public project/tooling surface is real and must be treated as contract:
  - `pulsec new|check|build|test|help|version`
  - canonical public targets `windows-x64`, `pulseos-x64`, `linux-x64`, `macos-arm64`
  - public manifest v1 sections `[package]`, `[sources]`, `[build]`, `[toolchain]`, `[workspace]`, and `[authorlib]`
  - current Gradle-style layout rooted at `src/main`, `src/test`, `src/api`, `docs`, `libraries`, and `build/*`
- compiler-owned packaging/install generation is removed from the public compiler surface

Practical consequence:

- active lifts under `F1-97` should reason from this shipped source/runtime/project surface
- do not behave as if the language or project model is still an empty bootstrap shell
- prefer extending or routing through existing `pulse.*` / `author.*` surface over parallel rewrites
- the current `author.project.*` seed now includes manifest parsing/validation, layout resolution, manifest lookup/loading, workspace-member validation, entry discovery, test-file discovery, and the first Pulse-owned check/test invocation-shaping slice instead of stopping at passive model types
- that same `author.project.*` seed now also includes bridge-first workspace context ownership through:
  - `author.project.WorkspaceContext`
  - `author.project.WorkspaceContextBridge`
- Rust `check` / `build` / `test` workspace detection now prefers authored `ProjectDiscovery.resolveWorkspaceContext(...)` instead of keeping workspace-member resolution as the hot Rust path
- the first Pulse-owned build invocation/config slice now also exists under `author.build.*` (`BuildConfig`, `BuildInvocation`, `BuildInvocationResolver`)
- `author.build.*` now also owns workspace-build execution/result contracts through:
  - `author.build.WorkspaceBuildResult`
  - `author.build.WorkspaceBuildMemberResult`
  - `author.build.BuildSummaryWriter.renderWorkspaceBuild*`
- Rust `build` workspace output now prefers authored start/member/summary/failure rendering instead of raw inline workspace-build strings
- the first Pulse-owned toolchain precedence/config slice now also exists under `author.toolchain.*` (`ToolchainConfig`, `ToolchainResolver`)
- the first Pulse-owned toolchain candidate-planning slice now also exists there (`ToolchainCandidatePlan`, `ToolchainResolver.planCandidates(...)`)
- the first Pulse-owned toolchain command-shaping slice now also exists there (`ToolchainCommandPlan`, Windows link-plan helpers, response-file rendering helpers)
- the first Pulse-owned toolchain env/process planning slice now also exists there through the public `pulse.process.*` surface (`ProcessEnvironmentVariable`, `ProcessEnvironment`, `ProcessPlan`, `ToolchainResolver.mergeEnvironment(...)`, `ToolchainResolver.planResponseFileProcess(...)`, `ToolchainResolver.planWindowsMasmAssembleProcess(...)`)
- the first Pulse-owned toolchain host-filesystem execution slice now also exists there (`ToolchainHostFilesystem.writeResponseFile(...)`)
- the first public host-filesystem materialization seam is now also real under `pulse.io.HostFiles`
- `author.toolchain.*` now crosses into both the public `pulse.process.*` surface and the public `pulse.io.HostFiles` surface instead of keeping private first-homes for them
- the next outward/public-first continuation is no longer process/env first-home work; the next continuation is the remaining build publication/materialization lift, while widening the public host-filesystem substrate only where self-sustained growth would otherwise require Rust again
- that build publication/materialization lift now also includes binary-safe filtered artifact staging through `author.build.BuildPublicationWriter.copyRecursiveMatchingExtension(...)`, so normal `asm` / `obj` staging is no longer Rust-owned in the hot path
- that outward move is now real under `pulse.process.*`:
  - `ProcessEnvironmentVariable`
  - `ProcessEnvironment`
  - `ProcessPlan`
  - `ProcessResult`
  - `Processes.execute(...)`
- `author.toolchain.*` now consumes that public process/env surface instead of owning a private first-home for it
- the adjacent remaining public-stdlib gap is host-filesystem breadth, not first-home ownership:
  - `pulse.io.*` is now the public file/path/materialization surface
  - but the host-backed write/create/list substrate is still thin and should be expanded where later self-sustained growth would otherwise require Rust again
- the Rust build-resolution donor path has also been partially realigned to that Pulse-owned contract:
  - direct-mode source-root defaulting is now anchored under the resolved project root
  - manifest build output-mode aliases are normalized through the same `fat/shared` contract
  - the resolved Rust build model now carries effective toolchain precedence (`CLI > manifest`) instead of leaving part of that outside the model
  - Rust `cli/build/mod.rs` now consumes resolved toolchain values directly instead of re-merging CLI flags during build execution/publication-plan emission
  - the build-resolution bridge from Rust into the Pulse-owned resolver is now live and cached; Rust remains the backend/tool execution safety net under that bridge rather than the policy owner
- the first backend tool-execution bridge-down slice is also real now: Rust-side `ml64.exe` execution uses the shared process-plan helpers in `toolchain_linking.rs` instead of open-coded command shaping
- the CLI project loader no longer eagerly loads every sibling file in a package when one class is referenced; same-package resolution is now demand-driven, which is closer to the intended Java-like model
- the new env/process slice also forced two more compiler truths:
  - IR lowering must preserve compile-time generic return information long enough to substitute owner type parameters for nested member-call inference; otherwise valid authorlib chains like `values.get(index).name().toLowerCase()` collapse to `unknown` too early
  - large boolean contract expressions in authorlib feature locks must not blow the Rust compiler stack during semantic analysis; logical `&&` / `||` handling is now flattened in semantics/nullability/lowering instead of recursing one frame per binary node
- another backend truth exposed by the collection wrapper regression:
  - wrapper-typed call results cannot all be treated as one runtime shape
  - pseudo-wrapper helpers such as `Integer.valueOf(...)` still travel on primitive lanes
  - collection/reference reads such as `List<Integer>.get(...)`, `Map<String, Integer>.get(...)`, and `Queue<Integer>.remove()` can still surface as real boxed-object handles even when the compile-time type is a wrapper
  - backend boxing decisions must keep those cases separate

## Execution Priority (2026-03-21)

- [Tool Inventory](/D:/Programming/codex/PulseCode/docs/TOOLS.md) records the currently available local command-line tools and the shell `PATH` refresh step
- [F1 Task Board](/D:/Programming/codex/PulseCode/docs/F1_TASK_BOARD.md) is now the active execution board
- [Backend Adapter Registry](/D:/Programming/codex/PulseCode/docs/BACKEND_ADAPTER_REGISTRY.md) is the current source of truth for the `RB-08` adapter-selection seam
- [Windows x64 Adapter Scope](/D:/Programming/codex/PulseCode/docs/WINDOWS_X64_ADAPTER_SCOPE.md) is the current source of truth for the `RB-09` retained Windows lane boundary
- [Target-Neutral Planning Boundary](/D:/Programming/codex/PulseCode/docs/TARGET_NEUTRAL_PLANNING_BOUNDARY.md) is the current source of truth for the `RB-10` planning-structure boundary
- [Runtime Intrinsics Partition](/D:/Programming/codex/PulseCode/docs/RUNTIME_INTRINSICS_PARTITION.md) is the current source of truth for the `RB-11` portable-vs-adapter runtime split
- [Host Bootstrap Runtime Contract](/D:/Programming/codex/PulseCode/docs/HOST_BOOTSTRAP_RUNTIME_CONTRACT.md) is the current source of truth for the `RB-12` minimum retained Rust-host bootstrap runtime seam
- [PulseOS Runtime Service ABI Slice](/D:/Programming/codex/PulseCode/docs/PULSEOS_RUNTIME_SERVICE_ABI_SLICE.md) is the current source of truth for the `RB-13` requested-target PulseOS runtime-service slice
- [Runtime Ownership Rebase](/D:/Programming/codex/PulseCode/docs/RUNTIME_OWNERSHIP_REBASE.md) is the current source of truth for the `RB-14` three-way ownership split
- [Target Artifact Contract Split](/D:/Programming/codex/PulseCode/docs/TARGET_ARTIFACT_CONTRACT_SPLIT.md) is the current source of truth for the `RB-15` artifact split between Windows x64 and PulseOS
- [PulseOS Startup, Loader, and Publication Contract](/D:/Programming/codex/PulseCode/docs/PULSEOS_STARTUP_LOADER_PUBLICATION_CONTRACT.md) is the current source of truth for the `RB-16` startup/publication split between the retained Windows x64 lane and the requested-target PulseOS lane
- [PulseOS Executable-Loading Proof Target](/D:/Programming/codex/PulseCode/docs/PULSEOS_EXECUTABLE_LOADING_PROOF_TARGET.md) is the current source of truth for the `RB-17` contract-level definition of what counts as a PulseOS-targetable executable-loading artifact
- [PULSEOS_LINUX_BACKED_TARGET_DIRECTION.md](/D:/Programming/codex/PulseCode/docs/PULSEOS_LINUX_BACKED_TARGET_DIRECTION.md) records the current PulseOS target-direction policy
- [Compiler Packaging Removal](/D:/Programming/codex/PulseCode/docs/COMPILER_PACKAGING_REMOVAL.md) is the current source of truth for `RB-17.1` and the rule that `pulsec` publishes build outputs only
- [Rebase Validation Layering](/D:/Programming/codex/PulseCode/docs/REBASE_VALIDATION_LAYERING.md) is the current source of truth for `RB-18` and the rule that target-neutral, Windows x64 adapter, and PulseOS requested-target validation must keep explicit homes
- [Windows x64 Scope / Freeze Policy](/D:/Programming/codex/PulseCode/docs/WINDOWS_X64_SCOPE_FREEZE_POLICY.md) is the current source of truth for `RB-19` and the rule that real Windows x64 target support must stay separate from frozen Windows-only productization scope
- [Rebase Planning Spine Alignment](/D:/Programming/codex/PulseCode/docs/REBASE_PLANNING_SPINE_ALIGNMENT.md) is the current source of truth for `RB-20` and the rule that the planning spine stays aligned now that the rebase is closed
- [Rebase Closure Checklist](/D:/Programming/codex/PulseCode/docs/REBASE_CLOSURE_CHECKLIST.md) and [Rebase Evidence Index](/D:/Programming/codex/PulseCode/docs/REBASE_EVIDENCE_INDEX.md) are the current source of truth for the `RB-21` closure package
- [F1 Task Board](/D:/Programming/codex/PulseCode/docs/F1_TASK_BOARD.md) is now the active language/stdlib execution board after the closed rebase
- `RB-00`..`RB-21` and `RB-G1`..`RB-G6` are now closed honestly
- the active return point after rebase closure is `F1-51`

## Read This First

Before doing any new implementation work, the next agent should:

1. Read the active rebase-planning docs first:
   - [REBASE Task Board](/D:/Programming/codex/PulseCode/docs/REBASE_TAKS_BOARD.md)
   - [Rebase Scope and Return-to-F1 Policy](/D:/Programming/codex/PulseCode/docs/REBASE_SCOPE_AND_RETURN_POLICY.md)
   - [Windows-Coupled Assumption Inventory](/D:/Programming/codex/PulseCode/docs/REBASE_WINDOWS_ASSUMPTION_INVENTORY.md)
   - [Windows-Coupled Assumption Classification Matrix](/D:/Programming/codex/PulseCode/docs/REBASE_WINDOWS_ASSUMPTION_CLASSIFICATION.md)
   - [Target Taxonomy and Naming Policy](/D:/Programming/codex/PulseCode/docs/TARGET_TAXONOMY_AND_NAMING.md)
   - [Backend Layer Architecture](/D:/Programming/codex/PulseCode/docs/BACKEND_LAYER_ARCHITECTURE.md)
   - [Runtime Intrinsics Partition](/D:/Programming/codex/PulseCode/docs/RUNTIME_INTRINSICS_PARTITION.md)
   - [Host Bootstrap Runtime Contract](/D:/Programming/codex/PulseCode/docs/HOST_BOOTSTRAP_RUNTIME_CONTRACT.md)
   - [PulseOS Runtime Service ABI Slice](/D:/Programming/codex/PulseCode/docs/PULSEOS_RUNTIME_SERVICE_ABI_SLICE.md)
   - [Runtime Ownership Rebase](/D:/Programming/codex/PulseCode/docs/RUNTIME_OWNERSHIP_REBASE.md)
   - [Target Artifact Contract Split](/D:/Programming/codex/PulseCode/docs/TARGET_ARTIFACT_CONTRACT_SPLIT.md)
   - [PulseOS Startup, Loader, and Publication Contract](/D:/Programming/codex/PulseCode/docs/PULSEOS_STARTUP_LOADER_PUBLICATION_CONTRACT.md)
   - [PulseOS Executable-Loading Proof Target](/D:/Programming/codex/PulseCode/docs/PULSEOS_EXECUTABLE_LOADING_PROOF_TARGET.md)
   - [PULSEOS_LINUX_BACKED_TARGET_DIRECTION.md](/D:/Programming/codex/PulseCode/docs/PULSEOS_LINUX_BACKED_TARGET_DIRECTION.md)
   - [Compiler Packaging Removal](/D:/Programming/codex/PulseCode/docs/COMPILER_PACKAGING_REMOVAL.md)
   - [Rebase Validation Layering](/D:/Programming/codex/PulseCode/docs/REBASE_VALIDATION_LAYERING.md)
   - [Windows x64 Scope / Freeze Policy](/D:/Programming/codex/PulseCode/docs/WINDOWS_X64_SCOPE_FREEZE_POLICY.md)
   - [Rebase Planning Spine Alignment](/D:/Programming/codex/PulseCode/docs/REBASE_PLANNING_SPINE_ALIGNMENT.md)
   - [Rebase Closure Checklist](/D:/Programming/codex/PulseCode/docs/REBASE_CLOSURE_CHECKLIST.md)
   - [Rebase Evidence Index](/D:/Programming/codex/PulseCode/docs/REBASE_EVIDENCE_INDEX.md)
   - [Standalone Roadmap](/D:/Programming/codex/PulseCode/docs/STANDALONE_ROADMAP.md)
   - [F-B Task Board](/G:/Programming/Rust/PulseCode/docs/FB_TASK_BOARD.md)
   - [F-B Carry-Forward Tracker](/G:/Programming/Rust/PulseCode/docs/FB_CARRY_FORWARD_TRACKER.md)
   - [Author Library Strategy](/G:/Programming/Rust/PulseCode/docs/AUTHORLIB_STRATEGY.md)
   - [Pulse-Side Test Model](/G:/Programming/Rust/PulseCode/docs/PULSE_TEST_MODEL.md)
   - [Native Backend Contract](/D:/Programming/codex/PulseCode/docs/NATIVE_BACKEND_CONTRACT.md)

2. Read the paused-but-still-authoritative F1 continuity docs:
   - [F1 Task Board](/D:/Programming/codex/PulseCode/docs/F1_TASK_BOARD.md)
   - [F1 Baseline Audit](/D:/Programming/codex/PulseCode/docs/F1_BASELINE_AUDIT.md)
   - [F1 Gap Matrix](/D:/Programming/codex/PulseCode/docs/F1_GAP_MATRIX.md)
   - [F1 Support Policy](/D:/Programming/codex/PulseCode/docs/F1_SUPPORT_POLICY.md)
   - [F1 Dependency Graph](/D:/Programming/codex/PulseCode/docs/F1_DEPENDENCY_GRAPH.md)

3. Read the language docs structure and workflow docs:
   - [F2 Task Board](/D:/Programming/codex/PulseCode/docs/F2_TASK_BOARD.md)
   - [Compiler-Backed Language Docs README](/D:/Programming/codex/PulseCode/docs/language/compiler-backed/README.md)
   - [Runtime-Backed Language Docs README](/D:/Programming/codex/PulseCode/docs/language/runtime-backed/README.md)
   - [Stdlib Language Docs README](/D:/Programming/codex/PulseCode/docs/language/stdlib/README.md)
   - [Tool Inventory](/D:/Programming/codex/PulseCode/docs/TOOLS.md)

4. Re-examine the relevant code in detail before continuing:
   - frontend/parser/semantics/IR:
     - [pulsec-core lib.rs](/D:/Programming/codex/PulseCode/crates/pulsec-core/src/lib.rs)
     - [pulsec-core parser mod.rs](/D:/Programming/codex/PulseCode/crates/pulsec-core/src/parser/mod.rs)
     - [pulsec-core semantics mod.rs](/D:/Programming/codex/PulseCode/crates/pulsec-core/src/semantics/mod.rs)
     - [pulsec-core intermediate mod.rs](/D:/Programming/codex/PulseCode/crates/pulsec-core/src/intermediate/mod.rs)
     - [pulsec-core tests mod.rs](/D:/Programming/codex/PulseCode/crates/pulsec-core/src/tests/mod.rs)
   - CLI/doc locks:
     - [stage_locks.rs](/D:/Programming/codex/PulseCode/crates/pulsec-cli/tests/stage_locks.rs)
   - stdlib source:
     - [stdlib/src/pulse](/D:/Programming/codex/PulseCode/stdlib/src/pulse)
   - stdlib docs generator:
     - [generate-stdlib-docs.ps1](/D:/Programming/codex/PulseCode/scripts/generate-stdlib-docs.ps1)

Essential ingestion rule:

- the linked docs in this handoff are required reading, not optional background material
- the user expects the next agent to read broadly enough from this doc chain to understand the whole current codebase surface, public project/tooling contracts, language/runtime/stdlib boundaries, and live planning spine before deciding how to proceed
- reading only the immediate task doc or only the files directly adjacent to the current bug is not considered sufficient handoff intake for this project

The next agent should not rely on stale top-level narrative docs as source of truth when they conflict with the rebase board, the backend contract, the F1 continuity docs, and the code. In particular:

- [LANGUAGE_GUIDE.md](/D:/Programming/codex/PulseCode/docs/LANGUAGE_GUIDE.md) is older and not the live execution contract
- [LANGUAGE_OVERVIEW.md](/D:/Programming/codex/PulseCode/docs/LANGUAGE_OVERVIEW.md) is older and not the live execution contract

The stricter current user rule is now:

- there is no "baseline is good enough" escape hatch anymore; features should be implemented to the fullest Java-like surface that is realistically achievable in the current phase unless the user explicitly approves a difference
- `F1`, `F2`, `F-A`, and `F-B` are the hard self-sustained push; agents should bias toward aggressive closure of real Rust-to-Pulse ownership gaps rather than stopping at thinner milestone slices when a practical continuation is still achievable
- collection completion is now locked through `F1-110`; `F1-11`, `F1-17`, `F1-18`, `F1-56`, `F1-57`, `F1-58`, `F1-59`, `F1-60`, `F1-61`, `F1-62`, `F1-63`, `F1-85`, `F1-104`, `F1-111`, `F1-112`, and `F1-113` are now locked and the active work item is `F1-97`
- a task is not truly complete just because an earlier "baseline" subset works
- `Done (Locked)` means Java-hardened enough for the F1/self-sustained-hosting target; if it is still thinner than the required Java-like contract, it must stay `In Progress`
- if the shipped behavior is not yet Java-hardened enough for the F1/self-sustained-hosting target, it should stay `In Progress` with explicit return points on the F1/F2/F-A/F-B boards
- if a feature can move into Pulse `stdlib` or `authorlib` rather than staying compiler/bootstrap-owned, that migration is required before the compiler/runtime rewrite into Pulse unless the ownership genuinely belongs in compiler/runtime/backend
- compiler/runtime ownership is acceptable only where that ownership genuinely belongs; otherwise the feature should end in Pulse library code before the self-sustained-hosting transition
- if a feature is end-to-end real but still bootstrap-owned, incomplete, or not yet Java-hardened, it must be reopened or left `In Progress` instead of being treated as permanently closed
- if a new feature, runtime surface, stdlib helper, `authorlib` helper, or semantic rule is discovered during implementation to be required for self-sustained hosting, it must be added to the tracking docs/board and implemented instead of being treated as optional future cleanup
- if the later self-sustained work is real but would be disproportionate or badly sequenced in the current lane, it must be recorded in [FB_CARRY_FORWARD_TRACKER.md](/G:/Programming/Rust/PulseCode/docs/FB_CARRY_FORWARD_TRACKER.md) rather than being left as tribal knowledge
- the target is a self-sustained Java-like language/runtime/toolchain, not a partial Java-ish subset; deviations from Java should exist only where the user has explicitly chosen them
- after `F1` closes, the project must run a whole-codebase inward-lift audit rather than assuming older acceptable work is already self-sustained-clean; that audit is now explicitly tracked on the F1 board and must revisit stdlib, compiler, runtime, CLI, tests, and docs for older bootstrap/raw/pre-self-sustained shapes that still need to move inward into Pulse ownership or be defended as true host/bootstrap or adapter boundaries
- reflection-lite `Class` support is part of the pre-self-host track, while full reflection/invocation and desktop UI are intentionally after self-host unless the user changes that policy later
- the handoff must be kept current during the work: add new facts/rules when they matter, remove stale details when they stop being useful, and do not let it bloat into an unreadable dump
- backend/runtime/codegen changes must now follow a stricter regression rule: do not land a broad ownership/lowering fix first and then discover what it broke through the full suite; add or isolate one exact reproducer first, make the narrowest fix that turns that reproducer green, then widen to neighboring exact tests, and only after that run the broader lock/full-regression lanes
- stdlib workarounds around backend bugs are not acceptable as a resting state when Java-like source should work; if the intended source shape is valid, fix the backend/runtime path and remove the workaround instead of normalizing the detour
- when valid or intended Java-like Pulse source hits an unexpected snag, the default response is to treat it as a potential language/compiler/runtime bug and fix it; do not silently rewrite user code, examples, stdlib code, or tests into a workaround shape unless the user explicitly approves that as a temporary stopgap
- language capability verification rule:
  - before introducing any architectural workaround, first verify whether the requested pattern is already supported by Pulse syntax and semantics
  - if the pattern parses and typechecks, it is valid Pulse source
  - any failure after that point is owned as a backend/runtime/codegen bug, not as justification to reshape the API or architecture
  - do not replace interfaces with abstract classes, introduce alternative designs, or otherwise warp the source shape around missing execution support
  - instead:
    - reduce the issue to a minimal reproducer
    - fix the backend/runtime/codegen path to support the valid construct
    - if there is a real design question about whether the construct should exist at all, stop and ask the user how to proceed before changing the shape
- self-sustained implementation rule:
  - do not leave work in Rust just because it currently looks bootstrap-shaped, host-shaped, or awkward
  - if a helper, subsystem, or support API can be expressed in Pulse, move it into Pulse now and keep it current in both the Rust and Pulse implementations
  - if it cannot yet be expressed in Pulse, first add the missing language/runtime capability that makes it expressible, then move it
  - this rule applies to compiler/runtime/systems work too, including filesystem/process/env access, toolchain invocation surfaces, artifact/publication helpers, and related authoring infrastructure
  - use `authorlib` for privileged or sharp Pulse-owned authoring surfaces; do not treat Rust as the default home for them just because they are not ordinary public-stdlib APIs
- lift-through-surface rule:
  - before lifting a feature, inspect the existing `pulse.*` / `author.*` surface
  - if the needed behavior already exists there, route the lift through that surface instead of rewriting parallel library code
  - if the surface is close but incomplete, extend that existing surface minimally instead of creating a second helper path beside it

## Current Regression Lessons To Carry Forward

The latest green-suite recovery in the active `F1-97` window established a few
rules that the next agent should treat as live project truth, not local trivia:

- package loading/import truth:
  - same-package resolution is demand-driven now
  - referenced package-local sibling classes should resolve without imports
  - unrelated sibling files must not be compiled just because one class in the package was loaded
  - if an old lock depended on eager sibling loading, that lock was stale and should be rewritten or removed
- backend/runtime truth exposed by Pulse-owned surface growth:
  - lazy static object-field getters must allocate/init object statics with a null receiver; otherwise runtime-owned statics such as `System.in/out/err` or `UUID.DEFAULT_RANDOM` will misinitialize or crash
  - same-class constructor calls must only reuse `this` for real constructor delegation inside constructors; other instance-method `new SameClass(...)` sites must allocate a new object
  - backend locks must reflect 64-bit object-handle reality (`test rcx, rcx`, 64-bit constructor returns, 64-bit null guards), not older 32-bit bootstrap assumptions
- stdlib surface truth:
  - `TextCursor` `tryRead*` helpers now follow a non-consuming peek contract; keep that consistent when extending the cursor
  - mutation-reporting contracts matter too: collection helpers like `retainAll()` must report whether they changed state truthfully, not merely perform the right mutation
- regression workflow truth:
  - broad truthful ownership fixes will continue to expose the next hidden dependency layer; this is expected in the self-sustained push
  - classify each failure explicitly:
    - stale lock/fixture drift caused by removing broken bootstrap behavior
    - real language/compiler/backend/runtime/stdlib bug
  - fix the first by correcting the lock to the intended contract
  - fix the second directly instead of preserving the old accidental behavior
- failure-path harness truth:
  - the fixture harness may be hardened for IDE/Windows child-process teardown differences
  - but the expected terminal failure diagnostic itself must remain strict and real
- compiler recursion truth:
  - oversized contract-style authorlib checks are a valid source shape in this project and must compile honestly
  - if a long `&&` / `||` contract expression overflows the Rust stack, treat that as a compiler recursion bug and flatten the compiler visitor/lowering path instead of weakening the Pulse test source

## Required First Response From The Next Agent

Before continuing implementation, the next agent should:

1. read the docs and code listed in this handoff
2. examine the current implementation in detail
3. then give the user a concise review of the programming language and current project state

That review should explicitly answer:

- what PulseCode currently is at a high level
- what implementation language/toolchain it is currently built in
- what the current language baseline already supports end-to-end
- what major parts are still incomplete
- what Phase F is doing now
- exactly where work will resume next on the rebase board
- which `F1` item is the first return point once the rebase board is honestly closed

The purpose of this review is to prove the new agent is caught up before it starts making more changes.

## Non-Negotiable Workflow Rules

These came directly from the user and must be honored.

### 1. Language docs are part of the product

The docs are currently the primary way to learn PulseCode. They are not cleanup work.

All language-facing docs must live under:

- `docs/language/compiler-backed`
- `docs/language/runtime-backed`
- `docs/language/stdlib`

If a doc is about language syntax/semantics/type rules/import rules/modifiers and it is not one stdlib class, it belongs under:

- `docs/language/compiler-backed`

If a doc is about runtime behavior that is not one stdlib class, it belongs under:

- `docs/language/runtime-backed`

If a doc is about a shipped stdlib class, it belongs under:

- `docs/language/stdlib/<package structure>`

### 2. Stdlib `.pulse` files must be PulseDoc'd

Any stdlib `.pulse` file added or modified must have multiline PulseDoc blocks.

The current lock suite already enforces:

- file/type-level PulseDoc
- PulseDoc before public members

Relevant lock file:

- [stage_locks.rs](/D:/Programming/codex/PulseCode/crates/pulsec-cli/tests/stage_locks.rs)

### 3. Run the stdlib docs generator whenever stdlib source changes

If any file under:

- `stdlib/src/pulse/**`

is added or modified, the next agent must run:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/generate-stdlib-docs.ps1
```

Why:

- the generator rewrites the checked-in stdlib reference docs from current PulseDoc
- the generated docs under `docs/language/stdlib/pulse/**` are supposed to stay current
- the generator is intentionally destructive for the generated stdlib subtree and should overwrite on every run

This overwrite contract is already documented and locked in:

- [Stdlib README](/D:/Programming/codex/PulseCode/docs/language/stdlib/README.md)
- [generate-stdlib-docs.ps1](/D:/Programming/codex/PulseCode/scripts/generate-stdlib-docs.ps1)
- [stage_locks.rs](/D:/Programming/codex/PulseCode/crates/pulsec-cli/tests/stage_locks.rs)

### 4. Prefer focused tests, not full `pulsec` test runs

The user explicitly asked not to keep running the full `cargo test -p pulsec` suite after every change.

Preferred pattern:

- run targeted `pulsec-core` tests when touching parser/semantics/IR
- run targeted CLI lock suites when touching docs/contracts/project behavior
- only run broader/full suites when truly necessary

This was the working pattern at the end of this window:

- `cargo test -q -p pulsec-core`
- `cargo test -q -p pulsec --test stage_locks`

### 5. Fix language bugs instead of normalizing workarounds

If expected Pulse source behavior fails, the next agent should assume it may be a real bug in parser/semantics/IR/backend/runtime behavior rather than immediately changing the source into a workaround shape.

Required response pattern:

- reduce the failure to the smallest honest reproducer
- identify the owning layer and prefer fixing that layer over rewriting the source/example/stdlib usage
- add focused regression coverage for the intended source shape and the reduced repro
- only keep a workaround when blocked and only if it is clearly labeled as temporary rather than treated as the new expected pattern

This especially applies to constructor behavior, object initialization flow, overload resolution, field initialization/patching after construction, and other core language semantics where user expectations should generally match the intended Java-like model unless the user has explicitly chosen a different rule.

## Where The Project Actually Is

Phase D is closed.  
Phase E is closed.  
Phase F is active.

The active board is:

- [F1 Task Board](/D:/Programming/codex/PulseCode/docs/F1_TASK_BOARD.md)

The rebase board is now closed, and `F1` has resumed as the active execution lane while `F2` and `F-A` remain continuity boards.

### F1 continuity already locked

The following are already `Done (Locked)` on the board:

- `F1-00` baseline audit
- `F1-01` inventory/gap matrix
- `F1-02` support policy
- `F1-03` dependency graph
- `F1-04`..`F1-08` lexer/token/literal surface
- `F1-09` primitive/literal declaration baseline

### Immediate next work

The current active work item is:

- [F1 Task Board](/D:/Programming/codex/PulseCode/docs/F1_TASK_BOARD.md): `F1-97`
- immediate next slice:
  - do the mid-board reassessment and ownership split first rather than jumping straight into ad hoc compiler-host helpers
  - `F1-97` now owns the explicit `stdlib` vs `authorlib` ownership split for compiler/runtime/systems-facing helper surfaces, with no bootstrap exemption for features that can live in Pulse
  - the first concrete migration map for this work now lives in [F1_97_BOOTSTRAP_OWNERSHIP_MAP.md](/G:/Programming/Rust/PulseCode/docs/F1_97_BOOTSTRAP_OWNERSHIP_MAP.md)
  - the first implementation work under `F1-97` should follow that split and start the Pulse-owned compiler/resource/systems utility foundation without leaking systems-level APIs into ordinary public `stdlib`
  - `F1-97` is now also the first real self-host/self-sustained transition task:
    - by the end of `F1-97`, the Pulse compiler/runtime codebase should exist in Pulse and be compilable by the Rust-built Pulse compiler
    - by the end of `F1-97`, Rust should own no normal compiler/runtime/toolchain product path at all
    - `F1-97` closes only if Pulse owns enough that Rust can be abandoned entirely if desired
    - any Rust still present after `F1-97` is bootstrap contingency only, not part of the claimed ownership state
- `F1-113` is now locked:
  - `pulse.time.Clock` is the real interface contract rather than a mode-switch class
  - `Clock` carries the static factory entrypoints and default convenience methods directly
  - concrete wall-clock implementations exist for system/fixed/offset/tick behavior and implement `Clock` directly without an abstract base layer
  - `pulse.time.Clocks` is retained only as a thin companion holder instead of being the real center of the design
  - runtime wall-clock ingress is isolated behind `Clock` instead of being hardcoded through the value types
  - `Instant` / `LocalDate` / `LocalTime` / `LocalDateTime` expose `now(Clock)` overloads on top of the locked `F1-62` baseline
  - `pulse.time.TimeSource` / `TimeSources` provide the separate monotonic/process-relative elapsed-time abstraction on top of `System.nanoTime()`
  - nano-precision helpers, canonical constants, formatter null contracts, calendar-edge coverage, and panic-on-overflow arithmetic are all in place for the shipped time model
  - overflow behavior is now explicit and panic-based across the hardened time arithmetic/conversion paths
  - negative/pre-epoch correctness is now locked through floor-div/mod-aware conversions and truncation behavior
  - richer formatter breadth and truncation helpers now exist for the shipped canonical forms without implying zones/locales/pattern engines
- `F1-112` is now locked honestly: the deterministic non-secure random/UUID lane covers widened seed ingress, corrected bounded/fractional behavior, unsigned and smaller primitive helper lanes, Gaussian helpers, current-array-model bulk helpers, state-control helpers (`copy()` / `skip(int)`), and a fully Pulse-owned deterministic non-secure `UUID` type with parse/format, equality/hash, version/variant, nil/default helpers, ordering, and deterministic generation
- the remaining later randomness boundary is explicit rather than hidden: secure randomness, OS/runtime entropy ingress, and secure UUID generation are deferred and already tracked in [FB_CARRY_FORWARD_TRACKER.md](/G:/Programming/Rust/PulseCode/docs/FB_CARRY_FORWARD_TRACKER.md)
- keep the newly locked IO/math/random truth stable: `F1-56`, `F1-57`, `F1-58`, `F1-59`, `F1-60`, `F1-61`, `F1-62`, `F1-111`, and `F1-112` should now be treated as fixed groundwork for later util/time/runtime work
- the math/random/time lane remains explicitly widened for self-sustained honesty: `F1-60` / `F1-61` / `F1-62` are the locked practical slices, while `F1-111` / `F1-112` / `F1-113` own the remaining closure instead of leaving that expansion implicit
- the bottom of the `F1` board now also carries an explicit post-`F1` inward-lift audit task in `Workstream N`: `F1-113A` exists to run the full code audit for moving code inward into Pulse for self-sustained lifting once the main F1 implementation lanes are closed
- current reassessment result before starting `F1-97` implementation:
  - no reviewed completed task in the `F1-39`..`F1-63` and `F1-83`..`F1-113` range needs reopening right now
  - the public locked `stdlib` surface in those tasks is acceptable as-is
  - the real missing work is the sharper ownership split and inward move for compiler/runtime/systems helpers, which now belongs to `F1-97` and the later `authorlib` foundation rather than to reopening already-locked public stdlib tasks
  - the task is intentionally larger now than a pure ownership inventory: the point is to leave the project able, if desired, to compile the Pulse compiler/runtime with the Rust-built Pulse compiler rather than only having the ownership split documented

Recently returned and locked:

- `F1-17`
  - declaration-form try-with-resources is now real on top of `AutoCloseable` plus the locked F1 lifecycle model
  - resources close in reverse declaration order and already-open resources still close when a later initializer fails
- `F1-11`
  - the selected compile-time-instantiated, runtime-erased generics baseline is now locked honestly
  - the earlier collection-wide generic return hooks are satisfied by the now-locked `F1-49` and `F1-108`
- `F1-58`
  - the IO payload/encoding policy is now locked honestly: current `File` / `Files` / `InputStream` / `OutputStream` behavior is text-first and line-oriented over `String` payloads
  - explicit byte/charset/binary APIs remain deferred instead of being implied by the current text-backed runtime store
- `F1-59`
  - the selected path/file metadata baseline is now locked honestly on top of the already-shipped `F1-56` implementation
  - `Path` plus `File` / `Files` already cover the required combine/resolve/name/exists/isFile/isDirectory/metadata subset and are fixture-validated
- `F1-60`
  - the locked math slice now includes `abs` / `min` / `max` / `clamp` across `int` / `long` / `float` / `double`, real constants `PI` / `E`, `round`, `floor(float/double)`, `ceil(float/double)`, `signum` across `int` / `long` / `float` / `double`, `sqrt(int/long/float/double)`, selected integer-exponent `pow(int,int)` / `pow(long,int)` / `pow(float,int)` / `pow(double,int)`, `floorDiv` / `floorMod` for `int` / `long`, `copySign(float/double)`, and `toRadians` / `toDegrees` on the real backend lane
  - the old backend shortcut that forced `Math.abs` / `Math.max` through stale int-shaped runtime helpers is removed; overloaded calls now route through the real stdlib methods again
  - public `Math.isNaN(float/double)` and `Math.isInfinite(float/double)` are now real on the executable lane
  - the `%` operator and `%=` compound assignment are now real across parser, semantics, IR, and the Windows executable lane for integral and floating-point operands; `Math.floorDiv` / `Math.floorMod` now use the real operator instead of a workaround
  - current `sqrt`, `pow`, NaN/infinity detection, sign-copy, angle conversion, and floor-arithmetic helpers are honest about the selected F1 contract: non-negative square-root inputs are supported and validated, integral `pow` keeps the exponent story explicit, and these helpers are intended as practical self-host math closure without implying the wider Java math surface is finished
  - fuller self-host numeric helper closure is now tracked explicitly in `F1-111` instead of being left implicit
- `F1-61`
  - the locked random slice now goes beyond seeded `nextInt(bound)` into a practical deterministic subset: default, `int`, and folded-`long` seed construction, `setSeed(...)` on `int` / `long`, `getSeed()`, `reset()`, unbounded `nextInt()`, ranged `nextInt(origin, bound)`, `nextBoolean()`, unbounded `nextLong()`, bounded and ranged `nextLong(...)`, unbounded/bounded/ranged `nextFloat(...)`, unbounded/bounded/ranged `nextDouble(...)`, and bulk deterministic `Array` filling via `nextInts(...)` are now part of the selected executable surface
  - remaining pseudo-random closure such as unsigned variants, broader policy/fidelity decisions, and any final helper breadth remain explicitly tracked in `F1-112` instead of being implied
- `F1-62` (Locked)
  - the active time slice is now materially beyond the original thin millis-only baseline: `Instant` is runtime-backed by real epoch milliseconds, `Duration` is long-millis based with broader unit factories/arithmetic/query helpers plus scalar add/subtract helpers, and the first real date/time facades (`LocalDate`, `LocalTime`, `LocalDateTime`) are now executable with UTC-style epoch projection, richer day/week/month/year and hour/minute/second arithmetic, comparison/query helpers, ordinal-date/day-of-week and second-of-day helpers, weekday/weekend predicates, direct field-rewrite helpers, truncation helpers, practical date+time composition helpers, parsing, and ISO-style text
  - `DateTimeFormatter` now exists as the first explicit formatted date/time helper class instead of leaving all formatting implicit on `toString()`, and it now includes the current basic compact/slash/space-separated format-and-parse helpers in addition to the ISO baseline
- `F1-63`
  - `pulse.util` now exists instead of being only planned, and the first foundational utility slice is real through `Objects`
  - `Objects` now provides null checks, null-safe equality, null-safe hashing, null/default string conversion, and `requireNonNull(...)` guards with semantic, executable, and builtin-import validation
  - `StringTokenizer` is now also real as the first lightweight delimiter-based token stepping helper for pre-`Scanner` parsing flows, including `hasMoreTokens`, `nextToken`, delimiter switching, `remainingText`, and `countTokens`
- `Scanner` is now real to the selected F1 baseline with `String` / `InputStream` sources, delimiter switching, token and line scanning, typed reads across `int` / `long` / `boolean` / `float` / `double`, fallback reads, reset, and explicit lifecycle checks, all semantic+fixture validated on the Windows lane
- `StringJoiner` is now also real as the next util-side text assembly helper, with delimiter/prefix/suffix construction, `add(...)`, `merge(...)`, `setEmptyValue(...)`, `length()`, and `toString()`
- `Optional` is now also real as a Java-like util-side presence/absence helper, with `empty()`, `of(...)`, `ofNullable(...)`, `isPresent()`, `isEmpty()`, `get()`, `orElse(...)`, `orNull()`, and presence-aware `equals(...)`, `hashCode()`, and `toString()`
- `Properties` is now also real as a Java-like util-side string-to-string config bag, with `setProperty(...)`, `getProperty(...)`, fallback `getProperty(..., default)`, `containsKey(...)`, `remove(...)`, `propertyNames()`, `size()`, `isEmpty()`, `clear()`, and `toString()`
- `TextCursor` is now also real as the first shared util-side structured-text parse cursor, with absolute seek/positioning, line/column reporting, `peek(...)`, `read()`, direct in-place `startsWith(...)`, char/string `consumeIf(...)`, char/string `consume(...)`, `skipWhitespace()`, `readUntil(...)`, `readLine()`, `readIdentifier()`, `readDigits()`, practical numeric token scanning through `readNumberToken()`, optional token reads through `tryReadIdentifier(...)` / `tryReadDigits()` / `tryReadNumberToken(...)` / `tryReadQuotedString(...)`, cursor-owned location-aware diagnostics through `locationString()` / `panicHere(...)` / `panicExpected(...)`, `remainingText()`, `isAtEnd()`, mark/reset support, and quoted-string reads with the current basic escape subset for future JSON/XML/TOML/YAML readers
- the post-`Scanner` string hardening pass is now underway: the stable current slice added indexed search (`indexOf` / `lastIndexOf` with start offsets and char overloads), immutable text replacement, offset prefix checks, `repeat(...)`, ASCII case conversion (`toLowerCase`, `toUpperCase`), case-insensitive equality (`equalsIgnoreCase`), content-based `hashCode()`, ASCII whitespace helpers (`isBlank`, `strip`, `stripLeading`, `stripTrailing`), char containment, prefix/suffix removal helpers, left/right padding, array-based literal splitting (`split(char)`, `split(String)`), array-based joining (`String.join(String, String[])`), and char-array/region text helpers (`toCharArray()`, `getChars(...)`, `contentEquals(...)`, `regionMatches(...)`, `copyValueOf(...)`, `valueOf(char[])`, `valueOf(char[], int, int)`) on `String`, while `StringBuilder` gained widened signed/unsigned integral `append(...)` and `appendLine(...)` coverage including `appendLine(CharSequence)` and `appendLine(char[])`, widened `append(...)` support for `CharSequence`, bounded `append(CharSequence, int, int)`, `char[]`, and bounded `append(char[], int, int)`, widened `insert(...)` overloads across string/object/scalar lanes including bounded `insert(int, CharSequence, int, int)`, `char[]`, and bounded `insert(int, char[], int, int)`, `isEmpty()`, `deleteCharAt(...)`, range `replace(...)`, `setCharAt(...)`, immutable `substring(...)`, indexed search, and `reverse()` on top of the earlier append/insert/delete/setLength surface
  - the stable Pulse-owned conversion slice is broader now: `Long.toString(...)`, `Long.parse(...)`, `Integer.parse(...)`, `Char.parse(...)`, `Boolean.parse(...)`, `UInteger.parse(...)`, `UInteger.toString(...)`, `ULong.parse(...)`, and `ULong.toString(...)` are now implemented in Pulse stdlib instead of routing through runtime helpers
  - `Boolean.parse(...)` is now locked to trimmed case-insensitive `true` / `false` only; all other literals still fail deterministically with `Invalid boolean literal`
  - the remaining string/runtime boundary is narrower and more explicit: public `Intrinsics.stringLength(...)` / `Intrinsics.stringConcat(...)` are gone, with `String.length()` / `String.concat(...)` now routing through private `String.runtimeLength(...)` / `String.runtimeConcat(...)`; `String.substring(...)` plus `Class.getSimpleName()` / `getPackageName()` are now Pulse-owned, while `charAt` and single-char string bridging still remain runtime-backed; the final private string representation seam (`runtimeLength`, `runtimeConcat`, `runtimeCharAt`, `runtimeFromChar`) is now recorded in [FB_CARRY_FORWARD_TRACKER.md](/G:/Programming/Rust/PulseCode/docs/FB_CARRY_FORWARD_TRACKER.md) rather than left implicit; wrapper-local string bridges are shrinking too, including `Double` now using the public `String.charAt()` surface instead of carrying its own private string runtime helper
  - string/output behavior is more Java-like now: string `+` lowers symmetrically when either side is `String`, `null` concatenates as `"null"`, and `IO` / `System.out` / `PrintStream` now accept broad object, char-array, signed, floating, boolean, and retained unsigned lanes through `String.valueOf(...)` instead of forcing explicit conversion at call sites
  - user classes now inherit `Object` methods implicitly the Java-like way, `Object.toString()` now defaults to `ClassName@hexHash`, and `Integer.toHexString(...)` is available in Pulse stdlib for identity/debug formatting without falling back to runtime-owned text helpers
  - the selected practical util baseline is now locked rather than implied future work; broader format libraries or later helper breadth can return separately without pretending the current pre-self-sustained subset is still undefined
- `F1-85`
  - the broader post-`Scanner` util subset is now also locked honestly: the selected pre-self-sustained helpers are explicit, useful, and doc/test-backed instead of left as a vague future bucket
  - broader clock/date-time policy, calendar-edge closure, richer formatter breadth, and any remaining non-goal/fidelity decisions remain explicitly owned by `F1-113`

The first expected `F1` return point after rebase closure remains:

- `F1-51` `ArrayList` / `LinkedList` practical helper growth
  - now closed honestly, followed by locked collection continuation through `F1-53`, `F1-52`, `F1-54`, `F1-55`, `F1-108`, `F1-109`, and `F1-110`

Recently locked:

- `RB-06` plan metadata truth surface
  - `build.config.plan.json` and `native.plan.json` now emit explicit `target_adapter` metadata instead of collapsing target truth into one string
  - requested target lane metadata and active host/bootstrap adapter metadata can differ honestly when the requested target contract is ahead of the implemented emitter

- `RB-07` layer split
  - the backend architecture is now locked into `backend/target_neutral`, `backend/host_bootstrap`, and `backend/adapters`
  - new work should treat those as the live ownership layers instead of reading the older blended backend shards as the architecture

- `RB-20` planning spine alignment
  - [REBASE_PLANNING_SPINE_ALIGNMENT.md](/D:/Programming/codex/PulseCode/docs/REBASE_PLANNING_SPINE_ALIGNMENT.md) now locks the closed rebase state and the active `F1-51` return point
  - the handoff, roadmap, and backend contract now tell the same story instead of leaving the live next step implicit

- `RB-21` closure package publication
  - [REBASE_CLOSURE_CHECKLIST.md](/D:/Programming/codex/PulseCode/docs/REBASE_CLOSURE_CHECKLIST.md) and [REBASE_EVIDENCE_INDEX.md](/D:/Programming/codex/PulseCode/docs/REBASE_EVIDENCE_INDEX.md) are now published
  - the requested review has cleared and the rebase is now closed
  - `F1-51` is now the active return point

- `RB-19` Windows x64 scope / freeze policy
  - [WINDOWS_X64_SCOPE_FREEZE_POLICY.md](/D:/Programming/codex/PulseCode/docs/WINDOWS_X64_SCOPE_FREEZE_POLICY.md) now separates retained live Windows x64 adapter scope from frozen Windows-only productization scope
  - `--linker` and `--assembler` are explicitly the only retained Windows-only top-level CLI controls
  - removed packaging/install/signing surface is now locked against re-entry instead of merely being absent
  - Windows toolchain/support docs now state that Windows support evidence does not authorize new Windows-only compiler scope

- `RB-18` rebase validation layering
  - [REBASE_VALIDATION_LAYERING.md](/D:/Programming/codex/PulseCode/docs/REBASE_VALIDATION_LAYERING.md) now maps the live suites into target-neutral, cross-cutting contract, Windows x64 adapter, and PulseOS requested-target homes
  - the current mixed `fixture_projects.rs` ownership is now explicit instead of being left implicit by filename
  - Windows x64 executable/parity proof is now documented as Windows adapter evidence only, not as proxy proof for PulseOS or generic Linux
  - later generic Linux work is now expected to fit the same validation split instead of extending the current Windows lane by inertia

- `RB-17.1` compiler packaging removal
  - [COMPILER_PACKAGING_REMOVAL.md](/D:/Programming/codex/PulseCode/docs/COMPILER_PACKAGING_REMOVAL.md) now records that `pulsec` no longer owns package/install/signing workflows
  - CLI flags and manifest keys for MSI/WiX/SignTool/staging are removed rather than frozen as compatibility
  - the compiler now publishes build artifacts and plan metadata only; downstream tools own installers/packages if desired

- `RB-17` PulseOS executable-loading proof target
  - [PULSEOS_EXECUTABLE_LOADING_PROOF_TARGET.md](/D:/Programming/codex/PulseCode/docs/PULSEOS_EXECUTABLE_LOADING_PROOF_TARGET.md) now defines the first contract-level PulseOS loading proof target
  - `native.plan.json` now emits `requested_target_executable_loading_proof_target` for `pulseos-x64`
  - the requested-target PulseOS lane now has an explicit definition of what must be published and exposed before it can honestly count as executable-loading-capable
  - this remains a proof target only; it does not pretend the PulseOS adapter executes yet

- `RB-16` PulseOS startup/loader/publication contract
  - [PULSEOS_STARTUP_LOADER_PUBLICATION_CONTRACT.md](/D:/Programming/codex/PulseCode/docs/PULSEOS_STARTUP_LOADER_PUBLICATION_CONTRACT.md) now publishes distinct Windows x64 and PulseOS startup/loader contracts
  - `native.plan.json` now emits `startup_loader_contracts` with separate `active_adapter` and `requested_target` blocks
  - the requested-target PulseOS lane now has an honest first-slice `pulseos_start`, `pulseos-loader-entry-v1`, and `bin/<entry> + bin/launch.json` publication contract
  - requested PulseOS `shared` mode is explicit but currently collapses to the same first-slice single-image layout until a later task publishes a real separate runtime-companion lane

- `RB-15` target artifact contract split
  - [TARGET_ARTIFACT_CONTRACT_SPLIT.md](/D:/Programming/codex/PulseCode/docs/TARGET_ARTIFACT_CONTRACT_SPLIT.md) now publishes the retained Windows x64 artifact contract separately from the requested-target PulseOS artifact contract
  - `native.plan.json` now emits `artifact_contracts` with distinct `active_adapter` and `requested_target` blocks
  - the current active adapter artifact contract still names the Windows x64 host/bootstrap publication story, while the PulseOS requested-target contract now stays aligned with the published `RB-16` startup/publication contract instead of leaving publication truth implicit

- `RB-14` runtime ownership rebase
  - [RUNTIME_OWNERSHIP_REBASE.md](/D:/Programming/codex/PulseCode/docs/RUNTIME_OWNERSHIP_REBASE.md) now defines the three-way ownership split between Pulse surface, retained Rust host-bootstrap runtime, and adapter-owned glue
  - `native.plan.json` now emits `runtime_ownership_model` with schema `pulsec.runtime.ownership.rebase.v1`
  - the plan surface now records the retained host-bootstrap runtime schema, active adapter import inventory, and requested-target service-contract publication status together instead of leaving ownership implied by the Windows bootstrap implementation
  - that ownership split now feeds the published `RB-15` artifact split instead of leaving artifact policy implied

- `RB-13` PulseOS runtime-service slice
  - [PULSEOS_RUNTIME_SERVICE_ABI_SLICE.md](/D:/Programming/codex/PulseCode/docs/PULSEOS_RUNTIME_SERVICE_ABI_SLICE.md) now defines the first requested-target PulseOS service boundary for the meeting milestone surface
  - `native.plan.json` now emits `requested_target_runtime_service_abi` with schema `pulsec.pulseos.runtime_service.v1` when the requested target is `pulseos-x64`
  - the published first slice covers console, panic, exit, and minimum path/file/service seam capability IDs without pretending the full PulseOS ABI, startup entry, or publication layout are done
  - that requested-target service contract now feeds the published `RB-14` ownership split instead of remaining a free-floating contract slice

- `RB-12` host bootstrap runtime contract
  - [HOST_BOOTSTRAP_RUNTIME_CONTRACT.md](/D:/Programming/codex/PulseCode/docs/HOST_BOOTSTRAP_RUNTIME_CONTRACT.md) now defines the minimum retained Rust-host bootstrap runtime procedure families required to keep compiler artifact emission and executable validation moving
  - `native.plan.json` now emits `host_bootstrap_runtime` with schema `pulsec.host_bootstrap.runtime.v1`
  - the retained bootstrap runtime contract now resolves adapter-owned service-import exclusions through the adapter seam instead of treating those imports as bootstrap-runtime truth
  - this retained bootstrap seam remains separate from the requested-target PulseOS service contract instead of being treated as PulseOS default truth

- `RB-11` runtime/intrinsics partition
  - [RUNTIME_INTRINSICS_PARTITION.md](/D:/Programming/codex/PulseCode/docs/RUNTIME_INTRINSICS_PARTITION.md) now consumes `WIN-RT-01`, `WIN-RT-02`, `WIN-RT-03`, and `WIN-RT-05` directly from the rebase inventory/classification inputs
  - direct Windows service imports are now tracked separately in `windows_x64_runtime_service_imports()` instead of being treated as part of the portable runtime symbol surface
  - [RUNTIME_INTRINSICS_ABI.md](/D:/Programming/codex/PulseCode/docs/RUNTIME_INTRINSICS_ABI.md) now describes the portable Pulse/runtime bridge first and treats Windows x64 ABI/process/allocator notes as adapter reference rather than cross-target truth
  - [E2_RUNTIME_BOUNDARY_GUIDE.md](/D:/Programming/codex/PulseCode/docs/E2_RUNTIME_BOUNDARY_GUIDE.md) now explicitly frames its startup/import sequence as current Windows x64 shared-mode evidence rather than the portable intrinsic contract

- `RB-10` target-neutral planning boundary
  - [TARGET_NEUTRAL_PLANNING_BOUNDARY.md](/D:/Programming/codex/PulseCode/docs/TARGET_NEUTRAL_PLANNING_BOUNDARY.md) now names `WIN-PLAN-01` and `WIN-PLAN-04` as consumed rows
  - target-neutral plan rendering now resolves backend contract data and fallback link-plan defaults through the adapter registry seam
  - `crates/pulsec-cli/src/backend/analysis/plan_rendering.rs` no longer hard-codes `kernel32.lib`
  - the retained Windows x64 defaults now live under the Windows adapter path instead of target-neutral planning code

- `RB-09` Windows x64 adapter scope
  - [WINDOWS_X64_ADAPTER_SCOPE.md](/D:/Programming/codex/PulseCode/docs/WINDOWS_X64_ADAPTER_SCOPE.md) now defines the retained Windows x64 lane as an immediate target plus the current host/bootstrap adapter
  - [WINDOWS_TOOLCHAIN_MATRIX.md](/D:/Programming/codex/PulseCode/docs/WINDOWS_TOOLCHAIN_MATRIX.md) is now framed as Windows adapter support evidence, not as the whole project support matrix
  - [CLI_COMMAND_CONTRACT.md](/D:/Programming/codex/PulseCode/docs/CLI_COMMAND_CONTRACT.md) and [D_CLI_UX_GUIDE.md](/D:/Programming/codex/PulseCode/docs/D_CLI_UX_GUIDE.md) now explain that `--linker` and `--assembler` are retained Windows adapter overrides rather than target-neutral guarantees
  - the Windows x64 adapter remains the current executable native proof path, but Windows MSI/WiX/signing productization is explicitly fenced away from the core backend architecture

- `RB-08` adapter registry seam
  - [BACKEND_ADAPTER_REGISTRY.md](/D:/Programming/codex/PulseCode/docs/BACKEND_ADAPTER_REGISTRY.md) is now the source of truth for target-adapter selection
  - `backend/host_bootstrap` now resolves emission, linking, and failure-report behavior through `backend/adapters`
  - target-neutral plan rendering now resolves active backend contract and adapter metadata through the same registry seam
  - the current Windows x64 adapter remains the only implemented adapter, but PulseOS and generic Linux requests now route through one explicit host/bootstrap registry boundary instead of scattered helper imports

- `F1-43` wrapper-class depth
  - primitive constant fields are Java-like primitive constants, not wrapper-typed placeholders
  - `Byte` / `Short` / `Char` / `Integer` / `Boolean` / `Long` / `UInteger` / `ULong` now have real compare/helper coverage
  - `Byte.parse`, `Short.parse`, `Char.parse`, `Long.parse`, `UByte.parse`, `UShort.parse`, `UInteger.parse`, and `ULong.parse` are executable
  - `Byte` / `Short` / `Char` / `Integer` / `Boolean` / `Long` / `UInteger` / `ULong` plus the retained small unsigned wrappers have working `toString(...)` coverage through the current string/runtime surface
  - `Float.compare` / `Double.compare` are no longer the old broken `0-or-1` placeholder shape
  - `Float.parse` / `Double.parse` now accept ordinary decimal text, optional signs, fractional parts, exponent text, and `NaN` / `Infinity`
  - `Float.toString` / `Double.toString` now produce practical Java-close decimal/scientific text in stdlib code, and `String.valueOf(float|double)` plus `StringBuilder.append(float|double)` ride that same surface
  - focused proof:
    - `cargo test -q -p pulsec --test fixture_projects cli_build_executes_wrapper_integral_text_and_constants_flow -- --exact`
    - `cargo test -q -p pulsec --test fixture_projects cli_build_executes_wrapper_floating_text_and_compare_flow -- --exact`
- `F1-44` unsigned policy
  - `ubyte` / `ushort` / `uint` / `ulong` plus their wrapper classes are now explicitly locked as retained Pulse extensions
  - Java-close wording must not imply that unsigned primitives/wrappers are part of the Java baseline
  - existing executable coverage for unsigned promotion, comparison, parse, and `toString(...)` remains the proof that the extension surface is real rather than a doc-only claim
- `F1-45` `System` / process baseline
  - `System.out` and `System.err` are both real print streams now
  - `System.currentTimeMillis()` is runtime-backed wall-clock time
  - `System.nanoTime()` is runtime-backed elapsed-time measurement
  - `System.exit(int)` is real process termination
  - property/env/process breadth beyond that slice remains explicitly deferred instead of being implied
- `F1-47` foundational `pulse.lang` types
    - `Runnable`, `Appendable`, and `CharSequence` now exist as real stdlib interfaces
    - `String` now implements `CharSequence` and the current non-generic `Comparable` baseline
    - `StringBuilder` now implements `Appendable` and `CharSequence`
    - `InputStream` and `OutputStream` now implement the current bootstrap `AutoCloseable` seam
    - fat and shared output modes now both pass the foundational interface flow
- `F1-48` collection API inventory and strategy
    - the shipped `pulse.collections` surface is now inventoried explicitly
    - the gap doc now records the raw-object pre-generic self-host bridge, the remaining compatibility seams, and the real `F1-49`..`F1-55` return points
- `F1-49` staged collection strategy before and after generics
    - the current raw-object collection APIs are now the required self-host bridge before generics, and the remaining lane-specific helpers are explicitly compatibility scaffolding rather than the intended end state
    - the generic collection contracts are the intended public direction, with later closure explicitly tied to `F1-50`, `F1-53`, `F1-54`, `F1-55`, `F1-108`, `F1-109`, and `F1-110`
- `F1-50` core collection contract expansion
    - the first coherence slice is in: `isEmpty()` now exists across the current `Collection`, `List`, `Set`, `Map`, `Queue`, and `Deque` baseline
    - the hierarchy slice is now in too: `List`, `Set`, and `Queue` extend `Collection`, and `Deque` extends `Queue`
    - the next coherence slice is in too: `Queue` and `Deque` now expose `size()` / `clear()` plus `peek()` / `peekFirst()` / `peekLast()`
    - the contract family has now pivoted to a raw-object baseline instead of stopping at lane-specific containers: `Collection.add/contains(Object)`, `List.get/set/indexOf(Object)`, `Map.put/get/containsKey(Object)`, and object-facing `Queue` / `Deque` reads are all real
    - `LinkedList` now backs the current `List` / `Queue` / `Deque` surface with one shared object-capable linked sequence instead of separate queue/deque side stores
    - `Map` is now the shared raw-object interface contract and `HashMap` is the current Pulse-owned concrete implementation instead of keeping two parallel concrete facades
    - current concrete-class closure is also moving upward into shared interfaces: `HashSet` and `LinkedList` now compose through the shared `Map` contract instead of owning more raw map-intrinsic state than necessary
    - fat and shared output modes both pass the hierarchy, raw-object collection flow, membership-query, and queue/deque contract fixtures
- `F1-51` practical list helpers
  - this was the first `F1` return point after the rebase board closed
  - `F1-50` is now locked and the practical helper breadth that belonged to `F1-51` is now in place
  - the locked `F1-51` slices now include: Java-like raw-object/indexed `List.remove(...)`, `getFirst()` / `getLast()`, overloaded `List.set` / `contains` / `indexOf` / `lastIndexOf`, indexed `add(...)` across `ArrayList` and `LinkedList`, queue/deque-side `Queue.remove()` / `Queue.element()`, `removeFirstOccurrence(...)` / `removeLastOccurrence(...)`, `offerFirst` / `offerLast`, `pollFirst` / `pollLast`, and stack-style `push(...)` / `pop()`
    - inherited overload resolution is now fixed semantically instead of being papered over in stdlib: child-interface and subclass overloads no longer hide inherited parent overload sets with different parameters
    - the overload-return-type collapse that mis-typed `ints.set(1, 5)` as `String` in IR lowering is fixed; same-name/same-arity overloads now keep the resolved return type instead of collapsing by arity alone
  - `List.add(int)` / `add(String)`, `Set.add(String)`, and `Queue.offer(int)` now return Java-like booleans where applicable instead of needlessly diverging from the raw-object contract
  - important current boundary: `List.get(...)` still needs `getInt` / `getString` compatibility helpers because the current pre-generic model still cannot honestly support return-type-only overloading yet
  - important current runtime boundary: the raw-object bridge is now the self-host-relevant contract, but boxed-primitive traffic through that bridge is still not treated as fully hardened; the soak fixtures were moved back onto string/object payloads so they stress the honest current contract instead of a not-yet-locked boxed-int path
  - 2026-03-21 regression repair:
    - `ArrayList` now owns its own bounds panic surface instead of leaking `LinkedList` panic text
    - `Integer` was restored to the prior placeholder wrapper baseline; the integer compatibility repair was localized to collection/map helper lanes instead of changing the global wrapper runtime model
    - packed object-handle checks in backend `instanceof`/checked-cast paths now preserve the full 64-bit handle instead of truncating to `eax`/`ecx`
  - `pulse.lang.Enum` remains explicitly bootstrap; the fuller enum object model still returns later under `F1-10`
- `F1-53` collection iteration contract
  - `Collection` now extends `pulse.lang.Iterable`
  - the current non-fail-fast object-stream baseline is real across `ArrayList`, `LinkedList`, `HashSet`, and `pulse.collections.Array` once its int/string lane is established
  - `Map` now has an explicit non-fail-fast `keyIterator()` baseline instead of leaving map iteration implicit
  - manual `iterator()` use plus `foreach` over collection objects and `Array` values with `Object` / `var` loop variables are now executable and fixture-validated
  - `F1-53` is now locked; richer map/set view families return in `F1-52` and the later typed/generic iterator story returns in `F1-68`
- `F1-52` map/set practical helper growth
  - `HashMap` now supports raw-object/string removal, `containsValue(...)`, `putAll(...)`, `putIfAbsent(...)`, `replace(...)`, `getOrDefault(...)`, and the later selected view baseline on top of the locked key-iteration baseline
  - `HashSet` now supports raw-object/string removal plus `addAll(...)`, `containsAll(...)`, `removeAll(...)`, and `retainAll(...)` through the shared map-backed bridge / collection baseline
  - the current selected map-view helpers are now split explicitly: `keySet()` / `values()` are live non-fail-fast views, while `entrySet()` stays copy-style rather than pretending to be a full live `Map.Entry` contract
  - `F1-52` is now locked; later typed/generic/final-shape closure still returns under `F1-54`, `F1-55`, `F1-108`, `F1-109`, and `F1-110`
- `F1-54` collection utility families
  - `pulse.util.Arrays` now provides the chosen current array utility baseline: `asList(...)`, fixed-lane `indexOf(...)`, and fixed-lane `contains(...)`
  - `pulse.collections.Collections` now provides the chosen current collection utility baseline: static `addAll(...)`, `frequency(...)`, `reverse(...)`, `singletonList(...)`, and `singleton(...)`
  - the utility surface is intentionally small and explicit; it does not yet claim broader Java utility families such as sorting/shuffling/comparators or live wrapper/view helpers
  - `F1-54` is now locked; the later typed/generic collection direction still returns under `F1-55`, `F1-108`, `F1-109`, and `F1-110`
- `F1-55` collection nullability / ownership / runtime hardening
  - self-bulk mutation paths are now deterministic instead of depending on live mutated iteration state: `ArrayList.addAll(this)`, `LinkedList.addAll(this)`, `HashMap.putAll(this)`, `HashSet.removeAll(this)`, and `HashSet.retainAll(this)` have explicit behavior
  - null-bearing collection/map presence flows are now executable-fixture validated for the current raw-object bridge
  - direct `null` calls at overlapping `Object` / `String` overload sites remain an explicit compile-time ambiguity in the current baseline; use an `Object`-typed local/reference when the raw-object path is intended
  - `F1-55` is now locked; collection completion is now the active execution lane through `F1-108`, `F1-109`, and `F1-110` before returning to the earlier `F1-56` IO resume point
- `F1-108` generic collection public-surface closure
  - generic collection contracts are now the real public F1 surface across `Collection<T>` / `List<T>` / `Set<T>` / `Queue<T>` / `Deque<T>` / `Map<K,V>` and `ArrayList<T>` / `LinkedList<T>` / `HashSet<T>` / `HashMap<K,V>`
  - explicit generic constructor syntax such as `new ArrayList<String>()`, `new LinkedList<String>()`, and `new HashMap<String, Box>()` now works instead of forcing raw construction
  - semantic inheritance/member lookup, assignability, and backend owner/staticness metadata now erase generic owners consistently instead of losing `List<T>` / `Map<K,V>` paths on the executable backend lane
  - the generic `Map` public surface no longer promises overlapping string-return bridge helpers like `get(String)` / `remove(String)` / `put(String, String)`; typed `get` / `put` / `remove` are the real public path, while `putInt` / `getInt` / `getIntOrDefault` remain the explicit primitive compatibility seam
  - `F1-108` is now locked; that closure path is complete through `F1-109`, and the active collection resume point is now `F1-110`
- `F1-109` collection value-kind closure
  - wrapper/reference generic usage is now executable on the real backend lane well beyond the original `Integer` proof: `List<T>` / `Map<K,V>` / `Queue<T>` flows have passing evidence for user classes, `String`, `null`, `Byte`, `Short`, `Integer`, `Long`, `Boolean`, `Char`, `Float`, `Double`, `UByte`, `UShort`, `UInteger`, and `ULong` without routing through `getInt` / `putInt`
  - that means the preferred Java-like direction is now generic collections plus wrapper/reference types, not primitive-specific collection helper methods
  - `putInt` / `getInt` / `getIntOrDefault` and similar seams should be treated as compatibility-only rather than the preferred Java-like public direction
  - the old compatibility-overload collisions are now resolved in favor of the exact wrapper/generic path, so direct `byte` / `short` / `char` / `ubyte` / `ushort` insertion no longer widens into legacy `add(int)` / `offer(int)` helper seams
  - raw-object wrapper/null query and removal flows now have executable evidence across `List`, `Set`, and `Map`
  - `pulse.collections.Array` is now explicitly locked as a runtime-backed fixed-length helper with `int` / `String` lanes plus object-stream iteration from an established lane; it is not the final generic Java-array replacement
  - `F1-109` is now locked
- `F1-110` collection-shape closure
  - `Collections` now has a broader practical helper baseline with `emptyList()`, `emptySet()`, `emptyMap()`, and `singletonMap(...)` on top of the earlier `addAll`, `frequency`, `reverse`, `singletonList`, and `singleton` helpers
  - those helpers are intentionally mutable convenience factories for self-host code, not Java-style immutable wrapper contracts
  - `HashMap.keySet()` / `values()` are now live non-fail-fast map-backed views that reflect mutation through the selected F1 baseline
  - `HashMap.entrySet()` now exists as a copy-style `Set<MapEntry>` baseline through the top-level `pulse.collections.MapEntry` value type; it is intentionally non-live and not a nested `Map.Entry` contract
  - `Collection<T>` now owns the shared removal/bulk contract more honestly: `remove(...)`, `containsAll(...)`, `addAll(...)`, `removeAll(...)`, and `retainAll(...)` work through `Collection`-typed list/set implementations instead of staying artificially class- or set-only
  - `F1-110` is now locked: the selected F1 Java-close collection subset is explicit and executable enough for self-hosting, while broader Java utility/view families such as sorting/shuffling/comparators, immutable wrappers, and a live nested `Map.Entry` contract remain deliberate F1 deferrals
- `F1-56` IO/path expansion
  - `F1-56` is now locked as the pre-self-host IO/path foundation
  - `Files` now supports deterministic presence/deletion with non-empty-directory delete refusal, explicit file creation, parent-directory preparation through `createParentDirectories(...)` / `createFileWithParents(...)`, temp scratch-path creation through `createTempFile(...)` / `createTempDirectory(...)`, emptiness checks through `isEmpty(...)`, last-modified metadata through `lastModified(...)` plus `touch(...)` with append-path metadata updates, recursive cleanup via `deleteRecursive(...)`, recursive subtree duplication/relocation via `copyRecursive(...)` / `moveRecursive(...)` with same-path and copy-into-own-subtree guards, file-vs-directory collision guards for write/copy/move/create-directory flows, direct-child rooted relative listing through `listRelative(...)` / `listRelativeFiles(...)` / `listRelativeDirectories(...)`, rooted relative recursive listing through `listRelativeRecursive(...)` / `listRelativeFilesRecursive(...)` / `listRelativeDirectoriesRecursive(...)`, `readStringOrDefault(...)`, `copy(...)`, `move(...)`, append-on-missing behavior, explicit directory creation, direct-child `list(...)`, recursive `listRecursive(...)`, filtered direct/recursive `listFiles(...)` / `listDirectories(...)` with proper path-boundary filtering instead of raw prefix leakage, `isFile(...)` / `isDirectory(...)`, `size(...)`, and line-oriented `readLines(...)` / `writeLines(...)` / `appendLines(...)`
  - `File` mirrors those all-at-once, metadata, creation, parent-creation/temp helpers, sizing, emptiness checks, mkdir/mkdirs, recursive delete/copy/move, direct-child and recursive rooted relative listing, filtered direct/recursive listing, and line-oriented helpers through `create(...)`, `createWithParents(...)`, `createParentDirectories(...)`, `createTempFile(...)`, `createTempDirectory(...)`, `readAllTextOrDefault(...)`, `delete(...)`, `deleteRecursive(...)`, `copy(...)`, `copyRecursive(...)`, `move(...)`, `moveRecursive(...)`, `isFile(...)`, `isDirectory(...)`, `isEmpty(...)`, `size(...)`, `lastModified(...)`, `touch(...)`, `name(...)`, `parent(...)`, `stem(...)`, `extension(...)`, `mkdir(...)`, `mkdirs(...)`, `list(...)`, `listRelative(...)`, `listFiles(...)`, `listRelativeFiles(...)`, `listFilesRecursive(...)`, `listDirectories(...)`, `listRelativeDirectories(...)`, `listDirectoriesRecursive(...)`, `listRelativeRecursive(...)`, `listRelativeFilesRecursive(...)`, `listRelativeDirectoriesRecursive(...)`, `listRecursive(...)`, `readAllLines(...)`, `writeAllLines(...)`, and `appendLines(...)`
  - `Path` now supports separator normalization plus dot-segment collapse for `.` / `..`, `separator()`, `resolve(...)`, `resolveSibling(...)`, `changeFileName(...)`, `parent(...)`, `fileName(...)`, `stem(...)`, `extension(...)`, `hasExtension(...)`, `changeExtension(...)`, `isAbsolute(...)`, `root(...)`, `relativeTo(...)`, `childPath(...)`, `parts(...)`, `join(...)`, `depth(...)`, `startsWithPath(...)`, `endsWithPath(...)`, and `commonParent(...)`
  - `InputStream` now supports `readAllOrDefault(...)`, `readLines(...)`, explicit stream-state checks, and parser-style cursor control through `position()`, `peek()`, `read()`, `skip(...)`, `rewind(...)`, `seek(...)`, `mark()`, `hasMark()`, `clearMark()`, `resetToMark()`, `readLine()`, `readRemaining()`, `available()`, and `reset()`, while `OutputStream` now supports append-mode/state checks, a real sequential output cursor through `position()`, explicit size/cursor controls through `length()` / `rewind(...)` / `seek(...)` / `reset()` / `truncate()`, cursor-aware `write(...)` behavior instead of whole-file replacement on each call, and line-oriented output that handles null payloads consistently with `Files.writeLines(...)`, plus `writeLine(...)`, `writeLines(...)`, `appendLines(...)`, `clear()`, and `flush()`
  - the remaining IO/resource work now belongs explicitly to `F1-57`, `F1-58`, `F1-104`, `F1-97`, `F1-105`, and later packaging/install/resource tasks rather than staying hidden under `F1-56`

Recent non-board regression work that is now fixed and should not be re-debugged from scratch:

- the `F1-39` / `F1-40` object/reflection-lite work initially regressed shared split/runtime publication
- shared publication and shared profile builds are green again after:
  - moving the split runtime support object out of the `com/pulse/lang/IO.asm` collision path into `obj/runtime/StdlibRuntime.asm`
  - emitting object-class-name literal data in the split runtime object
  - pruning unused blanket runtime `extrn` imports from app/stdlb split objects
  - exporting the actually shared runtime helper procedures needed by app objects
  - publishing the shared runtime DLL/import library canonically in `bin/` beside the shared executable
- `stage_locks_c2` was updated to read `obj/runtime/StdlibRuntime.asm` instead of the old runtime-at-`IO.asm` path

The recently locked context before `F1-41`:

- `F1-29`, `F1-35`, `F1-46`, and `F1-101` are now locked together for the shipped exception slice
  - methods and constructors support `throws`
  - checked exceptions from direct `throw`, method calls, and constructor calls must be caught or declared
  - overriding methods and interface implementations cannot widen checked throws beyond inherited contracts
  - runtime Pulse-throw propagation works across method boundaries
  - matching caller-side `catch` / `finally` blocks execute for propagated throws
  - uncaught Pulse throws print source-aware stack frames in `Class.method(File.pulse:line)` form
  - caller frames preserve the active call-site line
  - internal fallback helpers like `Throwable.panic()` are hidden from the user-facing trace
  - the stdlib throwable hierarchy owns Java-close message/cause/toString behavior, including cause chaining through uncaught output
- `F1-34` and `F1-35` are now locked
  - IR now has explicit handler-frame instructions, pending-exception retrieval, and real throw terminators
  - the runtime now maintains an exception-handler stack for Pulse `throw` values
  - uncaught throws still fall back through `Throwable.panic()`
  - runtime panic paths like null/bounds are still separate from structured throwable propagation
- `F1-37` is now locked
  - runtime/ABI docs are aligned with the shipped F1 surface
  - public intrinsics cover the string/array/collection bridge
  - exception/trace runtime growth is explicitly documented through `pulsec_rt_throw` and `pulsec_rt_traceUpdateTop`
- `F1-38` is now locked
  - the shipped F1 syntax/runtime slice is covered by the existing fat/shared E3 parity suites
  - matched fixture corpus parity, runtime-heavy parity, strict stress parity, and failure-path parity remain the proof surface for the new language/runtime work
- `F1-39` is now locked
  - `Object` now has a real identity baseline in stdlib/runtime
  - `equals(Object)` remains identity-style
  - `hashCode()` is now a stable runtime-backed identity hash
  - `getClass()` now returns honest runtime class identity instead of a hardcoded `"Object"` descriptor
- `F1-40` is now locked
  - `Object.getClass().getName()` now returns fully qualified runtime names such as `app.core.Main`
  - `Class.getSimpleName()` and `Class.getPackageName()` are real through the current reflection-lite runtime metadata surface
- `F1-41` is now locked
  - `String` now has Java-close content equality, `charAt`, `substring`, search helpers, prefix/suffix checks, trim, and `String.valueOf(Object)`
  - `substring` is now Pulse-owned on top of the remaining private string runtime seam; only storage/index primitives like `charAt`, `length`, `concat`, and single-char bridging still depend on runtime helpers
- `F1-42` is now locked
  - `StringBuilder` now supports object/char append plus practical `insert`, `delete`, and `setLength`
  - the only extra runtime bridge needed for this slice was `String.runtimeFromChar(char)`; the rest stays in stdlib code on top of `String`
- memory-management ownership was cleaned up in stdlib
  - [Memory.pulse](/D:/Programming/codex/PulseCode/stdlib/src/pulse/memory/Memory.pulse) now owns the user-facing ARC/cycle/weak surface
  - `pulse.rt.Intrinsics` remains the internal backend bridge for those operations
  - fake/bootstrap intrinsics still remain on `Intrinsics` for now and should not be mislabeled as permanent stdlib ownership
- exception-package ownership still needs a dedicated reorganization pass before self-host
  - this is now tracked explicitly on the F1 board as `F1-106`
  - the current shipped throwable hierarchy still lives under `pulse.lang`
- self-host-ready test authoring/execution is now tracked explicitly too
  - `F1-107` covers the pre-self-host test baseline: `@Test` ownership, assertion helpers, discovery policy, `pulsec test`, output contract, and the minimum product-owned support needed for Pulse-native compiler/runtime tests before self-host
- `F1-46` is now locked
  - `Throwable` now owns message, cause, `getMessage()`, `getCause()`, `initCause(...)`, default formatting, and full uncaught cause-chain rendering
  - `Exception`, `RuntimeException`, and the current shipped runtime exception subclasses now mirror the current Java-close constructor/cause baseline in stdlib: no-arg, message, message+cause, plus late `initCause(...)`
- `F1-19` is now locked
  - assertion failures now terminate through the stdlib-owned `AssertionError` hierarchy with Java-like message formatting
- `F1-23`, `F1-26`, `F1-27`, `F1-28`, `F1-36`, `F1-99`, and `F1-100` are now all locked
  - native arrays now cover the current primitive/reference surface, including multidimensional creation, nested initializers, native subscript syntax, and native-array foreach
  - numeric conversions/promotions/overload applicability are Java-hardened for the shipped F1 slice
  - bitwise/shift operators and local `var` are real
  - arrow-style switch expressions are real; `yield`/block-form switch-expression arms remain fenced
  - lowering/codegen is now locked too for the shipped syntax slice: arrays, foreach, ternary, switch expressions, and bitwise/shift operators all execute in realistic native fixtures
    - `ubyte` / `ushort` arithmetic promotes to `uint`
    - mixed `uint` / `ulong` arithmetic/comparison widens to executable `ulong`
  - the current mixed signed/unsigned numeric slice is now real too:
    - `ubyte` widens into signed targets starting at `short`
    - `ushort` widens into signed targets starting at `int`
    - `uint` widens into signed targets starting at `long`
    - `char` widens into unsigned targets starting at `ushort`
    - mixed signed/unsigned integer expressions now resolve through executable `int` / `long` where the current runtime can carry them honestly
    - mixed signed with `ulong` still requires an explicit cast
  - explicit casts from integral primitives to `float` / `double` now materialize real floating values, and explicit `double` -> `float` casts round through single precision
  - call-site and constructor-side implicit numeric widening now execute through the same runtime-backed coercion path instead of raw register-width reuse
  - varargs applicability is now real too:
    - zero trailing arguments are accepted
    - trailing arguments are packaged into the array-backed varargs parameter at call sites
    - existing arrays can be passed directly to varargs parameters
    - fixed-arity overloads still win over varargs overloads when both are applicable
  - erased generic raw/instantiated compatibility is now real too for assignment and overload applicability in the current erased F1 model
  - `F1-26` and `F1-28` are now locked
  - `F1-96` is now locked too:
    - `interface extends A, B` is real
    - `default`, `static`, and `private` interface methods are real
    - interface inheritance cycles fail deterministically
    - concrete classes are only required to implement abstract interface instance methods
    - inherited default methods dispatch through both interface-typed and class-typed receivers
  - `F1-98` is now locked too:
    - nested member types, local classes, and anonymous classes are explicitly deferred until after self-host
    - parser/docs/tests now fail them with deterministic diagnostics instead of leaving the policy implicit
  - the next work should move to the next unfinished board item instead of revisiting the completed Workstream E, exception, and interface-member hardening slices

Recent runtime fix that closed the active blocker:

- the remaining heap corruption was not actually a wrapper-object field bug
- it reduced to runtime-backed map growth when a collection handle lived in a later slot
- root cause:
  - `emit_map_new_proc` had two bad reads using `dword ptr [rt_map_cap_ptr+r10*4]`
  - those indexed the global pointer variable itself instead of the heap table behind `[rt_map_cap_ptr]`
  - that produced slot-sensitive bogus capacities and heap corruption during later map growth
- fixed in:
  - [runtime_emitters.rs](/D:/Programming/codex/PulseCode/crates/pulsec-cli/src/backend/emission/runtime_emitters.rs)
- validated with:
  - reduced repros under `tmp_runtime_mix_probe/**`
  - `cargo test -q -p pulsec --test fixture_projects cli_build_executes_strict_stress_soak_with_repeated_fat_shared_parity`
  - `cargo test -q -p pulsec --test stage_locks lock_m3_16_stress_soak_fixture_check -- --exact --test-threads=1`
- the temporary `HANDLE_SLOT_INITIAL_CAPACITY = 255` experiment was reverted; it was only a debugging probe, not part of the fix

Recent runtime model hardening after that fix:

- object references now use the same generation-packed handle model as other ARC-managed runtime references
- `pulsec_rt_objectNew` no longer returns a raw slot; it returns `slot | (generation << 32)`
- `pulsec_rt_objectClassId` now decodes and validates packed object handles before reading class metadata
- important split/shared boundary note:
  - app-emitted class ARC edge helpers must stay free of runtime-private table/data references
  - the temporary attempt to validate packed object-reference fields inside those app helpers was reverted
  - they still use the low slot for object edge bookkeeping, while packed-handle validation stays in runtime-private procedures
- fixed in:
  - [runtime_emitters.rs](/D:/Programming/codex/PulseCode/crates/pulsec-cli/src/backend/emission/runtime_emitters.rs)
- focused validation:
  - `cargo test -q -p pulsec --bins --manifest-path "D:\Programming\codex\PulseCode\Cargo.toml"`
  - `cargo test -q -p pulsec --test fixture_projects cli_build_executes_strict_stress_soak_with_repeated_fat_shared_parity --manifest-path "D:\Programming\codex\PulseCode\Cargo.toml"`
  - `cargo test -q -p pulsec --test stage_locks lock_m3_16_stress_soak_fixture_check --manifest-path "D:\Programming\codex\PulseCode\Cargo.toml" -- --exact --test-threads=1`
  - `cargo test -q -p pulsec --test fixture_projects --manifest-path "D:\Programming\codex\PulseCode\Cargo.toml"`
  - `cargo test -q -p pulsec --test stage_locks --manifest-path "D:\Programming\codex\PulseCode\Cargo.toml"`

The following tasks were reopened as explicit bootstrap-to-Pulse return passes:

- `F1-10` enum baseline
  - return in `F1-47` / `F1-69` to complete the std-facing `pulse.lang.Enum` contract
- `F1-11` generics bootstrap
  - return in `F1-49` / `F1-108` for the collection-wide generic story and final F1 closure
- `F1-12` richer annotation syntax/support policy
  - return in `F-A` with `F2` docs updates for Pulse-owned annotation processor migration
- `F1-13` modifier subset/fences
  - return in `F1-20` / `F1-86` / `F1-89` / `F1-93` for real monitor/memory-model/runtime semantics
- `F1-19` `assert`
  - return in `F1-26` / `F1-46` for fuller Java-like assertion typing and error behavior
- `F1-21` ternary
  - return in `F1-26` / `F1-28` for fuller Java-like promotion and compatibility behavior
- `F1-22` casts
  - return in `F1-26` / `F1-28` for fuller Java-like conversion and promotion behavior
- `F1-30` built-in annotation semantics
  - return in `F-A` with `F2` docs updates for Pulse-owned annotation processor migration

This is the next recommended continuation point unless the user redirects.

## Detailed Current Language State

### Frontend/semantic features that are real now

These are not just tokenized. They are implemented and locked to the current F1 baseline:

- package/import/static import support
- classes/interfaces
- annotation declarations via `@interface` (marker-only for now)
- built-in annotation semantics:
  - `@Override`
  - `@NotNull`
  - `@Test`
- `extends`
- `implements`
- constructors
- `this`
- `super`
- control flow already in baseline:
  - `if`
  - `while`
  - `do-while`
  - `for`
  - `switch`
  - `break`
  - `continue`
  - `return`
- `instanceof`
- explicit casts
- char literals
- numeric literal breadth:
  - hex
  - binary
  - octal
  - underscores
  - suffixes
- varargs parameter baseline
- enums:
  - declaration
  - constant uniqueness
  - constant immutability
  - assignment/comparison usage
  - ordinal-backed executable lowering
- compile-time instantiated, runtime-erased generics baseline:
  - class/interface type params
  - method type params
  - generic type-use syntax
  - generic arity validation
  - primitive generic-argument rejection
  - compile-time instantiated member typing
  - simple generic method inference
  - erased runtime lowering to raw owner / native `Object`-shaped storage
- broader flow/nullability analysis:
  - loop conditions now narrow `while` / `for` / `do-while` bodies on direct `== null` / `!= null` local checks
  - foreach loop-local nullability state no longer leaks outward
  - switch branch nullability now merges conservatively after the statement
  - try/catch/finally post-state now merges conservatively, and `finally` assignments are visible afterward
- visibility/inheritance closure for the shipped F1 subset:
  - cross-package subclass protected access now follows the Java-like receiver rule
  - package/private/protected behavior is explicit and tested
  - nested/inner/local/anonymous types remain fenced until later work explicitly changes that policy

### Annotation baseline details

Current shipped annotation behavior:

- `@Override`
  - compiler-owned bootstrap semantics
  - validates actual override contract
- `@NotNull`
  - frontend bootstrap semantic contract
  - currently rejects obvious `null` misuse on supported targets
- `@Test`
  - frontend bootstrap validation for method shape

Annotation declarations in Pulse are now real:

- `public @interface Marker { }`

Current annotation limits:

- marker-style only
- no annotation members/elements yet
- no external/codegen processor system yet
- current built-in semantics are still bootstrap compiler ownership and are expected to be revisited in Phase F-A

Stdlib annotation declarations added:

- [Override.pulse](/D:/Programming/codex/PulseCode/stdlib/src/pulse/lang/Override.pulse)
- [NotNull.pulse](/D:/Programming/codex/PulseCode/stdlib/src/pulse/lang/NotNull.pulse)
- [Test.pulse](/D:/Programming/codex/PulseCode/stdlib/src/pulse/lang/Test.pulse)

### Enum baseline details

Current enum baseline is intentionally narrow and honest:

- enum declarations parse and check
- enum constants are immutable
- enum constants can be assigned/compared
- runtime lowering is ordinal-backed

Not yet promised:

- full Java enum object model
- helper generation like `values()` / `valueOf()`
- enum methods/constructors/advanced behavior

Reference doc:

- [enums.md](/D:/Programming/codex/PulseCode/docs/language/compiler-backed/enums.md)

### Generics baseline details

Current generics contract is intentionally:

- compile-time instantiated with erased runtime

Meaning:

- generics exist on classes/interfaces/methods
- generic type-use syntax is accepted and validated
- `Box<String>.get()` typechecks as `String`
- `Box<String>.set(Object)` is rejected
- simple generic method inference from call arguments is real
- runtime lowering erases `Box<String>` to raw `Box`
- raw/instantiated owner compatibility is still explicitly allowed where chosen

Important limit:

- this is not full Java generics yet
- bounds, wildcards, deeper inference, and collection-wide genericization remain later under `F1-49` / `F1-108`

Reference doc:

- [generics.md](/D:/Programming/codex/PulseCode/docs/language/compiler-backed/generics.md)

## Files Most Relevant To Current F1 Work

### Core frontend

- [pulsec-core lib.rs](/D:/Programming/codex/PulseCode/crates/pulsec-core/src/lib.rs)
  - AST structs
  - lexer
  - `check()`

- [pulsec-core parser.rs](/D:/Programming/codex/PulseCode/crates/pulsec-core/src/parser.rs)
  - declaration parsing
  - annotation parsing
  - enum parsing
  - generic declaration/type-use parsing

- [pulsec-core semantics.rs](/D:/Programming/codex/PulseCode/crates/pulsec-core/src/semantics.rs)
  - class/type index
  - annotation semantics
  - enum semantics
  - generic validation/erasure-aware canonicalization
  - mutability/cast/type rules

- [pulsec-core ir.rs](/D:/Programming/codex/PulseCode/crates/pulsec-core/src/ir.rs)
  - IR lowering
  - enum ordinal lowering
  - erased generic runtime type lowering

- [pulsec-core tests.rs](/D:/Programming/codex/PulseCode/crates/pulsec-core/src/tests.rs)
  - focused parser/semantic/IR unit coverage

### CLI/doc contracts

- [stage_locks.rs](/D:/Programming/codex/PulseCode/crates/pulsec-cli/tests/stage_locks.rs)
  - docs-tree contract
  - stdlib PulseDoc locks
  - stdlib docs generator locks
  - F1 doc/CLI lock tests

## What Was Validated At The End Of This Window

Recent focused/bounded validation that passed before this handoff refresh:

```powershell
cargo test -q -p pulsec-core
cargo test -q -p pulsec --test stage_locks
cargo test -q -p pulsec --test fixture_projects
cargo test -q -p pulsec --test stage_locks_c2
cargo test -q -p pulsec --test phase_d_cli
```

These were the current green checks after the collection/runtime regression repairs that preceded the rebase-board handoff update.

## Current Docs Tree Status

The language docs tree now exists and is active:

- [compiler-backed](/D:/Programming/codex/PulseCode/docs/language/compiler-backed)
- [runtime-backed](/D:/Programming/codex/PulseCode/docs/language/runtime-backed)
- [stdlib](/D:/Programming/codex/PulseCode/docs/language/stdlib)

Compiler-backed docs added/updated during this window:

- [lexer-and-literals.md](/D:/Programming/codex/PulseCode/docs/language/compiler-backed/lexer-and-literals.md)
- [declarations-and-modifiers.md](/D:/Programming/codex/PulseCode/docs/language/compiler-backed/declarations-and-modifiers.md)
- [types-and-conversions.md](/D:/Programming/codex/PulseCode/docs/language/compiler-backed/types-and-conversions.md)
- [packages-and-imports.md](/D:/Programming/codex/PulseCode/docs/language/compiler-backed/packages-and-imports.md)
- [constructors.md](/D:/Programming/codex/PulseCode/docs/language/compiler-backed/constructors.md)
- [annotations.md](/D:/Programming/codex/PulseCode/docs/language/compiler-backed/annotations.md)
- [enums.md](/D:/Programming/codex/PulseCode/docs/language/compiler-backed/enums.md)
- [generics.md](/D:/Programming/codex/PulseCode/docs/language/compiler-backed/generics.md)

Runtime-backed docs already created for current non-stdlib runtime behavior:

- [program-entry-and-execution.md](/D:/Programming/codex/PulseCode/docs/language/runtime-backed/program-entry-and-execution.md)
- [object-lifetime-and-gc.md](/D:/Programming/codex/PulseCode/docs/language/runtime-backed/object-lifetime-and-gc.md)
- [runtime-type-and-null-behavior.md](/D:/Programming/codex/PulseCode/docs/language/runtime-backed/runtime-type-and-null-behavior.md)
- [exceptions-and-failure.md](/D:/Programming/codex/PulseCode/docs/language/runtime-backed/exceptions-and-failure.md)

## Important Scope Policies Already Locked

These policies were explicitly discussed with the user and are reflected in the docs/boards:

- no desktop UI (`awt` / `swing`) in F1
- full reflection is deferred until after self-hosting
- `Class` remains reflection-lite only in F1
- utility/concurrency/networking were made more explicit on the board
- docs are required during implementation, not at the end
- testing/conformance infrastructure must exist before self-hosting

Relevant roadmap lines:

- [Standalone Roadmap](/D:/Programming/codex/PulseCode/docs/STANDALONE_ROADMAP.md)

## Library/Binding Direction Already Chosen

This is not current implementation work, but it was locked as future direction and the next agent should not accidentally revert the plan.

Reference docs:

- [Library Artifact Strategy](/D:/Programming/codex/PulseCode/docs/LIBRARY_ARTIFACT_STRATEGY.md)
- [Standalone Roadmap](/D:/Programming/codex/PulseCode/docs/STANDALONE_ROADMAP.md)

Current future-direction decisions:

- Pulse-authored libraries are intended to compile to native DLLs
- companion binding artifacts will be normal `.pulse` files, not a separate custom extension
- planned modifier direction is `external` as a declaration modifier
- library distro output is intended to be:
  - `build/distro/<profile>/<library>.dll`
  - `build/distro/<profile>/bindings/`
- app/runtime consumption later will use:
  - `libraries/` for DLLs
  - `bindings/` for binding `.pulse` files

This is future Phase F-A work, not current F1 execution.

## Current Resume Point

Resume at:

- [F1 Task Board](/D:/Programming/codex/PulseCode/docs/F1_TASK_BOARD.md)
- `F1-58`
  - current immediate direction:
    - lock the text/binary and encoding policy explicitly on top of the now-locked `F1-56`, `F1-57`, and `F1-104` baselines
    - keep the published runtime behavior honest: current shipped IO is text-first and line-oriented unless broader binary/encoding support is explicitly added
    - treat the published rebase architecture, locked collection closure, locked `F1-56`, locked `F1-57`, and locked `F1-104` as fixed groundwork

First `F1` return point after honest rebase closure:

- [F1 Task Board](/D:/Programming/codex/PulseCode/docs/F1_TASK_BOARD.md)
- `F1-51` `ArrayList` / `LinkedList` practical CRUD/iteration/query helpers
  - now closed honestly as part of the locked collection completion chain that ran through `F1-53`, `F1-52`, `F1-54`, `F1-55`, `F1-108`, `F1-109`, and `F1-110`

Current board state after the latest completed work:

- `F1-14`, `F1-15`, `F1-16`, `F1-21`, `F1-22`, `F1-23`, `F1-26`, `F1-27`, `F1-28`, `F1-29`, `F1-35`, `F1-46`, `F1-99`, `F1-100`, and `F1-101` are now `Done (Locked)`
- `F1-27` now covers the real bitwise/shift family end to end:
  - integral `&`, `|`, `^`
  - unary `~`
  - `<<`, `>>`, `>>>`
  - compound assignment forms `&=`, `|=`, `^=`, `<<=`, `>>=`, `>>>=`
  - boolean bitwise `&`, `|`, `^`
  - lazy logical `&&` / `||` lowering is now separate from bitwise semantics instead of sharing the old eager path
- the non-array compound-assignment lowering path was also corrected so it stores back through the existing backend assignment pattern instead of evaluating the composed value and discarding it
- `F1-100` now covers the real pre-self-host local `var` slice:
  - ordinary local declarations
  - classic `for` initializer locals
  - `foreach (var item : nativeArray)`
  - `foreach (var item : iterable)` on the current `pulse.lang.Iterable` object-stream baseline
  - `foreach (var item : pulse.collections.Array)` on the current object-stream baseline once the array lane is established
  - `var` requires an initializer and cannot infer from `null` or `void`
- `F1-99` now covers the current switch-expression policy:
  - arrow-style switch expressions are real and executable
  - switch-expression arms currently use `case literal -> expression;`
  - a `default` arm is required in the current pre-self-host slice
  - block-form switch-expression arms and `yield` are explicitly fenced rather than implied

Bridge / tooling truths added during the current `F1-97` push:

- test-time bridge bootstrap must stay visible to Cargo/RustRover
- the author build bridge is now prewarmed explicitly and cached at `target/author_build_bridge`
- ordinary resolution should reuse that cache, not silently compile a fresh bridge runner inside a child `pulsec` process
- cache invalidation now keys off shared source inputs rather than the current Rust test executable, so unit/integration binaries can share the cache honestly
- Rust build publication must preserve the distinction between:
  - internal `buildRoot`
  - published `outputRoot`
- manifest/publication regressions exposed two real Pulse-side truth bugs that are now fixed:
  - absent `out_dir` in authorlib manifest parsing must stay `null`, not collapse to project-root
  - `pulse.io.Path` must treat normalized Windows drive paths (`C:/...`) as absolute without breaking the existing slash-child combine contract
- later runtime regressions exposed a real backend ownership bug in MASM lowering:
  - ordinary ARC local stores were over-retaining any call result by default
  - that was wrong for owned call results like `String.valueOf(...)`
  - the fix was to remove the blanket call-result retain and rely on the existing targeted retain paths instead
  - this cleared both the weak-reference runtime lock drift and the `pulse.io.Path` runtime dispatch crash without changing those surfaces
- later bridge regressions exposed a second real backend ownership bug in MASM lowering:
  - ARC-managed alias-like return values were leaving methods as borrowed references instead of owned results
  - this was exposed most clearly by `String.replace(...)` no-op fast paths returning `this`, which then fed stale handles into `BuildInvocationBridge.escape(...)`
  - the fix was to retain ARC-managed alias-like returns before method exit while leaving already-owned call results on the existing path
  - this cleared the authorlib bridge `resolve_build_invocation` regressions without changing `author.build.*` or `pulse.lang.String`
- toolchain ownership moved one real step inward during this push:
  - Pulse now owns toolchain precedence through `author.toolchain.ToolchainConfigResolver`
  - Pulse `BuildInvocation` now carries a real `ToolchainConfig`
  - Rust build execution consumes the resolved toolchain values instead of reapplying overrides after the bridge/fallback resolver returns
- the next smaller toolchain step also landed:
  - Pulse now owns ordered candidate-planning policy for linker selection and adjacent `ml64.exe` discovery through `author.toolchain.ToolchainDiscoveryResolver`
  - Pulse now also owns the Windows host-tool discovery graph through `ToolchainDiscoveryPlan`
  - Pulse now also owns the first real host probe execution slice through `ToolchainDiscoveryResult` and `ToolchainDiscoveryResolver.probeWindowsDiscovery(...)`, using host-backed `pulse.io.Files` instead of leaving the directory walk in Rust
  - Rust still owns the remaining host probing (`PULSEC_LINKER`, Visual Studio linker discovery, path existence)
  - the current Rust execution path is locked to that policy through focused `toolchain_linking.rs` tests
- the next toolchain step after that also landed:
  - Pulse now owns ordered Windows linker command-plan and response-file formatting policy
  - Rust `toolchain_linking.rs` now routes actual arg-vector and response-body construction through mirrored helper functions instead of open-coded inline lists
  - Pulse now also owns the first host response-file materialization path through `ToolchainHostFilesystem.writeResponseFile(...)`
  - Rust `toolchain_linking.rs` now prefers the bridged response-file write path and only falls back to Rust filesystem writes if the bridge is unavailable
  - Pulse now also owns the first real host tool-process execution path through `pulse.process.Processes.execute(...)`, `pulse.process.ProcessResult`, and host-backed `Intrinsics.hostRunShellProcess(...)`
  - Rust `toolchain_linking.rs` now prefers the bridged tool-process execution path and only falls back to Rust `Command` execution for bootstrap/unavailable-bridge cases
  - Rust still owns retry handling and the remaining host-specific probe/existence rules
- bridge bootstrap truths from this follow-up:
  - author build bridge cache locking now records owner metadata and reclaims stale/orphaned `target/author_build_bridge/lock` directories after crashes
  - cold bridge bootstrap must keep a real Rust fallback for Visual Studio / Windows SDK probing; otherwise toolchain discovery recurses back into the bridge before the cached bridge exists
  - the cached bridge should depend on the smallest relevant `author.toolchain` surface, not a monolithic resolver that drags unrelated toolchain code into bootstrap
  - raw/multiline bridge request payloads must escape `\n`, `\r`, and `\\` explicitly; path-only escaping truncates bridge modes that carry response-file or other multiline data
  - the `toolchain-write-response-file` transport can no longer rely on one giant escaped argument-list value; it now sends `responseFilePath + argumentCount + one encoded argument per line`
  - `pulsec_rt_consoleReadLine` can no longer use the legacy fixed 4095-byte stack buffer; it now grows dynamically so large bridge/toolchain request lines survive bootstrap intact
  - toolchain process plans must not rewrite `current_dir` under project-root-relative linker/ML64 paths; temp-root harness builds masked that bug because their output roots were absolute, but normal direct CLI builds hit the broken cwd-relative shape immediately
  - `pulse.process.Processes.renderWindowsCommand(...)` must pass the already-quoted script text directly to `cmd.exe /d /c`; wrapping the entire script as one more quoted shell argument breaks valid Windows command parsing
  - `pulsec_rt_hostRunShellProcess` now carries real bridge/runtime responsibility: it must preserve the incoming working-directory handle until `hostPathAlloc`, allocate a writable raw command-line buffer, invoke `CreateProcessA`, wait, capture the exit code, and free/close all host resources correctly
  - backend call-argument ARC preservation must still treat arc-managed expected parameter types as strong ownership boundaries even when source-side declared-type lookup is weak
  - release backend emission now strips statement/file-line trace payload from `pulse.*` / `author.*` class asm while keeping method-level frames for runtime stack traces; release app/user code still keeps statement/file-line payload so runtime stack traces remain source-truthful there, and debug builds keep the richer payload for asm debugging
  - repeated `instanceof` / checked-cast class-id compare ladders now route through a shared runtime helper (`pulsec_rt_classIdInSet`) plus emitted class-id tables instead of duplicating long inline compare chains at every use site
  - the cached author-build bridge lock now treats transient Windows `PermissionDenied` reads/stats on `target/author_build_bridge/lock` as "lock is owned right now" rather than surfacing random full-workspace failures under concurrent test binaries
  - bridge linker response files are now unique per materialization attempt, and cold bridge prewarm retries transient `main.exe` output locking long enough to survive the current Windows host contention
  - authorlib outward-audit truth after the first inward lifts:
    - the main missed public seam was process/env execution, not filesystem access
    - public filesystem/path IO already exists in `pulse.io.*` (`File`, `Files`, `Path`), and the first public host-filesystem materialization seam is now also real under `pulse.io.HostFiles`
    - that public seam is now real under:
      - `pulse.process.ProcessEnvironmentVariable`
      - `pulse.process.ProcessEnvironment`
      - `pulse.process.ProcessPlan`
      - `pulse.process.ProcessResult`
      - `pulse.process.Processes`
    - `author.toolchain` now crosses into those public surfaces afterward
    - `ToolchainHostFilesystem` is now a wrapper over public host-filesystem surface, not a private first-home for it
    - the rest of the current `author.toolchain` surface still looks properly privileged/tooling-owned:
      - toolchain config precedence
      - candidate/discovery plans and bridge serializers
      - toolchain command planning
      - VS/SDK probing policy
    - the current `author.project.*` and `author.build.*` surface also still looks appropriately privileged at this stage; no equally strong outward-move candidate has shown up there yet
  - build/publication truth after the next publication slice:
  - `author.build.BuildPublicationWriter` now owns artifact stamp writing, shared launch metadata writing, single-file copy, full-tree copy, and recursive copy filtered by extension
  - `author.build.BuildPublicationPlan` / `BuildPublicationPlanBridge` / `BuildPublicationWriter.resolvePublicationPlan(...)` now own publication path/layout planning
  - `author.build.BuildPublicationWriter.ensureLayoutRoots(...)`, `materializeBuildLayout(...)`, and `writeBuildConfigPlan(...)` now also own the normal build-layout staging roots and build-config-plan writing
  - `author.build.BuildSummaryWriter.renderBuildSummary(...)` now owns the normal build result/status summary text that `pulsec build` prints after a successful build
  - `author.build.BuildPublishedArtifact`, `BuildPublishedArtifactBridge`, and `BuildPublicationWriter.publishArtifacts(...)` now own the normal published-artifact result contract and the actual artifact publication execution path
  - `author.build.BuildPublicationWriter.finalizeBuildBridgeText(...)` now owns the normal hot-path post-emit authored build finalization sequence:
    - layout materialization
    - publication-plan resolution
    - artifact publication
    - build-config-plan writing
    - artifact-stamp writing
  - `author.compiler.*` now has its first real live slice through `author.compiler.CheckSummaryWriter`
  - that check slice now also includes `author.compiler.CheckResult`, and `CheckSummaryWriter` now renders the structured authored result instead of separate success/failure tuples
  - `pulsec check` and workspace-check status rendering now prefer that authored compiler surface through the cached bridge
  - `author.compiler.*` now also has a second live slice through `author.compiler.TestSummaryWriter`
  - that test slice now also includes `author.compiler.TestResult`, and `TestSummaryWriter` / `TestDiagnosticWriter` now render structured authored test result state for summary and aggregate-failure text instead of loose tuples
  - that same test slice now also includes `author.compiler.TestDiscoveryResult`, and discovery success/failure/no-tests/workspace-member-no-tests text now routes through that authored model instead of loose path/detail tuples
  - `pulsec test` and workspace-test discovery/summary lines now prefer that authored compiler surface through the cached bridge
  - `author.compiler.*` now also has a third live slice through `author.compiler.TestDiagnosticWriter`
  - `pulsec test` now prefers that authored compiler surface for discovery-failure/no-tests/aggregate-failure message text
  - `author.project.*` now also owns more of the normal `pulsec check` / `pulsec test` path through:
    - `author.project.CheckInvocationBridge`
    - `author.project.TestInvocationBridge`
    - `author.project.ProjectDiscoveryBridge`
  - Rust check/test invocation resolution and test-file discovery now prefer those authored project contracts and only fall back to the older Rust path if the bridge is unavailable
  - `author.compiler.*` now also owns workspace aggregation models through:
    - `author.compiler.WorkspaceCheckResult`
    - `author.compiler.WorkspaceTestResult`
  - `author.compiler.*` now also owns workspace member/test execution outcome models through:
    - `author.compiler.WorkspaceCheckMemberResult`
    - `author.compiler.TestExecutionResult`
    - `author.compiler.TestExecutionWriter`
  - Rust CLI check/test loops now prefer authored rendering for workspace-member check results and single/workspace test pass/fail lines instead of raw inline `[PASS]` / `[FAIL]` formatting
  - workspace check/test start/summary/failure rendering now routes through those authored workspace models instead of raw Rust counters and fixed strings
  - the later authored compiler discovery lift also exposed a bridge-structure truth:
    - the generated cached bridge dispatcher had become too large to trust as one giant `bridge.internal.Main.main()` body
    - compiler render branches now dispatch through helper methods inside the generated bridge source instead of keeping all compiler render paths inline
  - the widened authored project bridge slice exposed one more bootstrap/testing truth:
    - cold bridge prewarm can still fail transiently while another process is finishing the cached bridge build
    - the integration-test prewarm helper now retries `__prewarm-author-build-bridge` instead of treating the first transient cold-build failure as terminal
    - it also now captures transient failed prewarm output instead of leaking cold-build stderr into otherwise passing runs
  - Rust `cli/build/mod.rs` now uses bridge-first author-build copy paths for:
    - published artifact file copies
    - published tree copies
    - filtered `asm` / `obj` staging from backend `obj/`
    - sibling `main.asm` publication
    - Rust `cli/build/mod.rs` now also consumes the Pulse-owned publication plan for:
      - published diagnostic target placement
      - published object/exe/runtime/import-library paths
      - published assets root
      - shared launch metadata path
      - artifact stamp path
      - build config plan path
    - Rust `cli/build/mod.rs` now also uses bridge-first authored layout materialization for build staging roots, emitted object/asm staging, resource copies, and sanity `src_main_pulse` copies
  - Rust `cli/build/mod.rs` now also uses bridge-first authored build-config-plan writing instead of hand-building the JSON body in the hot path
  - Rust `cli/build/mod.rs` now also prefers bridge-first authored build-summary rendering and only falls back to Rust string assembly if the bridge is unavailable
  - Rust `cli/build/mod.rs` now also prefers bridge-first authored artifact publication execution and only falls back to Rust copy/write orchestration if the bridge is unavailable
  - the remaining Rust-owned materialization residue is now the fallback/bootstrap copy recursion, the fallback publication-plan mirror, the fallback config/stamp/layout mirrors, and the broader build sequencing around the still-Rust compiler/backend loop
  - the cached bridge bootstrap also now retries transient split-output file locks (`Startup.obj`, other `obj/` cold-output races) instead of treating them as hard authored-build prewarm failures
  - backend symbol truth after the authored build lift:
    - MASM symbol naming now caps long emitted identifiers deterministically with a stable hash suffix
    - this avoids ML64 `identifier too long` failures as larger authored build/toolchain surfaces come online
  - the first live `author.compiler` bridge slice exposed another real ML64 truth:
    - bridge rebuilds could still hit object string-table corruption under symbol pressure
    - reducing the global MASM identifier cap further in `backend/support/naming.rs` stabilized the bridge rebuild and kept the new compiler summary slice live
  - the later `author.compiler` slices exposed another bootstrap truth:
    - cold bridge prewarm could still fail too eagerly even after the cached bridge executable became usable
    - `prewarm_author_build_bridge_runner()` now retries the ensure path and accepts a now-available cached exe after transient output-lock failures
  - this is a worthwhile Rust-side cleanup to keep bootstrap output honest and inspectable now, but the deeper emitter cleanup still belongs to the future Pulse compiler/runtime backend rewrite:
    - shared helpers for repeated type-test / cast / overload-dispatch ladders
    - deduplication of repeated per-method/per-class MASM scaffolding
    - less whole-program-sensitive inline code baked into individual class asm files

Recommended immediate continuation:

1. Resume `F1` at `F1-51` now that the rebase board is honestly closed.
2. Treat the rebase contracts, validation layering, and Windows scope/freeze policy as fixed architecture while `F1` continues.
3. Keep applying the hard rule: nothing closes as final unless it is Java-hardened enough for the self-host target or is honestly fenced and left `In Progress`.
4. Keep moving any feature surface that can live in Pulse stdlib out of Rust bootstrap ownership.
5. Keep this handoff current by adding new live state and removing stale next-step advice instead of letting it turn into a dump.
- `F1-53` collection iteration contract
  - `Collection` now extends `pulse.lang.Iterable`
  - the current non-fail-fast object-stream baseline is real across `ArrayList`, `LinkedList`, `HashSet`, and `pulse.collections.Array` once its lane is established
  - `Map` now has an explicit non-fail-fast `keyIterator()` baseline instead of leaving map iteration implicit
  - manual `iterator()` use plus `foreach` over collection objects and `Array` values with `Object` / `var` loop variables are now executable and fixture-validated
  - this task is now locked; richer map/set views return in `F1-52` and the later typed/generic iterator story returns in `F1-68`

## Current Interop Direction

Interop is now an active `F1-97` seam.

Selected direction:

- public raw interop lives in `pulse.interop.*`
- the first executable slice covers:
  - dynamic library load/unload
  - symbol lookup
  - raw 0-4 argument native calls
  - structured native pointers
  - owned native byte buffers
  - borrowed byte spans/views
  - owned temporary UTF-8+NUL backing storage
  - byte reads/writes/copies
  - pointer-sized reads/writes
  - explicit-length and NUL-terminated UTF-8 decode
  - explicit borrowed/adopted/manual ownership modes for interop-backed resources
  - ARC-backed native cleanup for adopted `NativeBuffer` / `NativeLibrary` wrappers
- absorbed foreign-backed features should wrap that raw surface behind
  Pulse-native contracts instead of making Rust a privileged reachback path

Reference:

- [INTEROP_STRATEGY.md](/G:/Programming/Rust/PulseCode/docs/INTEROP_STRATEGY.md)
