# aden.interop.NativeManagedResource

Kind: ``interface``

Source: ``stdlib/src/aden/interop/NativeManagedResource.aden``

## Summary

Marker interface for interop wrappers that should participate in ARC-backed native resource cleanup.
Use this on explicit interop-owned wrapper classes, not as a general close/finalizer mechanism for the language.

## Declaration

```aden
public interface NativeManagedResource
```
