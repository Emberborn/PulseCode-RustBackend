# PulseCode Detailed Standalone Roadmap

## Goal
Ship PulseCode as a standalone language ecosystem that can:
1. act as a Rust-hosted bootstrap compiler for the Pulse language
2. finish the language/stdlib/runtime surface needed for self-sustained-hosting readiness
3. define and support the current Windows x64 backend/runtime lane while preserving later PulseOS, Linux, and macOS target integration
4. reach self-sustained hosting by using self-hosting as the transition mechanism, with Windows x64 current and additional targets added through preserved adapter seams

## Strategic Pivot (2026-03-21)

This roadmap originally assumed a Windows-first standalone product. That is no longer the strategic direction.

Effective immediately:

- the Windows MASM/COFF/`link.exe` pipeline is the current Windows x64 target adapter and host/bootstrap lane, not the destination product model for the whole architecture
- compiler-owned packaging/install/productization work is removed from `pulsec`; downstream tools own installers/packages if needed
- frontend, semantics, IR, stdlib, docs, validation, and self-sustained-hosting readiness work remain live
- backend/runtime work from the IR boundary downward should pivot toward:
  - a Rust-owned host bootstrap path
  - explicit target adapters instead of one Windows-shaped native path
  - the current Windows x64 target contract plus preserved later PulseOS/Linux/macOS target contracts
  - target seams that fit the same adapter architecture when later lanes activate

Interpret older Windows-specific milestones below as historical/bootstrap context unless a later section explicitly reactivates them.

## Active Planning Lanes

- Lane 1: keep F1/F2/F-A moving toward a self-sustained-hosting-ready language and library surface
- Lane 2: preserve and reframe the current Windows x64 backend as both an immediate target lane and the current host/bootstrap path
- Lane 3: define the first PulseOS target adapter, runtime ABI boundary, and loader/startup contract
- Lane 4: keep the architecture honest for later Linux and macOS expansion instead of hard-coding Windows-only assumptions back in
- Lane 5: move self-hosting into a broader self-sustained-hosting roadmap rather than a Windows-product roadmap

## Active Execution Board (2026-04-09)

- [F1 Task Board](/D:/Programming/codex/PulseCode/docs/F1_TASK_BOARD.md) is the active execution board
- [Rebase Scope and Return-to-F1 Policy](/D:/Programming/codex/PulseCode/docs/REBASE_SCOPE_AND_RETURN_POLICY.md) is the scope/policy source of truth for why the rebase exists and when `F1` may resume
- [Target Taxonomy and Naming Policy](/D:/Programming/codex/PulseCode/docs/TARGET_TAXONOMY_AND_NAMING.md) is the source of truth for canonical target IDs during the target-model rebase
- [Backend Layer Architecture](/D:/Programming/codex/PulseCode/docs/BACKEND_LAYER_ARCHITECTURE.md) is the source of truth for the `RB-07` code-ownership split
- [Backend Adapter Registry](/D:/Programming/codex/PulseCode/docs/BACKEND_ADAPTER_REGISTRY.md) is the source of truth for the `RB-08` adapter selection seam
- [Windows x64 Adapter Scope](/D:/Programming/codex/PulseCode/docs/WINDOWS_X64_ADAPTER_SCOPE.md) is the source of truth for the `RB-09` retained Windows lane boundary
- [Target-Neutral Planning Boundary](/D:/Programming/codex/PulseCode/docs/TARGET_NEUTRAL_PLANNING_BOUNDARY.md) is the source of truth for the `RB-10` planning-structure boundary
- [Runtime Intrinsics Partition](/D:/Programming/codex/PulseCode/docs/RUNTIME_INTRINSICS_PARTITION.md) is the source of truth for the `RB-11` portable-vs-adapter runtime split
- [Host Bootstrap Runtime Contract](/D:/Programming/codex/PulseCode/docs/HOST_BOOTSTRAP_RUNTIME_CONTRACT.md) is the source of truth for the `RB-12` minimum retained Rust-host bootstrap runtime seam
- [PulseOS Runtime Service ABI Slice](/D:/Programming/codex/PulseCode/docs/PULSEOS_RUNTIME_SERVICE_ABI_SLICE.md) is the source of truth for the `RB-13` requested-target PulseOS service boundary
- [Runtime Ownership Rebase](/D:/Programming/codex/PulseCode/docs/RUNTIME_OWNERSHIP_REBASE.md) is the source of truth for the `RB-14` three-way ownership split
- [Target Artifact Contract Split](/D:/Programming/codex/PulseCode/docs/TARGET_ARTIFACT_CONTRACT_SPLIT.md) is the source of truth for the `RB-15` artifact split between Windows x64 and PulseOS
- [PulseOS Startup, Loader, and Publication Contract](/D:/Programming/codex/PulseCode/docs/PULSEOS_STARTUP_LOADER_PUBLICATION_CONTRACT.md) is the source of truth for the `RB-16` startup/publication split between the retained Windows x64 lane and the requested-target PulseOS lane
- [PulseOS Executable-Loading Proof Target](/D:/Programming/codex/PulseCode/docs/PULSEOS_EXECUTABLE_LOADING_PROOF_TARGET.md) is the source of truth for the `RB-17` contract-level PulseOS loading target
- [PULSEOS_LINUX_BACKED_TARGET_DIRECTION.md](/D:/Programming/codex/PulseCode/docs/PULSEOS_LINUX_BACKED_TARGET_DIRECTION.md) records the current PulseOS target-direction policy
- [Target Taxonomy and Naming Policy](/D:/Programming/codex/PulseCode/docs/TARGET_TAXONOMY_AND_NAMING.md) now also preserves `macos-arm64` as a later canonical target lane without changing the current adapter implementation truth
- [Compiler Packaging Removal](/D:/Programming/codex/PulseCode/docs/COMPILER_PACKAGING_REMOVAL.md) is the source of truth for `RB-17.1` and the removed packaging surface
- [Rebase Validation Layering](/D:/Programming/codex/PulseCode/docs/REBASE_VALIDATION_LAYERING.md) is the source of truth for `RB-18` and the split between target-neutral, Windows x64 adapter, and requested-target contract validation homes
- [Windows x64 Scope / Freeze Policy](/D:/Programming/codex/PulseCode/docs/WINDOWS_X64_SCOPE_FREEZE_POLICY.md) is the source of truth for `RB-19` and the retained-vs-frozen Windows x64 boundary
- [Rebase Planning Spine Alignment](/D:/Programming/codex/PulseCode/docs/REBASE_PLANNING_SPINE_ALIGNMENT.md) is the source of truth for `RB-20` and the live planning-spine alignment
- [Rebase Closure Checklist](/D:/Programming/codex/PulseCode/docs/REBASE_CLOSURE_CHECKLIST.md) and [Rebase Evidence Index](/D:/Programming/codex/PulseCode/docs/REBASE_EVIDENCE_INDEX.md) are the published `RB-21` closure package
- [F1 Task Board](/D:/Programming/codex/PulseCode/docs/F1_TASK_BOARD.md) is now reactivated as the active post-rebase execution board
- the rebase board is now closed through `RB-21`
- the active `F1` resume point is `F1-51`

## Current Phase Snapshot
Completed (bootstrapped front-end foundation):
- Lexer
- Parser with class and body statements
- Semantic/type checker
- CLI `check`
- Test suite with semantic behavior coverage
- Phase A1 language surface completion:
  - `switch`
  - `do-while`
  - `++/--` (prefix/postfix)
  - compound assignment (`+=`, `-=`, etc.)
  - `null` literal + baseline nullability rules
  - member access expression typing (`obj.field`, `obj.method()`)
- Static/instance context checks for member access/calls
- Package path validation (`--strict-package`, `--source-root`, build strict defaults)
- Phase A2 semantic depth completion (current single-file scope):
  - visibility checks across classes/packages in current single-file scope:
    - private enforced
    - protected treated as package-visible (temporary until inheritance)
    - package-private supported
  - definite-return analysis for non-void methods
  - null-flow narrowing in conditionals (`if (x != null)` / `if (x == null)`)
  - improved overload/constructor mismatch diagnostics
- Phase A3 completed (M1 freeze baseline):
  - file-based import resolution for `check`
  - recursive import loading with cycle detection
  - merged multi-file class symbol analysis in `check`
  - test coverage for missing imports, import cycles, and cross-file visibility/package checks
  - wildcard package imports (`import x.y.*`) and static import loading (`import static x.y.Z.member`, `import static x.y.Z.*`)
  - static import symbol injection baseline for unqualified static member usage
  - duplicate/ambiguous import diagnostics and cross-file class-name collision diagnostics
  - same-package class auto-loading from source-root package directory (no import needed in same package)
  - cross-package class usage requires import (enforced by unresolved symbol diagnostics)
  - per-class semantic contexts wired (`package + imports` metadata per class declaration) as groundwork for full package-qualified symbol identity
  - duplicate simple class names across different packages supported in multi-file `check` (collision stopgap removed)
  - class resolution precedence baseline implemented in semantics:
    - same-package class references take precedence
    - explicit class imports take precedence over wildcard imports
    - ambiguous wildcard class resolution reports semantic ambiguity
  - declaration type canonicalization baseline implemented:
    - field/param/return/local class types resolve to package-qualified identity
    - ambiguous class type references now diagnosed in declaration contexts
  - stdlib import conventions baseline:
    - `import com.pulse.lang.IO;` and `import com.pulse.lang.System;` supported
    - invalid/unknown `com.pulse` wildcard/static imports rejected
    - unknown `com.pulse.*` imports rejected

Not started (remaining standalone milestones):
- Packaging toolchain (remaining as a Windows x64 target-lane capability, not as the cross-project strategic destination)
- Self-hosting compiler rewrite

Completed (Phase B spike freeze baseline):
- Phase B completed as a native backend spike baseline:
  - initial IR module added in `pulsec-core` (`IrProgram`, class/field/method/param nodes)
  - AST-to-IR lowering baseline wired (`lower_to_ir_with_contexts`)
  - block-based method IR added (`IrBlock`, `IrInstr`, `IrTerminator`) with lowering for:
    - local declarations/assignments/expr eval/returns
    - `if` branches
    - `while`, `do-while`, `for` loops
    - `break` / `continue`
    - `switch` lowered to branch-chain dispatch baseline
  - typed temporary/value graph added (`IrValueId`, `IrValue`, `IrValueKind`) for expression lowering
  - debug source mapping baseline added on IR instructions/terminators/values (`IrSourceLoc`)
  - backend adapter boundary added in CLI (`BackendAdapter`, `RustHostBootstrapBackend`) to decouple IR lowering from emit stage
  - `pulsec build` now runs semantic check + IR lowering and reports IR summary
  - `pulsec build` now emits deterministic IR artifact at `build/pulsec.ir.txt` (backend no-op emitter baseline)
  - native backend contract baseline documented (`docs/NATIVE_BACKEND_CONTRACT.md`)
  - `pulsec build` now emits deterministic native plan artifact at `build/native.plan.json`
  - `pulsec build` now emits Windows COFF object scaffold artifact at `build/main.obj` (x86_64 machine header baseline)
  - `pulsec build` now performs first link step attempt (`main.obj` -> `main.exe`) and emits deterministic link report (`build/native.link.txt`)
  - `pulsec build` now guarantees executable artifact output at `build/main.exe`:
    - linked executable when linker is available
    - deterministic PE stub fallback when linker is unavailable
  - initial runtime bridge spike added:
    - `IO.println(<literal>)` entry pattern can compile through MASM (`ml64`) + `kernel32` link path
    - link report and CLI output expose codegen mode via `entry_codegen=*`
  - multi-file native call baseline added in `masm-full` mode:
    - emits callable symbols for static methods across loaded classes
    - entry path invokes class `main`, and static cross-class calls can execute (`Main` calling `Helper`)
  - split object layout baseline added:
    - per-class/intermediate asm+obj emitted under `build/obj/<package-path>/`
    - startup object emitted under `build/obj/runtime/Startup.obj`
    - linker consumes all generated objects + required system import libs
  - split emitter expression/call baseline expanded:
    - static call argument passing (up to 4 int/bool args, Win64 register ABI baseline)
    - integer/boolean literal/param/binary-expression return lowering in generated static methods
    - baseline instance receiver calls resolved from `this`/class-typed locals to emitted method symbols (no dynamic dispatch yet)
    - stdlib IO shims expanded to `IO.print` + `IO.println`
  - constructor/field baseline:
    - constructor call expressions route to emitted constructor symbols
    - `this.field` read/write lowered to generated class field data symbols (baseline object-state bridge)
  - per-instance object id allocation baseline added:
      - class-local object counters drive constructor instance ids
      - instance fields lowered to indexed storage (`field_array[object_id]`) in native emit
  - control-flow codegen baseline added in split emitter:
      - IR block/terminator lowering to assembly labels + jumps
      - loop/branch fixture runtime behavior validated (`while` + `if`)
  - constructor/instance arg + safety baseline:
      - constructor arg passing (up to 3 args) with receiver slot handling
      - call-site arg limits aligned to Win64 register ABI baseline (`4` static / `3` instance)
      - object counter and instance-field index clamping added to avoid out-of-bounds native bridge writes
  - split build/link stabilization:
      - split extern discovery captures constructor/member call symbols across IR call forms
      - linker invocation/path handling improved for reliable VS `link.exe` execution
      - link diagnostics now capture stdout/stderr details for deterministic failure analysis
      - multi-file phase-B fixture project verified to produce a linked executable (`status=linked`)
  - fixture test coverage asserts IR/native-plan artifact creation and baseline schema fields
  - fixture test coverage asserts object scaffold artifact creation/header bytes
  - fixture test coverage asserts link-report artifact schema/status and executable artifact presence for linked/stubbed status
  - integration coverage added for `build` on fixture project

In progress:
- Phase C runtime/memory implementation planning and expansion
  - runtime intrinsic ABI boundary baseline started:
    - `com.pulse.rt.Intrinsics` semantic/import surface added
    - backend runtime symbol mapping includes intrinsic console write calls
    - ABI baseline documented in `docs/RUNTIME_INTRINSICS_ABI.md`
  - post-M1 language baseline expansion started:
    - reserved keywords added for upcoming OOP/concurrency compatibility surface
    - `extends`/`super`/`abstract`/`final`/`implements` parser+semantic baseline implemented
    - `interface` declarations + class interface conformance checks implemented
    - inherited member lookup and final/abstract enforcement baseline implemented
  - C3 object-model execution started:
    - C3-01 completed and locked (instance object header + field layout schema)
    - runtime object-model metadata now emitted under `runtime.object_model` in `native.plan.json` (`pulsec.object.layout.v1`)
    - C3-02 completed and locked (static-field storage model)
    - static storage contract emitted under `runtime.object_model.static_storage` (`pulsec.static.storage.v1`)
    - C3-03 completed and locked (constructor invocation model)
    - constructor contract emitted under `runtime.object_model.constructor_model` (`pulsec.constructor.model.v1`)
    - C3-04 completed and locked (class allocation metadata model)
    - allocation contract emitted under `runtime.object_model.allocation` with deterministic `class_size_table` (`pulsec.class.alloc.v1`)
    - C3-05 completed and locked (object-model plan emission completeness)
    - lock test added: `cargo test -q -p pulsec --test stage_locks_c3`

---

## Phase A: Frontend Stabilization (Near-Term)

### A1. Language Surface Completion (Done)
- Add `switch` (done)
- Add `do-while` (done)
- Add `++/--` (prefix/postfix) (done)
- Add compound assignment (`+=`, `-=`, etc.) (done)
- Add `null` literal and nullability rules (done)
- Add member access expression typing (`obj.field`, `obj.method()`) (done)

### A2. Semantic Depth (Done for current single-file scope)
- Static vs instance context checks (done)
- Visibility checks (`public/private/protected`) across class boundaries (done for current single-file scope; cross-package validation completes with A3 multi-file imports)
- Definite return analysis for non-void methods (done)
- Better flow typing for conditionals (done baseline: null-check narrowing)
- Better diagnostics (done baseline: richer overload/constructor mismatch messages; source spans/error codes pending)

### A3. Module/Package System (Done)
- Real file-based package resolution (done baseline)
- Multi-file symbol table (done baseline)
- Import cycle detection (done baseline in `check`)
- Wildcard/static import loading (done baseline in `check`)
- Same-package class discovery under source-root package directories (done baseline in `check`)
- Duplicate class simple names across packages with package-aware resolution precedence (done baseline)
- Standard library package/layout conventions (done: `com.pulse` baseline packages + explicit diagnostics for unsupported/unknown imports)
- Real fixture project suites for multi-file `pulsec check` behavior (done)
- M1 semantics freeze document added (`docs/M1_SEMANTICS_FREEZE.md`) (done)

Deliverable gate for Phase A:
- `pulsec check` can validate realistic multi-file projects

---

## Phase B: Intermediate Representation + Backend Spike (Done)

### B1. Internal IR Design
- Define typed IR suited for OOP constructs (done; class/member + block/instruction IR implemented)
- Lower AST to IR (done; method-body/control-flow + value graph lowering implemented)
- Keep debug metadata (source mapping) (done; `IrSourceLoc` implemented)

### B2. Native Backend Strategy
- Strategy finalized for Phase B spike (done):
1. Native backend path selected and implemented via MASM/COFF object emission.
2. Object emission + link to `.exe` implemented and validated.
3. Startup/runtime contract validated for current spike scope.

### B3. Build Command
- Implement `pulsec build <entry-file>` (done)
- Output executable artifact (done; linked executable when toolchain available, deterministic stub fallback otherwise)
- Add build config file support (future)

Deliverable gate for Phase B:
- Compile hello-world PulseCode to runnable `.exe` (achieved; Phase B spike frozen)

---

## Phase C: Runtime + Memory Model (In Progress)

### C1. Runtime Library
- Ordered implementation plan (current):
1. `com.pulse.lang.System`/`com.pulse.lang.IO` console layering (Done)
   - keep app-facing API as `System.out.println(...)` with `IO.println(...)` alias
   - route low-level platform calls through `com.pulse.rt.Intrinsics`
   - completed in-progress work:
     - stdlib source facades added under `stdlib/src` for:
       - `com.pulse.lang.System`
       - `com.pulse.lang.IO`
       - `com.pulse.lang.ConsoleWriter`
       - `com.pulse.lang.PrintStream`
       - `com.pulse.rt.Intrinsics`
     - stdlib-source resolution/loading wired so `com.pulse.*` imports can load from `stdlib/src`
     - `IO` and `PrintStream` facade methods now delegate to `Intrinsics.consoleWrite*`
     - `System.out` lowering is runtime-managed in backend (singleton handle model)
     - `System.out` is typed to `com.pulse.lang.ConsoleWriter` contract; `PrintStream` implements that interface
     - `System.out` finalized as an immutable runtime-managed singleton surface (`public static final`)
   - completed:
     - legacy `com.pulse.io.Io` compatibility alias removed; language/runtime docs and import surface now use `com.pulse.lang.IO`
2. String implementation/interop (Done baseline for C1)
   - define minimal runtime representation + ABI hooks
   - keep `String` language treatment stable while runtime representation is introduced
   - completed baseline:
     - intrinsic surface expanded with `stringConcat`, `stringLength`, `intToString`, `booleanToString`
     - stdlib `com.pulse.rt.Intrinsics` facade and semantic stubs updated for String bridge calls
     - backend routing baseline added for String intrinsics:
       - static call mapping to `pulsec_rt_string*` symbols
       - split/full stdlib object generation emits runtime-backed native shim procs for these symbols
     - semantic String-class bridge completed for baseline:
       - builtin class contract now includes `com.pulse.lang.String` with baseline instance API (`length`, `isEmpty`, `concat`)
       - String-typed variable member access/calls now resolve through class metadata in semantic analysis
       - parser/lexer no longer treat `String` as primitive keyword type
       - real stdlib class source added at `stdlib/src/com/pulse/lang/String.pulse`
       - `String` remains prelude-resolved (no import required), Java-style
     - String interop lock documented:
       - runtime intrinsic symbol names and String-handle bridge contract are now explicitly locked in `docs/RUNTIME_INTRINSICS_ABI.md`
       - executable fixture coverage added for String runtime path (`length`/`concat`/`valueOf`) in split native mode
3. Arrays and core collections (Done for C1 scope)
   - stdlib source wrappers under `stdlib/src/com/pulse/collections` now delegate to runtime intrinsics:
     - `Array`
     - `List`
     - `ArrayList`
     - `Map`
   - runtime intrinsic ABI expanded for array/list/map handle-backed operations
   - backend native runtime shims implemented for collection/array intrinsic symbols
   - semantic/import surface updated for `ArrayList` (`com.pulse.collections.ArrayList`)
   - executable fixture coverage validates cross-collection runtime behavior (`Array` + `ArrayList` + `List` + `Map`)
4. Panic/exception strategy (Done baseline for C1)
   - `Intrinsics.panic(String)` added as ABI boundary for fail-fast runtime termination
   - backend runtime symbol `pulsec_rt_panic` emits message + exits process non-zero
   - higher-level exception model (`throw`/`try`) remains future work

### C1.5. Runtime Hardening + Pre-Self-Hosting Stdlib Completion (Required Gate)
This is a hard stabilization gate before self-hosting work advances.

Current progress:
- M2 Sprint 1 kickoff complete:
  - primitive-wrapper type map added in semantics (`byte->Byte`, ..., `void->Void`)
  - wrapper class skeletons added under `stdlib/src/com/pulse/lang`:
    - signed: `Byte`, `Short`, `Integer`, `Long`, `Float`, `Double`, `Char`, `Boolean`
    - unsigned: `UByte`, `UShort`, `UInteger`, `ULong`
    - `Void`
  - semantic and CLI fixture coverage added to validate wrapper type/import surface
- M2 Sprint 2 completed:
  - call-site boxing/unboxing now participates in method/constructor overload selection
  - overload precedence lock added: exact primitive/wrapper matches are preferred over boxing/unboxing conversions
  - ambiguous best-match overloads now report deterministic diagnostics instead of declaration-order selection
  - numeric conversion matrix documented in `docs/NUMERIC_CONVERSION_MATRIX.md`
  - semantic diagnostics now distinguish signed->unsigned, unsigned->signed, and widening/narrowing implicit primitive conversions
  - wrapper API surface completed for `com.pulse.lang` wrappers:
    - `valueOf`, `parse`, primitive extractors, `equals`, and `compare` are implemented across wrapper classes
    - native runtime path added for `Intrinsics.parseInt` and `Intrinsics.parseBoolean`
    - executable fixtures validate happy-path wrapper calls and deterministic panic for unsupported parse paths
  - core bootstrap lang classes completed:
    - stdlib source now includes `Object`, `Class`, `Comparable`, `Iterable`, `Iterator`, and `StringBuilder`
    - semantic builtin class metadata and CLI import validation are aligned to the same class surface
    - semantic and executable fixture coverage exercise these classes/interfaces in project builds
  - wrapper nullability boundary enforcement completed:
    - definite-null wrapper->primitive unboxing is rejected at assignment, return, and call-argument boundaries
    - wrapper references remain nullable; primitive targets remain non-null
    - flow-sensitive null checks continue to allow safe narrowed unboxing paths
  - wrapper executable fixture set completed:
    - deterministic wrapper API happy-path output fixtures
    - deterministic non-zero exits for invalid parse paths (`Integer.parse`, `Boolean.parse`, unsupported wrapper parses)
  - freeze docs updated with boxing/unboxing and numeric conversion lock tables
  - casting/literal conformance lock suites completed and locked:
    - `stage_locks_casting` (success-path)
    - `stage_locks_casting_failures` (expected-failure-path, isolated output)
    - includes explicit truncation cast coverage for negative float/double values and boxed literal mapping (`Long a = 20`)

M2 status:
- M2 tasks and gates are complete; M2 is done.

M3 progress:
- M3-01 completed:
  - stdlib source hierarchy added: `Throwable`, `Exception`, `RuntimeException`
  - semantic builtin class metadata and CLI import validation updated for the hierarchy
  - semantic + executable fixture coverage now exercises hierarchy assignment and message/toString flow
- M3-02 completed:
  - stdlib source classes added: `IllegalArgumentException`, `IllegalStateException`, `NullPointerException`, `IndexOutOfBoundsException`, `UnsupportedOperationException`, `NumberFormatException`
  - semantic builtin class metadata and CLI import validation aligned for constructor + `toString` usage
  - semantic + executable fixture coverage now exercises subclass assignment and emitted native output
- M3-03 completed:
  - `com.pulse.collections.Collection` and `com.pulse.collections.List` contracts finalized as interface surfaces
  - `ArrayList` now provides the concrete runtime-backed implementation for both contracts
  - semantic + CLI check/build tests updated to validate contract-conformance usage paths
- M3-04 completed:
  - `ArrayList` CRUD behavior locked for current C1.5 scope with executable fixture validation
  - bounds semantics added in stdlib source (`get*` index checks and add-capacity guard)
  - bounds violations now route through `Intrinsics.panic` with deterministic non-zero executable behavior
- M3-05 completed:
  - `LinkedList` added as concrete stdlib implementation of `Collection`/`List`
  - semantic/import surface aligned for `com.pulse.collections.LinkedList`
  - executable fixtures validate linked-list CRUD behavior and deterministic bounds panic path
- M3-06 completed:
  - `Set` and `HashSet` added to `com.pulse.collections` with intrinsic-backed set behavior
  - semantic/import surface aligned for set operations (`size`, `clear`, `add`, `contains`)
  - executable fixture validates uniqueness + membership behavior
- M3-07 completed:
  - `HashMap` added as map implementation complementing `Map`
  - map clear/reset behavior added for current C1.5 scope
  - executable fixture validates `put/get/contains` on string/int map paths
- M3-08 completed:
  - `Queue` and `Deque` contracts added, with `LinkedList` implementation for current C1.5 scope
  - semantic/import surface aligned for queue/deque method contracts
  - executable fixture validates queue FIFO and deque front/back operations
- M3-09 completed:
  - stdlib `com.pulse.math.Math` source added with deterministic int API behavior (`abs`, `max`, `min`, `clamp`)
  - semantic/import surface and tests aligned for expanded Math API usage
  - executable fixture validates deterministic edge-case math output
- M3-10 completed:
  - stdlib `com.pulse.math.Random` source added with deterministic seeded sequence behavior
  - semantic/import surface aligned for `Random(int)` + `nextInt(int)` contracts
  - executable fixture validates reproducible sequences for identical seeds
- M3-11 completed:
  - stdlib `com.pulse.io` sources added for `File`, `Path`, and `Files`
  - deterministic in-memory file behavior implemented using existing runtime map intrinsics
  - executable fixture validates read/write/append/exists/path-combine flows
- M3-12 completed:
  - stdlib `InputStream`/`OutputStream` sources added on top of `Files`
  - semantic/import surface aligned for stream constructors and read/write/append methods
  - executable fixture validates stream-based IO flow
- M3-13 completed:
  - stdlib `com.pulse.time.Instant` and `Duration` sources added for deterministic current-scope time behavior
  - semantic/import surface aligned for instant/duration constructors and arithmetic helpers
  - executable fixture validates deterministic time outputs
- M3-14 completed:
  - runtime intrinsic ABI coverage locked for current M3 runtime-backed APIs
  - `RUNTIME_INTRINSICS_ABI.md` updated with explicit M3 mapping + native symbol inventory
  - fixture plan assertions validate runtime intrinsic symbol presence in emitted native plans
- M3-15 completed:
  - added real multi-file fixture suites under `crates/pulsec-cli/tests/fixtures` for runtime-mix and object/interface-mix scenarios
  - fixtures exercise collections/io/time/math/object-interface combinations in both check and build flows
  - executable fixture assertions validate deterministic runtime output
- M3-16 completed:
  - added `stress_soak` multi-file fixture covering allocation churn, collection churn, bounded string churn, and loop-heavy workloads
  - added repeated build+run integration gate (`cli_build_executes_stress_soak_repeatedly`) with configurable iteration count via `PULSEC_SOAK_ITERS`
  - stress/soak gate validated in `cargo test -p pulsec --test fixture_projects`
- M3-17 completed:
  - validated Windows toolchain path variants for linker selection (default discovery, explicit `--linker`, and `PULSEC_LINKER` override)
  - matrix results documented in `docs/WINDOWS_TOOLCHAIN_MATRIX.md` with pass/fail notes
  - strict fixture executable output + link status verified per variant
- M3-18 completed:
  - published C1.5 closure artifacts:
    - `docs/RUNTIME_INTRINSICS_ABI.md`
    - `docs/STDLIB_API_INDEX.md`
    - `docs/C1_5_CLOSURE_CHECKLIST.md`
    - `docs/STAGE_LOCK_TESTS.md`
  - linked closure artifacts together for doc-gate traceability

Hardening closure criteria:
- Runtime conformance suite passes for IO, String, collections, control flow, constructors, fields, and static/instance dispatch
- ABI lock tests pass for all `com.pulse.rt.Intrinsics` symbols used by stdlib
- Deterministic failure behavior verified (`panic`, null access, bounds errors, invalid casts once added)
- Long-run stress suite passes (allocation churn, loops, collection mutations, string concat workloads)
- Toolchain matrix validated on Windows environments used by contributors (`ml64`/`link.exe` path variants)

Pre-self-hosting required stdlib class inventory:
- `com.pulse.lang`: `Object`, `String`, `StringBuilder`, `Strings`, `System`, `IO`, `ConsoleWriter`, `PrintStream`, `Class`, `Enum`, `Comparable`, `Iterable`, `Iterator`, `AutoCloseable`
- `com.pulse.lang` errors/exceptions: `Throwable`, `Exception`, `RuntimeException`, `IllegalArgumentException`, `IllegalStateException`, `NullPointerException`, `IndexOutOfBoundsException`, `UnsupportedOperationException`, `NumberFormatException`
- `com.pulse.collections`: `Array`, `Collection`, `List`, `ArrayList`, `LinkedList`, `Set`, `HashSet`, `Map`, `HashMap`, `Queue`, `Deque`
- `com.pulse.math`: `Math`, `Random`
- `com.pulse.io`: `File`, `Path`, `Files`, `InputStream`, `OutputStream`
- `com.pulse.time`: `Instant`, `Duration`

Primitive and wrapper-class lock (Java-style boxing foundation):
- Primitive keywords remain value types: `void`, `byte`, `short`, `int`, `long`, `float`, `double`, `char`, `boolean`, `ubyte`, `ushort`, `uint`, `ulong`
- Required wrapper/reference classes in `com.pulse.lang`:
  - signed: `Byte`, `Short`, `Integer`, `Long`, `Float`, `Double`, `Char`, `Boolean`
  - unsigned: `UByte`, `UShort`, `UInteger`, `ULong`
  - `Void` for reflective/generic return typing
- Compiler/runtime behavior to lock in C1.5:
  - auto-boxing and auto-unboxing for primitive <-> wrapper at assignment, parameter passing, and return boundaries
  - explicit nullability boundary: primitives non-null, wrappers nullable
  - stable conversion/overflow rules for signed/unsigned numeric operations and casts
  - wrapper APIs: `valueOf`, parse methods, primitive extractors, equality/compare helpers

C1.5 milestone execution plan (required order):
- Trackable board: `docs/C1_5_TASK_BOARD.md`

M2. Runtime + Boxing Core Lock
- Objective: lock Java-style primitive/wrapper behavior and core runtime contracts before broader stdlib growth.
- Scope:
  - implement wrapper classes in `com.pulse.lang`:
    - signed: `Byte`, `Short`, `Integer`, `Long`, `Float`, `Double`, `Char`, `Boolean`
    - unsigned: `UByte`, `UShort`, `UInteger`, `ULong`
    - `Void`
  - lock compiler boxing/unboxing semantics at assignment, call args, returns, and overload resolution boundaries
  - lock signed/unsigned cast + overflow behavior and diagnostics
  - complete core lang/runtime set required by compiler bootstrap path:
    - `Object`, `Class`, `Comparable`, `Iterable`, `Iterator`, `System`, `IO`, `String`, `StringBuilder`, `Strings`
- M2 required test gates:
  - conformance suite:
    - boxing/unboxing round-trip across all primitive/wrapper pairs
    - nullability checks (primitive non-null vs wrapper nullable)
    - overload dispatch with mixed primitive/wrapper signatures
    - numeric conversion matrix (signed/unsigned widening/narrowing/cast diagnostics)
  - native executable fixtures:
    - deterministic output for wrapper `valueOf`, parse, equals/compare, primitive extractors
    - deterministic panic/exit behavior on invalid parse and invalid cast paths
  - compatibility gate:
    - freeze doc updated with explicit boxing/cast tables and examples

M3. Stdlib Surface Completion + Runtime Hardening
- Objective: complete pre-self-hosting stdlib surface and prove runtime stability under larger workloads.
- Scope:
  - complete required pre-self-hosting inventory:
    - `com.pulse.lang` exceptions/errors (`Throwable`, `Exception`, `RuntimeException`, `IllegalArgumentException`, `IllegalStateException`, `NullPointerException`, `IndexOutOfBoundsException`, `UnsupportedOperationException`, `NumberFormatException`)
    - `com.pulse.collections`: `Collection`, `List`, `ArrayList`, `LinkedList`, `Set`, `HashSet`, `Map`, `HashMap`, `Queue`, `Deque`, `Array`
    - `com.pulse.math`: `Math`, `Random`
    - `com.pulse.io`: `File`, `Path`, `Files`, `InputStream`, `OutputStream`
    - `com.pulse.time`: `Instant`, `Duration`
  - lock intrinsic ABI coverage for each runtime-backed stdlib API included above
  - harden runtime for stress/soak behavior and deterministic failure semantics
- M3 required test gates:
  - fixture-project suite (real multi-file apps):
    - collections-heavy data flow
    - io/file/path flows
    - time/math flows
    - mixed object + static + interface usage
  - stress suite:
    - long-running allocation/mutation loops
    - string and collection churn
    - boundary tests for indices, capacities, and numeric limits
  - toolchain matrix:
    - validate deterministic build/link/run behavior across supported Windows `ml64`/`link.exe` setups
  - release-readiness docs gate:
    - runtime ABI docs, stdlib API index, and C1.5 closure checklist marked complete
Gate to Phase F (self-hosting):
- Phase F cannot begin until C1.5 closure criteria and stdlib inventory are marked complete.
### C2. Automatic Memory Management
Locked path for current Phase C implementation:
1. ARC + background cycle detection (trial-deletion style) + weak references support (selected)
- Trackable board: `docs/C2_TASK_BOARD.md`
- Current C2 progress:
  - C2-01 completed and locked:
    - ARC header/handle contract documented in `docs/RUNTIME_INTRINSICS_ABI.md` (`pulsec.arc.header.v1`)
    - `build/native.plan.json` now emits locked `runtime.memory_model` ARC header metadata
    - lock test added: `cargo test -p pulsec --test stage_locks_c2`
  - C2-02 completed and locked:
    - `Memory.retain(long) -> long` and `Memory.release(long) -> void` added to stdlib/semantic/backend surfaces
    - runtime shim fast-path behavior implemented: null (`0`) and out-of-range handles are deterministic no-ops
    - lock tests validate compile/build/runtime path for retain/release no-op behavior
  - C2-03 completed and locked:
    - ARC release slow-path now invokes deterministic kind-aware teardown when refcount reaches zero
    - teardown sequencing clears string/array/list/map handle slots and resets ARC header metadata
    - stale handle use after teardown now panics deterministically (non-zero exit) in runtime-backed APIs
    - lock test validates retain/release sequencing and stale-handle panic behavior
  - C2-04 completed and locked:
    - deterministic ARC insertion points added in native codegen for assignment/call/return/field-write boundaries
    - call-argument ARC boundary now emits retain before call and release after call for ARC-managed arguments
    - lock test validates ARC retain/release emission and executable behavior for assignment/call/return/field/container mutation flow
  - C2-05 completed and locked:
    - cycle detector ABI surface added: `arcCycleYoungPass`, `arcCycleFullPass`, `arcCycleTick`
    - generational cadence lock added in native runtime (`young` window pass + periodic `full` pass every fixed tick interval)
    - lock test validates cycle-detector plan schema/symbols and deterministic executable cadence behavior
  - C2-06 completed and locked:
    - weak-reference ABI surface added: `weakNew`, `weakGet`, `weakClear`
    - runtime weak handles now validate generation/version and target liveness deterministically
    - lock test validates weak cache/listener-style behavior and stale weak-token panic path
  - C2-07 completed and locked:
    - retain saturation now fails fast with deterministic panic diagnostics (`ARC refcount saturation`)
    - cycle tick now enforces deterministic lag tracking semantics with locked zero-reclaim streak threshold (`1024`)
    - lock test validates runtime lag-tracking path and emitted saturation/lag diagnostics in runtime asm
  - C2-08 completed and locked:
    - fixed-capacity array tables were removed; arrays now use per-instance heap-backed int/string lanes with ARC teardown free
    - runtime handle-slot capacity now grows dynamically (`initial=63`, doubling) up to ABI v2 slot-mask max `4294967295`
    - allocator policy/alignment contract is locked in docs and emitted in `native.plan.json` (`pulsec.alloc.policy.v1`)
    - C2 stage-lock tests validate allocator policy fields and heap-backed runtime emission behavior
  - C2-09 completed and locked:
    - list/map runtime storage now uses dynamic per-instance heap lanes with locked growth policy (`init=16`, `growth=2x`, `max=2147483647`)
    - growth path uses deterministic allocate-copy-free behavior while preserving stale-handle safety
    - C2 stage-lock tests validate >init-capacity list/map growth execution
  - C2-10 completed and locked:
    - list/map clear paths now implement shrink with anti-thrashing hysteresis (`hysteresis_trigger_multiplier=4`)
    - runtime ABI surface extended with `Intrinsics.mapClear(long)` / `pulsec_rt_mapClear`
    - C2 stage-lock tests validate repeated grow/clear cycles with stable post-clear size semantics
  - C2-11 completed and locked:
    - retain/release ownership hooks are now emitted for list/map String/key mutation paths (`add`, `replace`, `clear`, teardown)
    - list runtime now tracks kind metadata so String release paths only run for String-backed payload lanes
    - C2 stage-lock tests validate ownership semantics at runtime and in emitted asm for list/map mutation boundaries
  - C2-12 completed and locked:
    - deterministic array allocation failure path emits `Array allocation failed` and exits non-zero
    - deterministic list/map/string growth/allocation failures emit stable diagnostics and exit non-zero
    - C2 stage-lock coverage now includes array/list/map/string deterministic failure fixtures
  - C2 execution update:
    - `Workstream C: ABI v2 Transition Hardening (64-bit handles)` is complete and locked (see `docs/C2_TASK_BOARD.md`)
    - active workstream is now `Workstream D: Backend Stack-Frame + ABI Call Hardening`
    - prior stack-frame hardening moved to Workstream D; reliability/tooling moved to Workstream E for sequencing clarity
  - C2-17 completed and locked:
    - method frame planner now computes stack sizing from per-method locals/params + dense binary temps + ARC spill lanes
    - fixed legacy method scratch offsets (`1024` / `3072`) were removed from planning assumptions
    - lock test validates bounded prologues and absence of fixed scratch-offset references in generated method asm
  - C2-18 completed and locked:
    - Win64 outgoing stack-arg planning now supports calls beyond register-arg limits
    - callee param decoding now reads incoming stack-passed args for static and instance call shapes
    - lock test validates static + instance 5-arg call execution and outgoing stack-arg emission in asm
  - C2-19 completed and locked:
    - frame-budget lint thresholds are enforced in build pipeline (`warn=1024B`, `fail=4096B`)
    - `native.plan.json` now exposes frame-budget metadata (`runtime.memory_model.frame_budget`)
    - lock tests validate both plan metadata and deterministic build failure on frame-budget breach
  - C2-20 completed and locked:
    - runtime-mix regression lock now asserts bounded `GameLoop.asm` prologue/frame size (`sub rsp <= 4096`)
    - runtime-mix executable stability is locked with the same fixture run (`runtime_mix_ok`)
    - Workstream D (`C2-17`..`C2-20`) is complete and locked for current C2 scope
  - C2-21 completed and locked:
    - deterministic debug allocator mode added (`PULSEC_DEBUG_ALLOC`) with plan metadata at `runtime.memory_model.debug_allocator.enabled`
    - invalid ARC retain/release now fail-fast in debug mode with stable diagnostics (`Debug allocator: invalid ARC retain/release`)
    - lock tests validate both double-release and retain-after-release panic paths; full `cargo test -q` remains green
  - C2-22 completed and locked:
    - leak/stability soak lock now runs repeated `strict_stress_soak` build+run cycles under split-native codegen
    - lock requires linked-native status + deterministic runtime output (`soak_ok`, checksum `40415`) on every iteration
    - memory-trend gate enforces bounded post-warmup peak working-set spread/drift with CI-tunable thresholds
    - verification is green in `stage_locks_c2` and full `cargo test -q`
  - C2-23 completed and locked:
    - threading contract is explicitly locked as host-threading plus atomic reference publication in `docs/RUNTIME_INTRINSICS_ABI.md` (`pulsec.runtime.threading.v2`)
    - native plan now emits `runtime.memory_model.threading` with fixed atomicity/thread-safety boundaries
    - lock tests validate docs + plan emission + the retained `not-thread-safe` runtime/container boundary while ARC/publication helpers are atomic
  - C2-24 completed and locked:
    - runtime ABI compatibility metadata is now emitted in `native.plan.json` under `runtime.abi_compatibility` (`pulsec.runtime.abi.v1`)
    - runtime init enforces compiler/runtime ABI match before runtime-table initialization
    - mismatch behavior is deterministic fail-fast (`Runtime ABI mismatch`, non-zero exit)
    - lock tests validate plan contract + executable mismatch detection; full suite remains green
  - C2-25 completed and locked:
    - C2 closure artifact package published (`C2_CLOSURE_CHECKLIST.md`, `C2_MEMORY_ARC.md`, `C2_CYCLE_STRATEGY.md`, `C2_CI_MATRIX.md`, `C2_EVIDENCE_INDEX.md`)
    - closure evidence revalidated with green lock and full suites
    - C2 is now fully complete and locked (`C2-01`..`C2-25`, `C2-G1`..`C2-G12`)

ARC + cycle-handling hardening closure (required before C2 exit):
1. ARC object/header contract
   - define refcount field size, saturation behavior, and header layout for objects/arrays/strings/collections
   - lock retain/release fast-path and slow-path behavior (including no-op/null paths)
2. ARC operation correctness
   - deterministic retain/release insertion points at assignment, call argument, return, field write, and container mutation boundaries
   - no double-release or missed-release paths in semantic-legal programs
3. ARC + container ownership rules
   - lock ownership behavior for `List`/`ArrayList`/`Map`/`Set` add/remove/replace/clear
   - lock key/value ownership rules for maps and nested container graphs
4. Cycle handling strategy lock
   - locked strategy: ARC with background cycle detector (trial-deletion style), with weak references as an optimization/escape hatch
   - cycle detector cadence is generational (frequent young-cycle passes, less-frequent full-graph passes)
   - document deterministic behavior for common cyclic graphs (parent/child, doubly-linked structures, observer references)
5. ARC failure semantics
   - deterministic behavior on refcount overflow/saturation guard conditions
   - deterministic behavior when cycle handling cannot reclaim immediately
6. ARC stress + leak conformance gates
   - long-run churn and graph-shape tests prove bounded memory behavior
   - leak regression harness must pass repeated build/run cycles in CI

C2 required scope (memory + backend runtime hardening):
1. Stack-frame planner + ABI correctness (required)
   - replace fixed/over-compensated prologue allocation with computed per-method frame sizing
   - account for local spill slots, Win64 shadow space, callee-saved register save area, temp evaluation depth, and call-boundary alignment
   - emit minimal correct `sub rsp, N`/`add rsp, N` pairs per method with deterministic frame layout
   - enforce 16-byte alignment at every `call` site
   - support outgoing stack-argument area planning for calls beyond register-arg limits
2. Stack-frame validation/guard tests (required)
   - fixture assertions that generated prologues are size-bounded for small methods
   - regression fixture for `runtime_mix` (`GameLoop.asm`) to prevent runaway frame inflation
   - stress fixture for nested calls/loops/recursion depth to validate alignment and frame stability
3. Heap allocation model (required)
   - runtime allocation policy for objects/arrays/strings/collections (alignment + metadata/header rules)
   - arrays must use dynamic per-instance backing storage sized by requested length (subject to `int` limits and OOM policy), not fixed shared tables
   - free/reclaim path behavior under ARC with deterministic lifetime boundaries
   - fragmentation-aware strategy documented for long-running workloads
4. Dynamic container growth/shrink semantics (required)
   - `Array`/`List`/`ArrayList`/`Map` growth policy (initial capacity, growth factor, reallocation/copy behavior)
   - shrink policy with anti-thrashing hysteresis
   - deterministic guarantees for capacity, length/size, and element retention after resize
5. ARC ownership + container semantics (required)
   - retain/release rules for add/remove/set/replace/clear operations
   - iterator/collection interaction rules for object lifetime safety
   - ownership behavior documented for map keys/values and nested collections
6. Cycle handling closure (required)
   - implement and harden the locked cycle strategy (background trial-deletion + generational scheduling + weak-ref support)
   - verify deterministic behavior on common cyclic graphs and cache/listener weak-reference patterns
7. OOM and failure behavior contract (required)
   - deterministic out-of-memory behavior (`panic`/fatal path and diagnostics)
   - bounds/null/access failure behavior locked for runtime container operations
   - no silent memory corruption paths on allocation/growth failure
8. Leak/perf/stress validation (required)
   - long-run churn fixtures for strings, lists, maps, and mixed object graphs
   - leak regression harness with repeated build/run cycles on fixture suites
   - memory/perf baseline metrics captured and regression thresholds set
9. C2 production-readiness lock (required)
   - memory/runtime behavior is production-ready at C2 exit: no known leak classes in gate fixtures, deterministic failure paths, and bounded growth under soak workloads

C2 hardening addendum (required):
1. Threading memory model lock
   - define ARC atomicity model and thread-safety boundaries for containers/runtime objects
   - lock data-race policy for shared mutable state
2. Deterministic debug allocator mode
   - add runtime debug mode with guard patterns/poisoning for use-after-free/double-release detection
3. Per-method frame budget lint
   - add compile/build lint thresholds for stack-frame size to catch regressions early
4. Leak/stability CI gate
   - add mandatory CI job that runs soak fixtures repeatedly and fails on memory growth trends
5. Versioned runtime ABI lock
   - introduce runtime ABI versioning and compatibility checks between compiler and runtime artifacts

Future option:
1. Re-evaluate hybrid strategy later if runtime profiling warrants it.
### C3. Object Model
- Class layout and vtable strategy
- Static storage model
- Constructor invocation model
- Expanded execution board: docs/C3_TASK_BOARD.md (tasks C3-01..C3-20, gates C3-G1..C3-G8)
- Current progress: C3-01..C3-20 are `Done (Locked)`.

Deliverable gate for Phase C:
- Non-trivial OOP apps run with stable memory behavior
- Backend stack-frame planner is enabled and validated (no blanket over-allocation in generated prologues)
- Heap/container growth semantics are locked and validated (Array/List/Map resize behavior + OOM/failure contracts)
- ARC ownership and locked cycle strategy behavior are validated by long-run stress/leak gates
- Threading memory model, debug allocator mode, and frame-budget lint gates are implemented and green
- Runtime ABI version compatibility checks are enabled and validated in CI
- C2 exits only when memory management is production-ready (ARC + cycle detector + container growth + OOM/leak/perf gates all green)
---

## Phase D: Toolchain UX and Historical Packaging Archive

- Expanded execution board: `docs/D_TASK_BOARD.md`
- Historical scope note:
  - the Phase D CLI/manifest/build/test work remains part of project history
  - compiler-owned packaging/install/signing work from the old Phase D plan is no longer live project scope
  - the current source of truth for that removal is [COMPILER_PACKAGING_REMOVAL.md](/D:/Programming/codex/PulseCode/docs/COMPILER_PACKAGING_REMOVAL.md)
  - any MSI/WiX/SignTool/package-flow material in the archived Phase D docs is retained as superseded history only, not active contract truth

### D1. CLI UX
- `pulsec new`
- `pulsec check`
- `pulsec build`
- `pulsec test` (future)
- Current progress: D1-01..D1-07 are `Done (Locked)` (see `docs/CLI_COMMAND_CONTRACT.md`).

### D2. Project Format
- `pulsec.toml` project manifest
- dependency metadata (future)
- package/version fields
- Current progress: D2-01..D2-07 are `Done (Locked)` (see `docs/PULSEC_MANIFEST_V1.md`, `docs/PULSEC_MANIFEST_EXAMPLES.md`, and `docs/PROJECT_LAYOUT_CONVENTIONS.md`).

### D3. Historical Packaging / Installer Output
- archived MSI generation pipeline notes
- archived app metadata + installer template notes
- archived signed-build pipeline notes
- these are no longer live compiler scope after `RB-17.1`
- any retained references in `docs/PACKAGING_PIPELINE_CONTRACT.md` or `docs/D_TASK_BOARD.md` are historical only and are superseded by [COMPILER_PACKAGING_REMOVAL.md](/D:/Programming/codex/PulseCode/docs/COMPILER_PACKAGING_REMOVAL.md)
- Current progress: D3-01..D3-05, D4-01..D4-06, and D5-01..D5-05 remain archived closure history only.
- Build-system replacement planning is captured in `docs/BUILD_SYSTEM_EVOLUTION.md` for future TOML -> script DSL migration.

Deliverable gate for Phase D:
- `pulsec build` publishes deterministic native artifacts and plan metadata; installer generation is downstream-tool territory

---

## Phase E: Native Build Modes and Distribution

### E1. Real Shared-Library Native Output
- Expanded execution board: `docs/E1_TASK_BOARD.md`
- keep single-file/fat executable output as a supported mode
- implement true shared-library/native split output (`.exe` + `.dll`) instead of config-only scaffolding
- first shared target: runtime/stdlib as a reusable native library consumed by app executables
- publish runtime/shared libraries under distro layout with deterministic naming
- Current progress: E1 is `Done (Locked)` (see `docs/E1_TASK_BOARD.md`, `docs/E1_SHARED_BUILD_GUIDE.md`, and `docs/E1_CLOSURE_CHECKLIST.md`).

### E2. Runtime Ownership Refactor for Linking Boundaries
- Expanded execution board: `docs/E2_TASK_BOARD.md`
- move runtime-owned metadata/state out of app-owned object storage
- remove backend/runtime dependence on user-object field storage when linking shared runtime artifacts
- define ABI/import boundary between app executables and shared runtime libraries
- Current progress: E2 is `Done (Locked)` (see `docs/E2_TASK_BOARD.md`, `docs/E2_RUNTIME_BOUNDARY_GUIDE.md`, and `docs/E2_CLOSURE_CHECKLIST.md`).

### E3. Fat vs Shared Build Parity
- Expanded execution board: `docs/E3_TASK_BOARD.md`
- lock behavioral parity between fat and shared output modes
- cover debug/release publication rules for both modes
- validate build/publication parity behavior when applications depend on shared libraries
- Current progress: E3 is `Done (Locked)` (see `docs/E3_TASK_BOARD.md`, `docs/E3_PARITY_GUIDE.md`, `docs/E3_PARITY_SUPPORT_MATRIX.md`, `docs/E3_PARITY_EVIDENCE_STRATEGY.md`, `docs/E3_EVIDENCE_INDEX.md`, `docs/E3_CLOSURE_CHECKLIST.md`, `docs/WINDOWS_TOOLCHAIN_MATRIX.md`, `crates/pulsec-cli/tests/e3_parity.rs`, `crates/pulsec-cli/tests/fixture_projects.rs`, `crates/pulsec-cli/tests/stage_locks.rs`, and `crates/pulsec-cli/tests/stage_locks_d.rs`).

Deliverable gate for Phase E:
- `pulsec build` supports both fat executable output and real shared-library/native split output
- shared-library builds publish runnable `.exe` + `.dll` outputs with locked parity against fat mode

---

## Phase F: Language Ecosystem

### F1. Standard Library Expansion
- Expanded execution board: `docs/F1_TASK_BOARD.md`
- `com.pulse.lang.System` / `com.pulse.lang.IO`
- `com.pulse.math`
- `com.pulse.collections`
- `com.pulse.time`
- `com.pulse.util` baseline including `Scanner` and related high-value helpers
- generics baseline is explicitly chosen and documented rather than implied
- exception runtime model is explicitly chosen and documented rather than implied
- threading/memory-model baseline including `Thread`, `Runnable`, monitor semantics, `volatile`, `final` publication policy, atomics, and selected concurrent collections
- selected concurrency/network baselines as explicitly documented F1 policy, including a locked `pulse.concurrent` scope (`Mutex`, `Event`, `Semaphore`, `CountDownLatch`, `Monitor`, `AtomicBoolean`, `AtomicInt`, `AtomicLong`, `AtomicReference`), `Thread`/`Runnable` remaining language-owned, explicit reference publication now raised while concurrent collections/executors stay later, and explicit executor/semaphore plus networking-scope decisions
- `Class` reflection-lite only in F1; full reflection/invocation deferred until after the self-sustained-hosting transition
- game-oriented modules (timing, vectors, ECS helpers)
- integrated conformance, backend/package validation, CI, and performance guardrails for the shipped F1 surface
- F1 stdlib/language growth is for app/runtime completion and self-sustained-hosting readiness; external library/binding ecosystem work remains in Phase F-A
- desktop UI families (`awt` / `swing`) are explicitly deferred until after the self-sustained-hosting transition
- if a bootstrap implementation can live in Pulse stdlib instead of Rust, F1 should prefer the Pulse-owned version and leave Rust with only the compiler/runtime/backend pieces that genuinely cannot move yet
- compiler-owned built-ins such as the current annotation semantics should be treated as temporary bootstrap ownership when a later Pulse-owned implementation path exists
- `stdlib` is the public user-facing library surface, while compiler/runtime/toolchain-only elevated Pulse ownership should move into `authorlib` instead of being left in Rust by default or exposed as ordinary end-user API

### F2. Docs and Developer Experience
- Expanded execution board: `docs/F2_TASK_BOARD.md`
- language specification
- `docs/language/{compiler-backed,runtime-backed,stdlib}` as the canonical language-facing docs tree
- official style guide
- API docs generator
- starter templates
- docs-example conformance, docs maintenance automation, and validation-system reference docs

### F3. Validation Redirect
- `docs/F3_TASK_BOARD.md` is retained only as a redirect note
- former F3 validation/CI/performance scope is absorbed into:
  - `F1` for feature-local conformance, backend/runtime/artifact/package validation, CI, stress, and performance gates
  - `F2` for docs-example validation, docs quality automation, and external-facing validation reference docs

Deliverable gate for Phase F:
- External developers can build production-grade programs on the shipped F1/F2/F-A language and ecosystem surface

---

## Phase F-A: Library Artifacts and Native Bindings

### FA1. Native Library Project Output
- compile library projects to native `.dll`
- emit native import libraries as required by the toolchain
- generate Pulse-facing binding/interface artifacts alongside the native library output
- publish library-project distro as a self-contained folder:
  - `<profile>/<library>.dll`
  - `<profile>/bindings/`
  - binding artifacts are same-name `.pulse` files using an explicit `external` declaration modifier that can extend across supported declaration kinds

### FA2. Compiler + Multi-Project Consumption
- let compiler consume local DLL payloads from `libraries/`
- let compiler consume local binding artifacts from `bindings/`
- support local multi-project/project-to-project builds
- allow dependent projects to build either into fat executables or into shared native outputs depending on build mode
- copy required dependent DLL payloads into final application distro output during publish/package steps

### FA3. Native Binding Artifacts
- add separate native DLL binding artifacts for C/C++/Rust interop
- keep Pulse-generated/shared outputs native
- let tooling/compiler consume explicit binding contracts for foreign DLLs
- use the same binding model for Pulse-authored native libraries and external native libraries

### FA4. Annotation Processor Runtime And Pulse-Owned Annotation Migration
- add a real annotation processor runtime/backend contract instead of keeping annotation execution permanently compiler-owned
- allow Pulse-authored annotation processors and generated-source/code-shaping workflows where the backend contract permits them
- migrate current built-in annotations such as `@Override`, `@NotNull`, and `@Test` out of bootstrap compiler ownership when the processor/runtime model is strong enough
- support annotation-heavy user workflows as a first-class target, including the long-term path toward Lombok-style annotations in Pulse
- keep the ownership split honest during the migration:
  - F1/F2 document bootstrap compiler-owned annotation behavior
  - F-A completes the runtime/backend/processor side needed for Pulse-owned implementations

Reference:
- `docs/LIBRARY_ARTIFACT_STRATEGY.md`

Deliverable gate for Phase F-A:
- PulseCode supports native library project outputs plus generated Pulse binding artifacts, has a locked path for multi-project fat/shared builds and external native DLL bindings, and has an explicit annotation-processor execution/migration model for Pulse-owned annotation workflows

---

## Phase F-B: Self-Sustained Elevation Inventory

- Expanded execution board: `docs/FB_TASK_BOARD.md`
- carry-forward input tracker: `docs/FB_CARRY_FORWARD_TRACKER.md`
- inventory the whole compiler/runtime/tooling program and classify what is already Pulse-owned, what must remain below the host/bootstrap or adapter boundary, and what still needs to be elevated into Pulse for a truthful self-sustained transition
- lock the `stdlib` vs `authorlib` split:
  - `stdlib` remains the public user-facing library
  - `authorlib` becomes the privileged Pulse-owned extension library for compiler/runtime/toolchain authoring work
- define the compiler/runtime access rule that `authorlib` must always be available to compiler/runtime builds even when it is not enabled as a normal user project dependency
- publish the readiness checklist for what must move out of Rust before Phase G can honestly claim a self-sustained-hosting transition

Deliverable gate for Phase F-B:
- PulseCode has a truthful `F-B` inventory/elevation plan for the remaining Rust-to-Pulse ownership transition, including the locked `stdlib`/`authorlib` split and the Phase G readiness checklist

---

## Phase G: Self-Sustained-Hosting Transition

### G1. Compiler Chain Reimplementation in PulseCode
- Rebuild the compiler chain in PulseCode, not just the frontend
- Include parser, semantic analysis, lowering, backend/codegen, and the compiler-owned tooling/runtime pieces that belong in the self-sustained chain
- Keep the Rust compiler/toolchain as the bootstrap/reference compiler until the PulseCode compiler chain is proven

### G2. Dual-Compiler Validation
- compile same test corpus with both compilers
- AST/IR/backend-artifact equivalence checks where feasible
- verify that the PulseCode-hosted backend/codegen path is part of the self-sustained chain rather than still being a hidden Rust-owned dependency

### G3. Bootstrap Chain
- Compiler0 (Rust) compiles Compiler1 (PulseCode)
- Compiler1 compiles itself to produce Compiler2
- verify reproducibility and behavior consistency

### G4. Runtime/Ownership Transition
- move runtime and bootstrap ownership into PulseCode wherever that ownership does not genuinely need to remain in a thin host/bootstrap shell
- move Pulse-ownable compiler/runtime/tooling helpers into `stdlib` or `authorlib` rather than leaving them in Rust by inertia
- leave non-Pulse host code only where it is still truly required by the launch/build boundary

Deliverable gate for Phase G:
- PulseCode has a self-sustained compiler chain in PulseCode, including frontend, lowering, backend/codegen, `stdlib`, `authorlib`, and the owned runtime/tooling pieces required to build and run real programs reliably while Rust is reduced to the defended host/bootstrap and target-adapter boundary

---

## Phase H: Post-Self-Sustained Conformance and Regression Architecture

### H1. Replace Milestone Locks with Long-Lived Behavioral Conformance
- keep milestone/roadmap locks only as transition scaffolding where they still add value
- establish durable language conformance suites that are not tied to phase/task IDs
- establish durable stdlib conformance suites that lock the public API and behavior of shipped classes
- establish durable runtime conformance suites for allocation, ARC, weak handles, exceptions, traces, containers, IO, and platform boundaries
- ensure the post-self-sustained transition test surface answers "does Pulse still behave correctly?" rather than only "did roadmap item X stay closed?"

### H2. Self-Sustained Compiler and Runtime Regression Harness
- add self-sustained compiler regression suites that exercise parsing, checking, lowering, codegen, and artifact publication from inside the Pulse-owned compiler chain
- add bootstrap equivalence tests between the bootstrap compiler and the self-sustained compiler where those comparisons remain useful
- lock compiler/runtime behavior independently from roadmap-specific closure docs
- keep black-box CLI, fixture-project, packaging, and install/uninstall tests as long-lived behavior contracts

### H3. Stress, Performance, and Non-Functional Guardrails
- promote stress/soak, memory-trend, packaging, and artifact validation suites into the permanent post-roadmap test architecture
- add performance/budget thresholds that are owned by the product rather than by milestone evidence
- define flaky-test policy and regression triage policy for the self-sustained era

Deliverable gate for Phase H:
- PulseCode has a permanent self-sustained conformance/regression architecture that locks compiler, runtime, `stdlib`, `authorlib`, CLI, packaging, and non-functional behavior independently of milestone-roadmap closures

---

## Phase I: Independence Hardening

### I1. Dependency Reduction
- Minimize or remove non-essential Rust dependencies
- own core runtime and tooling in PulseCode where practical

### I2. Release Engineering
- deterministic builds
- reproducible package outputs
- cryptographic signing/release verification

### I3. Governance and Versioning
- language version policy
- compatibility guarantees
- deprecation policy

Final gate:
- Standalone release channel with PulseCode-native compiler/runtime toolchain

---

## Priority Stack for Immediate Next Iterations
1. Multi-file/package resolution and symbol graph completion (cross-file visibility/package validation + import semantics hardening)
2. Diagnostics pass finalization (source spans/error codes)
3. `build` command foundation + IR emission
4. Runtime bootstrap for strings/io/object model
5. Native executable output

## Risk Areas to Manage Early
- GC/runtime architecture churn if delayed too long
- IR design instability if language features outpace backend
- import/package design drift without early multi-file support
- installer pipeline complexity if build metadata format not stabilized








