# Author Library Strategy

## Purpose

This document records the selected library split for the self-sustained-hosting roadmap.

PulseCode is no longer aiming only for a compiler that can compile itself once. The stronger goal is self-sustained hosting: the compiler, runtime, and tooling stack should move into Pulse wherever that ownership can honestly live in Pulse, leaving Rust only where host/bootstrap, target-adapter, allocator/runtime-core, or OS-service glue truly still belong.

For the current `F1-97` lane, the closure bar is stricter than "leave a little Rust underneath it":

- by the end of `F1-97`, Rust should own no normal compiler/runtime/toolchain path
- Pulse should own enough that you can walk away from Rust completely if you want to
- any Rust still retained after `F1-97` is bootstrap contingency for later feature lifts, not part of the claimed product ownership state

That requires a library split more explicit than a single public `stdlib`.

## Selected Split

PulseCode now has two conceptual Pulse-owned library tiers:

- `pulse.*`
  - the public, user-facing standard library
  - intended for ordinary application and library authors
  - should stay simple and Java-close where that is the selected product direction
- `author.*`
  - a compiler/runtime authoring extension library
  - intended for Pulse-authored compiler, runtime, toolchain, and backend-elevation work
  - may expose elevated or low-level construction surfaces that should not become ordinary user APIs

The concrete package-root and enablement contract now lives in
[AUTHORLIB_ENABLEMENT_CONTRACT.md](/G:/Programming/Rust/PulseCode/docs/AUTHORLIB_ENABLEMENT_CONTRACT.md).

## Why `authorlib` Exists

Without `authorlib`, PulseCode would face a bad split:

- either keep too much compiler/runtime logic in Rust because it feels too sharp for `pulse.*`
- or leak compiler/runtime authoring surfaces into the public user library and make the everyday language/library model unnecessarily complicated

`authorlib` is the chosen middle layer:

- Pulse-owned, so the project can become self-sustained
- not normalized into the public end-user library surface
- always available to compiler/runtime/toolchain builds

## Intended Surface Direction

`authorlib` is the intended home for Pulse-owned elevated language/runtime-building helpers such as:

- ARC construction and ownership helpers
- cycle-detection and weak-reference authoring helpers
- explicit low-level memory/lifetime control helpers for systems work, compiler/runtime work, OS work, and language implementation work
- runtime object/handle/build-time support APIs that are useful to compiler/runtime authors but should not be ordinary application APIs
- compiler/runtime support helpers that would otherwise stay in Rust only because they are too sharp for `pulse.*`

This list is directional, not yet the final locked API inventory. The inventory and ownership decisions are tracked on [FB_TASK_BOARD.md](/G:/Programming/Rust/PulseCode/docs/FB_TASK_BOARD.md).

## Package Taxonomy Direction

`author.*` should not become a single vague bucket of "internal" helpers.

The selected direction is to organize `authorlib` by real technical domain so it
is useful both to Pulse's own compiler/runtime/toolchain and to advanced system
engineers working beyond the public `pulse.*` boundary.

The current target taxonomy is:

- `author.project.*`
  - manifest, workspace, project layout, source/resource/build-root resolution
  - live bridge contracts now also exist through:
    - `author.project.CheckInvocationBridge`
    - `author.project.TestInvocationBridge`
    - `author.project.ProjectDiscoveryBridge`
    - `author.project.WorkspaceContext`
    - `author.project.WorkspaceContextBridge`
- `author.build.*`
  - artifact layout, publication, packaging-adjacent build metadata
  - workspace-build execution/result contracts now also live here through:
    - `author.build.WorkspaceBuildResult`
    - `author.build.WorkspaceBuildMemberResult`
    - `author.build.BuildSummaryWriter.renderWorkspaceBuild*`
- `author.toolchain.*`
  - assembler/linker/process/env invocation and related toolchain facades
  - `author.compiler.*`
  - compiler-only APIs such as analysis, IR, lowering, diagnostics, codegen support
  - first live slices now exist through:
    - `author.compiler.CheckResult` for structured compiler check results
    - `author.compiler.CheckSummaryWriter` for compiler-facing check/workspace-check status rendering
    - `author.compiler.WorkspaceCheckResult` for structured workspace-check aggregation state
    - `author.compiler.WorkspaceCheckMemberResult` for structured workspace-member check outcomes
    - `author.compiler.TestDiscoveryResult` for structured compiler test discovery success/failure state
    - `author.compiler.TestExecutionResult` for structured compiler test pass/fail outcomes
    - `author.compiler.TestExecutionWriter` for compiler-facing test pass/fail line rendering
    - `author.compiler.TestResult` for structured compiler test result state
    - `author.compiler.WorkspaceTestResult` for structured workspace-test aggregation state
    - `author.compiler.TestSummaryWriter` for compiler-facing test/workspace-test discovery and summary rendering
    - `author.compiler.TestDiagnosticWriter` for compiler-facing test discovery/no-tests/aggregate-failure diagnostic text
- `author.runtime.*`
  - runtime-construction/runtime-service/runtime-object-model support APIs
- `author.memory.*`
  - explicit ownership/lifetime/allocation/control surfaces too sharp for public stdlib
- `author.system.*` or later more specific OS-facing subtrees
  - systems/OS/service/process/filesystem surfaces that exceed ordinary application-level stdlib
- later domain-specific advanced surfaces when justified
  - for example language-construction or OS-development helpers

Important package-placement rule:

- do not create vague catch-all homes such as `author.internal.*`, `author.misc.*`, or broad buckets like `author.program.*`
- prefer a specific domain package whenever the surface is meaningfully compiler-, runtime-, memory-, project-, build-, or system-oriented
- package names should describe enduring ownership, not temporary implementation provenance from the current Rust file tree

This is intentional product direction, not only compiler-internal organization.
`authorlib` should stay useful to advanced Pulse developers who need deeper
control for work such as language implementation, OS work, AI/runtime systems,
or other systems programming beyond the ordinary stdlib boundary.

## Systems-Level Access Rule

The working rule is:

- ordinary application/library development should stay on `pulse.*`
- systems-level work belongs in `authorlib`

That includes work such as:

- compiler implementation
- runtime implementation
- OS-facing or kernel-adjacent work
- alternative language/runtime implementation on Pulse
- low-level memory ownership/lifetime work that should not become ambient user API

This keeps the public standard library Java-close and simpler while still letting Pulse own the sharper infrastructure needed for the self-sustained transition.

## Memory Policy Direction

The current selected direction is:

- managed runtime behavior remains the default language/library model
- `author.*` may expose richer manual or semi-manual memory control where that is required for systems/compiler/runtime work
- that lower-level control should be explicit and opt-in, not ambient in ordinary `stdlib` code

This means the project should prefer:

- explicit authorlib-owned memory domains, ownership helpers, retain/release-style control, or related low-level surfaces where justified

over:

- making raw runtime ownership control ordinary `stdlib` API
- or treating "disable ARC/GC globally" as the first design primitive

Any future decision about component-level managed-vs-manual memory policy for the compiler, runtime, or OS work should be expressed through explicit Pulse-owned authoring surfaces, not by silently weakening the default language model for ordinary user code.

## Access Policy

The current selected access policy is:

- `author.*` is not a normal default user library
- ordinary user projects should not implicitly program against `author.*`
- the compiler must still be able to resolve `author.*` at all times for compiler/runtime/toolchain builds
- the compiler must still be able to resolve `authorlib` at all times for compiler/runtime/toolchain builds
- runtime compilation/publication flows must be able to use `author.*` even when the end-user project has not enabled it as a normal dependency

In other words:

- `pulse.*` is public product surface
- `author.*` is privileged product-owned authoring surface

## Boundary Rule

Use this decision rule when a feature/helper is being placed:

- if it is ordinary application/library functionality, it belongs in `pulse.*`
- if it is advanced but still broadly useful to expert users beyond ordinary app development, it belongs in an appropriate domain package under `author.*`
- if it is required for Pulse-owned compiler/runtime/toolchain implementation and is too elevated or too sharp for ordinary user code, it belongs in a specific domain package under `author.*`
- if it genuinely depends on host/bootstrap, target-adapter, allocator/runtime-core, or OS-service glue, it may remain below the Pulse library layer

Rust ownership is no longer the default answer for features that merely feel "internal." If the feature can honestly live in Pulse, it should move into `pulse.*` or `author.*`.

## Immediate Packaging Rule

The first migration waves under `F1-97` should not only move Rust-owned support
into Pulse. They should also place that code into the intended long-term domain
packages immediately.

That means:

- reposition the current and near-term `authorlib` seed surface into the chosen package taxonomy as it grows
- keep package boundaries clean while migrating, rather than landing broad temporary namespaces and promising to sort them out later
- prefer one honest move into the right domain package over a quick move into a generic `author.*` bucket followed by churn

## Lift-Through-Surface Rule

When a Rust-owned feature is being lifted into Pulse-owned library code:

- inspect the existing `pulse.*` and `author.*` surface first
- if the needed behavior already exists there, lift through that existing surface instead of rewriting a parallel helper
- if the surface is close but incomplete, make the smallest honest extension to that existing surface rather than adding a second implementation path beside it
- do not rewrite library code in `authorlib` or `stdlib` just because the donor Rust code was written in a different style

This rule exists to prevent duplicate parser/helpers and to keep the real
library surface, rather than ad hoc lifted code, as the source of truth.

## Public-First Audit Rule

If a capability is broadly useful on the public-facing side, it should move
into `pulse.*` first and then be consumed from `author.*`, rather than being
born as an authorlib-only API.

Current audit result:

- the main missed public seam so far was process/env execution
- public filesystem/path IO already exists in `pulse.io.*`, and the first
  public host-filesystem materialization seam is now also real under
  `pulse.io.HostFiles`
- `author.toolchain.ToolchainHostFilesystem` is now better understood as an
  authorlib wrapper crossing into that public host-filesystem surface than as
  the first home of a separate long-term public package
- the current `author.toolchain` types that should move outward next are:
  - this move is now complete under:
    - `pulse.process.ProcessEnvironmentVariable`
    - `pulse.process.ProcessEnvironment`
    - `pulse.process.ProcessPlan`
    - `pulse.process.ProcessResult`
    - `pulse.process.Processes`
- `author.toolchain` now crosses into that public surface afterward
- the rest of the current `author.toolchain` surface still looks properly
  privileged:
  - toolchain config precedence
  - candidate/discovery plans and bridge serializers
  - toolchain command planning
  - VS/SDK probing policy
- the current `author.project.*` and `author.build.*` surface also still looks
  appropriately privileged at this stage
- immediate next sequence:
  - the public `pulse.*` process/env execution surface is now up
  - the first public host-filesystem materialization seam is now up under `pulse.io.HostFiles`
  - `author.toolchain.*` now crosses into those public surfaces
  - next return point is the remaining `author.build.*` publication/materialization lift
  - expand the host-facing public filesystem substrate where needed so later self-sustained growth does not need Rust pulled back in for ordinary host file work

## Public Interop Rule

Raw interop now begins in the public stdlib under `pulse.interop.*`, not under
`author.*`.

Current first executable slice:

- `pulse.interop.NativeLibrary`
- `pulse.interop.NativeSymbol`
- `pulse.interop.NativeCalls`
- `pulse.interop.NativePointer`
- `pulse.interop.NativeBuffer`
- `pulse.interop.NativeByteSpan`
- `pulse.interop.NativeUtf8String`
- `pulse.interop.NativeOwnership`
- `pulse.interop.NativeManagedResource`

That surface is intentionally low-level. It exists so:

- ordinary users have a standard interop path
- Pulse-owned absorbed foreign-backed features can wrap a public raw boundary instead of inventing a second private interop stack
- adopted interop resources can default to ARC-backed release without forcing manual memory ownership on every caller

`author.*` should consume or extend that public raw interop surface where
appropriate, not become the first home of general foreign-call capability.

## Planning References

- [STANDALONE_ROADMAP.md](/D:/Programming/codex/PulseCode/docs/STANDALONE_ROADMAP.md)
- [FB_TASK_BOARD.md](/G:/Programming/Rust/PulseCode/docs/FB_TASK_BOARD.md)
- [CODEX_HANDOFF_PHASE_F.md](/D:/Programming/codex/PulseCode/docs/CODEX_HANDOFF_PHASE_F.md)
- [INTEROP_STRATEGY.md](/G:/Programming/Rust/PulseCode/docs/INTEROP_STRATEGY.md)
