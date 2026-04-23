# pulse.concurrent.Executor

Kind: ``interface``

Source: ``stdlib/src/pulse/concurrent/Executor.pulse``

## Summary

Fire-and-forget task execution contract.
This is the minimal executor seam required before self-sustained hosting:
accept runnable work and launch it under the owned thread/concurrency floor.

## Declaration

```pulse
public interface Executor
```

## Members

### ``public void execute(Runnable task);``

Executes one runnable task.
