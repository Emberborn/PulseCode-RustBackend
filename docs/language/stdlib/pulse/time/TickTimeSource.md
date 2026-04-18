# pulse.time.TickTimeSource

Kind: ``class``

Source: ``stdlib/src/pulse/time/TickTimeSource.pulse``

## Summary

Internal ticking monotonic time-source implementation that truncates reads from a base source.

## Declaration

```pulse
final class TickTimeSource implements TimeSource
```

## Members

### ``public boolean isFixed()``

Reports whether the wrapped base source is fixed.
Use this to preserve deterministic elapsed-time identity through tick composition.

### ``public boolean isOffset()``

Reports whether the wrapped base source is offset.
Use this to preserve shifted elapsed-time identity through tick composition.

### ``public boolean isTicking()``

Reports that this source truncates reads to a configured tick size.
Use this when callers need to branch on stepped versus raw monotonic behavior.

### ``public Duration offsetDuration()``

Returns the wrapped base source's offset duration.
Use this to preserve offset introspection through tick composition.

### ``public Duration tickDuration()``

Returns this source's configured tick duration.
Use this when callers need to inspect stepped elapsed-time behavior explicitly.

### ``public long tickNanos()``

Returns this source's configured raw nanosecond tick size.
Use this when callers need precise stepped elapsed-time introspection.

### ``public long nanos()``

Returns the current monotonic reading truncated to this source's tick size.
Use this for deterministic stepped elapsed-time behavior instead of raw nanosecond precision.

### ``public boolean equals(Object other)``

Reports value equality for ticking monotonic sources.
Use this to compare composed ticking sources structurally by base source and tick size.

### ``public int hashCode()``

Returns a stable hash code for this ticking monotonic source.
Use this when ticking elapsed-time sources participate in maps, sets, or diagnostics.

### ``public String toString()``

Formats this source for diagnostics.
Use this when code needs a readable description of stepped elapsed-time composition.
