# aden.lang.Exception

Kind: ``class``

Source: ``stdlib/src/aden/lang/Exception.aden``

## Summary

Base checked-exception style type in the current hierarchy.

## Declaration

```aden
public class Exception extends Throwable
```

## Members

### ``public Exception()``

Creates an exception with no message text.
Use this for generic checked-exception construction.

### ``public Exception(String message)``

Creates an exception with the supplied message text.
Use this when reporting a checked failure with additional detail.

### ``public Exception(String message, Throwable cause)``

Creates an exception with both a message and a cause.
Use this when surfacing higher-level context while preserving the original failure.
