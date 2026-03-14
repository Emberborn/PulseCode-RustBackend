# com.pulse.lang.Boolean

Kind: ``class``

Source: ``stdlib/src/com/pulse/lang/Boolean.pulse``

## Summary

Wrapper facade for boolean values.

## Declaration

```pulse
public final class Boolean
```

## Members

### ``public static final Boolean TRUE = true;``

Canonical wrapper-like true constant.

### ``public static final Boolean FALSE = false;``

Canonical wrapper-like false constant.

### ``public static Boolean valueOf(boolean value)``

Boxes a primitive boolean into the wrapper form.
Use this when an API requires the wrapper type instead of the primitive.

### ``public static Boolean parse(String text)``

Parses text into a boolean wrapper.
Use this for string-to-boolean conversion at API boundaries.

### ``public static boolean booleanValue(Boolean value)``

Unboxes a wrapper value into the primitive form.
Use this when downstream code expects a primitive boolean.

### ``public static boolean equals(boolean left, boolean right)``

Compares two primitive booleans for equality.
Use this for helper-style equality checks without boxing.

### ``public static int compare(boolean left, boolean right)``

Orders two primitive booleans.
Use this when boolean values need stable comparison semantics.

### ``public static String toString(boolean value)``

Converts a primitive boolean into Java-like text.
Use this when formatting boolean values without manual casts.
