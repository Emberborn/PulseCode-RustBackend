# pulse.io.Closeable

Kind: ``interface``

Source: ``stdlib/src/pulse/io/Closeable.pulse``

## Summary

IO-specific close contract aligned with the Java-close resource model.

## Declaration

```pulse
public interface Closeable extends AutoCloseable
```

## Members

### ``public void close();``

Releases the resource owned by this object.
Use this when IO-backed resources should be closed through an IO-specific interface contract.
