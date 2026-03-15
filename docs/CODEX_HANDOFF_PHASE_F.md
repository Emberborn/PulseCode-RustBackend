# Codex Handoff: Phase F Continuation

This handoff replaces the older implementation/C3 handoffs. It is intended for the next Codex window and should be treated as the current execution brief.

## Read This First

Before doing any new implementation work, the next agent should:

1. Read the Phase F planning and policy docs:
   - [F1 Task Board](/D:/Programming/codex/PulseCode/docs/F1_TASK_BOARD.md)
   - [F1 Baseline Audit](/D:/Programming/codex/PulseCode/docs/F1_BASELINE_AUDIT.md)
   - [F1 Gap Matrix](/D:/Programming/codex/PulseCode/docs/F1_GAP_MATRIX.md)
   - [F1 Support Policy](/D:/Programming/codex/PulseCode/docs/F1_SUPPORT_POLICY.md)
   - [F1 Dependency Graph](/D:/Programming/codex/PulseCode/docs/F1_DEPENDENCY_GRAPH.md)
   - [Standalone Roadmap](/D:/Programming/codex/PulseCode/docs/STANDALONE_ROADMAP.md)

2. Read the language docs structure and workflow docs:
   - [F2 Task Board](/D:/Programming/codex/PulseCode/docs/F2_TASK_BOARD.md)
   - [Compiler-Backed Language Docs README](/D:/Programming/codex/PulseCode/docs/language/compiler-backed/README.md)
   - [Runtime-Backed Language Docs README](/D:/Programming/codex/PulseCode/docs/language/runtime-backed/README.md)
   - [Stdlib Language Docs README](/D:/Programming/codex/PulseCode/docs/language/stdlib/README.md)

3. Re-examine the relevant code in detail before continuing:
   - frontend/parser/semantics/IR:
     - [pulsec-core lib.rs](/D:/Programming/codex/PulseCode/crates/pulsec-core/src/lib.rs)
     - [pulsec-core parser mod.rs](/D:/Programming/codex/PulseCode/crates/pulsec-core/src/parser/mod.rs)
     - [pulsec-core semantics mod.rs](/D:/Programming/codex/PulseCode/crates/pulsec-core/src/semantics/mod.rs)
     - [pulsec-core intermediate mod.rs](/D:/Programming/codex/PulseCode/crates/pulsec-core/src/intermediate/mod.rs)
     - [pulsec-core tests mod.rs](/D:/Programming/codex/PulseCode/crates/pulsec-core/src/tests/mod.rs)
   - CLI/doc locks:
     - [stage_locks.rs](/D:/Programming/codex/PulseCode/crates/pulsec-cli/tests/stage_locks.rs)
   - stdlib source:
     - [stdlib/src/com/pulse](/D:/Programming/codex/PulseCode/stdlib/src/com/pulse)
   - stdlib docs generator:
     - [generate-stdlib-docs.ps1](/D:/Programming/codex/PulseCode/scripts/generate-stdlib-docs.ps1)

The next agent should not rely on stale top-level narrative docs as source of truth when they conflict with the F1 docs and the code. In particular:

- [LANGUAGE_GUIDE.md](/D:/Programming/codex/PulseCode/docs/LANGUAGE_GUIDE.md) is older and not the live execution contract
- [LANGUAGE_OVERVIEW.md](/D:/Programming/codex/PulseCode/docs/LANGUAGE_OVERVIEW.md) is older and not the live execution contract

The stricter current user rule is now:

- there is no "baseline is good enough" escape hatch anymore; features should be implemented to the fullest Java-like surface that is realistically achievable in the current phase unless the user explicitly approves a difference
- a task is not truly complete just because an earlier "baseline" subset works
- `Done (Locked)` means Java-hardened enough for the F1/self-hosting target; if it is still thinner than the required Java-like contract, it must stay `In Progress`
- if the shipped behavior is not yet Java-hardened enough for the F1/self-hosting target, it should stay `In Progress` with explicit return points on the F1/F2/F-A boards
- if a feature can move into Pulse stdlib rather than staying compiler/bootstrap-owned, that migration is required before the compiler/runtime rewrite into Pulse unless the ownership genuinely belongs in compiler/runtime/backend
- compiler/runtime ownership is acceptable only where that ownership genuinely belongs; otherwise the feature should end in Pulse stdlib/library code before self-hosting
- if a feature is end-to-end real but still bootstrap-owned, incomplete, or not yet Java-hardened, it must be reopened or left `In Progress` instead of being treated as permanently closed
- if a new feature, runtime surface, stdlib helper, or semantic rule is discovered during implementation to be required for self-hosting, it must be added to the tracking docs/board and implemented instead of being treated as optional future cleanup
- the target is a self-host-capable Java-like language/runtime/toolchain, not a partial Java-ish subset; deviations from Java should exist only where the user has explicitly chosen them
- reflection-lite `Class` support is part of the pre-self-host track, while full reflection/invocation and desktop UI are intentionally after self-host unless the user changes that policy later
- the handoff must be kept current during the work: add new facts/rules when they matter, remove stale details when they stop being useful, and do not let it bloat into an unreadable dump

## Required First Response From The Next Agent

Before continuing implementation, the next agent should:

1. read the docs and code listed in this handoff
2. examine the current implementation in detail
3. then give the user a concise review of the programming language and current project state

That review should explicitly answer:

- what PulseCode currently is at a high level
- what implementation language/toolchain it is currently built in
- what the current language baseline already supports end-to-end
- what major parts are still incomplete
- what Phase F is doing now
- exactly where work will resume next on the F1 board

The purpose of this review is to prove the new agent is caught up before it starts making more changes.

## Non-Negotiable Workflow Rules

These came directly from the user and must be honored.

### 1. Language docs are part of the product

The docs are currently the primary way to learn PulseCode. They are not cleanup work.

All language-facing docs must live under:

- `docs/language/compiler-backed`
- `docs/language/runtime-backed`
- `docs/language/stdlib`

If a doc is about language syntax/semantics/type rules/import rules/modifiers and it is not one stdlib class, it belongs under:

- `docs/language/compiler-backed`

If a doc is about runtime behavior that is not one stdlib class, it belongs under:

- `docs/language/runtime-backed`

If a doc is about a shipped stdlib class, it belongs under:

- `docs/language/stdlib/<package structure>`

### 2. Stdlib `.pulse` files must be PulseDoc’d

Any stdlib `.pulse` file added or modified must have multiline PulseDoc blocks.

The current lock suite already enforces:

- file/type-level PulseDoc
- PulseDoc before public members

Relevant lock file:

- [stage_locks.rs](/D:/Programming/codex/PulseCode/crates/pulsec-cli/tests/stage_locks.rs)

### 3. Run the stdlib docs generator whenever stdlib source changes

If any file under:

- `stdlib/src/com/pulse/**`

is added or modified, the next agent must run:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/generate-stdlib-docs.ps1
```

Why:

- the generator rewrites the checked-in stdlib reference docs from current PulseDoc
- the generated docs under `docs/language/stdlib/com/pulse/**` are supposed to stay current
- the generator is intentionally destructive for the generated stdlib subtree and should overwrite on every run

This overwrite contract is already documented and locked in:

- [Stdlib README](/D:/Programming/codex/PulseCode/docs/language/stdlib/README.md)
- [generate-stdlib-docs.ps1](/D:/Programming/codex/PulseCode/scripts/generate-stdlib-docs.ps1)
- [stage_locks.rs](/D:/Programming/codex/PulseCode/crates/pulsec-cli/tests/stage_locks.rs)

### 4. Prefer focused tests, not full `pulsec` test runs

The user explicitly asked not to keep running the full `cargo test -p pulsec` suite after every change.

Preferred pattern:

- run targeted `pulsec-core` tests when touching parser/semantics/IR
- run targeted CLI lock suites when touching docs/contracts/project behavior
- only run broader/full suites when truly necessary

This was the working pattern at the end of this window:

- `cargo test -q -p pulsec-core`
- `cargo test -q -p pulsec --test stage_locks`

## Where The Project Actually Is

Phase D is closed.  
Phase E is closed.  
Phase F is active.

The active board is:

- [F1 Task Board](/D:/Programming/codex/PulseCode/docs/F1_TASK_BOARD.md)

### F1 items already completed and locked

The following are already `Done (Locked)` on the board:

- `F1-00` baseline audit
- `F1-01` inventory/gap matrix
- `F1-02` support policy
- `F1-03` dependency graph
- `F1-04`..`F1-08` lexer/token/literal surface
- `F1-09` primitive/literal declaration baseline

### Immediate next work

The current board resume point is:

- `F1-50` core collection contract expansion

Recently locked:

- `F1-43` wrapper-class depth
  - primitive constant fields are Java-like primitive constants, not wrapper-typed placeholders
  - `Byte` / `Short` / `Char` / `Integer` / `Boolean` / `Long` / `UInteger` / `ULong` now have real compare/helper coverage
  - `Byte.parse`, `Short.parse`, `Char.parse`, `Long.parse`, `UByte.parse`, `UShort.parse`, `UInteger.parse`, and `ULong.parse` are executable
  - `Byte` / `Short` / `Char` / `Integer` / `Boolean` / `Long` / `UInteger` / `ULong` plus the retained small unsigned wrappers have working `toString(...)` coverage through the current string/runtime surface
  - `Float.compare` / `Double.compare` are no longer the old broken `0-or-1` placeholder shape
  - `Float.parse` / `Double.parse` now accept ordinary decimal text, optional signs, fractional parts, exponent text, and `NaN` / `Infinity`
  - `Float.toString` / `Double.toString` now produce practical Java-close decimal/scientific text in stdlib code, and `String.valueOf(float|double)` plus `StringBuilder.append(float|double)` ride that same surface
  - focused proof:
    - `cargo test -q -p pulsec --test fixture_projects cli_build_executes_wrapper_integral_text_and_constants_flow -- --exact`
    - `cargo test -q -p pulsec --test fixture_projects cli_build_executes_wrapper_floating_text_and_compare_flow -- --exact`
- `F1-44` unsigned policy
  - `ubyte` / `ushort` / `uint` / `ulong` plus their wrapper classes are now explicitly locked as retained Pulse extensions
  - Java-close wording must not imply that unsigned primitives/wrappers are part of the Java baseline
  - existing executable coverage for unsigned promotion, comparison, parse, and `toString(...)` remains the proof that the extension surface is real rather than a doc-only claim
- `F1-45` `System` / process baseline
  - `System.out` and `System.err` are both real print streams now
  - `System.currentTimeMillis()` is runtime-backed wall-clock time
  - `System.nanoTime()` is runtime-backed elapsed-time measurement
  - `System.exit(int)` is real process termination
  - property/env/process breadth beyond that slice remains explicitly deferred instead of being implied
- `F1-47` foundational `com.pulse.lang` types
    - `Runnable`, `Appendable`, and `CharSequence` now exist as real stdlib interfaces
    - `String` now implements `CharSequence` and the current non-generic `Comparable` baseline
    - `StringBuilder` now implements `Appendable` and `CharSequence`
    - `InputStream` and `OutputStream` now implement the current bootstrap `AutoCloseable` seam
    - fat and shared output modes now both pass the foundational interface flow
- `F1-48` collection API inventory and strategy
    - the shipped `com.pulse.collections` surface is now inventoried explicitly
    - the gap doc records the current bootstrap lane-specific contracts and the real `F1-49`..`F1-55` return points
- `F1-49` staged collection strategy before and after generics
    - the current lane-specific collection APIs are now explicitly locked as bootstrap compatibility scaffolding
    - the generic collection contracts are the intended public direction, with later closure explicitly tied to `F1-50`, `F1-53`, `F1-54`, `F1-55`, and `F1-68`
- `F1-50` core collection contract expansion
    - the first coherence slice is in: `isEmpty()` now exists across the current `Collection`, `List`, `Set`, `Map`, `Queue`, and `Deque` baseline
    - fat and shared output modes both pass the new `isEmpty()` contract fixture
    - return next for broader method-family alignment and concrete-class contract closure
  - `com.pulse.lang.Enum` remains explicitly bootstrap; the fuller enum object model still returns later under `F1-10`

Recent non-board regression work that is now fixed and should not be re-debugged from scratch:

- the `F1-39` / `F1-40` object/reflection-lite work initially regressed shared split/runtime publication
- shared packaging and shared profile builds are green again after:
  - moving the split runtime support object out of the `com/pulse/lang/IO.asm` collision path into `obj/runtime/StdlibRuntime.asm`
  - emitting object-class-name literal data in the split runtime object
  - pruning unused blanket runtime `extrn` imports from app/stdlb split objects
  - exporting the actually shared runtime helper procedures needed by app objects
  - publishing the shared runtime DLL/import library canonically in `bin/` beside the shared executable
- `stage_locks_c2` was updated to read `obj/runtime/StdlibRuntime.asm` instead of the old runtime-at-`IO.asm` path

The recently locked context before `F1-41`:

- `F1-29`, `F1-35`, `F1-46`, and `F1-101` are now locked together for the shipped exception slice
  - methods and constructors support `throws`
  - checked exceptions from direct `throw`, method calls, and constructor calls must be caught or declared
  - overriding methods and interface implementations cannot widen checked throws beyond inherited contracts
  - runtime Pulse-throw propagation works across method boundaries
  - matching caller-side `catch` / `finally` blocks execute for propagated throws
  - uncaught Pulse throws print source-aware stack frames in `Class.method(File.pulse:line)` form
  - caller frames preserve the active call-site line
  - internal fallback helpers like `Throwable.panic()` are hidden from the user-facing trace
  - the stdlib throwable hierarchy owns Java-close message/cause/toString behavior, including cause chaining through uncaught output
- `F1-34` and `F1-35` are now locked
  - IR now has explicit handler-frame instructions, pending-exception retrieval, and real throw terminators
  - the runtime now maintains an exception-handler stack for Pulse `throw` values
  - uncaught throws still fall back through `Throwable.panic()`
  - runtime panic paths like null/bounds are still separate from structured throwable propagation
- `F1-37` is now locked
  - runtime/ABI docs are aligned with the shipped F1 surface
  - public intrinsics cover the string/array/collection bridge
  - exception/trace runtime growth is explicitly documented through `pulsec_rt_throw` and `pulsec_rt_traceUpdateTop`
- `F1-38` is now locked
  - the shipped F1 syntax/runtime slice is covered by the existing fat/shared E3 parity suites
  - matched fixture corpus parity, runtime-heavy parity, strict stress parity, and failure-path parity remain the proof surface for the new language/runtime work
- `F1-39` is now locked
  - `Object` now has a real identity baseline in stdlib/runtime
  - `equals(Object)` remains identity-style
  - `hashCode()` is now a stable runtime-backed identity hash
  - `getClass()` now returns honest runtime class identity instead of a hardcoded `"Object"` descriptor
- `F1-40` is now locked
  - `Object.getClass().getName()` now returns fully qualified runtime names such as `app.core.Main`
  - `Class.getSimpleName()` and `Class.getPackageName()` are real through the current reflection-lite runtime metadata surface
- `F1-41` is now locked
  - `String` now has Java-close content equality, `charAt`, `substring`, search helpers, prefix/suffix checks, trim, and `String.valueOf(Object)`
  - only `charAt` and `substring` required new runtime helpers; the rest now live honestly in Pulse stdlib on top of them
- `F1-42` is now locked
  - `StringBuilder` now supports object/char append plus practical `insert`, `delete`, and `setLength`
  - the only extra runtime bridge needed for this slice was `String.runtimeFromChar(char)`; the rest stays in stdlib code on top of `String`
- memory-management ownership was cleaned up in stdlib
  - [Memory.pulse](/D:/Programming/codex/PulseCode/stdlib/src/com/pulse/memory/Memory.pulse) now owns the user-facing ARC/cycle/weak surface
  - `com.pulse.rt.Intrinsics` remains the internal backend bridge for those operations
  - fake/bootstrap intrinsics still remain on `Intrinsics` for now and should not be mislabeled as permanent stdlib ownership
- exception-package ownership still needs a dedicated reorganization pass before self-host
  - this is now tracked explicitly on the F1 board as `F1-106`
  - the current shipped throwable hierarchy still lives under `com.pulse.lang`
- self-host-ready test authoring/execution is now tracked explicitly too
  - `F1-107` covers the pre-self-host test baseline: `@Test` ownership, assertion helpers, discovery policy, `pulsec test`, output contract, and the minimum product-owned support needed for Pulse-native compiler/runtime tests before self-host
- `F1-46` is now locked
  - `Throwable` now owns message, cause, `getMessage()`, `getCause()`, `initCause(...)`, default formatting, and full uncaught cause-chain rendering
  - `Exception`, `RuntimeException`, and the current shipped runtime exception subclasses now mirror the current Java-close constructor/cause baseline in stdlib: no-arg, message, message+cause, plus late `initCause(...)`
- `F1-19` is now locked
  - assertion failures now terminate through the stdlib-owned `AssertionError` hierarchy with Java-like message formatting
- `F1-23`, `F1-26`, `F1-27`, `F1-28`, `F1-36`, `F1-99`, and `F1-100` are now all locked
  - native arrays now cover the current primitive/reference surface, including multidimensional creation, nested initializers, native subscript syntax, and native-array foreach
  - numeric conversions/promotions/overload applicability are Java-hardened for the shipped F1 slice
  - bitwise/shift operators and local `var` are real
  - arrow-style switch expressions are real; `yield`/block-form switch-expression arms remain fenced
  - lowering/codegen is now locked too for the shipped syntax slice: arrays, foreach, ternary, switch expressions, and bitwise/shift operators all execute in realistic native fixtures
    - `ubyte` / `ushort` arithmetic promotes to `uint`
    - mixed `uint` / `ulong` arithmetic/comparison widens to executable `ulong`
  - the current mixed signed/unsigned numeric slice is now real too:
    - `ubyte` widens into signed targets starting at `short`
    - `ushort` widens into signed targets starting at `int`
    - `uint` widens into signed targets starting at `long`
    - `char` widens into unsigned targets starting at `ushort`
    - mixed signed/unsigned integer expressions now resolve through executable `int` / `long` where the current runtime can carry them honestly
    - mixed signed with `ulong` still requires an explicit cast
  - explicit casts from integral primitives to `float` / `double` now materialize real floating values, and explicit `double` -> `float` casts round through single precision
  - call-site and constructor-side implicit numeric widening now execute through the same runtime-backed coercion path instead of raw register-width reuse
  - varargs applicability is now real too:
    - zero trailing arguments are accepted
    - trailing arguments are packaged into the array-backed varargs parameter at call sites
    - existing arrays can be passed directly to varargs parameters
    - fixed-arity overloads still win over varargs overloads when both are applicable
  - erased generic raw/instantiated compatibility is now real too for assignment and overload applicability in the current erased F1 model
  - `F1-26` and `F1-28` are now locked
  - `F1-96` is now locked too:
    - `interface extends A, B` is real
    - `default`, `static`, and `private` interface methods are real
    - interface inheritance cycles fail deterministically
    - concrete classes are only required to implement abstract interface instance methods
    - inherited default methods dispatch through both interface-typed and class-typed receivers
  - `F1-98` is now locked too:
    - nested member types, local classes, and anonymous classes are explicitly deferred until after self-host
    - parser/docs/tests now fail them with deterministic diagnostics instead of leaving the policy implicit
  - the next work should move to the next unfinished board item instead of revisiting the completed Workstream E, exception, and interface-member hardening slices

Recent runtime fix that closed the active blocker:

- the remaining heap corruption was not actually a wrapper-object field bug
- it reduced to runtime-backed map growth when a collection handle lived in a later slot
- root cause:
  - `emit_map_new_proc` had two bad reads using `dword ptr [rt_map_cap_ptr+r10*4]`
  - those indexed the global pointer variable itself instead of the heap table behind `[rt_map_cap_ptr]`
  - that produced slot-sensitive bogus capacities and heap corruption during later map growth
- fixed in:
  - [runtime_emitters.rs](/D:/Programming/codex/PulseCode/crates/pulsec-cli/src/backend/emission/runtime_emitters.rs)
- validated with:
  - reduced repros under `tmp_runtime_mix_probe/**`
  - `cargo test -q -p pulsec --test fixture_projects cli_build_executes_strict_stress_soak_with_repeated_fat_shared_parity`
  - `cargo test -q -p pulsec --test stage_locks lock_m3_16_stress_soak_fixture_check -- --exact --test-threads=1`
- the temporary `HANDLE_SLOT_INITIAL_CAPACITY = 255` experiment was reverted; it was only a debugging probe, not part of the fix

Recent runtime model hardening after that fix:

- object references now use the same generation-packed handle model as other ARC-managed runtime references
- `pulsec_rt_objectNew` no longer returns a raw slot; it returns `slot | (generation << 32)`
- `pulsec_rt_objectClassId` now decodes and validates packed object handles before reading class metadata
- important split/shared boundary note:
  - app-emitted class ARC edge helpers must stay free of runtime-private table/data references
  - the temporary attempt to validate packed object-reference fields inside those app helpers was reverted
  - they still use the low slot for object edge bookkeeping, while packed-handle validation stays in runtime-private procedures
- fixed in:
  - [runtime_emitters.rs](/D:/Programming/codex/PulseCode/crates/pulsec-cli/src/backend/emission/runtime_emitters.rs)
- focused validation:
  - `cargo test -q -p pulsec --bins --manifest-path "D:\Programming\codex\PulseCode\Cargo.toml"`
  - `cargo test -q -p pulsec --test fixture_projects cli_build_executes_strict_stress_soak_with_repeated_fat_shared_parity --manifest-path "D:\Programming\codex\PulseCode\Cargo.toml"`
  - `cargo test -q -p pulsec --test stage_locks lock_m3_16_stress_soak_fixture_check --manifest-path "D:\Programming\codex\PulseCode\Cargo.toml" -- --exact --test-threads=1`
  - `cargo test -q -p pulsec --test fixture_projects --manifest-path "D:\Programming\codex\PulseCode\Cargo.toml"`
  - `cargo test -q -p pulsec --test stage_locks --manifest-path "D:\Programming\codex\PulseCode\Cargo.toml"`

The following tasks were reopened as explicit bootstrap-to-Pulse return passes:

- `F1-10` enum baseline
  - return in `F1-47` / `F1-69` to complete the std-facing `com.pulse.lang.Enum` contract
- `F1-11` generics bootstrap
  - return in `F1-49` / `F1-68` for the collection-wide generic story and final F1 closure
- `F1-12` richer annotation syntax/support policy
  - return in `F-A` with `F2` docs updates for Pulse-owned annotation processor migration
- `F1-13` modifier subset/fences
  - return in `F1-20` / `F1-86` / `F1-89` / `F1-93` for real monitor/memory-model/runtime semantics
- `F1-19` `assert`
  - return in `F1-26` / `F1-46` for fuller Java-like assertion typing and error behavior
- `F1-21` ternary
  - return in `F1-26` / `F1-28` for fuller Java-like promotion and compatibility behavior
- `F1-22` casts
  - return in `F1-26` / `F1-28` for fuller Java-like conversion and promotion behavior
- `F1-30` built-in annotation semantics
  - return in `F-A` with `F2` docs updates for Pulse-owned annotation processor migration

This is the next recommended continuation point unless the user redirects.

## Detailed Current Language State

### Frontend/semantic features that are real now

These are not just tokenized. They are implemented and locked to the current F1 baseline:

- package/import/static import support
- classes/interfaces
- annotation declarations via `@interface` (marker-only for now)
- built-in annotation semantics:
  - `@Override`
  - `@NotNull`
  - `@Test`
- `extends`
- `implements`
- constructors
- `this`
- `super`
- control flow already in baseline:
  - `if`
  - `while`
  - `do-while`
  - `for`
  - `switch`
  - `break`
  - `continue`
  - `return`
- `instanceof`
- explicit casts
- char literals
- numeric literal breadth:
  - hex
  - binary
  - octal
  - underscores
  - suffixes
- varargs parameter baseline
- enums:
  - declaration
  - constant uniqueness
  - constant immutability
  - assignment/comparison usage
  - ordinal-backed executable lowering
- compile-time instantiated, runtime-erased generics baseline:
  - class/interface type params
  - method type params
  - generic type-use syntax
  - generic arity validation
  - primitive generic-argument rejection
  - compile-time instantiated member typing
  - simple generic method inference
  - erased runtime lowering to raw owner / native `Object`-shaped storage
- broader flow/nullability analysis:
  - loop conditions now narrow `while` / `for` / `do-while` bodies on direct `== null` / `!= null` local checks
  - foreach loop-local nullability state no longer leaks outward
  - switch branch nullability now merges conservatively after the statement
  - try/catch/finally post-state now merges conservatively, and `finally` assignments are visible afterward
- visibility/inheritance closure for the shipped F1 subset:
  - cross-package subclass protected access now follows the Java-like receiver rule
  - package/private/protected behavior is explicit and tested
  - nested/inner/local/anonymous types remain fenced until later work explicitly changes that policy

### Annotation baseline details

Current shipped annotation behavior:

- `@Override`
  - compiler-owned bootstrap semantics
  - validates actual override contract
- `@NotNull`
  - frontend bootstrap semantic contract
  - currently rejects obvious `null` misuse on supported targets
- `@Test`
  - frontend bootstrap validation for method shape

Annotation declarations in Pulse are now real:

- `public @interface Marker { }`

Current annotation limits:

- marker-style only
- no annotation members/elements yet
- no external/codegen processor system yet
- current built-in semantics are still bootstrap compiler ownership and are expected to be revisited in Phase F-A

Stdlib annotation declarations added:

- [Override.pulse](/D:/Programming/codex/PulseCode/stdlib/src/com/pulse/lang/Override.pulse)
- [NotNull.pulse](/D:/Programming/codex/PulseCode/stdlib/src/com/pulse/lang/NotNull.pulse)
- [Test.pulse](/D:/Programming/codex/PulseCode/stdlib/src/com/pulse/lang/Test.pulse)

### Enum baseline details

Current enum baseline is intentionally narrow and honest:

- enum declarations parse and check
- enum constants are immutable
- enum constants can be assigned/compared
- runtime lowering is ordinal-backed

Not yet promised:

- full Java enum object model
- helper generation like `values()` / `valueOf()`
- enum methods/constructors/advanced behavior

Reference doc:

- [enums.md](/D:/Programming/codex/PulseCode/docs/language/compiler-backed/enums.md)

### Generics baseline details

Current generics contract is intentionally:

- compile-time instantiated with erased runtime

Meaning:

- generics exist on classes/interfaces/methods
- generic type-use syntax is accepted and validated
- `Box<String>.get()` typechecks as `String`
- `Box<String>.set(Object)` is rejected
- simple generic method inference from call arguments is real
- runtime lowering erases `Box<String>` to raw `Box`
- raw/instantiated owner compatibility is still explicitly allowed where chosen

Important limit:

- this is not full Java generics yet
- bounds, wildcards, deeper inference, and collection-wide genericization remain later under `F1-49` / `F1-68`

Reference doc:

- [generics.md](/D:/Programming/codex/PulseCode/docs/language/compiler-backed/generics.md)

## Files Most Relevant To Current F1 Work

### Core frontend

- [pulsec-core lib.rs](/D:/Programming/codex/PulseCode/crates/pulsec-core/src/lib.rs)
  - AST structs
  - lexer
  - `check()`

- [pulsec-core parser.rs](/D:/Programming/codex/PulseCode/crates/pulsec-core/src/parser.rs)
  - declaration parsing
  - annotation parsing
  - enum parsing
  - generic declaration/type-use parsing

- [pulsec-core semantics.rs](/D:/Programming/codex/PulseCode/crates/pulsec-core/src/semantics.rs)
  - class/type index
  - annotation semantics
  - enum semantics
  - generic validation/erasure-aware canonicalization
  - mutability/cast/type rules

- [pulsec-core ir.rs](/D:/Programming/codex/PulseCode/crates/pulsec-core/src/ir.rs)
  - IR lowering
  - enum ordinal lowering
  - erased generic runtime type lowering

- [pulsec-core tests.rs](/D:/Programming/codex/PulseCode/crates/pulsec-core/src/tests.rs)
  - focused parser/semantic/IR unit coverage

### CLI/doc contracts

- [stage_locks.rs](/D:/Programming/codex/PulseCode/crates/pulsec-cli/tests/stage_locks.rs)
  - docs-tree contract
  - stdlib PulseDoc locks
  - stdlib docs generator locks
  - F1 doc/CLI lock tests

## What Was Validated At The End Of This Window

Focused validation used, not full-suite:

```powershell
cargo test -q -p pulsec-core
cargo test -q -p pulsec --test stage_locks
```

Both passed after the `F1-11` generics closure work.

## Current Docs Tree Status

The language docs tree now exists and is active:

- [compiler-backed](/D:/Programming/codex/PulseCode/docs/language/compiler-backed)
- [runtime-backed](/D:/Programming/codex/PulseCode/docs/language/runtime-backed)
- [stdlib](/D:/Programming/codex/PulseCode/docs/language/stdlib)

Compiler-backed docs added/updated during this window:

- [lexer-and-literals.md](/D:/Programming/codex/PulseCode/docs/language/compiler-backed/lexer-and-literals.md)
- [declarations-and-modifiers.md](/D:/Programming/codex/PulseCode/docs/language/compiler-backed/declarations-and-modifiers.md)
- [types-and-conversions.md](/D:/Programming/codex/PulseCode/docs/language/compiler-backed/types-and-conversions.md)
- [packages-and-imports.md](/D:/Programming/codex/PulseCode/docs/language/compiler-backed/packages-and-imports.md)
- [constructors.md](/D:/Programming/codex/PulseCode/docs/language/compiler-backed/constructors.md)
- [annotations.md](/D:/Programming/codex/PulseCode/docs/language/compiler-backed/annotations.md)
- [enums.md](/D:/Programming/codex/PulseCode/docs/language/compiler-backed/enums.md)
- [generics.md](/D:/Programming/codex/PulseCode/docs/language/compiler-backed/generics.md)

Runtime-backed docs already created for current non-stdlib runtime behavior:

- [program-entry-and-execution.md](/D:/Programming/codex/PulseCode/docs/language/runtime-backed/program-entry-and-execution.md)
- [object-lifetime-and-gc.md](/D:/Programming/codex/PulseCode/docs/language/runtime-backed/object-lifetime-and-gc.md)
- [runtime-type-and-null-behavior.md](/D:/Programming/codex/PulseCode/docs/language/runtime-backed/runtime-type-and-null-behavior.md)
- [exceptions-and-failure.md](/D:/Programming/codex/PulseCode/docs/language/runtime-backed/exceptions-and-failure.md)

## Important Scope Policies Already Locked

These policies were explicitly discussed with the user and are reflected in the docs/boards:

- no desktop UI (`awt` / `swing`) in F1
- full reflection is deferred until after self-hosting
- `Class` remains reflection-lite only in F1
- utility/concurrency/networking were made more explicit on the board
- docs are required during implementation, not at the end
- testing/conformance infrastructure must exist before self-hosting

Relevant roadmap lines:

- [Standalone Roadmap](/D:/Programming/codex/PulseCode/docs/STANDALONE_ROADMAP.md)

## Library/Binding Direction Already Chosen

This is not current implementation work, but it was locked as future direction and the next agent should not accidentally revert the plan.

Reference docs:

- [Library Artifact Strategy](/D:/Programming/codex/PulseCode/docs/LIBRARY_ARTIFACT_STRATEGY.md)
- [Standalone Roadmap](/D:/Programming/codex/PulseCode/docs/STANDALONE_ROADMAP.md)

Current future-direction decisions:

- Pulse-authored libraries are intended to compile to native DLLs
- companion binding artifacts will be normal `.pulse` files, not a separate custom extension
- planned modifier direction is `external` as a declaration modifier
- library distro output is intended to be:
  - `build/distro/<profile>/<library>.dll`
  - `build/distro/<profile>/bindings/`
- app/runtime consumption later will use:
  - `libraries/` for DLLs
  - `bindings/` for binding `.pulse` files

This is future Phase F-A work, not current F1 execution.

## Current Resume Point

Resume at:

- [F1 Task Board](/D:/Programming/codex/PulseCode/docs/F1_TASK_BOARD.md)
- `F1-50` core collection contract expansion

Current board state after the latest completed work:

- `F1-14`, `F1-15`, `F1-16`, `F1-21`, `F1-22`, `F1-23`, `F1-26`, `F1-27`, `F1-28`, `F1-29`, `F1-35`, `F1-46`, `F1-99`, `F1-100`, and `F1-101` are now `Done (Locked)`
- `F1-27` now covers the real bitwise/shift family end to end:
  - integral `&`, `|`, `^`
  - unary `~`
  - `<<`, `>>`, `>>>`
  - compound assignment forms `&=`, `|=`, `^=`, `<<=`, `>>=`, `>>>=`
  - boolean bitwise `&`, `|`, `^`
  - lazy logical `&&` / `||` lowering is now separate from bitwise semantics instead of sharing the old eager path
- the non-array compound-assignment lowering path was also corrected so it stores back through the existing backend assignment pattern instead of evaluating the composed value and discarding it
- `F1-100` now covers the real pre-self-host local `var` slice:
  - ordinary local declarations
  - classic `for` initializer locals
  - `foreach (var item : nativeArray)`
  - `foreach (var item : iterable)` on the current `com.pulse.lang.Iterable` object-stream baseline
  - `var` requires an initializer and cannot infer from `null` or `void`
  - `var` is still not inferred for the current non-generic `com.pulse.collections.Array` foreach surface because that contract does not yet expose honest element typing
- `F1-99` now covers the current switch-expression policy:
  - arrow-style switch expressions are real and executable
  - switch-expression arms currently use `case literal -> expression;`
  - a `default` arm is required in the current pre-self-host slice
  - block-form switch-expression arms and `yield` are explicitly fenced rather than implied

Recommended immediate continuation:

1. Resume from the next unfinished board item after the locked exception/diagnostics chain; `F1-29` is no longer open.
2. Keep applying the hard rule: nothing closes as final unless it is Java-hardened enough for the self-host target or is honestly fenced and left `In Progress`.
3. Keep moving any feature surface that can live in Pulse stdlib out of Rust bootstrap ownership.
4. Keep this handoff current by adding new live state and removing stale next-step advice instead of letting it turn into a dump.
