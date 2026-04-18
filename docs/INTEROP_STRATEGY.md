# Interop Strategy

## Purpose

Define the Pulse-owned interop boundary that allows Pulse to borrow foreign
implementation without borrowing authority.

This is not just ordinary FFI. The intended use is:

- define a Pulse-native public contract first
- satisfy missing implementation temporarily through a foreign backend
- keep Pulse semantics, ownership, lifecycle, and error behavior at the public surface
- later replace the foreign implementation with Pulse-native implementation without changing the public contract

## Ownership Rule

Interop provides implementation reach, not truth.

That means:

- Pulse owns the public contract
- Pulse owns the wrapper semantics
- Pulse owns orchestration and lifecycle
- foreign code is an implementation detail behind that contract

Interop must not become bootstrap in disguise.

## Leakage Rule

Do not let foreign semantics leak upward into the Pulse-facing surface.

Examples of leakage that should be resisted:

- Rust `Result` semantics becoming the public Pulse error model
- C pointer ownership becoming ambient Pulse ownership rules
- JVM/CLR object identity becoming the Pulse object model
- foreign naming/type conventions becoming the native Pulse API shape

The wrapper/adaptor layer exists specifically to stop that leakage.

## Two Layers

### Public raw interop

The public stdlib now owns the raw interop surface under `pulse.interop.*`.

This surface is intentionally low-level:

- dynamic library handles
- symbol lookup
- function/callback pointer wrappers
- raw host-ABI calls
- structured host-ABI argument wrappers
- structured native pointers
- owned native byte buffers
- borrowed byte spans/views
- owned temporary UTF-8 backing storage
- explicit borrowed/adopted/manual ownership modes for interop-backed resources

This gives ordinary users a standard interop path without forcing them into
`author.*`.

### Pulse-owned feature wrappers

Higher-level absorbed features should sit above the raw interop surface:

- define a Pulse-native type/API first
- call into foreign code only underneath that wrapper
- preserve Pulse behavior at the public face

That is the mechanism for raising foreign capability into the language as if it
were native from the start.

## Current First Slice

The first executable interop slice is intentionally narrow:

- public `pulse.interop.NativeLibrary`
- public `pulse.interop.NativeSymbol`
- public `pulse.interop.NativeFunction`
- public `pulse.interop.NativeCalls`
- public `pulse.interop.NativeCallback0..4`
- public `pulse.interop.NativeCallbackHandle`
- public `pulse.interop.NativePointer`
- public `pulse.interop.NativeArgument`
- public `pulse.interop.NativeBuffer`
- public `pulse.interop.NativeByteSpan`
- public `pulse.interop.NativeUtf8String`
- public `pulse.interop.NativeOwnership`
- public `pulse.interop.NativeManagedResource`
- backend/runtime support for:
  - dynamic library load/unload
  - exported symbol resolution
- raw 0-4 argument native calls
- mixed boolean/int/pointer/buffer/span/UTF-8 argument marshalling through `NativeArgument`
- owned native byte allocation/free
- byte reads/writes/copies
- pointer-sized reads/writes
- Pulse string -> owned UTF-8+NUL backing storage
- explicit-length and NUL-terminated UTF-8 decode
- loaded-module lookup without taking loader ownership
- current-process-image lookup without taking loader ownership
- symbol-to-function lifting and direct function-pointer invocation
- function-pointer arguments passed back into foreign APIs through `NativeArgument`
- registered native callback handles with ARC-backed teardown
- native-to-Pulse callback re-entry through generated trampoline slots
- adopted interop resources now release through ARC-backed object teardown by default
- borrowed and manual wrappers keep structured Pulse ownership without taking over the foreign release path

This is enough to start wrapping:

- Rust exports
- C exports
- C++ exports where the symbol name is already known/resolved
- Win32 / DLL APIs

without keeping Rust as a privileged reachback path.

## Current Memory/Marshalling Direction

The next durable interop boundary is not just "more raw calls." It is
ownership-safe marshalling:

- `NativePointer` replaces naked `long` for pointer arithmetic and pointer-sized field access
- `NativeArgument` keeps mixed foreign call shapes structured without inventing a second native call ABI
- `NativeBuffer` owns mutable native storage and closes deterministically
- `NativeByteSpan` borrows subranges without taking ownership
- `NativeUtf8String` owns temporary UTF-8+NUL call backing storage and decodes foreign UTF-8 back into Pulse strings
- `NativeOwnership` makes borrowed/adopted/manual release policy explicit at the public API boundary
- `NativeManagedResource` marks the narrow interop-owned classes that participate in ARC-triggered native cleanup

This is the minimum substrate needed so absorbed foreign-backed features can
borrow implementation without forcing raw pointer/heap semantics onto the rest
of Pulse.

## Planned Expansion

Follow-up interop growth should focus on the hard-to-add-later host boundary
pieces while `F1-97` is still open:

- broader argument/return kind support
- structured native error capture where useful
- durable wrapper patterns for absorbed foreign-backed features

If a capability would be annoying or bootstrap-dependent to add later because it
needs backend/runtime/host support, bring that substrate up during `F1-97`.

## Relationship To Self-Hosting

A real Pulse-owned interop boundary allows earlier self-hosting because missing
capabilities no longer require broad Rust bootstrap ownership.

Instead:

- Pulse owns the compiler/runtime/build/tooling programs
- narrow missing capabilities can temporarily live behind Pulse-owned interop adapters
- Rust becomes one provider among many, not a second hidden authority

That is the intended role of interop in the self-sustained transition.
