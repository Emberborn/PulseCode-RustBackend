# author.project.TestInvocation

Kind: ``class``

Source: ``stdlib/src/author/project/TestInvocation.pulse``

## Summary

Resolved test invocation view for compiler-facing authoring flows.

## Declaration

```pulse
public final class TestInvocation
```

## Members

### ``public TestInvocation(``

Creates one resolved test invocation.

### ``public String projectRoot()``

Returns the resolved project root.

### ``public String sourceRoot()``

Returns the resolved main source root.

### ``public String testsRoot()``

Returns the resolved tests root.

### ``public boolean usedManifest()``

Reports whether a manifest supplied the invocation.

### ``public boolean authorlibEnabled()``

Reports whether authorlib is enabled for the resolved invocation.

### ``public boolean equals(Object other)``

Compares test invocations.

### ``public int hashCode()``

Returns a stable invocation hash.

### ``public String toString()``

Returns a concise debug representation.
