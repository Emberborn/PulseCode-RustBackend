# F1-97 Pre-Port Floor Freeze

This document locks the minimum floor that should exist before large compiler
and runtime subsystem porting begins under `F1-97`.

It exists to prevent two failure modes:

- porting the compiler/runtime too early onto a floor that is still too thin
- postponing the self-sustained lift indefinitely behind open-ended substrate work

The selected rule is:

- do not wait for "everything"
- do not begin large compiler/runtime subsystem porting on the current thin floor
- first build the minimum self-sustained floor required for clean staging,
  systems work, server/runtime work, game/runtime work, and immediate
  post-self-host tooling usability
- after that floor is in place, port aggressively

## Why This Freeze Exists

The project target is broader than a narrow self-host demo.

Pulse is intended to be able to support:

- generic application development
- server-grade runtimes such as daemons and web servers
- operating-system and kernel-oriented work
- high-end game development, including graphics/audio-heavy programs and large
  3D runtime workloads

That means `F1-97` cannot judge readiness only by "can the current compiler be
ported somehow". The minimum floor also has to avoid locking the future Pulse
compiler/runtime into a bad shape before self-sustained ownership is real.

## Decision

The selected `F1-97` sequencing rule is:

1. finish the minimum pre-port floor below
2. define the compiler stage/promotion model below
3. then begin major compiler/runtime subsystem porting

This is the chosen middle path between:

- "port the compiler now and repair the floor later"
- "delay self-hosting behind unlimited pre-self-host foundation work"

## Required Before Major Compiler/Runtime Porting

### 1. Compiler Stage Model

`compiler0` must be treated as one role, not "the Rust compiler forever".

Source of truth:

- [F1_97_COMPILER_STAGE_MODEL.md](/G:/Programming/Rust/PulseCode/docs/F1_97_COMPILER_STAGE_MODEL.md)

Minimum required decisions:

- the currently trusted compiler builds the next compiler
- the Rust-built `pulsec` is the initial trusted stage
- a Pulse-built `pulsec` must be promotable into that role later
- Rust must remain detachable fallback/bootstrap only after promotion, not
  permanent hidden authority

Minimum required artifacts:

- stage naming/promotion policy
- rebuild flow for `pulsec -> pulsec-next`
- explicit fallback/bootstrap-provider rule

### 2. Concurrency Floor

Minimum required owned floor:

- `Thread`
- join/sleep/yield/interruption policy
- monitor or mutex/condition-variable semantics
- atomics
- minimal executor/job-queue baseline

Current related board items:

- `F1-86`
- `F1-89`
- `F1-90`
- `F1-91`
- `F1-92`
- `F1-93`
- `F1-103`

### 3. System / Native ABI Floor

Minimum required owned floor:

- richer interop/native call shapes where current raw interop is too narrow
- structured native/system error capture
- opaque OS handle wrappers
- wait/event primitives
- process/thread/system-query surfaces needed by compiler/runtime/tooling and
  later systems work

Current owned interop is already strong, but this floor must make it usable as
  a durable substrate rather than only raw reach.

### 4. Memory / System Floor

Minimum required owned floor:

- virtual memory reserve/commit/protect/free
- memory-mapped files
- shared memory

This is required for serious systems work and should not be left entirely as
raw foreign calls after the self-sustained lift.

### 5. Binary / Data Floor

Minimum required owned floor:

- byte-buffer style storage
- endian-aware binary read/write helpers
- serialization primitives needed by networking/runtime/tooling

This floor matters for:

- compiler/runtime service boundaries
- server/runtime protocols
- future engine/runtime data paths

### 6. Networking Floor

Minimum required owned floor:

- socket-first baseline
- TCP/UDP support
- listen/connect/send/recv
- poll/wait model

Current related board item:

- `F1-87`

### 7. IDE / Language-Service Floor

The project should be able to move into a usable Pulse-authored editor/IDE
story immediately after self-host without making Pulse development miserable.

Minimum required floor:

- stable source span/range tracking
- stable diagnostics schema
- reusable analysis entrypoints, not only CLI text flows
- workspace/project-model APIs
- symbol/query hooks needed for go-to-definition, references, and completion
- in-memory document-analysis boundary

This is not a requirement for a polished IDE before self-host. It is a
requirement for a language-service substrate that can support one immediately
after self-host.

## Already Good Enough To Build On

These do not need to block the floor freeze:

- raw interop reach under `pulse.interop.*`
- host filesystem access under `pulse.io.HostFiles`
- basic host process execution under `pulse.process.*`
- authored project/build/toolchain bridge structure under `author.*`
- current PulseOS contract docs as requested-target direction

## Can Be Pulled Forward If Directly Needed

Later board work may be pulled forward into `F1-97` when it is a direct blocker
for clean self-sustained ownership.

Examples:

- reflection-lite widening
- annotation metadata baseline
- later toolchain/provider contract slices
- additional runtime helper surfaces

Rule:

- pull forward only what is a direct blocker
- do not pull forward convenience features just because they would be nice to
  have during the port
- if a later F-board item is implemented early because it was pulled forward,
  update that original board item immediately instead of leaving the board stale

## Not Part Of The Pre-Port Floor

These should not block compiler/runtime porting:

- Lombok-style annotation processing
- full reflection/invocation
- full IDE productization
- widget/UI toolkit
- full graphics engine
- full audio engine
- MMO/framework systems

Graphics/audio/window/input raw-access floors may still be brought up later as
owned substrate, but they are not part of the first minimum freeze unless they
become direct blockers for the self-sustained transition itself.

## Practical Working Rule

When deciding whether to port a compiler/runtime slice or stop for more floor
work, use this test:

- if the slice is blocked because the required ownership floor above is missing,
  build the floor first
- if the slice only wants convenience or speculative future product features,
  keep porting

The intent is to keep `F1-97` honest about the actual self-sustained floor
without reopening the phase into unlimited future-platform work.
