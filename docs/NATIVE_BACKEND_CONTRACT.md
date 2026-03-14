# Native Backend Contract (Milestone 2 Spike)

This document defines the current backend handoff contract used by `pulsec build`.

## Plan Artifact

`pulsec build` currently emits:
- `build/pulsec.ir.txt`
- `build/native.plan.json`
- `build/main.obj`
- `build/native.link.txt`
- `build/main.exe` (only when native link succeeds)

`native.plan.json` uses schema:
- `pulsec.native.plan.v1`

## Target Contract (Current Baseline)

- target triple: `x86_64-pc-windows-msvc`
- object format: `coff`
- entry symbol: `main`
- calling convention: `system`

## Runtime Symbol Baseline

Current required runtime symbol list in plan:
- `com.pulse.lang.IO.println`
- `com.pulse.lang.IO.print`
- `com.pulse.io.Console.writeLine`
- `com.pulse.io.File.readAllText`
- `com.pulse.math.Math.abs`

These are planning-level dependencies for native codegen and will be expanded as runtime and backend mature.

## Purpose

The plan artifact is deterministic backend input metadata. It allows:
- reproducible backend snapshots,
- backend prototyping independent of frontend parse/semantic phases,
- incremental replacement of no-op emitter with real object/exe emission.

## Link/Exe Baseline

- First preference: invoke `link.exe` or `lld-link.exe` to link `main.obj` into `main.exe`
- On backend or linker failure, do not emit a fake runnable executable
- Always emit `build/native.link.txt` with deterministic failure evidence:
  - `status=linked` on success
  - `status=backend-failed` when code generation cannot produce a valid native object graph
  - `status=not-linked` when linking fails after valid object emission
- `native.link.txt` includes `entry_codegen` so the active codegen path is preserved in both success and failure reports

## Runtime Bridge Spike (Current)

- Added initial console bridge for entry methods that match `IO.println(<literal>)`
- Backend emits MASM source/object (`ml64`) and links with `kernel32.lib` to call `GetStdHandle` + `WriteFile`
- This is a narrow milestone spike for visible native behavior; general call/member/runtime lowering remains in progress
- Current baseline routes user calls through a generated stdlib symbol path in native output:
  - user code calls `com.pulse.lang.IO.println`
  - backend emits `pulsec_std_com_pulse_lang_IO_println` and links user methods against it (`entry_codegen=masm-full-stdlib`)
