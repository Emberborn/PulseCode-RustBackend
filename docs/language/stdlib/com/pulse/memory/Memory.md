# com.pulse.memory.Memory

Kind: ``class``

Source: ``stdlib/src/com/pulse/memory/Memory.pulse``

## Summary

Runtime memory-management surface for ARC, weak references, and cycle maintenance.
Use this as the stdlib-facing home for low-level memory/runtime controls.

## Declaration

```pulse
class Memory
```

## Members

### ``public static long retain(long handle)``

Retains a runtime-backed heap handle and returns the same handle.
Use this when low-level strong ownership must be extended manually.

### ``public static void release(long handle)``

Releases a runtime-backed heap handle.
Use this when low-level strong ownership should be relinquished manually.

### ``public static void release(String value)``

Releases a runtime-backed string reference.
Use this when manually dropping strong ownership of a string value.

### ``public static int cycleYoungPass()``

Runs one young-generation ARC cycle pass.
Use this for runtime diagnostics or explicit reclamation testing.

### ``public static int cycleFullPass()``

Runs one full ARC cycle pass.
Use this for runtime diagnostics or explicit reclamation testing.

### ``public static int cycleTick()``

Runs one ARC maintenance tick.
Use this for runtime diagnostics or explicit maintenance stepping.

### ``public static long weakNew(String value)``

Creates a weak handle for the supplied string value.
Use this when observing a value without retaining strong ownership.

### ``public static String weakGet(long weakHandle)``

Reads the current value from a weak handle.
Use this when checking whether a weakly referenced value is still alive.

### ``public static void weakClear(long weakHandle)``

Clears a weak handle.
Use this when a weak reference should be explicitly discarded.
