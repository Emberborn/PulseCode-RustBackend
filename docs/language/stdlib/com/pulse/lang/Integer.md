# com.pulse.lang.Integer

Kind: ``class``

Source: ``stdlib/src/com/pulse/lang/Integer.pulse``

## Summary

Wrapper facade for signed 32-bit integer values.

## Declaration

```pulse
public final class Integer
```

## Members

### ``public static final int MIN_VALUE = -2147483647 - 1;``

Smallest representable signed integer value.

### ``public static final int MAX_VALUE = 2147483647;``

Largest representable signed integer value.

### ``public static Integer valueOf(int value)``

Boxes a primitive int into the wrapper form.
Use this when a reference-shaped integer value is required.

### ``public static Integer parse(String text)``

Parses text into an integer wrapper.
Use this for textual integer conversion at API boundaries.

### ``public static int intValue(Integer value)``

Unboxes a wrapper value into a primitive int.
Use this when primitive arithmetic or APIs require an int.

### ``public static boolean equals(int left, int right)``

Compares two primitive ints for equality.
Use this for helper-style primitive equality checks.

### ``public static int compare(int left, int right)``

Orders two primitive ints.
Use this when integer values need deterministic comparison results.

### ``public static String toString(int value)``

Converts a primitive int into Java-like decimal text.
Use this when formatting integer values without manual casts.
