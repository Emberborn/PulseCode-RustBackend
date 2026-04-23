# pulse.concurrent.RecursiveAction

Kind: ``class``

Source: ``stdlib/src/pulse/concurrent/RecursiveAction.pulse``

## Summary

Recursive fork-join task base for side-effect work without a result value.

## Declaration

```pulse
public abstract class RecursiveAction extends ForkJoinTask<Object>
```

## Members

### ``public RecursiveAction()``

Creates one recursive action task.

### ``protected abstract void computeAction();``

Computes this action's side effects when executed by a worker thread.
