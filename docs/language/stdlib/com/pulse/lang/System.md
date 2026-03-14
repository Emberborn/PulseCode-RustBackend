# com.pulse.lang.System

Kind: ``class``

Source: ``stdlib/src/com/pulse/lang/System.pulse``

## Summary

Process-level system facade for standard streams.

## Declaration

```pulse
class System
```

## Members

### ``public static final ConsoleWriter out;``

Standard console output stream for the current process.
Use this when code wants an object-oriented output surface instead of IO helpers.
