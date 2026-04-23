# F1 Gap Matrix

This document inventories the Java-close language target against the current PulseCode baseline.

Status legend:

- `Real`: parser + semantics + backend/runtime + executable evidence exist where relevant
- `Partial`: some real support exists, but the surface is still shallow or materially incomplete
- `Reserved/Fenced`: token or syntax shape exists, but support is intentionally rejected or not yet real
- `Missing`: not meaningfully implemented yet

## Declarations And Type Families

| Family | Current Status | Notes |
|---|---|---|
| `class` | Real | Real parser/semantic/backend/runtime baseline |
| `interface` | Real | Real declaration and implementation baseline |
| interface inheritance via `extends` | Reserved/Fenced | Explicitly reserved, not implemented |
| `enum` | Missing | Not in current parser declaration baseline |
| constructors | Real | Real syntax, semantics, and execution path |
| fields | Real | Real syntax and semantics |
| methods | Real | Real syntax and semantics |
| `abstract` | Real | Real class/method semantic baseline |
| `final` | Real | Real class/method/field baseline where currently supported |
| general annotations | Partial | Annotation syntax and selected semantics exist, but the full processor/runtime ownership model is still being pulled forward into `F1-97` |
| `@Override` | Real | Real semantic contract |
| generics | Real | Compile-time instantiated generics with erased runtime are implemented for classes/interfaces/methods, with the selected collection-wide generic closure already locked separately |
| arrays as types | Partial | Array type identity exists, but Java-close array surface is not complete |

## Statements And Control Flow

| Family | Current Status | Notes |
|---|---|---|
| local declarations | Real | Real semantic baseline |
| assignment / compound assignment | Real | Real semantic baseline |
| `if` / `else` | Real | Real semantic baseline |
| `while` | Real | Real semantic baseline |
| `do-while` | Real | Real semantic baseline |
| `for` | Real | Real semantic baseline |
| enhanced-for / foreach | Real | Iterable object streams, stdlib `Array` lane-aware/object-stream iteration, and native-array foreach are all implemented in the shipped F1 baseline |
| `switch` | Real | Current literal case baseline is real |
| `break` / `continue` | Real | Real semantic baseline |
| `return` | Real | Real semantic baseline |
| `throw` | Real | The current Pulse throwable/runtime transfer model is executable end to end |
| `try` / `catch` / `finally` | Real | Structured exception flow is real, including caller-visible catch/finally execution and return-through-finally lowering |
| try-with-resources | Real | Declaration-form resources are implemented on the shipped `AutoCloseable` lifecycle model; later Java-shape tightening can still return for effectively-final external operands or suppressed-exception parity |
| `assert` | Real | Assertion statement/runtime failure surface is shipped end to end |
| `synchronized` statement | Real | Statement lowering is now real against the shipped `pulse.concurrent.Monitor` floor; the narrower F1 memory/publication boundary is now explicit instead of implied |

## Expressions And Operators

| Family | Current Status | Notes |
|---|---|---|
| string / boolean / numeric / null literals | Real | Current baseline exists |
| char literal breadth | Partial | `char` type exists; literal/escape breadth still needs completion |
| explicit numeric casts | Real | Current cast baseline is real |
| reference cast breadth | Partial | Current behavior exists but is not Java-close-complete |
| `instanceof` | Real | Semantic + runtime baseline exists |
| unary `!` / numeric negation | Real | Real baseline |
| prefix/postfix `++` / `--` | Real | Real baseline |
| arithmetic operators | Real | Current baseline exists |
| logical `&&` / `||` | Real | Current baseline exists |
| comparison/equality | Real | Current baseline exists |
| ternary `?:` | Missing | Not implemented |
| bitwise operators | Missing | Not implemented |
| shift operators | Missing | Not implemented |
| lambda expressions | Missing | Not implemented |
| method references | Missing | Not implemented |
| array creation breadth | Partial | Array runtime exists, Java-close construction syntax does not |

## Modifiers And Java-Like Reserved Surface

| Family | Current Status | Notes |
|---|---|---|
| `public` / `private` / `protected` | Real | Current baseline exists |
| `static` | Real | Current baseline exists |
| `abstract` | Real | Current baseline exists |
| `final` | Real | Current baseline exists |
| `synchronized` modifier | Partial | Method-level synchronized lowering is real against `pulse.concurrent.Monitor`; fuller Java-close visibility/publication semantics still remain later memory-model work |
| `native` modifier | Reserved/Fenced | Reserved, semantically rejected |
| `strictfp` modifier | Reserved/Fenced | Reserved, semantically rejected |
| `transient` modifier | Reserved/Fenced | Reserved, semantically rejected |
| `volatile` modifier | Reserved/Fenced | Reserved, semantically rejected |
| `async` modifier | Reserved/Fenced | Reserved, semantically rejected; not part of Java-close claims |

## Semantic / Runtime Domains

| Family | Current Status | Notes |
|---|---|---|
| overload resolution baseline | Partial | Real, but not Java-close-complete |
| promotions/conversions | Partial | Real, but still narrow |
| checked/unchecked exception model | Missing | Not implemented |
| reflection-lite `Class` | Real | Runtime-backed minimal type identity exists as the current starting point, not the final `F1-97` target |
| full reflection/invocation | Missing | No longer a deferred policy item; now required before the compiler/runtime rewrite under `F1-97` |
| annotation processing / metadata creation | Missing | Full processor ownership, retained metadata creation, and self-host contract metadata are now required `F1-97` work rather than later cleanup |
| migration/provider interface | Missing | The two-way interface needed to attach, elevate, and detach foreign/bootstrap-backed features is now required `F1-97` work |
| threading / memory model | Partial | Real monitor/atomic/thread utility floor exists, including wait/notify, real thread lifecycle, explicit `AtomicReference` handoff/publication, and thread-safe ARC/weak/cycle runtime memory ownership, but the locked F1 contract is still intentionally narrower than the full Java Memory Model: `volatile` remains fenced, `final` publication is not claimed, and ordinary unsynchronized object-graph publication is out of scope |
| concurrency library baseline | Partial | `pulse.concurrent` now has a locked shipped scope: monitor, mutex, event, semaphore, latch, wait/notify coordination, boolean/int/long/reference atomics, selected concurrent collections (`ConcurrentHashMap`, `CopyOnWriteArrayList`, `LinkedBlockingQueue`, `LinkedBlockingDeque`), a thread-per-task executor/future baseline, one-shot delayed scheduling, and a bounded `CompletableFuture` baseline are in; `Thread` stays in `pulse.lang`; periodic scheduling, broader concurrent-collection families, and broader completion-stage families are still later work |
| networking baseline | Missing | Explicitly future F1 work |

## Stdlib Families

| Family | Current Status | Notes |
|---|---|---|
| `com.pulse.lang` | Partial | Real but still shallow relative to Java |
| collections | Partial | Real, non-generic, specialized |
| io | Partial | Real, narrow text-centric baseline |
| math | Partial | Real, small baseline |
| time | Partial | Real, small baseline |
| util | Partial | High-value utility baseline is shipped, with deeper breadth still later |
| concurrent | Partial | Low-level concurrency floor plus selected concurrent collections, a thread-per-task executor/future baseline, one-shot delayed scheduling, and bounded `CompletableFuture` support are shipped; broader concurrent-collection families, periodic scheduling, and broader completion-stage families remain later work |
| net | Missing | Not shipped yet |

## Execution And Toolchain

| Family | Current Status | Notes |
|---|---|---|
| native executable builds | Real | Fat/shared real |
| packaging/MSI | Real | Real baseline already locked |
| shared runtime boundary | Real | Real baseline already locked |
| large executable fixtures | Real | Runtime mix, object/interface mix, strict stress soak |

## F1 Planning Consequences

The most important F1 truths from this matrix are:

1. F1 is not starting from zero. Core class/interface/OOP/control-flow/native execution already exist.
2. Several Java-looking keywords are currently only reserved/fenced and must not be treated as “half done”; where a surface is only partially real, the remaining boundary still has to stay explicit.
3. The biggest ambiguity risks are still:
   - generics
   - exception runtime model
   - concurrency/memory-model scope
4. Stdlib completion is as important as syntax completion because many existing classes are still intentionally small.
