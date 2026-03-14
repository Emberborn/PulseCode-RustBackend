# Declarations And Modifiers

This page documents the compiler-backed declaration forms that do not belong to one stdlib class.

## Supported Declaration Kinds

Current baseline:

- `class`
- `interface`
- `enum`
- erased generic declarations on classes/interfaces/methods

Declarations follow a Java-like shape:

```pulse
public class Player() {
}

public interface Shape() {
}

public enum Mode {
    OFF,
    ON
}

public class Box<T> {
}
```

## Modifiers

Currently recognized modifiers include:

- `public`
- `private`
- `protected`
- `static`
- `final`
- `abstract`
- `synchronized`
- `native`
- `strictfp`
- `transient`
- `volatile`
- `async`

Current support is intentionally Java-like, but legality is declaration-specific. The currently shipped baseline supports:

- class/interface visibility
- `abstract`
- `final`
- `static` on members

The following modifiers are intentionally fenced for later F1/runtime work and fail with deterministic diagnostics when used outside currently supported locations:

- `synchronized`
- `native`
- `strictfp`
- `transient`
- `volatile`
- `async`

Examples:

- classes may use visibility and other class modifiers where supported
- interfaces follow Java-like declaration expectations and do not treat `abstract` as useful

## Fields And Methods

- fields use Java-like typed declarations
- methods use Java-like return type + name + parameter list
- enums currently support constant declarations only
- compile-time instantiated / runtime-erased generic declarations are supported on classes/interfaces/methods in the current F1 baseline
- nested type declarations are not part of the current shipped baseline and fail explicitly
- overloads resolve by name plus full argument type list
- static and instance access are checked separately

## Visibility And Inheritance Notes

Current shipped F1 visibility/inheritance rules:

- `public`, `private`, `protected`, and package-private members are enforced
- `private` remains class-local
- package-private remains package-local
- `protected` is accessible:
  - from the same package
  - from subclasses across package boundaries
- cross-package protected access from subclasses follows the Java-like receiver restriction:
  - allowed on `this` or a receiver typed as the current subclass (or its subclass)
  - rejected through an arbitrary base-class receiver from outside the package

Current nested-type policy:

- nested member types are not part of the shipped pre-self-host surface
- local classes are not part of the shipped pre-self-host surface
- anonymous classes are not part of the shipped pre-self-host surface
- all three are explicitly deferred until after self-host unless a later task changes that policy
- parser/docs/diagnostics must keep failing them explicitly instead of leaving them as accidental parse gaps

## Interface Inheritance And Members

Current pre-self-host interface baseline:

- `interface extends A, B` is real
- interface inheritance is validated as interface-only and cyclic inheritance fails deterministically
- abstract interface instance methods remain the implementation contract for concrete classes
- inherited default methods are callable through both interface-typed and class-typed receivers

Current shipped interface member forms:

- abstract instance methods
- `default` interface methods with bodies
- `static` interface methods with bodies
- `private` interface methods with bodies

Current legality rules:

- interface instance methods with bodies must use `default`
- `default` methods cannot be `private`, `static`, or `abstract`
- `static` interface methods must have bodies
- `private` interface methods must have bodies
- only abstract interface instance methods remain implementation obligations for concrete classes

## External Declaration Direction

The future native-binding direction uses `external` as a declaration modifier, not a class-only feature.
That work is part of later library/binding phases, not the current F1 language baseline.

## Related

- [Constructors](./constructors.md)
- [Enums](./enums.md)
- [Generics](./generics.md)
- [Packages And Imports](./packages-and-imports.md)
- [Types And Conversions](./types-and-conversions.md)
