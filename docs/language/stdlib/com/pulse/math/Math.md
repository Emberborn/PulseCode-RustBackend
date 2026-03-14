# com.pulse.math.Math

Kind: ``class``

Source: ``stdlib/src/com/pulse/math/Math.pulse``

## Summary

Basic math helper facade for deterministic numeric operations.

## Declaration

```pulse
class Math
```

## Members

### ``public static double PI;``

Circle ratio constant exposed by the math facade.
Use this when code needs a well-known numeric constant.

### ``public static int abs(int value)``

Returns the absolute value of the supplied integer.
Use this when negative values should be normalized to positive magnitude.

### ``public static int max(int a, int b)``

Returns the larger of the two supplied integers.
Use this when choosing an upper bound between two values.

### ``public static int min(int a, int b)``

Returns the smaller of the two supplied integers.
Use this when choosing a lower bound between two values.

### ``public static int clamp(int value, int low, int high)``

Clamps a value into the inclusive low/high range.
Use this when inputs must stay inside a fixed numeric interval.
