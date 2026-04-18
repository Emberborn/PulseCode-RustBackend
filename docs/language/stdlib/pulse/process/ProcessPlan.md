# pulse.process.ProcessPlan

Kind: ``class``

Source: ``stdlib/src/pulse/process/ProcessPlan.pulse``

## Summary

One host-executed process invocation plan.

## Declaration

```pulse
public final class ProcessPlan
```

## Members

### ``public ProcessPlan(``

Captures one host process invocation plan.
Use this when code wants a deterministic executable, argument, working-directory, and environment bundle.

### ``public String executable() { return this.executable; }``

Returns the executable path or command name.
Use this when rendering or inspecting the process target for host execution.

### ``public String workingDirectory() { return this.workingDirectory; }``

Returns the working directory, or `null` when host defaults should be used.
Use this when host process execution must start from a specific directory.

### ``public List<String> arguments() { return this.arguments; }``

Returns the ordered process arguments.
Use this when rendering or inspecting the concrete host command invocation.

### ``public ProcessEnvironment environment() { return this.environment; }``

Returns the environment execution policy for this process plan.
Use this when rendering or inspecting inherited-environment and override behavior.

### ``public boolean equals(Object other)``

Reports whether two process plans carry the same execution shape.
Use this for deterministic comparison of host execution plans.

### ``public int hashCode()``

Returns the stable value hash for this process plan.
Use this when process plans participate in hash-based collections.

### ``public String toString()``

Returns a readable debug representation of this process plan.
Use this for diagnostics and contract locks around host execution shaping.
