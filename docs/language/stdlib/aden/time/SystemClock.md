# aden.time.SystemClock

Kind: ``class``

Source: ``stdlib/src/aden/time/SystemClock.aden``

## Summary

Internal runtime-backed system clock implementation for the current UTC-style time model.

## Declaration

```aden
final class SystemClock implements Clock
```

## Members

### ``public long millis()``

Returns the current runtime-backed epoch millisecond value.
Use this as the concrete wall-clock read for the default UTC-style system clock.

### ``public boolean equals(Object other)``

Reports equality for system clock instances.
Use this to treat all system clock instances as the same runtime-backed source.

### ``public int hashCode()``

Returns a stable hash code for system clocks.
Use this when system clocks participate in maps, sets, or diagnostics.

### ``public String toString()``

Formats this clock for diagnostics.
Use this when code needs a readable description of the runtime-backed system clock.
