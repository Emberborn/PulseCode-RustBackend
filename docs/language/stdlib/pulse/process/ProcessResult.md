# pulse.process.ProcessResult

Kind: ``class``

Source: ``stdlib/src/pulse/process/ProcessResult.pulse``

## Summary

Captured execution result for one host process invocation.

## Declaration

```pulse
public final class ProcessResult
```

## Members

### ``public ProcessResult(int exitCode, String stdoutText, String stderrText)``

Captures one completed host process result.
Use this when code needs the exit code plus captured standard output/error text.

### ``public int exitCode() { return this.exitCode; }``

Returns the process exit code.
Use this when checking whether host execution succeeded.

### ``public String stdoutText() { return this.stdoutText; }``

Returns the captured standard output text.
Use this when code needs line or text output from the host process.

### ``public String stderrText() { return this.stderrText; }``

Returns the captured standard error text.
Use this when code needs diagnostic output from the host process.

### ``public boolean success() { return this.exitCode == 0; }``

Reports whether the host process exited with status code `0`.
Use this for the common success check on completed process execution.

### ``public boolean equals(Object other)``

Reports whether two process results carry the same exit/stdout/stderr payload.
Use this for deterministic process contract checks.

### ``public int hashCode()``

Returns the stable value hash for this process result.
Use this when process results participate in hash-based collections.

### ``public String toString()``

Returns a readable debug representation of this process result.
Use this for diagnostics and process contract locks.
