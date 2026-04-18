# F1 Collection API Inventory

This document is the `F1-48` inventory pass for the current `com.aden.collections` surface.

It does not define the final collection API. It records what is actually shipped now, what that means relative to Java-close expectations, and which later F1 tasks must close the remaining gaps.

## Current Surface

Current collection/stdlike types in F1:

- `com.aden.collections.Array`
- `com.aden.collections.Collection`
- `com.aden.collections.List`
- `com.aden.collections.ArrayList`
- `com.aden.collections.LinkedList`
- `com.aden.collections.Set`
- `com.aden.collections.HashSet`
- `com.aden.collections.Map`
- `com.aden.collections.HashMap`
- `com.aden.collections.Queue`
- `com.aden.collections.Deque`
- `com.aden.collections.Arrays`
- `com.aden.collections.Collections`

## Self-Host Readiness Snapshot

Current verdict:

- collections are now strong enough for the generic self-host public surface needed in F1
- collections are not yet the final Java-close or fully uniform "any primitive / any object / any class" story
- the stable supported self-host pattern today is generic reference/object-heavy usage plus the retained raw bridge and explicit `int` compatibility seams where those seams are still intentional

What is solid today:

- generic collection contracts across `Collection<T>` / `List<T>` / `Set<T>` / `Queue<T>` / `Deque<T>` / `Map<K,V>` and the main concrete collection classes
- explicit generic constructor calls such as `new ArrayList<String>()` and `new HashMap<String, Box>()`
- wrapper-based generic usage such as `List<Integer>`, `Map<String, Integer>`, and `Queue<Integer>` without routing through `getInt` / `putInt`
- storing and retrieving reference types and user-defined class instances through the raw-object bridge
- storing and querying `String` values through both raw-object and string convenience seams
- storing and querying `int` values through the explicit helper seams that exist today
- object-stream iteration for `Collection` / `List` / `Set` plus key iteration for `Map`
- deterministic self-bulk mutation behavior for the currently shipped bulk helpers
- selected map views through the stable raw-object bridge: live non-fail-fast `keySet()` / `values()` plus copy-style `entrySet()`

What is not yet a locked "fully complete" story:

- no uniform primitive support across all collection families
- no locked raw-object contract for boxed primitives beyond the currently shipped `Integer`-based compatibility slices
- no broad helper surface for `long`, `boolean`, `char`, `float`, `double`, unsigned Aden primitives, or arbitrary boxed wrapper families
- no final typed iterator/view model
- no full Java-style live map-view family; `keySet()` / `values()` are now live non-fail-fast views, while `entrySet()` remains copy-style rather than a live nested `Map.Entry` contract
- direct `null` calls at overlapping `Object` / `String` overload sites remain compile-time ambiguous

## Current Value-Kind Matrix

This matrix is the truthful support summary for the current shipped collection family.

| Value kind | Current status | Notes |
|---|---|---|
| user classes / interfaces / raw `Object` references | Supported | this is the main self-host bridge |
| `String` references | Supported | both raw-object and convenience seams exist |
| primitive `int` | Supported | wrapper-based generic usage now works and explicit helper seams still exist |
| boxed `Integer` via generic/reference path | Supported | `List<Integer>`, `Map<String, Integer>`, and `Queue<Integer>` are now executable without primitive-specific helper calls |
| other boxed wrappers (`Long`, `Boolean`, `Character`, `Float`, `Double`, unsigned wrappers) | Not locked as collection-wide support | do not treat as complete collection support yet |
| primitive `long` / `boolean` / `char` / `float` / `double` | Not collection-wide | no broad helper families or hardened raw-object behavior |
| Aden unsigned primitives/wrappers | Not collection-wide | outside the current locked collection bridge |
| `null` values / keys | Partially supported | raw-object presence flows are covered, but overlapping `Object` / `String` overload sites are still ambiguous for direct `null` calls |

## Shipped Contracts

### `Array`

Current shipped shape:

- fixed-length runtime-backed array facade
- `length()`
- `getInt(int)` / `setInt(int, int)`
- `getString(int)` / `setString(int, String)`
- `iterator()`
- object-stream `foreach` / `Iterator` support once writes establish the array lane

Current limitation:

- narrow int/string lane facade only
- not generic
- not aligned with Java `Arrays` utility or collection contracts
- object-stream iteration is honest only after writes establish either the int lane or the string lane; non-empty unknown-lane arrays intentionally fail instead of guessing

Return point:

- `F1-53`
- `F1-54`

### `Collection`

Current shipped shape:

- `Collection` now extends `com.aden.lang.Iterable`
- `size()`
- `isEmpty()`
- `clear()`
- `add(Object)`
- `contains(Object)`
- `remove(Object)`
- `containsAll(Collection)`
- `addAll(Collection)`
- `removeAll(Collection)`
- `retainAll(Collection)`
- `iterator()`

Current limitation:

- no `remove(...)` baseline yet
- current iteration baseline is object-stream only
- no broader typed/fail-fast/view policy yet

Return point:

- `F1-53`

### `List`

Current shipped shape:

- `List` now extends `Collection`
- raw-object bridge:
  - inherited `add(Object)` / `contains(Object)` from `Collection`
  - inherited `iterator()`
  - `add(int, Object)`
  - `get(int)`
  - `remove(int)`
  - `remove(Object)`
  - `set(int, Object)`
  - `indexOf(Object)`
- compatibility overloads:
  - `add(int)`
  - `add(String)`
- `add(int, int)` / `add(int, String)`
- `getInt(int)`
- `getString(int)`
- `set(int, int)` / `set(int, String)`
- `contains(int)` / `contains(String)`
- `indexOf(int)` / `indexOf(String)`

Current limitation:

- still not generic
- `get(...)` is now raw-object, but `getInt` / `getString` still remain as compatibility seams because the current non-generic model cannot resolve return-type-only overloads honestly
- boxed-primitive traffic through the raw-object bridge is not yet the hardened contract; the stable F1 bridge today is reference/object-heavy usage plus the explicit compatibility helpers
- no richer view/sublist policy
- list contract is still much thinner than Java `List` even after the current indexed/value mutation and reverse-query helper slice

Return point:

- `F1-49`
- `F1-53`

### `ArrayList`

Current shipped shape:

- Aden-owned mutable list
- implements `List`
- inherits the shared `size()` / `isEmpty()` / `clear()` baseline through `Collection`
- exposes the raw-object `List` bridge plus int/string compatibility overloads
- now includes `indexOf(...)` / `lastIndexOf(...)` helper coverage through the shared list bridge
- currently delegates to the shared raw-object `LinkedList` baseline
- explicit bounds panics
- inherits the current object-stream iterator baseline through `Collection`

Current limitation:

- still not generic
- still lacks iterator/view helpers
- no richer list behaviors yet

Return point:

- `F1-49`
- `F1-55`

### `LinkedList`

Current shipped shape:

- raw-object linked-node container implementing `List` and `Deque`
- one shared logical sequence for list, queue, and deque operations
- reaches `Collection` through `List` and reaches `Queue` through `Deque`
- common `size()` / `isEmpty()` / `clear()` baseline across those inherited interfaces
- raw-object list baseline:
  - inherited `add(Object)` / `contains(Object)` from `Collection`
  - `add(int, Object)`
  - `get(int)`
  - `getFirst()` / `getLast()`
  - `remove(int)`
  - `remove(Object)`
  - `set(int, Object)`
  - `indexOf(Object)`
  - `lastIndexOf(Object)`
- raw-object queue/deque baseline:
  - `offer(Object)`
  - `poll()`
  - `peek()`
  - `addFirst(Object)` / `addLast(Object)`
  - `offerFirst(Object)` / `offerLast(Object)`
  - `getFirst()` / `getLast()`
  - `removeFirst()` / `removeLast()`
  - `pollFirst()` / `pollLast()`
  - `peekFirst()` / `peekLast()`
  - `removeFirstOccurrence(Object)` / `removeLastOccurrence(Object)`
- int/string compatibility overloads remain on top of that bridge
- inherits the current object-stream iterator baseline through `Collection`

Current limitation:

- still not generic
- list/query breadth is still thin beyond the current indexed/value mutation, reverse-query, and deque occurrence-removal baseline
- current iteration baseline is non-fail-fast and object-stream only

Return point:

- `F1-49`
- `F1-53`
- `F1-55`

### `Set` and `HashSet`

Current shipped shape:

- `Set` now extends `Collection`
- raw-object uniqueness baseline through inherited `add(Object)` / `contains(Object)`
- raw-object removal baseline through `remove(Object)`
- string convenience overloads remain on `Set`, including `add(String)` / `contains(String)` / `remove(String)`
- `addAll(Collection)` now exists as the current bulk set helper baseline
- `containsAll(Collection)` and `removeAll(Collection)` now exist as the current bulk set query/removal baseline
- `retainAll(Collection)` now exists as the current bulk set filtering baseline
- `HashSet` now composes through the shared raw-object `Map` contract instead of owning raw map intrinsics directly
- `HashSet` now exposes the shared object-stream iterator baseline through `Collection`
- `HashSet` now supports raw-object/string removal through the shared map-backed bridge

Current limitation:

- still not generic
- no richer set helper family or coherent typed/generic story yet
- current implementation is map-backed rather than a richer set contract

Return point:

- `F1-49`
- `F1-53`

### `Map` and `HashMap`

Current shipped shape:

- `Map` is the shared raw-object key/value interface
- `HashMap` is the current Aden-owned raw-object concrete implementation
- `size()`
- `isEmpty()`
- `clear()`
- `containsKey(Object)`
- `containsKey(String)`
- `put(Object, Object)`
- `put(String, String)`
- `putInt(String, int)`
- `putAll(Map)`
- `putIfAbsent(Object, Object)`
- `putIfAbsent(String, String)`
- `replace(Object, Object)`
- `replace(String, String)`
- `get(Object)`
- `get(String)`
- `getInt(String)`
- `getOrDefault(Object, Object)`
- `getOrDefault(String, String)`
- `getIntOrDefault(String, int)`
- `remove(Object)`
- `remove(String)`
- `containsValue(Object)` / `containsValue(String)` / `containsValue(int)`
- `keyIterator()`
- copy-style `entrySet()`
- live `keySet()`
- live `values()`

Current limitation:

- still not generic
- convenience lanes remain string-key/int-value oriented for compatibility
- boxed primitives stored through the raw-object bridge are not yet the hardened contract
- only `HashMap` currently realizes the `Map` contract
- current iteration policy is still non-fail-fast and key-driven; `keySet()` / `values()` are live map-backed views, while `entrySet()` remains a copy-style helper instead of a live nested Java view contract
- `putAll(Map)` now exists as the current bulk map helper baseline and preserves the current string-key/int helper compatibility lane for `HashMap` sources
- `putIfAbsent(...)`, `getOrDefault(...)`, and `getIntOrDefault(...)` now exist as the current default/conditional helper baseline
- `replace(...)` now exists as the current conditional map-update baseline
- `F1-55` now locks self-bulk mutation determinism (`addAll(this)` / `putAll(this)` / `removeAll(this)` / `retainAll(this)`) instead of leaving those runtime paths implied
- direct `null` calls against overlapping `Object` / `String` overload pairs remain compile-time ambiguous in the current baseline; use an explicit `Object`-typed local/reference when the raw-object path is intended
- `keySet()` / `values()` now exist as live non-fail-fast map-backed views that reflect map mutation through the selected F1 baseline
- `entrySet()` now exists as a copy-style `Set<MapEntry>` baseline through the top-level `com.aden.collections.MapEntry` value type rather than a live nested `Map.Entry` contract
- no broader live Java-close map semantics yet

Return point:

- `F1-49`
- `F1-52`
- `F1-53`
- `F1-55`

### `Queue` and `Deque`

Current shipped shape:

- `Queue` now extends `Collection`
- `Deque` now extends `Queue`
- queue baseline:
  - `size()`
  - `clear()`
  - `offer(Object)`
  - `offer(int)`
  - `poll()`
  - `remove()`
  - `peek()`
  - `element()`
  - `isEmpty()`
- deque baseline:
  - `size()`
  - `clear()`
  - `addFirst(Object)`
  - `addFirst(int)`
  - `addLast(Object)`
  - `addLast(int)`
  - `offerFirst(Object)` / `offerLast(Object)`
  - `getFirst()` / `getLast()`
  - `removeFirst()`
  - `removeLast()`
  - `pollFirst()` / `pollLast()`
  - `peekFirst()`
  - `peekLast()`
  - `push(Object)` / `push(int)`
  - `pop()`
  - `removeFirstOccurrence(Object)` / `removeLastOccurrence(Object)`
  - `isEmpty()`

Current limitation:

- still not generic
- current iteration baseline is non-fail-fast and object-stream only
- boxed primitives routed through queue/deque object storage are not yet the hardened contract
- currently realized only through `LinkedList`

Return point:

- `F1-49`
- `F1-53`

### Utility Families

Current shipped shape:

- `Arrays`
  - `asList(Array)`
  - `indexOf(Array, int)` / `indexOf(Array, String)`
  - `contains(Array, int)` / `contains(Array, String)`
- `Collections`
  - `addAll(Collection, Collection)`
  - `frequency(Collection, Object)`
  - `reverse(List)`
  - `emptyList()`
  - `emptySet()`
  - `emptyMap()`
  - `singletonList(Object)`
  - `singleton(Object)`
  - `singletonMap(Object, Object)`

Current limitation:

- intentionally small and non-generic
- empty/singleton helper coverage is now broader and usable for self-host code, but does not imply immutable-wrapper semantics
- no live view wrappers, sorting/shuffling helpers, comparator-based helpers, or live `Map.Entry`/entry-view utility support
- utility helpers target the current raw-object self-host bridge, not the later generic public direction

Return point:

- `F1-54`
- `F1-108`
- `F1-109`
- `F1-110`

## Cross-Cutting Gaps Versus Java-Close Expectations

The current collection surface is useful and now has a real raw-object self-host bridge, but it is still not the final Java-close collection model.

Main gaps:

- the generic collection story is now real and the value-kind closure is locked for self-host, but the final Java-shape closure is still incomplete
- legacy lane-specific helpers still remain as compatibility seams and should not be treated as the preferred Java-like public model
- the executable value-kind matrix is now much broader than the original `Integer` proof: object references, user classes, `String`, `null`, Java-style wrappers, and Aden unsigned wrappers all work through generic `List<T>` / `Map<K,V>` / `Queue<T>` flows on the real backend lane
- direct primitive insertion for int-widening lanes now resolves to the exact wrapper/generic path instead of being hijacked by the legacy `add(int)` / `offer(int)` compatibility seam
- boxed-primitive use through raw-object storage still needs more runtime hardening
- collection completeness today should be read as "generic self-host public surface plus explicit compatibility seams plus a broad executable wrapper/reference matrix", not "all primitives and wrappers are uniformly first-class across the family"
- the hierarchy is now coherent, but the method families on top of it are still thin
- current collection iteration is a non-fail-fast object-stream baseline, not the final typed/generic iterator model
- list/set/map now have a raw-object membership/query baseline, but broader CRUD/query families are still incomplete
- concrete classes now have a usable object-capable bridge, but that closure is not complete yet across the family
- the current object-stream/key-iteration baseline now covers `Collection` / `List` / `Set`, `com.aden.collections.Array`, and map key traversal, but not yet a fuller map/view family
- current contracts do not yet expose the familiar Java utility and view families
- `Arrays` / `Collections` now exist, but only as a deliberately small utility baseline rather than a broad Java-final utility surface
- nullability/ownership/runtime behavior is now explicitly locked for the current pre-generic collection baseline, including deterministic self-bulk mutation behavior and the current live/copy split for map views
- direct `null` at overlapping `Object` / `String` overload sites remains an explicit compile-time ambiguity rather than a hidden runtime rule
- legacy `getInt` / `getString` / `putInt` style helpers should not be mistaken for the end-state public model
- `com.aden.collections.Array` is now an explicitly limited fixed-length helper with `int` / `String` lanes plus object-stream iteration once a lane is established; it should not be read as the final generic Java-array replacement for self-host code

## Required Return Tasks

`F1-48` only inventories the surface. The real closure work continues in:

- `F1-49` staged collection strategy before and after generics
- `F1-51` list helper growth on top of the locked baseline
- `F1-52` map/set helper growth on top of the locked baseline
- `F1-53` iteration contract closure
- `F1-54` utility/container family expansion
- `F1-55` nullability/ownership/runtime behavior hardening
- `F1-109` self-host collection value-kind closure
- `F1-110` final Java-close collection-shape closure

## Honest F1 Summary

Current F1 collections are now strong enough to act as the generic public collection surface needed for self-host-oriented compiler/runtime code, and the selected F1 Java-close collection subset is now explicit and locked.

More concretely: the current collection family is self-host-usable for generic object/reference-heavy compiler code and the shipped compatibility seams, but it should not yet be described as uniformly complete for arbitrary primitive and boxed-wrapper traffic across all collection contracts.

Preferred Java-like direction:

- use generic collections plus wrapper/reference types as the primary public model
- for example, prefer `Map<String, Integer>` over `putInt` / `getInt` in new self-host code
- treat primitive-specific helpers as compatibility seams until `F1-109` decides what survives into the final F1 surface
- broad wrapper/reference traffic is now already validated end to end for `Byte`, `Short`, `Integer`, `Long`, `Boolean`, `Char`, `Float`, `Double`, `UByte`, `UShort`, `UInteger`, `ULong`, user classes, `String`, and `null`
- direct primitive insertion for int-widening lanes is now validated through the generic wrapper path instead of widening into the legacy helper seam
- `com.aden.collections.Array` remains intentionally narrower than generic collections: use it as the current runtime-backed fixed-length `int` / `String` helper, and prefer generic collections or native arrays when self-host code needs broader reference/value traffic

That is intentional for the current phase, and this inventory is the reference point for the next collection workstream slices.
