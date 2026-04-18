# aden.time.TickClock

Kind: ``class``

Source: ``stdlib/src/aden/time/TickClock.aden``

## Summary

Internal ticking clock implementation that truncates reads from a base clock.

## Declaration

```aden
final class TickClock implements Clock
```

## Members

### ``public boolean isFixed()``

Reports whether the wrapped base clock is fixed.
Use this to preserve deterministic clock identity through tick composition.

### ``public boolean isOffset()``

Reports whether the wrapped base clock is offset.
Use this to preserve shifted clock identity through tick composition.

### ``public boolean isTicking()``

Reports that this clock truncates reads to a configured tick size.
Use this when callers need to branch on stepped versus raw millisecond behavior.

### ``public Duration offsetDuration()``

Returns the wrapped base clock's offset duration.
Use this to preserve offset introspection through tick composition.

### ``public Duration tickDuration()``

Returns this clock's configured tick duration.
Use this when callers need to inspect stepped time behavior explicitly.

### ``public long millis()``

Returns the current epoch millisecond value truncated to this clock's tick size.
Use this for deterministic stepped time instead of raw millisecond precision.

### ``public boolean equals(Object other)``

Reports value equality for ticking clocks.
Use this to compare composed ticking clocks structurally by base clock and tick duration.

### ``public int hashCode()``

Returns a stable hash code for this ticking clock.
Use this when ticking clocks participate in maps, sets, or diagnostics.

### ``public String toString()``

Formats this clock for diagnostics.
Use this when code needs a readable description of stepped clock composition.
