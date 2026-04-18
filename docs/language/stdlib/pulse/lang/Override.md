# pulse.lang.Override

Kind: ``annotation``

Source: ``stdlib/src/pulse/lang/Override.pulse``

## Summary

Marks a method as intentionally overriding a superclass or interface method.
This annotation is compiler-backed in the current F1 baseline.
The frontend validates that the annotated method really overrides a parent contract.

## Declaration

```pulse
public @interface Override
```
