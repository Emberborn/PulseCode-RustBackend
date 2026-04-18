# aden.collections.HashMapEntryIterator

Kind: ``class``

Source: ``stdlib/src/aden/collections/HashMapEntryIterator.aden``

## Summary

Sequential iterator over the current entry view inside a raw-object hash map.

## Declaration

```aden
final class HashMapEntryIterator implements Iterator
```

## Members

### ``public HashMapEntryIterator(HashMap map)``

Creates an iterator over the supplied map's current entries.

### ``public boolean hasNext()``

Reports whether another entry is available from the iterator.

### ``public Object next()``

Returns the next entry from the iterator.
