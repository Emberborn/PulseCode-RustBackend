# pulse.concurrent.CompletableAnyOfTask

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/CompletableAnyOfTask.pulse``

## Summary

Executor-owned aggregate race bridge for `CompletableFuture.anyOfAsync`.

## Declaration

```pulse
public final class CompletableAnyOfTask implements Runnable
```

## Members

### ``public CompletableAnyOfTask(``

Creates one aggregate race bridge.

### ``public void run()``

Waits for any supplied future and completes the target with its outcome.
