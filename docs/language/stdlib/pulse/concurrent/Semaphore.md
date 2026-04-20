# pulse.concurrent.Semaphore

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/Semaphore.pulse``

## Summary

OS-backed counting semaphore for the early concurrency floor.
This is the retained low-level permit primitive for executors, throttling, and later monitor work.

## Declaration

```pulse
public final class Semaphore implements AutoCloseable
```

## Members

### ``public static Semaphore create(int initialCount, int maximumCount)``

Creates a host-backed semaphore with the requested initial and maximum counts.

### ``public boolean isClosed()``

Returns whether this semaphore has already been closed.

### ``public int maximumCount()``

Returns the configured maximum permit count.

### ``public void acquire()``

Acquires one permit, waiting until a permit is available.

### ``public boolean tryAcquire(long timeoutMillis)``

Attempts to acquire one permit before the timeout expires.

### ``public void release()``

Releases one permit back to the semaphore.

### ``public void release(int permits)``

Releases the requested number of permits back to the semaphore.

### ``public void close()``

Closes the underlying host semaphore handle.
