# pulse.io.Flushable

Kind: ``interface``

Source: ``stdlib/src/pulse/io/Flushable.pulse``

## Summary

IO-specific flush contract aligned with the Java-close resource model.

## Declaration

```pulse
public interface Flushable
```

## Members

### ``public void flush();``

Forces buffered output state to the underlying resource.
Use this for explicit write-visibility points in the current IO lifecycle baseline.
