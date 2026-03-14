# com.pulse.lang.Byte

Kind: ``class``

Source: ``stdlib/src/com/pulse/lang/Byte.pulse``

## Summary

Wrapper facade for signed 8-bit values.

## Declaration

```pulse
public final class Byte
```

## Members

### ``public static final byte MIN_VALUE = (byte) -128;``

Smallest representable signed byte value.

### ``public static final byte MAX_VALUE = (byte) 127;``

Largest representable signed byte value.

### ``public static Byte valueOf(byte value)``

Boxes a primitive byte into the wrapper form.
Use this when a reference-shaped byte value is required.

### ``public static Byte parse(String text)``

Parses text into a byte wrapper.
Use this for textual byte conversion at API boundaries.

### ``public static byte byteValue(Byte value)``

Unboxes a wrapper value into a primitive byte.
Use this when primitive arithmetic or APIs require a byte.

### ``public static boolean equals(byte left, byte right)``

Compares two primitive bytes for equality.
Use this for helper-style primitive equality checks.

### ``public static int compare(byte left, byte right)``

Orders two primitive bytes.
Use this when byte values need deterministic comparison results.

### ``public static String toString(byte value)``

Converts a primitive byte into Java-like decimal text.
Use this when formatting byte values without manual casts.
