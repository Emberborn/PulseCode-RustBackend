# pulse.concurrent.ForkJoinPool

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/ForkJoinPool.pulse``

## Summary

Work-stealing fork-join pool baseline.
This is the first truthful owned fork-join lane: worker-local deques, theft
from peer queues, recursive task fork/join semantics, and ordinary executor
submission all work without claiming the entire Java fork-join framework.

## Declaration

```pulse
public final class ForkJoinPool implements ExecutorService, AutoCloseable
```

## Members

### ``public ForkJoinPool(int workerCount)``

Creates a new work-stealing pool with the requested number of workers.

### ``public static ForkJoinPool create(int workerCount)``

Creates a new work-stealing pool with the requested number of workers.

### ``public void runWorkerLoop(ForkJoinWorker self)``

Worker loop for local-pop / steal-from-peer execution.

### ``public <T> ForkJoinTask<T> fork(ForkJoinTask<T> task)``

Forks one recursive task onto this pool.

### ``public <T> T invoke(ForkJoinTask<T> task)``

Executes one recursive task and waits for its result.

### ``public void execute(Runnable task)``

Executes one runnable task on the work-stealing pool.

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

Shuts the pool down and waits indefinitely for worker termination.
