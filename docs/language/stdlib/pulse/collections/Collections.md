# pulse.collections.Collections

Kind: ``class``

Source: ``stdlib/src/pulse/collections/Collections.pulse``

## Summary

Collection-oriented utility helpers for the current raw-object self-host bridge.

## Declaration

```pulse
public final class Collections
```

## Members

### ``public static List emptyList()``

Returns an empty mutable list instance.
Use this as the current Java-like empty list helper without implying immutable wrapper semantics.

### ``public static Set emptySet()``

Returns an empty mutable set instance.
Use this as the current Java-like empty set helper without implying immutable wrapper semantics.

### ``public static Map emptyMap()``

Returns an empty mutable map instance.
Use this as the current Java-like empty map helper without implying immutable wrapper semantics.

### ``public static boolean addAll(Collection target, Collection source)``

Adds all values from the supplied source into the target collection.
Use this as the current static bulk-add helper baseline.

### ``public static int frequency(Collection values, Object target)``

Returns how many times the supplied raw-object value appears in the collection.
Use this as the current frequency helper baseline before generics exist.

### ``public static void reverse(List values)``

Reverses the supplied list in place.
Use this as the current static list-order utility baseline.

### ``public static List singletonList(Object value)``

Returns a one-element list containing the supplied value.
Use this as the current singleton list helper baseline.

### ``public static Set singleton(Object value)``

Returns a one-element set containing the supplied value.
Use this as the current singleton set helper baseline.

### ``public static Map singletonMap(Object key, Object value)``

Returns a one-entry map containing the supplied key/value pair.
Use this as the current singleton map helper baseline without implying a live entry-view contract.
