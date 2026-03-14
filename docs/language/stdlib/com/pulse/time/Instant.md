# com.pulse.time.Instant

Kind: ``class``

Source: ``stdlib/src/com/pulse/time/Instant.pulse``

## Summary

Point-in-time value for the current runtime-backed clock model.

## Declaration

```pulse
class Instant
```

## Members

### ``public Instant(int epochMillis)``

Creates an instant with the supplied epoch millisecond value.
Use this when reconstructing an instant from stored time data.

### ``public static Instant now()``

Returns the next runtime-backed instant value.
Use this when code needs the current monotonic instant from the runtime model.

### ``public int toEpochMillis()``

Returns the stored epoch millisecond value.
Use this when converting an instant back into a primitive timestamp.

### ``public Instant plusMillis(int delta)``

Returns a new instant shifted forward by the supplied millisecond delta.
Use this when computing derived timestamps from a base instant.
