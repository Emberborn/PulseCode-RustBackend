# aden.time.LocalTime

Kind: ``class``

Source: ``stdlib/src/aden/time/LocalTime.aden``

## Summary

Time-of-day value using the current UTC-style epoch projection.

## Declaration

```aden
public final class LocalTime implements Comparable
```

## Members

### ``public static final LocalTime MIDNIGHT = new LocalTime(0, 0, 0, 0);``

Midnight constant for the current local-time model.
Use this when code needs the canonical start-of-day value.

### ``public static final LocalTime NOON = new LocalTime(12, 0, 0, 0);``

Noon constant for the current local-time model.
Use this when code needs the canonical middle-of-day value.

### ``public LocalTime(int hour, int minute, int second, int millis)``

Creates a time-of-day value from hour, minute, second, and millisecond fields.
Use this when code needs an explicit local time value.

### ``public static LocalTime of(int hour, int minute)``

Creates a time-of-day value from hour and minute.
Use this for minute-granularity time construction.

### ``public static LocalTime of(int hour, int minute, int second)``

Creates a time-of-day value from hour, minute, and second.
Use this for second-granularity time construction.

### ``public static LocalTime of(int hour, int minute, int second, int millis)``

Creates a time-of-day value from hour, minute, second, and millisecond fields.
Use this for named factory-style time construction.

### ``public static LocalTime ofSecondOfDay(int secondOfDay)``

Creates a time-of-day value from the supplied whole-second count since local midnight.
Use this when code naturally works in second-of-day resolution.

### ``public static LocalTime parse(String text)``

Parses a time from ISO-style `HH:mm:ss.SSS` text.
Use this when time values arrive from configuration, files, or human input.

### ``public static LocalTime now()``

Returns the current time-of-day from the runtime-backed wall clock.
Use this when code needs the current local time view in the selected time model.

### ``public static LocalTime now(Clock clock)``

Returns the current time-of-day from the supplied clock.
Use this when code needs explicit deterministic or injected clock behavior.

### ``public static LocalTime fromEpochMillis(long epochMillis)``

Creates a time-of-day value from Unix epoch milliseconds.
Use this when code already has a timestamp and needs only the time-of-day projection.

### ``public int hour()``

Returns the hour field.
Use this when time-aware logic needs the hour-of-day.

### ``public int minute()``

Returns the minute field.
Use this when time-aware logic needs the minute-of-hour.

### ``public int second()``

Returns the second field.
Use this when time-aware logic needs the second-of-minute.

### ``public int millis()``

Returns the millisecond field.
Use this when time-aware logic needs sub-second precision in the selected model.

### ``public LocalTime withHour(int hour)``

Returns a copy of this time with the supplied hour.
Use this when code needs direct time-field replacement.

### ``public LocalTime withMinute(int minute)``

Returns a copy of this time with the supplied minute.
Use this when code needs direct minute-field replacement.

### ``public LocalTime withSecond(int second)``

Returns a copy of this time with the supplied second.
Use this when code needs direct second-field replacement.

### ``public LocalTime withMillis(int millis)``

Returns a copy of this time with the supplied millisecond field.
Use this when code needs direct sub-second field replacement.

### ``public int toMillisOfDay()``

Returns the millisecond count since local midnight.
Use this when time math is easier in a single wrapped primitive value.

### ``public int toSecondOfDay()``

Returns the whole-second count since local midnight.
Use this when time math is easier in a wrapped second-of-day value.

### ``public LocalTime plusMillis(long delta)``

Returns a new time shifted by the supplied millisecond delta, wrapping within the day.
Use this when code needs pure time-of-day arithmetic without a date component.

### ``public LocalTime plusSeconds(long deltaSeconds)``

Returns a new time shifted by the supplied whole-second delta, wrapping within the day.
Use this when time-of-day arithmetic is naturally expressed in seconds.

### ``public LocalTime plusMinutes(long deltaMinutes)``

Returns a new time shifted by the supplied whole-minute delta, wrapping within the day.
Use this when time-of-day arithmetic is naturally expressed in minutes.

### ``public LocalTime plusHours(long deltaHours)``

Returns a new time shifted by the supplied whole-hour delta, wrapping within the day.
Use this when time-of-day arithmetic is naturally expressed in hours.

### ``public LocalTime minusMillis(long delta)``

Returns a new time shifted backward by the supplied millisecond delta, wrapping within the day.
Use this when computing earlier local times without a date component.

### ``public LocalTime minusSeconds(long deltaSeconds)``

Returns a new time shifted backward by the supplied whole-second delta, wrapping within the day.
Use this when computing earlier local times in second resolution.

### ``public LocalTime minusMinutes(long deltaMinutes)``

Returns a new time shifted backward by the supplied whole-minute delta, wrapping within the day.
Use this when computing earlier local times in minute resolution.

### ``public LocalTime minusHours(long deltaHours)``

Returns a new time shifted backward by the supplied whole-hour delta, wrapping within the day.
Use this when computing earlier local times in hour resolution.

### ``public LocalDateTime atDate(LocalDate date)``

Returns a date-time at this time on the supplied date.
Use this when combining a time-of-day with a separate calendar date.

### ``public boolean isBefore(LocalTime other)``

Reports whether this time occurs before the supplied time within the day.
Use this for clear time-of-day ordering checks in ordinary code.

### ``public boolean isAfter(LocalTime other)``

Reports whether this time occurs after the supplied time within the day.
Use this for clear time-of-day ordering checks in ordinary code.

### ``public Duration durationUntil(LocalTime other)``

Returns the duration from this time until the supplied time within the same wrapped day model.
Use this for time-of-day elapsed measurement without introducing date semantics.

### ``public LocalTime truncatedToSeconds()``

Returns this time truncated down to the nearest whole second.
Use this when sub-second precision should be discarded deterministically.

### ``public LocalTime truncatedToMinutes()``

Returns this time truncated down to the nearest whole minute.
Use this when second and millisecond precision should be discarded deterministically.

### ``public LocalTime truncatedToHours()``

Returns this time truncated down to the nearest whole hour.
Use this when minute, second, and millisecond precision should be discarded deterministically.

### ``public int compareTo(Object other)``

Compares this time to another time by millisecond-of-day order.
Use this when code is typed against `Comparable`.

### ``public boolean equals(Object other)``

Reports whether this time has the same hour/minute/second/millisecond fields as the supplied object.
Use this for Java-like value equality on local times.

### ``public int hashCode()``

Returns a stable hash code derived from the time-of-day fields.
Use this when local times participate in maps, sets, or other hashed structures.

### ``public String toString()``

Formats this time using ISO-style `HH:mm:ss.SSS`.
Use this for diagnostics and human-readable time text in the selected F1 slice.
