# Packages And Imports

This page documents the compiler-backed rules for package declarations and import resolution.

## Package Declaration

- A Aden source file may declare one package with `package <name>;`.
- Package names use dot-separated segments such as `app.core`.
- Under strict package enforcement, the package must match the file's folder suffix.

Examples:

```aden
package app.core;
```

## Import Forms

Supported import forms:

```aden
import aden.lang.IO;
import app.util.MathUtil;
import app.util.*;
import static aden.lang.IO.println;
import static aden.lang.IO.*;
```

Current rules:

- normal imports bind a type name into the current file
- wildcard imports bind visible types from the target package
- static imports bind static members for unqualified use
- there is an implicit default-import / prelude model for selected shipped public classes
- `aden.lang.*` remains the primary Java-style default-import surface
- the shipped implicit prelude currently resolves exactly:
  - `aden.io.*`
  - `aden.math.*`
  - `aden.collections.*`
  - `aden.lang.*`
- that package list is compiler-owned and locked as one shared contract, not maintained separately across semantics, CLI policy, and docs
- `adk.*` is never part of the implicit default-import surface
- nested or static-nested type import flows are deferred until nested-type support exists

## Resolution Notes

- unknown imports fail semantic checking
- static imports only expose static members
- `aden.*` and `adk.*` import validation now resolves against the actual stdlib tree instead of a hand-maintained builtin class/package registry
- package mismatches are warnings in loose check mode and errors in strict/build mode
- the current import surface is stable for top-level type and static-member resolution; nested-type import behavior is intentionally out of scope until nested declarations are supported

## Related

- [Declarations And Modifiers](./declarations-and-modifiers.md)
- [Types And Conversions](./types-and-conversions.md)
