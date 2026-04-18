# aden.process.Processes

Kind: ``class``

Source: ``stdlib/src/aden/process/Processes.aden``

## Summary

Host-backed process execution helpers for the public stdlib process surface.

## Declaration

```aden
public final class Processes
```

## Members

### ``public static ProcessResult execute(``

Executes one host process plan and captures stdout/stderr into text files under the supplied capture root.
Use this as the current public stdlib host-process execution entrypoint.
