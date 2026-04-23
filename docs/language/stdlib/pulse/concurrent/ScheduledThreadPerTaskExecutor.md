# pulse.concurrent.ScheduledThreadPerTaskExecutor

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/ScheduledThreadPerTaskExecutor.pulse``

## Summary

One-shot delayed executor built on the thread-per-task baseline.
This keeps scheduling honest for the current lane: one-shot delayed submission
and dedicated-thread periodic scheduling are real, while fuller timer-pool and
work-stealing scheduler semantics still remain later work.

## Declaration

```pulse
public final class ScheduledThreadPerTaskExecutor implements ScheduledExecutorService, AutoCloseable
```

## Members

### ``public ScheduledThreadPerTaskExecutor()``

Creates an empty scheduled thread-per-task executor.

### ``public static ScheduledThreadPerTaskExecutor create()``

Creates a new scheduled thread-per-task executor.

### ``public void execute(Runnable task)``

Executes one runnable task immediately.

### ``public <T> Future<T> submit(Callable<T> task)``

Submits one callable task immediately.

### ``public Future<Object> submit(Runnable task)``

Submits one runnable task immediately.

### ``public <T> List<Future<T>> invokeAll(List<Callable<T>> tasks)``

Submits every callable immediately and waits for all results to complete.

### ``public <T> T invokeAny(List<Callable<T>> tasks)``

Submits every callable immediately and returns the first successful result.

### ``public <T> ScheduledFuture<T> schedule(Callable<T> task, long delayMillis)``

Schedules one callable task after the requested delay.

### ``public ScheduledFuture<Object> schedule(Runnable task, long delayMillis)``

Schedules one runnable task after the requested delay.

### ``public ScheduledFuture<Object> scheduleAtFixedRate(``

Schedules one runnable task at a fixed rate after the initial delay.

### ``public ScheduledFuture<Object> scheduleWithFixedDelay(``

Schedules one runnable task with a fixed delay between completions.

### ``public void shutdown()``

Prevents new task submission.

### ``public boolean isShutdown()``

Returns whether shutdown has been requested.

### ``public boolean isTerminated()``

Returns whether shutdown has completed and no tracked task remains.

### ``public boolean awaitTermination(long timeoutMillis)``

Waits for termination after shutdown.

### ``public void close()``

Closes the scheduled executor after waiting for tracked tasks to finish.
