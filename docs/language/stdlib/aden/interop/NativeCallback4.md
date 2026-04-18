# aden.interop.NativeCallback4

Kind: ``interface``

Source: ``stdlib/src/aden/interop/NativeCallback4.aden``

## Summary

Raw four-argument native callback contract returning one host-ABI `long`.
Use this at the public interop boundary when foreign code calls back into Aden with four raw scalar/pointer arguments.

## Declaration

```aden
public interface NativeCallback4
```

## Members

### ``public long invoke(long arg0, long arg1, long arg2, long arg3);``

Executes the callback body for four raw host-ABI arguments and returns one raw host-ABI `long` result.
Use wrapper code above this interface to translate raw argument/result semantics into Aden-native behavior.
