# pulse.process.ProcessEnvironmentVariable

Kind: ``class``

Source: ``stdlib/src/pulse/process/ProcessEnvironmentVariable.pulse``

## Summary

One explicit process environment override entry.

## Declaration

```pulse
public final class ProcessEnvironmentVariable
```

## Members

### ``public ProcessEnvironmentVariable(String name, String value)``

Captures one explicit process environment override entry.
Use this when one host process execution plan needs a stable `name=value` override.

### ``public String name() { return this.name; }``

Returns the environment variable name.
Use this when rendering or inspecting ordered process environment overrides.

### ``public String value() { return this.value; }``

Returns the environment variable value.
Use this when rendering or inspecting ordered process environment overrides.

### ``public boolean equals(Object other)``

Reports whether two environment variable entries carry the same name and value.
Use this for deterministic comparison of process environment plans.

### ``public int hashCode()``

Returns the stable value hash for this environment variable entry.
Use this when environment plans participate in hash-based collections.

### ``public String toString()``

Returns a readable debug representation of this environment variable entry.
Use this for diagnostics and contract locks around process environment planning.
