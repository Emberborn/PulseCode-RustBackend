# pulse.lang.Thread

Kind: ``class``

Source: ``stdlib/src/pulse/lang/Thread.pulse``

## Summary

First real host-thread object wrapper.
This keeps lifecycle ownership explicit: one-shot start, join, and cooperative
interruption are real now, while the broader Java-close thread model still remains later work.

## Declaration

```pulse
public final class Thread implements AutoCloseable
```

## Members

### ``public Thread(Runnable target)``

Creates a new thread wrapper around the given runnable target.

### ``public boolean hasStarted()``

Returns whether this thread has already been started.

### ``public boolean isAlive()``

Returns whether the underlying host thread is still running.

### ``public boolean isInterrupted()``

Returns whether cooperative interruption has been requested.

### ``public long threadId()``

Returns the worker thread id after the thread has begun executing.

### ``public void start()``

Starts the underlying host thread exactly once.

### ``public void join()``

Waits indefinitely for the thread to complete.

### ``public boolean join(long timeoutMillis)``

Waits for the thread to complete or the timeout to expire.

### ``public void interrupt()``

Requests cooperative interruption for this thread.

### ``public void clearInterrupt()``

Clears the cooperative interruption request.

### ``public void awaitInterrupt()``

Waits until interruption has been requested.

### ``public boolean awaitInterrupt(long timeoutMillis)``

Waits until interruption has been requested or the timeout expires.

### ``public void close()``

Releases thread-owned resources after the thread has stopped.

### ``public static void sleep(long millis)``

Sleeps the current host thread for the requested duration.

### ``public static boolean yieldNow()``

Yields the current host thread, if the scheduler accepts the hint.

### ``public static long currentThreadId()``

Returns the current host thread id.
