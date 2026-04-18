# F1-97 Compiler Stage Model

This document locks the compiler stage and promotion model required before
major compiler/runtime subsystem porting begins under `F1-97`.

It exists to stop Rust from remaining one hidden permanent authority even after
Pulse-owned compiler/runtime code starts landing.

## Core Rule

`compiler0` is one role, not one implementation.

Meaning:

- `compiler0` is the compiler currently trusted to build the next compiler
- the implementation that fills that role may change over time
- Rust is the initial implementation of that role
- Rust is not the forever-definition of that role

## Goals

The selected stage model must make all of these true:

- Pulse can port compiler/runtime code without cementing Rust as permanent
  authority
- a Pulse-built `pulsec` can become the trusted compiler later
- Rust can remain detachable fallback/bootstrap only after promotion
- future language evolution can continue without forcing the project back into
  one irremovable Rust bootstrap

## Roles

### Trusted Compiler

The compiler currently blessed to build the next compiler artifact.

This is the role informally referred to as `compiler0`.

### Candidate Compiler

The newly built compiler artifact produced by the trusted compiler and under
evaluation for later promotion.

### Bootstrap Provider

A provider implementation used only to keep bring-up moving when the trusted
Pulse-owned stage cannot yet build the next step on its own.

Initially this is the Rust-built `pulsec`.

### Fallback Provider

An explicitly detachable emergency provider kept after promotion for bring-up,
recovery, or later feature lifts.

Fallback is not the default owner of the product path.

## Initial Stage Ladder

The initial selected ladder is:

1. Rust-built `pulsec` is the first trusted compiler
2. Rust-built `pulsec` builds Pulse-authored `pulsec-stage1`
3. `pulsec-stage1` builds `pulsec-stage2`
4. once promotion conditions are met, the trusted role moves from the Rust
   compiler to the Pulse-built compiler
5. Rust remains fallback/bootstrap only after that promotion

This means:

- the first Pulse compiler artifact does not automatically become trusted
- trust is promoted, not assumed

## Promotion Rule

A candidate compiler is promotable when it can:

- build the selected next-stage compiler successfully
- build the selected runtime successfully
- preserve required diagnostics/contracts closely enough for the selected stage
- satisfy the stage-validation commands chosen for the lift

At minimum, promotion should prove:

- `trusted -> candidate`
- `candidate -> next`
- runtime still builds under the promoted compiler

The exact validation command set may grow, but the structural rule does not:

- one Pulse-built compiler becomes trusted only after it proves it can build
  the next compiler/runtime step

## Feature Introduction Rule

New language features must not be introduced in a way that traps the compiler
behind one unbuildable jump.

Rule:

- stage `N` must be able to build the transition compiler that introduces the
  new feature
- only after that transition compiler exists may the compiler/runtime codebase
  depend broadly on that new feature

Practical meaning:

- do not let the main `pulsec` sources depend immediately on a brand-new source
  feature unless the current trusted compiler can already compile it
- if the current trusted compiler cannot compile the new source shape, first
  land the support in the trusted compiler, build the next compiler, then begin
  consuming the feature widely

This is the rule that allows language evolution after self-host without making
the trusted stage ladder collapse.

## Provider Rule

Pulse must own orchestration.

That means:

- Pulse-owned code should own the stage-selection, rebuild, and promotion logic
- providers satisfy "compile this program" behind that contract
- providers do not own the high-level staging policy

Selected provider set:

- Rust bootstrap provider
- Pulse self-host provider
- later fallback providers if the project chooses them

## Default Path Rule

Once a Pulse-built compiler is promoted, the default compiler path becomes the
promoted Pulse compiler.

After promotion:

- Rust must not remain the default normal-path compiler
- Rust may remain available as fallback/bootstrap only

## Rust Detachability Rule

Rust should be movable out of the normal development path without causing a
system-wide ownership collapse.

That means:

- the stage model must not assume the Rust compiler is co-located forever
- provider selection must be explicit
- fallback use must be deliberate, not ambient

## Relationship To `--selfhost-provider`

The current hidden `--selfhost-provider` path is one useful bring-up seam, but
it is not by itself the full stage model.

The stage model defined here is stronger:

- provider-backed execution is one mechanism
- trusted-stage selection and promotion are the governing policy

## Required Implementation Consequences

Before major compiler/runtime subsystem porting, the project must define:

- how the trusted compiler is selected
- how one candidate compiler is named and materialized
- how promotion is recorded
- how fallback/bootstrap provider selection is requested
- what minimum validation blesses one promoted stage

These details may live in later authored build/toolchain/compiler surfaces, but
the architectural rule is now fixed by this document.

## Board Bookkeeping Rule

If a later F-board item is implemented early because this stage model requires
it now:

- update that original board item immediately
- do not leave the board implying the feature is still unimplemented
- if the feature is complete, mark it completed
- if only part landed, mark it `In Progress` and record exactly what remains

Pulling later work forward is allowed when it is a real blocker.
Forgetting to update the board afterward is not allowed.
