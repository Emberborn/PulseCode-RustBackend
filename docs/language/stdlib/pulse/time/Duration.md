# pulse.time.Duration

Kind: ``class``

Source: ``stdlib/src/pulse/time/Duration.pulse``

## Summary

Time-span value representing a millisecond duration.

## Declaration

```pulse
public final class Duration implements Comparable
```

## Members

### ``public static final Duration ZERO = new Duration(0L);``

Zero-length duration constant.
Use this when code needs a named no-elapsed-time sentinel.

### ``public Duration(int millis)``

Creates a duration with the supplied millisecond count.
Use this when constructing a duration from known millisecond data.

### ``public Duration(long millis)``

Creates a duration with the supplied millisecond count.
Use this when constructing a duration from full-width millisecond data.

### ``public static Duration ofMillis(long millis)``

Creates a duration from the supplied millisecond count.
Use this for named factory-style duration construction.

### ``public static Duration ofSeconds(long seconds)``

Creates a duration from the supplied second count.
Use this when duration arithmetic is naturally expressed in seconds.

### ``public static Duration ofMinutes(long minutes)``

Creates a duration from the supplied minute count.
Use this when duration arithmetic is naturally expressed in minutes.

### ``public static Duration ofHours(long hours)``

Creates a duration from the supplied hour count.
Use this when duration arithmetic is naturally expressed in hours.

### ``public static Duration ofDays(long days)``

Creates a duration from the supplied day count.
Use this when duration arithmetic is naturally expressed in whole days.

### ``public static Duration between(Instant startInclusive, Instant endExclusive)``

Returns the duration between the supplied instants.
Use this for named elapsed-time construction from instants.

### ``public static Duration between(LocalDate startInclusive, LocalDate endExclusive)``

Returns the duration between the supplied local dates as whole-day milliseconds.
Use this for date-only elapsed-time measurement in the selected UTC-style model.

### ``public static Duration between(LocalTime startInclusive, LocalTime endExclusive)``

Returns the duration between the supplied local times within the same wrapped day model.
Use this for time-of-day elapsed measurement without introducing date or zone semantics.

### ``public static Duration between(LocalDateTime startInclusive, LocalDateTime endExclusive)``

Returns the duration between the supplied local date/time values.
Use this for elapsed-time measurement across UTC-style local date/time values.

### ``public long toMillis()``

Returns the stored millisecond count.
Use this when a duration must be converted back to a primitive value.

### ``public long toSeconds()``

Returns the stored whole-second count.
Use this when a duration must be viewed at second resolution.

### ``public long toMinutes()``

Returns the stored whole-minute count.
Use this when a duration must be viewed at minute resolution.

### ``public long toHours()``

Returns the stored whole-hour count.
Use this when a duration must be viewed at hour resolution.

### ``public long toDays()``

Returns the stored whole-day count.
Use this when a duration must be viewed at day resolution.

### ``public Duration plus(Duration other)``

Returns a new duration representing this duration plus the other duration.
Use this when accumulating elapsed time.

### ``public Duration plusMillis(long millis)``

Returns a new duration increased by the supplied millisecond count.
Use this when duration arithmetic is naturally expressed as scalar millisecond deltas.

### ``public Duration plusSeconds(long seconds)``

Returns a new duration increased by the supplied whole-second count.
Use this when duration arithmetic is naturally expressed in seconds.

### ``public Duration plusMinutes(long minutes)``

Returns a new duration increased by the supplied whole-minute count.
Use this when duration arithmetic is naturally expressed in minutes.

### ``public Duration plusHours(long hours)``

Returns a new duration increased by the supplied whole-hour count.
Use this when duration arithmetic is naturally expressed in hours.

### ``public Duration plusDays(long days)``

Returns a new duration increased by the supplied whole-day count.
Use this when duration arithmetic is naturally expressed in days.

### ``public Duration minus(Duration other)``

Returns a new duration representing this duration minus the other duration.
Use this when computing remaining or difference time spans.

### ``public Duration minusMillis(long millis)``

Returns a new duration decreased by the supplied millisecond count.
Use this when duration arithmetic is naturally expressed as scalar millisecond deltas.

### ``public Duration minusSeconds(long seconds)``

Returns a new duration decreased by the supplied whole-second count.
Use this when duration arithmetic is naturally expressed in seconds.

### ``public Duration minusMinutes(long minutes)``

Returns a new duration decreased by the supplied whole-minute count.
Use this when duration arithmetic is naturally expressed in minutes.

### ``public Duration minusHours(long hours)``

Returns a new duration decreased by the supplied whole-hour count.
Use this when duration arithmetic is naturally expressed in hours.

### ``public Duration minusDays(long days)``

Returns a new duration decreased by the supplied whole-day count.
Use this when duration arithmetic is naturally expressed in days.

### ``public Duration multipliedBy(int factor)``

Returns a new duration multiplied by the supplied scalar.
Use this when repeating a duration pattern by a small factor.

### ``public Duration dividedBy(int divisor)``

Returns a new duration divided by the supplied scalar.
Use this when elapsed time must be partitioned evenly by a small factor.

### ``public Duration dividedBy(long divisor)``

Returns a new duration divided by the supplied scalar.
Use this when elapsed time must be partitioned evenly without introducing floating arithmetic.

### ``public Duration abs()``

Returns the absolute-value duration.
Use this when code wants elapsed magnitude without sign.

### ``public Duration negated()``

Returns the negated duration.
Use this when code needs to invert the direction of a time span.

### ``public boolean isZero()``

Reports whether this duration is exactly zero.
Use this for the common empty-duration check.

### ``public boolean isNegative()``

Reports whether this duration is negative.
Use this when code needs to distinguish elapsed versus remaining-style durations.

### ``public boolean isBefore(Duration other)``

Reports whether this duration is shorter than the supplied duration.
Use this for clear time-span ordering checks in ordinary code.

### ``public boolean isAfter(Duration other)``

Reports whether this duration is longer than the supplied duration.
Use this for clear time-span ordering checks in ordinary code.

### ``public int compareTo(Object other)``

Compares this duration to another duration by millisecond magnitude.
Use this when code is typed against `Comparable`.

### ``public boolean equals(Object other)``

Reports whether this duration has the same millisecond count as the supplied object.
Use this for Java-like value equality on durations.

### ``public int hashCode()``

Returns a stable hash code derived from the stored millisecond count.
Use this when durations participate in maps, sets, or other hashed structures.

### ``public String toString()``

Formats this duration using a practical ISO-like `PT...S` representation.
Use this for diagnostics and human-readable duration text in the selected F1 slice.
