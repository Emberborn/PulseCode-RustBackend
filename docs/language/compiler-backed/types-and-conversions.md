# Types And Conversions

This page documents the compiler-backed type system surface that is not owned by one stdlib class file.

## Primitive Types

Current primitive baseline:

- `byte`
- `short`
- `int`
- `long`
- `float`
- `double`
- `char`
- `boolean`
- `void`

Pulse extension unsigned primitives:

- `ubyte`
- `ushort`
- `uint`
- `ulong`

## Reference Types

Current reference baseline:

- user-defined classes
- interfaces
- enums
- generic type-use syntax such as `Box<String>`
- arrays
- `String`

## Null

- `null` is valid for reference types
- `null` is not valid for primitive types

## Nullability And Definite Flow

Current compiler-backed nullability/flow rules:

- obvious null misuse is rejected for local assignments, returns, calls, and dereference sites
- `if` conditions such as `value != null` and `value == null` narrow the variable in the corresponding branch
- `while` / `for` / `do-while` conditions now narrow the loop body on the taken condition path
- `foreach` loop variables introduce a scoped loop-local nullability state instead of leaking body-local assumptions outward
- `switch` statement branch-local nullability state is merged conservatively after the switch instead of leaking the last visited case state
- `try` / `catch` / `finally` now merge post-state conservatively, and assignments in `finally` are visible after the statement because `finally` always executes

Current limits:

- flow narrowing is still centered on direct local-variable `== null` / `!= null` checks
- deeper symbolic flow reasoning across arbitrary boolean compositions remains later work

## Conversions

Current supported categories include:

- boxing and unboxing between primitives and wrapper-style stdlib classes
- implicit widening across the current signed primitive chain (`byte` / `short` / `char` -> `int` -> `long` -> `float` -> `double`)
- implicit widening inside the current Pulse unsigned chain (`ubyte` / `ushort` -> `uint` -> `ulong`)
- explicit primitive numeric casts across the current primitive numeric baseline
- checked reference casts between compatible class/interface reference types
- runtime-backed `instanceof` checks for class and interface targets
- char literal declarations and char-parameter call sites in the selected F1 baseline
- reference compatibility checks where implemented

Current cast baseline:

- implicit signed primitive widening now works for assignments, returns, parameter passing, ternary branch compatibility, and overload applicability
- integral arithmetic now follows the first Java-like promotion slice: smaller signed integral types promote to `int`, and mixed `int` / `long` expressions widen to `long`
- floating arithmetic and comparison are now executable across the current signed primitive chain, including mixed integral/`float`/`double` expressions
- unary `-` now preserves the operand numeric type instead of collapsing to `int`
- Pulse unsigned arithmetic now follows the current extension-specific promotion slice: `ubyte` / `ushort` promote to `uint`, and mixed `uint` / `ulong` expressions widen to `ulong`
- mixed signed/unsigned widening now follows the current executable Pulse slice:
  - `ubyte` widens into signed targets starting at `short`
  - `ushort` widens into signed targets starting at `int`
  - `uint` widens into signed targets starting at `long`
  - `char` widens into unsigned targets starting at `ushort`
  - mixed signed/unsigned integer expressions resolve through `int` / `long` where the current runtime can carry them honestly
  - mixed signed with `ulong` still requires an explicit cast
- numeric casts such as `(long) value`, `(int) decimal`, and truncating casts from `float` / `double` are supported
- lowering now materializes known-destination numeric widening for local initializers, assignment targets, return values, native-array stores, ternary branch convergence, and promoted binary operands instead of relying on raw register-width reuse
- call-site and constructor-side implicit numeric widening now execute through the same runtime-backed coercion path instead of depending on raw register reuse
- erased generic applicability now follows the current F1 model for raw/instantiated assignment and overload compatibility
- casts from integral primitives to `float` / `double` now materialize real floating values instead of reusing raw integer bits
- explicit `double` -> `float` casts now round to the nearest representable `float` value before widening back into the runtime scalar lane
- `float` / `double` to integral casts truncate toward zero, `NaN` narrows to `0`, and overflow saturates to the target integral min/max boundary
- bitwise and shift operators are now executable across the current integral surface:
  - integral bitwise `&`, `|`, `^`
  - unary bitwise `~`
  - shift operators `<<`, `>>`, `>>>`
  - compound assignment forms `&=`, `|=`, `^=`, `<<=`, `>>=`, `>>>=`
- boolean `&`, `|`, and `^` now use real non-short-circuit Java-like boolean semantics
- `&&` and `||` now lower through lazy conditional execution instead of eager boolean combination, so the logical and bitwise families are no longer conflated
- shift result typing now follows the current Java-close/Pulse integral promotion slice:
  - `byte` / `short` / `char` shift to `int`
  - `ubyte` / `ushort` shift to `uint`
  - `int` / `uint` remain 32-bit
  - `long` / `ulong` remain 64-bit
- boolean-to-numeric and numeric-to-boolean casts are rejected
- reference casts that need runtime type identity lower to checked native runtime paths
- invalid checked reference casts fail fast at runtime with a deterministic `Invalid cast` diagnostic
- `instanceof` requires a reference-typed left operand and a reference-type target
- deeper generic inference/bounds/wildcard work, `is` / `as` style work, and any broader conversion/promotion policies beyond the current shipped numeric/operator slice remain later work

## Arrays And Varargs

Current declaration baseline:

- array type names such as `String[]`
- varargs parameter declarations such as `String... args`

Current F1 varargs policy:

- varargs are accepted in declarations
- they are compiled as array-typed parameters
- a varargs parameter must be last
- entrypoint `main(String... args)` is accepted through the same array-backed baseline
- varargs applicability is now real for the current baseline:
  - zero trailing arguments are accepted
  - trailing arguments are packaged into the array-backed varargs parameter at call sites
  - passing an existing array directly to the varargs parameter is accepted
  - fixed-arity overloads still win over varargs overloads when both are applicable

## Native Array Creation

Current executable native-array creation surface:

- `new byte[n]`
- `new short[n]`
- `new int[n]`
- `new char[n]`
- `new boolean[n]`
- `new float[n]`
- `new double[n]`
- `new String[n]`
- `new Box[n]` for user-defined reference types
- one-dimensional initializer expressions such as `new int[] { 1, 2 }`
- one-dimensional floating-point initializers such as `new float[] { 1.25f, -2.5f }`
- one-dimensional reference initializers such as `new Box[] { new Box(), null }`
- multidimensional creation such as `new int[2][3]` and `new String[2][2]`
- multidimensional floating-point creation such as `new double[2][2]`
- nested multidimensional initializer expressions such as `new int[][] { {1, 2}, {3, 4} }`
- array `length` field access such as `values.length`
- native subscript reads such as `values[1]`
- native subscript writes such as `values[0] = 7`
- native compound updates on supported int-like lanes such as `values[2] += 1`

Current limits:

- the length expression must typecheck as `int`
- native arrays currently support the full current primitive element surface (`byte`, `short`, `int`, `long`, `float`, `double`, `char`, `boolean`, `ubyte`, `ushort`, `uint`, `ulong`) plus reference lanes (`String`, user-defined classes/interfaces, `Object`, and array references)
- native subscript read/write syntax is real for the current primitive and reference lanes, including chained multidimensional access such as `grid[1][2]`
- native-array foreach is real for the current primitive and reference lanes

## Local `var`

Current pre-self-host local `var` baseline:

- local variable declarations such as `var count = 3;`
- `for` initializer locals such as `for (var i = 0; ... )`
- `foreach` loop variables over native arrays such as `for (var value : values)`
- `foreach` loop variables over the current `com.pulse.lang.Iterable` baseline, which infer `Object`

Current rules:

- `var` is local-only; it is not a field, parameter, or return-type feature
- `var` requires an initializer in ordinary local declarations
- `var` cannot infer from `null`
- `var` cannot infer from a `void` expression
- the inferred runtime type is the initializer expression type after the current F1 erasure/runtime mapping rules
- `foreach (var item : source)` is currently supported for native arrays and the current `com.pulse.lang.Iterable` object-stream baseline
- `foreach (var item : arrayLike)` is not yet supported for the current non-generic `com.pulse.collections.Array` surface, because that runtime contract does not yet expose enough element-type information to infer the loop variable honestly

## Type Checking

- assignment type mismatches fail semantic checking
- method overloads resolve against argument types
- static and instance member access are checked against the expression shape
- enum constants are typechecked as the declared enum type and lowered to ordinal-backed executable values in the current baseline
- generic instantiations are validated at the syntax/arity layer, member typing is instantiated at compile time, and runtime lowering still erases to raw runtime types in the current F1 baseline

## Ternary

- `condition ? thenExpr : elseExpr` is part of the current F1 baseline
- the condition must typecheck as `boolean`
- the branch expressions must have compatible types
- numeric branch pairs follow the current numeric result-type baseline
- `null` is accepted when the opposite branch is a nullable reference type
- native output preserves lazy branch execution; only the selected branch is evaluated

## Lambda Expressions

- lexer support for `->` exists, but lambda expressions are not part of the current F1 baseline
- the parser now rejects lambda forms with an explicit staged diagnostic instead of a vague token error
- closure objects, capture semantics, functional-interface targeting, and runtime/backend execution are deferred to `F2`

## Method References

- lexer support for `::` exists, but method references are not part of the current F1 baseline
- the parser now rejects method-reference forms with an explicit staged diagnostic
- method references remain deferred until after the lambda/runtime model exists in `F2`

## Related

- [Declarations And Modifiers](./declarations-and-modifiers.md)
- [Enums](./enums.md)
- [Generics](./generics.md)
- [Runtime Type And Null Behavior](../runtime-backed/runtime-type-and-null-behavior.md)
