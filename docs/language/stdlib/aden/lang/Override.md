# aden.lang.Override

Kind: ``annotation``

Source: ``stdlib/src/aden/lang/Override.aden``

## Summary

Marks a method as intentionally overriding a superclass or interface method.
This annotation is compiler-backed in the current F1 baseline.
The frontend validates that the annotated method really overrides a parent contract.

## Declaration

```aden
public @interface Override
```
