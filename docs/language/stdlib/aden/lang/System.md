# aden.lang.System

Kind: ``class``

Source: ``stdlib/src/aden/lang/System.aden``

## Summary

Process-level system facade for standard streams, timing, and process exit.

## Declaration

```aden
public final class System
```

## Members

### ``public static final ConsoleReader in = new ConsoleReader();``

Standard console input reader for the current process.
Use this for line-oriented interactive input through the runtime-backed console baseline.

### ``public static final PrintStream out = new PrintStream();``

Standard console output stream for the current process.
Use this when code wants an object-oriented output surface instead of IO helpers.

### ``public static final PrintStream err = new PrintStream(true);``

Standard error stream for the current process.
Use this when diagnostics should be separated from ordinary output.

### ``public static long currentTimeMillis()``

Returns the current wall-clock time in Unix epoch milliseconds.
Use this for ordinary elapsed-time snapshots and timestamps.

### ``public static long nanoTime()``

Returns a monotonic nanosecond-style counter for elapsed-time measurement.
Use this for relative timing rather than wall-clock timestamps.

### ``public static void exit(int status)``

Terminates the current process with the supplied exit status.
Use this when application logic needs an explicit process result code.
