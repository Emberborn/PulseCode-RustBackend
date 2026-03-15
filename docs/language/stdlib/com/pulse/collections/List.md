# com.pulse.collections.List

Kind: ``interface``

Source: ``stdlib/src/com/pulse/collections/List.pulse``

## Summary

Indexed collection contract for ordered values.

## Declaration

```pulse
interface List
```

## Members

### ``int size();``

Returns the number of values currently stored in the list.
Use this before indexed access or to test for emptiness.

### ``boolean isEmpty();``

Reports whether the list currently stores any values.
Use this as the baseline emptiness check for ordered containers.

### ``void clear();``

Removes all values from the list.
Use this to reset an ordered container to its empty state.

### ``void add(int value);``

Appends an integer value to the list.
Use this when building an ordered integer sequence.

### ``void add(String value);``

Appends a string value to the list.
Use this when building an ordered text sequence.

### ``int getInt(int index);``

Returns the integer at the supplied index.
Use this when reading back primitive values by position.

### ``String getString(int index);``

Returns the string at the supplied index.
Use this when reading back text values by position.
