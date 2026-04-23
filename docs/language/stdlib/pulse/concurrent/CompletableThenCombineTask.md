# pulse.concurrent.CompletableThenCombineTask

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/CompletableThenCombineTask.pulse``

## Summary

Executor-owned combination bridge for `CompletableFuture.thenCombineAsync`.

## Declaration

```pulse
public final class CompletableThenCombineTask<T, U, R> implements Runnable
```

## Members

### ``public CompletableThenCombineTask(``

Creates one combine bridge between two completion stages and a target stage.

### ``public void run()``

Awaits both source futures, combines their values, and completes the target.
