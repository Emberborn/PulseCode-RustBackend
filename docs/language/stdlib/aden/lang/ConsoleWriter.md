# aden.lang.ConsoleWriter

Kind: ``interface``

Source: ``stdlib/src/aden/lang/ConsoleWriter.aden``

## Summary

Minimal console output contract used by system stream facades.

## Declaration

```aden
interface ConsoleWriter
```

## Members

### ``void println(String value);``

Writes a string followed by a newline to the console.
Use this for line-oriented string output.

### ``void println(Object value);``

Writes an object value followed by a newline to the console.
Use this for Java-like object-aware line output where `null` should render as `"null"`.

### ``void println(char[] value);``

Writes a character array followed by a newline to the console.
Use this for Java-like text-buffer line output.

### ``void println(int value);``

Writes an integer followed by a newline to the console.
Use this for line-oriented numeric output.

### ``void println(byte value);``

Writes a byte followed by a newline to the console.
Use this for line-oriented narrow signed numeric output.

### ``void println(short value);``

Writes a short followed by a newline to the console.
Use this for line-oriented narrow signed numeric output.

### ``void println(long value);``

Writes a long followed by a newline to the console.
Use this for line-oriented 64-bit numeric output.

### ``void println(char value);``

Writes a character followed by a newline to the console.
Use this for line-oriented character output without widening through numeric lanes.

### ``void println(float value);``

Writes a float followed by a newline to the console.
Use this for line-oriented single-precision numeric output.

### ``void println(double value);``

Writes a double followed by a newline to the console.
Use this for line-oriented double-precision numeric output.

### ``void println(ubyte value);``

Writes an unsigned byte followed by a newline to the console.
Use this for line-oriented retained Aden unsigned-byte output.

### ``void println(ushort value);``

Writes an unsigned short followed by a newline to the console.
Use this for line-oriented retained Aden unsigned-short output.

### ``void println(uint value);``

Writes an unsigned int followed by a newline to the console.
Use this for line-oriented retained Aden unsigned-int output.

### ``void println(ulong value);``

Writes an unsigned long followed by a newline to the console.
Use this for line-oriented retained Aden unsigned-long output.

### ``void println(boolean value);``

Writes a boolean followed by a newline to the console.
Use this for line-oriented boolean output.

### ``void print(String value);``

Writes a string without appending a newline.
Use this for incremental console output.

### ``void print(Object value);``

Writes an object value without appending a newline.
Use this for Java-like object-aware incremental output where `null` should render as `"null"`.

### ``void print(char[] value);``

Writes a character array without appending a newline.
Use this for Java-like text-buffer incremental output.

### ``void print(int value);``

Writes an integer without appending a newline.
Use this for incremental numeric console output.

### ``void print(byte value);``

Writes a byte without appending a newline.
Use this for incremental narrow signed numeric output.

### ``void print(short value);``

Writes a short without appending a newline.
Use this for incremental narrow signed numeric output.

### ``void print(long value);``

Writes a long without appending a newline.
Use this for incremental 64-bit numeric output.

### ``void print(char value);``

Writes a character without appending a newline.
Use this for incremental character output without widening through numeric lanes.

### ``void print(float value);``

Writes a float without appending a newline.
Use this for incremental single-precision numeric output.

### ``void print(double value);``

Writes a double without appending a newline.
Use this for incremental double-precision numeric output.

### ``void print(ubyte value);``

Writes an unsigned byte without appending a newline.
Use this for incremental retained Aden unsigned-byte output.

### ``void print(ushort value);``

Writes an unsigned short without appending a newline.
Use this for incremental retained Aden unsigned-short output.

### ``void print(uint value);``

Writes an unsigned int without appending a newline.
Use this for incremental retained Aden unsigned-int output.

### ``void print(ulong value);``

Writes an unsigned long without appending a newline.
Use this for incremental retained Aden unsigned-long output.

### ``void print(boolean value);``

Writes a boolean without appending a newline.
Use this for incremental boolean console output.
