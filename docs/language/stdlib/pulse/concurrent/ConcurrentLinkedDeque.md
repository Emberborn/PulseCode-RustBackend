# pulse.concurrent.ConcurrentLinkedDeque

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/ConcurrentLinkedDeque.pulse``

## Summary

Monitor-backed concurrent deque baseline.
This gives the current self-hosting floor a non-blocking double-ended queue
that stays truthful about synchronization and snapshot iteration.

## Declaration

```pulse
public final class ConcurrentLinkedDeque<T> implements Deque<T>
```

## Members

### ``public ConcurrentLinkedDeque()``

Creates an empty concurrent deque.

### ``public int size()``

Returns the current number of values stored in the deque.

### ``public boolean isEmpty()``

Reports whether the deque is currently empty.

### ``public void clear()``

Removes all values from the deque.

### ``public boolean add(T value)``

Adds one raw-object value at the tail of the deque.

### ``public boolean contains(T value)``

Reports whether the supplied value is present.

### ``public boolean remove(T value)``

Removes the first matching value when present.

### ``public boolean containsAll(Collection<T> values)``

Reports whether every supplied value is present.

### ``public boolean addAll(Collection<T> values)``

Adds all supplied values into the deque.

### ``public boolean removeAll(Collection<T> values)``

Removes every supplied value from the deque.

### ``public boolean retainAll(Collection<T> values)``

Retains only the supplied values in the deque.

### ``public Iterator iterator()``

Returns a snapshot iterator over the current deque contents.

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

### ``public void addFirst(T value)``

Adds one raw-object value at the front.

### ``public boolean offerFirst(T value)``

Offers one raw-object value at the front.

### ``public void addFirst(int value)``

Adds one integer value at the front.

### ``public void addFirst(String value)``

Adds one string value at the front.

### ``public boolean offerFirst(int value)``

Offers one integer value at the front.

### ``public boolean offerFirst(String value)``

Offers one string value at the front.

### ``public void addLast(T value)``

Adds one raw-object value at the back.

### ``public boolean offerLast(T value)``

Offers one raw-object value at the back.

### ``public void addLast(int value)``

Adds one integer value at the back.

### ``public void addLast(String value)``

Adds one string value at the back.

### ``public boolean offerLast(int value)``

Offers one integer value at the back.

### ``public boolean offerLast(String value)``

Offers one string value at the back.

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

Pushes one raw-object value onto the front.

### ``public void push(int value)``

Pushes one integer value onto the front.

### ``public void push(String value)``

Pushes one string value onto the front.

### ``public T pop()``

Removes and returns the front value in stack order.
