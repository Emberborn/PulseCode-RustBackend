# aden.time.SystemTimeSource

Kind: ``class``

Source: ``stdlib/src/aden/time/SystemTimeSource.aden``

## Summary

Internal runtime-backed monotonic time-source implementation.

## Declaration

```aden
final class SystemTimeSource implements TimeSource
```

## Members

### ``public long nanos()``

Returns the current runtime-backed monotonic nanosecond-style reading.
Use this as the concrete elapsed-time read for the default process-relative source.

### ``public boolean equals(Object other)``

Reports equality for system monotonic sources.
Use this to treat all runtime-backed monotonic sources as the same live source.

### ``public int hashCode()``

Returns a stable hash code for system monotonic sources.
Use this when monotonic sources participate in maps, sets, or diagnostics.

### ``public String toString()``

Formats this source for diagnostics.
Use this when code needs a readable description of the runtime-backed monotonic source.
