# aden.collections.HashMapKeySetView

Kind: ``class``

Source: ``stdlib/src/aden/collections/HashMapKeySetView.aden``

## Summary

Live key-set view backed directly by the current hash map state.

## Declaration

```aden
final class HashMapKeySetView<T> implements Set<T>
```

## Members

### ``public HashMapKeySetView(HashMap map)``

Creates a live key-set view over the supplied map.

### ``public int size()``

Returns the current number of keys visible through this live view.

### ``public boolean isEmpty()``

Reports whether this live key-set view is currently empty.

### ``public void clear()``

Clears the backing map through this live key-set view.

### ``public boolean add(T value)``

Rejects direct key insertion through the live key-set view.

### ``public boolean add(String value)``

Rejects direct string-key insertion through the live key-set view.

### ``public boolean contains(T value)``

Reports whether the supplied key is currently present.

### ``public boolean contains(String value)``

Reports whether the supplied string key is currently present.

### ``public boolean remove(T value)``

Removes the supplied key from the backing map when present.

### ``public boolean remove(String value)``

Removes the supplied string key from the backing map when present.

### ``public boolean containsAll(Collection<T> values)``

Reports whether all supplied keys are currently present.

### ``public boolean addAll(Collection<T> values)``

Rejects bulk insertion through the live key-set view.

### ``public boolean removeAll(Collection<T> values)``

Removes each supplied key from the backing map when present.

### ``public boolean retainAll(Collection<T> values)``

Retains only the keys also present in the supplied collection.

### ``public Iterator iterator()``

Returns a live iterator over the current backing-map keys.
