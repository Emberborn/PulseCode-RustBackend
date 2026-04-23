# pulse.concurrent.ThreadPerTaskExecutor

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/ThreadPerTaskExecutor.pulse``

## Summary

Simple thread-per-task executor baseline.
This is not the final high-scale executor story, but it is a truthful,
owned task-execution service on top of the current thread/sync/atomic floor.

## Declaration

```pulse
public final class ThreadPerTaskExecutor implements ExecutorService, AutoCloseable
```

## Members

### ``public ThreadPerTaskExecutor()``

Creates an empty thread-per-task executor.

### ``public static ThreadPerTaskExecutor create()``

Creates a new thread-per-task executor.

### ``public void execute(Runnable task)``

Executes one runnable task on a dedicated host thread.

### ``public <T> Future<T> submit(Callable<T> task)``

Submits one callable task and returns its future.

### ``public Future<Object> submit(Runnable task)``

Submits one runnable task and returns a completion future.

### ``public boolean isShutdown()``

Returns whether shutdown has been requested.

### ``public void shutdown()``

Prevents new tasks from being submitted.

### ``public boolean isTerminated()``

Returns whether shutdown has completed and no active tracked thread remains.

### ``public boolean awaitTermination(long timeoutMillis)``

Waits for tracked tasks to finish after shutdown.

### ``public void close()``

Shuts the executor down and waits indefinitely for tracked tasks to finish.
