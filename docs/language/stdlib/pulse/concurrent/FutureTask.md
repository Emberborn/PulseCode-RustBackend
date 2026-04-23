# pulse.concurrent.FutureTask

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/FutureTask.pulse``

## Summary

Baseline host-thread-backed future implementation.
This is intentionally small but truthful: callable/runnable execution,
completion waiting, result publication, failure capture, and cooperative
cancellation are real now without claiming the fuller Java future stack.

## Declaration

```pulse
public final class FutureTask<T> implements RunnableFuture<T>
```

## Members

### ``public FutureTask(Callable<T> callable)``

Creates a future task from a callable result producer.

### ``public FutureTask(Runnable runnable)``

Creates a future task from a runnable completion action.

### ``public void bindThread(Thread thread)``

Binds the host thread that will execute this future task.
This is executor-owned lifecycle wiring; user code should not need it.

### ``public boolean isCancelled()``

Returns whether this future has been cancelled.

### ``public boolean isDone()``

Returns whether this future has reached a terminal state.

### ``public boolean cancel(boolean mayInterruptIfRunning)``

Requests cancellation before start or cooperative interruption while running.

### ``public void await()``

Waits indefinitely for completion.

### ``public boolean await(long timeoutMillis)``

Waits for completion or the timeout to expire.

### ``public void run()``

Executes the task body once.

### ``public T get()``

Returns the task result or throws the current baseline future exception.

### ``public void close()``

Releases the future task's coordination/storage resources after completion.
