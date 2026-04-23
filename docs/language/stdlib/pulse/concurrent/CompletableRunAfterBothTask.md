# pulse.concurrent.CompletableRunAfterBothTask

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/CompletableRunAfterBothTask.pulse``

## Summary

Executor-owned bridge for `CompletableFuture.runAfterBothAsync`.

## Declaration

```pulse
public final class CompletableRunAfterBothTask<T, U> implements Runnable
```

## Members

### ``public CompletableRunAfterBothTask(``

Creates one completion-after-both bridge.

### ``public void run()``

Waits for both source stages, runs the action, and completes the target.
