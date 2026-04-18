# pulse.collections.HashMapEntryIterator

Kind: ``class``

Source: ``stdlib/src/pulse/collections/HashMapEntryIterator.pulse``

## Summary

Sequential iterator over the current entry view inside a raw-object hash map.

## Declaration

```pulse
final class HashMapEntryIterator implements Iterator
```

## Members

### ``public HashMapEntryIterator(HashMap map)``

Creates an iterator over the supplied map's current entries.

### ``public boolean hasNext()``

Reports whether another entry is available from the iterator.

### ``public Object next()``

Returns the next entry from the iterator.
