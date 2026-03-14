# PulseCode Stdlib API Index (C1.5)

Purpose:
- Provide a single source-of-truth inventory of stdlib classes currently shipped from `stdlib/src`.
- Support C1.5 closure gating (`M3-18`) with an explicit, reviewable index.

Source root:
- `stdlib/src`

## com.pulse.lang

Core/runtime surface:
- `Boolean`
- `Byte`
- `Char`
- `Class`
- `Comparable`
- `ConsoleWriter`
- `Double`
- `Float`
- `IO`
- `Integer`
- `Iterable`
- `Iterator`
- `Long`
- `Object`
- `PrintStream`
- `Short`
- `String`
- `StringBuilder`
- `System`
- `UByte`
- `UInteger`
- `ULong`
- `UShort`
- `Void`

Exceptions/errors:
- `Throwable`
- `Exception`
- `RuntimeException`
- `IllegalArgumentException`
- `IllegalStateException`
- `IndexOutOfBoundsException`
- `NullPointerException`
- `NumberFormatException`
- `UnsupportedOperationException`

## com.pulse.collections

- `Array`
- `ArrayList`
- `Collection`
- `Deque`
- `HashMap`
- `HashSet`
- `LinkedList`
- `List`
- `Map`
- `Queue`
- `Set`

## com.pulse.io

- `File`
- `Files`
- `InputStream`
- `OutputStream`
- `Path`

## com.pulse.math

- `Math`
- `Random`

## com.pulse.time

- `Duration`
- `Instant`

## com.pulse.rt

- `Intrinsics`

## Notes

- This index documents current class inventory, not complete API signatures.
- Runtime ABI mappings for intrinsic-backed behaviors are locked in:
  - `docs/RUNTIME_INTRINSICS_ABI.md`
