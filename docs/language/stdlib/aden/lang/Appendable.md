# aden.lang.Appendable

Kind: ``interface``

Source: ``stdlib/src/aden/lang/Appendable.aden``

## Summary

Minimal append contract for mutable text builders in the current F1 baseline.

## Declaration

```aden
public interface Appendable
```

## Members

### ``public StringBuilder append(String text);``

Appends the supplied string and returns the mutable target.
Use this for chained text-building flows through the abstract append contract.

### ``public StringBuilder append(char value);``

Appends the supplied character and returns the mutable target.
Use this for chained single-character append flows.
