# pulse.concurrent.ExecutorService

Kind: ``interface``

Source: ``stdlib/src/pulse/concurrent/ExecutorService.pulse``

## Summary

Managed executor contract for task submission and shutdown.
The current baseline is intentionally narrower than Java's full executor
ecosystem, but it is real enough for compiler/runtime/tooling workflows:
runnable execution, callable submission, future retrieval, shutdown, and
termination waiting are all in.

## Declaration

```pulse
public interface ExecutorService extends Executor, AutoCloseable
```

## Members

### ``public <T> Future<T> submit(Callable<T> task);``

Submits one callable task and returns a future for its result.

### ``public Future<Object> submit(Runnable task);``

Submits one runnable task and returns a completion future.

### ``public <T> List<Future<T>> invokeAll(List<Callable<T>> tasks);``

Submits all supplied callables and waits for every result to complete.

### ``public <T> T invokeAny(List<Callable<T>> tasks);``

Submits all supplied callables and returns the first successful result.

### ``public void shutdown();``

Prevents new task submission.

### ``public boolean isShutdown();``

Returns whether shutdown has been requested.

### ``public boolean isTerminated();``

Returns whether shutdown has been requested and no tracked tasks remain.

### ``public boolean awaitTermination(long timeoutMillis);``

Waits for termination after shutdown.

### ``public void close();``

Shuts the executor down and waits for outstanding tasks to finish.
