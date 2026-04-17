# pulse.util.Arrays

Kind: ``class``

Source: ``stdlib/src/pulse/util/Arrays.pulse``

## Summary

Array-oriented utility helpers for the current fixed-lane and collection bridge baseline.

## Declaration

```pulse
public final class Arrays
```

## Members

### ``public static List asList(Array values)``

Returns a list copy of the supplied runtime-backed array.
Use this when array-shaped storage must participate in the current collection baseline.

### ``public static int indexOf(Array values, int target)``

Returns the first index containing the supplied integer helper value.
Use this when current fixed-lane arrays need Java-like utility lookup support.

### ``public static int indexOf(Array values, String target)``

Returns the first index containing the supplied string value.
Use this when current fixed-lane arrays need Java-like utility lookup support.

### ``public static boolean contains(Array values, int target)``

Reports whether the supplied integer helper value is present.
Use this as the current integer containment helper for runtime-backed arrays.

### ``public static boolean contains(Array values, String target)``

Reports whether the supplied string value is present.
Use this as the current string containment helper for runtime-backed arrays.
