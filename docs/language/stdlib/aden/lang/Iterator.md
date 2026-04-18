# aden.lang.Iterator

Kind: ``interface``

Source: ``stdlib/src/aden/lang/Iterator.aden``

## Summary

Sequential iteration contract for iterable values.

## Declaration

```aden
public interface Iterator
```

## Members

### ``public boolean hasNext();``

Reports whether another value can be read from the iterator.
Call this before next when code must avoid stepping past the end.

### ``public Object next();``

Returns the next value from the iterator.
Use this after hasNext reports that another element is available.
