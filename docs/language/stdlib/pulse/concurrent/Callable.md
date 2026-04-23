# pulse.concurrent.Callable

Kind: ``interface``

Source: ``stdlib/src/pulse/concurrent/Callable.pulse``

## Summary

Return-bearing task contract for the executor/future baseline.
This is the first callable surface above plain `Runnable`, giving the
self-sustained-hosting floor a truthful way to submit work that produces
a value without pretending the fuller lambda/method-reference stack
already exists.

## Declaration

```pulse
public interface Callable<T>
```

## Members

### ``public T call();``

Runs the task body and returns its result value.
