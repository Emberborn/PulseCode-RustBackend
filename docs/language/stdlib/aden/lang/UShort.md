# aden.lang.UShort

Kind: ``class``

Source: ``stdlib/src/aden/lang/UShort.aden``

## Summary

Wrapper facade for unsigned 16-bit Aden extension values.

## Declaration

```aden
public final class UShort
```

## Members

### ``public static final ushort MIN_VALUE = (ushort) 0;``

Smallest representable unsigned short value.

### ``public static final ushort MAX_VALUE = (ushort) 65535;``

Largest representable unsigned short value.

### ``public static UShort valueOf(ushort value)``

Boxes a primitive unsigned short into the wrapper form.
Use this when a reference-shaped ushort value is required.

### ``public static UShort parse(String text)``

Parses text into an unsigned short wrapper.
Use this for textual unsigned conversion at API boundaries.

### ``public static ushort ushortValue(UShort value)``

Unboxes a wrapper value into a primitive unsigned short.
Use this when primitive APIs require a ushort.

### ``public static boolean equals(ushort left, ushort right)``

Compares two primitive unsigned shorts for equality.
Use this for helper-style primitive equality checks.

### ``public static int compare(ushort left, ushort right)``

Orders two primitive unsigned shorts.
Use this when unsigned short values need deterministic comparison results.

### ``public static String toString(ushort value)``

Converts a primitive unsigned short into decimal text.
Use this when formatting Aden extension `ushort` values.
