# com.pulse.lang.ConsoleWriter

Kind: ``interface``

Source: ``stdlib/src/com/pulse/lang/ConsoleWriter.pulse``

## Summary

Minimal console output contract used by system stream facades.

## Declaration

```pulse
interface ConsoleWriter
```

## Members

### ``void println(String value);``

Writes a string followed by a newline to the console.
Use this for line-oriented string output.

### ``void println(int value);``

Writes an integer followed by a newline to the console.
Use this for line-oriented numeric output.

### ``void println(long value);``

Writes a long followed by a newline to the console.
Use this for line-oriented 64-bit numeric output.

### ``void println(boolean value);``

Writes a boolean followed by a newline to the console.
Use this for line-oriented boolean output.

### ``void print(String value);``

Writes a string without appending a newline.
Use this for incremental console output.

### ``void print(int value);``

Writes an integer without appending a newline.
Use this for incremental numeric console output.

### ``void print(long value);``

Writes a long without appending a newline.
Use this for incremental 64-bit numeric output.

### ``void print(boolean value);``

Writes a boolean without appending a newline.
Use this for incremental boolean console output.
