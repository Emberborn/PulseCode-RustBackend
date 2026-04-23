# pulse.concurrent.ConcurrentHashSet

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/ConcurrentHashSet.pulse``

## Summary

Monitor-backed concurrent set baseline.
This keeps the current ownership model truthful: operations are serialized
through the shipped monitor floor, and iterator-producing calls return
snapshots rather than exposing a live mutable view across threads.

## Declaration

```pulse
public final class ConcurrentHashSet<T> implements Set<T>
```

## Members

### ``public ConcurrentHashSet()``

Creates an empty concurrent set.

### ``public int size()``

Returns the number of unique values currently stored in the set.

### ``public boolean isEmpty()``

Reports whether the set currently stores any values.

### ``public void clear()``

Removes all values from the set.

### ``public boolean add(T value)``

Adds one raw-object value when it is not already present.

### ``public boolean add(String value)``

Adds one string value when it is not already present.

### ``public boolean contains(T value)``

Reports whether the supplied raw-object value is present.

### ``public boolean contains(String value)``

Reports whether the supplied string value is present.

### ``public boolean remove(T value)``

Removes the supplied raw-object value when it is present.

### ``public boolean remove(String value)``

Removes the supplied string value when it is present.

### ``public boolean containsAll(Collection<T> values)``

Reports whether every supplied value is present.

### ``public boolean addAll(Collection<T> values)``

Adds all supplied values into the set.

### ``public boolean removeAll(Collection<T> values)``

Removes every supplied value from the set.

### ``public boolean retainAll(Collection<T> values)``

Retains only the supplied values in the set.

### ``public Iterator iterator()``

Returns a snapshot iterator over the current set contents.
