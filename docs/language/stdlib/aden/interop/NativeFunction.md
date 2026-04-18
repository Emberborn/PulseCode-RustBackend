# aden.interop.NativeFunction

Kind: ``class``

Source: ``stdlib/src/aden/interop/NativeFunction.aden``

## Summary

Structured wrapper over one raw native function or callback pointer.
Use this when Aden code needs to invoke one foreign function directly or pass one callable address back into another foreign API.

## Declaration

```aden
public final class NativeFunction
```

## Members

### ``public static NativeFunction fromSymbol(NativeSymbol symbol)``

Wraps one resolved native symbol as one callable function pointer.
Returns `null` when the supplied symbol is missing or unresolved.

### ``public static NativeFunction fromPointer(NativePointer pointer, String name)``

Wraps one raw function pointer address with one optional logical name.
Use this when one foreign API returns a function pointer that should then be called or re-passed under Aden-owned semantics.

### ``public static NativeFunction fromPointer(NativePointer pointer)``

Wraps one raw function pointer address without any additional logical name.
Use this when one foreign API returns a callback/function pointer and only the address matters.

### ``public NativeLibrary library() { return this.library; }``

Returns the owning library wrapper when one named symbol produced this function pointer.
Use this for diagnostics and backend inventory reporting.

### ``public String name() { return this.name; }``

Returns the logical function name when one was available.
Use this for diagnostics around foreign-backed feature ownership.

### ``public long address() { return this.address; }``

Returns the raw native callable address.
Use this only at the low-level call boundary or when another foreign API expects a callback/function pointer argument.

### ``public NativePointer pointer() { return NativePointer.fromRaw(this.address); }``

Returns this callable address as one structured pointer wrapper.
Use this when one foreign API expects one pointer-shaped callback/function address.

### ``public boolean isAvailable() { return this.address != 0L; }``

Reports whether this wrapper currently points at one non-zero callable address.
Use this before direct raw call sites and callback registration.

### ``public boolean equals(Object other)``

Reports whether two callable wrappers reference the same logical library/name/address triple.
Use this for deterministic function-pointer comparison in tests and caches.

### ``public int hashCode()``

Returns the stable value hash for this callable wrapper.
Use this when foreign function pointers participate in hash-based Aden caches.

### ``public String toString()``

Returns a readable debug representation of this callable wrapper.
Use this for interop diagnostics and ownership tracing.
