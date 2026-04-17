# pulse.lang.IO

Kind: ``class``

Source: ``stdlib/src/pulse/lang/IO.pulse``

## Summary

Convenience console output facade for direct printing.

## Declaration

```pulse
public final class IO
```

## Members

### ``public static void println(String value)``

Writes a string and terminates the line.
Use this for straightforward string console output.

### ``public static void println(Object value)``

Writes an object and terminates the line.
Use this for Java-like object-aware line output where `null` becomes `"null"`.

### ``public static void println(char[] value)``

Writes a character array and terminates the line.
Use this for Java-like text-buffer line output.

### ``public static void println(int value)``

Writes an integer and terminates the line.
Use this for straightforward numeric console output.

### ``public static void println(byte value)``

Writes a byte and terminates the line.
Use this for straightforward narrow signed numeric console output.

### ``public static void println(short value)``

Writes a short and terminates the line.
Use this for straightforward narrow signed numeric console output.

### ``public static void println(long value)``

Writes a long and terminates the line.
Use this for straightforward 64-bit numeric console output.

### ``public static void println(char value)``

Writes a character and terminates the line.
Use this for straightforward single-character console output.

### ``public static void println(float value)``

Writes a float and terminates the line.
Use this for straightforward single-precision numeric console output.

### ``public static void println(double value)``

Writes a double and terminates the line.
Use this for straightforward double-precision numeric console output.

### ``public static void println(ubyte value)``

Writes an unsigned byte and terminates the line.
Use this for straightforward retained Pulse unsigned-byte console output.

### ``public static void println(ushort value)``

Writes an unsigned short and terminates the line.
Use this for straightforward retained Pulse unsigned-short console output.

### ``public static void println(uint value)``

Writes an unsigned int and terminates the line.
Use this for straightforward retained Pulse unsigned-int console output.

### ``public static void println(ulong value)``

Writes an unsigned long and terminates the line.
Use this for straightforward retained Pulse unsigned-long console output.

### ``public static void println(boolean value)``

Writes a boolean and terminates the line.
Use this for straightforward boolean console output.

### ``public static void print(String value)``

Writes a string without a trailing newline.
Use this for incremental console output.

### ``public static void print(Object value)``

Writes an object without a trailing newline.
Use this for Java-like object-aware incremental output where `null` becomes `"null"`.

### ``public static void print(char[] value)``

Writes a character array without a trailing newline.
Use this for Java-like text-buffer incremental output.

### ``public static void print(int value)``

Writes an integer without a trailing newline.
Use this for incremental numeric console output.

### ``public static void print(byte value)``

Writes a byte without a trailing newline.
Use this for incremental narrow signed numeric console output.

### ``public static void print(short value)``

Writes a short without a trailing newline.
Use this for incremental narrow signed numeric console output.

### ``public static void print(long value)``

Writes a long without a trailing newline.
Use this for incremental 64-bit numeric console output.

### ``public static void print(char value)``

Writes a character without a trailing newline.
Use this for incremental single-character console output.

### ``public static void print(float value)``

Writes a float without a trailing newline.
Use this for incremental single-precision numeric console output.

### ``public static void print(double value)``

Writes a double without a trailing newline.
Use this for incremental double-precision numeric console output.

### ``public static void print(ubyte value)``

Writes an unsigned byte without a trailing newline.
Use this for incremental retained Pulse unsigned-byte console output.

### ``public static void print(ushort value)``

Writes an unsigned short without a trailing newline.
Use this for incremental retained Pulse unsigned-short console output.

### ``public static void print(uint value)``

Writes an unsigned int without a trailing newline.
Use this for incremental retained Pulse unsigned-int console output.

### ``public static void print(ulong value)``

Writes an unsigned long without a trailing newline.
Use this for incremental retained Pulse unsigned-long console output.

### ``public static void print(boolean value)``

Writes a boolean without a trailing newline.
Use this for incremental boolean console output.
