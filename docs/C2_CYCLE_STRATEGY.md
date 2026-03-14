# C2 Cycle Strategy (Locked)

## Strategy
- ARC primary ownership model.
- Background cycle detection with trial-deletion style passes.
- Weak references supported as an escape hatch (`weakNew`/`weakGet`/`weakClear`).

## Cadence Contract
- Schema: `pulsec.arc.cycle.v1`.
- Young pass window: `64`.
- Full pass interval: every `8` ticks.
- Entry intrinsic: `arcCycleTick`.

## Failure/Lag Contract
- Zero-reclaim lag threshold: `1024`.
- Lag action: `track`.
- Behavior is deterministic and observable in stage locks.

## Runtime Expectations
- Young pass scans bounded windows for predictable cost.
- Full pass periodically scans full active domain for reclamation opportunities.
- Cycle handling is hardening-locked for C2; future strategy changes require explicit versioning/documentation updates.
