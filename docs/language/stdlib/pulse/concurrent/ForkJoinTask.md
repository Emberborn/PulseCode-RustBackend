# pulse.concurrent.ForkJoinTask

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/ForkJoinTask.pulse``

## Summary

Base fork-join task with future-style completion and join semantics.
This is the owned recursive-task floor for the work-stealing baseline:
tasks can be forked onto a `ForkJoinPool`, joined later, and executed under
worker-local deques without pretending the fuller Java fork-join universe is
already complete.

## Declaration

```pulse
public abstract class ForkJoinTask<T> implements Future<T>, Runnable
```

## Members

### ``public ForkJoinTask()``

Creates one incomplete fork-join task.

### ``protected abstract T compute();``

Computes this task's result when it is executed by a worker thread.

### ``public void bindThread(Thread thread)``

Binds the worker thread that will execute this task.

### ``public ForkJoinTask<T> fork(ForkJoinPool pool)``

Forks this task onto the supplied pool.

### ``public T join()``

Waits for completion and returns the computed result.

### ``public void run()``

Executes the task body once.

### ``public boolean cancel(boolean mayInterruptIfRunning)``

Requests cancellation before start or cooperative interruption while running.

### ``public boolean isCancelled()``

Returns whether cancellation has won for this task.

### ``public boolean isDone()``

Returns whether this task has reached a terminal state.

### ``public void await()``

Waits indefinitely for completion.

### ``public boolean await(long timeoutMillis)``

Waits for completion or the timeout to expire.

### ``public T get()``

Returns the completed result or throws the current baseline future exception.

### ``public void close()``

Releases the task's coordination/storage resources after completion.
