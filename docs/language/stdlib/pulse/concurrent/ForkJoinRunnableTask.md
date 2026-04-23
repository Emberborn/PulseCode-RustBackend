# pulse.concurrent.ForkJoinRunnableTask

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/ForkJoinRunnableTask.pulse``

## Summary

Runnable adapter for the fork-join pool's `submit(...)` baseline.

## Declaration

```pulse
public final class ForkJoinRunnableTask extends ForkJoinTask<Object>
```

## Members

### ``public ForkJoinRunnableTask(Runnable runnable)``

Creates one runnable-backed fork-join task adapter.
