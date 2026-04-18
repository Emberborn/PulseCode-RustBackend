# pulse.collections.ArrayIterator

Kind: ``class``

Source: ``stdlib/src/pulse/collections/ArrayIterator.pulse``

## Summary

Sequential iterator over the current fixed-length array facade.

## Declaration

```pulse
final class ArrayIterator implements Iterator
```

## Members

### ``public ArrayIterator(Array array)``

Creates an iterator over the supplied array snapshot.

### ``public boolean hasNext()``

Reports whether another value is available from the iterator.

### ``public Object next()``

Returns the next value from the iterator.
