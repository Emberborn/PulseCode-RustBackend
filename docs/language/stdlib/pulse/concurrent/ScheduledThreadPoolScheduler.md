# pulse.concurrent.ScheduledThreadPoolScheduler

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/ScheduledThreadPoolScheduler.pulse``

## Summary

Scheduler-thread entrypoint for scheduled thread-pool executors.

## Declaration

```pulse
final class ScheduledThreadPoolScheduler implements Runnable
```

## Members

### ``public ScheduledThreadPoolScheduler(ScheduledThreadPoolExecutor owner)``

Creates one scheduler-thread runnable for the owning executor.

### ``public void run()``

Runs the owning executor's scheduler loop on the current thread.
