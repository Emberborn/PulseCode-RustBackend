# pulse.concurrent.MonitorWaiter

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/MonitorWaiter.pulse``

## Summary

One queued monitor waiter backed by an auto-reset host event.
This stays package-private because it is an implementation detail of Monitor's
current wait/notify floor rather than a public concurrency API.

## Declaration

```pulse
final class MonitorWaiter implements AutoCloseable
```

## Members

### ``public MonitorWaiter()``

Creates one queued waiter backed by an auto-reset event.

### ``public void signal()``

Signals this waiter.

### ``public void await()``

Waits indefinitely for this waiter to be signaled.

### ``public boolean await(long timeoutMillis)``

Waits for this waiter to be signaled or the timeout to expire.

### ``public boolean wasSignaled()``

Returns whether this waiter has been signaled.

### ``public void close()``

Releases the resources for this queued waiter.
