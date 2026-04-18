# pulse.interop.NativeCallbackHandle

Kind: ``class``

Source: ``stdlib/src/pulse/interop/NativeCallbackHandle.pulse``

## Summary

ARC-managed registration handle for one Pulse callback exposed as one native function pointer.
Use this when foreign code must call back into Pulse through one raw function pointer without leaking callback-slot management into normal user code.

## Declaration

```pulse
public final class NativeCallbackHandle implements NativeManagedResource
```

## Members

### ``public static NativeCallbackHandle create(NativeCallback0 callback)``

Registers one zero-argument callback and returns one native-callable handle wrapper.
Returns `null` when the runtime cannot allocate one callback slot.

### ``public static NativeCallbackHandle create(NativeCallback1 callback)``

Registers one one-argument callback and returns one native-callable handle wrapper.
Returns `null` when the runtime cannot allocate one callback slot.

### ``public static NativeCallbackHandle create(NativeCallback2 callback)``

Registers one two-argument callback and returns one native-callable handle wrapper.
Returns `null` when the runtime cannot allocate one callback slot.

### ``public static NativeCallbackHandle create(NativeCallback3 callback)``

Registers one three-argument callback and returns one native-callable handle wrapper.
Returns `null` when the runtime cannot allocate one callback slot.

### ``public static NativeCallbackHandle create(NativeCallback4 callback)``

Registers one four-argument callback and returns one native-callable handle wrapper.
Returns `null` when the runtime cannot allocate one callback slot.

### ``public int slot() { return this.slot; }``

Returns the registered runtime slot id for this callback handle.
Use this for diagnostics and low-level callback inventory only.

### ``public int arity() { return this.arity; }``

Returns the callback arity represented by this handle.
Use this for diagnostics and wrapper-level callback validation.

### ``public long address() { return this.address; }``

Returns the raw callable address exposed to foreign code.
Use this only at native-registration boundaries.

### ``public NativePointer pointer() { return NativePointer.fromRaw(this.address); }``

Returns this callback address as one structured pointer wrapper.
Use this when one foreign API expects one pointer-shaped callback/function address.

### ``public NativeFunction function()``

Returns this callback address as one callable function wrapper.
Use this when one foreign API wants to treat this callback as one callable function pointer value.

### ``public boolean isOpen() { return !this.closed && this.slot > 0 && this.address != 0L; }``

Reports whether this callback registration is still live.
Use this before passing the callback pointer into foreign code again.

### ``public boolean close()``

Unregisters the callback slot and reports whether one live callback registration was actually released.
Use this for explicit teardown when the callback should stop being callable before ARC reaches it.

### ``public boolean equals(Object other)``

Reports whether two callback-handle wrappers reference the same slot/arity/address triple.
Use this for deterministic callback registration comparison in tests and caches.

### ``public int hashCode()``

Returns the stable value hash for this callback registration wrapper.
Use this when callback handles participate in hash-based Pulse caches.

### ``public String toString()``

Returns a readable debug representation of this callback registration wrapper.
Use this for interop diagnostics and callback ownership tracing.
