# pulse.concurrent.Monitor

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/Monitor.pulse``

## Summary

Reentrant monitor ownership primitive built on the current mutex and atomic floor.
This is the first truthful target for later synchronized lowering. It owns reentrant
enter/exit semantics now, while wait/notify style coordination can layer on later.

## Declaration

```pulse
public final class Monitor implements AutoCloseable
```

## Members

### ``public Monitor()``

Creates a new monitor backed by the current mutex and atomic floor.

### ``public static Monitor create()``

Creates a new monitor instance.

### ``public boolean isClosed()``

Returns whether this monitor has already been closed.

### ``public boolean isHeldByCurrentThread()``

Returns whether the current thread owns the monitor.

### ``public int holdCount()``

Returns the current reentrant hold depth for the owning thread.

### ``public int waitingCount()``

Returns the number of queued waiters currently attached to this monitor.

### ``public void enter()``

Enters the monitor, blocking until ownership is available.

### ``public boolean tryEnter(long timeoutMillis)``

Attempts to enter the monitor before the timeout expires.

### ``public void exit()``

Exits one reentrant ownership level from the monitor.

### ``public void wait()``

Waits indefinitely until this monitor is notified.

### ``public boolean wait(long timeoutMillis)``

Waits until this monitor is notified or the timeout expires.

### ``public void notify()``

Wakes one queued waiter, if present.

### ``public void notifyAll()``

Wakes all queued waiters.

### ``public void close()``

Closes the monitor once no owner or queued waiter remains.
