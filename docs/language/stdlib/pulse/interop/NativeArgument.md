# pulse.interop.NativeArgument

Kind: ``class``

Source: ``stdlib/src/pulse/interop/NativeArgument.pulse``

## Summary

Structured host-ABI argument wrapper for native calls.
Use this to pass mixed boolean, integer, pointer, buffer, span, and UTF-8-backed values into foreign code without scattering raw `long` conversions.

## Declaration

```pulse
public final class NativeArgument
```

## Members

### ``public static NativeArgument ofLong(long value)``

Wraps one raw 64-bit host-ABI value directly.
Use this only when the foreign signature is already being modeled in explicit raw machine terms.

### ``public static NativeArgument ofInt(int value)``

Wraps one 32-bit integer argument.
Use this for Win32/C/Rust signatures that take ordinary `int`-sized scalar values.

### ``public static NativeArgument ofBoolean(boolean value)``

Wraps one boolean/BOOL-style argument.
Use this for foreign APIs that treat zero as false and non-zero as true.

### ``public static NativeArgument ofPointer(NativePointer value)``

Wraps one structured native pointer argument.
`null` pointers are converted to raw zero.

### ``public static NativeArgument ofBuffer(NativeBuffer value)``

Wraps the first pointer of one owned or borrowed native buffer.
Use this when a foreign ABI expects one mutable byte-buffer pointer.

### ``public static NativeArgument ofByteSpan(NativeByteSpan value)``

Wraps the first pointer of one borrowed byte span.
Use this when a foreign ABI expects one borrowed byte-range pointer.

### ``public static NativeArgument ofUtf8String(NativeUtf8String value)``

Wraps the first pointer of one owned temporary UTF-8 string buffer.
Use this for foreign APIs that expect one `char*` / `LPCSTR` style argument.

### ``public static NativeArgument ofFunction(NativeFunction value)``

Wraps one callable native function or callback pointer.
Use this when one foreign API expects another foreign entrypoint address as one argument.

### ``public long rawValue()``

Returns the raw 64-bit host-ABI value represented by this argument wrapper.
Use this only at the final raw native call boundary.
