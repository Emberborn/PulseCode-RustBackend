# Compiler Packaging Removal (`RB-17.1`)

This document is the source of truth for `RB-17.1` on [REBASE_TAKS_BOARD.md](/D:/Programming/codex/Aden Lang/docs/REBASE_TAKS_BOARD.md).

## Decision

`adenc` no longer owns package, installer, or signing workflows.

The compiler publishes build artifacts, plan metadata, and target-adapter contract metadata only. If users want MSI installers or any other packaging format, they must use external packaging tools against the build outputs.

The follow-on no-reentry policy for removed Windows-specific productization scope now lives at:

- [WINDOWS_X64_SCOPE_FREEZE_POLICY.md](/D:/Programming/codex/Aden Lang/docs/WINDOWS_X64_SCOPE_FREEZE_POLICY.md)

## Removed Public Surface

The compiler-owned packaging surface is removed entirely:

- top-level command: `adenc package`
- build flags:
  - `--packaging-mode`
  - `--msi`
  - `--wix`
  - `--signtool`
  - `--staging-dir`
- manifest keys:
  - `[build].packaging_mode`
  - `[toolchain].wix`
  - `[toolchain].signtool`
  - `[package.metadata]`

These are not frozen compatibility surfaces. Aden Lang is still unreleased, so the removed packaging surface should not be carried forward as legacy.

## Compiler Scope After Removal

`adenc build` remains responsible for:

- resolving the requested target lane
- resolving the active host/bootstrap adapter
- emitting `build.config.plan.json`
- emitting `native.plan.json`
- publishing runnable build artifacts for the active adapter lane
- publishing deterministic debug metadata for build/test/runtime validation

`adenc` is not responsible for:

- MSI generation
- WiX template generation
- SignTool hook execution
- install/uninstall/repair/upgrade lifecycle orchestration
- staging-tree packaging layouts
- package reports or signing reports

## Architectural Reason

This rebase is about making the backend truthful for Windows x64, AdenOS, and later Linux without binding the compiler to one Windows-shaped product workflow.

Keeping compiler-owned MSI/WiX/signing logic would preserve exactly the wrong pressure:

- Windows-only productization would keep shaping the public CLI/manifest contract
- non-Windows targets would inherit fake or empty packaging promises
- the backend would keep guessing at installer/publication semantics that do not belong in the compiler

Removing packaging reduces compiler scope and keeps the adapter boundary focused on:

- build artifacts
- startup/loader contracts
- runtime/service ABI contracts
- adapter-specific toolchain and publication behavior

## Replacement Policy

The replacement policy is explicit:

- `adenc build` produces the outputs
- downstream tools package those outputs if desired
- downstream tools own installers/packages
- target adapters may still describe artifact/publication layout
- target adapters do not imply that the compiler owns installer generation

## Locked Result For `RB-17.1`

`RB-17.1` is satisfied when all of the following are true:

- `adenc package` is gone
- removed packaging flags and manifest keys are rejected
- scaffolded projects no longer reseed packaging metadata
- CLI/manifest docs no longer teach compiler-owned packaging
- Windows adapter docs stop treating MSI/WiX/signing as retained compiler scope
- the handoff sends new agents into the no-packaging contract without requiring extra correction
