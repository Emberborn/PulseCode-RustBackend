# com.pulse.collections.Deque

Kind: ``interface``

Source: ``stdlib/src/com/pulse/collections/Deque.pulse``

## Summary

Double-ended queue contract for front and back operations.

## Declaration

```pulse
interface Deque
```

## Members

### ``void addFirst(int value);``

Adds a value at the front of the deque.
Use this when code needs stack-like front insertion.

### ``void addLast(int value);``

Adds a value at the back of the deque.
Use this when code needs queue-like tail insertion.

### ``int removeFirst();``

Removes and returns the front value.
Use this when consuming values from the head of the deque.

### ``int removeLast();``

Removes and returns the back value.
Use this when consuming values from the tail of the deque.

### ``boolean isEmpty();``

Reports whether the deque currently holds any values.
Use this before removals when code must avoid empty-deque failures.
