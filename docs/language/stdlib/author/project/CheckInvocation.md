# author.project.CheckInvocation

Kind: ``class``

Source: ``stdlib/src/author/project/CheckInvocation.pulse``

## Summary

Resolved check invocation view for compiler-facing authoring flows.

## Declaration

```pulse
public final class CheckInvocation
```

## Members

### ``public CheckInvocation(``

Creates one resolved check invocation.

### ``public String entryPath()``

Returns the resolved entry file path.

### ``public String sourceRoot()``

Returns the resolved source root, or null when direct entry mode supplied no source root.

### ``public boolean usedManifest()``

Reports whether a manifest supplied the invocation.

### ``public boolean authorlibEnabled()``

Reports whether authorlib is enabled for the resolved invocation.

### ``public boolean equals(Object other)``

Compares check invocations.

### ``public int hashCode()``

Returns a stable invocation hash.

### ``public String toString()``

Returns a concise debug representation.
