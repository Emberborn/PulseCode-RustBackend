# pulse.lang.Object

Kind: ``class``

Source: ``stdlib/src/pulse/lang/Object.pulse``

## Summary

Returns the reflection-lite class descriptor for this object.
Use this when code needs the runtime type name without full reflection support.

## Declaration

```pulse
public Class getClass()
```

## Members

### ``public int hashCode()``

Returns a stable identity-style hash for this object.
Use this for the default Java-like Object hash contract.

### ``public String toString()``

Returns the runtime class name for this object.
Use this for basic debugging output when no richer formatting is available.

### ``public boolean equals(Object other)``

Reports whether this object and the other reference point to the same value.
Use this for identity-style equality checks on reference types.
