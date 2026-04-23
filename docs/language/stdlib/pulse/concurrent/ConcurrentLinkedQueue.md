# pulse.concurrent.ConcurrentLinkedQueue

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/ConcurrentLinkedQueue.pulse``

## Summary

Monitor-backed concurrent queue baseline.
This is the non-blocking sibling of `LinkedBlockingQueue`: operations are
synchronized, but queue reads return immediately instead of waiting.

## Declaration

```pulse
public final class ConcurrentLinkedQueue<T> implements Queue<T>
```

## Members

### ``public ConcurrentLinkedQueue()``

Creates an empty concurrent queue.

### ``public int size()``

Returns the current number of queued values.

### ``public boolean isEmpty()``

Reports whether the queue is currently empty.

### ``public void clear()``

Removes all queued values.

### ``public boolean add(T value)``

Adds one raw-object value at the tail of the queue.

### ``public boolean contains(T value)``

Reports whether the supplied value is present.

### ``public boolean remove(T value)``

Removes the first matching value when present.

### ``public boolean containsAll(Collection<T> values)``

Reports whether every supplied value is present.

### ``public boolean addAll(Collection<T> values)``

Adds all supplied values at the tail of the queue.

### ``public boolean removeAll(Collection<T> values)``

Removes every supplied value from the queue.

### ``public boolean retainAll(Collection<T> values)``

Retains only the supplied values in the queue.

### ``public Iterator iterator()``

Returns a snapshot iterator over the current queue contents.

### ``public boolean offer(T value)``

Offers one raw-object value at the tail.

### ``public boolean offer(int value)``

Offers one integer value at the tail.

### ``public boolean offer(String value)``

Offers one string value at the tail.

### ``public T poll()``

Removes and returns the head value when one is present.

### ``public T remove()``

Removes and returns the head value and throws when empty.

### ``public T peek()``

Returns the head value without removing it.

### ``public T element()``

Returns the head value without removing it and throws when empty.
