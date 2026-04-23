# pulse.concurrent.CancellationException

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/CancellationException.pulse``

## Summary

Signals that a future was cancelled before its value could be observed.

## Declaration

```pulse
public class CancellationException extends RuntimeException
```

## Members

### ``public CancellationException()``

Creates a cancellation exception with no detail message.

### ``public CancellationException(String message)``

Creates a cancellation exception with the supplied message.

### ``public CancellationException(String message, Throwable cause)``

Creates a cancellation exception with a message and cause.
