# pulse.interop.NativeCallback3

Kind: ``interface``

Source: ``stdlib/src/pulse/interop/NativeCallback3.pulse``

## Summary

Raw three-argument native callback contract returning one host-ABI `long`.
Use this at the public interop boundary when foreign code calls back into Pulse with three raw scalar/pointer arguments.

## Declaration

```pulse
public interface NativeCallback3
```

## Members

### ``public long invoke(long arg0, long arg1, long arg2);``

Executes the callback body for three raw host-ABI arguments and returns one raw host-ABI `long` result.
Use wrapper code above this interface to translate raw argument/result semantics into Pulse-native behavior.
