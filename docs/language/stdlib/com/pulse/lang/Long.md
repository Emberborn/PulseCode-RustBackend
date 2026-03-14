# com.pulse.lang.Long

Kind: ``class``

Source: ``stdlib/src/com/pulse/lang/Long.pulse``

## Summary

Wrapper facade for signed 64-bit integer values.

## Declaration

```pulse
public final class Long
```

## Members

### ``public static final long MIN_VALUE = -9223372036854775807L - 1L;``

Smallest representable signed long value.

### ``public static final long MAX_VALUE = 9223372036854775807L;``

Largest representable signed long value.

### ``public static Long valueOf(long value)``

Boxes a primitive long into the wrapper form.
Use this when a reference-shaped long value is required.

### ``public static Long parse(String text)``

Parses text into a long wrapper.
Use this for textual long conversion at API boundaries.

### ``public static long longValue(Long value)``

Unboxes a wrapper value into a primitive long.
Use this when primitive arithmetic or APIs require a long.

### ``public static boolean equals(long left, long right)``

Compares two primitive longs for equality.
Use this for helper-style primitive equality checks.

### ``public static int compare(long left, long right)``

Orders two primitive longs.
Use this when long values need deterministic comparison results.

### ``public static String toString(long value)``

Converts a primitive long into Java-like decimal text.
Use this when formatting long values without manual casts.

### ``private static long runtimeParse(String text)``

Runtime-backed helper for long parsing.
Use this only inside the stdlib `Long` implementation.

### ``private static String runtimeToString(long value)``

Runtime-backed helper for long formatting.
Use this only inside the stdlib `Long` implementation.
