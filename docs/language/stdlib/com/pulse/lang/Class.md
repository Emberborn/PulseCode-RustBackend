# com.pulse.lang.Class

Kind: ``class``

Source: ``stdlib/src/com/pulse/lang/Class.pulse``

## Summary

Reflection-lite class identity descriptor for PulseCode types.

## Declaration

```pulse
public final class Class
```

## Members

### ``public Class(String name)``

Creates a class descriptor for the supplied runtime type name.
Use this when returning class identity from runtime-backed APIs.

### ``public String getName()``

Returns the stored runtime type name.
Use this when emitting diagnostics or comparing class identities.

### ``public String getSimpleName()``

Returns the simple class name without the package prefix.
Use this when code needs a Java-like short type label for diagnostics or display.

### ``public String getPackageName()``

Returns the package portion of the runtime type name.
Use this when code needs package-level identity without full reflection support.

### ``public String toString()``

Returns the class name as its display form.
Use this when formatting a class descriptor into text.

### ``private static String runtimeSimpleName(String fullName)``

Runtime-backed helper that derives the simple name from a full class name.
Use this only inside the reflection-lite `Class` implementation.

### ``private static String runtimePackageName(String fullName)``

Runtime-backed helper that derives the package name from a full class name.
Use this only inside the reflection-lite `Class` implementation.
