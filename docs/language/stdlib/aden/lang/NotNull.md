# aden.lang.NotNull

Kind: ``annotation``

Source: ``stdlib/src/aden/lang/NotNull.aden``

## Summary

Marks a field or method return as non-null in the current frontend baseline.
This annotation is compiler-backed in the current F1 baseline.
The frontend rejects null initializers, null returns, and null assignment into annotated fields.

## Declaration

```aden
public @interface NotNull
```
