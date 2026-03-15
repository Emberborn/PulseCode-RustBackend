# com.pulse.lang.CharSequence

Kind: ``interface``

Source: ``stdlib/src/com/pulse/lang/CharSequence.pulse``

## Summary

Read-only sequential character contract for text-owning values.

## Declaration

```pulse
public interface CharSequence
```

## Members

### ``public int length();``

Returns the number of characters in the sequence.
Use this for sizing, bounds checks, and empty-sequence tests.

### ``public char charAt(int index);``

Returns the character at the supplied index.
Use this for indexing and text traversal.

### ``public String subSequence(int beginIndex, int endIndex);``

Returns a subsequence over the supplied half-open range.
Use this for Java-like text slicing through the abstract sequence contract.
