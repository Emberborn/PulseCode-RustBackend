# pulse.concurrent.AtomicBoolean

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/AtomicBoolean.pulse``

## Summary

Low-level host-backed atomic boolean cell.
This is the first flag-oriented atomic on the shipped host floor. It is intentionally
implemented over the existing 32-bit atomic lane rather than pretending a wider
Java-close VarHandle memory surface already exists.

## Declaration

```pulse
public final class AtomicBoolean implements AutoCloseable
```

## Members

### ``public static AtomicBoolean create(boolean initialValue)``

Allocates a new atomic boolean with the requested initial value.

### ``public boolean isClosed()``

Returns whether this atomic cell has already been closed.

### ``public boolean get()``

Reads the current boolean value from the host-backed atomic cell.

### ``public void set(boolean value)``

Stores a new boolean value into the host-backed atomic cell.

### ``public boolean compareAndSet(boolean expected, boolean replacement)``

Performs a compare-and-set against the current boolean value.

### ``public boolean getAndSet(boolean value)``

Replaces the current boolean value and returns the previous value.

### ``public void close()``

Releases the host-backed storage for this atomic cell.
