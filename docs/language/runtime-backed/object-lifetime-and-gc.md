# Object Lifetime And GC

This page documents the runtime-backed memory model currently used by Pulse programs.

## Current Model

Pulse currently uses ARC-backed runtime ownership with cycle-reclamation support.

That means:

- object lifetimes are tracked by the runtime
- cycles are reclaimed by the runtime cleanup strategy
- userland objects running through the language/runtime pipeline are covered by this model

## Practical Meaning

- object creation is not just a parser feature; it depends on runtime allocation support
- object release behavior depends on the backend/runtime, not only on source structure
- cycle cleanup is part of the runtime contract

## Future Direction

- runtime ownership remains active for current language execution
- broader library/runtime packaging work is tracked separately from this memory model

## Related

- [Program Entry And Execution](./program-entry-and-execution.md)
- [Runtime Type And Null Behavior](./runtime-type-and-null-behavior.md)
