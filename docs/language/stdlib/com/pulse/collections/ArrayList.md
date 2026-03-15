# com.pulse.collections.ArrayList

Kind: ``class``

Source: ``stdlib/src/com/pulse/collections/ArrayList.pulse``

## Summary

Runtime-backed resizable list implementation.

## Declaration

```pulse
class ArrayList implements Collection, List
```

## Members

### ``public ArrayList()``

Creates an empty runtime-backed list.
Use this when code needs append-oriented list storage.

### ``public int size()``

Returns the number of values stored in the list.
Use this before indexed access or to test for emptiness.

### ``public boolean isEmpty()``

Reports whether the list currently stores any values.
Use this before indexed reads when empty-list behavior should be avoided.

### ``public void clear()``

Removes all values from the list.
Use this to reuse an existing list instance.

### ``public void add(int value)``

Appends an integer to the list.
Use this when building primitive integer sequences.

### ``public void add(String value)``

Appends a string to the list.
Use this when building ordered text sequences.

### ``public int getInt(int index)``

Returns the integer value stored at the supplied index.
Use this for indexed primitive reads from the list.

### ``public String getString(int index)``

Returns the string value stored at the supplied index.
Use this for indexed text reads from the list.
