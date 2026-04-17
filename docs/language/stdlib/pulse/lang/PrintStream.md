# pulse.lang.PrintStream

Kind: ``class``

Source: ``stdlib/src/pulse/lang/PrintStream.pulse``

## Summary

Console-backed print stream used by system output surfaces.

## Declaration

```pulse
public class PrintStream implements ConsoleWriter, AutoCloseable
```

## Members

### ``public PrintStream()``

Creates a standard output-backed print stream.
Use this for `System.out`.

### ``public PrintStream(boolean errorStream)``

Creates a print stream backed by either stdout or stderr.
Use `true` for `System.err` and `false` for `System.out`.

### ``public void println(String value)``

Writes a string and terminates the line.
Use this through System.out for line-based text output.

### ``public void println(Object value)``

Writes an object and terminates the line.
Use this through System streams for Java-like object-aware line output where `null` becomes `"null"`.

### ``public void println(char[] value)``

Writes a character array and terminates the line.
Use this through System streams for Java-like text-buffer line output.

### ``public void println(int value)``

Writes an integer and terminates the line.
Use this through System.out for line-based numeric output.

### ``public void println(byte value)``

Writes a byte and terminates the line.
Use this through System streams for narrow signed numeric output.

### ``public void println(short value)``

Writes a short and terminates the line.
Use this through System streams for narrow signed numeric output.

### ``public void println(long value)``

Writes a long and terminates the line.
Use this through System streams for 64-bit numeric output.

### ``public void println(char value)``

Writes a character and terminates the line.
Use this through System streams for single-character output without numeric widening ambiguity.

### ``public void println(float value)``

Writes a float and terminates the line.
Use this through System streams for single-precision numeric output.

### ``public void println(double value)``

Writes a double and terminates the line.
Use this through System streams for double-precision numeric output.

### ``public void println(ubyte value)``

Writes an unsigned byte and terminates the line.
Use this through System streams for retained Pulse unsigned-byte output.

### ``public void println(ushort value)``

Writes an unsigned short and terminates the line.
Use this through System streams for retained Pulse unsigned-short output.

### ``public void println(uint value)``

Writes an unsigned int and terminates the line.
Use this through System streams for retained Pulse unsigned-int output.

### ``public void println(ulong value)``

Writes an unsigned long and terminates the line.
Use this through System streams for retained Pulse unsigned-long output.

### ``public void println(boolean value)``

Writes a boolean and terminates the line.
Use this through System.out for line-based boolean output.

### ``public void print(String value)``

Writes a string without appending a newline.
Use this for incremental text output.

### ``public void print(Object value)``

Writes an object without appending a newline.
Use this through System streams for Java-like object-aware incremental output where `null` becomes `"null"`.

### ``public void print(char[] value)``

Writes a character array without appending a newline.
Use this through System streams for Java-like text-buffer incremental output.

### ``public void print(int value)``

Writes an integer without appending a newline.
Use this for incremental numeric output.

### ``public void print(byte value)``

Writes a byte without appending a newline.
Use this through System streams for narrow signed numeric output.

### ``public void print(short value)``

Writes a short without appending a newline.
Use this through System streams for narrow signed numeric output.

### ``public void print(long value)``

Writes a long without appending a newline.
Use this for incremental 64-bit numeric output.

### ``public void print(char value)``

Writes a character without appending a newline.
Use this through System streams for single-character output without numeric widening ambiguity.

### ``public void print(float value)``

Writes a float without appending a newline.
Use this through System streams for incremental single-precision numeric output.

### ``public void print(double value)``

Writes a double without appending a newline.
Use this through System streams for incremental double-precision numeric output.

### ``public void print(ubyte value)``

Writes an unsigned byte without appending a newline.
Use this through System streams for retained Pulse unsigned-byte output.

### ``public void print(ushort value)``

Writes an unsigned short without appending a newline.
Use this through System streams for retained Pulse unsigned-short output.

### ``public void print(uint value)``

Writes an unsigned int without appending a newline.
Use this through System streams for retained Pulse unsigned-int output.

### ``public void print(ulong value)``

Writes an unsigned long without appending a newline.
Use this through System streams for retained Pulse unsigned-long output.

### ``public void print(boolean value)``

Writes a boolean without appending a newline.
Use this for incremental boolean output.

### ``public void flush()``

Flushes the print stream facade.
Use this for API compatibility; console output is already eager in the current runtime baseline.

### ``public boolean isOpen()``

Reports whether this print stream facade is currently open.
Process-owned system streams remain open for the lifetime of the current process.

### ``public boolean isClosed()``

Reports whether this print stream facade has been closed.
Process-owned system streams are not closed through the current stdlib facade.

### ``public void close()``

Closes the print stream facade.
This is a no-op for the current process-owned system streams so `System.out` and `System.err` remain usable.
