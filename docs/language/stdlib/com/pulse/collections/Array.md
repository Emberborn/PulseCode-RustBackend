# com.pulse.collections.Array

Kind: ``class``

Source: ``stdlib/src/com/pulse/collections/Array.pulse``

## Summary

Runtime-backed fixed-length array facade for primitive and string lanes.

## Declaration

```pulse
class Array
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
