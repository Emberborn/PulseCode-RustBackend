# pulse.concurrent.Future

Kind: ``interface``

Source: ``stdlib/src/pulse/concurrent/Future.pulse``

## Summary

Result-holding contract for submitted asynchronous work.
This is a deliberately small future surface: completion, cancellation,
waiting, and value retrieval are real, while richer composition remains
later work.

## Declaration

```pulse
public interface Future<T> extends AutoCloseable
```

## Members

### ``public boolean cancel(boolean mayInterruptIfRunning);``

Requests cancellation for this task.

### ``public boolean isCancelled();``

Returns whether cancellation has won for this future.

### ``public boolean isDone();``

Returns whether the future has reached a terminal state.

### ``public void await();``

Waits indefinitely for terminal completion.

### ``public boolean await(long timeoutMillis);``

Waits until terminal completion or timeout.

### ``public T get();``

Returns the completed value or throws a baseline future exception.

### ``public void close();``

Releases the future's coordination/storage resources after completion.
