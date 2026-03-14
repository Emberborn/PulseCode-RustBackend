# com.pulse.collections.HashMap

Kind: ``class``

Source: ``stdlib/src/com/pulse/collections/HashMap.pulse``

## Summary

Runtime-backed string-key map implementation.

## Declaration

```pulse
class HashMap
```

## Members

### ``public HashMap()``

Creates an empty runtime-backed hash map.
Use this when storing string-keyed values at runtime.

### ``public int size()``

Returns the number of entries currently stored in the map.
Use this for sizing checks or emptiness decisions.

### ``public void clear()``

Removes all entries from the map.
Use this to reuse a mutable map instance.

### ``public boolean containsKey(String key)``

Reports whether the supplied key is present in the map.
Use this before reads when absence must be handled explicitly.

### ``public void put(String key, String value)``

Stores a string value under the supplied key.
Use this for string-to-string map updates.

### ``public void putInt(String key, int value)``

Stores an integer value under the supplied key.
Use this for string-to-int map updates.

### ``public String get(String key)``

Returns the string value stored for the supplied key.
Use this for string-valued map lookups.

### ``public int getInt(String key)``

Returns the integer value stored for the supplied key.
Use this for integer-valued map lookups.
