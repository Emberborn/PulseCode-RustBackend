# pulse.time.OffsetTimeSource

Kind: ``class``

Source: ``stdlib/src/pulse/time/OffsetTimeSource.pulse``

## Summary

Internal offset monotonic time-source implementation that shifts reads from a base source.

## Declaration

```pulse
final class OffsetTimeSource implements TimeSource
```

## Members

### ``public boolean isFixed()``

Reports whether the wrapped base source is fixed.
Use this to preserve deterministic elapsed-time identity through offset composition.

### ``public boolean isOffset()``

Reports that this source applies an offset to a base source.
Use this when callers need to branch on shifted versus direct elapsed-time behavior.

### ``public boolean isTicking()``

Reports whether the wrapped base source is also ticking.
Use this to preserve composed elapsed-time identity through offset wrapping.

### ``public Duration offsetDuration()``

Returns the total configured offset duration for this composed source.
Use this when callers need to inspect the deterministic shift being applied.

### ``public long offsetNanos()``

Returns the total configured raw nanosecond offset for this composed source.
Use this when callers need precise offset introspection without millisecond truncation.

### ``public Duration tickDuration()``

Returns the wrapped base source's tick duration.
Use this to preserve tick introspection through offset composition.

### ``public long tickNanos()``

Returns the wrapped base source's raw nanosecond tick size.
Use this to preserve precise tick introspection through offset composition.

### ``public long nanos()``

Returns the current monotonic reading after applying this source's offset.
Use this for deterministic shifted elapsed-time behavior.

### ``public boolean equals(Object other)``

Reports value equality for offset monotonic sources.
Use this to compare composed elapsed-time sources structurally by base source and offset amount.

### ``public int hashCode()``

Returns a stable hash code for this offset monotonic source.
Use this when offset elapsed-time sources participate in maps, sets, or diagnostics.

### ``public String toString()``

Formats this source for diagnostics.
Use this when code needs a readable description of shifted elapsed-time composition.
