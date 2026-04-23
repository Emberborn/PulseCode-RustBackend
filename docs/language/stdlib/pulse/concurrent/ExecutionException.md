# pulse.concurrent.ExecutionException

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/ExecutionException.pulse``

## Summary

Signals that a submitted task failed while executing.

## Declaration

```pulse
public class ExecutionException extends RuntimeException
```

## Members

### ``public ExecutionException()``

Creates an execution exception with no detail message.

### ``public ExecutionException(String message)``

Creates an execution exception with the supplied message.

### ``public ExecutionException(String message, Throwable cause)``

Creates an execution exception with a message and cause.
