# Native Backend Contract (Host Bootstrap + Target Adapter Baseline)

This document defines the current backend handoff contract used by `adenc build`, plus the strategic direction change away from a Windows-first backend toward a truthful multi-target target-adapter model.

## Strategic Direction

- Aden Lang remains Rust-hosted above the backend boundary for now
- the current Windows MASM/COFF path is the existing Windows x64 target adapter, current host/bootstrap lane, and regression surface
- the strategic target is no longer "finish the Windows-native product backend first"
- new backend work should separate:
  - target-neutral IR/backend planning
  - host bootstrap execution/adapters
  - target-specific runtime/ABI adapters
- immediate executable support now means Windows x64
- AdenOS remains the next target/runtime contract to define because Windows x64 already has the current bootstrap implementation
- generic Linux is a later target and should fit the same adapter model when activated
- macOS Apple Silicon is also a later canonical target lane and should fit the same adapter model when activated rather than requiring a new public naming scheme

## Active Planning Context

- [REBASE Task Board](/D:/Programming/codex/Aden Lang/docs/REBASE_TAKS_BOARD.md) is the active backend/runtime planning board
- [Rebase Scope and Return-to-F1 Policy](/D:/Programming/codex/Aden Lang/docs/REBASE_SCOPE_AND_RETURN_POLICY.md) is the scope/policy source of truth for why the rebase exists and when `F1` may resume
- [Target Taxonomy and Naming Policy](/D:/Programming/codex/Aden Lang/docs/TARGET_TAXONOMY_AND_NAMING.md) is the source of truth for canonical public target IDs and target-lane naming
- [Backend Layer Architecture](/D:/Programming/codex/Aden Lang/docs/BACKEND_LAYER_ARCHITECTURE.md) is the source of truth for the `RB-07` layer split between target-neutral output, host bootstrap, and adapters
- [Backend Adapter Registry](/D:/Programming/codex/Aden Lang/docs/BACKEND_ADAPTER_REGISTRY.md) is the source of truth for the `RB-08` registry seam that selects active adapter behavior
- [Windows x64 Adapter Scope](/D:/Programming/codex/Aden Lang/docs/WINDOWS_X64_ADAPTER_SCOPE.md) is the source of truth for the `RB-09` scope of the retained Windows x64 host/bootstrap lane
- [Target-Neutral Planning Boundary](/D:/Programming/codex/Aden Lang/docs/TARGET_NEUTRAL_PLANNING_BOUNDARY.md) is the source of truth for the `RB-10` rule that target-neutral planning must resolve adapter-owned defaults through the registry seam
- [Runtime Intrinsics Partition](/D:/Programming/codex/Aden Lang/docs/RUNTIME_INTRINSICS_PARTITION.md) is the source of truth for the `RB-11` split between portable Aden/runtime ABI surface and adapter-owned service glue
- [Host Bootstrap Runtime Contract](/D:/Programming/codex/Aden Lang/docs/HOST_BOOTSTRAP_RUNTIME_CONTRACT.md) is the source of truth for the `RB-12` minimum retained Rust-host bootstrap runtime/service seam
- [AdenOS Runtime Service ABI Slice](/D:/Programming/codex/Aden Lang/docs/PULSEOS_RUNTIME_SERVICE_ABI_SLICE.md) is the source of truth for the `RB-13` requested-target AdenOS runtime-service slice
- [Runtime Ownership Rebase](/D:/Programming/codex/Aden Lang/docs/RUNTIME_OWNERSHIP_REBASE.md) is the source of truth for the `RB-14` three-way ownership split between Aden surface, retained Rust bootstrap runtime, and adapter-owned glue
- [Target Artifact Contract Split](/D:/Programming/codex/Aden Lang/docs/TARGET_ARTIFACT_CONTRACT_SPLIT.md) is the source of truth for the `RB-15` separation between the retained Windows x64 artifact contract and the requested-target AdenOS artifact contract
- [AdenOS Startup, Loader, and Publication Contract](/D:/Programming/codex/Aden Lang/docs/PULSEOS_STARTUP_LOADER_PUBLICATION_CONTRACT.md) is the source of truth for the `RB-16` requested-target AdenOS startup/publication contract and the explicit Windows x64 vs AdenOS startup-loader split
- [AdenOS Executable-Loading Proof Target](/D:/Programming/codex/Aden Lang/docs/PULSEOS_EXECUTABLE_LOADING_PROOF_TARGET.md) is the source of truth for the `RB-17` contract-level definition of what counts as a AdenOS-targetable executable-loading proof target
- [PULSEOS_LINUX_BACKED_TARGET_DIRECTION.md](/D:/Programming/codex/Aden Lang/docs/PULSEOS_LINUX_BACKED_TARGET_DIRECTION.md) now records the AdenOS target-direction decision and the rule that AdenOS remains independent from generic Linux
- [Compiler Packaging Removal](/D:/Programming/codex/Aden Lang/docs/COMPILER_PACKAGING_REMOVAL.md) is the source of truth for `RB-17.1` and the rule that `adenc` publishes build artifacts rather than installers/packages
- [Rebase Validation Layering](/D:/Programming/codex/Aden Lang/docs/REBASE_VALIDATION_LAYERING.md) is the source of truth for `RB-18` and the split between target-neutral, Windows x64 adapter, and requested-target contract validation homes
- [Windows x64 Scope / Freeze Policy](/D:/Programming/codex/Aden Lang/docs/WINDOWS_X64_SCOPE_FREEZE_POLICY.md) is the source of truth for `RB-19` and the rules that keep retained Windows x64 support separate from frozen Windows-only productization scope
- [Rebase Planning Spine Alignment](/D:/Programming/codex/Aden Lang/docs/REBASE_PLANNING_SPINE_ALIGNMENT.md) is the source of truth for `RB-20` and the rule that the live planning spine now points back to `F1-51` after the rebase closes
- [Rebase Closure Checklist](/D:/Programming/codex/Aden Lang/docs/REBASE_CLOSURE_CHECKLIST.md) and [Rebase Evidence Index](/D:/Programming/codex/Aden Lang/docs/REBASE_EVIDENCE_INDEX.md) are the published `RB-21` closure package
- [F1 Task Board](/D:/Programming/codex/Aden Lang/docs/F1_TASK_BOARD.md) is now the active post-rebase language/stdlib execution board at `F1-51`
- this contract should stay aligned with the closed rebase lane, especially `RB-03`, `RB-06`, `RB-07`, `RB-08`, `RB-11`, `RB-12`, `RB-13`, `RB-15`, `RB-16`, `RB-17`, `RB-17.1`, `RB-18`, `RB-19`, `RB-20`, and `RB-21`

## Canonical Target IDs (`RB-03`)

The canonical public target IDs are now:

- `windows-x64`
- `adenos-x64`
- `linux-x64`
- `macos-arm64`

The naming rule is intentionally:

- `<os>-<arch>`

Toolchain, object format, artifact family, and runtime ABI family should remain separate metadata rather than being encoded into the public target ID. Compiler-owned packaging mode is removed from the public surface under `RB-17.1`.

Current public target-surface status:

- CLI, manifest, and scaffold surfaces now use the canonical public target IDs directly
- `native-x64` is retired from the public target surface and kept only as historical context in rebase docs/tests

## Plan Artifact

`adenc build` currently emits:
- `build/adenc.ir.txt`
- `build/native.plan.json`
- `build/main.obj`
- `build/native.link.txt`
- `build/main.exe` (only when native link succeeds)

`native.plan.json` uses schema:
- `adenc.native.plan.v1`

Both `build.config.plan.json` and `native.plan.json` now also emit a `target_adapter` block that makes the adapter story explicit instead of collapsing it into one `target` string.

## Plan Adapter Metadata (`RB-06`)

The emitted `target_adapter` metadata now names:

- the requested public target ID and lane metadata
- the active emission adapter that actually owns the current artifact/runtime contract
- the resolution state when requested target and active adapter do not match yet
- the active artifact family
- the active runtime ABI family

Current truthful behavior:

- selecting `windows-x64` produces matching requested and active adapter metadata
- selecting `adenos-x64`, `linux-x64`, or `macos-arm64` still records those lanes as the requested target contract, but the active emission adapter remains `windows-x64-host-bootstrap` until the later adapter-boundary tasks land
- the current fallback resolution string is `selected-target-not-yet-implemented-using-windows-host-bootstrap`

That explicit mismatch is intentional. It tells the truth about today’s backend instead of pretending the selected non-Windows target already has a real emitter underneath it.

## Target Contract (Current Bootstrap Baseline)

- target triple: `x86_64-pc-windows-msvc`
- object format: `coff`
- entry symbol: `main`
- calling convention: `system`

This is the current bootstrap adapter contract, not the final strategic contract.

## Runtime Symbol Baseline

Current required runtime symbol list in plan:
- `com.aden.lang.IO.println`
- `com.aden.lang.IO.print`
- `com.aden.io.Console.writeLine`
- `com.aden.io.File.readAllText`
- `com.aden.math.Math.abs`

These are planning-level dependencies for native codegen and will be expanded as runtime and backend mature.

## Purpose

The plan artifact is deterministic backend input metadata. It allows:
- reproducible backend snapshots,
- backend prototyping independent of frontend parse/semantic phases,
- incremental replacement of no-op emitter with real object/exe emission.

## Adapter Direction

The backend should now be treated as a target-adapter system rather than one fixed Windows-native pipeline.

Required logical layers:

- target-neutral compiler output:
  - `adenc.ir.txt`
  - `native.plan.json`
- host bootstrap adapter:
  - enough execution or artifact generation to validate the language on the development host
- target adapter:
  - target object/artifact format
  - startup/entry ABI
  - runtime import/service surface
  - loader/publication contract

The Windows COFF pipeline is the current Windows x64 adapter and host/bootstrap execution path. AdenOS is the next platform contract that must be made explicit. Generic Linux and macOS are later adapter lanes that must fit the same adapter boundary without forcing another architecture rewrite.

## Layer Ownership (`RB-07`)

The backend code tree now treats these as the architectural ownership layers:

- target-neutral compiler output:
  - `crates/adenc-cli/src/backend/target_neutral/mod.rs`
- Rust-host bootstrap layer:
  - `crates/adenc-cli/src/backend/host_bootstrap/mod.rs`
  - current host runner type: `RustHostBootstrapBackend`
- target-specific adapters:
  - `crates/adenc-cli/src/backend/adapters/mod.rs`
  - current implemented adapter: `crates/adenc-cli/src/backend/adapters/windows_x64/mod.rs`

The older directories `backend/analysis`, `backend/emission`, and `backend/support` remain implementation shards, but they are no longer the architectural layer names that new work should target.

## Adapter Registry (`RB-08`)

The explicit adapter registry seam now lives at:

- `crates/adenc-cli/src/backend/adapters/mod.rs`

The sanctioned registry entrypoints are:

- `TargetAdapter`
- `resolve_host_bootstrap_target_adapter(...)`
- `resolve_active_backend_contract(...)`
- `resolve_plan_target_adapter_metadata(...)`

Current boundary rules:

- `backend/host_bootstrap` must select target-specific emission, link, and failure-report behavior through the registry seam
- target-neutral plan rendering must resolve active backend contract and adapter metadata through the registry seam
- `backend/analysis`, `backend/emission`, and `backend/support` may still contain implementation shards, but they should not be imported as ad-hoc target-selection paths from host bootstrap or target-neutral layers

Current truthful state:

- the only implemented adapter remains `crates/adenc-cli/src/backend/adapters/windows_x64/mod.rs`
- `windows-x64` resolves to that adapter directly
- `adenos-x64`, `linux-x64`, and `macos-arm64` still preserve their requested public target lanes in plan metadata, but the active host/bootstrap adapter resolved underneath them remains the current Windows x64 adapter until later adapter tasks land
- future AdenOS, Linux, and macOS work must resolve through the same registry seam instead of widening the Windows adapter

## Windows x64 Adapter Scope (`RB-09`)

The current Windows x64 adapter should now be read as:

- an immediate real target lane
- the current host/bootstrap adapter lane
- the current regression and support surface for native executable proof

It should not be read as:

- the definition of the whole backend architecture
- the strategic destination for multi-target Aden Lang
- the owner of Windows MSI/WiX/signing productization policy

Retained Windows x64 adapter-owned controls and support details include:

- `--linker`
- `--assembler`
- `ml64.exe` discovery
- `link.exe` / `lld-link.exe` discovery and invocation
- `kernel32.lib` discovery
- current PE/COFF artifact family naming

Windows-only installer/signing/productization scope is removed from compiler ownership under `RB-17.1` and frozen against re-entry under `RB-19`.

## Windows Scope / Freeze Policy (`RB-19`)

The retained Windows x64 lane now has an explicit freeze policy instead of relying on an implied “just don’t overgrow it” rule.

Source of truth:

- [WINDOWS_X64_SCOPE_FREEZE_POLICY.md](/D:/Programming/codex/Aden Lang/docs/WINDOWS_X64_SCOPE_FREEZE_POLICY.md)

Current locked rule:

- Windows x64 remains a real immediate target and current host/bootstrap lane
- adapter-scoped toolchain controls such as `--linker` and `--assembler` remain valid
- removed packaging/install/signing scope must not re-enter `adenc`
- Windows support evidence must not be used as license to add more Windows-only compiler surface

Current truthful state:

- the retained live Windows x64 scope is toolchain discovery, artifact/link correctness, adapter validation, and support evidence
- the frozen Windows-only scope is installer/signing/productization behavior and related public compiler surface
- downstream tools may package Windows outputs, but `adenc` itself stays focused on build artifacts and adapter contracts

## Target-Neutral Planning Boundary (`RB-10`)

Target-neutral planning now resolves adapter-owned defaults through the registry seam instead of embedding Windows planning assumptions locally.

Current locked rule:

- backend contract data used by plan rendering must come from the active adapter
- fallback link-plan defaults used by plan rendering must come from the active adapter

This means target-neutral planning source should no longer hard-code:

- `x86_64-pc-windows-msvc`
- `coff`
- Win64 calling convention assumptions as a global default contract
- `kernel32.lib` as a target-neutral system input

Those retained Windows values now live behind the Windows x64 adapter path instead.

## Runtime Intrinsics Partition (`RB-11`)

Portable Aden/runtime bridge symbols and adapter-owned OS/service imports are now treated as different contract layers.

Source of truth:

- [RUNTIME_INTRINSICS_PARTITION.md](/D:/Programming/codex/Aden Lang/docs/RUNTIME_INTRINSICS_PARTITION.md)

Current locked rule:

- portable runtime ABI names belong to the language/runtime contract and must survive adapter expansion
- raw OS imports and service hooks belong to the active target adapter, not the portable runtime ABI
- `RB-11` partitions the current surface; `RB-12` and `RB-13` still define the retained bootstrap runtime contract and the first AdenOS runtime-service slice

Current truthful state:

- `windows_x64_backend_contract().runtime_symbols` still names Aden/runtime bridge symbols rather than Windows procedure imports
- the retained Windows x64 service-import inventory is tracked separately in `windows_x64_runtime_service_imports()`
- [RUNTIME_INTRINSICS_ABI.md](/D:/Programming/codex/Aden Lang/docs/RUNTIME_INTRINSICS_ABI.md) now presents Windows x64 ABI notes as current adapter reference, not as the portable cross-target baseline

## Host Bootstrap Runtime Contract (`RB-12`)

The retained Rust-host bootstrap runtime surface is now explicit instead of being implied by whatever the current Windows adapter happens to emit.

Source of truth:

- [HOST_BOOTSTRAP_RUNTIME_CONTRACT.md](/D:/Programming/codex/Aden Lang/docs/HOST_BOOTSTRAP_RUNTIME_CONTRACT.md)

Current locked rule:

- the host bootstrap layer keeps only the minimum retained portable runtime procedure families needed to preserve current compiler artifact emission and executable validation
- raw OS/service imports remain adapter-owned exclusions, not host-bootstrap runtime truth
- `native.plan.json` now emits `host_bootstrap_runtime` with schema `adenc.host_bootstrap.runtime.v1`

Current truthful state:

- the retained host bootstrap runtime families are lifecycle, core object/string/class bridge, trace/exception support, and the currently required stdlib/runtime bridge procedures
- adapter-owned exclusions still include raw Windows service imports, startup entry naming, system inputs, and artifact publication mechanics
- this is still a temporary retained bootstrap seam; later tasks may shrink or move it, but they must do so explicitly

## AdenOS Runtime Service ABI Slice (`RB-13`)

The first requested-target AdenOS service contract is now explicit instead of being implied by a future adapter implementation.

Source of truth:

- [PULSEOS_RUNTIME_SERVICE_ABI_SLICE.md](/D:/Programming/codex/Aden Lang/docs/PULSEOS_RUNTIME_SERVICE_ABI_SLICE.md)

Current locked rule:

- `native.plan.json` now emits `requested_target_runtime_service_abi` for `adenos-x64` with schema `adenc.adenos.runtime_service.v1`
- the published first slice freezes console, panic, and exit capabilities plus minimum path/file/service seams
- the published first slice does not inherit Windows host-bootstrap imports, startup naming, or system link inputs as AdenOS defaults
- the published first slice should now be read as AdenOS-visible platform semantics, not as proof that the adapter executes yet

Current truthful state:

- the current first-slice capability IDs are contract-level names such as `adenos.console.write_utf8`, `adenos.panic.abort_utf8`, and `adenos.process.exit_i32`
- path/file/service seams are explicit enough to guide later adapter work, but they still leave Linux-substrate binding details, payload binary layout, startup entry, and publication layout deferred
- `adenos-x64` still resolves through the current Windows host/bootstrap adapter for real emission today; the new service contract is requested-target truth, not a fake claim that the adapter already exists

## Runtime Ownership Rebase (`RB-14`)

The runtime ownership split is now explicit instead of being inferred from the current Windows bootstrap implementation.

Source of truth:

- [RUNTIME_OWNERSHIP_REBASE.md](/D:/Programming/codex/Aden Lang/docs/RUNTIME_OWNERSHIP_REBASE.md)

Current locked rule:

- `native.plan.json` now emits `runtime_ownership_model` with schema `adenc.runtime.ownership.rebase.v1`
- Aden stdlib/runtime code owns the public language-facing surface unless a capability genuinely belongs in bootstrap runtime or adapter glue
- retained Rust host-bootstrap runtime code owns the current runtime-private implementation/state families and the minimum retained runtime procedure surface
- target adapters own startup, raw service imports/capabilities, system link inputs, loader handoff, and publication shape

Current truthful state:

- the current plan block records the Aden-owned namespace families, retained host-bootstrap runtime/state families, and active adapter-owned import/glue categories together
- the current active adapter-owned import inventory still comes from the Windows x64 bootstrap lane
- the requested-target AdenOS service contract remains adapter-owned implementation territory; it is not reclassified as host-bootstrap runtime ownership just because the implementation is still pending

## Target Artifact Contract Split (`RB-15`)

The artifact contract split is now explicit instead of being inferred from the current Windows publication topology.

Source of truth:

- [TARGET_ARTIFACT_CONTRACT_SPLIT.md](/D:/Programming/codex/Aden Lang/docs/TARGET_ARTIFACT_CONTRACT_SPLIT.md)

Current locked rule:

- `native.plan.json` now emits `artifact_contracts` with distinct `active_adapter` and `requested_target` blocks
- the retained Windows x64 adapter artifact contract uses schema `adenc.windows_x64.artifact_contract.v1`
- the requested-target AdenOS artifact contract uses schema `adenc.adenos.artifact_contract.v1`
- AdenOS artifact expectations are explicit without borrowing Windows PE/COFF publication shape as default truth
- AdenOS should now be read as its own platform artifact lane with contract work kept separate from current Windows artifact truth

Current truthful state:

- the active adapter artifact contract still names the retained Windows x64 host/bootstrap publication story
- when the requested target is `adenos-x64`, the requested-target artifact contract stays separate from the active Windows publication story and now feeds the published `RB-16` startup/loader contract instead of keeping publication truth implicit
- this task separates artifact families and publication ownership; the executable startup entry and loader/publication mechanics are now published in `RB-16`

## AdenOS Startup, Loader, and Publication Contract (`RB-16`)

The startup/loader split is now explicit instead of being inferred from the current Windows startup object and launch metadata path.

Source of truth:

- [PULSEOS_STARTUP_LOADER_PUBLICATION_CONTRACT.md](/D:/Programming/codex/Aden Lang/docs/PULSEOS_STARTUP_LOADER_PUBLICATION_CONTRACT.md)

Current locked rule:

- `native.plan.json` now emits `startup_loader_contracts` with distinct `active_adapter` and `requested_target` blocks
- the retained Windows x64 startup/loader contract uses schema `adenc.windows_x64.startup_loader_contract.v1`
- the requested-target AdenOS startup/loader contract uses schema `adenc.adenos.startup_loader_contract.v1`
- AdenOS startup and publication truth are explicit without borrowing `mainCRTStartup`, PE loader entry, or `launch.txt` lookup policy as default truth
- this should now be read as a AdenOS platform startup contract rather than as Windows bootstrap behavior projected onto another target

## Boundary Preservation Rule

While Windows x64 remains the active execution lane, new work must preserve:

- target-neutral compiler/backend planning above the adapter seam
- explicit requested-target metadata for non-Windows targets
- adapter-local ownership of toolchain, startup, loader, runtime-service, and artifact specifics

Current Windows progress is valid only if it keeps Linux, macOS, and AdenOS integration possible through those seams later.

Current truthful state:

- the active adapter startup/loader contract still names the retained Windows x64 bootstrap sequence `mainCRTStartup -> adenc_rt_init -> app_entry -> adenc_rt_shutdown -> ExitProcess`
- the requested-target AdenOS contract now publishes startup entry `adenos_start`, startup ABI family `adenos-loader-entry-v1`, loader handoff kind `opaque-startup-context-handle`, and a first-slice publication layout at `bin/<entry> + bin/launch.json`
- requested AdenOS `shared` mode is explicit but currently collapses to the same first-slice single-image publication lane until a later task publishes a separate runtime-companion topology

## AdenOS Executable-Loading Proof Target (`RB-17`)

The first requested-target AdenOS loading proof target is now explicit instead of being implied by a pile of separate startup, artifact, and runtime-service docs.

Source of truth:

- [PULSEOS_EXECUTABLE_LOADING_PROOF_TARGET.md](/D:/Programming/codex/Aden Lang/docs/PULSEOS_EXECUTABLE_LOADING_PROOF_TARGET.md)

Current locked rule:

- `native.plan.json` now emits `requested_target_executable_loading_proof_target` for `adenos-x64`
- the published proof target uses schema `adenc.adenos.loading_proof_target.v1`
- the proof target locks the required artifact publication points, startup entry, loader manifest path, loader capabilities, and bootstrap sequence needed for a future AdenOS adapter/loader pair to count as executable-loading-capable

Current truthful state:

- this is still a contract-level proof target only; the implementation status remains `proof-contract-defined-execution-deferred`
- the proof target currently ties together the published AdenOS artifact contract, startup/loader contract, and runtime-service contract instead of letting one of those surfaces drift independently
- non-AdenOS requested targets currently emit `null` for this proof target instead of pretending every target lane already has the same loading definition

## Validation Layering (`RB-18`)

The validation split is now explicit instead of being inferred from legacy test filenames.

Source of truth:

- [REBASE_VALIDATION_LAYERING.md](/D:/Programming/codex/Aden Lang/docs/REBASE_VALIDATION_LAYERING.md)

Current locked rule:

- target-neutral CLI/manifest/project/language behavior does not count Windows x64 adapter evidence as proof of every target
- Windows x64 adapter execution/parity/codegen/runtime tests stay in explicit adapter-owned homes
- requested-target AdenOS plan/contract proof stays explicit without being misread as AdenOS executable proof
- later generic Linux work must fit the same validation split instead of extending the Windows lane as the hidden default, and AdenOS follow-on execution work should be able to reuse shared Linux-substrate validation where honest

Current truthful state:

- `crates/adenc-cli/tests/stage_locks_d.rs` and `crates/adenc-cli/tests/phase_d_cli.rs` now serve as target-neutral surface homes
- `crates/adenc-cli/src/backend/tests/mod.rs`, `crates/adenc-cli/tests/stage_locks_c2.rs`, `crates/adenc-cli/tests/stage_locks_c3.rs`, and `crates/adenc-cli/tests/e3_parity.rs` remain Windows x64 adapter evidence homes
- `crates/adenc-cli/tests/stage_locks.rs` remains the cross-cutting doc/board/handoff lock spine
- `crates/adenc-cli/tests/fixture_projects.rs` remains intentionally mixed for now, but the target-neutral corpus versus Windows x64 adapter overlay is now documented explicitly instead of being left implicit

## Link/Exe Baseline

- First preference: invoke `link.exe` or `lld-link.exe` to link `main.obj` into `main.exe`
- On backend or linker failure, do not emit a fake runnable executable
- Always emit `build/native.link.txt` with deterministic failure evidence:
  - `status=linked` on success
  - `status=backend-failed` when code generation cannot produce a valid native object graph
  - `status=not-linked` when linking fails after valid object emission
- `native.link.txt` includes `entry_codegen` so the active codegen path is preserved in both success and failure reports

## Runtime Bridge Spike (Current Bootstrap Adapter)

- Added initial console bridge for entry methods that match `IO.println(<literal>)`
- Backend emits MASM source/object (`ml64`) and links with `kernel32.lib` to call `GetStdHandle` + `WriteFile`
- This is a narrow milestone spike for visible native behavior; general call/member/runtime lowering remains in progress
- Current baseline routes user calls through a generated stdlib symbol path in native output:
  - user code calls `com.aden.lang.IO.println`
  - backend emits `adenc_com_aden_lang_IO_println__String` and links user methods against it (`entry_codegen=masm-full-stdlib`)

This bridge remains a valid Windows x64 bootstrap/target path, but it should not drive new product assumptions for the whole multi-target architecture.
