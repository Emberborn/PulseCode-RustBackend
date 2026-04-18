# aden.time.OffsetClock

Kind: ``class``

Source: ``stdlib/src/aden/time/OffsetClock.aden``

## Summary

Internal offset clock implementation that shifts reads from a base clock.

## Declaration

```aden
final class OffsetClock implements Clock
```

## Members

### ``public boolean isFixed()``

Reports whether the wrapped base clock is fixed.
Use this to preserve deterministic clock identity through offset composition.

### ``public boolean isOffset()``

Reports that this clock applies an offset to a base clock.
Use this when callers need to branch on shifted versus direct clock behavior.

### ``public boolean isTicking()``

Reports whether the wrapped base clock is also ticking.
Use this to preserve composed clock identity through offset wrapping.

### ``public Duration offsetDuration()``

Returns the total configured offset duration for this composed clock.
Use this when callers need to inspect the deterministic shift being applied.

### ``public Duration tickDuration()``

Returns the wrapped base clock's tick duration.
Use this to preserve tick introspection through offset composition.

### ``public long millis()``

Returns the current epoch millisecond value after applying this clock's offset.
Use this for deterministic shifted time without inventing time-zone semantics.

### ``public boolean equals(Object other)``

Reports value equality for offset clocks.
Use this to compare composed offset clocks structurally by base clock and offset amount.

### ``public int hashCode()``

Returns a stable hash code for this offset clock.
Use this when offset clocks participate in maps, sets, or diagnostics.

### ``public String toString()``

Formats this clock for diagnostics.
Use this when code needs a readable description of shifted clock composition.
