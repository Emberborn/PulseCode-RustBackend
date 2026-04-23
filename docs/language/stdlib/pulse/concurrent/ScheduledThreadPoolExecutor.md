# pulse.concurrent.ScheduledThreadPoolExecutor

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/ScheduledThreadPoolExecutor.pulse``

## Summary

Scheduled worker-pool executor with one scheduler thread and a bounded worker pool.
This is the first truthful timer-pool lane: scheduling time is owned by one
scheduler thread while execution is owned by fixed workers, so delayed and
periodic tasks no longer require one dedicated sleeping thread each.

## Declaration

```pulse
public final class ScheduledThreadPoolExecutor implements ScheduledExecutorService, AutoCloseable
```

## Members

### ``public ScheduledThreadPoolExecutor(int workerCount)``

Creates a scheduled worker-pool executor with the requested number of workers.

### ``public static ScheduledThreadPoolExecutor create(int workerCount)``

Creates a scheduled worker-pool executor with the requested number of workers.

### ``public void signalScheduler()``

Wakes the scheduler thread to re-evaluate the head of the delayed queue.

### ``public void reschedulePeriodic(ScheduledThreadPoolPeriodicFuture future)``

Requeues one periodic future after a completed iteration.

### ``public void runSchedulerLoop()``

Owns delayed-task waiting and dispatch for this scheduled worker pool.

### ``public void execute(Runnable task)``

Executes one runnable task immediately on the worker pool.

### ``public <T> Future<T> submit(Callable<T> task)``

Submits one callable task immediately on the worker pool.

### ``public Future<Object> submit(Runnable task)``

Submits one runnable task immediately on the worker pool.

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

Prevents new task submission and lets already scheduled work drain.

### ``public boolean isShutdown()``

Returns whether shutdown has been requested.

### ``public boolean isTerminated()``

Returns whether the scheduler thread and worker pool have both terminated.

### ``public boolean awaitTermination(long timeoutMillis)``

Waits for the scheduler thread and worker pool to terminate after shutdown.

### ``public void close()``

Shuts the scheduled worker pool down and waits indefinitely for termination.
