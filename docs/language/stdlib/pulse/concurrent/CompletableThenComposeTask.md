# pulse.concurrent.CompletableThenComposeTask

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/CompletableThenComposeTask.pulse``

## Summary

Executor-owned continuation bridge for `CompletableFuture.thenComposeAsync`.

## Declaration

```pulse
public final class CompletableThenComposeTask<T, R> implements Runnable
```

## Members

### ``public CompletableThenComposeTask(``

Creates a chained compose continuation task.

### ``public void run()``

Waits for the source future, maps it into a nested future, then forwards that result.
