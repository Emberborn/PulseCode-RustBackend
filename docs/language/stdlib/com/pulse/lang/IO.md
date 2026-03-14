# com.pulse.lang.IO

Kind: ``class``

Source: ``stdlib/src/com/pulse/lang/IO.pulse``

## Summary

Convenience console output facade for direct printing.

## Declaration

```pulse
class IO
```

## Members

### ``public static void println(String value)``

Writes a string and terminates the line.
Use this for straightforward string console output.

### ``public static void println(int value)``

Writes an integer and terminates the line.
Use this for straightforward numeric console output.

### ``public static void println(boolean value)``

Writes a boolean and terminates the line.
Use this for straightforward boolean console output.

### ``public static void print(String value)``

Writes a string without a trailing newline.
Use this for incremental console output.

### ``public static void print(int value)``

Writes an integer without a trailing newline.
Use this for incremental numeric console output.

### ``public static void print(boolean value)``

Writes a boolean without a trailing newline.
Use this for incremental boolean console output.
