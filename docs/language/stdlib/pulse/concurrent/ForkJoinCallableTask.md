# pulse.concurrent.ForkJoinCallableTask

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/ForkJoinCallableTask.pulse``

## Summary

Callable adapter for the fork-join pool's `submit(...)` baseline.

## Declaration

```pulse
public final class ForkJoinCallableTask<T> extends ForkJoinTask<T>
```

## Members

### ``public ForkJoinCallableTask(Callable<T> callable)``

Creates one callable-backed fork-join task adapter.
