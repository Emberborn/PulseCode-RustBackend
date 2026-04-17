# pulse.io.ResourceScope

Kind: ``class``

Source: ``stdlib/src/pulse/io/ResourceScope.pulse``

## Summary

Manual resource scope for deterministic reverse-order closure before try-with-resources syntax is available.

## Declaration

```pulse
public final class ResourceScope implements AutoCloseable
```

## Members

### ``public ResourceScope()``

Creates one open resource scope with no registered resources.
Use this for manual multi-resource ownership in the current F1 lifecycle baseline.

### ``private void ensureOpen()``

Panics when the scope has already been closed.
Use this to keep manual resource-scope ownership explicit.

### ``public void add(AutoCloseable resource)``

Registers one resource for reverse-order closure.
`null` resources are ignored so optional ownership flows stay explicit but ergonomic.

### ``public void clear()``

Drops every registered resource without closing it.
Use this when ownership must be transferred or explicitly abandoned before the scope itself is closed.

### ``public int size()``

Reports how many resources are currently registered.
Use this for explicit ownership checks in the current lifecycle baseline.

### ``public static void closeAll(List<AutoCloseable> resources)``

Closes one resource list in reverse order.
`null` entries are ignored so optional ownership lists stay deterministic without extra guards.

### ``public boolean isClosed()``

Reports whether this manual resource scope has been closed.
Use this for explicit lifecycle checks on manual multi-resource ownership.

### ``public boolean isOpen()``

Reports whether this manual resource scope is currently open.
Use this for explicit lifecycle checks without negating `isClosed()`.

### ``public void close()``

Closes every registered resource in reverse registration order.
Closing is idempotent and only affects this scope and the resources it owns.
