# pulse.time.TimeSources

Kind: ``class``

Source: ``stdlib/src/pulse/time/TimeSources.pulse``

## Summary

Companion factory surface for monotonic elapsed-time sources.

## Declaration

```pulse
public final class TimeSources
```

## Members

### ``public static TimeSource systemMonotonic()``

Returns the default runtime-backed monotonic elapsed-time source.
Use this when code needs an explicit monotonic source object for relative timing.

### ``public static TimeSource processMonotonic()``

Returns the process-relative monotonic elapsed-time source.
Use this when code wants a naming style that emphasizes relative/process timing.

### ``public static TimeSource fixedNanos(long nanos)``

Returns a fixed time source pinned to the supplied monotonic nanosecond-style reading.
Use this for deterministic elapsed-time tests and simulations.

### ``public static TimeSource fixed(Duration elapsed)``

Returns a fixed time source pinned to the supplied millisecond duration as nanosecond-style reading.
Use this when deterministic elapsed-time tests already have millisecond data.

### ``public static TimeSource offset(TimeSource base, Duration offset)``

Returns a time source that reads from the supplied base source and then applies the supplied offset.
Use this when code needs deterministic shifted elapsed-time behavior.

### ``public static TimeSource offsetNanos(TimeSource base, long nanos)``

Returns a time source that reads from the supplied base source and then applies the supplied raw nanosecond offset.
Use this when elapsed-time code wants to preserve nanosecond precision instead of collapsing through milliseconds.

### ``public static TimeSource tick(TimeSource base, Duration tick)``

Returns a time source that truncates reads from the supplied base source to the supplied tick size.
Use this when deterministic workflows need stepped monotonic time instead of raw nanosecond reads.

### ``public static TimeSource tickNanos(TimeSource base, long nanos)``

Returns a time source that truncates reads from the supplied base source to the supplied raw nanosecond tick size.
Use this when stepped elapsed-time behavior must preserve nanosecond precision.
