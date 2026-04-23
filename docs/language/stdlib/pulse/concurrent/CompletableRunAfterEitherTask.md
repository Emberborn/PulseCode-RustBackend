# pulse.concurrent.CompletableRunAfterEitherTask

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/CompletableRunAfterEitherTask.pulse``

## Summary

Executor-owned race bridge for `CompletableFuture.runAfterEitherAsync`.

## Declaration

```pulse
public final class CompletableRunAfterEitherTask<T> implements Runnable
```

## Members

### ``public CompletableRunAfterEitherTask(``

Creates one race action bridge.

### ``public void run()``

Waits for either source stage, runs the action, and completes the target.
