# pulse.process.Processes

Kind: ``class``

Source: ``stdlib/src/pulse/process/Processes.pulse``

## Summary

Host-backed process execution helpers for the public stdlib process surface.

## Declaration

```pulse
public final class Processes
```

## Members

### ``public static ProcessResult execute(``

Executes one host process plan and captures stdout/stderr into text files under the supplied capture root.
Use this as the current public stdlib host-process execution entrypoint.
