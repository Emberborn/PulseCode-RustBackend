# com.pulse.lang.Short

Kind: ``class``

Source: ``stdlib/src/com/pulse/lang/Short.pulse``

## Summary

Wrapper facade for signed 16-bit integer values.

## Declaration

```pulse
public final class Short
```

## Members

### ``public static final short MIN_VALUE = (short) -32768;``

Smallest representable signed short value.

### ``public static final short MAX_VALUE = (short) 32767;``

Largest representable signed short value.

### ``public static Short valueOf(short value)``

Boxes a primitive short into the wrapper form.
Use this when a reference-shaped short value is required.

### ``public static Short parse(String text)``

Parses text into a short wrapper.
Use this for textual short conversion at API boundaries.

### ``public static short shortValue(Short value)``

Unboxes a wrapper value into a primitive short.
Use this when primitive arithmetic or APIs require a short.

### ``public static boolean equals(short left, short right)``

Compares two primitive shorts for equality.
Use this for helper-style primitive equality checks.

### ``public static int compare(short left, short right)``

Orders two primitive shorts.
Use this when short values need deterministic comparison results.

### ``public static String toString(short value)``

Converts a primitive short into Java-like decimal text.
Use this when formatting short values without manual casts.
