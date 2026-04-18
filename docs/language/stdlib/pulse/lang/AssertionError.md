# pulse.lang.AssertionError

Kind: ``class``

Source: ``stdlib/src/pulse/lang/AssertionError.pulse``

## Summary

Signals that a runtime assertion failed.
This is the current stdlib-owned failure payload behind the `assert` statement baseline.

## Declaration

```pulse
public class AssertionError extends RuntimeException
```

## Members

### ``public AssertionError()``

Creates an assertion error with no detail message.
Use this when an assertion fails without an explicit message payload.

### ``public AssertionError(String message)``

Creates an assertion error with the supplied message.
Use this when an assertion should surface a specific failure detail.

### ``public static void fail()``

Fails the current program with the default assertion payload.
Use this as the stdlib bridge behind bare `assert` statements.

### ``public static void fail(String message)``

Fails the current program with the supplied assertion message.
Use this as the stdlib bridge behind message-bearing `assert` statements.
