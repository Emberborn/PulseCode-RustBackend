# pulse.interop.NativeCallback0

Kind: ``interface``

Source: ``stdlib/src/pulse/interop/NativeCallback0.pulse``

## Summary

Raw zero-argument native callback contract returning one host-ABI `long`.
Use this at the public interop boundary when foreign code calls back into Pulse without any explicit parameters.

## Declaration

```pulse
public interface NativeCallback0
```

## Members

### ``public long invoke();``

Executes the callback body and returns one raw host-ABI `long` result.
Use wrapper code above this interface to translate that raw result into Pulse-native semantics.
