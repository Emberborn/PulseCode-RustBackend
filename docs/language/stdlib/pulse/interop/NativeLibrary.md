# pulse.interop.NativeLibrary

Kind: ``class``

Source: ``stdlib/src/pulse/interop/NativeLibrary.pulse``

## Summary

One loaded native library handle owned through the public interop surface.
Use this as the raw library boundary when Pulse code needs to borrow foreign implementation without borrowing authority.

## Declaration

```pulse
public final class NativeLibrary implements NativeManagedResource
```

## Members

### ``public static NativeLibrary open(String source)``

Opens one native library and returns `null` when the host loader cannot open it.
Use this for optional interop where the caller wants to probe availability first.

### ``public static NativeLibrary lookupLoaded(String source)``

Looks up one already-loaded native library in the current process without taking over its lifetime.
Returns `null` when the named module is not currently loaded.

### ``public static NativeLibrary lookupLoadedRequired(String source)``

Looks up one already-loaded native library or panics when absent.
Use this when a wrapper depends on one host module already being present in the current process.

### ``public static NativeLibrary lookupSelf()``

Returns the current process image module as a borrowed library wrapper.
Use this when interop code needs to resolve exports from the current executable image without taking over its lifetime.

### ``public static NativeLibrary lookupSelfRequired()``

Returns the current process image module or panics when it cannot be resolved.
Use this when a wrapper depends on exports from the current executable image.

### ``public static NativeLibrary borrow(String source, long handle)``

Wraps one loaded native library handle as borrowed ownership.
Use this when the host or another subsystem owns the library lifetime.

### ``public static NativeLibrary manual(String source, long handle)``

Wraps one loaded native library handle under explicit manual-release policy.
Use this when advanced code wants a structured library wrapper without automatic unload behavior.

### ``public static NativeLibrary openRequired(String source)``

Opens one native library or panics when the host loader cannot open it.
Use this when wrapped foreign functionality is required for the current Pulse-owned feature.

### ``public String source() { return this.source; }``

Returns the original library source/path used during load.
Use this for diagnostics and wrapper ownership reporting.

### ``public long rawHandle() { return this.handle; }``

Returns the raw native library handle.
Use this only for low-level interop glue that genuinely must pass the host handle onward.

### ``public int ownershipMode() { return this.ownershipMode; }``

Returns the ownership mode for this native library wrapper.
Use this when wrapper layers need to branch on borrowed, adopted, or manual unload policy explicitly.

### ``public boolean isOpen() { return this.handle != 0L; }``

Reports whether this library still owns one live native handle.
Use this before resolving symbols or closing the library again.

### ``public NativeSymbol resolve(String symbolName)``

Resolves one exported symbol from this native library and returns `null` when absent.
Use this for optional native entrypoints where the caller wants to branch on capability.

### ``public NativeSymbol resolveRequired(String symbolName)``

Resolves one exported symbol or panics when absent.
Use this when a Pulse-owned wrapper requires a specific native backend slot to exist.

### ``public NativeFunction resolveFunction(String symbolName)``

Resolves one exported symbol as one callable function pointer and returns `null` when absent.
Use this when Pulse code wants to keep one callable foreign address around independently of the symbol wrapper.

### ``public NativeFunction resolveFunctionRequired(String symbolName)``

Resolves one exported symbol as one callable function pointer or panics when absent.
Use this when one Pulse-owned wrapper depends on one specific foreign entrypoint being callable.

### ``public boolean close()``

Releases the native library handle and reports whether the host loader confirmed the unload.
Use this when an interop wrapper owns the library lifecycle instead of keeping it for process lifetime.

### ``public boolean equals(Object other)``

Reports whether two library wrappers point at the same current native handle/source pair.
Use this for deterministic wrapper comparison in tests and caches.

### ``public int hashCode()``

Returns the stable value hash for this library wrapper.
Use this when native libraries participate in hash-based wrapper caches.

### ``public String toString()``

Returns a readable debug representation of this library wrapper.
Use this for diagnostics around interop ownership and backend selection.
