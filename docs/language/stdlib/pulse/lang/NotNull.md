# pulse.lang.NotNull

Kind: ``annotation``

Source: ``stdlib/src/pulse/lang/NotNull.pulse``

## Summary

Marks a field or method return as non-null in the current frontend baseline.
This annotation is compiler-backed in the current F1 baseline.
The frontend rejects null initializers, null returns, and null assignment into annotated fields.

## Declaration

```pulse
public @interface NotNull
```
