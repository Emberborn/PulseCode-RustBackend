# pulse.interop.NativeCallback1

Kind: ``interface``

Source: ``stdlib/src/pulse/interop/NativeCallback1.pulse``

## Summary

Raw one-argument native callback contract returning one host-ABI `long`.
Use this at the public interop boundary when foreign code calls back into Pulse with one raw scalar/pointer argument.

## Declaration

```pulse
public interface NativeCallback1
```

## Members

### ``public long invoke(long arg0);``

Executes the callback body for one raw host-ABI argument and returns one raw host-ABI `long` result.
Use wrapper code above this interface to translate raw argument/result semantics into Pulse-native behavior.
