# com.pulse.lang.Double

Kind: ``class``

Source: ``stdlib/src/com/pulse/lang/Double.pulse``

## Summary

Wrapper facade for double-precision floating-point values.

## Declaration

```pulse
public final class Double
```

## Members

### ``public static Double valueOf(double value)``

Boxes a primitive double into the wrapper form.
Use this when a reference-shaped double value is required.

### ``public static Double parse(String text)``

Parses text into a double wrapper.
Use this for textual double conversion at API boundaries.

### ``public static double doubleValue(Double value)``

Unboxes a wrapper value into a primitive double.
Use this when numeric operations require a double.

### ``public static boolean equals(double left, double right)``

Compares two primitive doubles for equality.
Use this for helper-style primitive equality checks.

### ``public static int compare(double left, double right)``

Orders two primitive doubles.
Use this when double values need deterministic comparison results.
