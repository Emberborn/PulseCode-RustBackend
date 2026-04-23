# pulse.concurrent.CompletableThenApplyTask

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/CompletableThenApplyTask.pulse``

## Summary

Executor-owned continuation bridge for `CompletableFuture.thenApplyAsync`.

## Declaration

```pulse
public final class CompletableThenApplyTask<T, R> implements Runnable
```

## Members

### ``public CompletableThenApplyTask(``

Creates a chained mapping continuation task.

### ``public void run()``

Waits for the source future and then maps its value into the target future.
