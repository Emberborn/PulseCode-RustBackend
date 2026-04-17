# pulse.lang.Integer

Kind: ``class``

Source: ``stdlib/src/pulse/lang/Integer.pulse``

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

### ``public static Integer boxObject(int value)``

Boxes a primitive int into a real reference-shaped Integer object.
Use this when raw Object storage or return paths require wrapper identity.

### ``public static int unboxBoxed(Integer value)``

Unboxes a real reference-shaped Integer object into a primitive int.
Use this only on raw-object/reference paths that are known to carry boxed Integer instances.

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

### ``public static String toHexString(int value)``

Converts a primitive int into lowercase hexadecimal text.
Use this for Java-like identity/debug formatting and explicit hex output.

### ``public int hashCode()``

Returns the boxed integer hash code.
Use this when a real boxed Integer participates in object-style hashing.

### ``public boolean equals(Object other)``

Compares this boxed Integer with another object.
Use this when boxed integer identity must follow value equality.

### ``public String toString()``

Returns the decimal text for this boxed Integer.
Use this when boxed integers flow through object-style formatting.
