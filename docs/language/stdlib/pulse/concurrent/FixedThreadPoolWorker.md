# pulse.concurrent.FixedThreadPoolWorker

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/FixedThreadPoolWorker.pulse``

## Summary

Internal worker loop for `FixedThreadPoolExecutor`.

## Declaration

```pulse
public final class FixedThreadPoolWorker implements Runnable
```

## Members

### ``public FixedThreadPoolWorker(FixedThreadPoolExecutor owner)``

Creates one worker loop bound to the owning fixed-size executor.

### ``public void attachThread(Thread workerThread)``

Attaches the owning worker thread wrapper after construction.

### ``public void run()``

Runs the fixed executor's worker loop until shutdown reaches this worker.
