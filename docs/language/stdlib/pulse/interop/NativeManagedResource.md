# pulse.interop.NativeManagedResource

Kind: ``interface``

Source: ``stdlib/src/pulse/interop/NativeManagedResource.pulse``

## Summary

Marker interface for interop wrappers that should participate in ARC-backed native resource cleanup.
Use this on explicit interop-owned wrapper classes, not as a general close/finalizer mechanism for the language.

## Declaration

```pulse
public interface NativeManagedResource
```
