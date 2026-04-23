# pulse.concurrent.ScheduledFutureTask

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/ScheduledFutureTask.pulse``

## Summary

One-shot delayed future task on the current thread/sync/atomic floor.
This gives the executor baseline real delayed submission before self-hosting
without claiming periodic scheduling or full timer-wheel infrastructure.

## Declaration

```pulse
public final class ScheduledFutureTask<T> implements RunnableFuture<T>, ScheduledFuture<T>
```

## Members

### ``public ScheduledFutureTask(Callable<T> callable, long delayMillis)``

Creates a delayed callable task.

### ``public ScheduledFutureTask(Runnable runnable, long delayMillis)``

Creates a delayed runnable task.

### ``public void bindThread(Thread thread)``

Binds the host thread that will own delayed execution.

### ``public void attachSchedulerOwner(ScheduledThreadPoolExecutor owner)``

Attaches the pooled scheduler that should be notified when cancellation changes queue order.

### ``public long scheduledAtMillis()``

Returns the target wall-clock execution time.

### ``public long getDelayMillis()``

Returns the remaining delay before execution becomes eligible.

### ``public boolean isCancelled()``

Returns whether cancellation has won for this task.

### ``public boolean isDone()``

Returns whether this task has reached a terminal state.

### ``public boolean cancel(boolean mayInterruptIfRunning)``

Requests cancellation before or during delayed execution.

### ``public void await()``

Waits indefinitely for terminal completion.

### ``public boolean await(long timeoutMillis)``

Waits for terminal completion or timeout.

### ``public void run()``

Executes the delayed task body once its deadline is reached.

### ``public T get()``

Returns the completed result or throws the current baseline future exception.

### ``public void close()``

Releases the delayed task's coordination/storage resources after completion.
