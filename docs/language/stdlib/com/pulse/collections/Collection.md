# com.pulse.collections.Collection

Kind: ``interface``

Source: ``stdlib/src/com/pulse/collections/Collection.pulse``

## Summary

Minimal collection contract for sized mutable containers.

## Declaration

```pulse
interface Collection
```

## Members

### ``int size();``

Returns the number of values currently stored in the collection.
Use this before indexed access or to test for emptiness.

### ``void clear();``

Removes all values from the collection.
Use this to reset a mutable container to its empty state.
