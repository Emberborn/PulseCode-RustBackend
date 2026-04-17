# pulse.collections.ArrayList

Kind: ``class``

Source: ``stdlib/src/pulse/collections/ArrayList.pulse``

## Summary

Resizable list implementation that currently delegates to the raw-object linked list baseline.

## Declaration

```pulse
public class ArrayList<T> implements List<T>
```

## Members

### ``private void requireElementIndex(int index)``

Panics unless the supplied index points at an existing element.

### ``private void requireInsertIndex(int index)``

Panics unless the supplied index is valid for an insertion point.

### ``public ArrayList()``

Creates an empty resizable list.

### ``public int size()``

Returns the number of values stored in the list.

### ``public Iterator iterator()``

Returns an iterator over the current list values.

### ``public boolean isEmpty()``

Reports whether the list currently stores any values.

### ``public void clear()``

Removes all values from the list.

### ``public boolean add(T value)``

Appends one raw-object value to the list.

### ``public boolean add(int value)``

Appends one primitive integer to the list.

### ``public boolean add(String value)``

Appends one string to the list.

### ``public boolean addAll(Collection<T> values)``

Appends all values exposed by the supplied collection to the list.

### ``public boolean containsAll(Collection<T> values)``

Reports whether every value in the supplied collection is present in the list.

### ``public boolean removeAll(Collection<T> values)``

Removes every value in the supplied collection from the list.

### ``public boolean retainAll(Collection<T> values)``

Retains only the values from the supplied collection in the list.

### ``public void add(int index, T value)``

Inserts one raw-object value at the supplied index.

### ``public void add(int index, int value)``

Inserts one primitive integer at the supplied index.

### ``public void add(int index, String value)``

Inserts one string at the supplied index.

### ``public T get(int index)``

Returns the raw-object value stored at the supplied index.

### ``public T getFirst()``

Returns the first raw-object value stored in the list.

### ``public T getLast()``

Returns the last raw-object value stored in the list.

### ``public int getInt(int index)``

Returns the integer stored at the supplied index.

### ``public String getString(int index)``

Returns the string stored at the supplied index.

### ``public T remove(int index)``

Removes and returns the raw-object value stored at the supplied index.

### ``public boolean remove(T value)``

Removes the first matching raw-object value from the list.

### ``public T set(int index, T value)``

Replaces the value at the supplied index and returns the prior value.

### ``public int set(int index, int value)``

Replaces the value at the supplied index with an integer and returns the prior integer.

### ``public String set(int index, String value)``

Replaces the value at the supplied index with a string and returns the prior string.

### ``public boolean contains(T value)``

Reports whether the supplied raw-object value is present in the list.

### ``public boolean contains(int value)``

Reports whether the supplied integer is present in the list.

### ``public boolean contains(String value)``

Reports whether the supplied string is present in the list.

### ``public int indexOf(T value)``

Returns the first index containing the supplied raw-object value.

### ``public int indexOf(int value)``

Returns the first index containing the supplied integer.

### ``public int indexOf(String value)``

Returns the first index containing the supplied string.

### ``public int lastIndexOf(T value)``

Returns the last index containing the supplied raw-object value.

### ``public int lastIndexOf(int value)``

Returns the last index containing the supplied integer.

### ``public int lastIndexOf(String value)``

Returns the last index containing the supplied string.
