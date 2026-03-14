# com.pulse.lang.UInteger

Kind: ``class``

Source: ``stdlib/src/com/pulse/lang/UInteger.pulse``

## Summary

Wrapper facade for unsigned 32-bit Pulse extension values.

## Declaration

```pulse
public final class UInteger
```

## Members

### ``public static final uint MIN_VALUE = (uint) 0;``

Smallest representable unsigned integer value.

### ``public static final uint MAX_VALUE = (uint) 4294967295L;``

Largest representable unsigned integer value.

### ``public static UInteger valueOf(uint value)``

Boxes a primitive unsigned int into the wrapper form.
Use this when a reference-shaped uint value is required.

### ``public static UInteger parse(String text)``

Parses text into an unsigned integer wrapper.
Use this for textual unsigned conversion at API boundaries.

### ``public static uint uintValue(UInteger value)``

Unboxes a wrapper value into a primitive unsigned int.
Use this when primitive APIs require a uint.

### ``public static boolean equals(uint left, uint right)``

Compares two primitive unsigned ints for equality.
Use this for helper-style primitive equality checks.

### ``public static int compare(uint left, uint right)``

Orders two primitive unsigned ints.
Use this when unsigned integer values need deterministic comparison results.

### ``public static String toString(uint value)``

Converts a primitive unsigned int into decimal text.
Use this when formatting Pulse extension `uint` values.

### ``private static uint runtimeParse(String text)``

Runtime-backed helper for unsigned integer parsing.
Use this only inside the stdlib `UInteger` implementation.

### ``private static String runtimeToString(uint value)``

Runtime-backed helper for unsigned integer formatting.
Use this only inside the stdlib `UInteger` implementation.
