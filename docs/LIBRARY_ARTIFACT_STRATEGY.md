# Library Artifact Strategy

Status: Planned  
Placement: after Phase F, before standalone/self-hosting hardening

## Goal

Lock the long-term direction for PulseCode library distribution and native library consumption without blocking the current build/runtime transition work.

## Canonical Pulse Library Output

The primary distributable output for a Pulse library project is:
- native `.dll`

When PulseCode builds a library project, it should emit:
- native library binary (`.dll`)
- native import library as needed by the toolchain (`.lib`)
- a generated Pulse-facing binding/interface artifact that mirrors the exported library surface for compiler and IDE use

The binding artifact is separate from the DLL itself.

Planned library-project distro layout:
- `build/distro/<profile>/<library>.dll`
- `build/distro/<profile>/bindings/`
  - generated Pulse binding/interface artifacts for that DLL
  - binding file names match the exposed library-facing type names and use normal `.pulse` files

Reason:
- `distro` remains the ready-to-use deliverable folder
- library outputs stay self-contained without forcing an app-style `bin/` / `lib/` split

## Binding Artifact Direction

Pulse libraries should not rely on embedding all developer-facing metadata into the DLL.

Instead, library builds should emit:
- runtime/native artifact
  - `.dll`
- compiler/tooling artifact
  - explicit Pulse binding/interface contract

This binding artifact should describe:
- exported callable surface
- package/class/method structure as seen from PulseCode
- symbol/link mapping needed by the compiler/backend

It can later grow IDE-facing metadata such as:
- docs/comments
- richer signatures
- source references

Planned binding source direction:
- bindings are normal `.pulse` source files
- the binding filename matches the declared type name
- native-boundary declarations use an explicit external/native declaration form
- `external` is treated as a general declaration modifier, not a class-only feature
- it should extend across supported declaration kinds as the language grows
- current direction:
  - `public static external class Name(){}`
  - `public static external interface Name(){}`
  - `public static external enum Name(){}`

Design rule:
- `external` is the stable modifier
- other modifiers (`public`, `static`, etc.) remain subject to declaration-kind validation
- additional declaration kinds can adopt `external` later without inventing a new foreign-only syntax family

## Compiler Model

The compiler should treat library dependencies as native-library + binding-artifact pairs.

High-level flow:
- library project compiles to native `.dll`
- compiler/tooling also gets the generated Pulse binding artifact
- application builds compile against the binding artifact
- compiler/build graph consumes local DLL payloads from `libraries/` and bindings from `bindings/`
- publish/package steps copy required DLL payloads into final application distro output
- backend links/loads the referenced DLL according to build mode and distro layout

This keeps the primary library release artifact native instead of source-packaged.

Planned local project layout for consumption:
- `libraries/`
  - native DLL payloads
- `bindings/`
  - Pulse binding artifacts as `.pulse` files

For non-Pulse native DLLs:
- end users can author or generate bindings themselves
- those bindings may live in project-local source or the project `bindings/` folder

## Multi-Project and Fat Builds

Even with native library outputs as the default release artifact, fat compilation still matters.

Required future support:
- local multi-project builds where projects depend on each other
- compiler/build graph support to compile dependent Pulse projects together into a fat executable when appropriate
- corresponding shared-mode output where the dependency remains a native `.dll`

So the build system still needs:
- project-to-project dependency awareness
- fat/shared selection across dependent projects

## Dependency Acquisition

Remote acquisition is not compiler scope in the first design.

Planned boundary:
- IDE / future package-management tooling downloads and places native library artifacts + binding artifacts into `libraries/`
- compiler only consumes what is already present locally

That keeps package acquisition separate from compilation.

## External Native DLL Support

External native DLL support is a separate but related track.

Initial interop target set:
- C
- C++
- Rust

through explicit native binding artifacts, not automatic semantic understanding of foreign binaries.

Planned model:
- user or IDE provides/generates a binding artifact for a native DLL
- compiler trusts the explicit binding contract
- backend links/calls the foreign library through that contract

Unified rule:
- Pulse-authored native libraries and external native libraries use the same binding model
- Pulse-authored libraries can auto-generate bindings
- external libraries require user-provided or IDE-assisted bindings

.NET DLLs are out of scope for the initial design.

## Non-Goals for the First Cut

- no compiler-managed remote dependency resolution
- no `.pulselib` source-package-first release model
- no requirement to support managed/.NET DLLs
- no requirement to embed rich IDE metadata directly into PE binaries

## Why This Stays After F

Phase E is still foundational because:
- fat vs shared native output is still needed for multi-project and future library builds
- shared runtime boundaries must be real before user-library/native-binding work scales

Phase F remains focused on language and stdlib maturity.
Compiler-owned bootstrap features that can later move into Pulse source should be treated as temporary ownership, not permanent Rust-only design.
In particular, the post-F surface should leave room for Pulse-owned annotation processing and generated-code workflows once Phase F-A opens that contract.

The library artifact/native-binding layer should land after F so it builds on:
- a more complete language
- a larger stdlib
- a stable native build/runtime boundary

## Planned Follow-up Areas

- library project native build output (`.dll` + `.lib`)
- generated Pulse binding artifact emission for library projects
- compiler consumption of local DLL payloads from `libraries/` and binding artifacts from `bindings/`
- local multi-project dependency compilation for fat/shared builds
- external native DLL binding artifact design and compiler support
- future IDE/package-manager acquisition flow
