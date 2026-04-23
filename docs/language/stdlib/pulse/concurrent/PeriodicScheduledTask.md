# pulse.concurrent.PeriodicScheduledTask

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/PeriodicScheduledTask.pulse``

## Summary

Periodic scheduled task on the current thread/sync/atomic floor.
This makes fixed-rate and fixed-delay scheduling real without claiming a fuller
timer-pool or work-stealing scheduler underneath.

## Declaration

```pulse
public final class PeriodicScheduledTask implements Runnable, ScheduledFuture<Object>
```

## Members

### ``public PeriodicScheduledTask(``

Creates one periodic scheduled task.

### ``public void bindThread(Thread thread)``

Binds the host thread that owns periodic execution.

### ``public long scheduledAtMillis()``

Returns the next target wall-clock execution time.

### ``public long getDelayMillis()``

Returns the remaining delay before the next execution becomes eligible.

### ``public boolean isCancelled()``

Returns whether cancellation has won for this periodic task.

### ``public boolean isDone()``

Returns whether this periodic task has reached terminal cancellation/failure.

### ``public boolean cancel(boolean mayInterruptIfRunning)``

Requests cancellation and optional cooperative interruption of the running owner thread.

### ``public void await()``

Waits indefinitely for cancellation or terminal failure.

### ``public boolean await(long timeoutMillis)``

Waits for cancellation or terminal failure, or the timeout to expire.

### ``public void run()``

Executes the periodic task until cancellation or failure.

### ``public Object get()``

Waits for terminal completion and then reports cancellation or failure.

### ``public void close()``

Releases the periodic task's coordination/storage resources after terminal completion.
