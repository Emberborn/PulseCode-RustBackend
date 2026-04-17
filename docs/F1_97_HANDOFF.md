# F1-97 Handoff

This is the focused resume brief for the current `F1-97` lane.
Use this as the new-chat entry point, then follow the linked live docs and code.

## What `F1-97` Is Now

`F1-97` is no longer a narrow "compiler-host helper" task.

It now owns the first real self-host / self-sustained transition slice:

- define the `pulse.*` public stdlib boundary
- define the `author.*` privileged authoring boundary
- move compiler/runtime/systems-ownable support inward into Pulse
- leave the project able to compile a Pulse-authored compiler/runtime with the Rust-built Pulse compiler while the lift is still in progress
- finish `F1-97` with Pulse owning enough that Rust can be dropped entirely if desired
- treat any remaining Rust role at `F1-97` close as bootstrap-only residue, not owned product logic

Project rule:

- if something can be expressed in Pulse, move it now and keep both implementations current
- if it cannot yet be expressed in Pulse, add what is missing, then move it
- do not defend Rust ownership just because a subsystem looks bootstrap-shaped
- when lifting a feature, inspect the existing `pulse.*` / `author.*` surface first and prefer reusing or minimally extending that surface over rewriting parallel helpers

Explicit `F1-97` close bar:

- Rust owns nothing in the normal product/compiler/runtime/toolchain path
- Pulse owns the compiler, runtime, toolchain, and supporting authoring surface end-to-end
- at the end of `F1-97`, you should be able to walk away from Rust completely if you want to
- Rust may still exist as emergency bootstrap fallback for later feature lifts, but that is outside the claimed ownership state of a closed `F1-97`
- `F1-97` is the real self-sustaining point; Phase G is the formal "Rust can leave now" cleanup step, not the first moment self-sustaining becomes true

## What Is Already Done

### Current F1 surface context still matters here

`F1-97` is not working against an empty or parser-only language.

Important current F1 truths to carry into this lane:

- Pulse already has a real executable Java-close baseline across parser, semantics, lowering, runtime, and fixture validation for the shipped subset
- mainstream language surface already real includes:
  - packages/imports/static imports
  - classes/interfaces/inheritance/constructors/fields/methods
  - `this`, `super`, `abstract`, `final`, and real override validation
  - control flow such as `if`, `while`, `do-while`, `for`, `switch`, `break`, `continue`, and `return`
  - explicit casts, `instanceof`, arrays, foreach, ternary, bitwise/shift operators, local `var`, and the current erased-runtime generics baseline
  - shipped exception flow baseline including `throw`, `try` / `catch` / `finally`, and declaration-form try-with-resources
- current public stdlib surface already exists under:
  - `pulse.lang`
  - `pulse.collections`
  - `pulse.io`
  - `pulse.math`
  - `pulse.time`
  - `pulse.util`
  - `pulse.rt`
- current practical `pulse.util` baseline already includes reusable helpers such as:
  - `Objects`
  - `Arrays`
  - `StringTokenizer`
  - `Scanner`
  - `StringJoiner`
  - `Optional`
  - `Properties`
  - `TextCursor`

This means `F1-97` work should assume a meaningful shipped language/library
surface and should extend or lift through that surface where possible rather
than behaving as if the compiler still only supports a tiny bootstrap subset.

### Ownership split and package roots

- public stdlib root is now `pulse.*`
- privileged authoring root is now `author.*`
- `author.*` is the authorlib surface for compiler/runtime/toolchain/systems work

### Authorlib enablement

- documented in [AUTHORLIB_ENABLEMENT_CONTRACT.md](/G:/Programming/Rust/PulseCode/docs/AUTHORLIB_ENABLEMENT_CONTRACT.md)
- ordinary user projects must opt in through:
  - `[authorlib]`
  - `enabled = true`
- compiler/runtime/toolchain flows are intended to resolve `author.*` without treating it as ordinary public stdlib

### First authorlib seed package

- [ProjectLayout.pulse](/G:/Programming/Rust/PulseCode/stdlib/src/author/project/ProjectLayout.pulse)
- [ManifestPackage.pulse](/G:/Programming/Rust/PulseCode/stdlib/src/author/project/ManifestPackage.pulse)
- [ProjectSources.pulse](/G:/Programming/Rust/PulseCode/stdlib/src/author/project/ProjectSources.pulse)
- [BuildLayout.pulse](/G:/Programming/Rust/PulseCode/stdlib/src/author/project/BuildLayout.pulse)
- [ProjectManifest.pulse](/G:/Programming/Rust/PulseCode/stdlib/src/author/project/ProjectManifest.pulse)
- [ProjectDiscovery.pulse](/G:/Programming/Rust/PulseCode/stdlib/src/author/project/ProjectDiscovery.pulse)

This proves the `author.*` root is real before larger migrations land and gives
`author.project.*` a first actual model slice.

The current `author.project.*` seed now covers:

- manifest package/workspace/authorlib/source/build models
- manifest parsing and validation through `ProjectManifestParser`
- manifest/layout/path resolution through `ProjectLayoutResolver`
- filesystem-backed manifest lookup/loading, workspace-member validation, entry discovery, and test-file discovery through `ProjectDiscovery`
- Pulse-owned check/test invocation models and resolution through `CheckInvocation`, `TestInvocation`, and `ProjectInvocationResolver`
- Pulse-owned workspace context modeling and bridge formatting through:
  - `author.project.WorkspaceContext`
  - `author.project.WorkspaceContextBridge`
- Rust `check` / `build` / `test` workspace detection now prefers authored `ProjectDiscovery.resolveWorkspaceContext(...)` instead of keeping workspace-member resolution as a Rust-owned hot path
- build-side invocation/config models now live under `author.build.*` through `BuildConfig`, `BuildInvocation`, and `BuildInvocationResolver`
- `author.build.*` now also owns workspace-build execution/result contracts through:
  - `author.build.WorkspaceBuildResult`
  - `author.build.WorkspaceBuildMemberResult`
  - `author.build.BuildSummaryWriter.renderWorkspaceBuild*`
- Rust `build` workspace output now prefers authored start/member/summary/failure rendering instead of raw inline workspace-build strings
- backend wrapper/reference truth now also matters here:
  - wrapper-typed calls are not all the same at runtime
  - pseudo-wrapper helpers like `Integer.valueOf(...)` still travel on primitive lanes
  - collection/reference reads like `List<Integer>.get(...)` and `Queue<Integer>.remove()` can be compile-time wrapper types while still carrying real boxed-object handles
  - backend boxing/unboxing decisions must preserve that distinction instead of treating every wrapper-typed call result the same

### Authorlib package taxonomy is now part of the lane

`author.*` should not grow as one generic "internal" bucket.

The selected direction is to keep clean domain packages such as:

- `author.project.*`
- `author.build.*`
- `author.toolchain.*`
- `author.compiler.*`
- `author.runtime.*`
- `author.memory.*`
- `author.system.*`

Avoid vague package shapes such as:

- `author.internal.*`
- `author.misc.*`
- `author.program.*`

Rule:

- place migrated code into the intended long-term domain package immediately
- do not land broad temporary `author.*` buckets and promise to sort them out later

### Import validation no longer uses hand-maintained builtin registries

- CLI/project import validation now resolves `pulse.*` and `author.*` imports against the real stdlib tree
- hardcoded builtin package/class tables were removed from CLI validation

Relevant file:

- [project/mod.rs](/G:/Programming/Rust/PulseCode/crates/pulsec-cli/src/cli/project/mod.rs)

### Prelude/default-import contract is now centralized

Shared compiler-owned prelude contract:

- [prelude.rs](/G:/Programming/Rust/PulseCode/crates/pulsec-core/src/prelude.rs)

Current implicit prelude packages:

- `pulse.io`
- `pulse.math`
- `pulse.collections`
- `pulse.lang`

Semantic resolution now uses that one shared contract:

- [semantics/mod.rs](/G:/Programming/Rust/PulseCode/crates/pulsec-core/src/semantics/mod.rs)
- [type_resolution.rs](/G:/Programming/Rust/PulseCode/crates/pulsec-core/src/semantics/types/type_resolution.rs)

### Current project surface is now a real contract too

The lifted author/project work must match the public project/tooling surface
that already exists today.

Important current project-surface facts:

- public CLI commands are:
  - `pulsec new`
  - `pulsec check`
  - `pulsec build`
  - `pulsec test`
  - `pulsec help`
  - `pulsec version`
- canonical public targets are:
  - `windows-x64`
  - `pulseos-x64`
  - `linux-x64`
  - `macos-arm64`
- `native-x64` is retired from the public CLI/manifest surface
- compiler-owned packaging/install generation is removed from `pulsec`
- manifest v1 public sections are:
  - `[package]`
  - `[sources]`
  - `[build]`
  - `[toolchain]`
  - `[workspace]`
  - `[authorlib]`
- default project layout is the current Gradle-style tree:
  - `src/main/pulse`
  - `src/main/resources`
  - `src/test/pulse`
  - `src/test/resources`
  - `src/api/pulse`
  - `src/api/resources`
  - `docs`
  - `libraries`
  - `build/{asm,generated,assets,sanity,tmp,distro}`
- stdlib docs are generated from source PulseDoc into `docs/language/stdlib/pulse/**`

`author.project.*` manifest/layout work should therefore model the shipped
public project surface truthfully instead of inventing an alternate internal
layout or manifest shape.

### Pulse-side test model has started becoming real

Policy doc:

- [PULSE_TEST_MODEL.md](/G:/Programming/Rust/PulseCode/docs/PULSE_TEST_MODEL.md)

First concrete Pulse-side feature-lock homes:

- [prelude_contract.rs](/G:/Programming/Rust/PulseCode/crates/pulsec-core/src/tests/prelude_contract.rs)
- [pulse_feature_locks.rs](/G:/Programming/Rust/PulseCode/crates/pulsec-cli/tests/pulse_feature_locks.rs)

This means the Pulse-side suite is no longer only a planning idea.

### Planning/docs already updated

- [F1_TASK_BOARD.md](/G:/Programming/Rust/PulseCode/docs/F1_TASK_BOARD.md)
- [CODEX_HANDOFF_PHASE_F.md](/G:/Programming/Rust/PulseCode/docs/CODEX_HANDOFF_PHASE_F.md)
- [F1_97_BOOTSTRAP_OWNERSHIP_MAP.md](/G:/Programming/Rust/PulseCode/docs/F1_97_BOOTSTRAP_OWNERSHIP_MAP.md)
- [AUTHORLIB_STRATEGY.md](/G:/Programming/Rust/PulseCode/docs/AUTHORLIB_STRATEGY.md)
- [AUTHORLIB_ENABLEMENT_CONTRACT.md](/G:/Programming/Rust/PulseCode/docs/AUTHORLIB_ENABLEMENT_CONTRACT.md)
- [PULSE_TEST_MODEL.md](/G:/Programming/Rust/PulseCode/docs/PULSE_TEST_MODEL.md)

## What Still Needs To Be Done

### Immediate next implementation target

Start the first real inward migration wave under `author.*`:

1. keep the `author.*` package taxonomy clean while migrating
2. expand `author.project.*` manifest/workspace/project/layout model and parser coverage
3. stand up `author.project.*` source/resource/build-root resolution helpers
4. map compiler/runtime-facing resource lookup policy into the right `author.*` domain package

Current immediate continuation inside that target:

- `author.project.*` now owns the first check/test invocation-shaping slice
- `author.build.*` now owns the first Pulse-side build invocation/config model slice
- `author.toolchain.*` now owns the first real toolchain precedence slice through `ToolchainConfig` and `ToolchainConfigResolver`
- `author.toolchain.*` now also owns the first host-toolchain candidate-ordering slice through:
  - `ToolchainCandidatePlan`
  - `ToolchainDiscoveryResolver.planCandidates(...)`
- `author.toolchain.*` now also owns the first host-tool discovery-graph slice through:
  - `ToolchainDiscoveryPlan`
  - `ToolchainDiscoveryResolver.planWindowsDiscovery()`
- `author.toolchain.*` now also owns the first host-tool probe-execution slice through:
  - `ToolchainDiscoveryResult`
  - `ToolchainDiscoveryResolver.probeWindowsDiscovery(...)`
- `author.toolchain.*` now also owns the first host-toolchain command-shaping slice through:
  - `ToolchainCommandPlan`
  - `ToolchainResolver.planWindowsExecutableLinkCommand(...)`
  - `ToolchainResolver.planWindowsSharedRuntimeLinkCommand(...)`
  - `ToolchainResolver.planWindowsSharedAppLinkCommand(...)`
  - `ToolchainResolver.renderResponseFileBody(...)`
- next outward/public-first continuation:
  - public process/env execution is now moved outward into `pulse.process.*`
  - the first public host-filesystem materialization seam is now also real under `pulse.io.HostFiles`
  - `author.toolchain.*` now crosses into both of those public surfaces instead of keeping private first-homes
  - next return point is the remaining `author.build.*` publication/materialization lift
  - that lift now also owns binary-safe filtered artifact staging through `author.build.BuildPublicationWriter.copyRecursiveMatchingExtension(...)`, so normal `asm` / `obj` staging no longer depends on Rust-owned filtered recursion in the hot path
  - while doing that build lift, expand the host-facing public filesystem substrate where needed so build/toolchain host file materialization can cross through honest public `pulse.io.*` surface instead of remaining authorlib-only wrappers
  - `ToolchainResolver.responseFileArgument(...)`
- `author.toolchain.*` now plans host env/process execution through the public `pulse.process.*` surface:
  - `ProcessEnvironmentVariable`
  - `ProcessEnvironment`
  - `ProcessPlan`
  - `ToolchainResolver.mergeEnvironment(...)`
  - `ToolchainResolver.planResponseFileProcess(...)`
  - `ToolchainResolver.planWindowsMasmAssembleProcess(...)`
- `author.toolchain.*` now also owns the first host-filesystem response-file materialization slice through:
  - `ToolchainHostFilesystem.writeResponseFile(...)`
  - public `pulse.io.HostFiles.createDirectories(...)`
  - public `pulse.io.HostFiles.writeAllText(...)`
- `author.build.BuildInvocation` now carries a real `ToolchainConfig` instead of a loose assembler/linker pair
- the Rust CLI still remains the execution authority for actual build invocation today, so the next coherent donor slice is wiring more of `resolve_build_invocation(...)` and later tool execution/planning onto the new Pulse-owned surface rather than keeping the merge logic duplicated
- current progress in that donor slice:
  - Rust `resolve_build_invocation(...)` has been tightened to follow the locked `author.build.BuildInvocationResolver` contract more closely for:
    - direct-mode source-root anchoring under the resolved project root
    - manifest output-mode alias normalization (`single_exe` -> `fat`, `exe_with_dlls` -> `shared`)
    - effective toolchain precedence in the resolved model (`CLI override > manifest`)
  - the Rust build path no longer re-merges `flags.linker` / `flags.assembler` on top of an already-resolved build invocation; resolved toolchain state is now authoritative once build resolution completes
  - the Rust-to-Pulse execution bridge for build resolution is now landed and cached for regressions; Rust is still the execution authority for backend/tool execution, but build-resolution truth now runs through the Pulse-owned bridge by default instead of living only in Rust
  - Rust tool execution now also has the first shared env/process helper path through process-plan mirrors in `toolchain_linking.rs`, and `ml64.exe` invocation in the backend now routes through that plan/runner shape instead of open-coded `Command::new(...)` calls
  - bridge bootstrap now tolerates the current Windows cold-link race more honestly:
    - linker response files are unique per materialization attempt
    - cold bridge prewarm retries transient `main.exe` output locking long enough to survive current host contention
  - build publication/materialization now also has a Pulse-owned filtered staging slice:
    - `BuildPublicationWriter.copyRecursiveMatchingExtension(...)`
    - Rust `cli/build/mod.rs` now uses that bridge-first path for recursive `asm` and `obj` staging
    - sibling `main.asm` publication now also routes through the same bridge-first copy path instead of bypassing it with direct `fs::copy`
  - build publication/materialization now also has a Pulse-owned publication path/layout planning slice:
    - `BuildPublicationPlan`
    - `BuildPublicationPlanBridge`
    - `BuildPublicationWriter.resolvePublicationPlan(...)`
    - Rust `cli/build/mod.rs` now consumes that plan for:
      - published diagnostic targets (`pulsec.ir.txt`, `native.plan.json`, `native.link.txt`)
      - published object path placement
      - published executable/runtime/import-library placement
      - published assets target root
      - shared launch metadata location
      - artifact stamp path
      - build config plan path
  - build publication/materialization now also has a Pulse-owned layout/config write slice:
    - `BuildPublicationWriter.ensureLayoutRoots(...)`
    - `BuildPublicationWriter.materializeBuildLayout(...)`
    - `BuildPublicationWriter.writeBuildConfigPlan(...)`
    - Rust `cli/build/mod.rs` now uses bridge-first authored layout materialization for:
      - `build/asm`
      - `build/generated`
      - `build/assets`
      - `build/sanity`
      - `build/tmp`
      - emitted `asm` / `obj` staging
      - copied published object placement into `generated`
      - `main_resources_root` copy into published assets
      - `main_pulse_root` copy into `sanity/src_main_pulse`
    - Rust `cli/build/mod.rs` now also uses bridge-first authored build-config-plan writing instead of open-coding the JSON body in the hot path
  - build result/status shaping now also has a Pulse-owned summary slice:
    - `author.build.BuildSummaryWriter.renderBuildSummary(...)`
    - Rust `cli/build/mod.rs` now prefers authored summary rendering for the normal build CLI output and only falls back to the old Rust string assembly if the bridge is unavailable
  - build artifact publication execution now also has a Pulse-owned result slice:
    - `author.build.BuildPublishedArtifact`
    - `author.build.BuildPublishedArtifactBridge`
    - `author.build.BuildPublicationWriter.publishArtifacts(...)`
    - Rust `cli/build/mod.rs` now prefers authored artifact publication execution and only falls back to the old Rust copy/write path if the bridge is unavailable
  - post-emit authored build sequencing now also has a Pulse-owned finalization slice:
    - `author.build.BuildPublicationWriter.finalizeBuildBridgeText(...)`
    - this now owns the normal hot-path sequence for:
      - layout materialization
      - publication-plan resolution
      - artifact publication
      - build-config-plan writing
      - artifact-stamp writing
  - compiler-facing check/status shaping now also has a first live `author.compiler.*` slice:
    - `author.compiler.CheckSummaryWriter`
    - `author.compiler.CheckResult`
    - `CheckSummaryWriter` now renders a structured authored check result instead of separate success/failure tuple entrypoints
    - Rust `pulsec check` / workspace-check status rendering now prefers that authored surface through the cached bridge and falls back to Rust string assembly only if the bridge is unavailable
  - compiler-facing test/discovery shaping now also has a second live `author.compiler.*` slice:
    - `author.compiler.TestSummaryWriter`
    - `author.compiler.TestResult`
    - `author.compiler.TestDiscoveryResult`
    - `TestSummaryWriter` and `TestDiagnosticWriter` now render structured authored test result state for summary/aggregate-failure text instead of loose summary tuples
    - `TestSummaryWriter` and `TestDiagnosticWriter` now also render structured authored test discovery success/failure state instead of loose discovery path/detail tuples
    - Rust `pulsec test` / workspace-test discovery and summary lines now prefer that authored surface through the cached bridge and fall back to Rust string assembly only if the bridge is unavailable
  - compiler-facing test diagnostic text now also has a third live `author.compiler.*` slice:
    - `author.compiler.TestDiagnosticWriter`
    - Rust `pulsec test` now prefers that authored surface for:
      - test discovery failure text
      - no-tests-found text
      - workspace member no-tests-found text
      - aggregate `one or more tests failed` / `one or more workspace tests failed` text
  - `author.project.*` now also owns more of the hot `pulsec check` / `pulsec test` path through bridge-first contracts:
    - `author.project.CheckInvocationBridge`
    - `author.project.TestInvocationBridge`
    - `author.project.ProjectDiscoveryBridge`
    - Rust `resolve_check_invocation(...)`, `resolve_test_invocation(...)`, and test-file discovery now prefer those authored project contracts and only fall back to the older Rust path if the bridge is unavailable
  - `author.compiler.*` now also owns workspace check/test aggregation models:
    - `author.compiler.WorkspaceCheckResult`
    - `author.compiler.WorkspaceTestResult`
  - `author.compiler.*` now also owns workspace member and test execution outcome models:
    - `author.compiler.WorkspaceCheckMemberResult`
    - `author.compiler.TestExecutionResult`
    - `author.compiler.TestExecutionWriter`
  - Rust CLI check/test loops now prefer authored rendering for workspace-member check outcomes and single/workspace test pass/fail lines instead of assembling raw `[PASS]` / `[FAIL]` text inline
    - workspace check/test start/summary/failure rendering now routes through authored workspace result models instead of raw Rust counters and fixed strings
  - remaining Rust-owned build publication/materialization residue is now:
    - fallback/bootstrap publication-plan mirroring
    - fallback/bootstrap layout materialization mirroring
    - fallback/bootstrap build-config-plan writing
    - broader build pipeline sequencing around the still-Rust compiler/backend loop in `cli/build/mod.rs`
    - cold bridge bootstrap retry handling for transient split-output file locks

Important current compiler truth:

- same-package eager file loading in the CLI project loader has been removed
- importing one class no longer drags every sibling file in that package into the compile
- same-package no-import resolution is now demand-driven instead
- the new env/process slice exposed and fixed two real compiler bugs:
  - IR lowering must preserve declared generic return types long enough to substitute owner type parameters during nested call inference; erasing `List<T>.get(int)` too early broke valid chains such as `values.get(index).name().toLowerCase()`
  - semantic/logical expression validation must not recurse one stack frame per `&&` / `||` node across long authorlib contract expressions; the logical-chain visitors in semantics/nullability/lowering are now flattened enough for the large authorlib surface lock to pass honestly
- the first live `author.compiler` bridge slice exposed one more backend truth:
  - the cached bridge rebuild could still push ML64/LINK into object string-table corruption under symbol pressure
  - tightening the global MASM identifier cap further in `backend/support/naming.rs` stabilized that bridge rebuild without backing the compiler slice out
- the next live `author.compiler` slices exposed one more bridge-bootstrap truth:
  - cold `__prewarm-author-build-bridge` could still fail even after the cached bridge executable became usable moments later
  - `prewarm_author_build_bridge_runner()` now retries the ensure path and accepts a now-available cached exe after transient output-lock failures instead of exiting too eagerly
- the later authored compiler discovery lift exposed one more bridge-structure truth:
  - the generated cached bridge dispatcher had become too large to trust as one giant `bridge.internal.Main.main()` body
  - compiler render branches are now routed through helper methods inside the generated bridge source instead of keeping all compiler render paths inline in `Main.main()`
- the widened authored project bridge slice exposed one more bootstrap/testing truth:
  - cold author-bridge prewarm can still fail transiently while another test process is finishing the cached bridge build
  - `tests/common/mod.rs` now retries `__prewarm-author-build-bridge` instead of treating the first transient cold-build failure as terminal
  - the integration-test helper also now captures transient failed prewarm stderr/stdout instead of leaking noisy cold-build failures into otherwise passing test output

Current parser-direction rule for this slice:

- where parser work is needed, prefer reusable cursor-driven helpers such as `pulse.util.TextCursor`
- avoid growing a second long-term ad hoc parser style inside `author.project.*` if the same work can be expressed through shared text/cursor infrastructure
- before adding a lifted helper or parser path, check whether the needed surface already exists in `pulse.*` or `author.*` and lift through that surface instead of rewriting it beside the existing library code

### Regression lessons from the current F1-97 sweep

The latest regression cleanup established several important project truths that
must carry forward into the next push:

- same-package resolution is on-demand only:
  - importing or referencing one class must not eagerly drag the whole package
  - package-local sibling classes should resolve without imports when referenced
  - unreferenced sibling files should not compile just because they share a directory
- backend/runtime bugs are now being exposed by more truthful Pulse ownership:
  - lazy static object-field initialization must construct objects with a null receiver so runtime-owned statics like `System.in`, `System.out`, `System.err`, and `UUID.DEFAULT_RANDOM` initialize correctly
  - same-class constructor calls must only reuse current `this` for actual constructor delegation inside constructors; ordinary instance methods calling `new SameClass(...)` must allocate a fresh object
  - 64-bit object-handle/null-guard codegen is the real lock now; do not preserve old 32-bit `ecx` assumptions in backend tests
- `pulse.util.TextCursor` `tryRead*` helpers are now expected to be peek-style/non-consuming when they succeed:
  - `tryReadQuotedString`
  - `tryReadIdentifier`
  - `tryReadDigits`
  - `tryReadNumberToken`
  - consuming behavior belongs in the corresponding `read*` helpers
- collection helpers must report mutation truthfully, not just mutate correctly:
  - `HashSet.retainAll(...)` was fixed because it could change contents while still returning `false`
- test/lock cleanup rule reinforced by this sweep:
  - when a regression comes from a stale expectation that was only locking broken bootstrap behavior, fix or rewrite the test to lock the intended contract
  - when the regression comes from a real compiler/backend/runtime/stdlib bug, fix the bug directly and keep the lock honest
- failure-path fixture rule:
  - failure fixtures should still require the real terminal diagnostic
  - the harness may be hardened against RustRover/Windows child-process teardown weirdness, but the expected failure payload itself should not be weakened

Explicitly deferred until `F1-97` closeout / later follow-on:

- shared structured diagnostics with one optional short flavor line ahead of stable fields such as `Error:`, `Detail:`, `Expected:`, `Found:`, and `Hint:`
- do not inject that tone ad hoc into current parser or manifest helpers; record and sync it through the later shared diagnostic-formatting pass instead

The first Rust donor modules to map against:

- [cli/config/mod.rs](/G:/Programming/Rust/PulseCode/crates/pulsec-cli/src/cli/config/mod.rs)
- [cli/manifest/mod.rs](/G:/Programming/Rust/PulseCode/crates/pulsec-cli/src/cli/manifest/mod.rs)
- [cli/testing/mod.rs](/G:/Programming/Rust/PulseCode/crates/pulsec-cli/src/cli/testing/mod.rs)
- [cli/build/mod.rs](/G:/Programming/Rust/PulseCode/crates/pulsec-cli/src/cli/build/mod.rs)
- [cli/project/mod.rs](/G:/Programming/Rust/PulseCode/crates/pulsec-cli/src/cli/project/mod.rs)

### What `authorlib` is expected to absorb

Not all at once, but under the current project rule these are not protected Rust territory:

- filesystem access helpers
- process/env helpers
- project/workspace/manifest helpers
- source/resource/build layout helpers
- toolchain invocation surfaces
- artifact/publication helpers
- compiler/runtime systems support that should live in Pulse

Preferred package homes:

- `author.project.*` for manifest/workspace/layout/discovery
- `author.build.*` for build layout and publication helpers
- `author.toolchain.*` for process/env/tool invocation
- `author.compiler.*` for compiler-only support
- `author.runtime.*` for runtime-only support
- `author.memory.*` and `author.system.*` for sharper advanced-control surfaces

### What should remain public stdlib

General-purpose surfaces stay in `pulse.*`, even if the compiler uses them:

- text/token helpers
- general IO/path/file helpers
- collections/util/math/time surfaces

Still-relevant F1 fence reminders while doing `F1-97` work:

- full reflection/invocation is not current-scope shipped surface
- desktop UI (`awt` / `swing`) is not F1 scope
- threading/concurrency/networking beyond the currently shipped baseline should not be implied accidentally
- reserved-but-unsupported modifiers/features still do not count as real support until semantics/runtime are shipped

### What should stay out of public stdlib

Sharp compiler/runtime/systems APIs should move into `author.*`, not leak into ordinary user-facing stdlib.

## Recent Bridge Truths

- The author build bridge is now explicit-cache / explicit-prewarm for tests.
- Do not hide cold bridge compilation inside ordinary `pulsec build` / `check` resolution during regressions; that destroys Cargo/RustRover visibility.
- Integration tests now prewarm the bridge visibly through `pulsec __prewarm-author-build-bridge` and then reuse `target/author_build_bridge`.
- Ordinary Rust build-resolution code reuses the cached bridge runner and falls back if the bridge is unavailable; it no longer silently recompiles the bridge runner on demand.
- Bridge cache invalidation now keys off a shared source-tree fingerprint (`pulsec-cli`, `pulsec-core`, `stdlib`) instead of the current Rust test executable fingerprint, so unit/integration test binaries do not fight over the cache.
- Bridge cache locking now writes owner metadata and reclaims stale/orphaned lock directories instead of leaving `target/author_build_bridge/lock` able to brick later prewarms after a crash.
- Rust build publication now carries both:
  - internal `buildRoot`
  - published `outputRoot`
- Do not collapse those again. Internal backend/tmp/materialization lives under `build/*`; published profile outputs live under `outputRoot` (`build/distro/<profile>` or shared `bin` / `metadata` under that root).
- A real authorlib bug was fixed in `ProjectManifestParser`: absent `out_dir` must remain absent. `resolveAgainstProject(null)` must not turn into the project root, or manifest publication collapses to the wrong root.
- A real stdlib bug was fixed in `pulse.io.Path`: normalized Windows drive paths like `C:/...` must be treated as absolute. The path model still keeps the existing `Path.combine(\"tmp\\\\\", \"/a.txt\") -> \"tmp/a.txt\"` contract; only Windows drive-root absolutes short-circuit path resolution.
- A real backend ownership bug was fixed in MASM lowering: ordinary call results stored into ARC locals were being over-retained by default. That was wrong for owned call results like `String.valueOf(...)`, and it was the real cause of both the weak-reference lock drift and the later `pulse.io.Path` runtime dispatch failure. Store-time ARC retain now comes from the existing targeted retain heuristics instead of a blanket `Call => retain` rule.
- A second real MASM ARC ownership bug was fixed in method return lowering: ARC-managed alias-like returns (`this`, locals, member access, and alias-returning calls such as `String.replace(...)` no-op fast paths) must be retained before method exit so callers receive an owned result. Without that, repeated no-op `replace(...)` chains could return stale handles and break the author build bridge when serializing unchanged path strings.
- Toolchain truth is no longer split between Pulse and Rust build execution:
  - Pulse-side precedence now lives in `author.toolchain.ToolchainConfigResolver`
  - `author.build.BuildInvocation` now carries a real `ToolchainConfig`
  - Rust build execution consumes the resolved `assembler` / `linker` values and no longer reapplies CLI overrides after resolution
- Toolchain discovery policy has started moving inward too:
  - Pulse now owns ordered candidate-planning policy for linker and adjacent `ml64.exe` discovery through `ToolchainCandidatePlan` and `ToolchainDiscoveryResolver.planCandidates(...)`
  - Pulse now also owns the discovery-graph shape (`ToolchainDiscoveryPlan`, `ToolchainDiscoveryResolver.planWindowsDiscovery()`) that Rust probes as the host safety-net
  - Pulse now also executes the first real Visual Studio / Windows SDK probe walk itself through `ToolchainDiscoveryResolver.probeWindowsDiscovery(...)` on top of host-backed `pulse.io.Files`
  - the current Rust backend still performs the remaining host-specific probes (`PULSEC_LINKER`, Visual Studio scanning, path existence checks)
  - cold bridge bootstrap must keep a Rust fallback for Visual Studio / Windows SDK probing; otherwise bridge prewarm recurses back into the bridge before the cache exists
  - Rust `toolchain_linking.rs` now has focused lock tests that must stay aligned with the Pulse-owned candidate ordering
- Toolchain command shaping has started moving inward too:
  - Pulse now owns ordered Windows linker command-plan and response-file formatting policy through `ToolchainCommandPlan` and the new `ToolchainResolver` planning/rendering helpers
  - Rust `toolchain_linking.rs` now builds actual linker invocations through mirrored pure helpers instead of hand-assembling arg vectors inline
  - Pulse now also owns the first host response-file write/materialization slice through `ToolchainHostFilesystem.writeResponseFile(...)`
  - Rust `toolchain_linking.rs` now prefers the bridged response-file write path and only falls back to Rust filesystem writes if the bridge is unavailable
  - Pulse now also owns the first real host tool-process execution slice through `pulse.process.Processes.execute(...)`, `pulse.process.ProcessResult`, and host-backed `Intrinsics.hostRunShellProcess(...)`
  - Rust `toolchain_linking.rs` now prefers the bridged tool-process execution path and only falls back to Rust `Command` execution for bootstrap/unavailable-bridge cases
  - Rust still owns retry policy and the remaining host probe/existence behavior
- Bridge transport/runtime truth from the response-file slice:
  - raw bridge request values must escape `\n`, `\r`, and `\\` explicitly; path-only escaping is not enough once bridge modes carry multiline payloads
  - `toolchain-write-response-file` must not pack arbitrarily large argument vectors into one escaped bridge value; it now sends `responseFilePath + argumentCount + one encoded argument per line`
  - `pulsec_rt_consoleReadLine` can no longer rely on the legacy fixed 4095-byte stack buffer; it now grows dynamically so large bridge/toolchain request lines do not truncate in bootstrap flows
  - host tool process plans must not force a `workingDirectory` while still passing project-root-relative linker/ML64 paths; that shape only works for absolute temp-root test builds and breaks normal direct CLI builds under checked-in fixture paths
  - `pulse.process.Processes.renderWindowsCommand(...)` must hand `cmd.exe /d /c` the already-quoted script directly; wrapping the entire script as one extra quoted shell argument changes cmd parsing and breaks otherwise valid tool invocations
  - `pulsec_rt_hostRunShellProcess` must allocate a writable raw command-line buffer, preserve the nullable working-directory handle until `hostPathAlloc`, and execute the full `cmd.exe ...` command line through `CreateProcessA`; the bridge path now depends on that runtime proc rather than Rust `Command::output()`
  - backend call-argument ARC handling cannot rely only on one successful declared-type lookup; expected arc-managed parameter types must still preserve call-result ownership across bridged stdlib/intrinsic calls
- Current backend size/tracing truth:
  - release MASM emission now keeps method-level trace frames for runtime stack traces but omits statement/file-line trace payload and `pulsec_rt_traceUpdateTop` calls for `pulse.*` / `author.*` classes
  - this materially shrinks emitted stdlib asm in production output; for example, fresh `runtime_mix` release output dropped `pulse.lang.String.asm` to about `285 KB` and `StringBuilder.asm` to about `230 KB`
  - release app/user code still keeps statement/file-line trace payload so runtime stack traces stay source-truthful there
  - debug emission still keeps statement/file-line trace payload for direct asm debugging
  - repeated `instanceof` / checked-cast class-id compare ladders now route through the shared `pulsec_rt_classIdInSet` runtime helper plus emitted class-id tables instead of inlining long `cmp edx, ...` chains at every use site
  - the cached author-build bridge lock now treats transient Windows `PermissionDenied` reads/stats on `target/author_build_bridge/lock` as "someone else owns the lock right now" instead of failing the workspace run; full-suite concurrency had exposed that race
  - backend symbol mangling now caps long emitted identifiers deterministically with a stable hash suffix before they reach MASM/ML64
  - this was required once authored `author.build.BuildPublicationWriter` methods pushed method/proc/branch labels beyond ML64 identifier limits
- authorlib outward-audit truth after the first `author.build` / `author.toolchain` lifts:
  - the main missed outward seam is public process/env execution, not filesystem access
  - that public process/env seam is now real under `pulse.process.*` through:
    - `ProcessEnvironmentVariable`
    - `ProcessEnvironment`
    - `ProcessPlan`
    - `ProcessResult`
    - `Processes.execute(...)`
  - `author.toolchain.*` now crosses into that public process surface instead of owning a private first-home for process/env execution
  - the first adjacent filesystem outward move is now also real under `pulse.io.HostFiles`
  - `author.toolchain.ToolchainHostFilesystem` now crosses through that public host-filesystem surface instead of talking directly to raw host intrinsics
  - `pulse.io.Files` host fallbacks now also route through `pulse.io.HostFiles`
  - adjacent remaining filesystem truth:
    - `pulse.io.*` is now the public path/file/materialization surface
    - but the host-backed filesystem substrate is still thin and should expand where later self-sustained growth would otherwise require Rust again
  - `pulse.io.File` / `pulse.io.Files` / `pulse.io.Path` already provide the broad public filesystem/path surface, including directory creation, recursive listing, temp directories, copy/move, and text read/write helpers
  - `author.toolchain.ToolchainHostFilesystem` therefore looks like an authorlib wrapper over already-public `pulse.io.*`, not a distinct long-term public package that still needs to be invented
  - that formerly-missing public seam is now moved outward into:
    - `pulse.process.ProcessEnvironmentVariable`
    - `pulse.process.ProcessEnvironment`
    - `pulse.process.ProcessPlan`
    - `pulse.process.ProcessResult`
    - `pulse.process.Processes`
  - the current `author.toolchain` classes that still look properly privileged/tooling-owned are:
    - `ToolchainConfig` / `ToolchainConfigResolver`
    - `ToolchainCandidatePlan` / `ToolchainCandidateBridge`
    - `ToolchainDiscoveryPlan` / `ToolchainDiscoveryResult` / `ToolchainDiscoveryResolver` / bridges
    - `ToolchainCommandPlan`
    - `ToolchainResolver` command/discovery/build-policy helpers
  - the current `author.project.*` and `author.build.*` surface still looks appropriately privileged; no equally strong outward-move candidate there has shown up yet
- Documented follow-up for the Pulse compiler/runtime backend rewrite:
  - keep method-level/runtime stack-trace behavior, but make debug/source-line trace data explicitly profile-gated
  - move repeated type-test / cast / overload dispatch ladders into shared helpers instead of emitting large per-class compare chains
  - deduplicate repeated MASM scaffolding patterns that are currently emitted inline per method/class
  - move more backend/runtime support into shared helpers instead of baking so much whole-program-sensitive logic into each class asm file

## Validation State

Recent green checks for this slice:

- `cargo test -q -p pulsec-core prelude_contract_packages_are_locked`
- `cargo test -q -p pulsec-core prelude_contract_resolves_lang_io_math_and_collections_without_imports`
- `cargo test -q -p pulsec --test pulse_feature_locks`
- `cargo test -q -p pulsec check_project_accepts_prelude_usage_without_explicit_imports`
- `cargo test -q -p pulsec check_project_accepts_supported_pulse_imports`
- `cargo test -q -p pulsec check_project_rejects_unknown_pulse_import`
- `cargo test -q -p pulsec --test stage_locks`

## Required Rules For The Next Chat

- If valid Pulse syntax/semantics fail later, treat it as backend/runtime/codegen bug first.
- Do not reshape APIs/architecture around missing execution support.
- If something can be expressed in Pulse, move it into Pulse now.
- If it cannot yet be expressed in Pulse, add what is missing, then move it.
- If a feature is being lifted, check the existing `pulse.*` / `author.*` surface first and reuse or minimally extend it instead of rewriting parallel code.
- `author.*` is the privileged authoring surface; `pulse.*` remains public stdlib.
- Pulse-side tests should bias toward feature/behavior locks, not broad roadmap bookkeeping.
- Treat the linked handoff/continuity docs as required ingestion, not optional background reading.
- The user expects the next agent to read through the linked docs deeply enough to understand the whole current codebase surface, project contracts, and live planning spine before making progress decisions.
- Do not skim only the immediate lane doc and assume that is sufficient context for architectural or lift-direction decisions.

## Read Next

Start with:

1. [CODEX_HANDOFF_PHASE_F.md](/G:/Programming/Rust/PulseCode/docs/CODEX_HANDOFF_PHASE_F.md)
2. [F1_TASK_BOARD.md](/G:/Programming/Rust/PulseCode/docs/F1_TASK_BOARD.md)
3. [F1_97_BOOTSTRAP_OWNERSHIP_MAP.md](/G:/Programming/Rust/PulseCode/docs/F1_97_BOOTSTRAP_OWNERSHIP_MAP.md)
4. [AUTHORLIB_STRATEGY.md](/G:/Programming/Rust/PulseCode/docs/AUTHORLIB_STRATEGY.md)
5. [AUTHORLIB_ENABLEMENT_CONTRACT.md](/G:/Programming/Rust/PulseCode/docs/AUTHORLIB_ENABLEMENT_CONTRACT.md)
6. [PULSE_TEST_MODEL.md](/G:/Programming/Rust/PulseCode/docs/PULSE_TEST_MODEL.md)
7. [PULSEC_MANIFEST_V1.md](/G:/Programming/Rust/PulseCode/docs/PULSEC_MANIFEST_V1.md)
8. [PROJECT_LAYOUT_CONVENTIONS.md](/G:/Programming/Rust/PulseCode/docs/PROJECT_LAYOUT_CONVENTIONS.md)
9. [CLI_COMMAND_CONTRACT.md](/G:/Programming/Rust/PulseCode/docs/CLI_COMMAND_CONTRACT.md)
10. [F1_SUPPORT_POLICY.md](/G:/Programming/Rust/PulseCode/docs/F1_SUPPORT_POLICY.md)

Important ingestion rule:

- these linked docs are not just a suggestion list
- read them as the active context spine for this lane so the next agent understands the current language surface, stdlib/project/tooling surface, ownership rules, and planning/contracts broadly enough to preserve user trust and sanity

Then inspect the code:

- [project/mod.rs](/G:/Programming/Rust/PulseCode/crates/pulsec-cli/src/cli/project/mod.rs)
- [manifest/mod.rs](/G:/Programming/Rust/PulseCode/crates/pulsec-cli/src/cli/manifest/mod.rs)
- [config/mod.rs](/G:/Programming/Rust/PulseCode/crates/pulsec-cli/src/cli/config/mod.rs)
- [testing/mod.rs](/G:/Programming/Rust/PulseCode/crates/pulsec-cli/src/cli/testing/mod.rs)
- [build/mod.rs](/G:/Programming/Rust/PulseCode/crates/pulsec-cli/src/cli/build/mod.rs)
- [prelude.rs](/G:/Programming/Rust/PulseCode/crates/pulsec-core/src/prelude.rs)
- [semantics/mod.rs](/G:/Programming/Rust/PulseCode/crates/pulsec-core/src/semantics/mod.rs)
- [type_resolution.rs](/G:/Programming/Rust/PulseCode/crates/pulsec-core/src/semantics/types/type_resolution.rs)
