# pulse.concurrent.CompletableAcceptEitherTask

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/CompletableAcceptEitherTask.pulse``

## Summary

Executor-owned race bridge for `CompletableFuture.acceptEitherAsync`.

## Declaration

```pulse
public final class CompletableAcceptEitherTask<T> implements Runnable
```

## Members

### ``public CompletableAcceptEitherTask(``

Creates one race consumer bridge.

### ``public void run()``

Waits for either source stage, runs the consumer, and completes the target.
