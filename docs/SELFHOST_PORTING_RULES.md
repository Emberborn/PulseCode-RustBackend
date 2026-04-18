# Selfhost Porting Rules

This document records the required code-shape rules for the Pulse-authored
compiler and runtime projects during `F1-97` and the later Phase G transition.

These are not style suggestions. They are the operating rules for how
`compiler`, `runtime`, and later Pulse-owned compiler/runtime code should be
structured.

## Purpose

The Pulse compiler/runtime port must stay:

- human-readable
- human-navigable
- human-iterable

If opening a file produces a code explosion, iteration slows down and the port
becomes harder to maintain than the bootstrap it is supposed to replace.

## Hard Rules

### 1. Package Cleanly

- use nested packages with real domain boundaries
- package by enduring ownership and responsibility
- do not mirror giant Rust files as giant Pulse files
- do not create vague catch-all homes just to move code faster

Preferred direction:

- small package trees
- obvious domain grouping
- short file-to-responsibility distance

---

### 2. No Mega Classes

- large systems must be broken into smaller classes
- avoid Pulse equivalents of files like `masm_codegen.rs` as one massive unit
- when a subsystem grows, split it into packages and focused classes early

Example direction:

- `backend.emission.masm.*`
- `compiler.analysis.*`
- `compiler.lowering.*`
- `runtime.memory.*`

The exact package names may change, but the rule does not:

- no giant “everything for this subsystem” file

---

### 3. KISS By Default

Keep it simple.

- each class should do one direct thing
- what a class does should be obvious from opening it
- avoid clever layering that hides basic behavior
- avoid incidental abstraction that exists only because the Rust source looked that way

If the simple shape works, use it.

---

### 4. Optimize For Human Iteration

The compiler/runtime codebase is for humans to work in after bootstrap shrinks.

That means:

- small files
- clear names
- shallow lookup paths
- direct control flow
- low surprise

If a human opens a file and does not want to touch it because it is too large or
too tangled, the port shape is wrong.

---

### 5. Runtime Must Follow The Same Rule

The runtime is not exempt.

- runtime structures must also be readable
- runtime ownership/memory/interop code must also be navigable
- do not allow “low-level” to become an excuse for giant unreadable files

---

### 6. Fix Friction At The Right Layer

If the port wants a clean/simple shape but the language/runtime/bootstrap makes
that awkward:

- stop
- go back to the bootstrap, backend, or stdlib
- fix the underlying limitation there

Do not force an ugly Pulse port shape just to push through a temporary language
or runtime limitation.

The rule is:

- fix the substrate
- then continue the port cleanly

---

### 7. Do Not Promise Cleanup Later

If a ported subsystem starts turning into a blob:

- split it immediately
- do not say “we’ll clean it later”

Deferred cleanup is how permanent code bloat lands.

---

### 8. Port By Subsystem Slices

When bringing up compiler/runtime code:

- define the package map first
- move one subsystem slice at a time
- keep each slice small enough to validate and read comfortably

Do not do:

- one giant import of a Rust subsystem into one Pulse file

---

### 9. Port Toward Feature Ownership, Not Porting Milestones

- subsystem slices may move incrementally
- temporary slice-level validation is allowed during bring-up
- once a feature is whole, its lock surface must also become whole
- permanent locks must converge to full feature behavior
- do not fossilize staged migration locks as the final truth surface

---

## Working Test

A good ported class/package should pass this test:

- a human can open it, understand what it owns, and change it without first
  decoding a giant cross-cutting blob

If that test fails, the structure needs to be simplified.
