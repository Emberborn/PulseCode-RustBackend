# Windows x64 Scope / Freeze Policy

Status: Done (Locked)  
Date locked: 2026-03-22

This document is the source of truth for `RB-19` on [REBASE_TAKS_BOARD.md](/D:/Programming/codex/PulseCode/docs/REBASE_TAKS_BOARD.md).

It answers a narrower question than [WINDOWS_X64_ADAPTER_SCOPE.md](/D:/Programming/codex/PulseCode/docs/WINDOWS_X64_ADAPTER_SCOPE.md):

- what Windows x64 support is still real and allowed to evolve
- what Windows-only scope is frozen in place
- what removed Windows productization surface must not re-enter the compiler

## Inputs

`RB-19` consumes the published audit and classification instead of starting a fresh Windows review.

Primary audited rows:

- retained Windows adapter/support rows:
  - `WIN-CLI-02`
  - `WIN-TC-01`
  - `WIN-TC-02`
  - `WIN-TC-03`
  - `WIN-TC-04`
  - `WIN-DOC-01`
- frozen/deferred Windows-productization rows:
  - `WIN-CLI-03`
  - `WIN-SCF-02`
  - `WIN-PKG-01`
  - `WIN-PKG-02`
  - `WIN-PKG-03`
  - `WIN-PKG-04`
  - `WIN-PKG-05`
  - `WIN-DOC-02`
- validation split dependency:
  - `WIN-TEST-01`

Primary companion docs:

- [WINDOWS_X64_ADAPTER_SCOPE.md](/D:/Programming/codex/PulseCode/docs/WINDOWS_X64_ADAPTER_SCOPE.md)
- [WINDOWS_TOOLCHAIN_MATRIX.md](/D:/Programming/codex/PulseCode/docs/WINDOWS_TOOLCHAIN_MATRIX.md)
- [COMPILER_PACKAGING_REMOVAL.md](/D:/Programming/codex/PulseCode/docs/COMPILER_PACKAGING_REMOVAL.md)
- [REBASE_VALIDATION_LAYERING.md](/D:/Programming/codex/PulseCode/docs/REBASE_VALIDATION_LAYERING.md)

## Retained Live Windows x64 Scope

The following Windows x64 support remains live and may still receive normal implementation work:

- `windows-x64` as an immediate supported target lane
- the current Windows-host/bootstrap executable lane
- `--linker` and `--assembler` as Windows x64 adapter-specific overrides
- `ml64.exe` discovery
- `link.exe` / `lld-link.exe` discovery and invocation
- `kernel32.lib` discovery and other current Windows system-link inputs that are already fenced behind the adapter
- PE/COFF artifact production for the retained Windows x64 lane
- real Windows fat/shared publication and parity validation
- deterministic Windows linker/assembler/runtime failure reporting
- Windows x64 adapter docs and support evidence that describe what is actually supported today

Allowed work in this retained scope includes:

- correctness fixes
- validation coverage for real supported Windows behavior
- toolchain discovery hardening
- artifact/publication correctness work for the retained Windows x64 lane
- adapter-scoped documentation updates

## Frozen / Deferred Windows-Specific Scope

The following Windows-specific scope is explicitly frozen or removed from compiler ownership:

- MSI generation
- WiX integration
- SignTool integration
- installer/uninstall/repair/upgrade lifecycle orchestration
- staged packaging trees owned by `pulsec`
- Windows packaging metadata in scaffold defaults
- Windows-first D/E productization docs as live strategic planning truth

These items are not “compatibility surfaces to preserve later.” They are explicitly outside compiler scope now.

## No-Reentry Rules

The following re-entry paths are prohibited unless the rebase policy itself is deliberately reopened:

- restoring `pulsec package`
- restoring `--msi`, `--wix`, `--signtool`, `--packaging-mode`, or staging flags
- restoring `[build].packaging_mode`, `[toolchain].wix`, `[toolchain].signtool`, or `[package.metadata]`
- reseeding scaffolded Windows packaging defaults such as install scope or signing mode
- adding new Windows-only installer/signing/productization flags to top-level CLI or manifest surface
- treating Windows packaging/productization docs as live backend-strategy truth
- adding Windows-only validation back into target-neutral validation homes

If downstream users want installers or packaging, they must build them from compiler outputs with external tooling.

## Growth Rules For The Retained Windows Lane

Windows x64 support may still grow, but only under these rules:

- the change must belong to the Windows x64 adapter or its support evidence
- the change must not widen the public target-neutral CLI/manifest contract with new Windows-only productization semantics
- the change must not reintroduce compiler-owned packaging/install generation
- the change must not blur the `RB-18` validation split back into one native lane
- the change must not claim cross-target significance unless another adapter contract actually shares it

Examples of acceptable growth:

- a linker discovery bug fix
- better MASM failure diagnostics
- improved shared-mode Windows artifact validation
- clearer Windows x64 adapter support docs

Examples of unacceptable growth:

- new MSI-specific manifest keys
- new signing hooks in `pulsec build`
- new Windows installer milestones on the active rebase/F1 planning spine
- using Windows parity evidence as proof that PulseOS or Linux execution is done

## Relationship To Existing Windows Docs

- [WINDOWS_X64_ADAPTER_SCOPE.md](/D:/Programming/codex/PulseCode/docs/WINDOWS_X64_ADAPTER_SCOPE.md) defines what the adapter owns
- this document defines what that owned scope is still allowed to evolve into and what remains frozen
- [WINDOWS_TOOLCHAIN_MATRIX.md](/D:/Programming/codex/PulseCode/docs/WINDOWS_TOOLCHAIN_MATRIX.md) remains support evidence for the retained Windows lane, not permission to add more Windows-only compiler scope
- [COMPILER_PACKAGING_REMOVAL.md](/D:/Programming/codex/PulseCode/docs/COMPILER_PACKAGING_REMOVAL.md) remains the authoritative record that packaging was removed rather than merely hidden

## Validation Consequence

`RB-18` remains a fixed input here:

- Windows x64 executable/codegen/parity proof stays in Windows adapter validation homes
- requested-target PulseOS contract proof stays separate
- target-neutral suites do not absorb new Windows-only productization or adapter-specific scope by accident

## Locked Result For `RB-19`

`RB-19` is satisfied when all of the following are true:

- this document exists and names the retained live Windows x64 scope explicitly
- frozen/removed Windows-productization scope is named explicitly
- no-reentry rules are published for removed packaging and Windows-only productization surfaces
- Windows scope docs, toolchain docs, CLI docs, and handoff docs point to this policy instead of leaving the freeze implicit
- the next agent can continue the rebase without confusing “real Windows target support” with “Windows-first compiler scope”
