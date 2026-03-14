# com.pulse.collections.Queue

Kind: ``interface``

Source: ``stdlib/src/com/pulse/collections/Queue.pulse``

## Summary

Queue contract for ordered head/tail access.

## Declaration

```pulse
interface Queue
```

## Members

### ``void offer(int value);``

Adds a value at the tail of the queue.
Use this when scheduling work or storing FIFO values.

### ``int poll();``

Removes and returns the head value from the queue.
Use this when consuming queued values in FIFO order.

### ``boolean isEmpty();``

Reports whether the queue currently holds any values.
Use this before polling when code must avoid empty-queue failures.
