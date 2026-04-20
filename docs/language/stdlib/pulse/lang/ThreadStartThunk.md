# pulse.lang.ThreadStartThunk

Kind: ``class``

Source: ``stdlib/src/pulse/lang/ThreadStartThunk.pulse``

## Summary

Host-thread entry thunk for the first Thread lifecycle floor.

## Declaration

```pulse
public final class ThreadStartThunk implements NativeCallback1
```

## Members

### ``public ThreadStartThunk(Thread owner)``

Creates a native callback thunk that forwards into the owning Thread wrapper.

### ``public long invoke(long arg0)``

Invokes the owned thread target from the native thread start callback.
