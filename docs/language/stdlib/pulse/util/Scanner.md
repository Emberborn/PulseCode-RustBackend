# pulse.util.Scanner

Kind: ``class``

Source: ``stdlib/src/pulse/util/Scanner.pulse``

## Summary

Practical token-and-line scanner over the current text-first string/input baseline.

## Declaration

```pulse
public final class Scanner implements AutoCloseable
```

## Members

### ``public Scanner(String source)``

Creates a scanner over the supplied text using the default ASCII-whitespace delimiter policy.
Use this for practical token scanning over already-available text.

### ``public Scanner(InputStream input)``

Creates a scanner over the supplied input stream by reading its current full text payload.
Use this for practical file-backed token scanning on the current text-first IO baseline.

### ``public Scanner useDelimiter(String delimiter)``

Switches this scanner to use the supplied non-empty delimiter text for token scanning.
Use this when tokens should be split by a literal separator instead of ASCII whitespace.

### ``public Scanner useWhitespaceDelimiter()``

Restores the default ASCII-whitespace delimiter policy.
Use this when code wants to return from literal-delimiter scanning to ordinary token scanning.

### ``public boolean hasNext()``

Reports whether another token is available under the current delimiter policy.
Use this before `next()` when code wants explicit token-availability checks.

### ``public String next()``

Returns the next token under the current delimiter policy.
Use this for practical left-to-right token scanning.

### ``public boolean hasNextLine()``

Reports whether another line is available from the current cursor position.
Use this before `nextLine()` when line-availability checks are preferable to exceptions.

### ``public String nextLine()``

Returns the next line from the current cursor position.
Use this for line-oriented scanning independent of the current token delimiter policy.

### ``public int nextInt()``

Parses and returns the next token as an int.
Use this for practical numeric token scanning without manual wrapper calls.

### ``public boolean nextBoolean()``

Parses and returns the next token as a boolean.
Use this for practical boolean token scanning without manual wrapper calls.

### ``public float nextFloat()``

Parses and returns the next token as a float.
Use this for practical single-precision numeric token scanning.

### ``public double nextDouble()``

Parses and returns the next token as a double.
Use this for practical double-precision numeric token scanning.

### ``public long nextLong()``

Parses and returns the next token as a long.
Use this for practical wide-integer token scanning without manual wrapper calls.

### ``public String nextOrDefault(String fallback)``

Returns the next token when present, otherwise the supplied fallback.
Use this when token reads should be deterministic instead of throwing at end-of-input.

### ``public String nextLineOrDefault(String fallback)``

Returns the next line when present, otherwise the supplied fallback.
Use this when line reads should be deterministic instead of throwing at end-of-input.

### ``public String remainingText()``

Returns the remaining unconsumed text from the current cursor position.
Use this when higher-level parsing wants the unread tail without more token stepping.

### ``public void reset()``

Resets the scanner cursor to the start of the current source text.
Use this when one scanner instance should be reused for another pass.

### ``public boolean isClosed()``

Reports whether this scanner facade has been closed.
Use this for explicit lifecycle checks.

### ``public boolean isOpen()``

Reports whether this scanner facade is currently open.
Use this for explicit lifecycle checks without negating `isClosed()`.

### ``public void close()``

Closes this scanner facade.
Closing is idempotent and only affects this stdlib wrapper state.
