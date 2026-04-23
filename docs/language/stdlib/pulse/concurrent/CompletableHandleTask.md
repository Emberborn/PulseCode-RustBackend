# pulse.concurrent.CompletableHandleTask

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/CompletableHandleTask.pulse``

## Summary

Executor-owned completion/recovery bridge for `CompletableFuture.handleAsync`.

## Declaration

```pulse
public final class CompletableHandleTask<T, R> implements Runnable
```

## Members

### ``public CompletableHandleTask(``

Creates one completion/recovery bridge.

### ``public void run()``

Observes source completion, maps the outcome, and completes the target.
