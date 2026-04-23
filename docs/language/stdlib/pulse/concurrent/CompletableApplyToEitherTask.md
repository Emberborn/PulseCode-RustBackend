# pulse.concurrent.CompletableApplyToEitherTask

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/CompletableApplyToEitherTask.pulse``

## Summary

Executor-owned race bridge for `CompletableFuture.applyToEitherAsync`.

## Declaration

```pulse
public final class CompletableApplyToEitherTask<T, R> implements Runnable
```

## Members

### ``public CompletableApplyToEitherTask(``

Creates one race mapping bridge.

### ``public void run()``

Waits for either source stage, maps its value, and completes the target.
