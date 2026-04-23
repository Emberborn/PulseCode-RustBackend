# pulse.concurrent.CompletionBiFunction

Kind: ``interface``

Source: ``stdlib/src/pulse/concurrent/CompletionBiFunction.pulse``

## Summary

Two-input completion mapping contract for the wider completion-stage baseline.

## Declaration

```pulse
public interface CompletionBiFunction<T, U, R>
```

## Members

### ``public R apply(T first, U second);``

Produces one mapped value from the supplied pair.
