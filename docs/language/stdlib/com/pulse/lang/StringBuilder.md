# com.pulse.lang.StringBuilder

Kind: ``class``

Source: ``stdlib/src/com/pulse/lang/StringBuilder.pulse``

## Summary

Mutable helper for incremental string construction.

## Declaration

```pulse
public class StringBuilder
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

### ``public StringBuilder append(int number)``

Appends an integer value after converting it to text.
Use this when mixing numeric output into a builder chain.

### ``public StringBuilder append(boolean flag)``

Appends a boolean value after converting it to text.
Use this when mixing flag output into a builder chain.

### ``public StringBuilder append(char value)``

Appends a character value after converting it to text.
Use this when mixing individual characters into a builder chain.

### ``public StringBuilder append(Object value)``

Appends an object value after converting it to text.
Use this when Java-like builder flows need object formatting or `null` rendering.

### ``public int length()``

Returns the current builder length.
Use this to inspect how much text has been accumulated so far.

### ``public void clear()``

Removes all accumulated text from the builder.
Use this to reuse a builder for a fresh output sequence.

### ``public StringBuilder insert(int index, String text)``

Inserts text at the supplied index.
Use this for practical mid-builder edits without manual substring composition.

### ``public StringBuilder delete(int beginIndex, int endIndex)``

Deletes text over the supplied half-open range.
Use this for practical builder edits that remove a contiguous region.

### ``public void setLength(int newLength)``

Resizes the builder to the supplied length.
Use this to truncate or pad with `\0` characters in the current Java-close baseline.

### ``public String toString()``

Returns the built string value.
Use this when the accumulated text is ready to be consumed.
