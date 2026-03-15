# com.pulse.collections.Set

Kind: ``interface``

Source: ``stdlib/src/com/pulse/collections/Set.pulse``

## Summary

Unique-value collection contract.

## Declaration

```pulse
interface Set
```

## Members

### ``int size();``

Returns the number of unique values currently stored in the set.
Use this before size-sensitive operations or emptiness checks.

### ``boolean isEmpty();``

Reports whether the set currently stores any values.
Use this as the baseline emptiness check for unique-value containers.

### ``void clear();``

Removes all values from the set.
Use this to reset a mutable set to its empty state.

### ``void add(String value);``

Adds a value to the set if it is not already present.
Use this when preserving uniqueness matters.

### ``boolean contains(String value);``

Reports whether the supplied value is present in the set.
Use this for membership checks against string values.
