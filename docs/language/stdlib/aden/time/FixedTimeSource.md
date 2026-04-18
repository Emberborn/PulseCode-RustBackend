# aden.time.FixedTimeSource

Kind: ``class``

Source: ``stdlib/src/aden/time/FixedTimeSource.aden``

## Summary

Internal fixed monotonic time-source implementation for deterministic elapsed-time reads.

## Declaration

```aden
final class FixedTimeSource implements TimeSource
```

## Members

### ``public boolean isFixed()``

Reports that this source is deterministic and fixed.
Use this when callers need to branch on fixed versus runtime-backed elapsed-time behavior.

### ``public long nanos()``

Returns the fixed monotonic nanosecond-style reading.
Use this as the deterministic elapsed-time source for tests and simulations.

### ``public boolean equals(Object other)``

Reports value equality for fixed monotonic sources.
Use this to compare deterministic elapsed-time sources by their pinned reading.

### ``public int hashCode()``

Returns a stable hash code derived from the fixed monotonic reading.
Use this when fixed elapsed-time sources participate in maps, sets, or diagnostics.

### ``public String toString()``

Formats this source for diagnostics.
Use this when code needs a readable description of a deterministic fixed elapsed-time source.
