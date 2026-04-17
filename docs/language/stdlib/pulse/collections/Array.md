# pulse.collections.Array

Kind: ``class``

Source: ``stdlib/src/pulse/collections/Array.pulse``

## Summary

Runtime-backed fixed-length array facade for primitive and string lanes.

## Declaration

```pulse
public class Array implements Iterable
```

## Members

### ``public Array(int length)``

Creates an array with the requested fixed length.
Use this when code needs indexed storage for ints or strings.

### ``public int length()``

Returns the array length.
Use this before indexed reads or writes.

### ``public int getInt(int index)``

Returns the integer stored at the supplied index.
Use this when reading primitive array lanes.

### ``public void setInt(int index, int value)``

Stores an integer at the supplied index.
Use this when mutating primitive array lanes.

### ``public String getString(int index)``

Returns the string stored at the supplied index.
Use this when reading text array lanes.

### ``public void setString(int index, String value)``

Stores a string at the supplied index.
Use this when mutating text array lanes.

### ``public int laneKind()``

Returns the current storage lane for iteration and diagnostics.

### ``public Object getObject(int index)``

Returns one array value as a boxed/raw object for iterable-style traversal.

### ``public Iterator iterator()``

Returns an iterator over the current array values using the established lane.

### ``private void ensureLane(int expectedLane)``

Locks the runtime-backed array to one lane once writes begin.
