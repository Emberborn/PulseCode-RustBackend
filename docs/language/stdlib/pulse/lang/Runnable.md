# pulse.lang.Runnable

Kind: ``interface``

Source: ``stdlib/src/pulse/lang/Runnable.pulse``

## Summary

Minimal executable task contract for deferred threading and executor work.

## Declaration

```pulse
public interface Runnable
```

## Members

### ``public void run();``

Runs the task body.
Use this for callback-style task execution before the fuller thread/runtime surface lands.
