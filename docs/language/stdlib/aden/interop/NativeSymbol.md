# aden.interop.NativeSymbol

Kind: ``class``

Source: ``stdlib/src/aden/interop/NativeSymbol.aden``

## Summary

One resolved native symbol address owned through the public interop surface.
Use this as the raw function-entry wrapper before raising foreign behavior behind a Aden-native contract.

## Declaration

```aden
public final class NativeSymbol
```

## Members

### ``public NativeLibrary library() { return this.library; }``

Returns the owning library wrapper.
Use this for diagnostics and interop ownership reporting.

### ``public String name() { return this.name; }``

Returns the exported symbol name.
Use this for diagnostics and wrapper-level symbol inventory.

### ``public long address() { return this.address; }``

Returns the raw native symbol address.
Use this only in low-level interop glue and call helpers.

### ``public NativeFunction asFunction() { return NativeFunction.fromSymbol(this); }``

Returns this resolved symbol as one callable function-pointer wrapper.
Use this when the symbol should be invoked or re-passed independently of the symbol metadata wrapper.

### ``public boolean isAvailable() { return this.address != 0L; }``

Reports whether this symbol currently points at a non-zero native address.
Use this before direct raw-address call sites.

### ``public boolean equals(Object other)``

Reports whether two symbol wrappers point at the same library/name/address triple.
Use this for deterministic interop wrapper comparison.

### ``public int hashCode()``

Returns the stable value hash for this symbol wrapper.
Use this when native symbol wrappers participate in hash-based caches.

### ``public String toString()``

Returns a readable debug representation of this native symbol wrapper.
Use this for diagnostics around foreign-backed feature ownership.
