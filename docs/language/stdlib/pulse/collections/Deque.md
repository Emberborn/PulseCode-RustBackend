# pulse.collections.Deque

Kind: ``interface``

Source: ``stdlib/src/pulse/collections/Deque.pulse``

## Summary

Double-ended queue contract for front and back operations.

## Declaration

```pulse
public interface Deque<T> extends Queue<T>
```

## Members

### ``void addFirst(T value);``

Adds a value at the front of the deque.
Use this as the raw-object front insertion baseline before generics are available.

### ``boolean offerFirst(T value);``

Offers a value at the front of the deque.
Use this as the raw-object front insertion helper baseline before generics are available.

### ``void addFirst(int value);``

Adds a primitive value at the front of the deque.
Use this as the current primitive convenience overload.

### ``void addFirst(String value);``

Adds a string value at the front of the deque.
Use this as the current string convenience overload.

### ``boolean offerFirst(int value);``

Offers a primitive value at the front of the deque.
Use this as the current primitive convenience overload.

### ``boolean offerFirst(String value);``

Offers a string value at the front of the deque.
Use this as the current string convenience overload.

### ``void addLast(T value);``

Adds a value at the back of the deque.
Use this as the raw-object back insertion baseline before generics are available.

### ``boolean offerLast(T value);``

Offers a value at the back of the deque.
Use this as the raw-object back insertion helper baseline before generics are available.

### ``void addLast(int value);``

Adds a primitive value at the back of the deque.
Use this as the current primitive convenience overload.

### ``void addLast(String value);``

Adds a string value at the back of the deque.
Use this as the current string convenience overload.

### ``boolean offerLast(int value);``

Offers a primitive value at the back of the deque.
Use this as the current primitive convenience overload.

### ``boolean offerLast(String value);``

Offers a string value at the back of the deque.
Use this as the current string convenience overload.

### ``T getFirst();``

Returns the front value without removing it and panics when empty.
Use this as the raw-object front read helper baseline before generics are available.

### ``T removeFirst();``

Removes and returns the front value.
Use this as the raw-object front removal baseline before generics are available.

### ``T peekFirst();``

Returns the front value without removing it.
Use this as the raw-object front peek baseline before generics are available.

### ``T pollFirst();``

Removes and returns the front value without panicking on an empty deque.
Use this as the raw-object front poll baseline before generics are available.

### ``T removeLast();``

Removes and returns the back value.
Use this as the raw-object back removal baseline before generics are available.

### ``T getLast();``

Returns the back value without removing it and panics when empty.
Use this as the raw-object back read helper baseline before generics are available.

### ``T peekLast();``

Returns the back value without removing it.
Use this as the raw-object back peek baseline before generics are available.

### ``T pollLast();``

Removes and returns the back value without panicking on an empty deque.
Use this as the raw-object back poll baseline before generics are available.

### ``boolean removeFirstOccurrence(T value);``

Removes the first matching value from the deque.
Use this as the raw-object front-biased occurrence-removal baseline before generics are available.

### ``boolean removeLastOccurrence(T value);``

Removes the last matching value from the deque.
Use this as the raw-object back-biased occurrence-removal baseline before generics are available.

### ``void push(T value);``

Pushes a value onto the front of the deque.
Use this as the raw-object stack-style helper baseline before generics are available.

### ``void push(int value);``

Pushes a primitive value onto the front of the deque.
Use this as the current primitive convenience overload.

### ``void push(String value);``

Pushes a string value onto the front of the deque.
Use this as the current string convenience overload.

### ``T pop();``

Removes and returns the front value in stack order.
Use this as the raw-object stack-style pop baseline before generics are available.
