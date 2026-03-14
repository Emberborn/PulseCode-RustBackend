# com.pulse.lang.NullPointerException

Kind: ``class``

Source: ``stdlib/src/com/pulse/lang/NullPointerException.pulse``

## Summary

Signals that null was used where a value was required.

## Declaration

```pulse
public class NullPointerException extends RuntimeException
```

## Members

### ``public NullPointerException()``

Creates a null-pointer exception with no message text.
Use this for generic null-dereference failures.

### ``public NullPointerException(String message)``

Creates a null-pointer exception with the supplied message text.
Use this when reporting which null rule failed.

### ``public NullPointerException(String message, Throwable cause)``

Creates a null-pointer exception with both a message and a cause.
Use this when preserving a lower-level cause with added null-related context.
