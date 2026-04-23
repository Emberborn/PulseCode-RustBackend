# pulse.concurrent.CompletionFunction

Kind: ``interface``

Source: ``stdlib/src/pulse/concurrent/CompletionFunction.pulse``

## Summary

Baseline object-to-object mapping contract for completable continuations.
This avoids pretending the fuller lambda/method-reference stack is already
in place while still allowing chained async composition today.

## Declaration

```pulse
public interface CompletionFunction<T, R>
```

## Members

### ``public R apply(T value);``

Maps one completed value into the next stage value.
