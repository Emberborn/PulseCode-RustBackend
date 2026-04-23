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
- `for (var item : iterableExpr) { ... }` works on that same object-stream `Iterable` baseline
- `for (int value : arrayExpr) { ... }` works for the current stdlib `com.pulse.collections.Array` int lane
- `for (String value : arrayExpr) { ... }` works for the current stdlib `com.pulse.collections.Array` string lane
- `for (Object value : arrayExpr) { ... }` works for `com.pulse.collections.Array` once writes have established its int or string lane
- `for (var value : arrayExpr) { ... }` works for `com.pulse.collections.Array` through that same object-stream baseline once the lane is established
- `for (T value : nativeArrayExpr) { ... }` works for native array types when the loop variable type is compatible with the array element type

Current intentional fences:

- non-generic `Iterable` iteration is currently an object-stream baseline because `Iterator.next()` returns `Object`
- `com.pulse.collections.Array` object-stream iteration is also an object-stream baseline and boxes int-lane reads to `Integer`
- `Map` is intentionally not `Iterable` in the current F1 slice; map traversal currently uses manual `keyIterator()` instead of implying Java-like view families
- current map helper views are regular stdlib surfaces, not a special foreach/lowering exception: `keySet()` / `values()` are live non-fail-fast views, while `entrySet()` remains copy-style
- foreach does not imply the full later iteration contract for collections beyond the current `Iterable` / `Iterator` baseline

Current execution model:

- iterable foreach lowers by calling `iterator()`, then repeatedly checking `hasNext()` and reading `next()`
- `continue` jumps to the next iteration check
- `break` exits the foreach loop
- stdlib `Array` foreach lowers through `length()` plus the lane-specific `getInt()` / `getString()` calls for explicit `int` / `String` loops, and through `iterator()` for the current `Object` / `var` object-stream baseline
- native-array foreach lowers through array `length` plus native array subscript reads

Return points:

- the current selected F1 foreach/iteration baseline is now locked; later work returns only if the project chooses broader typed/generic iterator fidelity beyond the shipped object-stream contract

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

- `synchronized (...) { ... }` statements are real in the current F1 baseline
- method-level `synchronized` on concrete class methods is also real in the current F1 baseline
- the compiler evaluates the monitor expression once, enters it before the body, and exits it in a `finally` path
- the current shipped lowering targets the real `pulse.concurrent.Monitor` floor rather than pretending generic object-monitor semantics already exist

Current boundaries:

- mutual exclusion and reentrancy are real through `Monitor.enter()` / `Monitor.exit()`
- the first wait/notify coordination slice is also real through `Monitor.wait()`, `Monitor.wait(long)`, `Monitor.notify()`, and `Monitor.notifyAll()`
- timeout waits release the current monitor ownership, block on the queued waiter event, and reacquire the monitor before returning
- synchronized method lowering uses hidden class/instance monitor storage instead of pretending Java object-header monitors already exist
- `return` through the lowering path is real and does not require manual user-code workarounds
- Java-close visibility/publication guarantees are still later concurrency and memory-model work
- real `Thread` lifecycle (`start`, `join`, cooperative interruption) now exists through `pulse.lang.Thread`
- Java-close visibility/publication guarantees still belong with `F1-86`, `F1-89`, and `F1-93`, while the first truthful executor/future baseline now exists separately under `F1-103`

## Related

- [Concurrency And Memory Model](./concurrency-and-memory-model.md)
- [Types And Conversions](./types-and-conversions.md)
- [F1 task board](../../F1_TASK_BOARD.md)
