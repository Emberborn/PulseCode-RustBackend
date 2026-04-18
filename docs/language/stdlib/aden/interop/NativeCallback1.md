# aden.interop.NativeCallback1

Kind: ``interface``

Source: ``stdlib/src/aden/interop/NativeCallback1.aden``

## Summary

Raw one-argument native callback contract returning one host-ABI `long`.
Use this at the public interop boundary when foreign code calls back into Aden with one raw scalar/pointer argument.

## Declaration

```aden
public interface NativeCallback1
```

## Members

### ``public long invoke(long arg0);``

Executes the callback body for one raw host-ABI argument and returns one raw host-ABI `long` result.
Use wrapper code above this interface to translate raw argument/result semantics into Aden-native behavior.
