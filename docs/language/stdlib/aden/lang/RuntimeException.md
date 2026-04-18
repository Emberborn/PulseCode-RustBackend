# aden.lang.RuntimeException

Kind: ``class``

Source: ``stdlib/src/aden/lang/RuntimeException.aden``

## Summary

Base runtime-exception style type in the current hierarchy.

## Declaration

```aden
public class RuntimeException extends Exception
```

## Members

### ``public RuntimeException()``

Creates a runtime exception with no message text.
Use this for generic runtime-failure construction.

### ``public RuntimeException(String message)``

Creates a runtime exception with the supplied message text.
Use this when reporting a runtime failure with extra detail.

### ``public RuntimeException(String message, Throwable cause)``

Creates a runtime exception with both a message and a cause.
Use this when surfacing higher-level context for an unchecked failure.
