# pulse.concurrent.CompletableWhenCompleteTask

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/CompletableWhenCompleteTask.pulse``

## Summary

Executor-owned observation bridge for `CompletableFuture.whenCompleteAsync`.

## Declaration

```pulse
public final class CompletableWhenCompleteTask<T> implements Runnable
```

## Members

### ``public CompletableWhenCompleteTask(``

Creates one completion-observation bridge.

### ``public void run()``

Observes source completion, runs side effects, and mirrors the source outcome.
