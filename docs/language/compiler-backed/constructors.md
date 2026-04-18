# Constructors

This page documents the compiler-backed constructor model.

## Constructor Shape

Constructors use the type name and do not declare a return type.

```pulse
class Player {
    private String name;

    public Player(String name) {
        this.name = name;
    }
}
```

## Construction Call

Construction uses Java-like `new` syntax:

```pulse
Player p = new Player("Nova");
```

## Rules

- constructor name must match the declaring type
- construction uses `new Type(...)` for object creation
- bare `Type(...)` constructor-call syntax is rejected
- constructors may initialize fields through `this`
- `this` is valid inside constructors
- constructor overloads are resolved by argument types

## Current Boundaries

- constructor syntax and semantic checks are compiler-backed
- object allocation and initialization execution are runtime/backend-backed

## Related

- [Declarations And Modifiers](./declarations-and-modifiers.md)
- [Program Entry And Execution](../runtime-backed/program-entry-and-execution.md)
