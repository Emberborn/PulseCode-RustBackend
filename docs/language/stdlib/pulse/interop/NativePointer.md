# pulse.interop.NativePointer

Kind: ``class``

Source: ``stdlib/src/pulse/interop/NativePointer.pulse``

## Summary

Structured wrapper over one raw native address.
Use this instead of naked `long` values when Pulse code needs pointer arithmetic, byte access, or pointer-sized field reads.

## Declaration

```pulse
public final class NativePointer
```

## Members

### ``public static final NativePointer NULL = new NativePointer(0L);``

Shared null-pointer wrapper for public interop code.
Use this instead of creating ad hoc zero-address pointer instances.

### ``public static NativePointer fromRaw(long address)``

Wraps one raw native address as a structured pointer helper.
Use this when raw interop results need to cross into pointer-oriented Pulse code.

### ``public long rawAddress()``

Returns the raw native address.
Use this only at the final raw-call boundary when a foreign ABI still requires plain pointer integers.

### ``public boolean isNull()``

Reports whether this pointer is the null pointer.
Use this before dereference-style operations and optional foreign results.

### ``public NativePointer offset(long byteOffset)``

Returns one pointer offset by the supplied byte count.
Use this for struct field access, array stepping, and byte-span slicing.

### ``public int readByte(int byteOffset)``

Reads one unsigned byte from this pointer at the supplied byte offset.
Use this for low-level foreign buffer inspection and struct field access.

### ``public void writeByte(int byteOffset, int value)``

Writes one byte value at the supplied byte offset.
Use this for low-level foreign buffer mutation and struct field access.

### ``public long readLong(int byteOffset)``

Reads one 64-bit value at the supplied byte offset.
Use this for pointer-sized fields, native handles, and manual struct interop.

### ``public void writeLong(int byteOffset, long value)``

Writes one 64-bit value at the supplied byte offset.
Use this for pointer-sized fields, native handles, and manual struct interop.

### ``public boolean copyTo(NativePointer destination, int byteCount)``

Copies bytes from this pointer into the supplied destination pointer.
Use this for raw native buffer movement once ownership has already been made explicit in Pulse.

### ``public boolean equals(Object other)``

Reports whether two pointer wrappers reference the same raw address.
Use this for deterministic pointer comparison in wrapper caches and tests.

### ``public int hashCode()``

Returns the stable value hash for this pointer wrapper.
Use this when native pointers participate in hash-based Pulse structures.

### ``public String toString()``

Returns a readable debug representation of this pointer wrapper.
Use this for interop diagnostics and ownership tracing.
