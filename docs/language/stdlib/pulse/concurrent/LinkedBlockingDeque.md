# pulse.concurrent.LinkedBlockingDeque

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/LinkedBlockingDeque.pulse``

## Summary

Unbounded monitor-backed blocking deque baseline.
This extends the blocking-queue floor with front/back operations for
scheduler and work-queue style coordination.

## Declaration

```pulse
public final class LinkedBlockingDeque<T> implements BlockingDeque<T>
```

## Members

### ``public LinkedBlockingDeque()``

Creates an empty blocking deque.

### ``public int size()``

Returns the number of values currently stored in the deque.

### ``public boolean isEmpty()``

Reports whether the deque is currently empty.

### ``public void clear()``

Removes all current deque state.

### ``public boolean add(T value)``

Adds one raw-object value at the tail and wakes waiting consumers.

### ``public boolean contains(T value)``

Reports whether the supplied value is present.

### ``public boolean remove(T value)``

Removes the first matching value when present.

### ``public boolean containsAll(Collection<T> values)``

Reports whether every supplied value is present.

### ``public boolean addAll(Collection<T> values)``

Adds all supplied values at the tail and wakes waiting consumers.

### ``public boolean removeAll(Collection<T> values)``

Removes every supplied value from the deque.

### ``public boolean retainAll(Collection<T> values)``

Retains only the supplied values in the deque.

### ``public Iterator iterator()``

Returns a snapshot iterator over the current deque contents.

### ``public boolean offer(T value)``

Offers one raw-object value at the tail and wakes waiting consumers.

### ``public boolean offer(int value)``

Offers one integer value at the tail and wakes waiting consumers.

### ``public boolean offer(String value)``

Offers one string value at the tail and wakes waiting consumers.

### ``public T poll()``

Removes and returns the head value when one is present.

### ``public T poll(long timeoutMillis)``

Waits until a head value becomes available or the timeout expires.

### ``public T remove()``

Removes and returns the head value and throws when empty.

### ``public T peek()``

Returns the head value without removing it.

### ``public T element()``

Returns the head value without removing it and throws when empty.

### ``public void put(T value)``

Adds one raw-object value at the tail and wakes waiting consumers.

### ``public void put(int value)``

Adds one integer value at the tail and wakes waiting consumers.

### ``public void put(String value)``

Adds one string value at the tail and wakes waiting consumers.

### ``public T take()``

Waits until a head value becomes available and removes it.

### ``public void addFirst(T value)``

Adds one raw-object value at the front and wakes waiting consumers.

### ``public boolean offerFirst(T value)``

Offers one raw-object value at the front and wakes waiting consumers.

### ``public void addFirst(int value)``

Adds one integer value at the front and wakes waiting consumers.

### ``public void addFirst(String value)``

Adds one string value at the front and wakes waiting consumers.

### ``public boolean offerFirst(int value)``

Offers one integer value at the front and wakes waiting consumers.

### ``public boolean offerFirst(String value)``

Offers one string value at the front and wakes waiting consumers.

### ``public void addLast(T value)``

Adds one raw-object value at the back and wakes waiting consumers.

### ``public boolean offerLast(T value)``

Offers one raw-object value at the back and wakes waiting consumers.

### ``public void addLast(int value)``

Adds one integer value at the back and wakes waiting consumers.

### ``public void addLast(String value)``

Adds one string value at the back and wakes waiting consumers.

### ``public boolean offerLast(int value)``

Offers one integer value at the back and wakes waiting consumers.

### ``public boolean offerLast(String value)``

Offers one string value at the back and wakes waiting consumers.

### ``public void putFirst(T value)``

Adds one raw-object value at the front and wakes waiting consumers.

### ``public void putFirst(int value)``

Adds one integer value at the front and wakes waiting consumers.

### ``public void putFirst(String value)``

Adds one string value at the front and wakes waiting consumers.

### ``public void putLast(T value)``

Adds one raw-object value at the back and wakes waiting consumers.

### ``public void putLast(int value)``

Adds one integer value at the back and wakes waiting consumers.

### ``public void putLast(String value)``

Adds one string value at the back and wakes waiting consumers.

### ``public T getFirst()``

Returns the front value without removing it and throws when empty.

### ``public T removeFirst()``

Removes and returns the front value and throws when empty.

### ``public T peekFirst()``

Returns the front value without removing it.

### ``public T pollFirst()``

Removes and returns the front value when one is present.

### ``public T removeLast()``

Removes and returns the back value and throws when empty.

### ``public T getLast()``

Returns the back value without removing it and throws when empty.

### ``public T peekLast()``

Returns the back value without removing it.

### ``public T pollLast()``

Removes and returns the back value when one is present.

### ``public boolean removeFirstOccurrence(T value)``

Removes the first matching value when present.

### ``public boolean removeLastOccurrence(T value)``

Removes the last matching value when present.

### ``public void push(T value)``

Pushes one raw-object value at the front and wakes waiting consumers.

### ``public void push(int value)``

Pushes one integer value at the front and wakes waiting consumers.

### ``public void push(String value)``

Pushes one string value at the front and wakes waiting consumers.

### ``public T pop()``

Removes and returns the front value in stack order.

### ``public T takeFirst()``

Waits until a front value becomes available and removes it.

### ``public T takeLast()``

Waits until a back value becomes available and removes it.

### ``public T pollFirst(long timeoutMillis)``

Waits until a front value becomes available or the timeout expires.

### ``public T pollLast(long timeoutMillis)``

Waits until a back value becomes available or the timeout expires.
