# aden.lang.String

Kind: ``class``

Source: ``stdlib/src/aden/lang/String.aden``

## Summary

Runtime-backed immutable string value.

## Declaration

```aden
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

### ``public boolean contentEquals(CharSequence other)``

Reports whether this string has the same content as the supplied character sequence.
Use this for Java-like text equality when callers are typed against `CharSequence`.

### ``public int hashCode()``

Returns a content-based hash code for this string.
Use this when string values participate in Java-like hashed containers or equality contracts.

### ``public int compareTo(Object other)``

Orders this string against another string using lexicographic character comparison.
Use this when code is typed against `Comparable` or needs deterministic text ordering.

### ``public boolean startsWith(String prefix)``

Reports whether this string begins with the supplied prefix.
Use this for Java-like prefix checks in parsing and path/text handling.

### ``public boolean startsWith(String prefix, int offset)``

Reports whether this string begins with the supplied prefix at the supplied offset.
Use this for Java-like prefix checks when scanning from a known position.

### ``public boolean regionMatches(int toffset, String other, int ooffset, int len)``

Reports whether the supplied bounded region of this string matches the supplied bounded region of the other string.
Use this for Java-like region comparison without allocating temporary substring copies.

### ``public boolean regionMatches(boolean ignoreCase, int toffset, String other, int ooffset, int len)``

Reports whether the supplied bounded region of this string matches the supplied bounded region of the other string,
optionally using ASCII case-insensitive comparison.
Use this for Java-like region comparison without allocating temporary substring copies.

### ``public boolean endsWith(String suffix)``

Reports whether this string ends with the supplied suffix.
Use this for Java-like suffix checks in parsing and path/text handling.

### ``public boolean contains(String text)``

Reports whether this string contains the supplied substring.
Use this for Java-like containment checks in parsing and diagnostics.

### ``public boolean contains(CharSequence text)``

Reports whether this string contains the supplied character sequence.
Use this for Java-like containment checks when code is typed against `CharSequence`.

### ``public boolean contains(char value)``

Reports whether this string contains the supplied character.
Use this for Java-like single-character containment checks without wrapping into a string.

### ``public int indexOf(char value)``

Returns the first index of the supplied character, or `-1` when it is absent.
Use this for Java-like single-character forward search.

### ``public int indexOf(char value, int fromIndex)``

Returns the first index of the supplied character at or after the supplied start index, or `-1` when absent.
Use this for Java-like single-character forward search from a known position.

### ``public int indexOf(String text)``

Returns the first index of the supplied substring, or `-1` when it is absent.
Use this for Java-like forward search over immutable text.

### ``public int indexOf(String text, int fromIndex)``

Returns the first index of the supplied substring at or after the supplied start index, or `-1` when absent.
Use this for Java-like forward search when scanning should begin from a known position.

### ``public int lastIndexOf(String text)``

Returns the last index of the supplied substring, or `-1` when it is absent.
Use this for Java-like reverse search over immutable text.

### ``public int lastIndexOf(char value)``

Returns the last index of the supplied character, or `-1` when it is absent.
Use this for Java-like single-character reverse search.

### ``public int lastIndexOf(char value, int fromIndex)``

Returns the last index of the supplied character at or before the supplied start index, or `-1` when absent.
Use this for Java-like single-character reverse search from a known boundary.

### ``public int lastIndexOf(String text, int fromIndex)``

Returns the last index of the supplied substring at or before the supplied start index, or `-1` when absent.
Use this for Java-like reverse search when scanning should stop at a known boundary.

### ``public String trim()``

Returns a copy of this string with leading and trailing ASCII whitespace removed.
Use this for the current Java-close trim baseline in text-processing flows.

### ``public boolean isBlank()``

Reports whether this string is empty or contains only ASCII whitespace.
Use this for Java-like blank checks without allocating a trimmed copy.

### ``public String strip()``

Returns a copy of this string with leading and trailing ASCII whitespace removed.
Use this as the current Aden-owned strip baseline without introducing Unicode whitespace policy yet.

### ``public String stripLeading()``

Returns a copy of this string with leading ASCII whitespace removed.
Use this for Java-like leading-strip flows without manual index arithmetic.

### ``public String stripTrailing()``

Returns a copy of this string with trailing ASCII whitespace removed.
Use this for Java-like trailing-strip flows without manual index arithmetic.

### ``public String toLowerCase()``

Returns a copy of this string with ASCII letters converted to lower case.
Use this for the current Java-close case-normalization baseline without pushing locale policy yet.

### ``public String toUpperCase()``

Returns a copy of this string with ASCII letters converted to upper case.
Use this for the current Java-close case-normalization baseline without pushing locale policy yet.

### ``public boolean equalsIgnoreCase(String other)``

Reports whether this string equals the supplied string after ASCII case normalization.
Use this for the current Java-close case-insensitive comparison baseline without locale-sensitive rules.

### ``public String replace(String target, String replacement)``

Returns a copy of this string with every occurrence of the target text replaced by the replacement text.
Use this for practical immutable text rewriting without manual search/concatenation loops.

### ``public String replace(char target, char replacement)``

Returns a copy of this string with every occurrence of the target character replaced by the replacement character.
Use this for practical immutable character rewriting without wrapping values into one-character strings.

### ``public String repeat(int count)``

Returns a copy of this string repeated the supplied number of times.
Use this for practical padding and generated-text flows without manual concatenation loops.

### ``public String removePrefix(String prefix)``

Returns a copy of this string with the supplied prefix removed when present.
Use this for practical text normalization without manual prefix checks and substring arithmetic.

### ``public String removeSuffix(String suffix)``

Returns a copy of this string with the supplied suffix removed when present.
Use this for practical text normalization without manual suffix checks and substring arithmetic.

### ``public String padLeft(int width, char padding)``

Returns a left-padded copy of this string up to the supplied width.
Use this for practical fixed-width formatting while keeping the behavior Aden-owned.

### ``public String padRight(int width, char padding)``

Returns a right-padded copy of this string up to the supplied width.
Use this for practical fixed-width formatting while keeping the behavior Aden-owned.

### ``public String[] split(char delimiter)``

Splits this string on a literal character delimiter while preserving empty segments.
Use this for practical non-regex text splitting without pulling collection types into `aden.lang`.

### ``public String[] split(String delimiter)``

Splits this string on a literal string delimiter while preserving empty segments.
Use this for practical non-regex text splitting when a multi-character separator is required.

### ``public static String join(String delimiter, String[] parts)``

Joins string parts with a delimiter while rendering null elements as `"null"`.
Use this for practical array-based text assembly without requiring collection helpers.

### ``public char[] toCharArray()``

Returns the characters of this string as a new array.
Use this for Java-like text processing without exposing the runtime string storage directly.

### ``public void getChars(int srcBegin, int srcEnd, char[] dst, int dstBegin)``

Copies a bounded range of this string into the supplied destination array.
Use this for Java-like direct char-buffer population without exposing runtime string storage.

### ``public static String valueOf(int value)``

Converts an integer value into its string representation.
Use this when formatting numeric output.

### ``public static String valueOf(byte value)``

Converts a byte value into its string representation.
Use this when formatting narrow signed integral values through Java-like APIs.

### ``public static String valueOf(short value)``

Converts a short value into its string representation.
Use this when formatting narrow signed integral values through Java-like APIs.

### ``public static String valueOf(long value)``

Converts a long value into its string representation.
Use this when formatting wide integer output through Java-like APIs.

### ``public static String valueOf(ubyte value)``

Converts an unsigned byte value into its string representation.
Use this when formatting retained Aden unsigned-byte values through the standard string surface.

### ``public static String valueOf(ushort value)``

Converts an unsigned short value into its string representation.
Use this when formatting retained Aden unsigned-short values through the standard string surface.

### ``public static String valueOf(uint value)``

Converts an unsigned int value into its string representation.
Use this when formatting retained Aden unsigned-int values through the standard string surface.

### ``public static String valueOf(ulong value)``

Converts an unsigned long value into its string representation.
Use this when formatting retained Aden unsigned-long values through the standard string surface.

### ``public static String valueOf(boolean value)``

Converts a boolean value into its string representation.
Use this when formatting boolean output.

### ``public static String valueOf(char value)``

Converts a character value into its string representation.
Use this when formatting character data into string-based APIs.

### ``public static String valueOf(char[] value)``

Converts a character array into a string.
Use this for Java-like char-buffer formatting without routing through collection types.

### ``public static String valueOf(char[] value, int offset, int count)``

Converts a bounded character-array range into a string.
Use this for Java-like char-buffer slicing and text assembly.

### ``public static String valueOf(float value)``

Converts a float value into its string representation.
Use this when formatting single-precision values through Java-like APIs.

### ``public static String valueOf(double value)``

Converts a double value into its string representation.
Use this when formatting double-precision values through Java-like APIs.

### ``public static String valueOf(Object value)``

Converts an object reference into its string representation.
Use this for Java-like formatting where `null` should become `"null"`.

### ``public static String copyValueOf(char[] value)``

Copies a character array into a new string.
Use this for Java-like char-buffer ownership where the source array should not be exposed.

### ``public static String copyValueOf(char[] value, int offset, int count)``

Copies a bounded character-array range into a new string.
Use this for Java-like char-buffer slicing with explicit offset and count.

### ``private static char runtimeCharAt(String value, int index)``

Runtime-backed helper for indexed character access.
Use this only inside the stdlib `String` implementation.

### ``private static int runtimeLength(String value)``

Runtime-backed helper for string length.
Use this only inside the stdlib `String` implementation.

### ``private static String runtimeConcat(String left, String right)``

Runtime-backed helper for string concatenation.
Use this only inside the stdlib `String` implementation.

### ``private static String runtimeFromChar(char value)``

Runtime-backed helper that converts a single character into a string.
Use this only inside the stdlib `String` implementation.

### ``private static String digitText(int digit)``

Returns the one-character decimal text for the supplied digit.
Use this internally for stdlib-owned integer formatting.
