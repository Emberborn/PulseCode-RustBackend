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
- raw host-ABI calls

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
- public `pulse.interop.NativeCalls`
- backend/runtime support for:
  - dynamic library load/unload
  - exported symbol resolution
  - raw 0-4 argument native calls

This is enough to start wrapping:

- Rust exports
- C exports
- C++ exports where the symbol name is already known/resolved
- Win32 / DLL APIs

without keeping Rust as a privileged reachback path.

## Planned Expansion

Follow-up interop growth should focus on the hard-to-add-later host boundary
pieces while `F1-97` is still open:

- string/buffer marshalling helpers
- broader argument/return kind support
- module/self/process symbol lookup helpers
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
