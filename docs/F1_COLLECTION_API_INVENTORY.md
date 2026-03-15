# F1 Collection API Inventory

This document is the `F1-48` inventory pass for the current `com.pulse.collections` surface.

It does not define the final collection API. It records what is actually shipped now, what that means relative to Java-close expectations, and which later F1 tasks must close the remaining gaps.

## Current Surface

Current collection/stdlike types in F1:

- `com.pulse.collections.Array`
- `com.pulse.collections.Collection`
- `com.pulse.collections.List`
- `com.pulse.collections.ArrayList`
- `com.pulse.collections.LinkedList`
- `com.pulse.collections.Set`
- `com.pulse.collections.HashSet`
- `com.pulse.collections.Map`
- `com.pulse.collections.HashMap`
- `com.pulse.collections.Queue`
- `com.pulse.collections.Deque`

## Shipped Contracts

### `Array`

Current shipped shape:

- fixed-length runtime-backed array facade
- `length()`
- `getInt(int)` / `setInt(int, int)`
- `getString(int)` / `setString(int, String)`

Current limitation:

- narrow int/string lane facade only
- not generic
- not aligned with Java `Arrays` utility or collection contracts
- `foreach (var item : com.pulse.collections.Array)` is still not honest yet because the current contract does not expose element typing strongly enough

Return point:

- `F1-53`
- `F1-54`

### `Collection`

Current shipped shape:

- `size()`
- `clear()`

Current limitation:

- no `isEmpty()`
- no `contains(...)`
- no add/remove baseline
- no iteration contract on the interface itself

Return point:

- `F1-50`
- `F1-53`

### `List`

Current shipped shape:

- `size()`
- `clear()`
- `add(int)`
- `add(String)`
- `getInt(int)`
- `getString(int)`

Current limitation:

- lane-specific overload design instead of a coherent generic or object model
- no `set`, `remove`, `contains`, `indexOf`, `add(index, value)`, iterator, or view/sublist policy
- list contract is much thinner than Java `List`

Return point:

- `F1-49`
- `F1-50`
- `F1-53`

### `ArrayList`

Current shipped shape:

- runtime-backed mutable list
- implements `Collection`, `List`
- int/string append and indexed get
- explicit bounds panics

Current limitation:

- current list lanes are int/string only
- current implementation still carries an explicit capacity panic policy
- no richer list behaviors yet

Return point:

- `F1-49`
- `F1-50`
- `F1-55`

### `LinkedList`

Current shipped shape:

- mixed facade implementing `Collection`, `List`, `Queue`, `Deque`
- list lane backed by `ArrayList`
- queue lane backed by runtime map handle
- deque lane backed by `HashMap`

Current limitation:

- current implementation is a pragmatic bootstrap shape, not a Java-close linked-node model
- list, queue, and deque behavior are multiplexed into one class with different backing strategies
- queue/deque contracts are int-only today
- no iterator contract yet

Return point:

- `F1-49`
- `F1-50`
- `F1-53`
- `F1-55`

### `Set` and `HashSet`

Current shipped shape:

- string-only uniqueness baseline
- `size()`
- `clear()`
- `add(String)`
- `contains(String)`

Current limitation:

- string-only contract
- no `remove`, iterator, or coherent object/generic story
- current implementation is map-backed rather than a richer set contract

Return point:

- `F1-49`
- `F1-50`
- `F1-53`

### `Map` and `HashMap`

Current shipped shape:

- string-key map baseline
- string and int value lanes
- `size()`
- `clear()`
- `containsKey(String)`
- `put(String, String)`
- `putInt(String, int)`
- `get(String)`
- `getInt(String)`

Current limitation:

- key type is fixed to `String`
- values are still lane-specific rather than generic/object-based
- no `remove`, `isEmpty`, key/value/entry view contracts, iteration, or broader Java-close map semantics

Return point:

- `F1-49`
- `F1-50`
- `F1-53`
- `F1-55`

### `Queue` and `Deque`

Current shipped shape:

- queue baseline:
  - `offer(int)`
  - `poll()`
  - `isEmpty()`
- deque baseline:
  - `addFirst(int)`
  - `addLast(int)`
  - `removeFirst()`
  - `removeLast()`
  - `isEmpty()`

Current limitation:

- int-only baseline
- no `peek` family
- no generic/object contract
- currently realized only through `LinkedList`

Return point:

- `F1-49`
- `F1-50`
- `F1-53`

## Cross-Cutting Gaps Versus Java-Close Expectations

The current collection surface is useful, but it is still a bootstrap/pragmatic baseline rather than a Java-close collection model.

Main gaps:

- no coherent generic collection story yet
- many interfaces are lane-specific or string-key specific
- iteration is not unified across all collections
- current contracts do not yet expose the familiar Java utility and view families
- nullability/ownership/runtime behavior still needs explicit closure as the API grows
- current `LinkedList` shape is intentionally practical, not final

## Required Return Tasks

`F1-48` only inventories the surface. The real closure work continues in:

- `F1-49` staged collection strategy before and after generics
- `F1-50` contract expansion across collection interfaces and concrete classes
- `F1-53` iteration contract closure
- `F1-54` utility/container family expansion
- `F1-55` nullability/ownership/runtime behavior hardening

## Honest F1 Summary

Current F1 collections are sufficient for real compiler/runtime-adjacent code and testing, but they are not yet the final Java-close collections story.

That is intentional for the current phase, and this inventory is the reference point for the next collection workstream slices.
