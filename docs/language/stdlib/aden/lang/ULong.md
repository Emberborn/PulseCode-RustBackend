# aden.lang.ULong

Kind: ``class``

Source: ``stdlib/src/aden/lang/ULong.aden``

## Summary

Wrapper facade for unsigned 64-bit Aden extension values.

## Declaration

```aden
public final class ULong
```

## Members

### ``public static final ulong MIN_VALUE = (ulong) 0L;``

Smallest representable unsigned long value.

### ``public static final ulong MAX_VALUE = (ulong) -1L;``

Largest representable unsigned long value.

### ``public static ULong valueOf(ulong value)``

Boxes a primitive unsigned long into the wrapper form.
Use this when a reference-shaped ulong value is required.

### ``public static ULong parse(String text)``

Parses text into an unsigned long wrapper.
Use this for textual unsigned conversion at API boundaries.

### ``public static ulong ulongValue(ULong value)``

Unboxes a wrapper value into a primitive unsigned long.
Use this when primitive APIs require a ulong.

### ``public static boolean equals(ulong left, ulong right)``

Compares two primitive unsigned longs for equality.
Use this for helper-style primitive equality checks.

### ``public static int compare(ulong left, ulong right)``

Orders two primitive unsigned longs.
Use this when unsigned long values need deterministic comparison results.

### ``public static String toString(ulong value)``

Converts a primitive unsigned long into decimal text.
Use this when formatting Aden extension `ulong` values.
