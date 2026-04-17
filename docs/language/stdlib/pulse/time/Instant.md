# pulse.time.Instant

Kind: ``class``

Source: ``stdlib/src/pulse/time/Instant.pulse``

## Summary

Point-in-time value backed by Unix epoch milliseconds.

## Declaration

```pulse
public final class Instant implements Comparable
```

## Members

### ``public static final Instant EPOCH = new Instant(0L);``

Unix epoch instant constant.
Use this when code needs a named zero-timestamp anchor.

### ``public Instant(int epochMillis)``

Creates an instant with the supplied epoch millisecond value.
Use this when reconstructing an instant from stored time data.

### ``public Instant(long epochMillis)``

Creates an instant with the supplied epoch millisecond value.
Use this when reconstructing an instant from full-width time data.

### ``public static Instant now()``

Returns the current runtime-backed instant value through the default UTC-style clock.
Use this when code needs the current wall-clock instant without injecting a clock explicitly.

### ``public static Instant now(Clock clock)``

Returns the current instant from the supplied clock.
Use this when code needs explicit deterministic or injected clock behavior.

### ``public static Instant ofEpochMillis(long epochMillis)``

Creates an instant from Unix epoch milliseconds.
Use this for named factory-style instant construction.

### ``public static Instant ofEpochSeconds(long epochSeconds)``

Creates an instant from whole Unix epoch seconds.
Use this when code naturally works in second resolution.

### ``public static Instant parse(String text)``

Parses an instant from ISO-style UTC-projected text `yyyy-MM-ddTHH:mm:ss.SSSZ`.
Use this when instant values arrive from configuration, files, or human input in the selected UTC-style model.

### ``public long toEpochMillis()``

Returns the stored epoch millisecond value.
Use this when converting an instant back into a primitive timestamp.

### ``public long toEpochSeconds()``

Returns the stored whole epoch-second value.
Use this when a wall-clock instant must be viewed at second resolution.

### ``public Instant plusMillis(long delta)``

Returns a new instant shifted forward by the supplied millisecond delta.
Use this when computing derived timestamps from a base instant.

### ``public Instant plusSeconds(long deltaSeconds)``

Returns a new instant shifted forward by the supplied whole-second delta.
Use this when timestamp arithmetic is naturally expressed in seconds.

### ``public Instant minusMillis(long delta)``

Returns a new instant shifted backward by the supplied millisecond delta.
Use this when computing earlier timestamps from a base instant.

### ``public Instant minusSeconds(long deltaSeconds)``

Returns a new instant shifted backward by the supplied whole-second delta.
Use this when timestamp arithmetic is naturally expressed in seconds.

### ``public Instant plus(Duration delta)``

Returns a new instant shifted forward by the supplied duration.
Use this when time arithmetic is already expressed as a `Duration`.

### ``public Instant minus(Duration delta)``

Returns a new instant shifted backward by the supplied duration.
Use this when subtracting a `Duration` from a base instant.

### ``public Duration durationUntil(Instant other)``

Returns the duration from this instant until the supplied other instant.
Use this when measuring elapsed or remaining wall-clock time.

### ``public boolean isBefore(Instant other)``

Reports whether this instant occurs before the supplied instant.
Use this for clear time-order checks in ordinary code.

### ``public boolean isAfter(Instant other)``

Reports whether this instant occurs after the supplied instant.
Use this for clear time-order checks in ordinary code.

### ``public LocalDateTime toLocalDateTime()``

Projects this instant into the current UTC-style local date/time view.
Use this when code needs calendar fields from an epoch timestamp.

### ``public LocalDate toLocalDate()``

Projects this instant into the current UTC-style local date view.
Use this when code needs only the calendar date from an epoch timestamp.

### ``public LocalTime toLocalTime()``

Projects this instant into the current UTC-style local time view.
Use this when code needs only the time-of-day from an epoch timestamp.

### ``public Instant truncatedToSeconds()``

Returns an instant truncated down to the nearest whole second.
Use this when code wants stable second-resolution wall-clock values.

### ``public Instant truncatedToMinutes()``

Returns an instant truncated down to the nearest whole minute.
Use this when code wants stable minute-resolution wall-clock values.

### ``public Instant truncatedToHours()``

Returns an instant truncated down to the nearest whole hour.
Use this when code wants stable hour-resolution wall-clock values.

### ``public Instant truncatedToDays()``

Returns an instant truncated down to the nearest whole day.
Use this when code wants stable day-resolution wall-clock values in the current UTC-style model.

### ``public int compareTo(Object other)``

Compares this instant to another instant by epoch millisecond order.
Use this when code is typed against `Comparable`.

### ``public boolean equals(Object other)``

Reports whether this instant has the same epoch millisecond value as the supplied object.
Use this for Java-like value equality on instants.

### ``public int hashCode()``

Returns a stable hash code derived from the stored epoch millisecond value.
Use this when instants participate in maps, sets, or other hashed structures.

### ``public String toString()``

Formats this instant using the current UTC-style projection baseline.
Use this for diagnostics and human-readable timestamps in the selected no-time-zone F1 slice.
