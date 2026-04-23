# pulse.concurrent.FixedThreadPoolExecutor

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/FixedThreadPoolExecutor.pulse``

## Summary

Fixed-size worker-pool executor on the current owned concurrency floor.
This moves the shipped executor surface beyond thread-per-task so self-hosted
compiler/runtime workloads can choose bounded worker ownership without waiting
for later work-stealing or richer scheduler families.

## Declaration

```pulse
public final class FixedThreadPoolExecutor implements ExecutorService, AutoCloseable
```

## Members

### ``public FixedThreadPoolExecutor(int workerCount)``

Creates a new fixed-size worker-pool executor.

### ``public static FixedThreadPoolExecutor create(int workerCount)``

Creates a new fixed-size worker-pool executor.

### ``public void runWorkerLoop(Thread workerThread)``

Internal worker loop used by the fixed executor's worker threads.

### ``public void execute(Runnable task)``

Executes one runnable task on the fixed worker pool.

### ``public <T> Future<T> submit(Callable<T> task)``

Submits one callable task and returns its future.

### ``public Future<Object> submit(Runnable task)``

Submits one runnable task and returns a completion future.

### ``public <T> List<Future<T>> invokeAll(List<Callable<T>> tasks)``

Submits every callable and waits for all results to complete.

### ``public <T> T invokeAny(List<Callable<T>> tasks)``

Submits every callable and returns the first successful result.

### ``public void shutdown()``

Prevents new task submission and lets queued/running work drain.

### ``public boolean isShutdown()``

Returns whether shutdown has been requested.

### ``public boolean isTerminated()``

Returns whether shutdown has completed and no worker remains alive.

### ``public boolean awaitTermination(long timeoutMillis)``

Waits for every worker to terminate after shutdown.

### ``public void close()``

Shuts the executor down and waits indefinitely for worker termination.
