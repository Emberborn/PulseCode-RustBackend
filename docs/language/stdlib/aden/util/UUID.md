# aden.util.UUID

Kind: ``class``

Source: ``stdlib/src/aden/util/UUID.aden``

## Summary

Java-like UUID value type with deterministic non-secure random generation support.

## Declaration

```aden
public final class UUID implements Comparable
```

## Members

### ``public static UUID nilUUID()``

Returns the all-zero nil UUID.
Use this when code needs an explicit empty/default UUID sentinel.

### ``public UUID(long mostSigBits, long leastSigBits)``

Creates a UUID from its raw 128-bit halves.
Use this when a caller already owns the UUID bit layout directly.

### ``public static UUID randomUUID(Random rng)``

Returns a version-4 UUID using the supplied deterministic non-secure random source.
Use this when callers want repeatable UUID generation under explicit seed control.

### ``public static UUID randomUUID()``

Returns a version-4 UUID from the shared deterministic non-secure default generator.
Use this for ordinary identifier generation when callers want the built-in repeatable path rather than managing a `Random` explicitly.
This convenience overload is deterministic and not cryptographically secure.

### ``public static UUID fromString(String text)``

Parses canonical UUID text of the form `8-4-4-4-12`.
Use this when UUID values cross textual API boundaries.

### ``public long getMostSignificantBits()``

Returns the upper 64 bits of this UUID.

### ``public long getLeastSignificantBits()``

Returns the lower 64 bits of this UUID.

### ``public int version()``

Returns the UUID version nibble.

### ``public int variant()``

Returns the UUID variant value using Java-like Leach-Salz numbering.

### ``public boolean isNil()``

Reports whether this UUID is the all-zero nil value.

### ``public String toString()``

Returns the canonical lowercase UUID string form.

### ``public boolean equals(Object other)``

Compares this UUID with another object by 128-bit value.

### ``public int compareTo(Object other)``

Orders UUID values lexicographically by their 128-bit value.

### ``public int hashCode()``

Returns a value-based hash code for this UUID.

### ``private static long parseHexRange(String text, int begin, int end)``

Parses a hexadecimal range from canonical UUID text.

### ``private static int parseHexDigit(char value)``

Parses one hexadecimal digit.

### ``private static void appendHex(StringBuilder builder, ulong value, int digits)``

Appends a fixed-width lowercase hexadecimal segment.
