# aden.lang.StringBuilder

Kind: ``class``

Source: ``stdlib/src/aden/lang/StringBuilder.aden``

## Summary

Mutable helper for incremental string construction.

## Declaration

```aden
public class StringBuilder implements Appendable, CharSequence
```

## Members

### ``public StringBuilder()``

Creates an empty builder.
Use this when constructing text from multiple later append calls.

### ``public StringBuilder(String initial)``

Creates a builder seeded with the supplied initial text.
Use this when construction should begin from an existing string value.

### ``public StringBuilder append(String text)``

Appends a string value and returns this builder.
Use this for chained text-building calls.

### ``public StringBuilder append(CharSequence text)``

Appends a character sequence after converting it to text.
Use this when builder flows are typed against `CharSequence` rather than concrete strings.

### ``public StringBuilder append(char[] text)``

Appends a character array after converting it to text.
Use this for Java-like builder flows that consume raw char buffers.

### ``public StringBuilder append(char[] text, int offset, int length)``

Appends a bounded character-array range after converting it to text.
Use this for Java-like builder flows that consume a slice of a raw char buffer.

### ``public StringBuilder append(CharSequence text, int beginIndex, int endIndex)``

Appends a slice of a character sequence after converting it to text.
Use this for Java-like builder flows that append a bounded `CharSequence` range.

### ``public StringBuilder append(int number)``

Appends an integer value after converting it to text.
Use this when mixing numeric output into a builder chain.

### ``public StringBuilder append(byte value)``

Appends a byte value after converting it to text.
Use this when mixing narrow signed integral output into a builder chain.

### ``public StringBuilder append(short value)``

Appends a short value after converting it to text.
Use this when mixing narrow signed integral output into a builder chain.

### ``public StringBuilder append(boolean flag)``

Appends a boolean value after converting it to text.
Use this when mixing flag output into a builder chain.

### ``public StringBuilder append(char value)``

Appends a character value after converting it to text.
Use this when mixing individual characters into a builder chain.

### ``public StringBuilder append(float value)``

Appends a float value after converting it to text.
Use this when mixing single-precision output into a builder chain.

### ``public StringBuilder append(double value)``

Appends a double value after converting it to text.
Use this when mixing double-precision output into a builder chain.

### ``public StringBuilder append(long value)``

Appends a long value after converting it to text.
Use this when mixing wide integer output into a builder chain.

### ``public StringBuilder append(ubyte value)``

Appends an unsigned byte value after converting it to text.
Use this when mixing retained Aden unsigned-byte output into a builder chain.

### ``public StringBuilder append(ushort value)``

Appends an unsigned short value after converting it to text.
Use this when mixing retained Aden unsigned-short output into a builder chain.

### ``public StringBuilder append(uint value)``

Appends an unsigned int value after converting it to text.
Use this when mixing retained Aden unsigned-int output into a builder chain.

### ``public StringBuilder append(ulong value)``

Appends an unsigned long value after converting it to text.
Use this when mixing retained Aden unsigned-long output into a builder chain.

### ``public StringBuilder appendLine(String text)``

Appends a string value followed by a newline and returns this builder.
Use this for practical line-oriented text construction.

### ``public StringBuilder appendLine(CharSequence text)``

Appends a character-sequence value followed by a newline and returns this builder.
Use this for practical line-oriented builder flows typed against `CharSequence`.

### ``public StringBuilder appendLine(char[] value)``

Appends a character-array value followed by a newline and returns this builder.
Use this for practical line-oriented builder flows that consume raw char buffers.

### ``public StringBuilder appendLine(int value)``

Appends an integer value followed by a newline and returns this builder.
Use this for practical line-oriented numeric output without a separate append/newline pair.

### ``public StringBuilder appendLine(byte value)``

Appends a byte value followed by a newline and returns this builder.
Use this for practical line-oriented narrow signed integral output.

### ``public StringBuilder appendLine(short value)``

Appends a short value followed by a newline and returns this builder.
Use this for practical line-oriented narrow signed integral output.

### ``public StringBuilder appendLine(boolean value)``

Appends a boolean value followed by a newline and returns this builder.
Use this for practical line-oriented flag output without a separate append/newline pair.

### ``public StringBuilder appendLine(char value)``

Appends a character value followed by a newline and returns this builder.
Use this for practical line-oriented character output without a separate append/newline pair.

### ``public StringBuilder appendLine(float value)``

Appends a float value followed by a newline and returns this builder.
Use this for practical line-oriented single-precision output without a separate append/newline pair.

### ``public StringBuilder appendLine(double value)``

Appends a double value followed by a newline and returns this builder.
Use this for practical line-oriented double-precision output without a separate append/newline pair.

### ``public StringBuilder appendLine(long value)``

Appends a long value followed by a newline and returns this builder.
Use this for practical line-oriented wide integer output without a separate append/newline pair.

### ``public StringBuilder appendLine(ubyte value)``

Appends an unsigned byte value followed by a newline and returns this builder.
Use this for practical line-oriented retained Aden unsigned-byte output.

### ``public StringBuilder appendLine(ushort value)``

Appends an unsigned short value followed by a newline and returns this builder.
Use this for practical line-oriented retained Aden unsigned-short output.

### ``public StringBuilder appendLine(uint value)``

Appends an unsigned int value followed by a newline and returns this builder.
Use this for practical line-oriented retained Aden unsigned-int output.

### ``public StringBuilder appendLine(ulong value)``

Appends an unsigned long value followed by a newline and returns this builder.
Use this for practical line-oriented retained Aden unsigned-long output.

### ``public StringBuilder appendLine(Object value)``

Appends an object value followed by a newline and returns this builder.
Use this for practical line-oriented Java-like object formatting without a separate append/newline pair.

### ``public StringBuilder append(Object value)``

Appends an object value after converting it to text.
Use this when Java-like builder flows need object formatting or `null` rendering.

### ``public int length()``

Returns the current builder length.
Use this to inspect how much text has been accumulated so far.

### ``public boolean isEmpty()``

Reports whether the builder currently contains no text.
Use this for common empty-builder checks without comparing lengths manually.

### ``public char charAt(int index)``

Returns the character at the supplied index in the current builder contents.
Use this when code is typed as `CharSequence` over a builder.

### ``public String subSequence(int beginIndex, int endIndex)``

Returns a string subsequence over the current builder contents.
Use this when code is typed as `CharSequence` and needs a Java-like slice.

### ``public boolean contentEquals(CharSequence text)``

Reports whether the current builder contents match the supplied character sequence.
Use this when builder flows stay typed as mutable text but need sequence equality checks.

### ``public int compareTo(StringBuilder other)``

Orders this builder against another builder using lexicographic string comparison.
Use this when mutable text needs deterministic ordering without forcing manual `toString()` calls.

### ``public void clear()``

Removes all accumulated text from the builder.
Use this to reuse a builder for a fresh output sequence.

### ``public StringBuilder insert(int index, String text)``

Inserts text at the supplied index.
Use this for practical mid-builder edits without manual substring composition.

### ``public StringBuilder insert(int index, CharSequence text)``

Inserts a character sequence after converting it to text.
Use this when builder edits are typed against `CharSequence` rather than concrete strings.

### ``public StringBuilder insert(int index, CharSequence text, int beginIndex, int endIndex)``

Inserts a bounded character-sequence range.
Use this for Java-like builder edits when the source is typed against `CharSequence`.

### ``public StringBuilder insert(int index, char[] text)``

Inserts a character array after converting it to text.
Use this for Java-like builder edits that consume raw char buffers.

### ``public StringBuilder insert(int index, char[] text, int offset, int length)``

Inserts a bounded character-array range after converting it to text.
Use this for Java-like builder edits that consume a slice of a raw char buffer.

### ``public StringBuilder insert(int index, Object value)``

Inserts an object after converting it to text.
Use this when builder edits need Java-like object formatting at a specific offset.

### ``public StringBuilder insert(int index, boolean value)``

Inserts a boolean after converting it to text.
Use this when builder edits need flag text at a specific offset.

### ``public StringBuilder insert(int index, char value)``

Inserts a character after converting it to text.
Use this when builder edits need a single character inserted at a specific offset.

### ``public StringBuilder insert(int index, int value)``

Inserts an integer after converting it to text.
Use this when builder edits need signed integer text at a specific offset.

### ``public StringBuilder insert(int index, byte value)``

Inserts a byte after converting it to text.
Use this when builder edits need narrow signed integer text at a specific offset.

### ``public StringBuilder insert(int index, short value)``

Inserts a short after converting it to text.
Use this when builder edits need narrow signed integer text at a specific offset.

### ``public StringBuilder insert(int index, long value)``

Inserts a long after converting it to text.
Use this when builder edits need wide signed integer text at a specific offset.

### ``public StringBuilder insert(int index, ubyte value)``

Inserts an unsigned byte after converting it to text.
Use this when builder edits need retained Aden unsigned-byte text at a specific offset.

### ``public StringBuilder insert(int index, ushort value)``

Inserts an unsigned short after converting it to text.
Use this when builder edits need retained Aden unsigned-short text at a specific offset.

### ``public StringBuilder insert(int index, uint value)``

Inserts an unsigned int after converting it to text.
Use this when builder edits need retained Aden unsigned-int text at a specific offset.

### ``public StringBuilder insert(int index, ulong value)``

Inserts an unsigned long after converting it to text.
Use this when builder edits need retained Aden unsigned-long text at a specific offset.

### ``public StringBuilder insert(int index, float value)``

Inserts a float after converting it to text.
Use this when builder edits need single-precision text at a specific offset.

### ``public StringBuilder insert(int index, double value)``

Inserts a double after converting it to text.
Use this when builder edits need double-precision text at a specific offset.

### ``public StringBuilder delete(int beginIndex, int endIndex)``

Deletes text over the supplied half-open range.
Use this for practical builder edits that remove a contiguous region.

### ``public StringBuilder deleteCharAt(int index)``

Deletes the single character at the supplied index.
Use this for practical one-character removals without a manual range delete call.

### ``public StringBuilder replace(int beginIndex, int endIndex, String text)``

Replaces the supplied half-open range with the provided text.
Use this for practical in-place builder edits without manual delete/insert chaining.

### ``public void setCharAt(int index, char value)``

Replaces the single character at the supplied index.
Use this for practical point edits without building a manual replacement range.

### ``public void setLength(int newLength)``

Resizes the builder to the supplied length.
Use this to truncate or pad with `\0` characters in the current Java-close baseline.

### ``public String substring(int beginIndex)``

Returns a substring over the current builder contents from the supplied begin index to the end.
Use this when code wants a string slice without first materializing the full `toString()` result.

### ``public String substring(int beginIndex, int endIndex)``

Returns a substring over the current builder contents across the supplied half-open range.
Use this for Java-like immutable slices of the current builder state.

### ``public int indexOf(String text)``

Returns the first index of the supplied text in the current builder contents, or `-1` when absent.
Use this when mutable text construction still needs Java-like search helpers.

### ``public int indexOf(String text, int fromIndex)``

Returns the first index of the supplied text at or after the supplied start index, or `-1` when absent.
Use this when mutable text construction still needs position-aware forward search helpers.

### ``public int lastIndexOf(String text)``

Returns the last index of the supplied text in the current builder contents, or `-1` when absent.
Use this when mutable text construction still needs reverse search helpers.

### ``public int lastIndexOf(String text, int fromIndex)``

Returns the last index of the supplied text at or before the supplied start index, or `-1` when absent.
Use this when mutable text construction still needs position-aware reverse search helpers.

### ``public StringBuilder reverse()``

Reverses the current builder contents in place.
Use this for practical post-processing of constructed text without manual temporary builders.

### ``public String toString()``

Returns the built string value.
Use this when the accumulated text is ready to be consumed.
