# pulse.lang.Comparable

Kind: ``interface``

Source: ``stdlib/src/pulse/lang/Comparable.pulse``

## Summary

Ordering contract for values that can compare themselves.

## Declaration

```pulse
public interface Comparable<T>
```

## Members

### ``public int compareTo(T other);``

Compares this value to another object of the same logical type.
Use this when exposing deterministic ordering semantics.
