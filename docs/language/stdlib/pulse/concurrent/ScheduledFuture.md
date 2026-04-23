# pulse.concurrent.ScheduledFuture

Kind: ``interface``

Source: ``stdlib/src/pulse/concurrent/ScheduledFuture.pulse``

## Summary

One-shot delayed future contract for the current scheduling baseline.
This is intentionally narrower than Java's fuller scheduled executor model:
delayed one-shot submission is real, while periodic scheduling remains later.

## Declaration

```pulse
public interface ScheduledFuture<T> extends Future<T>
```

## Members

### ``public long scheduledAtMillis();``

Returns the target wall-clock time for this delayed task.

### ``public long getDelayMillis();``

Returns the remaining delay before execution becomes eligible.
