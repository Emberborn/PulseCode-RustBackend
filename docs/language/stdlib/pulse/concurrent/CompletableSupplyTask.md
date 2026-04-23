# pulse.concurrent.CompletableSupplyTask

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/CompletableSupplyTask.pulse``

## Summary

Executor-owned callable bridge for `CompletableFuture.supplyAsync`.

## Declaration

```pulse
public final class CompletableSupplyTask<T> implements Runnable
```

## Members

### ``public CompletableSupplyTask(Callable<T> task, CompletableFuture<T> target)``

Creates a supply task that completes the target future from one callable.

### ``public void run()``

Runs the callable and forwards its result or failure into the target future.
