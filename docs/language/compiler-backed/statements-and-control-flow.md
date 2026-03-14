# Statements And Control Flow

This page documents compiler-backed statement forms whose behavior is primarily defined by
parser, semantic, and lowering rules rather than one stdlib class alone.

## `for` Baseline

Current shipped loop forms:

- classic `for (init; condition; update) { ... }`
- enhanced `for (Type name : expr) { ... }` to the current staged foreach baseline

## `assert`

Current `F1-19` shipped surface:

- `assert condition;`
- `assert condition : "message";`

Current rules:

- the condition must typecheck as `boolean`
- the optional message must currently typecheck as `String`
- failed assertions lower through the stdlib-owned `com.pulse.lang.AssertionError` bridge

Current execution model:

- successful assertions continue normally
- failed assertions terminate through `AssertionError.fail()` or `AssertionError.fail(String)`
- assertion failure text now comes through the stdlib `AssertionError` hierarchy, so message-bearing assertions format as `AssertionError: <message>`

## `foreach`

Current `F1-18` shipped baseline:

- `for (Object item : iterableExpr) { ... }` works when the source type is `com.pulse.lang.Iterable`
- `for (int value : arrayExpr) { ... }` works for the current stdlib `com.pulse.collections.Array` int lane
- `for (String value : arrayExpr) { ... }` works for the current stdlib `com.pulse.collections.Array` string lane
- `for (T value : nativeArrayExpr) { ... }` works for native array types when the loop variable type is compatible with the array element type

Current intentional fences:

- non-generic `Iterable` iteration is currently an object-stream baseline because `Iterator.next()` returns `Object`
- foreach does not imply the full later iteration contract for collections beyond the current `Iterable` / `Iterator` baseline

Current execution model:

- iterable foreach lowers by calling `iterator()`, then repeatedly checking `hasNext()` and reading `next()`
- `continue` jumps to the next iteration check
- `break` exits the foreach loop
- stdlib `Array` foreach lowers through `length()` plus the lane-specific `getInt()` / `getString()` calls
- native-array foreach lowers through array `length` plus native array subscript reads

Return points:

- `F1-53` for the fuller iteration contract across collections and foreach

## `switch`

Current shipped switch surface:

- classic statement `switch (expr) { case ...: ... }`
- arrow-style switch expressions such as:
  - `int value = switch (code) { case 1 -> 10; default -> 20; };`

Current switch-expression policy:

- switch-expression arms currently use `case literal -> expression;`
- a `default` arm is required in the current pre-self-host slice
- case labels must still be literal expressions and typecheck against the switch operand type
- switch-expression arm values must have compatible result types under the current F1 compatibility rules

Current intentional fences:

- block-form switch-expression arms such as `case 1 -> { ... }` are not part of the current shipped slice
- `yield` is reserved and fenced with an explicit diagnostic for switch-expression block arms

Current execution model:

- switch statements lower through the existing branch-per-case dispatch path
- arrow-style switch expressions lower to a lazy value-producing dispatch path that evaluates the selector once and only executes the selected arm expression

## `synchronized`

Current `F1-20` policy:

- `synchronized (...) { ... }` statements are explicitly fenced in the current F1 baseline
- the parser emits a deterministic diagnostic instead of pretending monitor semantics exist

Reason for the deferral:

- object-monitor mutual exclusion is not part of the current shipped runtime model
- visibility/publication guarantees are later concurrency and memory-model work
- real statement semantics belong with `F1-86`, `F1-89`, and `F1-93`

## Related

- [Types And Conversions](./types-and-conversions.md)
- [F1 task board](../../F1_TASK_BOARD.md)
