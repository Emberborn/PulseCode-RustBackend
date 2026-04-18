# aden.lang.Comparable

Kind: ``interface``

Source: ``stdlib/src/aden/lang/Comparable.aden``

## Summary

Ordering contract for values that can compare themselves.

## Declaration

```aden
public interface Comparable
```

## Members

### ``public int compareTo(Object other);``

Compares this value to another object of the same logical type.
Use this when exposing deterministic ordering semantics.
