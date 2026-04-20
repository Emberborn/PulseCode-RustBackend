# pulse.concurrent.Mutex

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/Mutex.pulse``

## Summary

OS-backed mutex primitive for the early concurrency floor.
This is a low-level ownership primitive intended to underpin later synchronized/monitor work.

## Declaration

```pulse
public final class Mutex implements AutoCloseable
```

## Members

### ``public static Mutex create()``

Creates a new host-backed mutex.

### ``public boolean isClosed()``

Returns whether this mutex has already been closed.

### ``public void lock()``

Acquires the mutex, waiting until ownership is available.

### ``public boolean tryLock(long timeoutMillis)``

Attempts to acquire the mutex before the timeout expires.

### ``public void unlock()``

Releases the mutex.

### ``public void close()``

Closes the underlying host mutex handle.
