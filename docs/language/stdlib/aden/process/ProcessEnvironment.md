# aden.process.ProcessEnvironment

Kind: ``class``

Source: ``stdlib/src/aden/process/ProcessEnvironment.aden``

## Summary

Explicit inherited-environment plus ordered override entries for host process execution.

## Declaration

```aden
public final class ProcessEnvironment
```

## Members

### ``public ProcessEnvironment(``

Captures one inherited-environment policy plus ordered override entries.
Use this when a host process plan needs explicit environment execution rules.

### ``public static ProcessEnvironment defaults()``

Returns the default environment policy for host process execution.
Use this when a process should inherit the parent environment with no explicit overrides.

### ``public boolean inheritParentEnvironment() { return this.inheritParentEnvironment; }``

Reports whether the parent process environment should be inherited.
Use this when deciding how host process execution should begin before overrides are applied.

### ``public List<ProcessEnvironmentVariable> overrides() { return this.overrides; }``

Returns the ordered environment override entries.
Use this when rendering or inspecting the explicit override set for one process plan.

### ``public boolean equals(Object other)``

Reports whether two process environment plans carry the same inherit/override policy.
Use this for deterministic comparison of process execution plans.

### ``public int hashCode()``

Returns the stable value hash for this process environment plan.
Use this when process plans participate in hash-based collections.

### ``public String toString()``

Returns a readable debug representation of this process environment plan.
Use this for diagnostics and contract locks around host process execution.
