# aden.collections.LinkedList

Kind: ``class``

Source: ``stdlib/src/aden/collections/LinkedList.aden``

## Summary

Linked-list style container with raw-object list/queue/deque behavior.

## Declaration

```aden
public class LinkedList<T> implements List<T>, Deque<T>
```

## Members

### ``public LinkedList()``

Creates an empty linked-list style container.

### ``public int size()``

Returns the number of values currently stored in the sequence.

### ``public Iterator iterator()``

Returns an iterator over the current sequence values.

### ``public boolean isEmpty()``

Reports whether the sequence currently holds any values.

### ``public void clear()``

Removes all list, queue, and deque state from this container.

### ``private boolean valuesEqual(Object left, Object right)``

Compares two values using Java-like null-safe equality.

### ``private boolean appendValue(Object value)``

Appends one raw-object value without routing through public overloads.

### ``private boolean appendIntValue(int value)``

Appends one integer helper value without routing through public overloads.

### ``private void insertValue(int index, Object value)``

Inserts one raw-object value without routing through public overloads.

### ``private void insertIntValue(int index, int value)``

Inserts one integer helper value without routing through public overloads.

### ``private Object replaceValue(int index, Object value)``

Replaces one raw-object value without routing through public overloads.

### ``private int replaceIntValue(int index, int value)``

Replaces one integer helper value without routing through public overloads.

### ``private int findIndex(Object value)``

Returns the first index containing the supplied raw-object value.

### ``private int findIntIndex(int value)``

Returns the first index containing the supplied integer helper value.

### ``private int findLastIndex(Object value)``

Returns the last index containing the supplied raw-object value.

### ``private int findLastIntIndex(int value)``

Returns the last index containing the supplied integer helper value.

### ``private Object unlinkNode(LinkedListNode node)``

Unlinks the supplied node from the sequence and returns its value.

### ``private void prependValue(Object value)``

Adds one raw-object value at the front without routing through public overloads.

### ``private void prependIntValue(int value)``

Adds one integer helper value at the front without routing through public overloads.

### ``private String copyStringValue(String value)``

Creates an owned string copy for bulk-copy helper paths.

### ``private boolean addCopiedValue(Object value)``

Copies one iterated value into the current stable helper lane when possible.

### ``private LinkedListNode nodeAt(int index)``

Returns the node at the supplied index.

### ``public boolean add(T value)``

Appends one raw-object value to the sequence.

### ``public boolean add(int value)``

Appends an integer to the sequence.

### ``public boolean add(String value)``

Appends a string to the sequence.

### ``public boolean addAll(Collection<T> values)``

Appends all values exposed by the supplied collection to the sequence.

### ``public boolean containsAll(Collection<T> values)``

Reports whether every value in the supplied collection is present in the sequence.

### ``public boolean removeAll(Collection<T> values)``

Removes every value in the supplied collection from the sequence.

### ``public boolean retainAll(Collection<T> values)``

Retains only the values from the supplied collection in the sequence.

### ``public void add(int index, T value)``

Inserts one raw-object value at the supplied index.

### ``public void add(int index, int value)``

Inserts an integer at the supplied index.

### ``public void add(int index, String value)``

Inserts a string at the supplied index.

### ``public T get(int index)``

Returns the raw-object value stored at the supplied index.

### ``public int getInt(int index)``

Returns the integer stored at the supplied index.

### ``public String getString(int index)``

Returns the string stored at the supplied index.

### ``public T remove(int index)``

Removes and returns the raw-object value stored at the supplied index.

### ``public boolean remove(T value)``

Removes the first matching raw-object value from the sequence.

### ``public T set(int index, T value)``

Replaces the value at the supplied index and returns the prior value.

### ``public int set(int index, int value)``

Replaces the value at the supplied index with an integer and returns the prior integer.

### ``public String set(int index, String value)``

Replaces the value at the supplied index with a string and returns the prior string.

### ``public boolean contains(T value)``

Reports whether the supplied value is present in the sequence.

### ``public boolean contains(int value)``

Reports whether the supplied integer is present in the sequence.

### ``public boolean contains(String value)``

Reports whether the supplied string is present in the sequence.

### ``public int indexOf(T value)``

Returns the first index containing the supplied value.

### ``public int indexOf(int value)``

Returns the first index containing the supplied integer.

### ``public int indexOf(String value)``

Returns the first index containing the supplied string.

### ``public int lastIndexOf(T value)``

Returns the last index containing the supplied value.

### ``public int lastIndexOf(int value)``

Returns the last index containing the supplied integer.

### ``public int lastIndexOf(String value)``

Returns the last index containing the supplied string.

### ``public boolean offer(T value)``

Adds one raw-object value at the tail of the queue.

### ``public boolean offer(int value)``

Adds one primitive value at the tail of the queue.

### ``public boolean offer(String value)``



### ``public T poll()``

Removes and returns the head value from the queue.

### ``public T remove()``

Removes and returns the head value from the queue and panics when empty.

### ``public T peek()``

Returns the head value from the queue without removing it.

### ``public T element()``

Returns the head value from the queue without removing it and panics when empty.

### ``public void addFirst(T value)``

Adds one raw-object value at the front of the deque.

### ``public boolean offerFirst(T value)``

Offers one raw-object value at the front of the deque.

### ``public void addFirst(int value)``

Adds one primitive value at the front of the deque.

### ``public void addFirst(String value)``



### ``public boolean offerFirst(int value)``

Offers one primitive value at the front of the deque.

### ``public boolean offerFirst(String value)``



### ``public void addLast(T value)``

Adds one raw-object value at the back of the deque.

### ``public boolean offerLast(T value)``

Offers one raw-object value at the back of the deque.

### ``public void addLast(int value)``

Adds one primitive value at the back of the deque.

### ``public void addLast(String value)``



### ``public boolean offerLast(int value)``

Offers one primitive value at the back of the deque.

### ``public boolean offerLast(String value)``



### ``public T getFirst()``

Returns the front value from the deque without removing it and panics when empty.

### ``public T removeFirst()``

Removes and returns the front value from the deque.

### ``public T peekFirst()``

Returns the front value from the deque without removing it.

### ``public T pollFirst()``

Removes and returns the front value from the deque without panicking when empty.

### ``public T removeLast()``

Removes and returns the back value from the deque.

### ``public T getLast()``

Returns the back value from the deque without removing it and panics when empty.

### ``public T peekLast()``

Returns the back value from the deque without removing it.

### ``public T pollLast()``

Removes and returns the back value from the deque without panicking when empty.

### ``public boolean removeFirstOccurrence(T value)``

Removes the first matching value from the deque.

### ``public boolean removeLastOccurrence(T value)``

Removes the last matching value from the deque.

### ``public void push(T value)``

Pushes one raw-object value onto the front of the deque.

### ``public void push(int value)``

Pushes one primitive value onto the front of the deque.

### ``public void push(String value)``



### ``public T pop()``

Removes and returns the front value in stack order.
