# com.pulse.lang.Appendable

Kind: ``interface``

Source: ``stdlib/src/com/pulse/lang/Appendable.pulse``

## Summary

Minimal append contract for mutable text builders in the current F1 baseline.

## Declaration

```pulse
public interface Appendable
```

## Members

### ``public StringBuilder append(String text);``

Appends the supplied string and returns the mutable target.
Use this for chained text-building flows through the abstract append contract.

### ``public StringBuilder append(char value);``

Appends the supplied character and returns the mutable target.
Use this for chained single-character append flows.
