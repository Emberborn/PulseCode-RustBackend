# aden.io.Closeable

Kind: ``interface``

Source: ``stdlib/src/aden/io/Closeable.aden``

## Summary

IO-specific close contract aligned with the Java-close resource model.

## Declaration

```aden
public interface Closeable extends AutoCloseable
```

## Members

### ``public void close();``

Releases the resource owned by this object.
Use this when IO-backed resources should be closed through an IO-specific interface contract.
