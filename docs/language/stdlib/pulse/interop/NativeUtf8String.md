# pulse.interop.NativeUtf8String

Kind: ``class``

Source: ``stdlib/src/pulse/interop/NativeUtf8String.pulse``

## Summary

Owned temporary UTF-8 backing storage for native interop.
Use this when Pulse text must cross the foreign boundary as one native NUL-terminated byte buffer.

## Declaration

```pulse
public final class NativeUtf8String implements AutoCloseable
```

## Members

### ``public static NativeUtf8String encode(String value)``

Encodes one Pulse string into owned native UTF-8 storage with a trailing NUL terminator.
Use this for temporary foreign calls that need one native string pointer.

### ``public static String decode(NativePointer pointer, int byteLength)``

Decodes one explicit-length UTF-8 payload into a Pulse string.
Returns `null` when the supplied pointer is null.

### ``public static String decodeNullTerminated(NativePointer pointer)``

Decodes one NUL-terminated UTF-8 payload into a Pulse string.
Returns `null` when the supplied pointer is null.

### ``public boolean isOpen()``

Reports whether this owned native UTF-8 buffer is still open.
Use this before passing the pointer into foreign code again.

### ``public NativePointer pointer()``

Returns the native pointer to the first UTF-8 byte.
Use this at the raw/native call boundary after ownership has been made explicit.

### ``public int byteLength()``

Returns the UTF-8 payload length in bytes, excluding the trailing NUL terminator.
Use this for explicit-length foreign APIs or buffer accounting.

### ``public NativeByteSpan bytes()``

Returns one non-owning view over the UTF-8 payload bytes, excluding the trailing NUL terminator.
Use this when native code needs a borrowed payload view instead of ownership of the backing storage.

### ``public void close()``

Releases the native UTF-8 backing allocation.
Closing is idempotent and invalidates the pointer for future foreign calls.

### ``public String toString()``

Returns a readable debug representation of this UTF-8 backing wrapper.
Use this for interop diagnostics and ownership tracing.
