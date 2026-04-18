# aden.interop.NativeByteSpan

Kind: ``class``

Source: ``stdlib/src/aden/interop/NativeByteSpan.aden``

## Summary

Non-owning byte view over one native memory range.
Use this when Aden code needs to inspect or slice native memory without taking ownership of the backing allocation itself.

## Declaration

```aden
public final class NativeByteSpan
```

## Members

### ``public static NativeByteSpan of(NativePointer pointer, int byteLength)``

Creates one non-owning byte span over the supplied pointer and length.
Use this for foreign memory views when ownership lives elsewhere.

### ``public NativePointer pointer()``

Returns the first pointer in this span.
Use this when another raw/native API needs the same byte range start.

### ``public int byteLength()``

Returns the number of bytes visible through this span.
Use this for bounds checks and explicit native memory accounting.

### ``public boolean isEmpty()``

Reports whether this span is empty.
Use this before decoding or copying when empty memory should short-circuit.

### ``public int getByte(int index)``

Reads one unsigned byte from this span.
Use this for direct native-byte inspection without taking ownership of the backing memory.

### ``public NativeByteSpan slice(int offset, int length)``

Returns one sliced byte view over this span.
Use this for struct field windows and byte-subrange interop without copying.

### ``public String decodeUtf8()``

Decodes this byte span as one UTF-8 text payload.
Use this when foreign code returned owned or borrowed byte data that should be raised into Aden text.
