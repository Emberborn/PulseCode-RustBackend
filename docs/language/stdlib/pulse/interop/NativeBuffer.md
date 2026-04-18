# pulse.interop.NativeBuffer

Kind: ``class``

Source: ``stdlib/src/pulse/interop/NativeBuffer.pulse``

## Summary

Owned native byte buffer on the public interop surface.
Use this for temporary foreign backing storage, mutable call buffers, and ownership-safe native scratch space.

## Declaration

```pulse
public final class NativeBuffer implements AutoCloseable, NativeManagedResource
```

## Members

### ``public static NativeBuffer allocate(int byteLength)``

Allocates one owned native byte buffer of the supplied size.
Use this for temporary foreign scratch storage or mutable call buffers.

### ``public static NativeBuffer adopt(NativePointer pointer, int byteLength)``

Wraps one foreign allocation and transfers release responsibility into Pulse.
Use this when foreign code returned one allocation that should now be ARC-managed by the Pulse wrapper.

### ``public static NativeBuffer borrow(NativePointer pointer, int byteLength)``

Wraps one foreign allocation as borrowed memory.
Use this when Pulse may inspect or mutate one native buffer but must not release it.

### ``public static NativeBuffer manual(NativePointer pointer, int byteLength)``

Wraps one foreign allocation under explicit manual-release policy.
Use this when advanced interop code wants a structured Pulse wrapper without automatic release behavior.

### ``public boolean isOpen()``

Reports whether this owned native buffer is still open.
Use this before dereference or transfer operations.

### ``public int byteLength()``

Returns the number of owned bytes in this buffer.
Use this for bounds checks and explicit native scratch-space accounting.

### ``public int ownershipMode()``

Returns the ownership mode for this native buffer wrapper.
Use this when wrapper layers need to branch on borrowed, adopted, or manual release policy explicitly.

### ``public NativePointer pointer()``

Returns the first pointer in this owned native buffer.
Use this at the raw/native call boundary after ownership has been made explicit.

### ``public int getByte(int index)``

Reads one unsigned byte from this buffer.
Use this for direct mutable-buffer inspection under Pulse-owned lifetime rules.

### ``public void setByte(int index, int value)``

Writes one byte value into this buffer.
Use this for mutable foreign scratch buffers and struct field construction.

### ``public long getLong(int byteOffset)``

Reads one 64-bit field from this buffer.
Use this for pointer-sized/native-handle struct fields.

### ``public void setLong(int byteOffset, long value)``

Writes one 64-bit field into this buffer.
Use this for pointer-sized/native-handle struct fields.

### ``public NativeByteSpan bytes()``

Returns one non-owning byte span over this full buffer.
Use this when APIs should borrow the bytes without taking over the buffer lifecycle.

### ``public NativeByteSpan view(int offset, int byteLength)``

Returns one non-owning byte span over a subrange of this buffer.
Use this for borrowed struct-field windows and borrowed call payload slices.

### ``public void close()``

Releases the native allocation owned by this buffer.
Closing is idempotent and invalidates future reads or writes through this wrapper.

### ``public String toString()``

Returns a readable debug representation of this owned native buffer.
Use this for interop diagnostics and ownership tracing.
