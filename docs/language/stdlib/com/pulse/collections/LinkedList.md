# com.pulse.collections.LinkedList

Kind: ``class``

Source: ``stdlib/src/com/pulse/collections/LinkedList.pulse``

## Summary

Runtime-backed linked-list style container and queue/deque facade.

## Declaration

```pulse
class LinkedList implements Collection, List, Queue, Deque
```

## Members

### ``public LinkedList()``

Creates an empty linked-list style container with queue and deque state.
Use this when one structure needs list, queue, or deque operations.

### ``public int size()``

Returns the number of list values currently stored.
Use this before indexed access or emptiness checks on the list lane.

### ``public boolean isEmpty()``

Reports whether the structure currently holds any values in its active lanes.
Use this as the common emptiness check for list/queue/deque-style use.

### ``public void clear()``

Removes all list, queue, and deque state from this container.
Use this to fully reset the structure for reuse.

### ``public void add(int value)``

Appends an integer to the list lane.
Use this when treating the structure as a list of ints.

### ``public void add(String value)``

Appends a string to the list lane.
Use this when treating the structure as a list of strings.

### ``public int getInt(int index)``

Returns the integer stored at the supplied list index.
Use this for indexed primitive reads from the list lane.

### ``public String getString(int index)``

Returns the string stored at the supplied list index.
Use this for indexed text reads from the list lane.

### ``public void offer(int value)``

Adds a value at the tail of the queue lane.
Use this when treating the structure as a FIFO queue.

### ``public int poll()``

Removes and returns the head value from the queue lane.
Use this when consuming FIFO values.

### ``/**``

Reports whether the deque lane is empty.
Use this before deque removals when code must avoid empty-structure failures.

### ``public void addFirst(int value)``

Adds a value at the front of the deque lane.
Use this for head-first deque insertion.

### ``public void addLast(int value)``

Adds a value at the back of the deque lane.
Use this for tail-first deque insertion.

### ``public int removeFirst()``

Removes and returns the front value from the deque lane.
Use this when consuming values from the head of the deque.

### ``public int removeLast()``

Removes and returns the back value from the deque lane.
Use this when consuming values from the tail of the deque.
