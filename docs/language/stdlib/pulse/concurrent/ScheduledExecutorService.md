# pulse.concurrent.ScheduledExecutorService

Kind: ``interface``

Source: ``stdlib/src/pulse/concurrent/ScheduledExecutorService.pulse``

## Summary

Managed delayed-submission executor contract.
The current baseline supports one-shot delayed tasks only.

## Declaration

```pulse
public interface ScheduledExecutorService extends ExecutorService
```

## Members

### ``public <T> ScheduledFuture<T> schedule(Callable<T> task, long delayMillis);``

Schedules one callable task after the requested delay.

### ``public ScheduledFuture<Object> schedule(Runnable task, long delayMillis);``

Schedules one runnable task after the requested delay.
