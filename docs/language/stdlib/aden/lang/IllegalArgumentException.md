# aden.lang.IllegalArgumentException

Kind: ``class``

Source: ``stdlib/src/aden/lang/IllegalArgumentException.aden``

## Summary

Signals that a method received an invalid argument.

## Declaration

```aden
public class IllegalArgumentException extends RuntimeException
```

## Members

### ``public IllegalArgumentException()``

Creates an invalid-argument exception with no message text.
Use this for generic argument-validation failures.

### ``public IllegalArgumentException(String message)``

Creates an invalid-argument exception with the supplied message text.
Use this when reporting which argument rule failed.

### ``public IllegalArgumentException(String message, Throwable cause)``

Creates an invalid-argument exception with both a message and a cause.
Use this when surfacing argument-validation context plus the original failure.
