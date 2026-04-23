# pulse.concurrent.FixedThreadPoolShutdownTask

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/FixedThreadPoolShutdownTask.pulse``

## Summary

Internal shutdown sentinel for fixed worker-pool executors.

## Declaration

```pulse
public final class FixedThreadPoolShutdownTask implements Runnable
```

## Members

### ``public FixedThreadPoolShutdownTask()``

Creates one shutdown sentinel.

### ``public void run()``

Runs no user work; the worker loop consumes this as a stop signal.
