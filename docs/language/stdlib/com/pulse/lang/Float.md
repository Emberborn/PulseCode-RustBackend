# com.pulse.lang.Float

Kind: ``class``

Source: ``stdlib/src/com/pulse/lang/Float.pulse``

## Summary

Wrapper facade for single-precision floating-point values.

## Declaration

```pulse
public final class Float
```

## Members

### ``public static final float MIN_VALUE = Float.buildMinValue();``

Smallest positive non-zero float value in the current baseline.

### ``public static final float MAX_VALUE = Float.buildMaxValue();``

Largest finite float value in the current baseline.

### ``public static Float valueOf(float value)``

Boxes a primitive float into the wrapper form.
Use this when a reference-shaped float value is required.

### ``public static Float parse(String text)``

Parses text into a float wrapper.
Use this for textual float conversion at API boundaries.

### ``public static float floatValue(Float value)``

Unboxes a wrapper value into a primitive float.
Use this when numeric operations require a float.

### ``public static boolean equals(float left, float right)``

Compares two primitive floats for equality.
Use this for helper-style primitive equality checks.

### ``public static int compare(float left, float right)``

Orders two primitive floats.
Use this when float values need deterministic comparison results.

### ``public static String toString(float value)``

Converts a primitive float into Java-close text.
Use this for wrapper-owned decimal formatting with float-appropriate precision.
