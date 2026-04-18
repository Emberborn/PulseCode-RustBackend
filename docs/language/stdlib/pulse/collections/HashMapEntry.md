# pulse.collections.HashMapEntry

Kind: ``class``

Source: ``stdlib/src/pulse/collections/HashMapEntry.pulse``

## Summary

Internal entry node used by the raw-object map storage.

## Declaration

```pulse
final class HashMapEntry
```

## Members

### ``public HashMapEntry(Object key, Object value)``

Creates one key/value entry node.

### ``public Object getKey()``

Returns the key stored in this entry.

### ``public Object getValue()``

Returns the value stored in this entry.

### ``public void setValue(Object value)``

Replaces the value stored in this entry.

### ``public boolean hasIntValue()``

Reports whether this entry currently stores an int helper value.

### ``public int getIntValue()``

Returns the int helper value stored in this entry.

### ``public void setIntValue(int value)``

Replaces the value stored in this entry with an int helper value.

### ``public HashMapEntry getNext()``

Returns the next entry in the chain.

### ``public void setNext(HashMapEntry next)``

Replaces the next entry link.
