# pulse.concurrent.CompletionConsumer

Kind: ``interface``

Source: ``stdlib/src/pulse/concurrent/CompletionConsumer.pulse``

## Summary

Baseline object consumer contract for completable continuations.
This keeps completion-stage side effects usable before fuller lambda and
method-reference ownership exists in the language/compiler/runtime stack.

## Declaration

```pulse
public interface CompletionConsumer<T>
```

## Members

### ``public void accept(T value);``

Consumes one completed value for side-effect work.
