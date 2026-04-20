# pulse.concurrent.AtomicLong

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/AtomicLong.pulse``

## Summary

Low-level host-backed atomic 64-bit cell.
This is the retained 64-bit primitive for future runtime ownership, scheduling, and futures.

## Declaration

```pulse
public final class AtomicLong implements AutoCloseable
```

## Members

### ``public static AtomicLong create(long initialValue)``

Allocates a new atomic long with the requested initial value.

### ``public boolean isClosed()``

Returns whether this atomic cell has already been closed.

### ``public long get()``

Reads the current long value from the host-backed atomic cell.

### ``public void set(long value)``

Stores a new long value into the host-backed atomic cell.

### ``public boolean compareAndSet(long expected, long replacement)``

Performs a compare-and-set against the current long value.

### ``public long getAndSet(long value)``

Replaces the current long value and returns the previous value.

### ``public long getAndAdd(long delta)``

Adds the requested delta and returns the previous value.

### ``public long addAndGet(long delta)``

Adds the requested delta and returns the updated value.

### ``public long incrementAndGet()``

Increments by one and returns the updated value.

### ``public long getAndIncrement()``

Increments by one and returns the previous value.

### ``public void close()``

Releases the host-backed storage for this atomic cell.
