# aden.collections.List

Kind: ``interface``

Source: ``stdlib/src/aden/collections/List.aden``

## Summary

Indexed collection contract for ordered values.

## Declaration

```aden
interface List<T> extends Collection<T>
```

## Members

### ``boolean add(int value);``

Appends an integer value to the list.
Use this as the current primitive convenience overload.

### ``boolean add(String value);``

Appends a string value to the list.
Use this as the current string convenience overload.

### ``void add(int index, T value);``

Inserts an object value at the supplied index.
Use this as the raw-object indexed insertion baseline before generics are available.

### ``void add(int index, int value);``

Inserts an integer at the supplied index and shifts later values right.
Use this as the current primitive convenience overload.

### ``void add(int index, String value);``

Inserts a string at the supplied index and shifts later values right.
Use this as the current string convenience overload.

### ``T get(int index);``

Returns the value at the supplied index.
Use this as the raw-object read baseline before generics are available.

### ``T getFirst();``

Returns the first value stored in the list and panics when empty.
Use this as the raw-object front-read helper baseline before generics are available.

### ``T getLast();``

Returns the last value stored in the list and panics when empty.
Use this as the raw-object back-read helper baseline before generics are available.

### ``int getInt(int index);``

Returns the integer at the supplied index.
Use this as the current primitive convenience overload.

### ``String getString(int index);``

Returns the string at the supplied index.
Use this as the current string convenience overload.

### ``T remove(int index);``

Removes and returns the value at the supplied index.
Use this as the raw-object indexed removal baseline before generics are available.

### ``boolean remove(T value);``

Removes the first matching value from the list.
Use this as the raw-object value-removal baseline before generics are available.

### ``T set(int index, T value);``

Replaces the value at the supplied index and returns the prior value.
Use this as the raw-object mutation baseline before generics are available.

### ``int set(int index, int value);``

Returns the prior integer value while replacing the slot with the supplied integer.
Use this as the current primitive convenience overload.

### ``String set(int index, String value);``

Returns the prior string value while replacing the slot with the supplied string.
Use this as the current string convenience overload.

### ``boolean contains(int value);``

Reports whether the supplied integer is present in the list.
Use this as the current primitive convenience overload.

### ``boolean contains(String value);``

Reports whether the supplied string is present in the list.
Use this as the current string convenience overload.

### ``int indexOf(T value);``

Returns the first index containing the supplied value.
Use this as the raw-object positional lookup baseline before generics are available.

### ``int indexOf(int value);``

Returns the first index containing the supplied integer value.
Use this as the current primitive convenience overload.

### ``int indexOf(String value);``

Returns the first index containing the supplied string value.
Use this as the current string convenience overload.

### ``int lastIndexOf(T value);``

Returns the last index containing the supplied value.
Use this as the raw-object reverse positional lookup baseline before generics are available.

### ``int lastIndexOf(int value);``

Returns the last index containing the supplied integer value.
Use this as the current primitive convenience overload.

### ``int lastIndexOf(String value);``

Returns the last index containing the supplied string value.
Use this as the current string convenience overload.
