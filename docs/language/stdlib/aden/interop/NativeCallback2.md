# aden.interop.NativeCallback2

Kind: ``interface``

Source: ``stdlib/src/aden/interop/NativeCallback2.aden``

## Summary

Raw two-argument native callback contract returning one host-ABI `long`.
Use this at the public interop boundary when foreign code calls back into Aden with two raw scalar/pointer arguments.

## Declaration

```aden
public interface NativeCallback2
```

## Members

### ``public long invoke(long arg0, long arg1);``

Executes the callback body for two raw host-ABI arguments and returns one raw host-ABI `long` result.
Use wrapper code above this interface to translate raw argument/result semantics into Aden-native behavior.
