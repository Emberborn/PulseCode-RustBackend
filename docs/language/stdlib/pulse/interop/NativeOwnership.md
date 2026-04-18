# pulse.interop.NativeOwnership

Kind: ``class``

Source: ``stdlib/src/pulse/interop/NativeOwnership.pulse``

## Summary

Ownership modes for public interop-backed resources.
Use these to decide whether Pulse should release one foreign resource, only borrow it, or leave it under explicit manual control.

## Declaration

```pulse
public final class NativeOwnership
```

## Members

### ``public static final int BORROWED = 0;``

Borrowed foreign resource mode.
Use this when Pulse may read or write through one foreign resource but must never release it.

### ``public static final int ADOPTED = 1;``

Adopted foreign resource mode.
Use this when Pulse owns the foreign resource and should release it on explicit close or ARC teardown.

### ``public static final int MANUAL = 2;``

Manual foreign resource mode.
Use this when advanced code wants Pulse wrappers without automatic release behavior.
