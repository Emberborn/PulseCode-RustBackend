# pulse.time.LocalDate

Kind: ``class``

Source: ``stdlib/src/pulse/time/LocalDate.pulse``

## Summary

Calendar date value using the current UTC-style epoch projection.

## Declaration

```pulse
public final class LocalDate implements Comparable<LocalDate>
```

## Members

### ``public LocalDate(int year, int month, int day)``

Creates a date from year, month, and day fields.
Use this when code needs an explicit calendar date value.

### ``public static LocalDate of(int year, int month, int day)``

Creates a date from year, month, and day fields.
Use this for named factory-style date construction.

### ``public static LocalDate ofYearDay(int year, int dayOfYear)``

Creates a date from a year and day-of-year value.
Use this when ordinal-date input is more natural than month/day fields.

### ``public static LocalDate parse(String text)``

Parses a date from ISO-style `yyyy-MM-dd` text.
Use this when date values arrive from configuration, files, or human input.

### ``public static LocalDate now()``

Returns the current date from the runtime-backed wall clock.
Use this when code needs today's calendar date in the selected time model.

### ``public static LocalDate now(Clock clock)``

Returns the current date from the supplied clock.
Use this when code needs explicit deterministic or injected clock behavior.

### ``public static LocalDate fromEpochMillis(long epochMillis)``

Creates a date from Unix epoch milliseconds.
Use this when code already has a timestamp and needs only the calendar date.

### ``public static LocalDate ofEpochDay(long epochDay)``

Creates a date from a Unix epoch day count.
Use this for day-granularity date conversions.

### ``public int year()``

Returns the year field.
Use this when date-aware logic needs the calendar year.

### ``public int month()``

Returns the month field.
Use this when date-aware logic needs the calendar month.

### ``public int day()``

Returns the day-of-month field.
Use this when date-aware logic needs the calendar day.

### ``public LocalDate withYear(int year)``

Returns a copy of this date with the supplied year while clamping to the target month length.
Use this when code needs field-style date rewriting instead of relative arithmetic.

### ``public LocalDate withMonth(int month)``

Returns a copy of this date with the supplied month while clamping to the target month length.
Use this when code needs field-style month rewriting instead of relative arithmetic.

### ``public LocalDate withDay(int day)``

Returns a copy of this date with the supplied day-of-month.
Use this when code needs direct calendar-day replacement.

### ``public boolean isLeapYear()``

Reports whether this date falls in a leap year.
Use this for calendar logic that depends on February length.

### ``public int lengthOfMonth()``

Returns the number of days in this date's month.
Use this when validating or advancing month-relative date logic.

### ``public int lengthOfYear()``

Returns the number of days in this date's year.
Use this when calendar logic needs leap-year-aware year length.

### ``public int dayOfYear()``

Returns the day-of-year value starting at 1.
Use this when date-aware logic needs ordinal day positioning within the year.

### ``public int dayOfWeek()``

Returns the ISO-style day-of-week value where Monday is 1 and Sunday is 7.
Use this when date-aware logic needs weekday ordering without a separate enum type.

### ``public long toEpochDay()``

Returns the Unix epoch day count for this date.
Use this when date math is easier in whole days.

### ``public LocalDate plusDays(long days)``

Returns a new date shifted by the supplied day count.
Use this when computing later or earlier calendar dates.

### ``public LocalDate plusWeeks(long weeks)``

Returns a new date shifted by the supplied whole-week delta.
Use this when calendar arithmetic is naturally expressed in weeks.

### ``public LocalDate plusMonths(long months)``

Returns a new date shifted by the supplied whole-month delta.
Use this when calendar arithmetic is naturally expressed in months.

### ``public LocalDate minusMonths(long months)``

Returns a new date shifted backward by the supplied whole-month delta.
Use this when computing earlier calendar dates in month resolution.

### ``public LocalDate plusYears(long years)``

Returns a new date shifted by the supplied whole-year delta.
Use this when calendar arithmetic is naturally expressed in years.

### ``public LocalDate minusYears(long years)``

Returns a new date shifted backward by the supplied whole-year delta.
Use this when computing earlier calendar dates in year resolution.

### ``public LocalDate minusDays(long days)``

Returns a new date shifted backward by the supplied day count.
Use this when computing earlier calendar dates.

### ``public LocalDate minusWeeks(long weeks)``

Returns a new date shifted backward by the supplied whole-week delta.
Use this when computing earlier calendar dates in week resolution.

### ``public LocalDateTime atTime(int hour, int minute, int second, int millis)``

Returns a date-time at the supplied time-of-day on this date.
Use this when combining a date with explicit time fields.

### ``public LocalDateTime atTime(int hour, int minute)``

Returns a date-time at the supplied hour and minute on this date.
Use this for minute-granularity date/time composition.

### ``public LocalDateTime atTime(int hour, int minute, int second)``

Returns a date-time at the supplied hour, minute, and second on this date.
Use this for second-granularity date/time composition.

### ``public LocalDateTime atTime(LocalTime time)``

Returns a date-time at the supplied local time on this date.
Use this when composing a date with an existing `LocalTime` value.

### ``public LocalDateTime atStartOfDay()``

Returns a date-time at local midnight on this date.
Use this when code needs the start-of-day timestamp for a calendar date.

### ``public boolean isBefore(LocalDate other)``

Reports whether this date occurs before the supplied date.
Use this for clear calendar-order checks in ordinary code.

### ``public boolean isAfter(LocalDate other)``

Reports whether this date occurs after the supplied date.
Use this for clear calendar-order checks in ordinary code.

### ``public Duration durationUntil(LocalDate other)``

Returns the duration from this date until the supplied date as whole-day milliseconds.
Use this when date-only workflows need elapsed measurement without a time-of-day component.

### ``public boolean isWeekend()``

Reports whether this date falls on a Saturday or Sunday in the selected UTC-style model.
Use this for lightweight calendar predicates without a separate day-of-week enum.

### ``public boolean isWeekday()``

Reports whether this date falls on a weekday in the selected UTC-style model.
Use this for lightweight workday-style calendar checks.

### ``public int compareTo(LocalDate other)``

Compares this date to another date by calendar order.
Use this when code is typed against `Comparable`.

### ``public boolean equals(Object other)``

Reports whether this date has the same year, month, and day as the supplied object.
Use this for Java-like value equality on dates.

### ``public int hashCode()``

Returns a stable hash code derived from the year, month, and day fields.
Use this when dates participate in maps, sets, or other hashed structures.

### ``public String toString()``

Formats this date using ISO-style `yyyy-MM-dd`.
Use this for diagnostics and human-readable date text in the selected F1 slice.
