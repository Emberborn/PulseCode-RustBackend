# pulse.lang.Enum

Kind: ``enum``

Source: ``stdlib/src/pulse/lang/Enum.pulse``

## Summary

Bootstrap placeholder for the future std-facing enum base contract.
The current F1 enum runtime is still ordinal-backed and does not yet expose the
full Java-style enum object model through this type.

## Declaration

```pulse
public abstract class Enum extends Object
```

## Members

### ``public Enum()``

Creates the bootstrap enum base value.
This constructor exists only so the type can live in stdlib before the full
enum object model and helper surface are wired in later F1 work.
