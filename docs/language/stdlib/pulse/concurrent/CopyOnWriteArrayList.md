# pulse.concurrent.CopyOnWriteArrayList

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/CopyOnWriteArrayList.pulse``

## Summary

Copy-on-write list baseline for read-heavy concurrent access.
Reads observe immutable snapshots through atomic publication while writes
clone and replace the backing snapshot under the current monitor floor.

## Declaration

```pulse
public final class CopyOnWriteArrayList<T> implements List<T>
```

## Members

### ``public CopyOnWriteArrayList()``

Creates an empty copy-on-write list.

### ``public int size()``

Returns the number of values stored in the current snapshot.

### ``public boolean isEmpty()``

Reports whether the current snapshot is empty.

### ``public void clear()``

Removes all values by publishing an empty snapshot.

### ``public Iterator iterator()``

Returns an iterator over the current immutable snapshot.

### ``public boolean add(T value)``

Appends one raw-object value by cloning and publishing a new snapshot.

### ``public boolean add(int value)``

Appends one integer value by cloning and publishing a new snapshot.

### ``public boolean add(String value)``

Appends one string value by cloning and publishing a new snapshot.

### ``public boolean contains(T value)``

Reports whether the supplied value is present in the current snapshot.

### ``public boolean contains(int value)``

Reports whether the supplied integer is present in the current snapshot.

### ``public boolean contains(String value)``

Reports whether the supplied string is present in the current snapshot.

### ``public boolean remove(T value)``

Removes the first matching value by cloning and publishing a new snapshot.

### ``public boolean containsAll(Collection<T> values)``

Reports whether every value in the supplied collection is present in the current snapshot.

### ``public boolean addAll(Collection<T> values)``

Adds all values by cloning and publishing a new snapshot.

### ``public boolean removeAll(Collection<T> values)``

Removes all matching values by cloning and publishing a new snapshot.

### ``public boolean retainAll(Collection<T> values)``

Retains only the supplied values by cloning and publishing a new snapshot.

### ``public void add(int index, T value)``

Inserts one raw-object value at the supplied index.

### ``public void add(int index, int value)``

Inserts one integer value at the supplied index.

### ``public void add(int index, String value)``

Inserts one string value at the supplied index.

### ``public T get(int index)``

Returns the value stored at the supplied index in the current snapshot.

### ``public T getFirst()``

Returns the first value stored in the current snapshot.

### ``public T getLast()``

Returns the last value stored in the current snapshot.

### ``public int getInt(int index)``

Returns the integer stored at the supplied index in the current snapshot.

### ``public String getString(int index)``

Returns the string stored at the supplied index in the current snapshot.

### ``public T remove(int index)``

Removes and returns the value stored at the supplied index.

### ``public T set(int index, T value)``

Replaces the value at the supplied index and returns the prior value.

### ``public int set(int index, int value)``

Replaces the integer at the supplied index and returns the prior integer.

### ``public String set(int index, String value)``

Replaces the string at the supplied index and returns the prior string.

### ``public int indexOf(T value)``

Returns the first index containing the supplied value in the current snapshot.

### ``public int indexOf(int value)``

Returns the first index containing the supplied integer in the current snapshot.

### ``public int indexOf(String value)``

Returns the first index containing the supplied string in the current snapshot.

### ``public int lastIndexOf(T value)``

Returns the last index containing the supplied value in the current snapshot.

### ``public int lastIndexOf(int value)``

Returns the last index containing the supplied integer in the current snapshot.

### ``public int lastIndexOf(String value)``

Returns the last index containing the supplied string in the current snapshot.
