# aden.lang.Runnable

Kind: ``interface``

Source: ``stdlib/src/aden/lang/Runnable.aden``

## Summary

Minimal executable task contract for deferred threading and executor work.

## Declaration

```aden
public interface Runnable
```

## Members

### ``public void run();``

Runs the task body.
Use this for callback-style task execution before the fuller thread/runtime surface lands.
