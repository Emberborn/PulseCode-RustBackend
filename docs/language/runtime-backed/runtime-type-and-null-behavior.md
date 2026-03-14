# Runtime Type And Null Behavior

This page documents runtime-backed behavior around null checks, reference typing, and runtime type queries.

## Null Behavior

- `null` is valid for reference-typed values
- dereferencing a null reference is a runtime failure
- null behavior is not purely compiler-backed because execution checks still happen at runtime

## Runtime Type Identity

Pulse currently supports reflection-lite type identity through `Class`.
This is enough for fully qualified runtime class names and the current reflection-lite helper surface:

- `Object.getClass().getName()` returns fully qualified runtime class names such as `app.core.Main`
- `Class.getSimpleName()` returns the short type name such as `Main`
- `Class.getPackageName()` returns the package portion such as `app.core`

Full Java-style reflection is intentionally deferred until after self-hosting.

## Reference Type Checks

Runtime-backed support exists for the implemented reference compatibility checks and casts.
Where the compiler accepts a source form that depends on runtime identity, execution correctness still depends on backend/runtime support.

Current runtime-backed cast baseline:

- checked reference casts execute through runtime class-id checks in native output
- successful checked casts preserve the original object reference
- failed checked casts terminate with a deterministic `Invalid cast` diagnostic
- `instanceof` uses the same runtime identity surface for class/interface checks

Current runtime-backed native array baseline:

- primitive arrays and reference arrays lower through the runtime array allocator
- one-dimensional initializer expressions lower by allocating the array and filling the int lane, qword scalar lane, or reference lane at runtime
- multidimensional native array creation lowers by recursively composing nested runtime arrays through the reference lane
- nested multidimensional initializer expressions lower by recursively constructing nested array values and storing them through the primitive or reference lane as appropriate
- array `length` reads lower through the runtime array length path
- native subscript reads and writes lower through the current int lane, qword scalar lane, or reference lane runtime array paths, including chained multidimensional access
- native-array foreach is real for the current primitive and reference lanes
- `float` and `double` array values currently reuse the qword scalar lane and cast down to integral targets through Java-like truncation-toward-zero runtime helpers

## Related

- [Types And Conversions](../compiler-backed/types-and-conversions.md)
- [Program Entry And Execution](./program-entry-and-execution.md)
