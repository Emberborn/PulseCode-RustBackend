# com.pulse.lang.AutoCloseable

Kind: ``interface``

Source: ``stdlib/src/com/pulse/lang/AutoCloseable.pulse``

## Summary

Resource-lifecycle contract for values that can be closed explicitly.
This is a bootstrap F1 seam for later resource-statement and lifecycle work.

## Declaration

```pulse
public interface AutoCloseable
```

## Members

### ``public void close();``

Releases the resource owned by this object.
Use this when code must close a resource explicitly in the current baseline.
