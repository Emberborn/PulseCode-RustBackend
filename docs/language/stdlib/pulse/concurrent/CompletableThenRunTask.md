# pulse.concurrent.CompletableThenRunTask

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/CompletableThenRunTask.pulse``

## Summary

Executor-owned continuation bridge for `CompletableFuture.thenRunAsync`.

## Declaration

```pulse
public final class CompletableThenRunTask<T> implements Runnable
```

## Members

### ``public CompletableThenRunTask(``

Creates a chained runnable continuation task.

### ``public void run()``

Waits for the source future and then runs the continuation into the target future.
