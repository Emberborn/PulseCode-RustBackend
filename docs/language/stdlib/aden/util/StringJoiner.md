# aden.util.StringJoiner

Kind: ``class``

Source: ``stdlib/src/aden/util/StringJoiner.aden``

## Summary

Mutable delimiter-aware text joiner for Java-like incremental string assembly.

## Declaration

```aden
public final class StringJoiner
```

## Members

### ``public StringJoiner(String delimiter)``

Creates a joiner that uses the supplied delimiter with no prefix or suffix.
Use this for practical delimited text assembly without manual separator tracking.

### ``public StringJoiner(String delimiter, String prefix, String suffix)``

Creates a joiner that uses the supplied delimiter, prefix, and suffix.
Use this for Java-like joined text that must render inside a surrounding wrapper.

### ``public StringJoiner setEmptyValue(String emptyValue)``

Replaces the text returned when this joiner has no elements.
Use this when empty output should map to a caller-defined fallback instead of prefix-plus-suffix.

### ``public StringJoiner add(String newElement)``

Appends a new element after applying Java-like null-to-`null` conversion.
Use this for incremental joined text assembly without manual separator bookkeeping.

### ``public StringJoiner merge(StringJoiner other)``

Merges the contents of another joiner into this joiner without copying its prefix or suffix.
Use this for Java-like joiner composition across nested text-building flows.

### ``public int length()``

Returns the current joined text length.
Use this when callers need the eventual rendered size without forcing separate string math.

### ``public String toString()``

Returns the current joined text using the configured prefix, suffix, and empty-value policy.
Use this when finalizing a joined text sequence into an immutable string.
