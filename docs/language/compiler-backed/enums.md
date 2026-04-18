# Enums

This page documents the current compiler-backed enum baseline.

## Current F1 Baseline

Aden now supports Java-like enum declarations:

```aden
package app.types;

public enum Mode {
    OFF,
    ON
}
```

Current shipped behavior:

- enum declarations parse and typecheck
- enum constants are unique within the enum
- enum constants can be used in assignments and equality comparisons
- enum constants are immutable
- enum values are lowered to an ordinal-backed executable form for the current native pipeline

## Current Deliberate Limits

The current baseline is intentionally narrower than Java's full enum object model.

Not part of the shipped enum baseline yet:

- enum fields and methods
- enum constructors
- enum-specific interfaces or inheritance behavior
- `values()` / `valueOf()` helper generation
- switch-specific enum lowering guarantees
- full `com.aden.lang.Enum` object-model integration

Current foundational stdlib state:

- `com.aden.lang.Enum` now exists as the declared enum base type in stdlib
- it is still a bootstrap base contract, not the full later Java-style enum helper/object surface

## Runtime Shape

The current backend/runtime strategy is:

- semantic type identity remains the declared enum type
- executable lowering uses ordinal-backed values
- this keeps enum declarations buildable now without claiming the full later Java enum object model

## Related

- [Declarations And Modifiers](./declarations-and-modifiers.md)
- [Types And Conversions](./types-and-conversions.md)
