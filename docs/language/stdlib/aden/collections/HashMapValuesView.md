# aden.collections.HashMapValuesView

Kind: ``class``

Source: ``stdlib/src/aden/collections/HashMapValuesView.aden``

## Summary

Live values view backed directly by the current hash map state.

## Declaration

```aden
final class HashMapValuesView<T> implements Collection<T>
```

## Members

### ``public HashMapValuesView(HashMap map)``

Creates a live values view over the supplied map.

### ``public int size()``

Returns the current number of values visible through this live view.

### ``public boolean isEmpty()``

Reports whether this live view is currently empty.

### ``public void clear()``

Clears the backing map through this live values view.

### ``public boolean add(T value)``

Rejects direct value insertion through the live values view.

### ``public boolean contains(T value)``

Reports whether the backing map currently stores the supplied value.

### ``public boolean remove(T value)``

Removes the first matching value from the backing map when present.

### ``public boolean containsAll(Collection<T> values)``

Reports whether all supplied values are currently present.

### ``public boolean addAll(Collection<T> values)``

Rejects bulk insertion through the live values view.

### ``public boolean removeAll(Collection<T> values)``

Removes every matching supplied value from the backing map.

### ``public boolean retainAll(Collection<T> values)``

Retains only the values also present in the supplied collection.

### ``public Iterator iterator()``

Returns a live iterator over the current backing-map values.
