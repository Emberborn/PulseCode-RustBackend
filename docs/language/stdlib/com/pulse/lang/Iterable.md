# com.pulse.lang.Iterable

Kind: ``interface``

Source: ``stdlib/src/com/pulse/lang/Iterable.pulse``

## Summary

Contract for values that can produce an iterator.

## Declaration

```pulse
public interface Iterable
```

## Members

### ``public Iterator iterator();``

Returns an iterator over the values exposed by this object.
Use this to drive sequential traversal of an iterable surface.
