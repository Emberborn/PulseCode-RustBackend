# pulse.concurrent.BlockingQueue

Kind: ``interface``

Source: ``stdlib/src/pulse/concurrent/BlockingQueue.pulse``

## Summary

Blocking queue contract for cross-thread producer/consumer coordination.
This is the first owned blocking-collection floor above the current monitor
and queue primitives.

## Declaration

```pulse
public interface BlockingQueue<T> extends Queue<T>
```

## Members

### ``public void put(T value);``

Adds one value and wakes waiting consumers.

### ``public void put(int value);``

Adds one integer value and wakes waiting consumers.

### ``public void put(String value);``

Adds one string value and wakes waiting consumers.

### ``public T take();``

Waits until a value becomes available and removes it.

### ``public T poll(long timeoutMillis);``

Waits until a value becomes available or the timeout expires.
