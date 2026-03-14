# com.pulse.lang.UnsupportedOperationException

Kind: ``class``

Source: ``stdlib/src/com/pulse/lang/UnsupportedOperationException.pulse``

## Summary

Signals that an operation is not supported by the target value.

## Declaration

```pulse
public class UnsupportedOperationException extends RuntimeException
```

## Members

### ``public UnsupportedOperationException()``

Creates an unsupported-operation exception with no message text.
Use this for generic unsupported-operation failures.

### ``public UnsupportedOperationException(String message)``

Creates an unsupported-operation exception with the supplied message text.
Use this when reporting which unsupported path was requested.

### ``public UnsupportedOperationException(String message, Throwable cause)``

Creates an unsupported-operation exception with both a message and a cause.
Use this when surfacing unsupported-operation context plus the original failure.
