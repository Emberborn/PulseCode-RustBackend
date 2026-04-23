# pulse.concurrent.ConcurrentHashMap

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/ConcurrentHashMap.pulse``

## Summary

Monitor-backed concurrent map baseline.
This chooses truthful thread-safety over Java-level striping complexity:
all operations are serialized through the current monitor floor, and
iterator/view-producing methods return snapshots rather than exposing
unsynchronized live views.

## Declaration

```pulse
public final class ConcurrentHashMap<K, V> implements Map<K, V>
```

## Members

### ``public ConcurrentHashMap()``

Creates an empty concurrent map.

### ``public int size()``

Returns the number of entries currently stored in the map.

### ``public boolean isEmpty()``

Reports whether the map currently stores any entries.

### ``public void clear()``

Removes all entries from the map.

### ``public boolean containsKey(K key)``

Reports whether the supplied key is present in the map.

### ``public boolean containsKey(String key)``

Reports whether the supplied string key is present in the map.

### ``public boolean containsValue(V value)``

Reports whether the supplied value is present in the map.

### ``public boolean containsValue(String value)``

Reports whether the supplied string value is present in the map.

### ``public boolean containsValue(int value)``

Reports whether the supplied integer value is present in the map.

### ``public V put(K key, V value)``

Stores one value under the supplied key and returns the prior value.

### ``public void putInt(String key, int value)``

Stores one integer value under the supplied string key.

### ``public void putAll(Map<K, V> other)``

Copies all entries from the supplied map into this map.

### ``public V putIfAbsent(K key, V value)``

Stores a value only when the supplied key is not already present.

### ``public String putIfAbsent(String key, String value)``

Stores a string value only when the supplied string key is not already present.

### ``public V replace(K key, V value)``

Replaces the value stored under the supplied key.

### ``public String replace(String key, String value)``

Replaces the string value stored under the supplied key.

### ``public V remove(K key)``

Removes the entry stored for the supplied key.

### ``public V get(K key)``

Returns the value stored for the supplied key.

### ``public int getInt(String key)``

Returns the integer value stored for the supplied key.

### ``public V getOrDefault(K key, V fallback)``

Returns the stored value for the supplied key or the fallback when absent.

### ``public String getOrDefault(String key, String fallback)``

Returns the stored string value for the supplied key or the fallback when absent.

### ``public int getIntOrDefault(String key, int fallback)``

Returns the stored integer value for the supplied key or the fallback when absent.

### ``public Iterator keyIterator()``

Returns a snapshot iterator over the current keys.

### ``public Set<MapEntry> entrySet()``

Returns a copy-style entry-set snapshot for the current entries.

### ``public Set<K> keySet()``

Returns a snapshot key set for the current entries.

### ``public Collection<V> values()``

Returns a snapshot values collection for the current entries.
