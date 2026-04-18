# aden.collections.HashSet

Kind: ``class``

Source: ``stdlib/src/aden/collections/HashSet.aden``

## Summary

Unique-value set implementation built on the raw-object map baseline.

## Declaration

```aden
public class HashSet<T> implements Set<T>
```

## Members

### ``public HashSet()``

Creates an empty set.

### ``public int size()``

Returns the number of unique values in the set.

### ``public boolean isEmpty()``

Reports whether the set currently stores any values.

### ``public void clear()``

Removes all values from the set.

### ``private boolean addValue(Object value)``

Adds one raw-object value without routing through public overloads.

### ``private String copyStringValue(String value)``

Creates an owned string copy for bulk-copy helper paths.

### ``private boolean addCopiedValue(Object value)``

Copies one iterated value into the current stable helper lane when possible.

### ``private boolean containsValue(Object value)``

Reports whether the supplied raw-object value is present without routing through public overloads.

### ``public boolean add(T value)``

Adds one raw-object value to the set when it is not already present.

### ``public boolean addAll(Collection<T> values)``

Adds all values exposed by the supplied collection into this set.

### ``public boolean add(String value)``

Adds one string value to the set.

### ``public boolean remove(T value)``

Removes the supplied raw-object value when it is present.

### ``public boolean remove(String value)``

Removes the supplied string value when it is present.

### ``public boolean containsAll(Collection<T> values)``

Reports whether every value in the supplied collection is present in this set.

### ``public boolean removeAll(Collection<T> values)``

Removes every value in the supplied collection from this set.

### ``public boolean retainAll(Collection<T> values)``

Retains only the values from the supplied collection in this set.

### ``public boolean contains(T value)``

Reports whether the supplied raw-object value is present in the set.

### ``public boolean contains(String value)``

Reports whether the supplied string value is present in the set.

### ``public Iterator iterator()``

Returns an iterator over the currently stored set values.
