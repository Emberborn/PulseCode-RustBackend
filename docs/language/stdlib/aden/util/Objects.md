# aden.util.Objects

Kind: ``class``

Source: ``stdlib/src/aden/util/Objects.aden``

## Summary

High-value object utility helpers for null checks, equality, hashing, and string conversion.

## Declaration

```aden
public final class Objects
```

## Members

### ``public static boolean isNull(Object value)``

Reports whether the supplied reference is null.
Use this for explicit helper-style null checks.

### ``public static boolean nonNull(Object value)``

Reports whether the supplied reference is non-null.
Use this for explicit helper-style non-null checks.

### ``public static boolean equals(Object left, Object right)``

Compares two references for Java-like null-safe equality.
Use this when code wants helper-style equality without writing explicit null branches.

### ``public static int hashCode(Object value)``

Returns a hash code for the supplied reference, defaulting null to zero.
Use this for helper-style hashing without writing explicit null branches.

### ``public static String toString(Object value)``

Converts the supplied reference to text, defaulting null to the literal `null`.
Use this for helper-style object string conversion without writing explicit null branches.

### ``public static String toString(Object value, String defaultText)``

Converts the supplied reference to text, defaulting null to the provided fallback text.
Use this when null should map to a specific default string instead of the literal `null`.

### ``public static Object requireNonNull(Object value)``

Returns the supplied reference when it is non-null, otherwise panics.
Use this to enforce required non-null inputs with a deterministic runtime failure.

### ``public static Object requireNonNull(Object value, String message)``

Returns the supplied reference when it is non-null, otherwise panics with the supplied message.
Use this to enforce required non-null inputs with a caller-provided failure message.
