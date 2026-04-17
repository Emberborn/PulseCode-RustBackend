# pulse.collections.HashMapValueIterator

Kind: ``class``

Source: ``stdlib/src/pulse/collections/HashMapValueIterator.pulse``

## Summary

Sequential iterator over the current values inside a raw-object hash map.

## Declaration

```pulse
final class HashMapValueIterator implements Iterator
```

## Members

### ``public HashMapValueIterator(HashMap map)``

Creates an iterator over the supplied map's current values.

### ``public boolean hasNext()``

Reports whether another value is available from the iterator.

### ``public Object next()``

Returns the next value from the iterator.
