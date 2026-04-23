# pulse.concurrent.ScheduledThreadPoolPeriodicDispatch

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/ScheduledThreadPoolPeriodicDispatch.pulse``

## Summary

Worker-pool dispatch wrapper for one periodic scheduled iteration.

## Declaration

```pulse
final class ScheduledThreadPoolPeriodicDispatch implements Runnable
```

## Members

### ``public ScheduledThreadPoolPeriodicDispatch(ScheduledThreadPoolPeriodicFuture future)``

Creates one worker-pool dispatch wrapper for a periodic future.

### ``public void attachThread(Thread worker)``

Records the worker thread that will execute the dispatched iteration.

### ``public void run()``

Binds the worker thread and runs one dispatched periodic iteration.
