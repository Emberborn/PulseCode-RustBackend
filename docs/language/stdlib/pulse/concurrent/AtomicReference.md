# pulse.concurrent.AtomicReference

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/AtomicReference.pulse``

## Summary

Low-level host-backed atomic reference cell.
This is the explicit shared-reference publication floor for the pre-self-sustained concurrency baseline.

## Declaration

```pulse
public final class AtomicReference<T> implements AutoCloseable
```

## Members

### ``public static AtomicReference create(Object initialValue)``

Allocates a new atomic reference cell with the requested initial published value.

### ``public boolean isClosed()``

Returns whether this atomic cell has already been closed.

### ``public T get()``

Reads the current published reference.

### ``public void set(T value)``

Publishes a new reference and releases the displaced value.

### ``public boolean compareAndSet(T expected, T replacement)``

Performs a compare-and-set against the currently published reference.

### ``public T getAndSet(T value)``

Replaces the current reference and returns the previous published value.

### ``public void close()``

Clears and releases the host-backed storage for this atomic reference cell.
