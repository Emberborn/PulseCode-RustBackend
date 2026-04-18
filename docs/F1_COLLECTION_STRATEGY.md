# F1 Collection Strategy

This document is the `F1-49` strategy pass for `com.aden.collections`.

It defines how the current bootstrap collection surface relates to the later Java-close collection model, so the remaining F1 collection work does not drift between temporary lane-specific APIs and the final generic direction.

## Strategy Goal

Aden needs collections that are useful before self-host and still compatible with the later Java-close direction.

That means:

- keep the current runtime-backed bootstrap containers usable for real code now
- do not pretend the current int/string-lane contracts are the final model
- move toward generic collection contracts as the real long-term public shape
- preserve only the compatibility shims that are justified during transition

## Stage 1: Current Bootstrap Surface

This is the current shipped baseline documented by `F1-48`.

Characteristics:

- lane-specific methods like `add(int)`, `add(String)`, `getInt`, `getString`
- string-key map baseline
- queue/deque limited to int flows
- `Array` as a fixed-length int/string runtime facade
- iteration supported only through selected special cases

Purpose:

- make compiler/runtime/stdlib authoring practical before the full collection story lands
- provide deterministic runtime-backed storage now

Status:

- valid as a bootstrap stage
- not the final Java-close public model

## Stage 2: Transitional Generic Public Contracts

Once the selected F1 generic baseline is applied to collections, the public contract should shift to generic collection interfaces and concrete classes.

Target direction:

- `Collection<T>`
- `List<T>`
- `Set<T>`
- `Queue<T>`
- `Deque<T>`
- `Map<K, V>`
- `Array<T>` only if it remains a deliberate Aden container, not as a stand-in for native arrays

Rules for this stage:

- generic contracts become the primary documented surface
- current lane-specific bootstrap methods become compatibility shims or are fenced explicitly
- new collection work should prefer the generic contract unless a bootstrap-only exception is documented

## Stage 3: Java-Close Collection Shape

After the generic contract is in place, the collection family should be hardened toward the selected Java-close subset.

That includes:

- coherent contract growth across interfaces and concrete types
- iteration and iterator behavior
- nullability/ownership/runtime semantics
- utility families like `Arrays` / `Collections`
- explicit policy for unsupported Java APIs instead of accidental gaps

This hardening is spread across:

- `F1-50`
- `F1-53`
- `F1-54`
- `F1-55`
- later value-kind/final-shape closure under `F1-109` and `F1-110` after the now-locked `F1-108` generic public-surface work

## Public Ownership Rules

The public collection API should converge on stdlib-owned collection classes and interfaces, not a widening runtime-intrinsic surface.

That means:

- runtime intrinsics remain low-level backing only
- collection behavior should move upward into stdlib code whenever practical
- the public collection story should read like a normal library surface, not like direct runtime calls

## Compatibility Rules

The current bootstrap APIs are allowed to exist before self-host, but only under these rules:

- they are transitional, not the final advertised collection model
- they stay documented honestly as bootstrap lanes
- they can remain during migration if needed for self-host practicality
- they should not block the generic public contracts from becoming the primary shape once ready

## Specific F1 Consequences

`F1-49` locks these decisions:

- current lane-specific collection APIs are bootstrap, not final
- the real target is generic public collection contracts
- later collection expansion should be organized around that target instead of adding more ad hoc lane-specific APIs
- `com.aden.collections.Array` must be revisited explicitly rather than silently treated as equivalent to both Java collections and native arrays

## Follow-On Tasks

`F1-49` is strategy only. Implementation closure continues in:

- `F1-50` contract expansion
- `F1-53` iteration contract
- `F1-54` utility/container family expansion
- `F1-55` runtime/nullability/ownership hardening
- `F1-108` generic collection public-surface closure
- `F1-109` self-host collection value-kind closure
- `F1-110` final Java-close collection-shape closure

## Honest Summary

Before self-host, Aden keeps the current bootstrap collection surface because it is useful.

But the locked strategy is now explicit:

- bootstrap lane-specific collections are temporary compatibility scaffolding
- generic stdlib collection contracts are the intended public direction
- later F1 collection work must move toward that direction instead of deepening the temporary shape
