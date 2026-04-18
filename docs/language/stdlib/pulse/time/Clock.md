# pulse.time.Clock

Kind: ``interface``

Source: ``stdlib/src/pulse/time/Clock.pulse``

## Summary

Clock abstraction for the selected UTC-style epoch-millisecond time model.

## Declaration

```pulse
public interface Clock
```

## Members

### ``public static Clock systemUTC()``

Returns the default runtime-backed UTC-style clock.
Use this when code needs an explicit clock object instead of calling `now()` directly.

### ``public static Clock fixed(Instant instant)``

Returns a fixed clock pinned to the supplied instant.
Use this for deterministic tests and repeatable time-sensitive workflows.

### ``public static Clock fixedMillis(long epochMillis)``

Returns a fixed clock pinned to the supplied epoch millisecond value.
Use this when deterministic tests or simulations already have primitive epoch data.

### ``public static Clock offset(Clock base, Duration offset)``

Returns a clock that reads from the supplied base clock and then applies the supplied offset.
Use this when code needs deterministic shifted time without inventing time-zone semantics.

### ``public static Clock tick(Clock base, Duration tick)``

Returns a clock that truncates reads from the supplied base clock to the supplied whole-millisecond tick size.
Use this when deterministic workflows need stepped time instead of raw millisecond precision.

### ``default boolean isFixed()``

Reports whether this clock is fixed rather than runtime-backed.
Use this when callers need to branch on deterministic versus wall-clock behavior.

### ``default boolean isOffset()``

Reports whether this clock applies an offset on top of another clock.
Use this when callers need to branch on shifted versus direct clock behavior.

### ``default boolean isTicking()``

Reports whether this clock truncates reads to a configured tick size.
Use this when callers need to branch on stepped versus raw millisecond time behavior.

### ``default Duration offsetDuration()``

Returns the configured offset duration for this clock.
Use this when callers need to inspect the deterministic shift being applied.

### ``default Duration tickDuration()``

Returns the configured tick duration for this clock.
Use this when callers need to inspect stepped time behavior explicitly.

### ``default Clock withOffset(Duration offset)``

Returns a new clock that applies the supplied offset on top of this clock.
Use this for fluent deterministic clock shifting.

### ``default Clock withTick(Duration tick)``

Returns a new clock that truncates this clock to the supplied tick size.
Use this for fluent deterministic stepped-time composition.

### ``long millis();``

Returns the current epoch millisecond value from this clock.
Use this as the shared primitive source for clock-backed time factories.

### ``default Instant instant()``

Returns the current `Instant` from this clock.
Use this when code wants explicit clock-driven instant creation.

### ``default LocalDate today()``

Returns the current `LocalDate` from this clock.
Use this when code wants explicit clock-driven date creation.

### ``default LocalTime localTime()``

Returns the current `LocalTime` from this clock.
Use this when code wants explicit clock-driven time-of-day creation.

### ``default LocalDateTime localDateTime()``

Returns the current `LocalDateTime` from this clock.
Use this when code wants explicit clock-driven local date/time creation.
