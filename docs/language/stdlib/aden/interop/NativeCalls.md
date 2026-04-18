# aden.interop.NativeCalls

Kind: ``class``

Source: ``stdlib/src/aden/interop/NativeCalls.aden``

## Summary

Raw native call helpers for the public interop surface.
Use these only at the boundary where Aden is hosting a foreign implementation behind a Aden-owned contract.

## Declaration

```aden
public final class NativeCalls
```

## Members

### ``public static int asInt(long rawValue)``

Converts one raw native return value to `int`.
Use this when a foreign ABI reports a 32-bit scalar result.

### ``public static boolean asBoolean(long rawValue)``

Converts one raw native return value to `boolean`.
Use this when a foreign ABI uses zero/non-zero result semantics.

### ``public static NativePointer asPointer(long rawValue)``

Converts one raw native return value to one structured pointer wrapper.
Use this when a foreign ABI returns a pointer or handle result.

### ``public static String asUtf8ZString(long rawValue)``

Decodes one raw native return value as one NUL-terminated UTF-8 string pointer.
Use this when a foreign ABI returns one borrowed or owned `char*`/UTF-8 pointer result.

### ``public static long callLong0(NativeSymbol symbol)``

Invokes one native symbol with zero raw long/pointer arguments and returns the raw 64-bit result.
Use this for low-level foreign entrypoints before converting the result into Aden-native semantics.

### ``public static long callLong0(NativeFunction function)``

Invokes one raw native function/callback pointer with zero raw long/pointer arguments and returns the raw 64-bit result.
Use this when one foreign API produced one callable address that should now be invoked directly under Aden-owned interop semantics.

### ``public static long callLong1(NativeSymbol symbol, long arg0)``

Invokes one native symbol with one raw long/pointer argument and returns the raw 64-bit result.
Use this for low-level foreign entrypoints before converting the result into Aden-native semantics.

### ``public static long callLong1(NativeFunction function, long arg0)``

Invokes one raw native function/callback pointer with one raw long/pointer argument and returns the raw 64-bit result.
Use this when one foreign API produced one callable address that should now be invoked directly under Aden-owned interop semantics.

### ``public static long callLong1(NativeSymbol symbol, NativeArgument arg0)``

Invokes one native symbol with one structured host-ABI argument wrapper and returns the raw 64-bit result.
Use this for mixed typed interop without scattering manual `long` conversion logic.

### ``public static long callLong1(NativeFunction function, NativeArgument arg0)``

Invokes one raw native function/callback pointer with one structured host-ABI argument wrapper and returns the raw 64-bit result.
Use this for mixed typed interop without scattering manual `long` conversion logic.

### ``public static long callLong1(NativeSymbol symbol, NativePointer arg0)``

Invokes one native symbol with one structured pointer argument and returns the raw 64-bit result.
Use this when the foreign ABI expects one pointer while Aden code should stay pointer-shaped instead of passing naked longs around.

### ``public static long callLong1(NativeFunction function, NativePointer arg0)``

Invokes one raw native function/callback pointer with one structured pointer argument and returns the raw 64-bit result.
Use this when the foreign ABI expects one pointer while Aden code should stay pointer-shaped instead of passing naked longs around.

### ``public static long callLong2(NativeSymbol symbol, long arg0, long arg1)``

Invokes one native symbol with two raw long/pointer arguments and returns the raw 64-bit result.
Use this for low-level foreign entrypoints before converting the result into Aden-native semantics.

### ``public static long callLong2(NativeFunction function, long arg0, long arg1)``

Invokes one raw native function/callback pointer with two raw long/pointer arguments and returns the raw 64-bit result.
Use this when one foreign API produced one callable address that should now be invoked directly under Aden-owned interop semantics.

### ``public static long callLong2(NativeSymbol symbol, NativeArgument arg0, NativeArgument arg1)``

Invokes one native symbol with two structured host-ABI argument wrappers and returns the raw 64-bit result.
Use this for mixed typed interop without scattering manual `long` conversion logic.

### ``public static long callLong2(NativeFunction function, NativeArgument arg0, NativeArgument arg1)``

Invokes one raw native function/callback pointer with two structured host-ABI argument wrappers and returns the raw 64-bit result.
Use this for mixed typed interop without scattering manual `long` conversion logic.

### ``public static long callLong2(NativeSymbol symbol, NativePointer arg0, NativePointer arg1)``

Invokes one native symbol with two structured pointer arguments and returns the raw 64-bit result.
Use this when the foreign ABI expects pointer pairs under Aden-owned pointer semantics.

### ``public static long callLong2(NativeFunction function, NativePointer arg0, NativePointer arg1)``

Invokes one raw native function/callback pointer with two structured pointer arguments and returns the raw 64-bit result.
Use this when the foreign ABI expects pointer pairs under Aden-owned pointer semantics.

### ``public static long callLong3(NativeSymbol symbol, long arg0, long arg1, long arg2)``

Invokes one native symbol with three raw long/pointer arguments and returns the raw 64-bit result.
Use this for low-level foreign entrypoints before converting the result into Aden-native semantics.

### ``public static long callLong3(NativeFunction function, long arg0, long arg1, long arg2)``

Invokes one raw native function/callback pointer with three raw long/pointer arguments and returns the raw 64-bit result.
Use this when one foreign API produced one callable address that should now be invoked directly under Aden-owned interop semantics.

### ``public static long callLong3(``

Invokes one native symbol with three structured host-ABI argument wrappers and returns the raw 64-bit result.
Use this for mixed typed interop without scattering manual `long` conversion logic.

### ``public static long callLong3(``

Invokes one raw native function/callback pointer with three structured host-ABI argument wrappers and returns the raw 64-bit result.
Use this for mixed typed interop without scattering manual `long` conversion logic.

### ``public static long callLong4(NativeSymbol symbol, long arg0, long arg1, long arg2, long arg3)``

Invokes one native symbol with four raw long/pointer arguments and returns the raw 64-bit result.
Use this for low-level foreign entrypoints before converting the result into Aden-native semantics.

### ``public static long callLong4(NativeFunction function, long arg0, long arg1, long arg2, long arg3)``

Invokes one raw native function/callback pointer with four raw long/pointer arguments and returns the raw 64-bit result.
Use this when one foreign API produced one callable address that should now be invoked directly under Aden-owned interop semantics.

### ``public static long callLong4(``

Invokes one native symbol with four structured host-ABI argument wrappers and returns the raw 64-bit result.
Use this for mixed typed interop without scattering manual `long` conversion logic.

### ``public static long callLong4(``

Invokes one raw native function/callback pointer with four structured host-ABI argument wrappers and returns the raw 64-bit result.
Use this for mixed typed interop without scattering manual `long` conversion logic.

### ``public static int callInt0(NativeSymbol symbol)``

Invokes one native symbol with zero raw arguments and truncates the result to `int`.
Use this for common Win32/C/Rust APIs that report 32-bit integer status or identifiers.

### ``public static int callInt1(NativeSymbol symbol, long arg0)``

Invokes one native symbol with one raw argument and truncates the result to `int`.
Use this for common Win32/C/Rust APIs that report 32-bit integer status or identifiers.

### ``public static int callInt1(NativeSymbol symbol, NativePointer arg0)``

Invokes one native symbol with one structured pointer argument and truncates the result to `int`.
Use this for common pointer-taking Win32/C APIs that report 32-bit lengths or status values.

### ``public static int callInt1(NativeSymbol symbol, NativeArgument arg0)``

Invokes one native symbol with one structured host-ABI argument wrapper and truncates the result to `int`.
Use this for mixed typed foreign signatures that report a 32-bit scalar result.

### ``public static int callInt2(NativeSymbol symbol, long arg0, long arg1)``

Invokes one native symbol with two raw arguments and truncates the result to `int`.
Use this for common Win32/C/Rust APIs that report 32-bit integer status or identifiers.

### ``public static int callInt2(NativeSymbol symbol, NativeArgument arg0, NativeArgument arg1)``

Invokes one native symbol with two structured host-ABI argument wrappers and truncates the result to `int`.
Use this for mixed typed foreign signatures that report a 32-bit scalar result.

### ``public static int callInt3(``

Invokes one native symbol with three structured host-ABI argument wrappers and truncates the result to `int`.
Use this for mixed typed foreign signatures that report a 32-bit scalar result.

### ``public static int callInt4(``

Invokes one native symbol with four structured host-ABI argument wrappers and truncates the result to `int`.
Use this for mixed typed foreign signatures that report a 32-bit scalar result.

### ``public static boolean callBoolean0(NativeSymbol symbol)``

Invokes one native symbol with zero raw arguments and interprets a non-zero result as `true`.
Use this for common BOOL-style foreign APIs.

### ``public static boolean callBoolean1(NativeSymbol symbol, long arg0)``

Invokes one native symbol with one raw argument and interprets a non-zero result as `true`.
Use this for common BOOL-style foreign APIs.

### ``public static boolean callBoolean1(NativeSymbol symbol, NativeArgument arg0)``

Invokes one native symbol with one structured host-ABI argument wrapper and interprets a non-zero result as `true`.
Use this for mixed typed BOOL-style foreign APIs.

### ``public static NativePointer callPointer1(NativeSymbol symbol, NativePointer arg0)``

Invokes one native symbol with one structured pointer argument and wraps the raw result as one pointer.
Use this for native APIs that return one pointer/handle result under Aden-owned pointer semantics.

### ``public static NativePointer callPointer1(NativeSymbol symbol, NativeArgument arg0)``

Invokes one native symbol with one structured host-ABI argument wrapper and wraps the raw result as one pointer.
Use this for mixed typed foreign APIs that return one pointer or handle result.

### ``public static NativePointer callPointer2(``

Invokes one native symbol with two structured pointer arguments and wraps the raw result as one pointer.
Use this for native APIs that return one pointer/handle result under Aden-owned pointer semantics.

### ``public static NativePointer callPointer2(``

Invokes one native symbol with two structured host-ABI argument wrappers and wraps the raw result as one pointer.
Use this for mixed typed foreign APIs that return one pointer or handle result.

### ``public static boolean callBoolean2(NativeSymbol symbol, long arg0, long arg1)``

Invokes one native symbol with two raw arguments and interprets a non-zero result as `true`.
Use this for common BOOL-style foreign APIs.

### ``public static boolean callBoolean2(``

Invokes one native symbol with two structured host-ABI argument wrappers and interprets a non-zero result as `true`.
Use this for mixed typed BOOL-style foreign APIs.

### ``public static boolean callBoolean3(``

Invokes one native symbol with three structured host-ABI argument wrappers and interprets a non-zero result as `true`.
Use this for mixed typed BOOL-style foreign APIs.

### ``public static boolean callBoolean4(``

Invokes one native symbol with four structured host-ABI argument wrappers and interprets a non-zero result as `true`.
Use this for mixed typed BOOL-style foreign APIs.

### ``public static String callUtf8ZString0(NativeSymbol symbol)``

Invokes one native symbol with zero arguments and decodes the returned pointer as one NUL-terminated UTF-8 string.
Use this when a foreign API returns one `char*`/UTF-8 pointer result.

### ``public static String callUtf8ZString1(NativeSymbol symbol, NativeArgument arg0)``

Invokes one native symbol with one structured host-ABI argument wrapper and decodes the returned pointer as one NUL-terminated UTF-8 string.
Use this when a foreign API returns one `char*`/UTF-8 pointer result.

### ``public static String callUtf8ZString2(``

Invokes one native symbol with two structured host-ABI argument wrappers and decodes the returned pointer as one NUL-terminated UTF-8 string.
Use this when a foreign API returns one `char*`/UTF-8 pointer result.
