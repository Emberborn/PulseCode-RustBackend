# pulse.interop.NativeCallback2

Kind: ``interface``

Source: ``stdlib/src/pulse/interop/NativeCallback2.pulse``

## Summary

Raw two-argument native callback contract returning one host-ABI `long`.
Use this at the public interop boundary when foreign code calls back into Pulse with two raw scalar/pointer arguments.

## Declaration

```pulse
public interface NativeCallback2
```

## Members

### ``public long invoke(long arg0, long arg1);``

Executes the callback body for two raw host-ABI arguments and returns one raw host-ABI `long` result.
Use wrapper code above this interface to translate raw argument/result semantics into Pulse-native behavior.
