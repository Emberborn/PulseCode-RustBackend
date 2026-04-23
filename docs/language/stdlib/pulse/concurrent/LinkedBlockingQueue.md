# pulse.concurrent.LinkedBlockingQueue

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/LinkedBlockingQueue.pulse``

## Summary

Unbounded monitor-backed blocking queue baseline.
This gives the current self-hosting floor a real producer-consumer queue
without pretending bounded-capacity or fairness policy is already finalized.

## Declaration

```pulse
public final class LinkedBlockingQueue<T> implements BlockingQueue<T>
```

## Members

### ``public LinkedBlockingQueue()``

Creates an empty blocking queue.

### ``public int size()``

Returns the current size of the queue.

### ``public boolean isEmpty()``

Reports whether the queue is currently empty.

### ``public void clear()``

Removes all queued values.

### ``public boolean add(T value)``

Adds one raw-object value at the tail and wakes waiting consumers.

### ``public boolean contains(T value)``

Reports whether the supplied value is present.

### ``public boolean remove(T value)``

Removes the first matching value when present.

### ``public boolean containsAll(Collection<T> values)``

Reports whether every supplied value is present.

### ``public boolean addAll(Collection<T> values)``

Adds all supplied values and wakes waiting consumers.

### ``public boolean removeAll(Collection<T> values)``

Removes every supplied value from the queue.

### ``public boolean retainAll(Collection<T> values)``

Retains only the supplied values in the queue.

### ``public Iterator iterator()``

Returns a snapshot iterator over the current queue contents.

### ``public boolean offer(T value)``

Offers one raw-object value at the tail and wakes waiting consumers.

### ``public boolean offer(int value)``

Offers one integer value at the tail and wakes waiting consumers.

### ``public boolean offer(String value)``

Offers one string value at the tail and wakes waiting consumers.

### ``public void put(T value)``

Adds one raw-object value and wakes waiting consumers.

### ``public void put(int value)``

Adds one integer value and wakes waiting consumers.

### ``public void put(String value)``

Adds one string value and wakes waiting consumers.

### ``public T poll()``

Removes and returns the head value when one is present.

### ``public T poll(long timeoutMillis)``

Waits until a head value becomes available or the timeout expires.

### ``public T take()``

Waits indefinitely until a value becomes available and removes it.

### ``public T remove()``

Removes and returns the head value and throws when empty.

### ``public T peek()``

Returns the head value without removing it.

### ``public T element()``

Returns the head value without removing it and throws when empty.
