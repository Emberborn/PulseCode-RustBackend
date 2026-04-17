# pulse.interop.NativeLibrary

Kind: ``class``

Source: ``stdlib/src/pulse/interop/NativeLibrary.pulse``

## Summary

One loaded native library handle owned through the public interop surface.
Use this as the raw library boundary when Pulse code needs to borrow foreign implementation without borrowing authority.

## Declaration

```pulse
public final class NativeLibrary
```

## Members

### ``public static NativeLibrary open(String source)``

Opens one native library and returns `null` when the host loader cannot open it.
Use this for optional interop where the caller wants to probe availability first.

### ``public static NativeLibrary openRequired(String source)``

Opens one native library or panics when the host loader cannot open it.
Use this when wrapped foreign functionality is required for the current Pulse-owned feature.

### ``public String source() { return this.source; }``

Returns the original library source/path used during load.
Use this for diagnostics and wrapper ownership reporting.

### ``public long rawHandle() { return this.handle; }``

Returns the raw native library handle.
Use this only for low-level interop glue that genuinely must pass the host handle onward.

### ``public boolean isOpen() { return this.handle != 0L; }``

Reports whether this library still owns one live native handle.
Use this before resolving symbols or closing the library again.

### ``public NativeSymbol resolve(String symbolName)``

Resolves one exported symbol from this native library and returns `null` when absent.
Use this for optional native entrypoints where the caller wants to branch on capability.

### ``public NativeSymbol resolveRequired(String symbolName)``

Resolves one exported symbol or panics when absent.
Use this when a Pulse-owned wrapper requires a specific native backend slot to exist.

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
