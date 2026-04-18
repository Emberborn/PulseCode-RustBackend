# aden.util.Optional

Kind: ``class``

Source: ``stdlib/src/aden/util/Optional.aden``

## Summary

Lightweight Java-like optional container for explicit presence-or-absence flows.

## Declaration

```aden
public final class Optional<T>
```

## Members

### ``public static Optional empty()``

Returns an empty optional.
Use this for explicit no-value flows instead of null sentinels.

### ``public static Optional of(Object value)``

Returns an optional containing the supplied non-null value.
Use this for Java-like explicit presence flows with required values.

### ``public static Optional ofNullable(Object value)``

Returns an optional containing the supplied value when non-null, otherwise an empty optional.
Use this for null-to-optional conversion without manual branches.

### ``public boolean isPresent()``

Reports whether a value is present.

### ``public boolean isEmpty()``

Reports whether no value is present.

### ``public T get()``

Returns the stored value and panics when empty.

### ``public T orElse(T other)``

Returns the stored value when present, otherwise the supplied fallback.

### ``public T orNull()``

Returns the stored value when present, otherwise null.

### ``public String toString()``

Returns a Java-like string form describing presence or absence.

### ``public boolean equals(Object other)``

Compares this optional with another optional using presence and contained-value equality.

### ``public int hashCode()``

Returns a presence-aware hash code.
