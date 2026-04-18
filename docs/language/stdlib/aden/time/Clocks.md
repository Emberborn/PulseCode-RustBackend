# aden.time.Clocks

Kind: ``class``

Source: ``stdlib/src/aden/time/Clocks.aden``

## Summary

Companion factory surface for the selected UTC-style `Clock` model.

## Declaration

```aden
public final class Clocks
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
