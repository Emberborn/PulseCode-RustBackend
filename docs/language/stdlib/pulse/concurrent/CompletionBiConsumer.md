# pulse.concurrent.CompletionBiConsumer

Kind: ``interface``

Source: ``stdlib/src/pulse/concurrent/CompletionBiConsumer.pulse``

## Summary

Two-input completion side-effect contract for the wider completion-stage baseline.

## Declaration

```pulse
public interface CompletionBiConsumer<T, U>
```

## Members

### ``public void accept(T first, U second);``

Consumes the supplied pair for side effects.
