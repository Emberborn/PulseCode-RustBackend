# aden.lang.Iterable

Kind: ``interface``

Source: ``stdlib/src/aden/lang/Iterable.aden``

## Summary

Contract for values that can produce an iterator.

## Declaration

```aden
public interface Iterable
```

## Members

### ``public Iterator iterator();``

Returns an iterator over the values exposed by this object.
Use this to drive sequential traversal of an iterable surface.
