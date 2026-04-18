# pulse.lang.ConsoleReader

Kind: ``class``

Source: ``stdlib/src/pulse/lang/ConsoleReader.pulse``

## Summary

Console-backed line reader used by `System.in`.

## Declaration

```pulse
public final class ConsoleReader implements AutoCloseable
```

## Members

### ``public ConsoleReader()``

Creates an open console reader facade.
Use this for the process-wide `System.in` baseline.

### ``private void ensureOpen()``

Panics when the reader has already been closed.
Use this to keep the current console-reader lifecycle behavior explicit.

### ``public String readLine(String prompt)``

Writes a prompt and then reads the next console line.
Use this for minimal interactive command flows without introducing a richer scanner/parser layer.

### ``public String readLine()``

Reads the next console line.
Returns `null` when no more input is available.

### ``public String readLineOrDefault(String fallback)``

Reads the next console line or returns the supplied fallback on end-of-input.
Use this when interactive flows want a deterministic default without null handling.

### ``public boolean isClosed()``

Reports whether this console reader facade has been closed.
Use this for explicit lifecycle checks on `System.in`.

### ``public boolean isOpen()``

Reports whether this console reader facade is currently open.
Use this for explicit lifecycle checks without negating `isClosed()`.

### ``public void close()``

Closes this console reader facade.
Closing is idempotent and only affects this stdlib lifecycle wrapper.
