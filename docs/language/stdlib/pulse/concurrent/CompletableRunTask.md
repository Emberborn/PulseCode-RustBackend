# pulse.concurrent.CompletableRunTask

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/CompletableRunTask.pulse``

## Summary

Executor-owned runnable bridge for `CompletableFuture.runAsync`.

## Declaration

```pulse
public final class CompletableRunTask implements Runnable
```

## Members

### ``public CompletableRunTask(Runnable task, CompletableFuture<Object> target)``

Creates a run task that completes the target future after one runnable finishes.

### ``public void run()``

Runs the action and forwards completion or failure into the target future.
