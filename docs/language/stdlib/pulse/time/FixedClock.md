# pulse.time.FixedClock

Kind: ``class``

Source: ``stdlib/src/pulse/time/FixedClock.pulse``

## Summary

Internal fixed clock implementation for deterministic time reads.

## Declaration

```pulse
final class FixedClock implements Clock
```

## Members

### ``public boolean isFixed()``

Reports that this clock is deterministic and fixed.
Use this when callers need to branch on fixed versus runtime-backed behavior.

### ``public long millis()``

Returns the fixed epoch millisecond value.
Use this as the deterministic millisecond source for tests and simulations.

### ``public boolean equals(Object other)``

Reports value equality for fixed clocks.
Use this to compare deterministic clock instances by their pinned epoch millisecond value.

### ``public int hashCode()``

Returns a stable hash code derived from the fixed epoch millisecond value.
Use this when fixed clocks participate in maps, sets, or diagnostics.

### ``public String toString()``

Formats this clock for diagnostics.
Use this when code needs a readable description of a deterministic fixed clock.
