# pulse.concurrent.Executors

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/Executors.pulse``

## Summary

Factory helpers for the shipped executor baseline.
This intentionally starts bounded rather than pretending the full Java
executor ecosystem already exists.

## Declaration

```pulse
public final class Executors
```

## Members

### ``public static ThreadPerTaskExecutor newThreadPerTaskExecutor()``

Creates a new thread-per-task executor service.

### ``public static ScheduledThreadPerTaskExecutor newScheduledThreadPerTaskExecutor()``

Creates a new scheduled thread-per-task executor service.
