# pulse.collections.Collection

Kind: ``interface``

Source: ``stdlib/src/pulse/collections/Collection.pulse``

## Summary

Minimal collection contract for sized mutable containers.

## Declaration

```pulse
interface Collection<T> extends Iterable
```

## Members

### ``int size();``

Returns the number of values currently stored in the collection.
Use this before indexed access or to test for emptiness.

### ``boolean isEmpty();``

Reports whether the collection currently stores any values.
Use this as the baseline emptiness check across mutable containers.

### ``void clear();``

Removes all values from the collection.
Use this to reset a mutable container to its empty state.

### ``boolean add(T value);``

Adds a value to the collection.
Use this as the raw-object baseline before generics are available.

### ``boolean contains(T value);``

Reports whether the supplied value is present in the collection.
Use this as the raw-object membership baseline before generics are available.

### ``boolean remove(T value);``

Removes the supplied value when it is present in the collection.
Use this as the shared raw-object removal baseline.

### ``boolean containsAll(Collection<T> values);``

Reports whether every value in the supplied collection is present in this collection.
Use this as the shared bulk collection-query baseline.

### ``boolean addAll(Collection<T> values);``

Adds all values exposed by the supplied collection into this collection.
Use this as the current bulk collection-mutation baseline before richer generic helpers exist.

### ``boolean removeAll(Collection<T> values);``

Removes every value in the supplied collection from this collection.
Use this as the shared bulk collection-removal baseline.

### ``boolean retainAll(Collection<T> values);``

Retains only the values from the supplied collection in this collection.
Use this as the shared bulk collection-filtering baseline.
