# pulse.concurrent.RunnableFuture

Kind: ``interface``

Source: ``stdlib/src/pulse/concurrent/RunnableFuture.pulse``

## Summary

Future contract that is itself executable as a runnable task.
This is the bridge between the low-level thread/executor floor and the
higher-level future stack: a submitted task can also be driven directly.

## Declaration

```pulse
public interface RunnableFuture<T> extends Runnable, Future<T>
```
