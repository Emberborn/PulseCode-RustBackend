# pulse.math.Random

Kind: ``class``

Source: ``stdlib/src/pulse/math/Random.pulse``

## Summary

Deterministic pseudo-random generator facade.

## Declaration

```pulse
public class Random
```

## Members

### ``public Random()``

Creates a generator with the default deterministic seed.
Use this when a caller wants repeatable behavior without managing the seed explicitly.

### ``public Random(int seed)``

Creates a generator with the supplied seed.
Use this when repeatable pseudo-random sequences are desired.

### ``public Random(long seed)``

Creates a generator with the supplied long seed.
Use this when deterministic callers want a wider seed input without changing the current int-backed core.

### ``public Random(uint seed)``

Creates a generator with the supplied unsigned int seed.
Use this when deterministic callers want unsigned seed ingress without changing the current int-backed core.

### ``public Random(ulong seed)``

Creates a generator with the supplied unsigned long seed.
Use this when deterministic callers want the widest unsigned seed ingress on the current deterministic core.

### ``public void setSeed(int seed)``

Replaces the current generator seed.
Use this to restart deterministic generation from a known state.

### ``public void setSeed(long seed)``

Replaces the current generator seed from a long input.
Use this when deterministic callers want wider seed ingress without changing the current state core.

### ``public void setSeed(uint seed)``

Replaces the current generator seed from an unsigned int input.
Use this when deterministic callers want unsigned seed ingress without changing the current state core.

### ``public void setSeed(ulong seed)``

Replaces the current generator seed from an unsigned long input.
Use this when deterministic callers want the widest unsigned seed ingress on the current state core.

### ``public int getSeed()``

Returns the current generator seed/state.
Use this when deterministic workflows need to snapshot or inspect the generator state.

### ``public Random copy()``

Returns a deterministic copy of this generator, including any cached Gaussian state.
Use this when deterministic workflows need to branch or snapshot a stream without mutating the original.

### ``public void reset()``

Restores the generator to the default deterministic seed.
Use this when a caller wants to restart the default repeatable sequence.

### ``public void skip(int count)``

Advances the generator by the supplied number of core samples.
Use this when deterministic workflows need to fast-forward a stream without consuming each value directly.

### ``public int nextInt()``

Returns the next pseudo-random integer over the current deterministic state sequence.
Use this when an unbounded non-negative integer sample is needed.

### ``public int nextInt(int bound)``

Returns the next pseudo-random integer in the range [0, bound).
Use this when bounded integer sampling is needed.

### ``public int nextInt(int origin, int bound)``

Returns the next pseudo-random integer in the range [origin, bound).
Use this when deterministic range sampling is needed.

### ``public boolean nextBoolean()``

Returns the next pseudo-random boolean value.
Use this when deterministic yes/no sampling is needed.

### ``public long nextLong()``

Returns the next pseudo-random long value.
Use this when a wider deterministic integral sample is needed.

### ``public uint nextUInt()``

Returns the next pseudo-random unsigned int value.
Use this when deterministic unsigned integral sampling is needed.

### ``public uint nextUInt(uint bound)``

Returns the next pseudo-random unsigned int value in the range [0, bound).
Use this when bounded unsigned integral sampling is needed.

### ``public uint nextUInt(uint origin, uint bound)``

Returns the next pseudo-random unsigned int value in the range [origin, bound).
Use this when deterministic unsigned range sampling is needed.

### ``public long nextLong(long bound)``

Returns the next pseudo-random long value in the range [0, bound).
Use this when bounded long sampling is needed.

### ``public long nextLong(long origin, long bound)``

Returns the next pseudo-random long value in the range [origin, bound).
Use this when deterministic long-range sampling is needed.

### ``public byte nextByte()``

Returns the next pseudo-random byte value.
Use this when deterministic small signed sampling is needed.

### ``public byte nextByte(byte bound)``

Returns the next pseudo-random byte value in the range [0, bound).
Use this when bounded small signed sampling is needed.

### ``public byte nextByte(byte origin, byte bound)``

Returns the next pseudo-random byte value in the range [origin, bound).
Use this when deterministic small signed range sampling is needed.

### ``public short nextShort()``

Returns the next pseudo-random short value.
Use this when deterministic medium signed sampling is needed.

### ``public short nextShort(short bound)``

Returns the next pseudo-random short value in the range [0, bound).
Use this when bounded medium signed sampling is needed.

### ``public short nextShort(short origin, short bound)``

Returns the next pseudo-random short value in the range [origin, bound).
Use this when deterministic medium signed range sampling is needed.

### ``public char nextChar()``

Returns the next pseudo-random char value.
Use this when deterministic code-unit sampling is needed.

### ``public char nextChar(char bound)``

Returns the next pseudo-random char value in the range [0, bound).
Use this when bounded code-unit sampling is needed.

### ``public char nextChar(char origin, char bound)``

Returns the next pseudo-random char value in the range [origin, bound).
Use this when deterministic code-unit range sampling is needed.

### ``public ulong nextULong()``

Returns the next pseudo-random unsigned long value.
Use this when the widest deterministic unsigned integral sample is needed.

### ``public ulong nextULong(ulong bound)``

Returns the next pseudo-random unsigned long value in the range [0, bound).
Use this when bounded unsigned long sampling is needed.

### ``public ulong nextULong(ulong origin, ulong bound)``

Returns the next pseudo-random unsigned long value in the range [origin, bound).
Use this when deterministic unsigned long-range sampling is needed.

### ``public ubyte nextUByte()``

Returns the next pseudo-random unsigned byte value.
Use this when deterministic small unsigned sampling is needed.

### ``public ubyte nextUByte(ubyte bound)``

Returns the next pseudo-random unsigned byte value in the range [0, bound).
Use this when bounded small unsigned sampling is needed.

### ``public ubyte nextUByte(ubyte origin, ubyte bound)``

Returns the next pseudo-random unsigned byte value in the range [origin, bound).
Use this when deterministic small unsigned range sampling is needed.

### ``public ushort nextUShort()``

Returns the next pseudo-random unsigned short value.
Use this when deterministic medium unsigned sampling is needed.

### ``public ushort nextUShort(ushort bound)``

Returns the next pseudo-random unsigned short value in the range [0, bound).
Use this when bounded medium unsigned sampling is needed.

### ``public ushort nextUShort(ushort origin, ushort bound)``

Returns the next pseudo-random unsigned short value in the range [origin, bound).
Use this when deterministic medium unsigned range sampling is needed.

### ``public float nextFloat()``

Returns the next pseudo-random float value in the range [0.0f, 1.0f).
Use this when deterministic fractional sampling is needed.

### ``public float nextFloat(float bound)``

Returns the next pseudo-random float value in the range [0.0f, bound).
Use this when deterministic bounded fractional sampling is needed.

### ``public float nextFloat(float origin, float bound)``

Returns the next pseudo-random float value in the range [origin, bound).
Use this when deterministic fractional range sampling is needed.

### ``public double nextDouble()``

Returns the next pseudo-random double value in the range [0.0d, 1.0d).
Use this when deterministic fractional sampling is needed.

### ``public double nextDouble(double bound)``

Returns the next pseudo-random double value in the range [0.0d, bound).
Use this when deterministic bounded fractional sampling is needed.

### ``public double nextDouble(double origin, double bound)``

Returns the next pseudo-random double value in the range [origin, bound).
Use this when deterministic double range sampling is needed.

### ``public double nextGaussian()``

Returns the next pseudo-random Gaussian sample with mean 0 and standard deviation 1.
Use this when deterministic normal-distribution sampling is needed.

### ``public double nextGaussian(double mean, double standardDeviation)``

Returns the next pseudo-random Gaussian sample with the supplied mean and standard deviation.
Use this when deterministic normal-distribution sampling should be centered and scaled directly.

### ``public void nextInts(Array target)``

Fills the supplied array with deterministic pseudo-random integers.
Use this when a caller needs repeatable bulk sampling without open-coded loops.

### ``public void nextInts(Array target, int limit)``

Fills the supplied array with deterministic pseudo-random integers in the range [0, bound).
Use this when a caller needs repeatable bounded bulk sampling.

### ``public void nextBytes(Array target)``

Fills the supplied int-lane array with deterministic pseudo-random byte values widened to `int`.
Use this when callers need repeatable small signed sampling in the current runtime-backed array model.

### ``public void nextShorts(Array target)``

Fills the supplied int-lane array with deterministic pseudo-random short values widened to `int`.
Use this when callers need repeatable medium signed sampling in the current runtime-backed array model.

### ``public void nextChars(Array target)``

Fills the supplied int-lane array with deterministic pseudo-random char values widened to `int`.
Use this when callers need repeatable code-unit sampling in the current runtime-backed array model.

### ``public void nextUInts(Array target)``

Fills the supplied int-lane array with deterministic pseudo-random unsigned int values reinterpreted as `int`.
Use this when callers need repeatable unsigned sampling in the current runtime-backed array model.

### ``private int advance()``

Advances the deterministic generator state and returns a non-negative integer sample.
This is the shared core used by the public helper methods.

### ``private int nextBit()``

Returns a single deterministic bit from the shared generator core.

### ``private uint nextRawUInt()``

Returns a full-width unsigned 32-bit sample built on the current deterministic core.

### ``private int nextBoundedInt(int bound)``

Returns a bounded integer sample without modulo bias over the current 31-bit core lane.

### ``private uint nextBoundedUInt(uint bound)``

Returns a bounded unsigned integer sample without modulo bias.

### ``private long nextBoundedLong(long bound)``

Returns a bounded long sample without modulo bias.

### ``private ulong nextBoundedULong(ulong bound)``

Returns a bounded unsigned long sample without modulo bias.

### ``private static int normalizeSeed(long seed)``

Folds a wider seed into the current int-backed deterministic state.

### ``private static int normalizeUnsignedSeed(ulong seed)``

Folds an unsigned wide seed into the current int-backed deterministic state.
