# Packages And Imports

This page documents the compiler-backed rules for package declarations and import resolution.

## Package Declaration

- A Pulse source file may declare one package with `package <name>;`.
- Package names use dot-separated segments such as `app.core`.
- Under strict package enforcement, the package must match the file's folder suffix.

Examples:

```pulse
package app.core;
```

## Import Forms

Supported import forms:

```pulse
import com.pulse.lang.IO;
import app.util.MathUtil;
import app.util.*;
import static com.pulse.lang.IO.println;
import static com.pulse.lang.IO.*;
```

Current rules:

- normal imports bind a type name into the current file
- wildcard imports bind visible types from the target package
- static imports bind static members for unqualified use
- `com.pulse.lang.String` is implicitly available without an explicit import
- nested or static-nested type import flows are deferred until nested-type support exists

## Resolution Notes

- unknown imports fail semantic checking
- static imports only expose static members
- package mismatches are warnings in loose check mode and errors in strict/build mode
- the current import surface is stable for top-level type and static-member resolution; nested-type import behavior is intentionally out of scope until nested declarations are supported

## Related

- [Declarations And Modifiers](./declarations-and-modifiers.md)
- [Types And Conversions](./types-and-conversions.md)
