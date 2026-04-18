# aden.lang.UByte

Kind: ``class``

Source: ``stdlib/src/aden/lang/UByte.aden``

## Summary

Wrapper facade for unsigned 8-bit Aden extension values.

## Declaration

```aden
public final class UByte
```

## Members

### ``public static final ubyte MIN_VALUE = (ubyte) 0;``

Smallest representable unsigned byte value.

### ``public static final ubyte MAX_VALUE = (ubyte) 255;``

Largest representable unsigned byte value.

### ``public static UByte valueOf(ubyte value)``

Boxes a primitive unsigned byte into the wrapper form.
Use this when a reference-shaped ubyte value is required.

### ``public static UByte parse(String text)``

Parses text into an unsigned byte wrapper.
Use this for textual unsigned conversion at API boundaries.

### ``public static ubyte ubyteValue(UByte value)``

Unboxes a wrapper value into a primitive unsigned byte.
Use this when primitive APIs require a ubyte.

### ``public static boolean equals(ubyte left, ubyte right)``

Compares two primitive unsigned bytes for equality.
Use this for helper-style primitive equality checks.

### ``public static int compare(ubyte left, ubyte right)``

Orders two primitive unsigned bytes.
Use this when unsigned byte values need deterministic comparison results.

### ``public static String toString(ubyte value)``

Converts a primitive unsigned byte into decimal text.
Use this when formatting Aden extension `ubyte` values.
