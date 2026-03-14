# com.pulse.lang.PrintStream

Kind: ``class``

Source: ``stdlib/src/com/pulse/lang/PrintStream.pulse``

## Summary

Console-backed print stream used by system output surfaces.

## Declaration

```pulse
class PrintStream implements ConsoleWriter
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

### ``public void println(int value)``

Writes an integer and terminates the line.
Use this through System.out for line-based numeric output.

### ``public void println(long value)``

Writes a long and terminates the line.
Use this through System streams for 64-bit numeric output.

### ``public void println(boolean value)``

Writes a boolean and terminates the line.
Use this through System.out for line-based boolean output.

### ``public void print(String value)``

Writes a string without appending a newline.
Use this for incremental text output.

### ``public void print(int value)``

Writes an integer without appending a newline.
Use this for incremental numeric output.

### ``public void print(long value)``

Writes a long without appending a newline.
Use this for incremental 64-bit numeric output.

### ``public void print(boolean value)``

Writes a boolean without appending a newline.
Use this for incremental boolean output.
