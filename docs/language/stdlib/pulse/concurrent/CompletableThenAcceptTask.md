# pulse.concurrent.CompletableThenAcceptTask

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/CompletableThenAcceptTask.pulse``

## Summary

Executor-owned continuation bridge for `CompletableFuture.thenAcceptAsync`.

## Declaration

```pulse
public final class CompletableThenAcceptTask<T> implements Runnable
```

## Members

### ``public CompletableThenAcceptTask(``

Creates a chained accept continuation task.

### ``public void run()``

Waits for the source future and then consumes its value into the target future.
