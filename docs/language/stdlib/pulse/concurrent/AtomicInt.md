# pulse.concurrent.AtomicInt

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/AtomicInt.pulse``

## Summary

Low-level host-backed atomic 32-bit cell.
This is the first real atomic floor for later synchronized, executor, and future work.

## Declaration

```pulse
public final class AtomicInt implements AutoCloseable
```

## Members

### ``public static AtomicInt create(int initialValue)``

Allocates a new atomic int with the requested initial value.

### ``public boolean isClosed()``

Returns whether this atomic cell has already been closed.

### ``public int get()``

Reads the current int value from the host-backed atomic cell.

### ``public void set(int value)``

Stores a new int value into the host-backed atomic cell.

### ``public boolean compareAndSet(int expected, int replacement)``

Performs a compare-and-set against the current int value.

### ``public int getAndSet(int value)``

Replaces the current int value and returns the previous value.

### ``public int getAndAdd(int delta)``

Adds the requested delta and returns the previous value.

### ``public int addAndGet(int delta)``

Adds the requested delta and returns the updated value.

### ``public int incrementAndGet()``

Increments by one and returns the updated value.

### ``public int getAndIncrement()``

Increments by one and returns the previous value.

### ``public void close()``

Releases the host-backed storage for this atomic cell.
