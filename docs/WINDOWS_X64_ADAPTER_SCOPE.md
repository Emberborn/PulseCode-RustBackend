# Windows x64 Adapter Scope

This document is the source of truth for `RB-09` on [REBASE_TAKS_BOARD.md](/D:/Programming/codex/PulseCode/docs/REBASE_TAKS_BOARD.md).

It scopes the retained Windows x64 lane honestly: Windows x64 remains an immediate target and the current host/bootstrap adapter, but it no longer defines the whole backend architecture or the strategic destination for PulseCode.

The follow-on freeze policy for what this retained lane may still grow into now lives at:

- [WINDOWS_X64_SCOPE_FREEZE_POLICY.md](/D:/Programming/codex/PulseCode/docs/WINDOWS_X64_SCOPE_FREEZE_POLICY.md)

## Inputs

`RB-09` is grounded in the published rebase inventory and classification, especially these rows:

- `WIN-CLI-02`
- `WIN-TC-01`
- `WIN-TC-02`
- `WIN-TC-03`
- `WIN-TC-04`
- `WIN-DOC-01`

## What The Windows x64 Adapter Owns

The current Windows x64 adapter owns:

- MASM emission for the current backend path
- COFF object assumptions for the current adapter lane
- `ml64.exe` discovery
- `link.exe` / `lld-link.exe` discovery and invocation
- `kernel32.lib` discovery for the current Windows host/bootstrap path
- the current Windows executable and shared-runtime artifact families
- the current Windows bootstrap runtime ABI family naming
- deterministic native link and failure-report behavior for the retained Windows lane

In code, this currently routes through:

- `crates/pulsec-cli/src/backend/adapters/windows_x64/mod.rs`
- `crates/pulsec-cli/src/backend/support/toolchain_linking.rs`
- `crates/pulsec-cli/src/backend/emission/program_emitters.rs`
- `crates/pulsec-cli/src/backend/emission/runtime_emitters.rs`

## What The Windows x64 Adapter Does Not Own

The current Windows x64 adapter does not own:

- the public target taxonomy
- manifest/scaffold target selection policy
- target-neutral backend planning structures
- the future PulseOS runtime or loader contract
- the later Linux adapter lane
- the later macOS adapter lane
- compiler-owned packaging or installer generation

That means the adapter is allowed to keep Windows-specific toolchain and artifact details alive, but it is not allowed to pull the rest of the compiler back into a Windows-first architecture.

## Retained CLI Surface

The retained Windows x64 adapter-specific CLI controls are:

- `--linker`
- `--assembler`

These remain valid because the current Windows host/bootstrap lane needs them.

They should be read as adapter overrides, not as target-neutral compiler guarantees.

## Explicit Fence

Compiler-owned packaging/install generation is removed under `RB-17.1`.

That removal includes:

- `pulsec package`
- MSI/WiX generation
- SignTool hook execution
- staging-tree packaging layouts
- package/signing reports

Those are not retained Windows adapter scope. If downstream users want installers, they must package build outputs externally.

## Support Truth At `RB-09`

The honest current support statement is:

- Windows x64 is an immediate supported target lane
- Windows x64 is also the current host/bootstrap adapter lane
- PulseOS is the next target contract that still needs explicit runtime/startup/loader definition
- generic Linux and macOS remain later adapter lanes
- Windows-focused work must preserve the adapter seams those later targets will need

The honest host statement is narrower:

- the current real native emitter/link path is Windows-host oriented
- non-Windows hosts are not yet supported for this retained Windows adapter path

## Relationship To Windows Tooling Docs

[WINDOWS_TOOLCHAIN_MATRIX.md](/D:/Programming/codex/PulseCode/docs/WINDOWS_TOOLCHAIN_MATRIX.md) should now be read as support evidence for the retained Windows x64 adapter lane, not as the top-level project support matrix.

It remains useful because it proves the current Windows lane is real, but it no longer defines the whole architecture.

## Relationship To Later Tasks

- `RB-10` strips Windows-only assumptions out of target-neutral planning
- `RB-15` publishes [TARGET_ARTIFACT_CONTRACT_SPLIT.md](/D:/Programming/codex/PulseCode/docs/TARGET_ARTIFACT_CONTRACT_SPLIT.md) so the Windows x64 artifact contract stays explicit instead of being inferred from broader backend prose
- `RB-17.1` removes compiler-owned packaging/install generation from the public compiler surface
- `RB-19` is now published in [WINDOWS_X64_SCOPE_FREEZE_POLICY.md](/D:/Programming/codex/PulseCode/docs/WINDOWS_X64_SCOPE_FREEZE_POLICY.md) and freezes the removed productization surface against re-entry

## Locked Result For `RB-09`

`RB-09` is satisfied when all of the following are true:

- this document exists and fences the retained Windows x64 adapter scope explicitly
- the Windows toolchain matrix is framed as Windows x64 adapter support evidence rather than overall project destination truth
- CLI/backend docs explain that `--linker` and `--assembler` are retained Windows x64 adapter overrides
- the current Windows x64 adapter remains test-covered as the current host/bootstrap adapter path
