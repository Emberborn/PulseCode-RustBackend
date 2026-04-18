# aden.lang.Throwable

Kind: ``class``

Source: ``stdlib/src/aden/lang/Throwable.aden``

## Summary

Root throwable type for Aden Lang error values.

## Declaration

```aden
public class Throwable extends Object
```

## Members

### ``public Throwable()``

Creates a throwable with no detail message or cause.
Use this for generic error construction when no extra detail is needed.

### ``public Throwable(String message)``

Creates a throwable with the supplied message text.
Use this when propagating a human-readable error description.

### ``public Throwable(String message, Throwable cause)``

Creates a throwable with both a detail message and a cause.
Use this when preserving a lower-level failure while adding higher-level context.

### ``protected void initThrowableState(String typeName, String message, Throwable cause)``

Initializes the throwable state from subclass constructors.
Use this when a subtype needs Java-like constructor overloads without duplicating field ownership.

### ``public String getMessage()``

Returns the stored throwable message.
Use this when reporting or formatting error details.

### ``public Throwable getCause()``

Returns the wrapped cause when one exists.
Use this when preserving or inspecting chained failure state.

### ``public Throwable initCause(Throwable cause)``

Assigns a cause to this throwable once.
Use this when a throwable must be created first and linked to its cause later.

### ``protected String formatThrowable(String typeName)``

Formats a Java-like type-plus-message display string for a throwable subtype.
Use this from subclass `toString()` implementations instead of duplicating message checks.

### ``public String describe()``

Returns the throwable text plus its cause chain.
Use this when the full failure chain needs to be rendered for fail-fast output.

### ``public String toString()``

Returns a display form for the throwable.
Use this when emitting the throwable directly as text.

### ``public void panic()``

Terminates the current program using this throwable as the fail-fast payload.
This is the current stdlib bridge for uncaught throwable termination after runtime
exception propagation has reached the fail-fast boundary.
