# pulse.concurrent.ScheduledThreadPoolPeriodicFuture

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/ScheduledThreadPoolPeriodicFuture.pulse``

## Summary

Scheduler-thread-managed periodic future for pooled scheduled executors.
This keeps time ownership on the scheduler thread and execution ownership on
worker threads so periodic work no longer burns one dedicated sleeping thread
per task.

## Declaration

```pulse
public final class ScheduledThreadPoolPeriodicFuture implements ScheduledFuture<Object>
```

## Members

### ``public ScheduledThreadPoolPeriodicFuture(``

Creates one pooled periodic scheduled future.

### ``public void bindThread(Thread thread)``

Binds the worker thread that is currently executing this periodic body.

### ``public long scheduledAtMillis()``

Returns the next target wall-clock execution time.

### ``public long getDelayMillis()``

Returns the remaining delay before the next execution becomes eligible.

### ``public boolean isCancelled()``

Returns whether cancellation has won for this periodic future.

### ``public boolean isDone()``

Returns whether this periodic future has reached terminal cancellation/failure.

### ``public boolean cancel(boolean mayInterruptIfRunning)``

Requests cancellation and optional cooperative interruption of the current worker thread.

### ``public void await()``

Waits indefinitely for cancellation or terminal failure.

### ``public boolean await(long timeoutMillis)``

Waits for cancellation or terminal failure, or the timeout to expire.

### ``public void runDispatched()``

Executes one scheduled iteration and requeues the next run when appropriate.

### ``public Object get()``

Waits for terminal completion and then reports cancellation or failure.

### ``public void close()``

Releases the periodic future's coordination/storage resources after terminal completion.
