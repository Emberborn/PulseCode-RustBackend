# pulse.concurrent.CompletableAllOfTask

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/CompletableAllOfTask.pulse``

## Summary

Executor-owned aggregate bridge for `CompletableFuture.allOfAsync`.

## Declaration

```pulse
public final class CompletableAllOfTask implements Runnable
```

## Members

### ``public CompletableAllOfTask(``

Creates one aggregate completion bridge.

### ``public void run()``

Waits for every supplied future and completes the target.
