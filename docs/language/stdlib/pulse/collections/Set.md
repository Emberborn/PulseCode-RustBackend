# pulse.collections.Set

Kind: ``interface``

Source: ``stdlib/src/pulse/collections/Set.pulse``

## Summary

Unique-value collection contract.

## Declaration

```pulse
interface Set<T> extends Collection<T>
```

## Members

### ``boolean remove(T value);``

Removes the supplied raw-object value when it is present.
Use this as the raw-object set removal baseline before generics are available.

### ``boolean add(String value);``

Adds a string value to the set if it is not already present.
Use this as the current string convenience overload.

### ``boolean remove(String value);``

Removes the supplied string value when it is present.
Use this as the current string convenience overload.

### ``boolean contains(String value);``

Reports whether the supplied string is present in the set.
Use this as the current string convenience overload.
