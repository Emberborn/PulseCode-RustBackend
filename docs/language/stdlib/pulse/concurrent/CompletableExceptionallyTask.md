# pulse.concurrent.CompletableExceptionallyTask

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/CompletableExceptionallyTask.pulse``

## Summary

Executor-owned recovery bridge for `CompletableFuture.exceptionallyAsync`.

## Declaration

```pulse
public final class CompletableExceptionallyTask<T> implements Runnable
```

## Members

### ``public CompletableExceptionallyTask(``

Creates a recovery continuation task.

### ``public void run()``

Passes through success or maps failure into a replacement result.
