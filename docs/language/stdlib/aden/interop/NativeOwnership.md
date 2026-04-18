# aden.interop.NativeOwnership

Kind: ``class``

Source: ``stdlib/src/aden/interop/NativeOwnership.aden``

## Summary

Ownership modes for public interop-backed resources.
Use these to decide whether Aden should release one foreign resource, only borrow it, or leave it under explicit manual control.

## Declaration

```aden
public final class NativeOwnership
```

## Members

### ``public static final int BORROWED = 0;``

Borrowed foreign resource mode.
Use this when Aden may read or write through one foreign resource but must never release it.

### ``public static final int ADOPTED = 1;``

Adopted foreign resource mode.
Use this when Aden owns the foreign resource and should release it on explicit close or ARC teardown.

### ``public static final int MANUAL = 2;``

Manual foreign resource mode.
Use this when advanced code wants Aden wrappers without automatic release behavior.
