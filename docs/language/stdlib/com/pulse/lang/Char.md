# com.pulse.lang.Char

Kind: ``class``

Source: ``stdlib/src/com/pulse/lang/Char.pulse``

## Summary

Wrapper facade for character values.

## Declaration

```pulse
public final class Char
```

## Members

### ``public static final char MIN_VALUE = '\0';``

Smallest representable char value.

### ``public static final char MAX_VALUE = '\uFFFF';``

Largest representable char value.

### ``public static Char valueOf(char value)``

Boxes a primitive char into the wrapper form.
Use this when a character must flow through reference-typed APIs.

### ``public static Char parse(String text)``

Parses text into a char wrapper.
Use this when taking character data from a string input surface.

### ``public static char charValue(Char value)``

Unboxes a wrapper value into a primitive char.
Use this when primitive character operations are required.

### ``public static boolean equals(char left, char right)``

Compares two primitive chars for equality.
Use this for helper-style primitive equality checks.

### ``public static int compare(char left, char right)``

Orders two primitive chars.
Use this when char values need deterministic comparison results.

### ``public static String toString(char value)``

Converts a primitive char into a single-character string.
Use this when formatting character data explicitly through the wrapper API.

### ``private static char runtimeCharAt(String value, int index)``

Runtime-backed helper for indexed character access.
Use this only inside the stdlib `Char` implementation.
