# pulse.time.LocalDateTime

Kind: ``class``

Source: ``stdlib/src/pulse/time/LocalDateTime.pulse``

## Summary

Combined calendar date and time-of-day value using the current UTC-style epoch projection.

## Declaration

```pulse
public final class LocalDateTime implements Comparable<LocalDateTime>
```

## Members

### ``public LocalDateTime(int year, int month, int day, int hour, int minute, int second, int millis)``

Creates a date/time value from explicit calendar and time-of-day fields.
Use this when code needs a full local date/time value.

### ``public static LocalDateTime of(int year, int month, int day, int hour, int minute)``

Creates a date/time from year, month, day, hour, and minute.
Use this for minute-granularity date/time construction.

### ``public static LocalDateTime of(int year, int month, int day, int hour, int minute, int second)``

Creates a date/time from year, month, day, hour, minute, and second.
Use this for second-granularity date/time construction.

### ``public static LocalDateTime of(int year, int month, int day, int hour, int minute, int second, int millis)``

Creates a date/time from full calendar and time-of-day fields.
Use this for named factory-style date/time construction.

### ``public static LocalDateTime of(LocalDate date, LocalTime time)``

Creates a date/time by combining an existing date and time value.
Use this when code already has separate calendar and time-of-day objects.

### ``public static LocalDateTime parse(String text)``

Parses a date/time from ISO-style `yyyy-MM-ddTHH:mm:ss.SSS` text.
Use this when local date/time values arrive from configuration, files, or human input.

### ``public static LocalDateTime now()``

Returns the current date/time from the runtime-backed wall clock.
Use this when code needs the current local date/time view in the selected time model.

### ``public static LocalDateTime now(Clock clock)``

Returns the current date/time from the supplied clock.
Use this when code needs explicit deterministic or injected clock behavior.

### ``public static LocalDateTime ofEpochMillis(long epochMillis)``

Creates a date/time from Unix epoch milliseconds.
Use this when code already has an epoch timestamp and needs calendar fields.

### ``public static LocalDateTime ofEpochSeconds(long epochSeconds)``

Creates a date/time from whole Unix epoch seconds.
Use this when code naturally works in second resolution instead of millisecond resolution.

### ``public int year()``

Returns the year field.
Use this when date/time-aware logic needs the calendar year.

### ``public int month()``

Returns the month field.
Use this when date/time-aware logic needs the calendar month.

### ``public int day()``

Returns the day-of-month field.
Use this when date/time-aware logic needs the calendar day.

### ``public int hour()``

Returns the hour field.
Use this when date/time-aware logic needs the hour-of-day.

### ``public int minute()``

Returns the minute field.
Use this when date/time-aware logic needs the minute-of-hour.

### ``public int second()``

Returns the second field.
Use this when date/time-aware logic needs the second-of-minute.

### ``public int millis()``

Returns the millisecond field.
Use this when date/time-aware logic needs sub-second precision.

### ``public LocalDateTime withYear(int year)``

Returns a copy of this date/time with the supplied year while clamping to the target month length.
Use this when code needs direct year-field replacement.

### ``public LocalDateTime withMonth(int month)``

Returns a copy of this date/time with the supplied month while clamping to the target month length.
Use this when code needs direct month-field replacement.

### ``public LocalDateTime withDay(int day)``

Returns a copy of this date/time with the supplied day-of-month.
Use this when code needs direct day-field replacement.

### ``public LocalDateTime withHour(int hour)``

Returns a copy of this date/time with the supplied hour.
Use this when code needs direct hour-field replacement.

### ``public LocalDateTime withMinute(int minute)``

Returns a copy of this date/time with the supplied minute.
Use this when code needs direct minute-field replacement.

### ``public LocalDateTime withSecond(int second)``

Returns a copy of this date/time with the supplied second.
Use this when code needs direct second-field replacement.

### ``public LocalDateTime withMillis(int millis)``

Returns a copy of this date/time with the supplied millisecond field.
Use this when code needs direct sub-second field replacement.

### ``public long toEpochMillis()``

Returns this value as Unix epoch milliseconds.
Use this when converting a local date/time back into the selected epoch-based time model.

### ``public Instant toInstant()``

Returns this value as an `Instant`.
Use this when code needs a wall-clock point-in-time object.

### ``public LocalDate toLocalDate()``

Returns just the date portion of this date/time.
Use this when code needs calendar fields without the time-of-day component.

### ``public LocalTime toLocalTime()``

Returns just the time-of-day portion of this date/time.
Use this when code needs the local time without the date component.

### ``public LocalDateTime plusMillis(long delta)``

Returns a new date/time shifted by the supplied millisecond delta.
Use this when computing later or earlier timestamps in local date/time form.

### ``public LocalDateTime plus(Duration delta)``

Returns a new date/time shifted by the supplied duration.
Use this when date/time arithmetic is already expressed as a `Duration`.

### ``public LocalDateTime plusSeconds(long deltaSeconds)``

Returns a new date/time shifted by the supplied whole-second delta.
Use this when timestamp arithmetic is naturally expressed in seconds.

### ``public LocalDateTime plusMinutes(long deltaMinutes)``

Returns a new date/time shifted by the supplied whole-minute delta.
Use this when timestamp arithmetic is naturally expressed in minutes.

### ``public LocalDateTime plusHours(long deltaHours)``

Returns a new date/time shifted by the supplied whole-hour delta.
Use this when timestamp arithmetic is naturally expressed in hours.

### ``public LocalDateTime plusMonths(long months)``

Returns a new date/time shifted by the supplied whole-month count while clamping to the target month length.
Use this when calendar arithmetic is naturally expressed in months instead of elapsed milliseconds.

### ``public LocalDateTime plusYears(long years)``

Returns a new date/time shifted by the supplied whole-year count while clamping to the target month length.
Use this when calendar arithmetic is naturally expressed in years.

### ``public LocalDateTime minusMillis(long delta)``

Returns a new date/time shifted backward by the supplied millisecond delta.
Use this when computing earlier local date/time values.

### ``public LocalDateTime minus(Duration delta)``

Returns a new date/time shifted backward by the supplied duration.
Use this when subtracting a `Duration` from a base local date/time value.

### ``public LocalDateTime minusSeconds(long deltaSeconds)``

Returns a new date/time shifted backward by the supplied whole-second delta.
Use this when computing earlier date/time values in second resolution.

### ``public LocalDateTime minusMinutes(long deltaMinutes)``

Returns a new date/time shifted backward by the supplied whole-minute delta.
Use this when computing earlier date/time values in minute resolution.

### ``public LocalDateTime minusHours(long deltaHours)``

Returns a new date/time shifted backward by the supplied whole-hour delta.
Use this when computing earlier date/time values in hour resolution.

### ``public LocalDateTime plusDays(long days)``

Returns a new date/time shifted by the supplied whole-day count.
Use this when code needs calendar day arithmetic while preserving time-of-day.

### ``public LocalDateTime plusWeeks(long weeks)``

Returns a new date/time shifted by the supplied whole-week count.
Use this when calendar arithmetic is naturally expressed in weeks.

### ``public LocalDateTime minusDays(long days)``

Returns a new date/time shifted backward by the supplied whole-day count.
Use this when code needs earlier calendar dates while preserving time-of-day.

### ``public LocalDateTime minusWeeks(long weeks)``

Returns a new date/time shifted backward by the supplied whole-week count.
Use this when computing earlier calendar weeks while preserving time-of-day.

### ``public LocalDateTime minusMonths(long months)``

Returns a new date/time shifted backward by the supplied whole-month count.
Use this when computing earlier calendar dates while preserving time-of-day.

### ``public LocalDateTime minusYears(long years)``

Returns a new date/time shifted backward by the supplied whole-year count.
Use this when computing earlier calendar years while preserving time-of-day.

### ``public boolean isBefore(LocalDateTime other)``

Reports whether this date/time occurs before the supplied value.
Use this for clear timestamp-order checks in ordinary code.

### ``public boolean isAfter(LocalDateTime other)``

Reports whether this date/time occurs after the supplied value.
Use this for clear timestamp-order checks in ordinary code.

### ``public Duration durationUntil(LocalDateTime other)``

Returns the duration from this date/time until the supplied date/time.
Use this when local date/time workflows need elapsed measurement in the selected UTC-style model.

### ``public LocalDateTime truncatedToSeconds()``

Returns this date/time truncated down to the nearest whole second.
Use this when sub-second precision should be discarded deterministically.

### ``public LocalDateTime truncatedToMinutes()``

Returns this date/time truncated down to the nearest whole minute.
Use this when second and millisecond precision should be discarded deterministically.

### ``public LocalDateTime truncatedToHours()``

Returns this date/time truncated down to the nearest whole hour.
Use this when minute, second, and millisecond precision should be discarded deterministically.

### ``public LocalDateTime truncatedToDays()``

Returns this date/time truncated down to the start of its calendar day.
Use this when time-of-day precision should be discarded deterministically.

### ``public int compareTo(LocalDateTime other)``

Compares this date/time to another date/time by epoch-millisecond order.
Use this when code is typed against `Comparable`.

### ``public boolean equals(Object other)``

Reports whether this date/time has the same fields as the supplied object.
Use this for Java-like value equality on local date/time values.

### ``public int hashCode()``

Returns a stable hash code derived from the full date/time field set.
Use this when local date/time values participate in maps, sets, or other hashed structures.

### ``public String toString()``

Formats this value using ISO-style `yyyy-MM-ddTHH:mm:ss.SSS`.
Use this for diagnostics and human-readable local date/time text in the selected F1 slice.
