# com.pulse.collections.HashSet

Kind: ``class``

Source: ``stdlib/src/com/pulse/collections/HashSet.pulse``

## Summary

Runtime-backed set implementation for string values.

## Declaration

```pulse
class HashSet implements Set
```

## Members

### ``public HashSet()``

Creates an empty runtime-backed set.
Use this when preserving uniqueness across string values.

### ``public int size()``

Returns the number of unique values in the set.
Use this for sizing checks or emptiness decisions.

### ``public void clear()``

Removes all values from the set.
Use this to reuse a mutable set instance.

### ``public void add(String value)``

Adds a string value to the set if it is not already present.
Use this when duplicate string values should collapse to one entry.

### ``public boolean contains(String value)``

Reports whether the supplied string is already stored in the set.
Use this for membership checks before conditional work.
