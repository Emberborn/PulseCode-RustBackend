# com.pulse.lang.String

Kind: ``class``

Source: ``stdlib/src/com/pulse/lang/String.pulse``

## Summary

Runtime-backed immutable string value.

## Declaration

```pulse
public final class String implements CharSequence, Comparable
```

## Members

### ``public int length()``

Returns the number of characters in this string.
Use this before indexing or for empty-string checks.

### ``public boolean isEmpty()``

Reports whether this string has zero length.
Use this for the common empty-string fast path.

### ``public String concat(String other)``

Returns a new string containing this value followed by the other value.
Use this to build combined text when a mutable builder is not needed.

### ``public char charAt(int index)``

Returns the character at the supplied index.
Use this when implementing indexing, search, or substring logic over immutable text.

### ``public String substring(int beginIndex)``

Returns a substring from the supplied begin index to the end of the string.
Use this when slicing trailing text from an immutable string value.

### ``public String substring(int beginIndex, int endIndex)``

Returns a substring over the supplied half-open range.
Use this when slicing immutable text with Java-like begin/end bounds.

### ``public String subSequence(int beginIndex, int endIndex)``

Returns a subsequence over the supplied half-open range.
Use this when code is typed as `CharSequence` but still needs string slicing.

### ``public boolean equals(Object other)``

Reports whether this string has the same content as the supplied object.
Use this for Java-like string content equality instead of reference equality.

### ``public int compareTo(Object other)``

Orders this string against another string using lexicographic character comparison.
Use this when code is typed against `Comparable` or needs deterministic text ordering.

### ``public boolean startsWith(String prefix)``

Reports whether this string begins with the supplied prefix.
Use this for Java-like prefix checks in parsing and path/text handling.

### ``public boolean endsWith(String suffix)``

Reports whether this string ends with the supplied suffix.
Use this for Java-like suffix checks in parsing and path/text handling.

### ``public boolean contains(String text)``

Reports whether this string contains the supplied substring.
Use this for Java-like containment checks in parsing and diagnostics.

### ``public int indexOf(String text)``

Returns the first index of the supplied substring, or `-1` when it is absent.
Use this for Java-like forward search over immutable text.

### ``public int lastIndexOf(String text)``

Returns the last index of the supplied substring, or `-1` when it is absent.
Use this for Java-like reverse search over immutable text.

### ``public String trim()``

Returns a copy of this string with leading and trailing ASCII whitespace removed.
Use this for the current Java-close trim baseline in text-processing flows.

### ``public static String valueOf(int value)``

Converts an integer value into its string representation.
Use this when formatting numeric output.

### ``public static String valueOf(boolean value)``

Converts a boolean value into its string representation.
Use this when formatting boolean output.

### ``public static String valueOf(char value)``

Converts a character value into its string representation.
Use this when formatting character data into string-based APIs.

### ``public static String valueOf(float value)``

Converts a float value into its string representation.
Use this when formatting single-precision values through Java-like APIs.

### ``public static String valueOf(double value)``

Converts a double value into its string representation.
Use this when formatting double-precision values through Java-like APIs.

### ``public static String valueOf(Object value)``

Converts an object reference into its string representation.
Use this for Java-like formatting where `null` should become `"null"`.

### ``private static char runtimeCharAt(String value, int index)``

Runtime-backed helper for indexed character access.
Use this only inside the stdlib `String` implementation.

### ``private static String runtimeSubstring(String value, int beginIndex, int endIndex)``

Runtime-backed helper for substring slicing.
Use this only inside the stdlib `String` implementation.

### ``private static String runtimeFromChar(char value)``

Runtime-backed helper that converts a single character into a string.
Use this only inside the stdlib `String` implementation.
