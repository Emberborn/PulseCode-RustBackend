# pulse.concurrent.Event

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/Event.pulse``

## Summary

OS-backed event primitive for the early concurrency floor.
This is a low-level signaling object, not the final language-level monitor or future model.

## Declaration

```pulse
public final class Event implements AutoCloseable
```

## Members

### ``public static Event createManualReset(boolean initialState)``

Creates a manual-reset event with the requested initial state.

### ``public static Event createAutoReset(boolean initialState)``

Creates an auto-reset event with the requested initial state.

### ``public boolean isManualReset()``

Returns whether this event stays signaled until explicitly reset.

### ``public boolean isClosed()``

Returns whether this event has already been closed.

### ``public boolean waitOne(long timeoutMillis)``

Waits for the event to become signaled.

### ``public void set()``

Signals the event.

### ``public void reset()``

Resets the event to the non-signaled state.

### ``public void close()``

Closes the underlying host event handle.
