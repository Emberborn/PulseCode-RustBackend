# pulse.collections.HashMap

Kind: ``class``

Source: ``stdlib/src/pulse/collections/HashMap.pulse``

## Summary

Mutable map implementation with a raw-object key/value baseline.

## Declaration

```pulse
public class HashMap<K, V> implements Map<K, V>
```

## Members

### ``public HashMap()``

Creates an empty map.

### ``public int size()``

Returns the number of entries currently stored in the map.

### ``public boolean isEmpty()``

Reports whether the map currently stores any entries.

### ``public void clear()``

Removes all entries from the map.

### ``private boolean keysEqual(Object left, Object right)``

Compares two keys using Java-like null-safe equality.

### ``private boolean valuesEqual(Object left, Object right)``

Compares two values using the current raw-object plus helper-lane equality baseline.

### ``private HashMapEntry entryFor(Object key)``

Returns the entry storing the supplied key, or null when absent.

### ``private boolean containsObjectKey(Object key)``

Reports whether the supplied raw-object key is present without routing through public overloads.

### ``private boolean containsObjectValue(Object value)``

Reports whether the supplied raw-object value is present without routing through public overloads.

### ``private Object putObjectValue(Object key, Object value)``

Stores one raw-object key/value pair without routing through public overloads.

### ``private void putIntValue(String key, int value)``

Stores one int helper value under the supplied key.

### ``private boolean hasIntValueForKey(String key)``

Reports whether the supplied string key currently stores an int helper value.

### ``private int getIntValueForKey(String key)``

Returns the int helper value stored under the supplied string key.

### ``private Object getObjectValue(Object key)``

Returns one raw-object value without routing through public overloads.

### ``private Object removeObjectValue(Object key)``

Removes one entry for the supplied key without routing through public overloads.

### ``private Object readEntryValue(HashMapEntry entry)``

Reads the current entry value through the compatibility helper lanes.

### ``public boolean containsKey(K key)``

Reports whether the supplied key is present in the map.

### ``public boolean containsKey(String key)``

Reports whether the supplied string key is present in the map.

### ``public boolean containsValue(V value)``

Reports whether the supplied value is present in the map.

### ``public boolean containsValue(String value)``

Reports whether the supplied string value is present in the map.

### ``public boolean containsValue(int value)``

Reports whether the supplied integer helper value is present in the map.

### ``public boolean removeValue(V value)``

Removes the first entry storing the supplied value and reports whether one was removed.

### ``public V put(K key, V value)``

Stores a value under the supplied key and returns the prior value.

### ``public void putInt(String key, int value)``

Stores an integer value under the supplied string key.

### ``public void putAll(Map<K, V> other)``

Copies all entries from the supplied map into this map.

### ``public V putIfAbsent(K key, V value)``

Stores a value only when the supplied key is not already present and returns the prior value.

### ``public String putIfAbsent(String key, String value)``

Stores a string value only when the supplied key is not already present and returns the prior string value.

### ``public V replace(K key, V value)``

Replaces the value stored under the supplied key and returns the prior value when present.

### ``public String replace(String key, String value)``

Replaces the string value stored under the supplied key and returns the prior string value when present.

### ``public V remove(K key)``

Removes the entry stored for the supplied key and returns the prior value.

### ``public V get(K key)``

Returns the value stored for the supplied key.

### ``public int getInt(String key)``

Returns the integer value stored for the supplied string key.

### ``public V getOrDefault(K key, V fallback)``

Returns the stored value for the supplied key or the fallback when absent.

### ``public String getOrDefault(String key, String fallback)``

Returns the stored string value for the supplied key or the fallback when absent.

### ``public int getIntOrDefault(String key, int fallback)``

Returns the stored integer value for the supplied key or the fallback when absent.

### ``public Iterator keyIterator()``

Returns an iterator over the currently stored keys.

### ``public Set<MapEntry> entrySet()``

Returns a copy-style set view of the currently stored entries.

### ``public Set<K> keySet()``

Returns a live set view of the currently stored keys.

### ``public Collection<V> values()``

Returns a live collection view of the currently stored values.
