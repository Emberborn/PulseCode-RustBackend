# aden.io.InputStream

Kind: ``class``

Source: ``stdlib/src/aden/io/InputStream.aden``

## Summary

Sequential text input facade backed by the current file helpers.

## Declaration

```aden
public class InputStream implements AutoCloseable, Closeable
```

## Members

### ``public InputStream(String path)``

Creates an input stream bound to the supplied path.
Use this when file reads should be expressed as a stream object.

### ``public InputStream(String path, int startPosition)``

Creates an input stream bound to the supplied path and initial cursor position.
Use this when sequential reads should begin from a known offset.

### ``private void ensureOpen()``

Panics when the stream has already been closed.
Use this to keep the current stream facade behavior explicit.

### ``public String readAll()``

Reads the full text payload for the bound path.
Use this for simple stream-style all-at-once reads.

### ``public String readAllOrDefault(String fallback)``

Reads the full text payload for the bound path, or the fallback when absent.
Use this when stream-style reads should tolerate a missing file in the current baseline.

### ``public List<String> readLines()``

Reads the current text payload as newline-delimited lines for the bound path.
Use this when stream-style reads should operate on logical text lines.

### ``public boolean hasRemaining()``

Reports whether unread text remains from the current cursor position.
Use this for sequential stream-style reads over the current text payload.

### ``public int available()``

Returns how many characters remain unread from the current cursor position.
Use this for parser-style sequential reads over the current text payload.

### ``public int position()``

Returns the current sequential cursor position.
Use this for parser-style bookkeeping over the current text payload.

### ``public char peek()``

Returns the next character without advancing, or `\0` when no text remains.
Use this for parser-style lookahead over the current text payload.

### ``public char read()``

Reads one character and advances the cursor, or returns `\0` when no text remains.
Use this for parser-style sequential character reads over the current text payload.

### ``public String readLine()``

Reads the next newline-delimited line from the current cursor position.
Use this for sequential line-oriented stream reads in the current text baseline.

### ``public void reset()``

Resets the sequential cursor back to the start of the current payload.
Use this when one stream facade should re-read the same text payload.

### ``public String readRemaining()``

Reads the remaining text from the current cursor position and advances to the end.
Use this when sequential stream reads need the unread tail as one string.

### ``public int skip(int count)``

Advances the sequential cursor by up to the supplied count and returns how many characters were skipped.
Use this for parser-style fast-forward behavior over the current text payload.

### ``public int rewind(int count)``

Moves the sequential cursor backward by up to the supplied count and returns how many characters were rewound.
Use this for parser-style rollback over the current text payload.

### ``public void seek(int position)``

Moves the sequential cursor to the supplied position.
Use this for parser-style repositioning over the current text payload.

### ``public void mark()``

Records the current cursor position as a later rollback point.
Use this for parser-style speculative reads over the current text payload.

### ``public boolean hasMark()``

Reports whether a mark position is currently stored.
Use this to distinguish marked versus unmarked stream state.

### ``public void clearMark()``

Clears any stored mark position.
Use this when speculative-read state should be discarded explicitly.

### ``public boolean resetToMark()``

Restores the cursor to the last stored mark position when one exists.
Use this for parser-style rollback after speculative reads.

### ``public boolean isClosed()``

Reports whether this stream facade has been closed.
Use this for explicit stream-state checks in the current baseline.

### ``public boolean isOpen()``

Reports whether this stream facade is currently open.
Use this for explicit lifecycle checks without negating `isClosed()` at each call site.

### ``public void close()``

Closes the stream facade.
Use this for API compatibility; the current file-backed baseline does not hold a persistent native handle.
Closing is idempotent and only releases this facade's lifecycle state.
