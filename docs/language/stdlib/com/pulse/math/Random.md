# com.pulse.math.Random

Kind: ``class``

Source: ``stdlib/src/com/pulse/math/Random.pulse``

## Summary

Deterministic pseudo-random generator facade.

## Declaration

```pulse
class Random
```

## Members

### ``public Random(int seed)``

Creates a generator with the supplied seed.
Use this when repeatable pseudo-random sequences are desired.

### ``public int nextInt(int bound)``

Returns the next pseudo-random integer in the range [0, bound).
Use this when bounded integer sampling is needed.
