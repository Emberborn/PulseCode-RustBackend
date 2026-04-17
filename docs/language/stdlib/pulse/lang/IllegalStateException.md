# pulse.lang.IllegalStateException

Kind: ``class``

Source: ``stdlib/src/pulse/lang/IllegalStateException.pulse``

## Summary

Signals that an operation was invoked in an invalid state.

## Declaration

```pulse
public class IllegalStateException extends RuntimeException
```

## Members

### ``public IllegalStateException()``

Creates an illegal-state exception with no message text.
Use this for generic state-validation failures.

### ``public IllegalStateException(String message)``

Creates an illegal-state exception with the supplied message text.
Use this when reporting which state rule failed.

### ``public IllegalStateException(String message, Throwable cause)``

Creates an illegal-state exception with both a message and a cause.
Use this when surfacing state-validation context plus the original failure.
