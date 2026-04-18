# aden.io.OutputStream

Kind: ``class``

Source: ``stdlib/src/aden/io/OutputStream.aden``

## Summary

Sequential text output facade backed by the current file helpers.

## Declaration

```aden
public class OutputStream implements AutoCloseable, Closeable, Flushable
```

## Members

### ``public OutputStream(String path)``

Creates an output stream bound to the supplied path.
Use this when file writes should be expressed as a stream object.

### ``public OutputStream(String path, boolean appendMode)``

Creates an output stream bound to the supplied path with an explicit append-mode policy.
Use this when repeated `write(...)` calls should either overwrite or append deterministically.

### ``private void writeAtCursor(String text)``

Writes text at the current cursor position and advances past the written text.
Use this to keep the current text-backed stream facade sequential instead of whole-file replacing on each call.

### ``private void ensureOpen()``

Panics when the stream has already been closed.
Use this to keep the current stream facade behavior explicit.

### ``public void write(String text)``

Replaces the full text payload for the bound path.
Use this for simple stream-style overwrite writes.

### ``public void append(String text)``

Appends text to the payload for the bound path.
Use this for simple stream-style append writes.

### ``public void writeLine(String text)``

Appends the supplied text followed by a newline to the payload for the bound path.
Use this for line-oriented text output in the current stream baseline.

### ``public void writeLines(List<String> lines)``

Replaces the payload for the bound path with the supplied lines.
Use this for line-oriented overwrite flows in the current stream baseline.

### ``public void appendLines(List<String> lines)``

Appends the supplied lines to the payload for the bound path.
Use this for line-oriented append flows in the current stream baseline.

### ``public void clear()``

Clears the payload for the bound path.
Use this for explicit truncate/reset flows in the current stream baseline.

### ``public int length()``

Returns the current text length for the bound path.
Use this for explicit output-size checks in the current text-backed stream baseline.

### ``public int rewind(int count)``

Moves the output cursor backward by up to the supplied count and returns how many characters were rewound.
Use this for text-generation flows that need limited in-place cursor rollback.

### ``public void seek(int position)``

Moves the output cursor to the supplied position.
Use this for text-generation flows that need explicit overwrite positioning.

### ``public void reset()``

Resets the output cursor back to the start of the current payload.
Use this when one output stream should rewrite from the beginning without clearing first.

### ``public void truncate()``

Truncates the current payload to the current cursor position.
Use this for simple patch-up flows that need to drop trailing text after rewrites.

### ``public void flush()``

Flushes the stream facade.
Use this for API compatibility; the current file-backed baseline writes eagerly.

### ``public boolean isAppendMode()``

Reports whether this stream currently writes in append mode.
Use this for explicit stream-mode checks in the current baseline.

### ``public int position()``

Returns the current sequential output cursor position.
Use this for explicit stream-state checks in the current text-backed baseline.

### ``public boolean isClosed()``

Reports whether this stream facade has been closed.
Use this for explicit stream-state checks in the current baseline.

### ``public boolean isOpen()``

Reports whether this stream facade is currently open.
Use this for explicit lifecycle checks without negating `isClosed()` at each call site.

### ``public void close()``

Closes the stream facade.
Use this for API compatibility; the current file-backed baseline does not hold a persistent native handle.
Closing is idempotent, flushes the current facade first, and only releases this facade's lifecycle state.

### ``private static String joinLines(List<String> lines)``

Joins one list of lines into the current newline-delimited text form.
Use this to keep line-oriented writes consistent across overwrite and append paths.
