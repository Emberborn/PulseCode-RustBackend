# com.pulse.lang.IndexOutOfBoundsException

Kind: ``class``

Source: ``stdlib/src/com/pulse/lang/IndexOutOfBoundsException.pulse``

## Summary

Signals that an index fell outside the valid range.

## Declaration

```pulse
public class IndexOutOfBoundsException extends RuntimeException
```

## Members

### ``public IndexOutOfBoundsException()``

Creates an index-out-of-bounds exception with no message text.
Use this for generic range-validation failures.

### ``public IndexOutOfBoundsException(String message)``

Creates an index-out-of-bounds exception with the supplied message text.
Use this when reporting which index rule failed.

### ``public IndexOutOfBoundsException(String message, Throwable cause)``

Creates an index-out-of-bounds exception with both a message and a cause.
Use this when surfacing range-validation context plus the original failure.
