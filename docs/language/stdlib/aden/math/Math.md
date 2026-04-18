# aden.math.Math

Kind: ``class``

Source: ``stdlib/src/aden/math/Math.aden``

## Summary

Basic math helper facade for deterministic numeric operations.

## Declaration

```aden
public final class Math
```

## Members

### ``public static final double PI = 3.141592653589793d;``

Circle ratio constant exposed by the math facade.
Use this when code needs a well-known numeric constant.

### ``public static final double E = 2.718281828459045d;``

Natural exponential constant exposed by the math facade.
Use this when code needs the base of the natural logarithm.

### ``public static int abs(int value)``

Returns the absolute value of the supplied integer.
Use this when negative values should be normalized to positive magnitude.
`Integer.MIN_VALUE` is returned unchanged because it cannot be represented as a positive `int`.

### ``public static long abs(long value)``

Returns the absolute value of the supplied long.
Use this when long values should be normalized to positive magnitude.
`Long.MIN_VALUE` is returned unchanged because it cannot be represented as a positive `long`.

### ``public static byte abs(byte value)``

Returns the absolute value of the supplied byte.
Use this when byte values should be normalized to positive magnitude.

### ``public static short abs(short value)``

Returns the absolute value of the supplied short.
Use this when short values should be normalized to positive magnitude.

### ``public static char abs(char value)``

Returns the absolute value of the supplied char.
Chars are already non-negative, so this returns the original value.

### ``public static ubyte abs(ubyte value)``

Returns the absolute value of the supplied unsigned byte.
Unsigned values are already non-negative, so this returns the original value.

### ``public static ushort abs(ushort value)``

Returns the absolute value of the supplied unsigned short.
Unsigned values are already non-negative, so this returns the original value.

### ``public static uint abs(uint value)``

Returns the absolute value of the supplied unsigned int.
Unsigned values are already non-negative, so this returns the original value.

### ``public static ulong abs(ulong value)``

Returns the absolute value of the supplied unsigned long.
Unsigned values are already non-negative, so this returns the original value.

### ``public static float abs(float value)``

Returns the absolute value of the supplied float.
Use this when float values should be normalized to positive magnitude.

### ``public static double abs(double value)``

Returns the absolute value of the supplied double.
Use this when double values should be normalized to positive magnitude.

### ``public static int max(int a, int b)``

Returns the larger of the two supplied integers.
Use this when choosing an upper bound between two values.

### ``public static long max(long a, long b)``

Returns the larger of the two supplied longs.
Use this when choosing an upper bound between long values.

### ``public static byte max(byte a, byte b)``

Returns the larger of the two supplied bytes.

### ``public static short max(short a, short b)``

Returns the larger of the two supplied shorts.

### ``public static char max(char a, char b)``

Returns the larger of the two supplied chars.

### ``public static ubyte max(ubyte a, ubyte b)``

Returns the larger of the two supplied unsigned bytes.

### ``public static ushort max(ushort a, ushort b)``

Returns the larger of the two supplied unsigned shorts.

### ``public static uint max(uint a, uint b)``

Returns the larger of the two supplied unsigned ints.
Use this when choosing an upper bound between unsigned integer values.

### ``public static ulong max(ulong a, ulong b)``

Returns the larger of the two supplied unsigned longs.
Use this when choosing an upper bound between unsigned long values.

### ``public static float max(float a, float b)``

Returns the larger of the two supplied floats.
Use this when choosing an upper bound between float values.

### ``public static double max(double a, double b)``

Returns the larger of the two supplied doubles.
Use this when choosing an upper bound between double values.

### ``public static int min(int a, int b)``

Returns the smaller of the two supplied integers.
Use this when choosing a lower bound between two values.

### ``public static long min(long a, long b)``

Returns the smaller of the two supplied longs.
Use this when choosing a lower bound between long values.

### ``public static byte min(byte a, byte b)``

Returns the smaller of the two supplied bytes.

### ``public static short min(short a, short b)``

Returns the smaller of the two supplied shorts.

### ``public static char min(char a, char b)``

Returns the smaller of the two supplied chars.

### ``public static ubyte min(ubyte a, ubyte b)``

Returns the smaller of the two supplied unsigned bytes.

### ``public static ushort min(ushort a, ushort b)``

Returns the smaller of the two supplied unsigned shorts.

### ``public static uint min(uint a, uint b)``

Returns the smaller of the two supplied unsigned ints.
Use this when choosing a lower bound between unsigned integer values.

### ``public static ulong min(ulong a, ulong b)``

Returns the smaller of the two supplied unsigned longs.
Use this when choosing a lower bound between unsigned long values.

### ``public static float min(float a, float b)``

Returns the smaller of the two supplied floats.
Use this when choosing a lower bound between float values.

### ``public static double min(double a, double b)``

Returns the smaller of the two supplied doubles.
Use this when choosing a lower bound between double values.

### ``public static int clamp(int value, int low, int high)``

Clamps a value into the inclusive low/high range.
Use this when inputs must stay inside a fixed numeric interval.
Invalid ranges where `low > high` are rejected explicitly.

### ``public static long clamp(long value, long low, long high)``

Clamps a long into the inclusive low/high range.
Use this when long inputs must stay inside a fixed numeric interval.
Invalid ranges where `low > high` are rejected explicitly.

### ``public static byte clamp(byte value, byte low, byte high)``

Clamps a byte into the inclusive low/high range.

### ``public static short clamp(short value, short low, short high)``

Clamps a short into the inclusive low/high range.

### ``public static char clamp(char value, char low, char high)``

Clamps a char into the inclusive low/high range.

### ``public static ubyte clamp(ubyte value, ubyte low, ubyte high)``

Clamps an unsigned byte into the inclusive low/high range.

### ``public static ushort clamp(ushort value, ushort low, ushort high)``

Clamps an unsigned short into the inclusive low/high range.

### ``public static uint clamp(uint value, uint low, uint high)``

Clamps an unsigned int into the inclusive low/high range.
Use this when unsigned integer inputs must stay inside a fixed numeric interval.

### ``public static ulong clamp(ulong value, ulong low, ulong high)``

Clamps an unsigned long into the inclusive low/high range.
Use this when unsigned long inputs must stay inside a fixed numeric interval.

### ``public static float clamp(float value, float low, float high)``

Clamps a float into the inclusive low/high range.
Use this when float inputs must stay inside a fixed numeric interval.

### ``public static double clamp(double value, double low, double high)``

Clamps a double into the inclusive low/high range.
Use this when double inputs must stay inside a fixed numeric interval.

### ``public static int round(float value)``

Rounds the supplied float to the nearest int using half-up behavior.
Use this for practical float-to-int rounding in the current math baseline.
`NaN` rounds to `0`, and infinities/out-of-range values clamp to the nearest `int` bound.

### ``public static long round(double value)``

Rounds the supplied double to the nearest long using half-up behavior.
Use this for practical double-to-long rounding in the current math baseline.
`NaN` rounds to `0`, and infinities/out-of-range values clamp to the nearest `long` bound.

### ``public static double floor(double value)``

Returns the greatest integral double less than or equal to the supplied value.
Use this for practical floor-style rounding in the current math baseline.
`NaN`, infinities, and signed zero are returned unchanged.

### ``public static float floor(float value)``

Returns the greatest integral float less than or equal to the supplied value.
Use this for practical floor-style rounding while staying on the float lane.

### ``public static double ceil(double value)``

Returns the least integral double greater than or equal to the supplied value.
Use this for practical ceil-style rounding in the current math baseline.
`NaN`, infinities, and signed zero are returned unchanged.

### ``public static float ceil(float value)``

Returns the least integral float greater than or equal to the supplied value.
Use this for practical ceil-style rounding while staying on the float lane.

### ``public static float signum(float value)``

Returns the sign of the supplied float as `-1.0f`, `0.0f`, or `1.0f`.
Use this when code needs the directional sign of a float without changing lanes.
`NaN` is returned unchanged and signed zero is preserved.

### ``public static double signum(double value)``

Returns the sign of the supplied double as `-1.0d`, `0.0d`, or `1.0d`.
Use this when code needs the directional sign of a double without changing lanes.
`NaN` is returned unchanged and signed zero is preserved.

### ``public static int signum(int value)``

Returns the sign of the supplied integer as `-1`, `0`, or `1`.
Use this when integer code needs directional sign without branching at each call site.

### ``public static long signum(long value)``

Returns the sign of the supplied long as `-1L`, `0L`, or `1L`.
Use this when long code needs directional sign without branching at each call site.

### ``public static byte signum(byte value)``

Returns the sign of the supplied byte as `-1`, `0`, or `1`.

### ``public static short signum(short value)``

Returns the sign of the supplied short as `-1`, `0`, or `1`.

### ``public static char signum(char value)``

Returns `0` for zero chars and `1` otherwise.

### ``public static uint signum(uint value)``

Returns `0u` for zero and `1u` for any positive unsigned int.
Use this when unsigned integer code needs a deterministic presence-of-magnitude result.

### ``public static ulong signum(ulong value)``

Returns `0ul` for zero and `1ul` for any positive unsigned long.
Use this when unsigned long code needs a deterministic presence-of-magnitude result.

### ``public static ubyte signum(ubyte value)``

Returns `0ub` for zero and `1ub` otherwise.

### ``public static ushort signum(ushort value)``

Returns `0us` for zero and `1us` otherwise.

### ``public static float sqrt(float value)``

Returns the square root of the supplied float using the current Newton-style baseline.
Negative inputs are rejected explicitly until fuller NaN policy lands later.

### ``public static double sqrt(int value)``

Returns the square root of the supplied integer as a double.
Use this when integer code needs a root helper without manual widening at the call site.

### ``public static double sqrt(long value)``

Returns the square root of the supplied long as a double.
Use this when long code needs a root helper without manual widening at the call site.

### ``public static double sqrt(byte value)``

Returns the square root of the supplied byte as a double.

### ``public static double sqrt(short value)``

Returns the square root of the supplied short as a double.

### ``public static double sqrt(char value)``

Returns the square root of the supplied char as a double.

### ``public static double sqrt(ubyte value)``

Returns the square root of the supplied unsigned byte as a double.

### ``public static double sqrt(ushort value)``

Returns the square root of the supplied unsigned short as a double.

### ``public static double sqrt(uint value)``

Returns the square root of the supplied unsigned int as a double.
Use this when unsigned integer code needs a root helper without manual widening.

### ``public static double sqrt(ulong value)``

Returns the square root of the supplied unsigned long as a double.
Use this when unsigned long code needs a root helper without manual widening.

### ``public static double sqrt(double value)``

Returns the square root of the supplied double using the current Newton-style baseline.
Negative inputs are rejected explicitly until fuller NaN policy lands later.

### ``public static int pow(int base, int exponent)``

Raises an integer base to a non-negative integer exponent.
Negative exponents are rejected until the wider numeric policy lands later.

### ``public static long pow(long base, int exponent)``

Raises a long base to a non-negative integer exponent.
Negative exponents are rejected until the wider numeric policy lands later.

### ``public static byte pow(byte base, int exponent)``

Raises a byte base to a non-negative integer exponent.

### ``public static short pow(short base, int exponent)``

Raises a short base to a non-negative integer exponent.

### ``public static char pow(char base, int exponent)``

Raises a char base to a non-negative integer exponent.

### ``public static uint pow(uint base, int exponent)``

Raises an unsigned int base to a non-negative integer exponent.
Negative exponents are rejected until the wider numeric policy lands later.

### ``public static ulong pow(ulong base, int exponent)``

Raises an unsigned long base to a non-negative integer exponent.
Negative exponents are rejected until the wider numeric policy lands later.

### ``public static ubyte pow(ubyte base, int exponent)``

Raises an unsigned byte base to a non-negative integer exponent.

### ``public static ushort pow(ushort base, int exponent)``

Raises an unsigned short base to a non-negative integer exponent.

### ``public static double pow(double base, int exponent)``

Raises a double base to an integer exponent.
Negative exponents use the reciprocal of the positive-power result.
The integer-exponent path uses exponentiation by squaring so extreme exponents stay practical.

### ``public static float pow(float base, int exponent)``

Raises a float base to an integer exponent.
Negative exponents use the reciprocal of the positive-power result.

### ``public static boolean isNaN(float value)``

Returns whether the supplied float is NaN.
Use this when code must branch on invalid floating-point values explicitly.

### ``public static boolean isNaN(double value)``

Returns whether the supplied double is NaN.
Use this when code must branch on invalid floating-point values explicitly.

### ``public static boolean isInfinite(float value)``

Returns whether the supplied float is positive or negative infinity.
Use this when code must distinguish finite values from overflow-style sentinel values.

### ``public static boolean isInfinite(double value)``

Returns whether the supplied double is positive or negative infinity.
Use this when code must distinguish finite values from overflow-style sentinel values.

### ``public static boolean isFinite(float value)``

Returns whether the supplied float is finite.
Use this when code must distinguish ordinary finite values from NaN and infinity.

### ``public static boolean isFinite(double value)``

Returns whether the supplied double is finite.
Use this when code must distinguish ordinary finite values from NaN and infinity.

### ``public static float copySign(float magnitude, float sign)``

Returns the magnitude of the first argument with the sign of the second.
Use this when code needs deterministic sign transfer without manual branching.
Negative zero on the sign input counts as a negative sign source.

### ``public static double copySign(double magnitude, double sign)``

Returns the magnitude of the first argument with the sign of the second.
Use this when code needs deterministic sign transfer without manual branching.
Negative zero on the sign input counts as a negative sign source.

### ``public static float hypot(float x, float y)``

Returns the length of the hypotenuse for the supplied float legs.
Use this for practical geometry helpers without hand-written root arithmetic at each call site.

### ``public static double hypot(byte x, byte y)``

Returns the length of the hypotenuse for the supplied byte legs.

### ``public static double hypot(short x, short y)``

Returns the length of the hypotenuse for the supplied short legs.

### ``public static double hypot(char x, char y)``

Returns the length of the hypotenuse for the supplied char legs.

### ``public static double hypot(int x, int y)``

Returns the length of the hypotenuse for the supplied int legs.

### ``public static double hypot(long x, long y)``

Returns the length of the hypotenuse for the supplied long legs.

### ``public static double hypot(ubyte x, ubyte y)``

Returns the length of the hypotenuse for the supplied unsigned byte legs.

### ``public static double hypot(ushort x, ushort y)``

Returns the length of the hypotenuse for the supplied unsigned short legs.

### ``public static double hypot(uint x, uint y)``

Returns the length of the hypotenuse for the supplied unsigned int legs.

### ``public static double hypot(ulong x, ulong y)``

Returns the length of the hypotenuse for the supplied unsigned long legs.

### ``public static double hypot(double x, double y)``

Returns the length of the hypotenuse for the supplied double legs.
Use this for practical geometry helpers without hand-written root arithmetic at each call site.
The current implementation uses scaling so large finite inputs do not overflow through `x*x + y*y`.

### ``public static float sin(float radians)``

Returns the sine of the supplied float angle in radians.
Use this for practical trigonometric helpers while staying on the float lane.

### ``public static double sin(double radians)``

Returns the sine of the supplied angle in radians.
Use this for practical trigonometric helpers in the current math closure.

### ``public static float cos(float radians)``

Returns the cosine of the supplied float angle in radians.
Use this for practical trigonometric helpers while staying on the float lane.

### ``public static double cos(double radians)``

Returns the cosine of the supplied angle in radians.
Use this for practical trigonometric helpers in the current math closure.

### ``public static float tan(float radians)``

Returns the tangent of the supplied float angle in radians.
Use this for practical trigonometric helpers while staying on the float lane.

### ``public static double tan(double radians)``

Returns the tangent of the supplied angle in radians.
Use this for practical trigonometric helpers in the current math closure.

### ``public static float ulp(float value)``

Returns the size of the unit in the last place of the supplied float.
Use this when numeric code needs a practical floating-point step size around a value.

### ``public static double ulp(double value)``

Returns the size of the unit in the last place of the supplied double.
Use this when numeric code needs a practical floating-point step size around a value.

### ``public static float nextAfter(float start, float direction)``

Returns the floating-point value adjacent to `start` in the direction of `direction`.
Use this when numeric code needs a deterministic next-step helper around a float value.

### ``public static double nextAfter(double start, double direction)``

Returns the floating-point value adjacent to `start` in the direction of `direction`.
Use this when numeric code needs a deterministic next-step helper around a double value.

### ``public static float nextUp(float value)``

Returns the least floating-point value greater than the supplied float.
Use this when numeric code needs the next representable float toward positive infinity.

### ``public static double nextUp(double value)``

Returns the least floating-point value greater than the supplied value.
Use this when numeric code needs the next representable double toward positive infinity.

### ``public static float nextDown(float value)``

Returns the greatest floating-point value less than the supplied float.
Use this when numeric code needs the next representable float toward negative infinity.

### ``public static double nextDown(double value)``

Returns the greatest floating-point value less than the supplied value.
Use this when numeric code needs the next representable double toward negative infinity.

### ``public static boolean isNormal(float value)``

Returns whether the supplied float is finite and within the normal range.
Use this when numeric code needs to distinguish subnormal/zero values from ordinary finite floats.

### ``public static boolean isNormal(double value)``

Returns whether the supplied value is finite and within the normal range.
Use this when numeric code needs to distinguish subnormal/zero values from ordinary finite doubles.

### ``public static int getExponent(float value)``

Returns the unbiased binary exponent for the supplied float.
Subnormal and zero values return `-127` in the current baseline.

### ``public static int getExponent(double value)``

Returns the unbiased binary exponent for the supplied value.
Subnormal and zero values return `-1023` in the current baseline.

### ``public static float scalb(float value, int scaleFactor)``

Scales the supplied float by `2^scaleFactor`.
Use this for practical binary scaling without reimplementing repeated multiply/divide loops at the call site.

### ``public static double scalb(double value, int scaleFactor)``

Scales the supplied value by `2^scaleFactor`.
Use this for practical binary scaling without reimplementing repeated multiply/divide loops at the call site.

### ``public static float cbrt(float value)``

Returns the cube root of the supplied float.
Use this for practical real-valued root helpers while staying on the float lane.

### ``public static double cbrt(double value)``

Returns the cube root of the supplied value.
Use this for practical real-valued root helpers in the current math closure.

### ``public static float exp(float value)``

Returns e raised to the supplied float power.
Use this for practical exponential helpers while staying on the float lane.

### ``public static double exp(double value)``

Returns e raised to the supplied power.
Use this for practical exponential helpers in the current math closure.

### ``public static float log(float value)``

Returns the natural logarithm of the supplied float value.
Use this for practical logarithmic helpers while staying on the float lane.

### ``public static double log(double value)``

Returns the natural logarithm of the supplied positive value.
Use this for practical logarithmic helpers in the current math closure.

### ``public static float log10(float value)``

Returns the base-10 logarithm of the supplied float value.
Use this for practical logarithmic helpers while staying on the float lane.

### ``public static double log10(double value)``

Returns the base-10 logarithm of the supplied positive value.
Use this for practical logarithmic helpers in the current math closure.

### ``public static float expm1(float value)``

Returns `exp(value) - 1` while preserving more accuracy near zero.
Use this when exponential growth is being measured relative to a zero baseline.

### ``public static double expm1(double value)``

Returns `exp(value) - 1` while preserving more accuracy near zero.
Use this when exponential growth is being measured relative to a zero baseline.

### ``public static float log1p(float value)``

Returns `log(1 + value)` while preserving more accuracy near zero.
Use this when logarithmic growth is being measured relative to a zero baseline.

### ``public static double log1p(double value)``

Returns `log(1 + value)` while preserving more accuracy near zero.
Use this when logarithmic growth is being measured relative to a zero baseline.

### ``public static float asin(float value)``

Returns the arc-sine of the supplied float value in radians.
Use this for practical inverse-trigonometric helpers while staying on the float lane.

### ``public static double asin(double value)``

Returns the arc-sine of the supplied value in radians.
Use this for practical inverse-trigonometric helpers in the current math closure.

### ``public static float acos(float value)``

Returns the arc-cosine of the supplied float value in radians.
Use this for practical inverse-trigonometric helpers while staying on the float lane.

### ``public static double acos(double value)``

Returns the arc-cosine of the supplied value in radians.
Use this for practical inverse-trigonometric helpers in the current math closure.

### ``public static float atan(float value)``

Returns the arc-tangent of the supplied float value in radians.
Use this for practical inverse-trigonometric helpers while staying on the float lane.

### ``public static double atan(double value)``

Returns the arc-tangent of the supplied value in radians.
Use this for practical inverse-trigonometric helpers in the current math closure.

### ``public static float atan2(float y, float x)``

Returns the two-argument arc-tangent of the supplied float y/x pair in radians.
Use this for practical quadrant-aware inverse-trigonometric helpers while staying on the float lane.

### ``public static double atan2(double y, double x)``

Returns the two-argument arc-tangent of the supplied y/x pair in radians.
Use this for practical quadrant-aware inverse-trigonometric helpers in the current math closure.
The current baseline returns `0.0d` for `atan2(0.0d, 0.0d)`.

### ``public static float sinh(float value)``

Returns the hyperbolic sine of the supplied float value.
Use this for practical hyperbolic helpers while staying on the float lane.

### ``public static double sinh(double value)``

Returns the hyperbolic sine of the supplied value.
Use this for practical hyperbolic helpers in the current math closure.

### ``public static float cosh(float value)``

Returns the hyperbolic cosine of the supplied float value.
Use this for practical hyperbolic helpers while staying on the float lane.

### ``public static double cosh(double value)``

Returns the hyperbolic cosine of the supplied value.
Use this for practical hyperbolic helpers in the current math closure.

### ``public static float tanh(float value)``

Returns the hyperbolic tangent of the supplied float value.
Use this for practical hyperbolic helpers while staying on the float lane.

### ``public static double tanh(double value)``

Returns the hyperbolic tangent of the supplied value.
Use this for practical hyperbolic helpers in the current math closure.

### ``public static float IEEEremainder(float dividend, float divisor)``

Returns the IEEE-style remainder for the supplied float pair.
Use this when code needs remainder semantics based on the nearest integral quotient.

### ``public static double IEEEremainder(double dividend, double divisor)``

Returns the IEEE-style remainder for the supplied pair.
Use this when code needs remainder semantics based on the nearest integral quotient.

### ``public static float rint(float value)``

Returns the nearest integral float value using half-even tie breaking.
Use this when numeric code needs an integral-value float without switching to the `long` round contract.

### ``public static double rint(double value)``

Returns the nearest integral value using half-even tie breaking.
Use this when numeric code needs an integral-value double without switching to the `long` round contract.

### ``public static float toRadians(float degrees)``

Converts degrees into radians while staying on the float lane.
Use this when float-oriented code needs angle conversion without widening at the call site.

### ``public static double toRadians(double degrees)``

Converts degrees into radians.
Use this when code needs practical angle conversion helpers without a fuller trig surface yet.

### ``public static double toDegrees(double radians)``

Converts radians into degrees.
Use this when code needs practical angle conversion helpers without a fuller trig surface yet.

### ``public static float toDegrees(float radians)``

Converts radians into degrees while staying on the float lane.
Use this when float-oriented code needs angle conversion without widening at the call site.

### ``public static int floorDiv(int dividend, int divisor)``

Returns the mathematical floor division result for two integers.
Use this when negative operands should round toward negative infinity instead of zero.

### ``public static long floorDiv(long dividend, long divisor)``

Returns the mathematical floor division result for two longs.
Use this when negative long operands should round toward negative infinity instead of zero.

### ``public static uint floorDiv(uint dividend, uint divisor)``

Returns the floor division result for two unsigned ints.
Unsigned operands are already non-negative, so this follows ordinary integer division.

### ``public static ulong floorDiv(ulong dividend, ulong divisor)``

Returns the floor division result for two unsigned longs.
Unsigned operands are already non-negative, so this follows ordinary long division.

### ``public static int floorMod(int dividend, int divisor)``

Returns the mathematical floor modulus result for two integers.
Use this when the remainder should keep the divisor sign instead of truncation semantics.

### ``public static long floorMod(long dividend, long divisor)``

Returns the mathematical floor modulus result for two longs.
Use this when the remainder should keep the divisor sign instead of truncation semantics.

### ``public static uint floorMod(uint dividend, uint divisor)``

Returns the floor modulus result for two unsigned ints.
Unsigned operands are already non-negative, so this follows ordinary remainder semantics.

### ``public static ulong floorMod(ulong dividend, ulong divisor)``

Returns the floor modulus result for two unsigned longs.
Unsigned operands are already non-negative, so this follows ordinary remainder semantics.
