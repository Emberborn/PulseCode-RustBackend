# aden.collections.LinkedListIterator

Kind: ``class``

Source: ``stdlib/src/aden/collections/LinkedListIterator.aden``

## Summary

Sequential iterator over the current linked-list node chain.

## Declaration

```aden
final class LinkedListIterator implements Iterator
```

## Members

### ``public LinkedListIterator(LinkedListNode first)``

Creates an iterator starting at the supplied node.

### ``public boolean hasNext()``

Reports whether another value is available from the iterator.

### ``public Object next()``

Returns the next value from the iterator.
