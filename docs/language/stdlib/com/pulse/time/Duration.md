# com.pulse.time.Duration

Kind: ``class``

Source: ``stdlib/src/com/pulse/time/Duration.pulse``

## Summary

Time-span value representing a millisecond duration.

## Declaration

```pulse
class Duration
```

## Members

### ``public Duration(int millis)``

Creates a duration with the supplied millisecond count.
Use this when constructing a duration from known millisecond data.

### ``public static Duration ofMillis(int millis)``

Creates a duration from the supplied millisecond count.
Use this for named factory-style duration construction.

### ``public int toMillis()``

Returns the stored millisecond count.
Use this when a duration must be converted back to a primitive value.

### ``public Duration plus(Duration other)``

Returns a new duration representing this duration plus the other duration.
Use this when accumulating elapsed time.

### ``public Duration minus(Duration other)``

Returns a new duration representing this duration minus the other duration.
Use this when computing remaining or difference time spans.
