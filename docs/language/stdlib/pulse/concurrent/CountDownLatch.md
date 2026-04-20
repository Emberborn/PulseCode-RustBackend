# pulse.concurrent.CountDownLatch

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/CountDownLatch.pulse``

## Summary

Latch built on the current host-sync and atomic floor.
This is the first higher-level coordination primitive above events and atomics.

## Declaration

```pulse
public final class CountDownLatch implements AutoCloseable
```

## Members

### ``public static CountDownLatch create(int initialCount)``

Creates a latch with the requested initial count.

### ``public boolean isClosed()``

Returns whether this latch has already been closed.

### ``public int currentCount()``

Returns the current remaining count.

### ``public void countDown()``

Decrements the latch count if it has not already reached zero.

### ``public void await()``

Waits until the latch reaches zero.

### ``public boolean await(long timeoutMillis)``

Waits until the latch reaches zero or the timeout expires.

### ``public void close()``

Releases the underlying coordination resources for this latch.
