# pulse.time.TimeSource

Kind: ``interface``

Source: ``stdlib/src/pulse/time/TimeSource.pulse``

## Summary

Monotonic elapsed-time source abstraction for process-relative timing.

## Declaration

```pulse
public interface TimeSource
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

Returns a fixed time source pinned to the supplied elapsed duration.
Use this when deterministic elapsed-time tests already have duration data.

### ``public static TimeSource offset(TimeSource base, Duration offset)``

Returns a time source that reads from the supplied base source and then applies the supplied offset.
Use this when code needs deterministic shifted elapsed-time behavior.

### ``public static TimeSource offsetNanos(TimeSource base, long nanos)``

Returns a time source that reads from the supplied base source and then applies the supplied raw nanosecond offset.
Use this when elapsed-time code wants to preserve nanosecond precision instead of collapsing through milliseconds.

### ``public static TimeSource tick(TimeSource base, Duration tick)``

Returns a time source that truncates reads from the supplied base source to the supplied tick size.
Use this when deterministic workflows need stepped elapsed-time behavior.

### ``public static TimeSource tickNanos(TimeSource base, long nanos)``

Returns a time source that truncates reads from the supplied base source to the supplied raw nanosecond tick size.
Use this when stepped elapsed-time behavior must preserve nanosecond precision.

### ``default boolean isFixed()``

Reports whether this time source is fixed rather than runtime-backed.
Use this when callers need to branch on deterministic versus live elapsed-time behavior.

### ``default boolean isOffset()``

Reports whether this time source applies an offset on top of another source.
Use this when callers need to branch on shifted versus direct elapsed-time behavior.

### ``default boolean isTicking()``

Reports whether this time source truncates reads to a configured tick size.
Use this when callers need to branch on stepped versus raw monotonic reads.

### ``default Duration offsetDuration()``

Returns the configured offset duration for this source.
Use this when callers need to inspect deterministic elapsed-time shifts.

### ``default long offsetNanos()``

Returns the configured raw nanosecond offset for this source.
Use this when callers need precise offset introspection without millisecond truncation.

### ``default Duration tickDuration()``

Returns the configured tick duration for this source.
Use this when callers need to inspect stepped elapsed-time behavior explicitly.

### ``default long tickNanos()``

Returns the configured raw nanosecond tick size for this source.
Use this when callers need precise stepped elapsed-time introspection.

### ``default TimeSource withOffset(Duration offset)``

Returns a new time source that applies the supplied offset on top of this source.
Use this for fluent deterministic elapsed-time shifting.

### ``default TimeSource withOffsetNanos(long nanos)``

Returns a new time source that applies the supplied raw nanosecond offset on top of this source.
Use this for fluent precision-preserving elapsed-time shifting.

### ``default TimeSource withTick(Duration tick)``

Returns a new time source that truncates this source to the supplied tick size.
Use this for fluent deterministic stepped elapsed-time composition.

### ``default TimeSource truncatedTo(Duration tick)``

Returns a new time source truncated to the supplied tick size.
This is an alias for `withTick(...)` for callers that think in truncation terms.

### ``default TimeSource withTickNanos(long nanos)``

Returns a new time source that truncates this source to the supplied raw nanosecond tick size.
Use this for fluent precision-preserving stepped elapsed-time composition.

### ``long nanos();``

Returns the current monotonic nanosecond-style reading from this source.
Use this as the primary primitive for elapsed-time measurement.

### ``default long millis()``

Returns the current reading projected into whole milliseconds.
Use this when elapsed-time callers only need millisecond granularity.

### ``default Duration elapsedSince(long startNanos)``

Returns the elapsed duration from the supplied monotonic start reading until now.
Use this when code wants a `Duration` without manually subtracting raw nanosecond values.

### ``default long elapsedNanosSince(long startNanos)``

Returns the raw nanosecond delta from the supplied monotonic start reading until now.
Use this when elapsed-time callers need full precision instead of millisecond projection.
