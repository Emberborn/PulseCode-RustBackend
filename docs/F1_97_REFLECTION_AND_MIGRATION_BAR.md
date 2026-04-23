# F1-97 Reflection, Annotation, and Migration Bar

This document records the raised `F1-97` bar for self-sustained hosting before
the Pulse compiler/runtime rewrite.

It replaces the older "reflection-lite now, full reflection later" policy.

## Decision

Before the compiler and runtime rewrite proceeds in earnest, Pulse must have:

- full reflection
- full annotation processing
- metadata creation sufficient for self-hosted contract discovery and codegen
- a two-way migration/provider interface that allows foreign/bootstrap-backed
  features to be attached, wrapped, elevated into Pulse ownership, and later
  detached without Rust remaining privileged

This is now required work inside `F1-97`, not deferred post-rewrite cleanup.

End-of-phase rule:

- these surfaces must exist in the Pulse-owned compiler, runtime, and stdlib by
  the end of `F1-97`
- they are part of the work required to reduce Rust to the lightest detachable
  bootstrap at `F1-97` close
- if that detachable-bootstrap condition is not true yet, `F1-97` is not ready
  to be treated as complete

## Why The Bar Changed

The project is no longer aiming for a thin self-host demo.

The goal is an actually detachable bootstrap:

- Pulse should be able to describe and discover its own contracts
- Pulse should be able to generate and validate self-host glue through
  annotation processing
- Pulse should be able to absorb foreign-backed implementations through stable
  Pulse-owned interfaces instead of leaving Rust as hidden authority

Without that floor, the compiler/runtime rewrite would still depend too heavily
on bootstrap-owned seams whenever lower-level capability had to be lifted.

## Required Floor

### 1. Full Reflection

`Class` reflection-lite is no longer the target.

`F1-97` now requires a real reflection surface for the selected Java-close
contract, including the runtime/compiler metadata needed for:

- type discovery
- member discovery
- annotation discovery
- metadata-backed contract validation
- dynamic invocation/introspection where the selected reflection model requires
  it

### 2. Full Annotation Processing

Annotation syntax and a few built-in annotations are no longer enough.

`F1-97` now requires a real processor model with:

- processor discovery/loading
- deterministic processing order/phase rules
- generated source or artifact emission
- stable diagnostics/source mapping
- metadata-driven contract/codegen support for self-host work

Convenience systems layered on top of that, such as Lombok-style boilerplate
reducers, are allowed later. The processor model itself is not later work.

### 3. Metadata Creation

Pulse must be able to emit and consume the metadata needed to support:

- reflection
- annotation retention/target rules
- self-host compiler/runtime contract description
- migration/provider wiring
- generated glue between Pulse-owned and foreign-backed implementations

Metadata creation is not a small side note under annotations anymore. It is a
required self-hosting substrate.

### 4. Two-Way Migration / Provider Interface

Interop strength alone is not enough.

`F1-97` now also requires an explicit interface layer that allows:

- Pulse to call foreign/bootstrap-backed features through Pulse-owned
  contracts
- foreign/bootstrap-backed providers to call back through stable Pulse-owned
  interfaces
- staged elevation from foreign-backed implementation to Pulse-native
  implementation without breaking the surrounding contract
- Rust to become one detachable provider rather than permanent hidden
  authority

This interface layer is the migration seam for lower-level lifts that still
need temporary foreign help during the self-sustained transition.

Its purpose is not only bring-up convenience.

It exists so that after the compiler/runtime rewrite lands, new lower-level
features can still be absorbed into the live Pulse-owned stack without forcing
the project back into rebuilding a heavier Rust stage-0 authority.

## Relationship To Interop

Current interop work remains the enabling substrate.

Interop is still the elevator:

- it lets Pulse reach foreign systems now
- it lets Pulse wrap foreign capability behind Pulse-native contracts
- it should help Pulse internalize ownership later

But interop by itself does not replace:

- full reflection
- annotation processing
- metadata creation
- the two-way migration/provider interface

Those are now separate required `F1-97` floors.

## Board / Planning Rule

The following work is no longer treated as "later unless convenient":

- `F1-12`
- `F1-30`
- `F1-94`
- `F1-102`
- the migration/provider-interface task added for this raised bar

If these tasks land through `F1-97`, update the original board items
immediately rather than leaving them implying the work is still post-transition.

## Practical Rule

Do not begin or continue major compiler/runtime rewrite work on the assumption
that reflection-lite is enough.

First make the self-host contract floor real:

- full reflection
- full annotation processing
- metadata creation
- two-way migration/provider interface

Then carry the compiler/runtime rewrite through that owned floor instead of
relying on bootstrap-only seams.

By the end of `F1-97`, the expected state is:

- Pulse-owned compiler
- Pulse-owned runtime
- Pulse-owned stdlib support for these contract surfaces
- Rust reduced to the lightest detachable bootstrap/provider role needed to
  keep stage evolution moving when genuinely required
