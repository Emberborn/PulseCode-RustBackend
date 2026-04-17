# pulse.collections.HashMapKeyIterator

Kind: ``class``

Source: ``stdlib/src/pulse/collections/HashMapKeyIterator.pulse``

## Summary

Sequential iterator over the current key chain inside a raw-object hash map.

## Declaration

```pulse
final class HashMapKeyIterator implements Iterator
```

## Members

### ``public HashMapKeyIterator(HashMapEntry first)``

Creates an iterator starting at the supplied map entry.

### ``public boolean hasNext()``

Reports whether another key is available from the iterator.

### ``public Object next()``

Returns the next key from the iterator.
