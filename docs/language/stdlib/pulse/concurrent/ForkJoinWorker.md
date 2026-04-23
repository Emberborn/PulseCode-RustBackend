# pulse.concurrent.ForkJoinWorker

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/ForkJoinWorker.pulse``

## Summary

Internal worker for the fork-join pool baseline.
Each worker owns one local deque so tasks can be pushed locally and stolen
from the opposite end by peer workers.

## Declaration

```pulse
final class ForkJoinWorker implements Runnable
```

## Members

### ``public ForkJoinWorker(ForkJoinPool owner)``

Creates one worker bound to the supplied owning pool.

### ``public void attachThread(Thread thread)``

Records the backing thread after pool startup.

### ``public Thread workerThread()``

Returns the backing worker thread.

### ``public long workerThreadId()``

Returns the current worker thread identifier once running.

### ``public void pushLocalFront(Runnable task)``

Pushes one task onto the local front for fork-style execution.

### ``public void pushExternalBack(Runnable task)``

Pushes one externally submitted task onto the local back.

### ``public Runnable pollLocalFront()``

Polls one locally queued task from the front without waiting.

### ``public Runnable stealFromBack()``

Steals one task from the back without waiting.

### ``public void run()``

Enters the owner's worker loop on the current thread.

### ``public void close()``

Releases worker-local bookkeeping resources.
