# Numeric Conversion Matrix (M2-09 Lock)

Status:
- Locked on March 10, 2026 for C1.5 M2-09 cast/literal conformance.

Scope:
- Assignment, parameter passing, and return-boundary type checks in semantics.
- This matrix defines current compiler behavior with explicit numeric cast syntax enabled.

## Rule Summary

- Primitive numeric conversions are currently strict:
  - exact primitive type match is allowed
  - implicit widening is rejected
  - implicit narrowing is rejected
  - implicit signed/unsigned conversion is rejected
- Primitive-wrapper boxing/unboxing is allowed only for direct wrapper pairs:
  - `int <-> Integer`, `uint <-> UInteger`, etc.
- `null` is never allowed for primitives.

## Conversion Matrix (Primitive -> Primitive)

Legend:
- `OK`: accepted
- `ERR`: rejected

| From \ To | byte | short | int | long | float | double | char | ubyte | ushort | uint | ulong |
|---|---|---|---|---|---|---|---|---|---|---|---|
| byte | OK | ERR | ERR | ERR | ERR | ERR | ERR | ERR | ERR | ERR | ERR |
| short | ERR | OK | ERR | ERR | ERR | ERR | ERR | ERR | ERR | ERR | ERR |
| int | ERR | ERR | OK | ERR | ERR | ERR | ERR | ERR | ERR | ERR | ERR |
| long | ERR | ERR | ERR | OK | ERR | ERR | ERR | ERR | ERR | ERR | ERR |
| float | ERR | ERR | ERR | ERR | OK | ERR | ERR | ERR | ERR | ERR | ERR |
| double | ERR | ERR | ERR | ERR | ERR | OK | ERR | ERR | ERR | ERR | ERR |
| char | ERR | ERR | ERR | ERR | ERR | ERR | OK | ERR | ERR | ERR | ERR |
| ubyte | ERR | ERR | ERR | ERR | ERR | ERR | ERR | OK | ERR | ERR | ERR |
| ushort | ERR | ERR | ERR | ERR | ERR | ERR | ERR | ERR | OK | ERR | ERR |
| uint | ERR | ERR | ERR | ERR | ERR | ERR | ERR | ERR | ERR | OK | ERR |
| ulong | ERR | ERR | ERR | ERR | ERR | ERR | ERR | ERR | ERR | ERR | OK |

## Diagnostics Contract

Rejected numeric primitive conversions use:
- Implicit numeric conversion diagnostics instruct users to use an explicit cast.

`<category>` values:
- `signed-to-unsigned`
- `unsigned-to-signed`
- `widening-or-narrowing`

## Overflow Diagnostics Baseline

- Explicit cast syntax is implemented; cross-primitive conversion must be explicit when types differ.
- Cross-primitive implicit conversions still fail at type-check time (casts required).
- Runtime overflow behavior for primitive arithmetic is backend/runtime-defined and out of this M2-09 semantic lock.
