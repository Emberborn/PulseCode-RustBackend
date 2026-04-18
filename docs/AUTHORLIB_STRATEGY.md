# Aden Development Kit Strategy

## Purpose

This document records the selected library split for the self-sustained-hosting roadmap.

Aden is no longer aiming only for a compiler that can compile itself once. The stronger goal is self-sustained hosting: the compiler, runtime, and tooling stack should move into Aden wherever that ownership can honestly live in Aden, leaving Rust only where host/bootstrap, target-adapter, allocator/runtime-core, or OS-service glue truly still belong.

For the current `F1-97` lane, the closure bar is stricter than "leave a little Rust underneath it":

- by the end of `F1-97`, Rust should own no normal compiler/runtime/toolchain path
- Aden should own enough that you can walk away from Rust completely if you want to
- any Rust still retained after `F1-97` is bootstrap contingency for later feature lifts, not part of the claimed product ownership state

That requires a library split more explicit than a single public `stdlib`.

## Selected Split

Aden now has two primary Aden-owned library tiers:

- `aden.*`
  - the public, user-facing standard library
  - intended for ordinary application and library authors
  - should stay simple and Java-close where that is the selected product direction
- `adk.*`
  - the Aden Development Kit
  - intended for Aden-authored compiler, runtime, toolchain, and backend-elevation work
  - may expose elevated or low-level construction surfaces that should not become ordinary user APIs

Future reserved roots:

- `adenx.*`
  - experimental/incubating surfaces that are not yet committed to `aden.*` or `adk.*`
- `adenos.*`
  - future systems/OS-facing surfaces when Aden grows into operating-system and deeper systems work

The concrete package-root and enablement contract now lives in
[AUTHORLIB_ENABLEMENT_CONTRACT.md](/G:/Programming/Rust/Aden Lang/docs/AUTHORLIB_ENABLEMENT_CONTRACT.md).

## Why `adklib` Exists

Without `adklib`, Aden would face a bad split:

- either keep too much compiler/runtime logic in Rust because it feels too sharp for `aden.*`
- or leak compiler/runtime authoring surfaces into the public user library and make the everyday language/library model unnecessarily complicated

`adklib` is the chosen middle layer:

- Aden-owned, so the project can become self-sustained
- not normalized into the public end-user library surface
- always available to compiler/runtime/toolchain builds

## Intended Surface Direction

`adklib` is the intended home for Aden-owned elevated language/runtime-building helpers such as:

- ARC construction and ownership helpers
- cycle-detection and weak-reference authoring helpers
- explicit low-level memory/lifetime control helpers for systems work, compiler/runtime work, OS work, and language implementation work
- runtime object/handle/build-time support APIs that are useful to compiler/runtime authors but should not be ordinary application APIs
- compiler/runtime support helpers that would otherwise stay in Rust only because they are too sharp for `aden.*`

This list is directional, not yet the final locked API inventory. The inventory and ownership decisions are tracked on [FB_TASK_BOARD.md](/G:/Programming/Rust/Aden Lang/docs/FB_TASK_BOARD.md).

## Package Taxonomy Direction

`adk.*` should not become a single vague bucket of "internal" helpers.

The selected direction is to organize `adklib` by real technical domain so it
is useful both to Aden's own compiler/runtime/toolchain and to advanced system
engineers working beyond the public `aden.*` boundary.

The current target taxonomy is:

- `adk.project.*`
  - manifest, workspace, project layout, source/resource/build-root resolution
  - live bridge contracts now also exist through:
    - `adk.project.CheckInvocationBridge`
    - `adk.project.TestInvocationBridge`
    - `adk.project.ProjectDiscoveryBridge`
    - `adk.project.WorkspaceContext`
    - `adk.project.WorkspaceContextBridge`
- `adk.build.*`
  - artifact layout, publication, packaging-adjacent build metadata
  - workspace-build execution/result contracts now also live here through:
    - `adk.build.WorkspaceBuildResult`
    - `adk.build.WorkspaceBuildMemberResult`
    - `adk.build.BuildSummaryWriter.renderWorkspaceBuild*`
- `adk.toolchain.*`
  - assembler/linker/process/env invocation and related toolchain facades
  - `adk.compiler.*`
  - compiler-only APIs such as analysis, IR, lowering, diagnostics, codegen support
  - first live slices now exist through:
    - `adk.compiler.CheckResult` for structured compiler check results
    - `adk.compiler.CheckSummaryWriter` for compiler-facing check/workspace-check status rendering
    - `adk.compiler.WorkspaceCheckResult` for structured workspace-check aggregation state
    - `adk.compiler.WorkspaceCheckMemberResult` for structured workspace-member check outcomes
    - `adk.compiler.TestDiscoveryResult` for structured compiler test discovery success/failure state
    - `adk.compiler.TestExecutionResult` for structured compiler test pass/fail outcomes
    - `adk.compiler.TestExecutionWriter` for compiler-facing test pass/fail line rendering
    - `adk.compiler.TestResult` for structured compiler test result state
    - `adk.compiler.WorkspaceTestResult` for structured workspace-test aggregation state
    - `adk.compiler.TestSummaryWriter` for compiler-facing test/workspace-test discovery and summary rendering
    - `adk.compiler.TestDiagnosticWriter` for compiler-facing test discovery/no-tests/aggregate-failure diagnostic text
    - `adk.compiler.CheckExecutionResult` for structured provider-backed compiler check execution state
    - `adk.compiler.CheckExecutionBridge` for bridge-safe provider-backed compiler check transport
    - `adk.compiler.CheckExecutionProvider` for Aden-owned single-project check orchestration over the current host compiler provider
    - `adk.compiler.BuildCoreExecutionResult` for structured provider-backed compiler build-core execution state
    - `adk.compiler.BuildCoreExecutionBridge` for bridge-safe provider-backed compiler build-core transport
    - `adk.compiler.BuildCoreExecutionProvider` for Aden-owned single-project build-core orchestration over the current host compiler provider
    - `adk.compiler.TestFileExecutionResult` for structured provider-backed compiler test-file execution state
    - `adk.compiler.TestFileExecutionBridge` for bridge-safe provider-backed compiler test-file transport
    - `adk.compiler.TestFileExecutionProvider` for Aden-owned single-project test-file orchestration over the current host compiler provider
    - `adk.compiler.WorkspaceCheckExecutionResult` / `Bridge` / `Provider` for provider-backed workspace check orchestration
    - `adk.compiler.WorkspaceTestExecutionResult` / `Bridge` / `Provider` for provider-backed workspace test orchestration
- `adk.runtime.*`
  - runtime-construction/runtime-service/runtime-object-model support APIs
- `adk.memory.*`
  - explicit ownership/lifetime/allocation/control surfaces too sharp for public stdlib
- `adk.system.*` or later more specific OS-facing subtrees
  - systems/OS/service/process/filesystem surfaces that exceed ordinary application-level stdlib
- later domain-specific advanced surfaces when justified
  - for example language-construction or OS-development helpers

Important package-placement rule:

- do not create vague catch-all homes such as `adk.internal.*`, `adk.misc.*`, or broad buckets like `adk.program.*`
- prefer a specific domain package whenever the surface is meaningfully compiler-, runtime-, memory-, project-, build-, or system-oriented
- package names should describe enduring ownership, not temporary implementation provenance from the current Rust file tree

This is intentional product direction, not only compiler-internal organization.
`adklib` should stay useful to advanced Aden developers who need deeper
control for work such as language implementation, OS work, AI/runtime systems,
or other systems programming beyond the ordinary stdlib boundary.

## Systems-Level Access Rule

The working rule is:

- ordinary application/library development should stay on `aden.*`
- systems-level work belongs in `adklib`

That includes work such as:

- compiler implementation
- runtime implementation
- OS-facing or kernel-adjacent work
- alternative language/runtime implementation on Aden
- low-level memory ownership/lifetime work that should not become ambient user API

This keeps the public standard library Java-close and simpler while still letting Aden own the sharper infrastructure needed for the self-sustained transition.

## Memory Policy Direction

The current selected direction is:

- managed runtime behavior remains the default language/library model
- `adk.*` may expose richer manual or semi-manual memory control where that is required for systems/compiler/runtime work
- that lower-level control should be explicit and opt-in, not ambient in ordinary `stdlib` code

This means the project should prefer:

- explicit adklib-owned memory domains, ownership helpers, retain/release-style control, or related low-level surfaces where justified

over:

- making raw runtime ownership control ordinary `stdlib` API
- or treating "disable ARC/GC globally" as the first design primitive

Any future decision about component-level managed-vs-manual memory policy for the compiler, runtime, or OS work should be expressed through explicit Aden-owned authoring surfaces, not by silently weakening the default language model for ordinary user code.

## Current Program-Scaffold Direction

The first real Aden-side compiler/runtime project roots now live directly at
the top level of the repo through:

- [compiler](/G:/Programming/Rust/Aden Lang/compiler)
- [runtime](/G:/Programming/Rust/Aden Lang/runtime)

These are intentionally still small right now, but they are real Aden
projects with manifests, entrypoints, adklib enabled, and smoke tests. The
goal is to keep the compiler/runtime program lift happening inside the living
system layout that the Rust-built `adenc` can already `check`, `build`, and
`test`.

Operational rule for the current transition:

- provider-backed compiler/build/test execution is for explicit bring-up flows
  selected by the hidden Rust-bootstrap flag `--selfhost-provider`
- ordinary fixture/parity/regression runs should stay on the direct Rust
  compiler loop until the real Aden compiler/runtime replace that loop

## Access Policy

The current selected access policy is:

- `adk.*` is not a normal default user library
- ordinary user projects should not implicitly program against `adk.*`
- the compiler must still be able to resolve `adk.*` at all times for compiler/runtime/toolchain builds
- the compiler must still be able to resolve `adklib` at all times for compiler/runtime/toolchain builds
- runtime compilation/publication flows must be able to use `adk.*` even when the end-user project has not enabled it as a normal dependency

In other words:

- `aden.*` is public product surface
- `adk.*` is privileged product-owned authoring surface

## Boundary Rule

Use this decision rule when a feature/helper is being placed:

- if it is ordinary application/library functionality, it belongs in `aden.*`
- if it is advanced but still broadly useful to expert users beyond ordinary app development, it belongs in an appropriate domain package under `adk.*`
- if it is required for Aden-owned compiler/runtime/toolchain implementation and is too elevated or too sharp for ordinary user code, it belongs in a specific domain package under `adk.*`
- if it genuinely depends on host/bootstrap, target-adapter, allocator/runtime-core, or OS-service glue, it may remain below the Aden library layer

Rust ownership is no longer the default answer for features that merely feel "internal." If the feature can honestly live in Aden, it should move into `aden.*` or `adk.*`.

## Immediate Packaging Rule

The first migration waves under `F1-97` should not only move Rust-owned support
into Aden. They should also place that code into the intended long-term domain
packages immediately.

That means:

- reposition the current and near-term `adklib` seed surface into the chosen package taxonomy as it grows
- keep package boundaries clean while migrating, rather than landing broad temporary namespaces and promising to sort them out later
- prefer one honest move into the right domain package over a quick move into a generic `adk.*` bucket followed by churn

## Lift-Through-Surface Rule

When a Rust-owned feature is being lifted into Aden-owned library code:

- inspect the existing `aden.*` and `adk.*` surface first
- if the needed behavior already exists there, lift through that existing surface instead of rewriting a parallel helper
- if the surface is close but incomplete, make the smallest honest extension to that existing surface rather than adding a second implementation path beside it
- do not rewrite library code in `adklib` or `stdlib` just because the donor Rust code was written in a different style

This rule exists to prevent duplicate parser/helpers and to keep the real
library surface, rather than ad hoc lifted code, as the source of truth.

## Public-First Audit Rule

If a capability is broadly useful on the public-facing side, it should move
into `aden.*` first and then be consumed from `adk.*`, rather than being
born as an adklib-only API.

Current audit result:

- the main missed public seam so far was process/env execution
- public filesystem/path IO already exists in `aden.io.*`, and the first
  public host-filesystem materialization seam is now also real under
  `aden.io.HostFiles`
- `adk.toolchain.ToolchainHostFilesystem` is now better understood as an
  adklib wrapper crossing into that public host-filesystem surface than as
  the first home of a separate long-term public package
- the current `adk.toolchain` types that should move outward next are:
  - this move is now complete under:
    - `aden.process.ProcessEnvironmentVariable`
    - `aden.process.ProcessEnvironment`
    - `aden.process.ProcessPlan`
    - `aden.process.ProcessResult`
    - `aden.process.Processes`
- `adk.toolchain` now crosses into that public surface afterward
- the rest of the current `adk.toolchain` surface still looks properly
  privileged:
  - toolchain config precedence
  - candidate/discovery plans and bridge serializers
  - toolchain command planning
  - VS/SDK probing policy
- the current `adk.project.*` and `adk.build.*` surface also still looks
  appropriately privileged at this stage
- immediate next sequence:
  - the public `aden.*` process/env execution surface is now up
  - the first public host-filesystem materialization seam is now up under `aden.io.HostFiles`
  - `adk.toolchain.*` now crosses into those public surfaces
  - next return point is the remaining `adk.build.*` publication/materialization lift
  - expand the host-facing public filesystem substrate where needed so later self-sustained growth does not need Rust pulled back in for ordinary host file work

## Public Interop Rule

Raw interop now begins in the public stdlib under `aden.interop.*`, not under
`adk.*`.

Current first executable slice:

- `aden.interop.NativeLibrary`
- `aden.interop.NativeSymbol`
- `aden.interop.NativeFunction`
- `aden.interop.NativeCalls`
- `aden.interop.NativePointer`
- `aden.interop.NativeArgument`
- `aden.interop.NativeBuffer`
- `aden.interop.NativeByteSpan`
- `aden.interop.NativeUtf8String`
- `aden.interop.NativeOwnership`
- `aden.interop.NativeManagedResource`

That surface is intentionally low-level. It exists so:

- ordinary users have a standard interop path
- Aden-owned absorbed foreign-backed features can wrap a public raw boundary instead of inventing a second private interop stack
- adopted interop resources can default to ARC-backed release without forcing manual memory ownership on every caller
- mixed foreign call shapes, callable function pointers, registered callback handles, and borrowed loaded/self-module lookup now also live on the same public `aden.interop.*` surface instead of a second adklib-only bridge

`adk.*` should consume or extend that public raw interop surface where
appropriate, not become the first home of general foreign-call capability.

## Planning References

- [STANDALONE_ROADMAP.md](/D:/Programming/codex/Aden Lang/docs/STANDALONE_ROADMAP.md)
- [FB_TASK_BOARD.md](/G:/Programming/Rust/Aden Lang/docs/FB_TASK_BOARD.md)
- [CODEX_HANDOFF_PHASE_F.md](/D:/Programming/codex/Aden Lang/docs/CODEX_HANDOFF_PHASE_F.md)
- [INTEROP_STRATEGY.md](/G:/Programming/Rust/Aden Lang/docs/INTEROP_STRATEGY.md)
