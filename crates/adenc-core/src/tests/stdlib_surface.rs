use super::*;

#[test]
fn check_accepts_com_aden_math_and_collections_baseline() {
    let src = r#"
        package app.core;
        import aden.lang.IO;
        import aden.math.Math;
        import aden.collections.Array;
        import aden.collections.Collection;
        import aden.collections.ArrayList;
        import aden.collections.List;
        import aden.collections.Map;
        import aden.collections.HashMap;

        class Main {
            public static void main() {
                List values = new ArrayList();
                values.add(10);
                values.add(5);
                Collection base = new ArrayList();
                base.size();
                Array arr = new Array(2);
                arr.setInt(0, values.getInt(0));
                arr.setInt(1, values.getInt(1));

                ArrayList copy = new ArrayList();
                copy.add(arr.getInt(0));
                copy.add(arr.getInt(1));

                Map stats = new HashMap();
                stats.putInt("hp", Math.max(copy.getInt(0), copy.getInt(1)));

                IO.println(stats.getInt("hp"));
                IO.println(Math.PI);
            }
        }
    "#;

    check(src).expect("aden baseline classes should typecheck");
}

#[test]
fn check_accepts_raw_object_collection_baseline() {
    let src = r#"
        package app.core;
        import aden.lang.Object;
        import aden.collections.List;
        import aden.collections.ArrayList;
        import aden.collections.Map;
        import aden.collections.HashMap;
        import aden.collections.Set;
        import aden.collections.HashSet;

        class Box {
            public String name;

            public Box(String name) {
                this.name = name;
            }
        }

        class Main {
            public static void main() {
                Box a = new Box("a");
                Box b = new Box("b");

                List list = new ArrayList();
                list.add(a);
                list.add(1, b);
                Object first = list.get(0);
                Object old = list.set(1, a);
                boolean has = list.contains(a);
                int idx = list.indexOf(a);

                Map map = new HashMap();
                Object missing = map.put(a, b);
                Object got = map.get(a);
                boolean key = map.containsKey(a);

                Set set = new HashSet();
                boolean added = set.add(a);
                boolean present = set.contains(a);
            }
        }
    "#;

    check(src).expect("raw-object collection baseline should typecheck");
}

#[test]
fn check_accepts_static_imports_from_com_aden_math() {
    let src = r#"
        package app.core;
        import aden.lang.IO;
        import static aden.math.Math.PI;
        import static aden.math.Math.abs;

        class Main {
            public static void main() {
                int x = abs(-3);
                IO.println(x);
                IO.println(PI);
            }
        }
    "#;

    check(src).expect("static imports from aden math should typecheck");
}

#[test]
fn check_accepts_math_rounding_overloads_and_random_usage() {
    let src = r#"
        package app.core;
        import aden.lang.IO;
        import aden.math.Math;
        import aden.math.Random;

        class Main {
            public static void main() {
                int a = Math.min(2, 9);
                double constantPi = Math.PI;
                double constantE = Math.E;
                int b = Math.clamp(12, 0, 10);
                long c = Math.max(20L, 9L);
                float d = Math.min(2.5f, 2.25f);
                double e = Math.min(3.5d, 3.25d);
                float f = Math.max(2.5f, 2.25f);
                double g = Math.max(3.5d, 3.25d);
                float h = Math.abs(-2.5f);
                double i = Math.abs(-3.25d);
                float j = Math.clamp(7.5f, 0.0f, 5.0f);
                double k = Math.clamp(12.25d, 0.0d, 10.0d);
                float l = Math.signum(-2.5f);
                double m = Math.signum(3.25d);
                int n = Math.signum(-12);
                long o = Math.signum(0L);
                float p = Math.sqrt(2.25f);
                double q = Math.sqrt(9.0d);
                double r = Math.sqrt(16);
                double s = Math.sqrt(25L);
                int t = Math.pow(3, 4);
                long u = Math.pow(2L, 5);
                double v = Math.pow(2.0d, -3);
                float w = Math.pow(2.0f, -2);
                int x = Math.floorDiv(-7, 3);
                long y = Math.floorDiv(-7L, 3L);
                int z = Math.floorMod(-7, 3);
                long aa = Math.floorMod(-7L, 3L);
                int ab = 17 % 5;
                long ac = 17L % 5L;
                double ad = 5.5d % 2.0d;
                int ae = 10;
                ae %= 4;
                float af = Math.ceil(2.2f);
                float ag = Math.floor(-2.2f);
                boolean ah = Math.isNaN(0.0d / 0.0d);
                boolean ai = Math.isInfinite(1.0d / 0.0d);
                boolean aj = Math.isNaN(1.5f);
                boolean ak = Math.isInfinite(2.0f);
                float al = Math.copySign(2.5f, -1.0f);
                double am = Math.copySign(3.25d, -1.0d);
                double an = Math.toRadians(180.0d);
                double ao = Math.toDegrees(Math.PI);
                int ap = Math.round(2.6f);
                long aq = Math.round(-2.6d);
                double ar = Math.ceil(2.2d);
                double as = Math.floor(-2.2d);
                Random rand = new Random(7);
                int at = rand.nextInt(10);
                IO.println(a);
                IO.println(constantPi);
                IO.println(constantE);
                IO.println(b);
                IO.println(c);
                IO.println(d);
                IO.println(e);
                IO.println(f);
                IO.println(g);
                IO.println(h);
                IO.println(i);
                IO.println(j);
                IO.println(k);
                IO.println(l);
                IO.println(m);
                IO.println(n);
                IO.println(o);
                IO.println(p);
                IO.println(q);
                IO.println(r);
                IO.println(s);
                IO.println(t);
                IO.println(u);
                IO.println(v);
                IO.println(w);
                IO.println(x);
                IO.println(y);
                IO.println(z);
                IO.println(aa);
                IO.println(ab);
                IO.println(ac);
                IO.println(ad);
                IO.println(ae);
                IO.println(af);
                IO.println(ag);
                IO.println(ah);
                IO.println(ai);
                IO.println(aj);
                IO.println(ak);
                IO.println(al);
                IO.println(am);
                IO.println(an);
                IO.println(ao);
                IO.println(ap);
                IO.println(aq);
                IO.println(ar);
                IO.println(as);
                IO.println(at);
            }
        }
    "#;

    check(src)
        .expect("math overload growth, rounding helpers, and seeded random usage should typecheck");
}

#[test]
fn check_accepts_unsigned_math_closure_slice() {
    let src = r#"
        package app.core;
        import aden.lang.IO;
        import aden.lang.UInteger;
        import aden.lang.ULong;
        import aden.math.Math;

        class Main {
            public static void main() {
                uint ua = (uint) 7;
                uint ub = (uint) 12;
                ulong uc = (ulong) 4000000000L;
                ulong ud = (ulong) 9L;
                uint minU = Math.min(ua, ub);
                uint maxU = Math.max(ua, ub);
                uint clampU = Math.clamp((uint) 15, (uint) 0, (uint) 10);
                uint signU = Math.signum((uint) 0);
                uint signPositiveU = Math.signum((uint) 5);
                uint powU = Math.pow((uint) 3, 4);
                uint divU = Math.floorDiv((uint) 7, (uint) 3);
                uint modU = Math.floorMod((uint) 7, (uint) 3);
                ulong minUL = Math.min(uc, ud);
                ulong maxUL = Math.max(uc, ud);
                ulong clampUL = Math.clamp((ulong) 25L, (ulong) 0L, (ulong) 10L);
                ulong signUL = Math.signum((ulong) 0L);
                ulong signPositiveUL = Math.signum((ulong) 9L);
                ulong powUL = Math.pow((ulong) 2L, 5);
                ulong divUL = Math.floorDiv((ulong) 7L, (ulong) 3L);
                ulong modUL = Math.floorMod((ulong) 7L, (ulong) 3L);
                uint absU = Math.abs((uint) 4000000000L);
                ulong absUL = Math.abs(ULong.MAX_VALUE);
                double sqrtU = Math.sqrt((uint) 16);
                double sqrtUL = Math.sqrt((ulong) 25L);
                float hypotF = Math.hypot(3.0f, 4.0f);
                double hypotD = Math.hypot(5.0d, 12.0d);
                float radiansF = Math.toRadians(180.0f);
                float degreesF = Math.toDegrees((float) Math.PI);
                IO.println(UInteger.toString(minU));
                IO.println(UInteger.toString(maxU));
                IO.println(UInteger.toString(clampU));
                IO.println(UInteger.toString(signU));
                IO.println(UInteger.toString(signPositiveU));
                IO.println(UInteger.toString(powU));
                IO.println(UInteger.toString(divU));
                IO.println(UInteger.toString(modU));
                IO.println(ULong.toString(minUL));
                IO.println(ULong.toString(maxUL));
                IO.println(ULong.toString(clampUL));
                IO.println(ULong.toString(signUL));
                IO.println(ULong.toString(signPositiveUL));
                IO.println(ULong.toString(powUL));
                IO.println(ULong.toString(divUL));
                IO.println(ULong.toString(modUL));
                IO.println(UInteger.toString(absU));
                IO.println(ULong.toString(absUL));
                IO.println(sqrtU);
                IO.println(sqrtUL);
                IO.println(hypotF);
                IO.println(hypotD);
                IO.println(radiansF);
                IO.println(degreesF);
            }
        }
    "#;

    check(src).expect("unsigned math closure slice should typecheck");
}

#[test]
fn check_accepts_transcendental_math_closure_slice() {
    let src = r#"
        package app.core;
        import aden.lang.IO;
        import aden.math.Math;

        class Main {
            public static void main() {
                double sinD = Math.sin(Math.PI / 2.0d);
                float sinF = Math.sin((float) (Math.PI / 6.0d));
                double cosD = Math.cos(Math.PI);
                float cosF = Math.cos(0.0f);
                double tanD = Math.tan(Math.PI / 4.0d);
                float tanF = Math.tan((float) (Math.PI / 4.0d));
                double expD = Math.exp(1.0d);
                float expF = Math.exp(1.0f);
                double logD = Math.log(Math.E);
                float logF = Math.log(1.0f);
                double log10D = Math.log10(1000.0d);
                float log10F = Math.log10(100.0f);
                IO.println(Math.round(sinD * 1000.0d));
                IO.println(Math.round(sinF * 1000.0f));
                IO.println(Math.round(cosD * 1000.0d));
                IO.println(Math.round(cosF * 1000.0f));
                IO.println(Math.round(tanD * 1000.0d));
                IO.println(Math.round(tanF * 1000.0f));
                IO.println(Math.round(expD * 1000.0d));
                IO.println(Math.round(expF * 1000.0f));
                IO.println(Math.round(logD * 1000.0d));
                IO.println(Math.round(logF * 1000.0f));
                IO.println(Math.round(log10D * 1000.0d));
                IO.println(Math.round(log10F * 1000.0f));
            }
        }
    "#;

    check(src).expect("transcendental math closure slice should typecheck");
}

#[test]
fn check_accepts_inverse_hyperbolic_math_closure_slice() {
    let src = r#"
        package app.core;
        import aden.lang.IO;
        import aden.math.Math;

        class Main {
            public static void main() {
                double asinD = Math.asin(0.5d);
                float asinF = Math.asin(0.5f);
                double acosD = Math.acos(0.5d);
                float acosF = Math.acos(0.5f);
                double atanD = Math.atan(1.0d);
                float atanF = Math.atan(1.0f);
                double atan2D = Math.atan2(1.0d, -1.0d);
                float atan2F = Math.atan2(-1.0f, -1.0f);
                double sinhD = Math.sinh(1.0d);
                float sinhF = Math.sinh(1.0f);
                double coshD = Math.cosh(1.0d);
                float coshF = Math.cosh(1.0f);
                double tanhD = Math.tanh(1.0d);
                float tanhF = Math.tanh(1.0f);
                IO.println(Math.round(asinD * 1000.0d));
                IO.println(Math.round(asinF * 1000.0f));
                IO.println(Math.round(acosD * 1000.0d));
                IO.println(Math.round(acosF * 1000.0f));
                IO.println(Math.round(atanD * 1000.0d));
                IO.println(Math.round(atanF * 1000.0f));
                IO.println(Math.round(atan2D * 1000.0d));
                IO.println(Math.round(atan2F * 1000.0f));
                IO.println(Math.round(sinhD * 1000.0d));
                IO.println(Math.round(sinhF * 1000.0f));
                IO.println(Math.round(coshD * 1000.0d));
                IO.println(Math.round(coshF * 1000.0f));
                IO.println(Math.round(tanhD * 1000.0d));
                IO.println(Math.round(tanhF * 1000.0f));
            }
        }
    "#;

    check(src).expect("inverse and hyperbolic math closure slice should typecheck");
}

#[test]
fn check_accepts_math_special_value_fidelity_slice() {
    let src = r#"
        package app.core;
        import aden.lang.IO;
        import aden.lang.IllegalArgumentException;
        import aden.math.Math;

        class Main {
            public static void main() {
                double nan = 0.0d / 0.0d;
                double positiveInfinity = 1.0d / 0.0d;
                double negativeInfinity = 0.0d - (1.0d / 0.0d);
                double negativeZero = -1.0d / positiveInfinity;
                boolean sqrtNegative = Math.isNaN(Math.sqrt(-1.0d));
                boolean sqrtNaN = Math.isNaN(Math.sqrt(nan));
                boolean sqrtInfinity = Math.isInfinite(Math.sqrt(positiveInfinity));
                boolean logNegative = Math.isNaN(Math.log(-1.0d));
                boolean logNaN = Math.isNaN(Math.log(nan));
                boolean logZero = Math.isInfinite(Math.log(0.0d));
                boolean expNaN = Math.isNaN(Math.exp(nan));
                boolean expPositiveInfinity = Math.isInfinite(Math.exp(positiveInfinity));
                long expNegativeInfinity = Math.round(Math.exp(negativeInfinity) * 1000.0d);
                boolean sinInfinity = Math.isNaN(Math.sin(positiveInfinity));
                boolean tanInfinity = Math.isNaN(Math.tan(positiveInfinity));
                boolean asinOutOfRange = Math.isNaN(Math.asin(2.0d));
                boolean acosOutOfRange = Math.isNaN(Math.acos(-2.0d));
                boolean atanNaN = Math.isNaN(Math.atan(nan));
                long atanPositiveInfinity = Math.round(Math.atan(positiveInfinity) * 1000.0d);
                boolean atan2NaN = Math.isNaN(Math.atan2(nan, 1.0d));
                long atan2Origin = Math.round(Math.atan2(0.0d, 0.0d) * 1000.0d);
                boolean sinhNaN = Math.isNaN(Math.sinh(nan));
                boolean coshInfinity = Math.isInfinite(Math.cosh(positiveInfinity));
                long tanhPositiveInfinity = Math.round(Math.tanh(positiveInfinity) * 1000.0d);
                long tanhNegativeInfinity = Math.round(Math.tanh(negativeInfinity) * 1000.0d);
                boolean absNegativeZero = (1.0d / Math.abs(negativeZero)) == positiveInfinity;
                boolean signumNaN = Math.isNaN(Math.signum(nan));
                boolean signumNegativeZero = (1.0d / Math.signum(negativeZero)) == negativeInfinity;
                boolean copySignNegativeZero = Math.copySign(1.0d, negativeZero) < 0.0d;
                long roundNaN = Math.round(nan);
                long roundPositiveInfinity = Math.round(positiveInfinity);
                long roundNegativeInfinity = Math.round(negativeInfinity);
                boolean floorNegativeZero = (1.0d / Math.floor(negativeZero)) == negativeInfinity;
                boolean ceilNegativeZero = (1.0d / Math.ceil(negativeZero)) == negativeInfinity;
                boolean absIntMin = Math.abs((0 - 2147483647) - 1) == ((0 - 2147483647) - 1);
                boolean absLongMin = Math.abs((0L - 9223372036854775807L) - 1L) == ((0L - 9223372036854775807L) - 1L);
                long powMinExponent = Math.round(Math.pow(1.0d, (0 - 2147483647) - 1) * 1000.0d);
                boolean clampThrows = false;
                boolean finiteOrdinary = Math.isFinite(123.0d);
                boolean finiteInfinity = Math.isFinite(positiveInfinity);
                boolean finiteNaN = Math.isFinite(nan);
                double bigScale = Math.pow(10.0d, 200);
                long stableHypot = Math.round(Math.hypot(3.0d * bigScale, 4.0d * bigScale) / Math.pow(10.0d, 198));
                long ulpDouble = Math.round(Math.ulp(1.0d) * Math.pow(10.0d, 18));
                long ulpFloat = Math.round(Math.ulp(1.0f) * (float) Math.pow(10.0d, 9));
                long nextAfterDouble = Math.round(((Math.nextAfter(1.0d, 2.0d) - 1.0d) / Math.ulp(1.0d)));
                boolean nextAfterNegativeDirection = Math.nextAfter(-1.0d, -2.0d) < -1.0d;
                long nextUpDouble = Math.round((Math.nextUp(1.0d) - 1.0d) / Math.ulp(1.0d));
                long nextDownDouble = Math.round((1.0d - Math.nextDown(1.0d)) / Math.ulp(1.0d));
                boolean normalOrdinary = Math.isNormal(1.0d);
                boolean normalZero = Math.isNormal(0.0d);
                int exponentDouble = Math.getExponent(8.0d);
                long scalbDouble = Math.round(Math.scalb(1.5d, 3) * 1000.0d);
                long cbrtDouble = Math.round(Math.cbrt(27.0d) * 1000.0d);
                long expm1Small = Math.round(Math.expm1(0.001d) * 1000000.0d);
                long log1pSmall = Math.round(Math.log1p(0.001d) * 1000000.0d);
                long ieeeRemainder = Math.round(Math.IEEEremainder(5.3d, 2.0d) * 10.0d);
                long rintHalfEven = Math.round(Math.rint(2.5d) * 10.0d);
                try {
                    Math.clamp(5, 7, 3);
                } catch (IllegalArgumentException error) {
                    clampThrows = true;
                }
                IO.println(sqrtNegative);
                IO.println(sqrtNaN);
                IO.println(sqrtInfinity);
                IO.println(logNegative);
                IO.println(logNaN);
                IO.println(logZero);
                IO.println(expNaN);
                IO.println(expPositiveInfinity);
                IO.println(expNegativeInfinity);
                IO.println(sinInfinity);
                IO.println(tanInfinity);
                IO.println(asinOutOfRange);
                IO.println(acosOutOfRange);
                IO.println(atanNaN);
                IO.println(atanPositiveInfinity);
                IO.println(atan2NaN);
                IO.println(atan2Origin);
                IO.println(sinhNaN);
                IO.println(coshInfinity);
                IO.println(tanhPositiveInfinity);
                IO.println(tanhNegativeInfinity);
                IO.println(absNegativeZero);
                IO.println(signumNaN);
                IO.println(signumNegativeZero);
                IO.println(copySignNegativeZero);
                IO.println(roundNaN);
                IO.println(roundPositiveInfinity);
                IO.println(roundNegativeInfinity);
                IO.println(floorNegativeZero);
                IO.println(ceilNegativeZero);
                IO.println(absIntMin);
                IO.println(absLongMin);
                IO.println(powMinExponent);
                IO.println(clampThrows);
                IO.println(finiteOrdinary);
                IO.println(finiteInfinity);
                IO.println(finiteNaN);
                IO.println(stableHypot);
                IO.println(ulpDouble);
                IO.println(ulpFloat);
                IO.println(nextAfterDouble);
                IO.println(nextAfterNegativeDirection);
                IO.println(nextUpDouble);
                IO.println(nextDownDouble);
                IO.println(normalOrdinary);
                IO.println(normalZero);
                IO.println(exponentDouble);
                IO.println(scalbDouble);
                IO.println(cbrtDouble);
                IO.println(expm1Small);
                IO.println(log1pSmall);
                IO.println(ieeeRemainder);
                IO.println(rintHalfEven);
            }
        }
    "#;

    check(src).expect("math special-value fidelity slice should typecheck");
}

#[test]
fn check_accepts_full_primitive_math_closure_slice() {
    let src = r#"
        package app.core;
        import aden.lang.IO;
        import aden.math.Math;

        class Main {
            public static void main() {
                byte b = (byte) -7;
                short s = (short) 12;
                char c = 'A';
                ubyte ub = (ubyte) 200;
                ushort us = (ushort) 60000;

                byte absB = Math.abs(b);
                short maxS = Math.max((short) 4, s);
                char minC = Math.min(c, 'Z');
                ubyte clampUB = Math.clamp(ub, (ubyte) 0, (ubyte) 150);
                ushort signUS = Math.signum(us);
                double sqrtB = Math.sqrt((byte) 9);
                byte powB = Math.pow((byte) 3, 2);
                ushort powUS = Math.pow((ushort) 3, 2);
                byte divB = Math.floorDiv((byte) 7, (byte) 3);
                ushort modUS = Math.floorMod((ushort) 7, (ushort) 3);
                double sinUB = Math.sin(ub);
                double logUS = Math.log(us);
                double atanB = Math.atan((byte) 1);
                double sinhS = Math.sinh((short) 1);
                double toRadiansC = Math.toRadians(c);
                double hypotUB = Math.hypot((ubyte) 3, (ubyte) 4);
                IO.println(absB);
                IO.println(maxS);
                IO.println((int) minC);
                IO.println((int) clampUB);
                IO.println((int) signUS);
                IO.println(Math.round(sqrtB * 1000.0d));
                IO.println(powB);
                IO.println((int) powUS);
                IO.println(divB);
                IO.println((int) modUS);
                IO.println(Math.round(sinUB * 1000.0d));
                IO.println(Math.round(logUS * 1000.0d));
                IO.println(Math.round(atanB * 1000.0d));
                IO.println(Math.round(sinhS * 1000.0d));
                IO.println(Math.round(toRadiansC * 1000.0d));
                IO.println(Math.round(hypotUB * 1000.0d));
            }
        }
    "#;

    check(src).expect("full primitive math closure slice should typecheck");
}

#[test]
fn check_accepts_expanded_random_surface() {
    let src = r#"
        package app.core;
        import aden.lang.IO;
        import aden.collections.Array;
        import aden.math.Random;

        class Main {
            public static void main() {
                Random seeded = new Random(7);
                int a = seeded.nextInt();
                int b = seeded.nextInt(10);
                int c = seeded.nextInt(3, 9);
                boolean d = seeded.nextBoolean();
                long e = seeded.nextLong();
                long f = seeded.nextLong(100L);
                long g = seeded.nextLong(20L, 40L);
                byte g1 = seeded.nextByte();
                byte g2 = seeded.nextByte((byte) 20);
                byte g3 = seeded.nextByte((byte) 4, (byte) 12);
                short g4 = seeded.nextShort();
                short g5 = seeded.nextShort((short) 500);
                short g6 = seeded.nextShort((short) 100, (short) 200);
                char g7 = seeded.nextChar();
                char g8 = seeded.nextChar((char) 128);
                char g9 = seeded.nextChar((char) 65, (char) 91);
                float h = seeded.nextFloat();
                double i = seeded.nextDouble();
                float j = seeded.nextFloat(5.0f);
                float k = seeded.nextFloat(2.0f, 6.0f);
                double l = seeded.nextDouble(8.0d);
                double m = seeded.nextDouble(3.0d, 9.0d);
                double m1 = seeded.nextGaussian();
                double m2 = seeded.nextGaussian(10.0d, 2.5d);
                int n = seeded.getSeed();
                Array values = new Array(3);
                seeded.nextInts(values);
                Array boundedValues = new Array(2);
                seeded.nextInts(boundedValues, 10);
                Array byteValues = new Array(2);
                seeded.nextBytes(byteValues);
                Array shortValues = new Array(2);
                seeded.nextShorts(shortValues);
                Array charValues = new Array(2);
                seeded.nextChars(charValues);
                Array uintValues = new Array(2);
                seeded.nextUInts(uintValues);

                Random implicit = new Random();
                implicit.setSeed(11);
                int o = implicit.nextInt(5);
                Random copySource = new Random(17);
                Random copy = copySource.copy();
                int o1 = copySource.nextInt();
                int o2 = copy.nextInt();
                copySource.skip(3);
                copy.skip(3);
                int o3 = copySource.nextInt(10);
                int o4 = copy.nextInt(10);
                Random wide = new Random(1234567890123L);
                int p = wide.nextInt(10);
                wide.reset();
                int q = wide.nextInt(10);
                implicit.setSeed(1234567890123L);
                int r = implicit.nextInt(10);
                Random unsignedA = new Random((uint) 99);
                Random unsignedB = new Random((ulong) 99);
                uint s = unsignedA.nextUInt();
                uint t = unsignedA.nextUInt((uint) 50);
                uint u = unsignedA.nextUInt((uint) 10, (uint) 20);
                ulong v = unsignedA.nextULong();
                ulong w = unsignedA.nextULong((ulong) 100);
                ulong x = unsignedA.nextULong((ulong) 30, (ulong) 60);
                ubyte y = unsignedA.nextUByte();
                ubyte z = unsignedA.nextUByte((ubyte) 25);
                ushort aa = unsignedA.nextUShort((ushort) 500);
                unsignedB.setSeed((ulong) 99);
                uint ab = unsignedB.nextUInt();
                ulong ac = unsignedB.nextULong();

                IO.println(a);
                IO.println(b);
                IO.println(c);
                IO.println(d);
                IO.println(e);
                IO.println(f);
                IO.println(g);
                IO.println((int) g1);
                IO.println((int) g2);
                IO.println((int) g3);
                IO.println((int) g4);
                IO.println((int) g5);
                IO.println((int) g6);
                IO.println((int) g7);
                IO.println((int) g8);
                IO.println((int) g9);
                IO.println(h);
                IO.println(i);
                IO.println(j);
                IO.println(k);
                IO.println(l);
                IO.println(m);
                IO.println(m1);
                IO.println(m2);
                IO.println(n);
                IO.println(values.getInt(0));
                IO.println(values.getInt(1));
                IO.println(values.getInt(2));
                IO.println(boundedValues.getInt(0));
                IO.println(boundedValues.getInt(1));
                IO.println(byteValues.getInt(0));
                IO.println(byteValues.getInt(1));
                IO.println(shortValues.getInt(0));
                IO.println(shortValues.getInt(1));
                IO.println(charValues.getInt(0));
                IO.println(charValues.getInt(1));
                IO.println(uintValues.getInt(0));
                IO.println(uintValues.getInt(1));
                IO.println(o);
                IO.println(o1);
                IO.println(o2);
                IO.println(o3);
                IO.println(o4);
                IO.println(p);
                IO.println(q);
                IO.println(r);
                IO.println((long) s);
                IO.println((long) t);
                IO.println((long) u);
                IO.println((long) v);
                IO.println((long) w);
                IO.println((long) x);
                IO.println((int) y);
                IO.println((int) z);
                IO.println((int) aa);
                IO.println((long) ab);
                IO.println((long) ac);
            }
        }
    "#;

    check(src).expect("expanded Random deterministic helpers should typecheck");
}

#[test]
fn check_accepts_io_file_path_files_and_stream_surface() {
    let src = r#"
        package app.core;
        import aden.collections.ArrayList;
        import aden.collections.List;
        import aden.io.Path;
        import aden.io.File;
        import aden.io.Files;
        import aden.io.Closeable;
        import aden.io.Flushable;
        import aden.io.ResourceScope;
        import aden.lang.AutoCloseable;
        import aden.io.InputStream;
        import aden.io.OutputStream;

        class Main {
            public static void main() {
                String p = Path.combine("tmp\\", "/log.txt");
                String separator = Path.separator();
                String resolved = Path.resolve(Path.parent(p), "next.txt");
                String sibling = Path.resolveSibling(p, "side.log");
                boolean absolute = Path.isAbsolute("/tmp/log.txt");
                String root = Path.root("/tmp/log.txt");
                String relative = Path.relativeTo("tmp", p);
                String normalizedDots = Path.normalize("tmp/./nested/../log.txt");
                String normalizedAbsoluteDots = Path.normalize("/tmp/./nested/../log.txt");
                String normalizedLeadingParents = Path.normalize("../tmp/../log.txt");
                String changedFileName = Path.changeFileName(p, "renamed.txt");
                String childPath = Path.childPath("tmp", p);
                List<String> parts = Path.parts(p);
                String joined = Path.join(parts);
                int depth = Path.depth(p);
                boolean nested = Path.startsWithPath("tmp", p);
                boolean suffix = Path.endsWithPath("a.txt", p);
                String commonParent = Path.commonParent("tmp/nested/deeper", "tmp/nested/file.txt");
                String name = Path.fileName(p);
                String stem = Path.stem(p);
                String ext = Path.extension(p);
                boolean hasExt = Path.hasExtension(p);
                String changedExt = Path.changeExtension(p, "data");
                String removedExt = Path.changeExtension(p, "");
                boolean madeDirs = Files.createDirectories("tmp/nested/deeper");
                boolean dir = Files.isDirectory("tmp/nested");
                List<String> initialChildren = Files.list("tmp");
                File.writeAllText(p, "A");
                File.appendText(p, "B");
                boolean ok = File.exists(p);
                boolean file = File.isFile(p);
                int fileSize = File.size(p);
                long modifiedBefore = File.lastModified(p);
                String a = File.readAllText(p);
                boolean createdFile = File.create("tmp/created.txt");
                boolean createdAgain = File.create("tmp/created.txt");
                boolean createdParents = File.createParentDirectories("tmp/generated/output/result.txt");
                boolean createdDeepFile = File.createWithParents("tmp/generated/output/result.txt");
                String tempFile = File.createTempFile("scratch-", "tmp");
                String tempDirectory = File.createTempDirectory("scratch-dir-");
                boolean touchedFile = File.touch(p);
                long modifiedAfter = File.lastModified(p);
                String fallback = File.readAllTextOrDefault("missing.txt", "fallback");
                boolean copied = File.copy(p, resolved);
                boolean moved = File.move(resolved, "tmp/moved.txt");
                boolean deleted = File.delete("tmp/moved.txt");

                Files.writeString("x", "1");
                Files.appendString("x", "2");
                String b = Files.readString("x");
                long memoryModified = Files.lastModified("x");
                String missing = Files.readStringOrDefault("missing", "none");
                boolean gone = Files.delete("x");
                boolean createdDir = Files.createDirectory("tmp/manual");
                boolean ensuredParents = Files.createParentDirectories("tmp/low-level/data.txt");
                boolean ensuredFile = Files.createFileWithParents("tmp/low-level/data.txt");
                boolean createDirsIntoFileFails = !Files.createDirectories("tmp/low-level/data.txt/child");
                File.writeAllText("tmp-other/outside.txt", "outside");
                boolean deleteNonEmptyDirectoryFails = !File.delete("tmp/nested");
                boolean emptyCreatedFile = File.isEmpty("tmp/created.txt");
                boolean nonEmptyPath = !File.isEmpty(p);
                boolean nonEmptyDirectory = !File.isEmpty("tmp");
                boolean missingEmpty = File.isEmpty("missing-empty");
                boolean directoryExists = File.isDirectory("tmp/manual");
                List<String> listed = File.list("tmp");
                List<String> relativeListed = File.listRelative("tmp");
                List<String> recursive = File.listRecursive("tmp");
                List<String> relativeRecursive = File.listRelativeRecursive("tmp");
                List<String> listedFiles = File.listFiles("tmp");
                List<String> relativeListedFiles = File.listRelativeFiles("tmp");
                List<String> listedDirectories = File.listDirectories("tmp");
                List<String> relativeListedDirectories = File.listRelativeDirectories("tmp");
                List<String> recursiveFiles = File.listFilesRecursive("tmp");
                List<String> recursiveDirectories = File.listDirectoriesRecursive("tmp");
                List<String> relativeRecursiveFiles = File.listRelativeFilesRecursive("tmp");
                List<String> relativeRecursiveDirectories = File.listRelativeDirectoriesRecursive("tmp");
                boolean recursiveBoundary = !recursive.contains("tmp-other/outside.txt");
                boolean recursiveFileBoundary = !recursiveFiles.contains("tmp-other/outside.txt");
                String parent = File.parent(p);
                String shortName = File.name(p);
                String shortStem = File.stem(p);
                String shortExt = File.extension(p);
                boolean madeFacadeDir = File.mkdirs("tmp/facade/deeper");
                boolean madeSingleDir = File.mkdir("tmp/facade-single");
                boolean deletedTree = File.deleteRecursive("tmp/facade");
                boolean deletedMissingTree = File.deleteRecursive("tmp/facade");
                boolean copiedTree = File.copyRecursive("tmp/nested", "tmp/copy-nested");
                boolean copyRecursiveIntoSelfFails = !File.copyRecursive("tmp/nested", "tmp/nested/deeper-copy");
                boolean copyRecursiveIntoFileFails = !File.copyRecursive("tmp/nested", "tmp/created.txt");
                boolean movedTree = File.moveRecursive("tmp/copy-nested", "tmp/moved-nested");
                boolean movedMissingTree = File.moveRecursive("tmp/copy-nested", "tmp/again");
                boolean moveSameFileFails = !File.move(p, p);
                boolean copyFileIntoDirectoryFails = !File.copy(p, "tmp/manual");
                List<String> lines = new ArrayList<String>();
                lines.add("one");
                lines.add("two");
                File.writeAllLines("tmp/lines.txt", lines);
                File.appendLines("tmp/lines.txt", lines);
                List<String> readLines = File.readAllLines("tmp/lines.txt");

                OutputStream out = new OutputStream(p);
                Flushable flushable = out;
                out.writeLine("C");
                flushable.flush();
                out.writeLines(lines);
                out.appendLines(lines);
                out.clear();
                out.writeLines(lines);
                int outPosition = out.position();
                int outLength = out.length();
                OutputStream appendOut = new OutputStream("tmp/append.txt", true);
                boolean appendMode = appendOut.isAppendMode();
                appendOut.write("A");
                appendOut.write("B");
                appendOut.close();
                boolean outputClosed = appendOut.isClosed();
                OutputStream sequentialOut = new OutputStream("tmp/seq.txt");
                sequentialOut.write("A");
                sequentialOut.write("B");
                int sequentialPosition = sequentialOut.position();
                int sequentialLength = sequentialOut.length();
                int sequentialRewound = sequentialOut.rewind(1);
                sequentialOut.write("C");
                sequentialOut.seek(1);
                sequentialOut.write("D");
                sequentialOut.reset();
                sequentialOut.write("Z");
                sequentialOut.seek(2);
                sequentialOut.truncate();
                sequentialOut.close();
                OutputStream nullableOut = new OutputStream("tmp/null-lines.txt");
                List<String> nullableLines = new ArrayList<String>();
                nullableLines.add("left");
                nullableLines.add(null);
                nullableLines.add("right");
                nullableOut.writeLines(nullableLines);
                nullableOut.writeLine(null);
                nullableOut.close();
                InputStream input = new InputStream(p);
                Closeable inputCloser = input;
                String c = input.readAll();
                String d = input.readAllOrDefault("empty");
                List<String> streamLines = input.readLines();
                boolean remaining = input.hasRemaining();
                int availableBefore = input.available();
                int positionBefore = input.position();
                char peek = input.peek();
                char firstChar = input.read();
                int skipped = input.skip(3);
                int rewound = input.rewind(2);
                input.mark();
                boolean hasMark = input.hasMark();
                String lineOne = input.readLine();
                String lineTwo = input.readLine();
                boolean afterRead = input.hasRemaining();
                int availableAfter = input.available();
                boolean resetMark = input.resetToMark();
                input.clearMark();
                boolean hasMarkAfterClear = input.hasMark();
                input.seek(1);
                char afterSeek = input.read();
                input.reset();
                String lineAgain = input.readLine();
                String tail = input.readRemaining();
                int positionAfterTail = input.position();
                boolean inputOpenBeforeClose = input.isOpen();
                inputCloser.close();
                boolean inputClosed = input.isClosed();
                boolean inputOpenAfterClose = input.isOpen();
                input.close();
                InputStream reopened = File.openInputStream(p, 1);
                boolean reopenedOpen = reopened.isOpen();
                char reopenedChar = reopened.read();
                reopened.close();
                OutputStream ownedOut = File.openOutputStream("tmp/owned.txt");
                Closeable ownedCloser = ownedOut;
                boolean ownedOpenBeforeClose = ownedOut.isOpen();
                ownedOut.write("owned");
                ownedCloser.close();
                boolean ownedClosed = ownedOut.isClosed();
                boolean ownedOpenAfterClose = ownedOut.isOpen();
                ownedOut.close();
                OutputStream appendOwned = File.openOutputStream("tmp/owned.txt", true);
                appendOwned.write("!");
                appendOwned.close();
                OutputStream firstOut = File.openOutputStream("tmp/shared.txt");
                OutputStream secondOut = File.openOutputStream("tmp/shared.txt", true);
                firstOut.write("A");
                firstOut.close();
                secondOut.write("B");
                secondOut.flush();
                secondOut.close();
                InputStream firstIn = File.openInputStream("tmp/shared.txt");
                InputStream secondIn = File.openInputStream("tmp/shared.txt");
                firstIn.close();
                boolean secondStillOpen = secondIn.isOpen();
                String sharedText = secondIn.readAll();
                secondIn.close();
                ResourceScope scope = new ResourceScope();
                boolean scopeOpenBefore = scope.isOpen();
                scope.add(reopened);
                scope.add(secondIn);
                int scopeSize = scope.size();
                scope.clear();
                int clearedScopeSize = scope.size();
                List<AutoCloseable> closers = new ArrayList<AutoCloseable>();
                closers.add(reopened);
                closers.add(secondIn);
                ResourceScope.closeAll(closers);
                scope.close();
                boolean scopeClosed = scope.isClosed();
                int closedScopeSize = scope.size();
                boolean scopeOpenAfter = scope.isOpen();
                scope.close();
            }
        }
    "#;

    check(src).expect("file/path/files and stream surface should typecheck");
}

#[test]
fn check_accepts_console_input_baseline() {
    let src = r#"
        package app.core;
        import aden.lang.AutoCloseable;
        import aden.lang.ConsoleReader;
        import aden.lang.PrintStream;
        import aden.lang.System;
        import aden.rt.Intrinsics;

        class Main {
            public static void main() {
                ConsoleReader input = System.in;
                AutoCloseable closer = input;
                String prompted = input.readLine("name> ");
                String first = input.readLine();
                String second = input.readLineOrDefault("fallback");
                String third = Intrinsics.consoleReadLine();
                boolean promptedMissing = prompted == null;
                boolean firstMissing = first == null;
                int firstLength = first.length();
                boolean openBeforeClose = input.isOpen();
                closer.close();
                boolean closed = input.isClosed();
                boolean openAfterClose = input.isOpen();
                input.close();
                PrintStream out = System.out;
                AutoCloseable outCloser = out;
                boolean outOpen = out.isOpen();
                out.flush();
                outCloser.close();
                boolean outClosed = out.isClosed();
                boolean missing = third == null;
            }
        }
    "#;

    check(src).expect("console input baseline should typecheck");
}

#[test]
fn check_accepts_time_instant_and_duration_surface() {
    let src = r#"
        package app.core;
        import aden.time.Instant;
        import aden.time.Duration;
        import aden.time.LocalDate;
        import aden.time.LocalTime;
        import aden.time.LocalDateTime;
        import aden.time.DateTimeFormatter;

        class Main {
            public static void main() {
                Instant a = Instant.now();
                Instant b = a.plus(Duration.ofMillis(5));
                long at = a.toEpochMillis();
                long bt = b.toEpochMillis();
                Duration between = Duration.between(a, b);
                boolean order = a.isBefore(b);
                int instantHash = a.hashCode();
                LocalDate date = LocalDate.of(2026, 4, 10);
                LocalDate nextDate = date.plusDays(2);
                LocalDate byYearDay = LocalDate.ofYearDay(2026, 100);
                LocalDate shiftedMonth = LocalDate.of(2024, 1, 31).plusMonths(1L);
                LocalDate shiftedYear = LocalDate.of(2024, 2, 29).plusYears(1L);
                LocalDate rewrittenDate = LocalDate.of(2024, 1, 31).withYear(2025).withMonth(2).withDay(27);
                long epochDay = nextDate.toEpochDay();
                int dayOfYear = date.dayOfYear();
                int dayOfWeek = date.dayOfWeek();
                int yearLength = date.lengthOfYear();
                boolean weekend = LocalDate.of(2026, 4, 11).isWeekend();
                boolean weekday = date.isWeekday();
                int dateHash = date.hashCode();
                LocalTime time = LocalTime.of(9, 15, 30, 125);
                LocalTime bySecondOfDayFactory = LocalTime.ofSecondOfDay(33330);
                LocalTime rewrittenTime = time.withHour(10).withMinute(45).withSecond(50).withMillis(250);
                LocalTime truncatedSecondsTime = time.truncatedToSeconds();
                LocalTime truncatedMinutesTime = time.truncatedToMinutes();
                LocalTime truncatedHoursTime = time.truncatedToHours();
                int timeHash = time.hashCode();
                LocalTime wrapped = time.plusMillis(1000);
                LocalTime shiftedMinuteTime = time.plusHours(1L).plusMinutes(30L).minusHours(2L).minusMinutes(10L);
                int millisOfDay = wrapped.toMillisOfDay();
                int secondOfDay = time.toSecondOfDay();
                LocalDateTime dt = LocalDateTime.of(2026, 4, 10, 9, 15, 30, 125);
                LocalDateTime later = dt.plusMillis(2000);
                LocalDateTime byDuration = dt.plus(Duration.ofSeconds(2L)).minus(Duration.ofMillis(500L));
                LocalDateTime shiftedMonthDateTime = LocalDateTime.of(2024, 1, 31, 9, 15, 30, 125).plusMonths(1L).plusYears(1L).minusMonths(2L).minusYears(1L);
                LocalDateTime rewrittenDateTime = dt.withYear(2027).withMonth(5).withDay(11).withHour(10).withMinute(20).withSecond(40).withMillis(300);
                LocalDateTime truncatedSecondsDateTime = dt.truncatedToSeconds();
                LocalDateTime truncatedMinutesDateTime = dt.truncatedToMinutes();
                LocalDateTime truncatedHoursDateTime = dt.truncatedToHours();
                LocalDateTime truncatedDaysDateTime = dt.truncatedToDays();
                int dateTimeHash = dt.hashCode();
                long epoch = later.toEpochMillis();
                LocalDate roundTripDate = later.toLocalDate();
                LocalTime roundTripTime = later.toLocalTime();
                Instant fixed = dt.toInstant();
                LocalDateTime fromEpoch = LocalDateTime.ofEpochMillis(fixed.toEpochMillis());
                Instant bySeconds = Instant.ofEpochSeconds(2L);
                Instant shifted = bySeconds.plusSeconds(3L).minusSeconds(1L);
                long shiftedSeconds = shifted.toEpochSeconds();
                Instant negativeInstant = Instant.ofEpochMillis(-1L);
                long negativeInstantSeconds = negativeInstant.toEpochSeconds();

                Duration d1 = Duration.ofMillis(9);
                Duration d2 = new Duration(4);
                Duration d3 = d1.plus(d2);
                Duration d4 = d3.minus(d2);
                Duration d5 = Duration.ofSeconds(2);
                Duration d6 = d5.multipliedBy(3);
                Duration d7 = Duration.ofDays(2);
                Duration scalarAdjusted = d5.plusMinutes(2L).minusSeconds(30L).plusHours(1L).minusMillis(500L).minusDays(1L);
                long ms = d4.toMillis();
                long seconds = d6.toSeconds();
                long minutes = Duration.ofMinutes(5).toMinutes();
                long hours = Duration.ofHours(3).toHours();
                long days = d7.toDays();
                boolean durationBefore = d2.isBefore(d6);
                boolean durationAfter = d6.isAfter(d2);
                int durationHash = d6.hashCode();
                String instantText = fixed.toString();
                String durationText = d6.toString();
                String dateText = roundTripDate.toString();
                String timeText = roundTripTime.toString();
                String dateTimeText = fromEpoch.toString();
                String formattedDate = DateTimeFormatter.format(date);
                String formattedTime = DateTimeFormatter.format(time);
                String formattedDateTime = DateTimeFormatter.format(dt);
                String formattedInstant = DateTimeFormatter.format(fixed);
                String basicDate = DateTimeFormatter.formatBasicDate(date);
                String slashDate = DateTimeFormatter.formatSlashDate(date);
                String basicTime = DateTimeFormatter.formatBasicTime(time);
                String minuteTime = DateTimeFormatter.formatMinuteTime(time);
                String spaceTime = DateTimeFormatter.formatSpaceTime(time);
                String basicDateTime = DateTimeFormatter.formatBasicDateTime(dt);
                String minuteDateTime = DateTimeFormatter.formatMinuteDateTime(dt);
                String basicInstant = DateTimeFormatter.formatBasicInstant(fixed);
                String spaceDateTime = DateTimeFormatter.formatSpaceDateTime(dt);
                String spaceInstant = DateTimeFormatter.formatSpaceInstant(fixed);
                LocalDate parsedBasicDate = DateTimeFormatter.parseBasicDate("20260410");
                LocalDate parsedSlashDate = DateTimeFormatter.parseSlashDate("2026/04/10");
                LocalTime parsedBasicTime = DateTimeFormatter.parseBasicTime("091530125");
                LocalTime parsedMinuteTime = DateTimeFormatter.parseMinuteTime("09:15");
                LocalTime parsedSpaceTime = DateTimeFormatter.parseSpaceTime("09 15 30 125");
                LocalDateTime parsedBasicDateTime = DateTimeFormatter.parseBasicDateTime("20260410T091530125");
                LocalDateTime parsedMinuteDateTime = DateTimeFormatter.parseMinuteDateTime("2026-04-10T09:15");
                Instant parsedBasicInstant = DateTimeFormatter.parseBasicInstant("20260410T091532125Z");
                LocalDateTime parsedSpaceDateTime = DateTimeFormatter.parseSpaceDateTime("2026-04-10 09:15:30.125");
                Instant parsedSpaceInstant = DateTimeFormatter.parseSpaceInstant("2026-04-10 09:15:32.125Z");
                LocalDateTime startOfDay = date.atStartOfDay();
                LocalDateTime minuteOnly = date.atTime(9, 15);
                LocalDateTime secondOnly = date.atTime(9, 15, 30);
                LocalDateTime combined = date.atTime(time);
                  LocalDate byWeek = date.plusWeeks(2L).minusWeeks(1L);
                  boolean dateBefore = date.isBefore(nextDate);
                  boolean dateAfter = nextDate.isAfter(date);
                  Duration dateBetween = Duration.between(date, nextDate);
                  Duration dateUntil = date.durationUntil(nextDate);
                  LocalTime bySecond = time.plusSeconds(30L).minusSeconds(10L);
                  boolean timeBefore = time.isBefore(wrapped);
                  boolean timeAfter = wrapped.isAfter(time);
                  Duration timeBetween = Duration.between(time, wrapped);
                  Duration timeUntil = time.durationUntil(wrapped);
                  LocalDateTime shiftedDateTime = dt.plusHours(2L).plusMinutes(30L).plusSeconds(15L).minusSeconds(5L).minusMinutes(5L).minusHours(1L);
                  LocalDateTime byWeekDateTime = dt.plusWeeks(1L).minusWeeks(1L);
                  LocalDateTime combinedFactory = LocalDateTime.of(date, time);
                  LocalDateTime byEpochSecondsDateTime = LocalDateTime.ofEpochSeconds(1775812530L);
                  boolean dateTimeBefore = dt.isBefore(later);
                  boolean dateTimeAfter = later.isAfter(dt);
                  Duration dateTimeBetween = Duration.between(dt, later);
                  Duration dateTimeUntil = dt.durationUntil(later);
                  LocalDate instantDate = fixed.toLocalDate();
                LocalTime instantTime = fixed.toLocalTime();
                LocalDate parsedDate = LocalDate.parse("2026-04-10");
                LocalTime parsedTime = LocalTime.parse("09:15:30.125");
                LocalDateTime parsedDateTime = LocalDateTime.parse("2026-04-10T09:15:30.125");
                Instant parsedInstant = Instant.parse("2026-04-10T09:15:32.125Z");
                Instant truncatedInstant = parsedInstant.truncatedToSeconds();
                Instant truncatedMinuteInstant = parsedInstant.truncatedToMinutes();
                Instant truncatedHourInstant = parsedInstant.truncatedToHours();
                Instant truncatedDayInstant = parsedInstant.truncatedToDays();
                boolean instantRoundTrip = Instant.parse(fixed.toString()).equals(fixed);
                boolean negativeInstantRoundTrip = Instant.parse(negativeInstant.toString()).equals(negativeInstant);
                boolean dateRoundTrip = LocalDate.parse(date.toString()).equals(date);
                boolean timeRoundTrip = LocalTime.parse(time.toString()).equals(time);
                boolean dateTimeRoundTrip = LocalDateTime.parse(dt.toString()).equals(dt);
                LocalDate formatterDate = DateTimeFormatter.parseLocalDate("2026-04-10");
                LocalTime formatterTime = DateTimeFormatter.parseLocalTime("09:15:30.125");
                LocalDateTime formatterDateTime = DateTimeFormatter.parseLocalDateTime("2026-04-10T09:15:30.125");
                Instant formatterInstant = DateTimeFormatter.parseInstant("2026-04-10T09:15:32.125Z");
            }
        }
    "#;

    check(src).expect("time/date surface should typecheck");
}

#[test]
fn check_accepts_clock_time_closure_slice() {
    let src = r#"
        package app.core;
        import aden.time.Clock;
        import aden.time.Duration;
        import aden.time.Instant;
        import aden.time.LocalDate;
        import aden.time.LocalTime;
        import aden.time.LocalDateTime;
        import aden.time.TimeSource;

        class Main {
            public static void main() {
                Clock system = Clock.systemUTC();
                Clock fixed = Clock.fixed(Instant.ofEpochMillis(1775812530125L));
                Clock fixedMillisClock = Clock.fixedMillis(1775812530125L);
                Clock offset = Clock.offset(fixed, Duration.ofSeconds(30L));
                Clock fluentOffset = fixed.withOffset(Duration.ofMillis(250L));
                Clock tick = Clock.tick(fixed, Duration.ofSeconds(1L));
                Clock fluentTick = fixed.withTick(Duration.ofMinutes(1L));
                boolean systemFixed = system.isFixed();
                boolean fixedFixed = fixed.isFixed();
                boolean offsetClock = offset.isOffset();
                boolean tickClock = tick.isTicking();
                long fixedMillis = fixed.millis();
                long offsetMillis = offset.millis();
                long tickMillis = tick.millis();
                Instant fixedInstant = fixed.instant();
                LocalDate fixedDate = fixed.today();
                LocalTime fixedTime = fixed.localTime();
                LocalDateTime fixedDateTime = fixed.localDateTime();
                Duration offsetDuration = offset.offsetDuration();
                Duration tickDuration = tick.tickDuration();
                Instant nowInstant = Instant.now(fixed);
                LocalDate nowDate = LocalDate.now(fixed);
                LocalTime nowTime = LocalTime.now(fixed);
                LocalDateTime nowDateTime = LocalDateTime.now(fixed);
                String text = fixed.toString();
                boolean equalFixed = fixed.equals(Clock.fixed(Instant.ofEpochMillis(1775812530125L)));
                boolean equalFixedMillis = fixed.equals(fixedMillisClock);
                boolean equalTick = tick.equals(Clock.tick(fixed, Duration.ofSeconds(1L)));
                int hash = fixed.hashCode();
                int offsetHash = offset.hashCode();
                int tickHash = tick.hashCode();
                TimeSource monotonic = TimeSource.systemMonotonic();
                TimeSource process = TimeSource.processMonotonic();
                TimeSource fixedSource = TimeSource.fixed(Duration.ofSeconds(2L));
                TimeSource fixedNanosSource = TimeSource.fixedNanos(2000000000L);
                TimeSource offsetSource = TimeSource.offset(fixedSource, Duration.ofMillis(250L));
                TimeSource tickSource = TimeSource.tick(offsetSource, Duration.ofMillis(100L));
                boolean monotonicFixed = monotonic.isFixed();
                boolean sourceFixed = fixedSource.isFixed();
                boolean sourceOffset = offsetSource.isOffset();
                boolean sourceTick = tickSource.isTicking();
                long sourceNanos = fixedSource.nanos();
                long sourceMillis = fixedSource.millis();
                Duration elapsed = tickSource.elapsedSince(0L);
                Duration sourceOffsetDuration = offsetSource.offsetDuration();
                Duration sourceTickDuration = tickSource.tickDuration();
                TimeSource fluentSourceOffset = fixedSource.withOffset(Duration.ofMillis(100L));
                TimeSource fluentSourceTick = fixedSource.withTick(Duration.ofMillis(250L));
                boolean sourceEquals = fixedSource.equals(fixedNanosSource);
                boolean processAlias = monotonic.equals(process);
                int sourceHash = fixedSource.hashCode();
                String sourceText = tickSource.toString();
                TimeSource nanosOffset = TimeSource.offsetNanos(fixedSource, 500000L);
                TimeSource nanosTick = TimeSource.tickNanos(nanosOffset, 250000L);
                long elapsedNanos = nanosTick.elapsedNanosSince(0L);
                long offsetNanos = nanosOffset.offsetNanos();
                long tickNanos = nanosTick.tickNanos();
                TimeSource truncatedSource = fixedSource.truncatedTo(Duration.ofMillis(250L));
            }
        }
    "#;

    check(src).expect("clock time closure slice should typecheck");
}

#[test]
fn check_accepts_time_calendar_edge_matrix() {
    let src = r#"
        package app.core;
        import aden.time.DateTimeFormatter;
        import aden.time.Duration;
        import aden.time.Instant;
        import aden.time.LocalDate;
        import aden.time.LocalDateTime;
        import aden.time.LocalTime;

        class Main {
            public static void main() {
                LocalDate leapCentury = LocalDate.of(2000, 2, 29);
                LocalDate nonLeapCentury = LocalDate.of(1900, 2, 28);
                LocalDate leapForward = LocalDate.of(2000, 2, 28).plusDays(1L);
                LocalDate nonLeapForward = nonLeapCentury.plusDays(1L);
                LocalDate monthBoundary = LocalDate.of(2023, 12, 31).plusDays(1L);
                LocalDate leapBack = LocalDate.of(2024, 3, 1).minusDays(1L);
                LocalDate clampMonth = LocalDate.of(2024, 1, 31).plusMonths(1L);
                LocalDate clampYear = LocalDate.of(2024, 2, 29).plusYears(1L);
                LocalDateTime midnightCarry = LocalDateTime.of(2023, 12, 31, 23, 59, 59, 999).plusMillis(1L);
                LocalDateTime monthCarry = LocalDateTime.of(2024, 2, 29, 23, 59, 59, 999).plusMillis(1L);
                Instant edgeInstant = Instant.parse("1969-12-31T23:59:59.999Z");
                boolean basicInstantRoundTrip = DateTimeFormatter.parseBasicInstant(DateTimeFormatter.formatBasicInstant(edgeInstant)).equals(edgeInstant);
                boolean basicDateRoundTrip = DateTimeFormatter.parseBasicDate(DateTimeFormatter.formatBasicDate(leapCentury)).equals(leapCentury);
                boolean minuteDateTimeRoundTrip = DateTimeFormatter.parseMinuteDateTime(DateTimeFormatter.formatMinuteDateTime(monthCarry)).equals(monthCarry.truncatedToMinutes());
                boolean minuteTimeRoundTrip = DateTimeFormatter.parseMinuteTime(DateTimeFormatter.formatMinuteTime(LocalTime.of(23, 59, 58, 999))).equals(LocalTime.of(23, 59));
                Duration zero = Duration.ZERO;
                Instant epoch = Instant.EPOCH;
                LocalTime midnight = LocalTime.MIDNIGHT;
                LocalTime noon = LocalTime.NOON;
                Duration divided = Duration.ofSeconds(9L).dividedBy(2);
            }
        }
    "#;

    check(src).expect("time calendar edge matrix should typecheck");
}

#[test]
fn check_accepts_objects_utility_baseline() {
    let src = r#"
        package app.core;
        import aden.lang.Object;
        import aden.lang.String;
        import aden.util.Objects;

        class Main {
            public static void main() {
                Object value = new Object();
                Object same = value;
                Object missing = null;
                boolean missingCheck = Objects.isNull(missing);
                boolean presentCheck = Objects.nonNull(value);
                boolean equalsSame = Objects.equals(value, same);
                boolean equalsMissing = Objects.equals(value, missing);
                int hash = Objects.hashCode(value);
                int missingHash = Objects.hashCode(missing);
                String text = Objects.toString(value);
                String missingText = Objects.toString(missing);
                String defaultText = Objects.toString(missing, "fallback");
                Object required = Objects.requireNonNull(value);
            }
        }
    "#;

    check(src).expect("Objects utility baseline should typecheck");
}

#[test]
fn check_accepts_string_tokenizer_utility_baseline() {
    let src = r#"
        package app.core;
        import aden.lang.String;
        import aden.util.StringTokenizer;

        class Main {
            public static void main() {
                StringTokenizer tokenizer = new StringTokenizer("alpha,beta,gamma", ",");
                boolean before = tokenizer.hasMoreTokens();
                int count = tokenizer.countTokens();
                String first = tokenizer.nextToken();
                String second = tokenizer.nextToken();
                String remaining = tokenizer.remainingText();
                String third = tokenizer.nextToken();

                StringTokenizer switched = new StringTokenizer("x|y|z", "|");
                String sx = switched.nextToken();
                String sy = switched.nextToken("|");
                String sz = switched.nextToken();
                boolean after = switched.hasMoreTokens();
            }
        }
    "#;

    check(src).expect("StringTokenizer utility baseline should typecheck");
}

#[test]
fn check_accepts_scanner_utility_baseline() {
    let src = r#"
        package app.core;
        import aden.io.InputStream;
        import aden.util.Scanner;

        class Main {
            public static void main() {
                Scanner scanner = new Scanner("42 true 3.5 4.25 9000000000\nalpha beta");
                boolean hasToken = scanner.hasNext();
                int number = scanner.nextInt();
                boolean flag = scanner.nextBoolean();
                float f = scanner.nextFloat();
                double d = scanner.nextDouble();
                long big = scanner.nextLong();
                String line = scanner.nextLine();
                boolean hasLine = scanner.hasNextLine();
                String next = scanner.next();
                String rest = scanner.remainingText();
                String missing = scanner.nextOrDefault("fallback");
                String missingLine = scanner.nextLineOrDefault("line-fallback");
                scanner.reset();
                scanner.useDelimiter(",");

                InputStream input = new InputStream("/tmp.txt");
                Scanner fileScanner = new Scanner(input);
            }
        }
    "#;

    check(src).expect("Scanner utility baseline should typecheck");
}

#[test]
fn check_accepts_string_joiner_utility_baseline() {
    let src = r#"
        package app.core;
        import aden.lang.String;
        import aden.util.StringJoiner;

        class Main {
            public static void main() {
                StringJoiner joiner = new StringJoiner(", ", "[", "]");
                joiner.add("alpha");
                joiner.add("beta");
                joiner.setEmptyValue("<empty>");
                int length = joiner.length();
                String text = joiner.toString();

                StringJoiner empty = new StringJoiner(" | ");
                empty.setEmptyValue("none");
                String emptyText = empty.toString();

                StringJoiner merged = new StringJoiner("/");
                merged.add("root");
                merged.merge(joiner);
            }
        }
    "#;

    check(src).expect("StringJoiner utility baseline should typecheck");
}

#[test]
fn check_accepts_optional_utility_baseline() {
    let src = r#"
        package app.core;
        import aden.lang.String;
        import aden.util.Optional;

        class Main {
            public static void main() {
                Optional<String> value = Optional.of("aden");
                Optional<String> missing = Optional.ofNullable(null);
                boolean hasValue = value.isPresent();
                boolean noValue = missing.isEmpty();
                String text = value.get();
                String fallback = missing.orElse("fallback");
                String raw = missing.orNull();
                String rendered = value.toString();
                boolean same = value.equals(Optional.of("aden"));
                int hash = value.hashCode();
            }
        }
    "#;

    check(src).expect("Optional utility baseline should typecheck");
}

#[test]
fn check_accepts_properties_utility_baseline() {
    let src = r#"
        package app.core;
        import aden.collections.Set;
        import aden.lang.String;
        import aden.util.Properties;

        class Main {
            public static void main() {
                Properties props = new Properties();
                String prior = props.setProperty("mode", "dev");
                String mode = props.getProperty("mode");
                String missing = props.getProperty("missing", "fallback");
                boolean hasMode = props.containsKey("mode");
                String removed = props.remove("mode");
                boolean emptyNow = props.isEmpty();
                props.setProperty("target", "windows");
                Set<String> names = props.propertyNames();
                int size = props.size();
                String text = props.toString();
            }
        }
    "#;

    check(src).expect("Properties utility baseline should typecheck");
}

#[test]
fn check_accepts_text_cursor_utility_baseline() {
    let src = r#"
        package app.core;
        import aden.lang.String;
        import aden.util.TextCursor;

        class Main {
            public static void main() {
                TextCursor cursor = new TextCursor("  alpha=\"4\\n2\"\nnext -12.5e+2 007");
                TextCursor empty = new TextCursor("!");
                boolean before = cursor.hasRemaining();
                char blank = cursor.peek();
                cursor.skipWhitespace();
                String ident = cursor.readIdentifier();
                String maybeIdent = empty.tryReadIdentifier();
                boolean eq = cursor.consumeIf("=");
                boolean quoteMatch = cursor.startsWith('"');
                cursor.mark();
                char quote = cursor.peek();
                String maybeQuoted = cursor.tryReadQuotedString();
                String quoted = cursor.readQuotedString();
                cursor.consume('\n');
                String nextLine = cursor.readLine();
                int line = cursor.line();
                int column = cursor.column();
                String location = cursor.locationString();
                cursor.consume(' ');
                String maybeNumber = cursor.tryReadNumberToken();
                String number = cursor.readNumberToken();
                cursor.consume(' ');
                String maybeDigits = cursor.tryReadDigits();
                String digits = cursor.readDigits();
                cursor.resetToMark();
                String restLine = cursor.readUntil('\0');
                int pos = cursor.position();
                String rest = cursor.remainingText();
                boolean end = cursor.isAtEnd();
            }
        }
    "#;

    check(src).expect("TextCursor utility baseline should typecheck");
}

#[test]
fn check_accepts_uuid_utility_baseline() {
    let src = r#"
        package app.core;
        import aden.lang.IO;
        import aden.math.Random;
        import aden.util.UUID;

        class Main {
            public static void main() {
                UUID parsed = UUID.fromString("123e4567-e89b-42d3-a456-426614174000");
                UUID manual = new UUID(parsed.getMostSignificantBits(), parsed.getLeastSignificantBits());
                UUID nil = UUID.nilUUID();
                Random seeded = new Random(7);
                UUID deterministic = UUID.randomUUID(seeded);
                UUID implicit = UUID.randomUUID();
                int version = parsed.version();
                int variant = parsed.variant();
                boolean same = parsed.equals(manual);
                boolean nilState = nil.isNil();
                int hash = parsed.hashCode();
                int order = nil.compareTo(parsed);
                String text = parsed.toString();
                String generated = deterministic.toString();
                int generatedVersion = deterministic.version();
                int generatedVariant = deterministic.variant();
                IO.println(version);
                IO.println(variant);
                IO.println(same);
                IO.println(nilState);
                IO.println(hash);
                IO.println(order);
                IO.println(text);
                IO.println(generated);
                IO.println(generatedVersion);
                IO.println(generatedVariant);
                IO.println(implicit.toString());
            }
        }
    "#;

    check(src).expect("UUID utility baseline should typecheck");
}

#[test]
fn check_accepts_constructor_chaining_baseline() {
    let src = r#"
        package app.core;

        class Base {
            public Base(String label) {
            }
        }

        class Pair extends Base {
            public Pair() {
                this("left", "right");
            }

            public Pair(String left, String right) {
                super(left);
            }
        }

        class Main {
            public static void main() {
                Pair pair = new Pair();
            }
        }
    "#;

    check(src).expect("this(...) and super(...) constructor chaining should typecheck");
}

#[test]
fn check_accepts_constructor_field_fill_after_partial_init() {
    let src = r#"
        package app.core;

        class Shape {
            private boolean fixed;
            private long value;
            private boolean shifted;
            private long delta;

            public Shape(boolean fixed, long value) {
                this.fixed = fixed;
                this.value = value;
                this.shifted = false;
                this.delta = 0L;
            }

            public static Shape shifted(long value, long delta) {
                Shape shape = new Shape(true, value);
                shape.shifted = true;
                shape.delta = delta;
                return shape;
            }
        }

        class Main {
            public static void main() {
                Shape shape = Shape.shifted(10L, 3L);
            }
        }
    "#;

    check(src).expect("constructor partial initialization plus later field fill should typecheck");
}

#[test]
fn check_accepts_string_and_stringbuilder_refinement_baseline() {
    let src = r#"
        package app.core;
          import aden.lang.Integer;
          import aden.lang.Long;
          import aden.lang.Object;
          import aden.lang.System;
          import aden.lang.StringBuilder;
          import aden.lang.UInteger;

        class Main {
            public static void main() {
                String text = "aden aden code";
                int first = text.indexOf("aden", 1);
                int firstChar = text.indexOf('s');
                int firstCharFrom = text.indexOf('s', 4);
                int last = text.lastIndexOf("aden", 10);
                int lastChar = text.lastIndexOf('e');
                int lastCharFrom = text.lastIndexOf('p', 5);
                String replaced = text.replace("aden", "beam");
                String charReplaced = text.replace(' ', '-');
                boolean hasChar = text.contains('c');
                boolean hasSeq = text.contains((CharSequence) "sec");
                boolean offsetPrefix = text.startsWith("aden", 6);
                String repeated = "-".repeat(3);
                String trimmedPrefix = "prefix-value".removePrefix("prefix-");
                String trimmedSuffix = "value.txt".removeSuffix(".txt");
                String paddedLeft = "7".padLeft(3, '0');
                  String paddedRight = "7".padRight(3, '.');
                    String[] charParts = "a,b,".split(',');
                  String[] textParts = "::aden::code::".split("::");
                  String joined = String.join("-", new String[] { "aden", null, "code" });
                  char[] letters = "aden".toCharArray();
                  char[] copied = new char[6];
                  String fromChars = String.copyValueOf(new char[] { 'o', 'k' });
                  String rangedChars = String.copyValueOf(new char[] { 'a', 'b', 'c', 'd' }, 1, 2);
                  String valueChars = String.valueOf(new char[] { 'z', 'i', 'p' });
                  String valueRangedChars = String.valueOf(new char[] { 'n', 'o', 'd', 'e' }, 1, 2);
                  "aden".getChars(1, 5, copied, 1);
                  boolean contentEquals = "aden".contentEquals((CharSequence) "aden");
                  boolean region = "Aden Lang".regionMatches(5, "coder", 0, 3);
                  boolean regionIgnoreCase = "Aden Lang".regionMatches(true, 0, "aden", 0, 5);
                  String lower = "PuLsE".toLowerCase();
                  String upper = "PuLsE".toUpperCase();
                  boolean sameIgnoreCase = "Aden".equalsIgnoreCase("pUlSe");
                boolean blank = " \t\n".isBlank();
                String stripped = "  aden  ".strip();
                String leading = "  aden".stripLeading();
                String trailing = "aden  ".stripTrailing();
                int textHash = "aden".hashCode();
                String stringMinInt = String.valueOf(Integer.MIN_VALUE);
                  String minInt = Integer.toString(Integer.intValue(Integer.parse("-2147483648")));
                  String hex = Integer.toHexString(255);
                  String negativeInt = String.valueOf(-42);
                  String truth = String.valueOf(true);
                  String wide = String.valueOf(9000000000L);
                String byteText = String.valueOf((byte) -7);
                String shortText = String.valueOf((short) 1234);
                String ubyteText = String.valueOf((ubyte) 200);
                String ushortText = String.valueOf((ushort) 60000);
                String uintText = String.valueOf((uint) 4000000000L);
                String minLong = Long.toString(Long.longValue(Long.parse("-9223372036854775808")));
                  String positiveLong = Long.toString(9000000000L);
                  String mathLine = "one plus six is: " + (1 + 6);
                  String rightConcat = 1 + "x";
                  String objectConcat = new Main() + " ready";
                  String nullConcat = "null=" + null;
                  String objectText = new Main().toString();
                  boolean objectFormat = objectText.startsWith("app.core.Main@");
                  Long parsedLong = Long.parse("+42");
                  UInteger parsedUInt = UInteger.parse("4000000000");
                    Boolean parsedTrue = Boolean.parse("TrUe");
                    Boolean parsedFalse = Boolean.parse(" false ");
                  Object ref = new Main();
                  String refText = ref.toString();
                  boolean refFormat = refText.startsWith("app.core.Main@");
                  System.out.println((Object) new Main());
                System.out.println(new char[] { 'o', 'k' });
                System.out.println(1.5f);
                System.out.println(2.5);
                System.out.println((uint) 4000000000L);

                StringBuilder builder = new StringBuilder("ab");
                boolean emptyBefore = builder.isEmpty();
                builder.append(9000000000L);
                builder.appendLine("tail");
                builder.appendLine(42);
                builder.appendLine(true);
                builder.appendLine('Z');
                builder.appendLine(1.5f);
                builder.appendLine(2.5);
                  builder.appendLine(1234567890123L);
                    builder.appendLine(new Main());
                    builder.appendLine((CharSequence) "line");
                    builder.appendLine(new char[] { 'o', 'k' });
                    builder.append((CharSequence) "chars");
                    builder.append((CharSequence) "segment", 1, 4);
                    builder.append(new char[] { 'x', 'y' });
                    builder.append(new char[] { 'a', 'b', 'c', 'd' }, 1, 2);
                  builder.append((byte) -7);
                builder.append((short) 1234);
                builder.append((ubyte) 200);
                  builder.append((ushort) 60000);
                  builder.append((uint) 4000000000L);
                  builder.insert(0, (CharSequence) "Q");
                  builder.insert(1, (Object) new Main());
                  builder.insert(2, false);
                  builder.insert(3, '!');
                  builder.insert(4, (byte) 9);
                  builder.insert(5, (short) 88);
                  builder.insert(6, (ubyte) 7);
                  builder.insert(7, (ushort) 66);
                    builder.insert(8, (uint) 55L);
                      builder.insert(9, (ulong) 44L);
                      builder.insert(10, (CharSequence) "slice", 1, 4);
                      builder.insert(11, new char[] { 'J', 'K' });
                      builder.insert(12, new char[] { 'm', 'n', 'o', 'p' }, 1, 2);
                String chained = new StringBuilder().append("x").append('y').appendLine(7).toString();
                boolean builderContentEquals = new StringBuilder("aden").contentEquals((CharSequence) "aden");
                int builderCompare = new StringBuilder("abc").compareTo(new StringBuilder("abd"));
                builder.deleteCharAt(1);
                builder.replace(1, 5, "XYZ");
                builder.setCharAt(0, 'Q');
                String middle = builder.substring(1, 4);
                String tail = builder.substring(4);
                int firstIndex = builder.indexOf("YZ");
                int indexedFirst = builder.indexOf("app", 3);
                int lastIndex = builder.lastIndexOf("tail");
                int indexedLast = builder.lastIndexOf("app", builder.length());
                builder.reverse();
                builder.clear();
                boolean emptyAfter = builder.isEmpty();
            }
        }
    "#;

    check(src).expect("String and StringBuilder refinement baseline should typecheck");
}

#[test]
fn check_rejects_static_import_visibility_with_duplicate_main_names_across_packages() {
    let main_one = r#"
        package app.one;
        class Main {
            public static void main() {
            }
        }
    "#;
    let util_one = r#"
        package app.one;
        class Util {
            static int secret() {
                return 1;
            }
        }
    "#;
    let main_two = r#"
        package app.two;
        import static app.one.Util.secret;

        class Main {
            public static void main() {
                IO.println(secret());
            }
        }
    "#;

    let err = analyze_merged_with_contexts(&[main_one, util_one, main_two])
        .expect_err("package-private static import should not leak across packages");
    assert!(err
        .to_string()
        .contains("No method 'secret' matches argument types () in class 'Main'"));
}

#[test]
fn check_accepts_prelude_class_types_in_declarations_without_imports() {
    let src = r#"
        package app.core;

        class Main {
            private List values;
            private Collection base;

            public static void main() {
                List local = new ArrayList();
                Collection c = new ArrayList();
                c.clear();
                IO.println(local.size());
            }
        }
    "#;

    check(src).expect("prelude class fallback should also resolve declaration type positions");
}

#[test]
fn check_accepts_arraylist_for_collection_and_list_contracts() {
    let src = r#"
        package app.core;
        import aden.collections.Collection;
        import aden.collections.List;
        import aden.collections.ArrayList;

        class Main {
            public static void main() {
                Collection c = new ArrayList();
                List l = new ArrayList();
                c.clear();
                l.add(1);
            }
        }
    "#;

    check(src).expect("ArrayList should satisfy both Collection and List contracts");
}

#[test]
fn check_accepts_arraylist_crud_surface_calls() {
    let src = r#"
        package app.core;
        import aden.collections.ArrayList;
        import aden.collections.List;

        class Main {
            public static void main() {
                List list = new ArrayList();
                list.add(1);
                list.add("v");
                int a = list.getInt(0);
                String b = list.getString(1);
                list.clear();
                int c = list.size();
            }
        }
    "#;

    check(src).expect("ArrayList CRUD surface should typecheck through List contract");
}

#[test]
fn check_accepts_list_remove_surface_calls() {
    let src = r#"
        package app.core;
        import aden.lang.Object;
        import aden.collections.ArrayList;
        import aden.collections.LinkedList;
        import aden.collections.List;

        class Box {
            public String name;

            public Box(String name) {
                this.name = name;
            }
        }

        class Main {
            public static void main() {
                Box a = new Box("a");
                Box b = new Box("b");

                List list = new ArrayList();
                list.add(a);
                list.add(b);
                Object removed = list.remove(0);
                boolean missing = list.remove(a);
                boolean present = list.remove(b);

                List linked = new LinkedList();
                linked.add(a);
                linked.add(b);
                Object removedLinked = linked.remove(1);
                boolean linkedPresent = linked.remove(a);
            }
        }
    "#;

    check(src).expect("List remove surface should typecheck through ArrayList and LinkedList");
}

#[test]
fn check_accepts_list_last_indexof_surface_calls() {
    let src = r#"
        package app.core;
        import aden.lang.Object;
        import aden.collections.ArrayList;
        import aden.collections.LinkedList;
        import aden.collections.List;

        class Box {
            public String name;

            public Box(String name) {
                this.name = name;
            }
        }

        class Main {
            public static void main() {
                Box a = new Box("a");
                Box b = new Box("b");

                List list = new ArrayList();
                list.add(a);
                list.add(b);
                list.add(a);
                int rawPos = list.lastIndexOf(a);
                int intPos = list.lastIndexOf(4);
                int stringPos = list.lastIndexOf("aden");

                List linked = new LinkedList();
                linked.add("aden");
                linked.add("code");
                linked.add("aden");
                int linkedPos = linked.lastIndexOf("aden");
            }
        }
    "#;

    check(src).expect("List lastIndexOf surface should typecheck through ArrayList and LinkedList");
}

#[test]
fn check_accepts_list_end_access_surface_calls() {
    let src = r#"
        package app.core;
        import aden.collections.ArrayList;
        import aden.collections.LinkedList;
        import aden.collections.List;

        class Main {
            public static void main() {
                List list = new ArrayList();
                list.add("a");
                list.add("b");
                String first = (String) list.getFirst();
                String last = (String) list.getLast();

                List linked = new LinkedList();
                linked.add("aden");
                linked.add("code");
                String linkedFirst = (String) linked.getFirst();
                String linkedLast = (String) linked.getLast();
            }
        }
    "#;

    check(src).expect("List end-access surface should typecheck through ArrayList and LinkedList");
}

#[test]
fn check_accepts_linkedlist_for_collection_and_list_contracts() {
    let src = r#"
        package app.core;
        import aden.collections.Collection;
        import aden.collections.List;
        import aden.collections.LinkedList;

        class Main {
            public static void main() {
                Collection c = new LinkedList();
                List l = new LinkedList();
                c.clear();
                l.add(1);
                int v = l.getInt(0);
            }
        }
    "#;

    check(src).expect("LinkedList should satisfy both Collection and List contracts");
}

#[test]
fn check_accepts_hashset_and_hashmap_core_operations() {
    let src = r#"
        package app.core;
        import aden.collections.Set;
        import aden.collections.HashSet;
        import aden.collections.HashMap;

        class Main {
            public static void main() {
                Set s = new HashSet();
                s.add("a");
                boolean has = s.contains("a");
                int n = s.size();
                s.clear();

                HashMap m = new HashMap();
                m.put("k", "v");
                m.putInt("n", 3);
                String v = (String) m.get("k");
                int x = m.getInt("n");
                boolean ok = m.containsKey("k");
                m.clear();
            }
        }
    "#;

    check(src).expect("HashSet/HashMap operations should typecheck");
}

#[test]
fn check_accepts_linkedlist_queue_and_deque_operations() {
    let src = r#"
        package app.core;
        import aden.collections.Queue;
        import aden.collections.Deque;
        import aden.collections.LinkedList;

        class Main {
            public static void main() {
                Queue q = new LinkedList();
                q.offer(10);
                int a = (Integer) q.poll();
                boolean emptyQ = q.isEmpty();

                Deque d = new LinkedList();
                d.addFirst(1);
                d.addLast(2);
                int b = (Integer) d.removeFirst();
                int c = (Integer) d.removeLast();
                boolean emptyD = d.isEmpty();
            }
        }
    "#;

    check(src).expect("LinkedList should satisfy Queue/Deque contracts");
}

#[test]
fn check_accepts_linkedlist_deque_occurrence_removal_operations() {
    let src = r#"
        package app.core;
        import aden.collections.Deque;
        import aden.collections.LinkedList;

        class Box {
            public String name;

            public Box(String name) {
                this.name = name;
            }
        }

        class Main {
            public static void main() {
                Box a = new Box("a");
                Box b = new Box("b");
                Deque d = new LinkedList();
                d.addLast(a);
                d.addLast(b);
                d.addLast(a);
                boolean removedFront = d.removeFirstOccurrence(a);
                boolean removedBack = d.removeLastOccurrence(a);
                boolean removedMissing = d.removeLastOccurrence(a);
            }
        }
    "#;

    check(src).expect("LinkedList deque occurrence-removal contracts should typecheck");
}

#[test]
fn check_accepts_linkedlist_extended_deque_operations() {
    let src = r#"
        package app.core;
        import aden.collections.Deque;
        import aden.collections.LinkedList;

        class Main {
            public static void main() {
                Deque d = new LinkedList();
                boolean offeredFront = d.offerFirst(1);
                boolean offeredBack = d.offerLast(2);
                int first = (Integer) d.getFirst();
                int last = (Integer) d.getLast();
                int polledFront = (Integer) d.pollFirst();
                int polledBack = (Integer) d.pollLast();
                Object emptyFront = d.pollFirst();
                Object emptyBack = d.pollLast();
            }
        }
    "#;

    check(src).expect("LinkedList extended deque contracts should typecheck");
}

#[test]
fn check_accepts_linkedlist_queue_stack_style_operations() {
    let src = r#"
        package app.core;
        import aden.collections.Queue;
        import aden.collections.Deque;
        import aden.collections.LinkedList;

        class Main {
            public static void main() {
                Queue q = new LinkedList();
                q.offer(7);
                int head = (Integer) q.element();

                Deque d = new LinkedList();
                d.push(1);
                d.push(2);
                int top = (Integer) d.pop();
            }
        }
    "#;

    check(src).expect("LinkedList queue/deque stack-style helpers should typecheck");
}

#[test]
fn check_accepts_linkedlist_queue_remove_helper() {
    let src = r#"
        package app.core;
        import aden.collections.Queue;
        import aden.collections.LinkedList;

        class Main {
            public static void main() {
                Queue q = new LinkedList();
                q.offer(7);
                int head = (Integer) q.remove();
            }
        }
    "#;

    check(src).expect("LinkedList queue remove helper should typecheck");
}

#[test]
fn check_accepts_collection_iteration_baseline() {
    let src = r#"
        package app.core;
        import aden.lang.Object;
        import aden.lang.Iterable;
        import aden.lang.Iterator;
        import aden.collections.Collection;
        import aden.collections.List;
        import aden.collections.Set;
        import aden.collections.ArrayList;
        import aden.collections.LinkedList;
        import aden.collections.HashSet;

        class Main {
            public static void main() {
                Collection base = new ArrayList();
                base.add("a");
                Iterable iterable = base;
                Iterator it = iterable.iterator();

                List list = new LinkedList();
                list.add("aden");
                for (Object item : list) {
                    Object seen = item;
                }

                Set set = new HashSet();
                set.add("x");
                for (var item : set) {
                    Object seen2 = item;
                }
            }
        }
    "#;

    check(src)
        .expect("Collection iteration baseline should typecheck across list/set implementations");
}

#[test]
fn check_accepts_array_iterable_object_baseline() {
    let src = r#"
        package app.core;
        import aden.lang.Object;
        import aden.lang.Iterable;
        import aden.lang.Iterator;
        import aden.collections.Array;

        class Main {
            public static void main() {
                Array words = new Array(2);
                words.setString(0, "aden");
                words.setString(1, "code");

                Iterable iterable = words;
                Iterator it = iterable.iterator();
                for (var item : words) {
                    Object seen = item;
                }
                for (Object item : words) {
                    Object seen2 = item;
                }
            }
        }
    "#;

    check(src).expect("Array should support iterable-object foreach once its lane is established");
}

#[test]
fn check_accepts_map_key_iteration_baseline() {
    let src = r#"
        package app.core;
        import aden.lang.Object;
        import aden.lang.Iterator;
        import aden.collections.Map;
        import aden.collections.HashMap;

        class Main {
            public static void main() {
                Map map = new HashMap();
                map.put("role", "hero");
                map.putInt("hp", 7);

                Iterator keys = map.keyIterator();
                while (keys.hasNext()) {
                    Object key = keys.next();
                }
            }
        }
    "#;

    check(src)
        .expect("Map key iteration baseline should typecheck through the shared map contract");
}

#[test]
fn check_accepts_hashmap_hashset_expanded_surface() {
    let src = r#"
        package app.core;
        import aden.lang.Object;
        import aden.lang.Iterator;
        import aden.collections.Collection;
        import aden.collections.Set;
        import aden.collections.Map;
        import aden.collections.HashMap;
        import aden.collections.HashSet;

        class Main {
            public static void main() {
                Map map = new HashMap();
                map.put("name", "aden");
                map.putInt("hp", 7);
                boolean hasName = map.containsValue("aden");
                boolean hasHp = map.containsValue(7);
                Object removed = map.remove("name");
                Set keys = map.keySet();
                Collection values = map.values();
                Iterator ki = keys.iterator();
                Iterator vi = values.iterator();

                Set set = new HashSet();
                set.add("a");
                boolean removedSet = set.remove("a");
                boolean missingSet = set.remove("b");
            }
        }
    "#;

    check(src).expect("Expanded HashMap/HashSet surface should typecheck through shared contracts");
}

#[test]
fn check_accepts_hashmap_hashset_bulk_helpers() {
    let src = r#"
        package app.core;
        import aden.collections.Collection;
        import aden.collections.Set;
        import aden.collections.Map;
        import aden.collections.HashMap;
        import aden.collections.HashSet;
        import aden.collections.ArrayList;

        class Main {
            public static void main() {
                Map left = new HashMap();
                left.put("name", "aden");
                Map right = new HashMap();
                right.putInt("hp", 7);
                left.putAll(right);

                Collection values = new ArrayList();
                values.add("a");
                values.add("b");
                Set set = new HashSet();
                boolean changed = set.addAll(values);
            }
        }
    "#;

    check(src).expect("Bulk HashMap/HashSet helpers should typecheck through shared contracts");
}

#[test]
fn check_accepts_hashmap_hashset_default_and_bulk_query_helpers() {
    let src = r#"
        package app.core;
        import aden.collections.Collection;
        import aden.collections.Set;
        import aden.collections.Map;
        import aden.collections.HashMap;
        import aden.collections.HashSet;
        import aden.collections.ArrayList;

        class Main {
            public static void main() {
                Map map = new HashMap();
                Object prior = map.putIfAbsent("name", "aden");
                String kept = map.putIfAbsent("name", "code");
                String name = map.getOrDefault("name", "fallback");
                int hp = map.getIntOrDefault("hp", 7);

                Collection values = new ArrayList();
                values.add("a");
                values.add("b");
                Set set = new HashSet();
                set.add("a");
                set.add("b");
                boolean all = set.containsAll(values);
                boolean changed = set.removeAll(values);
            }
        }
    "#;

    check(src).expect("Default and bulk query HashMap/HashSet helpers should typecheck");
}

#[test]
fn check_accepts_hashmap_hashset_final_practical_helpers() {
    let src = r#"
        package app.core;
        import aden.collections.Collection;
        import aden.collections.Set;
        import aden.collections.Map;
        import aden.collections.HashMap;
        import aden.collections.HashSet;
        import aden.collections.ArrayList;

        class Main {
            public static void main() {
                Map map = new HashMap();
                map.put("name", "aden");
                Object previous = map.replace("name", "code");
                Object missing = map.replace("role", "hero");

                Collection values = new ArrayList();
                values.add("a");
                Set set = new HashSet();
                set.add("a");
                set.add("b");
                boolean changed = set.retainAll(values);
            }
        }
    "#;

    check(src).expect("Final practical HashMap/HashSet helpers should typecheck");
}

#[test]
fn check_accepts_arrays_and_collections_utility_baseline() {
    let src = r#"
        package app.core;
        import aden.lang.Object;
        import aden.collections.Array;
        import aden.collections.Collections;
        import aden.collections.Collection;
        import aden.collections.List;
        import aden.collections.Set;
        import aden.collections.ArrayList;
        import aden.util.Arrays;

        class Main {
            public static void main() {
                Array values = new Array(2);
                values.setString(0, "aden");
                values.setString(1, "code");
                List copied = Arrays.asList(values);
                int pos = Arrays.indexOf(values, "code");
                boolean has = Arrays.contains(values, "aden");

                Collection sink = new ArrayList();
                boolean changed = Collections.addAll(sink, copied);
                int freq = Collections.frequency(copied, "aden");
                Collections.reverse(copied);
                List one = Collections.singletonList("x");
                Set set = Collections.singleton("y");
            }
        }
    "#;

    check(src).expect("Arrays and Collections utility baseline should typecheck");
}

#[test]
fn check_accepts_collection_runtime_hardening_surface() {
    let src = r#"
        package app.core;
        import aden.lang.Object;
        import aden.collections.Collection;
        import aden.collections.List;
        import aden.collections.Set;
        import aden.collections.Map;
        import aden.collections.ArrayList;
        import aden.collections.LinkedList;
        import aden.collections.HashMap;
        import aden.collections.HashSet;

        class Box {}

        class Main {
            public static void main() {
                Object nullValue = null;
                Box key = new Box();
                Box value = new Box();
                List list = new ArrayList();
                list.add("a");
                list.add("b");
                list.addAll(list);

                LinkedList queue = new LinkedList();
                queue.add(1);
                queue.add(2);
                queue.addAll(queue);

                HashMap map = new HashMap();
                map.put(key, value);
                map.put(nullValue, nullValue);
                map.putInt("n", 7);
                map.putAll(map);
                String missing = map.getOrDefault("missing", "fallback");
                Set keys = map.keySet();
                Collection values = map.values();

                HashSet set = new HashSet();
                set.add(nullValue);
                set.add("x");
                boolean hadAll = set.containsAll(set);
                boolean cleared = set.removeAll(set);
                set.add("keep");
                boolean retained = set.retainAll(set);
            }
        }
    "#;

    check(src).expect("Collection runtime hardening surface should typecheck");
}

#[test]
fn check_accepts_generic_collection_public_surface() {
    let src = r#"
        package app.core;
        import aden.collections.ArrayList;
        import aden.collections.Collection;
        import aden.collections.Deque;
        import aden.collections.HashMap;
        import aden.collections.HashSet;
        import aden.collections.LinkedList;
        import aden.collections.List;
        import aden.collections.Map;
        import aden.collections.Queue;
        import aden.collections.Set;

        class Box {
            public String name;

            public Box(String name) {
                this.name = name;
            }
        }

        class Main {
            public static void main() {
                List<String> words = new ArrayList<String>();
                words.add("aden");
                String first = words.get(0);

                Collection<String> bag = words;
                boolean hadWord = bag.contains("aden");

                Set<Box> boxes = new HashSet<Box>();
                Box hero = new Box("hero");
                boxes.add(hero);
                boolean hasHero = boxes.contains(hero);

                Map<String, Box> byName = new HashMap<String, Box>();
                Box prior = byName.put("hero", hero);
                Box loaded = byName.get("hero");
                boolean keyed = byName.containsKey("hero");

                Queue<String> queue = new LinkedList<String>();
                queue.offer("front");
                String head = queue.element();

                Deque<String> deque = new LinkedList<String>();
                deque.addFirst("left");
                deque.addLast("right");
                String left = deque.removeFirst();
                String right = deque.removeLast();
            }
        }
    "#;

    check(src).expect("generic collection public surface should typecheck");
}

#[test]
fn check_accepts_wrapper_based_collection_usage_without_primitive_helpers() {
    let src = r#"
        package app.core;
        import aden.lang.Integer;
        import aden.collections.ArrayList;
        import aden.collections.HashMap;
        import aden.collections.LinkedList;
        import aden.collections.List;
        import aden.collections.Map;
        import aden.collections.Queue;

        class Main {
            public static void main() {
                List<Integer> values = new ArrayList<Integer>();
                values.add(1);
                values.add(Integer.valueOf(2));
                Integer first = values.get(0);
                int rawFirst = first;

                Map<String, Integer> counts = new HashMap<String, Integer>();
                counts.put("name", 7);
                counts.put("other", Integer.valueOf(9));
                Integer boxed = counts.get("name");
                int raw = counts.get("other");

                Queue<Integer> queue = new LinkedList<Integer>();
                queue.offer(3);
                Integer head = queue.element();
                int rawHead = queue.remove();
            }
        }
    "#;

    check(src)
        .expect("wrapper-based collection usage should typecheck without primitive helper methods");
}

#[test]
fn check_accepts_collection_value_kind_matrix_without_primitive_helpers() {
    let src = r#"
        package app.core;
        import aden.lang.Boolean;
        import aden.lang.Byte;
        import aden.lang.Char;
        import aden.lang.Double;
        import aden.lang.Float;
        import aden.lang.Integer;
        import aden.lang.Long;
        import aden.lang.Short;
        import aden.lang.UByte;
        import aden.lang.UInteger;
        import aden.lang.ULong;
        import aden.lang.UShort;
        import aden.collections.ArrayList;
        import aden.collections.HashMap;
        import aden.collections.LinkedList;
        import aden.collections.List;
        import aden.collections.Map;
        import aden.collections.Queue;

        class Box {
            private String name;

            public Box(String name) {
                this.name = name;
            }

            public String name() {
                return this.name;
            }
        }

        class Main {
            public static void main() {
                List<String> names = new ArrayList<String>();
                names.add("aden");
                String name = names.get(0);

                List<Box> boxes = new ArrayList<Box>();
                boxes.add(new Box("core"));
                Box box = boxes.get(0);

                Map<String, Box> boxMap = new HashMap<String, Box>();
                boxMap.put("hero", box);
                boxMap.put("missing", null);
                Box loaded = boxMap.get("hero");
                Box empty = boxMap.get("missing");

                List<Byte> bytes = new ArrayList<Byte>();
                bytes.add((byte) 7);
                bytes.add(Byte.valueOf((byte) 8));
                byte rawByte = bytes.get(1);

                List<Short> shorts = new ArrayList<Short>();
                shorts.add((short) 300);
                shorts.add(Short.valueOf((short) 301));
                short rawShort = shorts.get(1);

                List<Integer> ints = new ArrayList<Integer>();
                ints.add(11);
                ints.add(Integer.valueOf(12));
                int rawInt = ints.get(1);

                Queue<Long> longs = new LinkedList<Long>();
                longs.offer(10000000000L);
                longs.offer(Long.valueOf(10000000001L));
                long rawLong = longs.remove();

                List<Boolean> flags = new ArrayList<Boolean>();
                flags.add(true);
                flags.add(Boolean.valueOf(false));
                boolean rawFlag = flags.get(1);

                List<Char> chars = new ArrayList<Char>();
                chars.add('P');
                chars.add(Char.valueOf('Q'));
                char rawChar = chars.get(1);

                List<Float> floats = new ArrayList<Float>();
                floats.add(1.25f);
                floats.add(Float.valueOf(2.5f));
                float rawFloat = floats.get(1);

                Queue<Double> doubles = new LinkedList<Double>();
                doubles.offer(3.5d);
                doubles.offer(Double.valueOf(4.5d));
                double rawDouble = doubles.remove();

                List<UByte> ubytes = new ArrayList<UByte>();
                ubytes.add((ubyte) 200);
                ubytes.add(UByte.valueOf((ubyte) 201));
                ubyte rawUByte = ubytes.get(1);

                List<UShort> ushorts = new ArrayList<UShort>();
                ushorts.add((ushort) 60000);
                ushorts.add(UShort.valueOf((ushort) 60001));
                ushort rawUShort = ushorts.get(1);

                Map<String, UInteger> uints = new HashMap<String, UInteger>();
                uints.put("big", (uint) 4000000000L);
                uints.put("bigger", UInteger.valueOf((uint) 4000000001L));
                uint rawUInt = uints.get("bigger");

                Queue<ULong> ulongs = new LinkedList<ULong>();
                ulongs.offer(ULong.parse("18446744073709551614"));
                ulongs.offer(ULong.parse("18446744073709551615"));
                ulong rawULong = ulongs.remove();
            }
        }
    "#;

    check(src)
        .expect("collection value-kind matrix should typecheck without primitive helper methods");
}

#[test]
fn check_accepts_collection_wrapper_query_and_raw_object_equality_flows() {
    let src = r#"
        package app.core;
        import aden.lang.Byte;
        import aden.lang.Integer;
        import aden.lang.UInteger;
        import aden.collections.ArrayList;
        import aden.collections.HashMap;
        import aden.collections.HashSet;
        import aden.collections.List;
        import aden.collections.Map;
        import aden.collections.Set;

        class Box {
            private String name;

            public Box(String name) {
                this.name = name;
            }
        }

        class Main {
            public static void main() {
                List<Byte> bytes = new ArrayList<Byte>();
                bytes.add((byte) 7);
                bytes.add((byte) 8);
                boolean hasByte = bytes.contains((byte) 8);
                int byteIndex = bytes.indexOf((byte) 8);
                boolean removedByte = bytes.remove(Byte.valueOf((byte) 7));

                List<Integer> ints = new ArrayList<Integer>();
                ints.add(7);
                ints.add(Integer.valueOf(8));
                boolean hasInt = ints.contains(8);
                int lastInt = ints.lastIndexOf(8);
                boolean removedInt = ints.remove(Integer.valueOf(7));

                Set<UInteger> ids = new HashSet<UInteger>();
                ids.add((uint) 4000000000L);
                boolean hasUInt = ids.contains((uint) 4000000000L);
                boolean removedUInt = ids.remove(UInteger.valueOf((uint) 4000000000L));

                Map<String, Byte> byteMap = new HashMap<String, Byte>();
                byteMap.put("b", (byte) 7);
                boolean byteValue = byteMap.containsValue((byte) 7);

                Map<String, UInteger> uintMap = new HashMap<String, UInteger>();
                uintMap.put("id", (uint) 4000000000L);
                boolean uintValue = uintMap.containsValue((uint) 4000000000L);

                Map<String, Box> boxes = new HashMap<String, Box>();
                boxes.put("hero", new Box("aden"));
                boxes.put("empty", null);
                boolean hasNull = boxes.containsKey("empty");
                Box empty = boxes.remove("empty");
            }
        }
    "#;

    check(src).expect("collection wrapper query and raw-object equality flows should typecheck");
}

#[test]
fn check_accepts_collections_empty_and_singleton_map_helpers() {
    let src = r#"
        package app.core;
        import aden.collections.Collection;
        import aden.collections.Collections;
        import aden.collections.List;
        import aden.collections.Map;
        import aden.collections.Set;
        import aden.lang.Integer;

        class Main {
            public static void main() {
                List<String> emptyNames = Collections.emptyList();
                boolean noNames = emptyNames.isEmpty();

                Set<Integer> emptyIds = Collections.emptySet();
                boolean noIds = emptyIds.isEmpty();

                Map<String, Integer> emptyCounts = Collections.emptyMap();
                boolean noCounts = emptyCounts.isEmpty();

                Map<String, Integer> oneCount = Collections.singletonMap("hp", Integer.valueOf(7));
                Integer hp = oneCount.get("hp");
                Set<String> keys = oneCount.keySet();
                Collection<Integer> values = oneCount.values();
                boolean hasHp = keys.contains("hp");
                boolean hasValue = values.contains(Integer.valueOf(7));
            }
        }
    "#;

    check(src).expect("Collections empty/singleton helper surface should typecheck");
}

#[test]
fn check_accepts_hashmap_entry_set_copy_view_baseline() {
    let src = r#"
        package app.core;
        import aden.collections.Collection;
        import aden.collections.HashMap;
        import aden.collections.Map;
        import aden.collections.MapEntry;
        import aden.collections.Set;
        import aden.lang.Integer;
        import aden.lang.Iterator;

        class Main {
            public static void main() {
                Map<String, Integer> stats = new HashMap<String, Integer>();
                stats.put("hp", Integer.valueOf(7));
                stats.put("mp", Integer.valueOf(9));

                Set<MapEntry> entries = stats.entrySet();
                Iterator items = entries.iterator();
                while (items.hasNext()) {
                    MapEntry entry = (MapEntry) items.next();
                    String key = (String) entry.getKey();
                    Integer value = (Integer) entry.getValue();
                }

                stats.put("xp", Integer.valueOf(11));
                int count = entries.size();
            }
        }
    "#;

    check(src).expect("HashMap entrySet copy-view baseline should typecheck");
}

#[test]
fn check_accepts_collection_bulk_contract_on_list_implementations() {
    let src = r#"
        package app.core;
        import aden.collections.ArrayList;
        import aden.collections.Collection;
        import aden.collections.LinkedList;

        class Main {
            public static void main() {
                Collection<String> left = new ArrayList<String>();
                left.add("a");
                left.add("b");
                left.add("b");

                Collection<String> filter = new LinkedList<String>();
                filter.add("b");

                boolean hasAll = left.containsAll(filter);
                boolean removed = left.removeAll(filter);
                boolean nowEmpty = left.isEmpty();

                Collection<String> refill = new LinkedList<String>();
                refill.add("x");
                refill.add("y");
                refill.add("z");
                left.addAll(refill);

                Collection<String> keep = new ArrayList<String>();
                keep.add("x");
                keep.add("z");
                boolean retained = left.retainAll(keep);
                int size = left.size();
            }
        }
    "#;

    check(src).expect("Collection bulk contract should typecheck through list implementations");
}

#[test]
fn check_accepts_collection_remove_contract_across_list_and_set() {
    let src = r#"
        package app.core;
        import aden.collections.ArrayList;
        import aden.collections.Collection;
        import aden.collections.HashSet;

        class Main {
            public static void main() {
                Collection<String> list = new ArrayList<String>();
                list.add("a");
                list.add("b");
                boolean removedList = list.remove("a");

                Collection<String> set = new HashSet<String>();
                set.add("x");
                boolean removedSet = set.remove("x");
                boolean missing = set.remove("y");
            }
        }
    "#;

    check(src)
        .expect("Collection remove contract should typecheck across list and set implementations");
}

#[test]
fn check_accepts_hashmap_live_keyset_and_values_views() {
    let src = r#"
        package app.core;
        import aden.collections.Collection;
        import aden.collections.HashMap;
        import aden.collections.Map;
        import aden.collections.Set;

        class Main {
            public static void main() {
                Map<String, String> values = new HashMap<String, String>();
                values.put("a", "one");
                values.put("b", "two");

                Set<String> keys = values.keySet();
                Collection<String> seen = values.values();

                boolean removedKey = keys.remove("a");
                boolean keyGone = !values.containsKey("a");
                boolean removedValue = seen.remove("two");
                boolean valueGone = !values.containsKey("b");
                int keySize = keys.size();
                int valueSize = seen.size();
            }
        }
    "#;

    check(src).expect("HashMap keySet/values live-view baseline should typecheck");
}
