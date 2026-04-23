# pulse.collections.Map

Kind: ``interface``

Source: ``stdlib/src/pulse/collections/Map.pulse``

## Summary

Mutable key/value map contract.

## Declaration

```pulse
public interface Map<K, V>
```

## Members

### ``int size();``

Returns the number of entries currently stored in the map.
Use this for sizing checks or emptiness decisions.

### ``boolean isEmpty();``

Reports whether the map currently stores any entries.
Use this as the baseline emptiness check before keyed reads or writes.

### ``void clear();``

Removes all entries from the map.
Use this to reuse a mutable map instance.

### ``boolean containsKey(K key);``

Reports whether the supplied key is present in the map.
Use this as the raw-object key baseline before generics are available.

### ``boolean containsKey(String key);``

Reports whether the supplied string key is present in the map.
Use this as the current string-key convenience overload.

### ``boolean containsValue(V value);``

Reports whether the supplied value is present in the map.
Use this as the raw-object value-query baseline before generics are available.

### ``boolean containsValue(String value);``

Reports whether the supplied string value is present in the map.
Use this as the current string-value convenience overload.

### ``boolean containsValue(int value);``

Reports whether the supplied integer helper value is present in the map.
Use this as the current primitive-value convenience overload.

### ``V put(K key, V value);``

Stores a value under the supplied key and returns the prior value.
Use this as the raw-object map mutation baseline before generics are available.

### ``void putInt(String key, int value);``

Stores an integer value under the supplied string key.
Use this as the current primitive convenience overload.

### ``void putAll(Map<K, V> other);``

Copies all entries from the supplied map into this map.
Use this as the current bulk map-mutation baseline before richer generic helpers exist.

### ``V putIfAbsent(K key, V value);``

Stores a value only when the supplied key is not already present and returns the prior value.
Use this as the current conditional map-mutation baseline before richer generic helpers exist.

### ``String putIfAbsent(String key, String value);``

Stores a string value only when the supplied string key is not already present and returns the prior string value.
Use this as the current string-key convenience overload.

### ``V replace(K key, V value);``

Replaces the value stored under the supplied key and returns the prior value when present.
Use this as the current conditional map-update baseline before richer generic helpers exist.

### ``String replace(String key, String value);``

Replaces the string value stored under the supplied string key and returns the prior string value when present.
Use this as the current string-key convenience overload.

### ``V remove(K key);``

Removes the entry stored for the supplied key and returns the prior value.
Use this as the raw-object map removal baseline before generics are available.

### ``V get(K key);``

Returns the value stored for the supplied key.
Use this as the raw-object map read baseline before generics are available.

### ``int getInt(String key);``

Returns the integer value stored for the supplied string key.
Use this as the current primitive convenience overload.

### ``V getOrDefault(K key, V fallback);``

Returns the stored value for the supplied key or the fallback when absent.
Use this as the current defaulted raw-object read baseline before richer generic helpers exist.

### ``String getOrDefault(String key, String fallback);``

Returns the stored string value for the supplied key or the fallback when absent.
Use this as the current string-key convenience overload.

### ``int getIntOrDefault(String key, int fallback);``

Returns the stored integer value for the supplied key or the fallback when absent.
Use this as the current primitive convenience overload.

### ``Iterator keyIterator();``

Returns an iterator over the currently stored keys.
Use this as the current non-fail-fast map iteration baseline before richer view families exist.

### ``Set<MapEntry> entrySet();``

Returns a copy-style set view of the currently stored entries.
Use this as the current selected entry-view baseline without implying a live nested Java view contract.

### ``Set<K> keySet();``

Returns a live set view of the currently stored keys.
Use this as the current selected key-view baseline with non-fail-fast live-view semantics.

### ``Collection<V> values();``

Returns a live collection view of the currently stored values.
Use this as the current selected value-view baseline with non-fail-fast live-view semantics.
