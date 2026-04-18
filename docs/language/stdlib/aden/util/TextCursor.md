# aden.util.TextCursor

Kind: ``class``

Source: ``stdlib/src/aden/util/TextCursor.aden``

## Summary

Lightweight string-backed parse cursor for structured text readers.

## Declaration

```aden
public final class TextCursor
```

## Members

### ``public TextCursor(String source)``

Creates a cursor over the supplied text.
Use this as the low-level shared cursor for JSON/XML/TOML/YAML-style parsers.

### ``public int position()``

Returns the current cursor position.

### ``public void seek(int position)``

Moves the cursor to the supplied absolute position.

### ``public String locationString()``

Returns the current cursor location as line/column/position text.
Use this for parser diagnostics and human-readable cursor reporting.

### ``public void panicHere(String message)``

Panics with the supplied message plus the current cursor location.
Use this when parser code needs a consistent cursor-aware failure shape.

### ``public void panicExpected(String expected)``

Panics with a standardized "expected ..." message at the current cursor location.
Use this when required syntax is missing at the current cursor position.

### ``public boolean isAtEnd()``

Reports whether no text remains.

### ``public boolean hasRemaining()``

Reports whether unread text remains.

### ``public String remainingText()``

Returns the unread tail from the current cursor position.

### ``public char peek()``

Returns the next character without advancing, or `\0` at end.

### ``public char peek(int offset)``

Returns a lookahead character without advancing, or `\0` when out of range.

### ``public char read()``

Reads one character and advances, or returns `\0` at end.

### ``public boolean startsWith(String text)``

Reports whether the unread tail starts with the supplied text.

### ``public boolean startsWith(char value)``

Reports whether the next character matches the supplied value.

### ``public boolean consumeIf(String text)``

Consumes the supplied text when present and reports whether it matched.

### ``public boolean consumeIf(char value)``

Consumes the supplied character when present and reports whether it matched.

### ``public void consume(String text)``

Consumes the supplied text or panics when it is not present.

### ``public void consume(char value)``

Consumes the supplied character or panics when it is not present.

### ``public void skipWhitespace()``

Skips ASCII whitespace from the current cursor position.

### ``public String readUntil(char delimiter)``

Reads characters until the supplied delimiter or end-of-text, leaving the delimiter unread.

### ``public String readLine()``

Reads the next logical line and advances past its trailing newline when present.

### ``public String readIdentifier()``

Reads characters while they match the current identifier character policy.
This is a practical shared helper, not the canonical identifier grammar for every future format reader.

### ``public String tryReadIdentifier()``

Reads characters while they match the current identifier character policy.
This is a practical shared helper, not the canonical identifier grammar for every future format reader.
Returns `null` when no identifier starts at the current cursor position.

### ``public String readDigits()``

Reads consecutive ASCII digits from the current cursor position.
This is a practical shared helper, not a universal numeric grammar for every future format reader.

### ``public String tryReadDigits()``

Reads consecutive ASCII digits from the current cursor position.
Returns `null` when no digit run starts at the current cursor position.

### ``public String readNumberToken()``

Reads a practical numeric token with optional sign, decimal point, and exponent marker.
This is a practical shared decimal/scientific helper, not the canonical number grammar for every future format reader.
Returns an empty string when the current cursor is not positioned at a numeric token.

### ``public String tryReadNumberToken()``

Reads a practical numeric token with optional sign, decimal point, and exponent marker.
This is a practical shared decimal/scientific helper, not the canonical number grammar for every future format reader.
Returns `null` when the current cursor is not positioned at a numeric token.

### ``public String readQuotedString()``

Reads a quoted string using the quote character at the current cursor position.
Supports the current basic escape subset: `\\`, `\"`, `\'`, `\n`, `\r`, and `\t`.
This is a practical shared helper, not the canonical string grammar for every future format reader.

### ``public String tryReadQuotedString()``

Reads a quoted string when a quote starts at the current cursor position.
This is a practical shared helper, not the canonical string grammar for every future format reader.
Returns `null` when the current cursor is not positioned at either quote delimiter.

### ``public String readQuotedString(char quote)``

Reads a quoted string using the supplied quote delimiter.
Supports the current basic escape subset: `\\`, `\"`, `\'`, `\n`, `\r`, and `\t`.
This is a practical shared helper, not the canonical string grammar for every future format reader.

### ``public String tryReadQuotedString(char quote)``

Reads a quoted string using the supplied quote delimiter when it is present.
Returns `null` when the current cursor is not positioned at that quote delimiter.

### ``public int line()``

Returns the current 1-based line number.
This is intentionally derived by rescanning from the start for correctness across seek/reset operations.

### ``public int column()``

Returns the current 1-based column number.
This is intentionally derived by rescanning from the start for correctness across seek/reset operations.

### ``public void mark()``

Stores the current cursor position as a mark.

### ``public boolean hasMark()``

Reports whether a mark is currently stored.

### ``public void clearMark()``

Clears the current mark.

### ``public void resetToMark()``

Resets the cursor to the stored mark or panics when no mark exists.
