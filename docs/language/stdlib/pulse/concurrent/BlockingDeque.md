# pulse.concurrent.BlockingDeque

Kind: ``interface``

Source: ``stdlib/src/pulse/concurrent/BlockingDeque.pulse``

## Summary

Blocking deque contract for front/back producer-consumer coordination.

## Declaration

```pulse
public interface BlockingDeque<T> extends BlockingQueue<T>, Deque<T>
```

## Members

### ``public void putFirst(T value);``

Adds one value at the front and wakes waiting consumers.

### ``public void putFirst(int value);``

Adds one integer value at the front and wakes waiting consumers.

### ``public void putFirst(String value);``

Adds one string value at the front and wakes waiting consumers.

### ``public void putLast(T value);``

Adds one value at the back and wakes waiting consumers.

### ``public void putLast(int value);``

Adds one integer value at the back and wakes waiting consumers.

### ``public void putLast(String value);``

Adds one string value at the back and wakes waiting consumers.

### ``public T takeFirst();``

Waits until a front value becomes available and removes it.

### ``public T takeLast();``

Waits until a back value becomes available and removes it.

### ``public T pollFirst(long timeoutMillis);``

Waits until a front value becomes available or the timeout expires.

### ``public T pollLast(long timeoutMillis);``

Waits until a back value becomes available or the timeout expires.
