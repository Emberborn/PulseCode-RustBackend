# aden.io.Flushable

Kind: ``interface``

Source: ``stdlib/src/aden/io/Flushable.aden``

## Summary

IO-specific flush contract aligned with the Java-close resource model.

## Declaration

```aden
public interface Flushable
```

## Members

### ``public void flush();``

Forces buffered output state to the underlying resource.
Use this for explicit write-visibility points in the current IO lifecycle baseline.
