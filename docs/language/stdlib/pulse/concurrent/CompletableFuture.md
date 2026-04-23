# pulse.concurrent.CompletableFuture

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/CompletableFuture.pulse``

## Summary

Manually completable future with async submission/composition hooks.
This is a bounded pre-self-hosting baseline: manual completion, async supply/run,
executor-backed accept/map/recovery/compose chaining, and explicit failed futures
are real now, while the full Java completion-stage surface still remains later work.

## Declaration

```pulse
public final class CompletableFuture<T> implements Future<T>
```

## Members

### ``public CompletableFuture()``

Creates a new incomplete completable future.

### ``public static <T> CompletableFuture<T> completedFuture(T value)``

Returns a future already completed with the supplied value.

### ``public static <T> CompletableFuture<T> failedFuture(Throwable failure)``

Returns a future already completed exceptionally with the supplied failure.

### ``public static <T> CompletableFuture<T> supplyAsync(Callable<T> task, Executor executor)``

Runs one callable task asynchronously on the supplied executor.

### ``public static CompletableFuture<Object> runAsync(Runnable task, Executor executor)``

Runs one runnable task asynchronously on the supplied executor.

### ``public static CompletableFuture<Object> allOfAsync(``

Returns one future that completes when every supplied future completes.

### ``public static CompletableFuture<Object> anyOfAsync(``

Returns one future that completes with the first supplied future to finish.

### ``public boolean complete(T value)``

Completes this future successfully if it is still incomplete.

### ``public boolean completeExceptionally(Throwable failure)``

Completes this future exceptionally if it is still incomplete.

### ``public boolean cancel(boolean mayInterruptIfRunning)``

Requests cancellation for this future.

### ``public boolean isCancelled()``

Returns whether cancellation has won for this future.

### ``public boolean isDone()``

Returns whether this future has reached a terminal state.

### ``public void await()``

Waits indefinitely for terminal completion.

### ``public boolean await(long timeoutMillis)``

Waits for terminal completion or timeout.

### ``public T get()``

Returns the completed value or throws the current baseline future exception.

### ``public T join()``

Returns the completed value using the same baseline behavior as `get()`.

### ``public CompletableFuture<Object> thenRunAsync(Runnable action, Executor executor)``

Chains one async runnable continuation onto this future.

### ``public CompletableFuture<Object> thenAcceptAsync(CompletionConsumer<T> action, Executor executor)``

Chains one async consumer continuation onto this future.

### ``public <R> CompletableFuture<R> thenApplyAsync(CompletionFunction<T, R> mapper, Executor executor)``

Chains one async mapping continuation onto this future.

### ``public CompletableFuture<T> exceptionallyAsync(CompletionFunction<Throwable, T> mapper, Executor executor)``

Chains one async recovery continuation that runs only if this future fails.

### ``public <R> CompletableFuture<R> thenComposeAsync(``

Chains one async compose continuation onto this future.

### ``public <U, R> CompletableFuture<R> thenCombineAsync(``

Chains one async two-stage combination continuation onto this future.

### ``public <U> CompletableFuture<Object> runAfterBothAsync(``

Runs one async action after this future and another future both complete.

### ``public <R> CompletableFuture<R> applyToEitherAsync(``

Applies one async mapper to whichever of this future or the other future completes first.

### ``public CompletableFuture<Object> acceptEitherAsync(``

Runs one async consumer on whichever of this future or the other future completes first.

### ``public CompletableFuture<Object> runAfterEitherAsync(``

Runs one async action after whichever of this future or the other future completes first.

### ``public <R> CompletableFuture<R> handleAsync(``

Chains one async completion handler that sees either the value or failure.

### ``public CompletableFuture<T> whenCompleteAsync(``

Chains one async completion observer that sees either the value or failure.

### ``public void close()``

Releases coordination/storage resources after completion.
