# aden.lang.NumberFormatException

Kind: ``class``

Source: ``stdlib/src/aden/lang/NumberFormatException.aden``

## Summary

Signals that text could not be parsed in the requested numeric format.

## Declaration

```aden
public class NumberFormatException extends RuntimeException
```

## Members

### ``public NumberFormatException()``

Creates a number-format exception with no message text.
Use this for generic parse failures.

### ``public NumberFormatException(String message)``

Creates a number-format exception with the supplied message text.
Use this when reporting which parse rule failed.

### ``public NumberFormatException(String message, Throwable cause)``

Creates a number-format exception with both a message and a cause.
Use this when surfacing parse context plus the original failure.
