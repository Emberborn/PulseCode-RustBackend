# PulseCode Language Guide (Current Draft)

## 1. Quick Start

### Check a file
```bash
cargo run -p pulsec -- check src/app/core/Main.pulse --strict-package --source-root src
```

### Check with strict package layout
```bash
cargo run -p pulsec -- check path/to/Main.pulse --strict-package
```

### Check with explicit source root
```bash
cargo run -p pulsec -- check src/app/core/Main.pulse --strict-package --source-root src
```

### Run tests
```bash
cargo test
```

## 2. File Skeleton

```pulse
package game.core;

import com.pulse.lang.IO;

class Main {
    public static void main(String[] args) {
        IO.println("PulseCode online");
    }
}
```

## 3. Core Syntax

### Packages and imports
```pulse
package game.core;
import com.pulse.lang.IO;
import game.util.MathUtil;
import game.util.*;
import static game.util.MathUtil.PI;
import static game.util.MathUtil.*;
```

Current `com.pulse` import convention:
- Preferred console API: `import com.pulse.lang.System;` and call `System.out.println(...)`.
- Convenience alias: `import com.pulse.lang.IO;` and call `IO.println(...)`.
- `String` resolves implicitly from `com.pulse.lang.String` (import optional, Java-style).
- `com.pulse` wildcard imports/static imports are validated against known baseline packages/classes.
- Unknown `com.pulse.*` imports are rejected by `check`.

Static imports allow unqualified static member usage in the current file:
```pulse
IO.println(PI);
IO.println(two());
```

Package-to-folder layout rule:
- Package `app.core` maps to folder suffix `app/core/`.
- `check` allows mismatches by default (warning only) for quick iteration.
- `check --strict-package` and `build` enforce the folder rule as an error.
- `--source-root <dir>` switches to Java-style mapping relative to that root.
  Example: with `--source-root src`, `src/app/core/Main.pulse` must be `package app.core;`.

### Class, fields, constructor, methods
```pulse
class Player {
    private String name;
    private int health;

    public Player(String name) {
        this.name = name;
        this.health = 100;
    }

    public void damage(int amount) {
        health = health - amount;
    }
}
```

### Construction
```pulse
Player player = new Player("Nova");
```

### Entry point
Allowed entry signatures:
```pulse
public static void main() { }
```
or
```pulse
public static void main(String[] args) { }
```

Exactly one valid `main` is required.

## 4. Types

### Built-ins
- `byte`, `short`, `int`, `long`, `float`, `double`, `char`, `boolean`, `void`
- Unsigned: `ubyte`, `ushort`, `uint`, `ulong`
- `String` is class-based (`com.pulse.lang.String`) and implicitly available without import

### User types
- Any class declared in the same compilation unit can be used as a type.

### Arrays
- `[]` type syntax is parsed and accepted (example: `String[]`).

## 5. Statements

### Locals and assignment
```pulse
int score = 0;
score = score + 1;
```

### Branching
```pulse
if (score > 10) {
    IO.println("high");
} else {
    IO.println("low");
}
```

### Loops
```pulse
while (score < 100) {
    score = score + 1;
}
```

```pulse
do {
    score = score + 1;
} while (score < 100);
```

```pulse
for (int i = 0; i < 10; i = i + 1) {
    if (i == 3) {
        continue;
    }
    if (i == 8) {
        break;
    }
}
```

### Switch
```pulse
switch (score) {
    case 0:
        IO.println("zero");
        break;
    case 1:
        IO.println("one");
        break;
    default:
        IO.println("many");
        break;
}
```

### Returns
```pulse
return;
return score;
```

## 6. Expressions and Operators

### Supported literals
- Integer literals (e.g., `42`)
- String literals (e.g., `"hello"`)
- Boolean literals (`true`, `false`)
- `null`

### Unary
- `!expr`
- `-expr`
- `++expr`, `--expr`
- `expr++`, `expr--`

### Binary
- Arithmetic: `+`, `-`, `*`, `/`
- Compound assignment: `+=`, `-=`, `*=`, `/=`
- Equality: `==`, `!=`
- Comparison: `<`, `<=`, `>`, `>=`
- Logical: `&&`, `||`

## 7. Calls

### Built-in currently recognized
```pulse
IO.println("text");
IO.println(score);
```

### In-class methods
- Overloads by type are supported.
- Calls are resolved by method name + full argument type list.

### Member access and chain calls
- Field access: `obj.field`
- Method call: `obj.method()`
- Chained call/access: `obj.next().value`

Static vs instance legality:
- Class refs can access/call static members only (`ClassName.value`, `ClassName.util()`).
- Instance refs can access/call instance members only (`obj.value`, `obj.run()`).
- `this` is only valid in instance methods/constructors.

## 8. Current Semantic Rules You Should Expect
- Type mismatches fail compilation.
- `null` is assignable to reference types (`String`, class types, arrays), not primitives.
- Primitive numeric assignments are strict right now:
  - exact primitive type only (`int -> int`, `uint -> uint`, etc.)
  - implicit widening/narrowing and signed/unsigned cross-conversion are rejected until explicit casts are added
- Condition expressions in `if/while/for` must be boolean.
- `break` must appear inside loops or switch blocks.
- `continue` must appear inside loops.
- Duplicate class/field/method-signature names fail.
- Duplicate locals/params fail.

Numeric conversion source-of-truth:
- `docs/NUMERIC_CONVERSION_MATRIX.md`

## 9. Current Limitations (Important)
- No runtime execution backend yet (`check` only).
- No try-catch/finally/throw yet.

## 10. Minimal Example Program
```pulse
package app.core;
import com.pulse.lang.IO;

class Main {
    private static int total;

    public static void main(String[] args) {
        total = 0;

        for (int i = 0; i < 5; i = i + 1) {
            if (i == 2) {
                continue;
            }
            total = total + i;
        }

        IO.println(total);
    }
}
```



