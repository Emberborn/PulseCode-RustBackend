This page documents the current compiler-backed concurrency and memory/publication baseline for F1.

## Current Baseline

Current shipped concurrency behavior is intentionally narrower than the full Java Memory Model.

What is real today:

- `synchronized` statements and method-level `synchronized`
- `pulse.concurrent.Monitor` enter/exit plus `wait` / `notify` / `notifyAll`
- `pulse.lang.Thread` lifecycle baseline: `start`, `join`, `sleep`, `yieldNow`, `currentThreadId`, and cooperative interruption
- host-backed low-level coordination primitives:
  - `Mutex`
  - `Event`
  - `Semaphore`
  - `CountDownLatch`
- host-backed atomics:
  - `AtomicBoolean`
  - `AtomicInt`
  - `AtomicLong`
  - `AtomicReference`
- higher-level task execution baseline:
  - `Callable`
  - `Executor`
  - `ExecutorService`
  - `Future`
  - `FutureTask`
  - `ThreadPerTaskExecutor`
  - `Executors.newThreadPerTaskExecutor()`
  - `RunnableFuture`
  - `ScheduledFuture`
  - `ScheduledExecutorService`
  - `ScheduledFutureTask`
  - `ScheduledThreadPerTaskExecutor`
  - `CompletableFuture`
  - `CompletionConsumer`
  - `Executors.newScheduledThreadPerTaskExecutor()`
- selected concurrent collections:
  - `ConcurrentHashMap`
  - `CopyOnWriteArrayList`
  - `BlockingQueue`
  - `LinkedBlockingQueue`
  - `BlockingDeque`
  - `LinkedBlockingDeque`

What is not claimed today:

- full Java Memory Model visibility/order guarantees
- Java-style `volatile`
- Java final-field safe-publication guarantees
- general thread-safe mutation/publication of arbitrary Pulse object graphs
- broader concurrent-collection families beyond the shipped selected baseline
- periodic scheduling
- work-stealing/fork-join executor families
- fuller `CompletableFuture` / completion-stage surface beyond the shipped baseline

## `synchronized` And Monitor Semantics

The current `synchronized` baseline is real:

- monitor expression evaluation is single-shot
- enter/exit is enforced through the shipped `pulse.concurrent.Monitor` floor
- reentrancy is real
- `wait` releases ownership, blocks, then reacquires before returning
- `notify` / `notifyAll` wake queued waiter events
- method-level `synchronized` uses hidden monitor storage rather than pretending object-header monitors already exist

This is a real coordination baseline, not just parsed syntax.

## `volatile`

`volatile` remains intentionally fenced in F1.

Current rule:

- the modifier is reserved
- it is semantically rejected with a deterministic compiler error
- no visibility/order guarantee should be inferred from the parser recognizing the token

That means F1 does not currently expose Java-style volatile field reads/writes or field-updater patterns.

## `final` Fields

`final` field support is real, but its current guarantee is narrower than Java-close publication semantics.

Current real guarantee:

- `final` fields cannot be reassigned after their allowed initialization point
- instance `final` fields may be assigned from the owning constructor
- later writes are rejected semantically

Current non-guarantees:

- no Java-style final-field safe-publication contract is claimed
- no promise is made that publishing an object to another thread without explicit coordination makes its `final` fields safely visible

So in F1, `final` currently means compile-time immutability after initialization, not full Java Memory Model publication behavior.

## Safe Publication Boundary

The truthful current safe-publication rule is explicit but still narrow:

- use explicit coordination primitives when crossing threads
- use `AtomicBoolean`, `AtomicInt`, and `AtomicLong` for shared primitive flag/counter state
- use `AtomicReference` for explicit shared-reference handoff/publication
- use monitor/lock/latch/event/semaphore coordination for handoff/wakeup
- do not treat ordinary unsynchronized field reads/writes on arbitrary objects as a supported cross-thread publication model

What `AtomicReference` does mean now:

- reference handoff through the atomic cell is supported
- ARC retain/release for that handoff is atomic under the shipped runtime threading schema
- loading a published reference returns a retained object for the observing thread
- ARC/weak/cycle runtime memory ownership paths are now serialized for cross-thread maintenance and teardown

What it still does not mean:

- arbitrary ordinary object fields become generically safe to poll across threads
- stdlib/runtime containers become generally thread-safe
- `final` fields suddenly gain Java-close safe-publication semantics

This is consistent with the current retained runtime contract, which still documents broader runtime/container/object-model thread-safety as not generally thread-safe under the current schema.

More precisely:

- runtime memory ownership is now thread-safe for ARC teardown, weak-reference bookkeeping, and cycle-maintenance passes
- broader container mutation and arbitrary unsynchronized object-graph publication are still not claimed

## Practical Guidance

Safe current patterns:

- thread handoff coordinated by `Monitor`, `Mutex`, `Event`, `Semaphore`, or `CountDownLatch`
- shared flags/counters implemented with `AtomicBoolean` / `AtomicInt` / `AtomicLong`
- explicit shared object handoff implemented with `AtomicReference`
- waiting for thread completion with `join()` before observing completion-dependent state

Unsafe or unsupported patterns:

- unsynchronized polling of ordinary fields across threads
- assuming `final` alone gives safe publication
- using `volatile`
- treating arbitrary stdlib/runtime objects as generically thread-safe

## Out Of Scope For Current F1

Still later work:

- Java-close visibility/order guarantees
- `volatile`
- final-field publication semantics
- broader container/object-model thread-safety beyond the runtime memory-ownership floor
- field updaters
- array atomics
- a full VarHandle-style memory API
- executor/future policy
- periodic scheduling and fuller completion-stage policy
- broader concurrent-collection families

## Supported Atomic Policy

Current shipped atomic policy is intentionally narrow but no longer primitive-only:

- `AtomicBoolean` is supported for flag publication and coordination on the shipped host-int lane
- `AtomicInt` is supported for integer counters and control state
- `AtomicLong` is supported for 64-bit counters/ids/control state
- `AtomicReference` is supported for explicit shared-reference handoff/publication

Not yet claimed:

- field updaters
- array atomics
- Java 9+ acquire/release/opaque/plain variant surface
- a full VarHandle-style memory API

## `pulse.concurrent` Scope

The current pre-self-sustained `pulse.concurrent` package boundary is now explicit.

Shipped in `pulse.concurrent` today:

- `Mutex`
- `Event`
- `Semaphore`
- `CountDownLatch`
- `Monitor`
- `Callable`
- `Executor`
- `ExecutorService`
- `Future`
- `FutureTask`
- `RunnableFuture`
- `ScheduledFuture`
- `ScheduledExecutorService`
- `ScheduledFutureTask`
- `ScheduledThreadPerTaskExecutor`
- `CompletableFuture`
- `CompletionFunction`
- `CompletionConsumer`
- `ThreadPerTaskExecutor`
- `Executors`
- `AtomicBoolean`
- `AtomicInt`
- `AtomicLong`
- `AtomicReference`
- `ConcurrentHashMap`
- `CopyOnWriteArrayList`
- `BlockingQueue`
- `LinkedBlockingQueue`
- `BlockingDeque`
- `LinkedBlockingDeque`
- `CancellationException`
- `ExecutionException`

Intentionally not moved into `pulse.concurrent`:

- `Thread` remains `pulse.lang.Thread`
- `Runnable` remains `pulse.lang.Runnable`

That split is intentional:

- `Thread` and `Runnable` are part of the core language-facing runtime surface
- `pulse.concurrent` owns coordination and atomic helper types around that surface
- the F1 baseline does not rename or relocate `Thread` during the self-sustained-hosting lift

Shipped selected concurrent-collection baseline:

- `ConcurrentHashMap`
- `CopyOnWriteArrayList`
- `BlockingQueue` / `LinkedBlockingQueue`
- `BlockingDeque` / `LinkedBlockingDeque`

Still later than the current `pulse.concurrent` floor:

- broader concurrent-collection families such as transfer queues, concurrent sets, skip-list maps/sets, and fairness/bounded-capacity variants
- periodic scheduling and timer-pool semantics
- work-stealing / fork-join executor families
- fuller completion-stage/composition families beyond the shipped `CompletableFuture` baseline

So the current scope is:

- low-level synchronization and atomic handoff primitives are in
- explicit reference publication is in
- thread-per-task executor/future submission is in
- one-shot delayed scheduling is in
- bounded `CompletableFuture` completion, failed futures, and executor-backed accept/map/recovery/compose chaining are in
- selected concurrent collections and blocking producer/consumer containers are in
- periodic scheduling, richer executor families, and broader completion-stage ergonomics are later

## Related
