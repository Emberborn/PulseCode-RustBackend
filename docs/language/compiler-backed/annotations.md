# Annotations

This page documents the current compiler-owned annotation baseline.

That compiler-owned behavior is a bootstrap contract, not the intended long-term ownership model.
If an annotation workflow can eventually live in Aden stdlib plus a real processor/runtime/backend contract,
that Aden-owned design is preferred over permanently growing Rust-only annotation semantics.

## Frontend Annotation Model

Aden Lang currently uses a compiler-backed annotation registry and validator for the shipped annotation set.

That means:

- annotation names are parsed into the AST
- the frontend validates annotation targets and duplicates
- supported annotations have explicit semantic meaning
- unsupported annotations fail deterministically instead of being silently ignored

This is not yet a general external annotation-processor or code-generation system.

## Annotation Declarations

Aden now supports marker-style annotation declarations in source:

```aden
public @interface Marker {
}
```

Current F1 boundary for declared annotations:

- marker-style annotation declarations are supported
- user-declared annotations can be applied to classes, fields, and methods
- annotation members/elements are not supported yet
- declared annotations do not automatically gain compiler semantics

So the language can now declare annotations in Aden, but only the shipped compiler-owned annotations below have active semantic behavior in the current baseline.
That bootstrap ownership is expected to be revisited in Phase F-A once annotation processors become a real runtime/backend feature.

## Shipped Baseline

Current shipped annotations:

- `@Override`
- `@NotNull`
- `@Test`

## `@Override`

Allowed target:

- methods

Current behavior:

- method must actually override a superclass or interface method
- static methods cannot use `@Override`
- constructors cannot use `@Override`

## `@NotNull`

Allowed targets:

- fields
- methods with a non-primitive, non-void return type

Current behavior:

- rejects `null` field initializers on annotated fields
- rejects `null` returns from annotated methods
- rejects assigning `null` into annotated fields
- rejects use on primitive or `void` return types because the annotation would be meaningless there

Current F1 boundary:

- this is a frontend semantic contract, not a full runtime nullability system
- broader flow-sensitive not-null propagation is still later work

## `@Test`

Allowed target:

- methods

Current behavior:

- method must be `public static`
- method must return `void`
- method must take no parameters
- method must declare a body

Current F1 boundary:

- `@Test` is validated by the frontend now
- broader test discovery/execution integration continues through the larger F1 validation/test-system work

## Deferred

Not part of the current baseline:

- external annotation processors
- code-generation annotations such as `@Getter` / `@Setter`
- full runtime reflection-driven annotation access
- annotation members/elements such as `String value()`
- Aden-owned migration of the current built-in annotation semantics

## Migration Direction

Planned direction:

- keep annotation declarations in Aden stdlib
- keep the current built-ins as bootstrap compiler-owned semantics only while F1 is still missing processor/runtime support
- add a real annotation processor runtime/backend model in Phase F-A
- then migrate the current built-ins and future workflows such as Lombok-style annotations toward Aden-owned implementations where practical

## Related

- [Declarations And Modifiers](./declarations-and-modifiers.md)
- [Types And Conversions](./types-and-conversions.md)
