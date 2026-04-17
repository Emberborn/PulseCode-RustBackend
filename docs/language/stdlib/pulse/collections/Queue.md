# pulse.collections.Queue

Kind: ``interface``

Source: ``stdlib/src/pulse/collections/Queue.pulse``

## Summary

Queue contract for ordered head/tail access.

## Declaration

```pulse
interface Queue<T> extends Collection<T>
```

## Members

### ``boolean offer(T value);``

Adds a value at the tail of the queue.
Use this as the raw-object queue baseline before generics are available.

### ``boolean offer(int value);``

Adds a primitive value at the tail of the queue.
Use this as the current primitive convenience overload.

### ``boolean offer(String value);``

Adds a string value at the tail of the queue.
Use this as the current string convenience overload alongside the raw-object queue baseline.

### ``T poll();``

Removes and returns the head value from the queue.
Use this as the raw-object queue read baseline before generics are available.

### ``T remove();``

Removes and returns the head value from the queue and panics when empty.
Use this as the raw-object queue removal helper baseline before generics are available.

### ``T peek();``

Returns the head value without removing it.
Use this as the raw-object queue peek baseline before generics are available.

### ``T element();``

Returns the head value without removing it and panics when empty.
Use this as the raw-object queue read helper baseline before generics are available.
