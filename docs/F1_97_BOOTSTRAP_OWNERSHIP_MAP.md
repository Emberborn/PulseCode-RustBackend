# F1-97 Bootstrap Ownership Map

## Purpose

This document defines the first concrete ownership map for `F1-97`.

Package-root rule for this stage:

- public stdlib root is `pulse.*`
- privileged authoring root is `author.*`
- the enablement contract for `author.*` is documented in
  [AUTHORLIB_ENABLEMENT_CONTRACT.md](/G:/Programming/Rust/PulseCode/docs/AUTHORLIB_ENABLEMENT_CONTRACT.md)

`F1-97` is the first real self-host/self-sustained transition push:

- the Pulse compiler/runtime codebase must move into Pulse
- the Rust-built Pulse compiler must be able to compile that Pulse codebase
- both the Rust and Pulse implementations then stay in lockstep until the later
  Phase G cutover

The working rule is strict:

- if something can be expressed in Pulse, it moves into Pulse now
- if it cannot yet be expressed in Pulse, add what is missing so it can be,
  then move it
- Rust is not the default home just because something looks bootstrap-shaped

## Ownership Buckets

`F1-97` uses three ownership buckets:

1. public `stdlib` under `pulse.*`
2. privileged `authorlib` under `author.*`
3. temporary retained Rust execution backing

Important:

- retained Rust execution backing is not long-term ownership
- the Pulse implementation is still required to exist under `F1-97`

## Public `stdlib`

These are general-purpose user-facing surfaces and stay public:

- path/file primitives
- text/stream helpers
- token/cursor helpers
- config/value containers

Current examples already aligned with this direction:

- `pulse.io.Path`
- `pulse.io.File`
- `pulse.io.Files`
- `pulse.io.InputStream`
- `pulse.io.OutputStream`
- `pulse.util.TextCursor`
- `pulse.util.Properties`
- `pulse.util.Scanner`
- `pulse.util.StringTokenizer`
- `pulse.util.Objects`
- `pulse.util.Arrays`

Compiler/runtime use does not automatically move these into `authorlib`.

## `authorlib`

These are Pulse-owned but intentionally not ordinary public stdlib surface.

They are the first-wave home for compiler, runtime, toolchain, and systems work.

### Package taxonomy rule

`authorlib` should be organized by durable domain ownership, not by vague
"internal" naming and not by whatever Rust module currently donates the code.

The selected package direction is:

- `author.project.*`
  - manifest/workspace/project/layout/resolution helpers
- `author.build.*`
  - artifact/publication/build-layout helpers
- `author.toolchain.*`
  - process/env/tool invocation facades
- `author.compiler.*`
  - compiler-only analysis/lowering/diagnostic/codegen support
- `author.runtime.*`
  - runtime-building/runtime-service/runtime-object-model support
- `author.memory.*`
  - explicit ownership/lifetime/allocation/control surfaces
- `author.system.*`
  - lower-level systems/OS-facing surfaces beyond public stdlib

Avoid package shapes such as:

- `author.internal.*`
- `author.misc.*`
- `author.program.*`

Those names are too vague to hold as long-term self-sustained ownership
boundaries.

### First-wave `authorlib` surface

- manifest model/types
- manifest parser/validator
- workspace model/types
- workspace-member resolution helpers
- project-root/source-root/resource-root/build-root resolution helpers
- compiler-facing resource lookup policy
- compiler/runtime path-layout helpers
- environment/process/toolchain invocation facades
- artifact/publication/layout helper APIs

### Later `authorlib` surface

- lower-level memory/lifetime control
- ARC/weak/cycle authoring helpers
- runtime/handle/build helper surfaces
- sharper OS/system integration surfaces
- more specific compiler/runtime/system domain packages when the inventory grows

## Current Rust Modules To Replace Or Mirror In Pulse

These are the first concrete donor areas for `F1-97`.

### CLI config and invocation modeling

Current Rust owner:

- `crates/pulsec-cli/src/cli/config/mod.rs`

Current responsibilities:

- `check` / `build` / `test` invocation modeling
- source-root/project-root/build-root resolution
- manifest-driven layout resolution
- target/profile/output/toolchain resolution

Expected `F1-97` direction:

- move the modeling and resolution logic into Pulse
- split between public path/config primitives in `stdlib` and compiler-facing
  resolution helpers in `author.project.*`, `author.build.*`, and
  `author.toolchain.*` as appropriate

### Manifest parsing and workspace modeling

Current Rust owner:

- `crates/pulsec-cli/src/cli/manifest/mod.rs`

Current responsibilities:

- manifest discovery
- manifest parsing
- manifest validation
- workspace-member parsing and resolution

Expected `F1-97` direction:

- move manifest/workspace model + parser + validation into Pulse under
  `author.project.*`
- keep file-read execution backed by the current runtime while the Pulse
  implementation comes online

### Test/project discovery

Current Rust owner:

- `crates/pulsec-cli/src/cli/testing/mod.rs`

Current responsibilities:

- project-root discovery
- source-root discovery
- tests-root discovery
- test file enumeration

Expected `F1-97` direction:

- move discovery policy into Pulse under `author.project.*`
- make it reusable by the future Pulse compiler/runtime tooling stack

### Build layout and resource copying

Current Rust owner:

- `crates/pulsec-cli/src/cli/build/mod.rs`

Current responsibilities:

- build layout creation
- resource copying
- generated/artifact path decisions
- plan/stamp file emission

Expected `F1-97` direction:

- move layout/publication logic into Pulse-owned code
- keep build-layout/publication surfaces in `author.build.*`
- keep toolchain-facing surfaces in `author.toolchain.*`, not public `stdlib`

### Project scaffolding

Current Rust owner:

- `crates/pulsec-cli/src/cli/project/mod.rs`

Current responsibilities:

- scaffold layout
- manifest/README/LICENSE generation
- supported-import bootstrap metadata

Expected `F1-97` direction:

- move project/layout generation policy into Pulse-owned code under
  `author.project.*`
- keep only the minimum command-dispatch/bootstrap seam in Rust while the Pulse
  implementation is brought online

## Not A Long-Term Rust Boundary

The following should not be treated as automatic permanent Rust ownership:

- filesystem access
- directory walking
- path canonicalization
- current-directory/current-executable/environment lookup
- toolchain process invocation
- artifact copying/moving/publishing
- manifest/resource/project discovery

Under `F1-97`, these must gain Pulse-owned implementations.

## Immediate `F1-97` Stage Order

1. Define `authorlib` package roots and enablement rule in code/docs.
2. Lock the `author.*` package taxonomy so migrated code lands in clean domain packages.
3. Build Pulse-owned manifest/workspace/project/layout model types.
4. Build Pulse-owned manifest parser/validator.
5. Build Pulse-owned project/resource/source/workspace resolution helpers.
6. Build Pulse-owned environment/process/toolchain/artifact helper surfaces.
7. Stand up the first Pulse compiler/runtime tree and compile it with the
   Rust-built Pulse compiler.
8. Keep both implementations in lockstep after that point.

## Current Non-Goal

`F1-97` is not yet the Rust-removal step.

It is the step that removes "we still need to migrate that later" as an excuse.
After `F1-97`, the Pulse-owned compiler/runtime code must exist and compile,
even though the Rust implementation remains live until the later Phase G cutover.
