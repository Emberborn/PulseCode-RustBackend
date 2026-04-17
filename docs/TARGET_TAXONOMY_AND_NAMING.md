# PulseCode Target Taxonomy and Naming Policy

This document is the source of truth for `RB-03` on [REBASE_TAKS_BOARD.md](/D:/Programming/codex/PulseCode/docs/REBASE_TAKS_BOARD.md).

It defines the canonical target IDs that `RB-04`, `RB-05`, and `RB-06` wire through CLI, manifest, and build-plan surfaces.

## Purpose

`RB-03` exists to replace the old single-target story around `native-x64` with one target vocabulary that can honestly name:

- the immediate Windows x64 lane
- the PulseOS lane as its own future target contract
- the generic Linux lane that also serves as the substrate family PulseOS will build on
- a later macOS Apple Silicon lane that preserves future portability without changing the public naming model

The target taxonomy must stay stable even when adapter internals change.

## Naming Policy

Canonical public target IDs use:

- `<os>-<arch>`

Examples:

- `windows-x64`
- `pulseos-x64`
- `linux-x64`
- future-compatible examples such as `macos-arm64`

The public target ID intentionally does not encode:

- toolchain choice such as `msvc`
- assembler choice such as `masm`
- packaging mode
- output mode
- runtime ABI revision
- temporary bootstrap status

Those belong in adapter metadata, runtime ABI metadata, or build-plan metadata, not in the public target ID.

## Canonical Target IDs

| Target ID | Status | Current lane meaning |
|---|---|---|
| `windows-x64` | Immediate | Current Windows x64 target plus the current host/bootstrap execution lane |
| `pulseos-x64` | Immediate | PulseOS platform target contract lane; first-slice runtime/startup/artifact contract work continues under the rebase board |
| `linux-x64` | Later | Generic Linux target lane preserved as its own future adapter path |
| `macos-arm64` | Later | Planned macOS Apple Silicon target lane; preserved at the public taxonomy level so later Darwin adapter work fits the same target-neutral contract |

## Current Adapter Lane Names

Target IDs are public selectors. Adapter lane names describe the current implementation lane behind each selector.

Current lane names:

- `windows-x64-host-bootstrap`
- `pulseos-x64-first-slice`
- `linux-x64-planned`
- `macos-arm64-planned`

These adapter lane names are allowed to carry implementation status. Public target IDs are not.

## Separation Of Concerns

The rebase now treats these as separate axes:

- target ID:
  - `windows-x64`
  - `pulseos-x64`
  - `linux-x64`
  - `macos-arm64`
- adapter lane:
  - `windows-x64-host-bootstrap`
  - `pulseos-x64-first-slice`
  - `linux-x64-planned`
  - `macos-arm64-planned`
- runtime ABI family:
  - target-specific data that `RB-06`, `RB-13`, `RB-15`, and `RB-16` make explicit across requested-target metadata versus active adapter metadata
- artifact family:
  - target-specific data such as PE/COFF, ELF, or Darwin publication families

This separation is what keeps later targets like generic Linux or macOS from requiring another top-down naming rewrite.

## Retired Alias Note

`native-x64` was the old single-target public name.

It is now explicitly retired:

- `windows-x64` is the canonical public replacement for the old Windows-native lane
- `native-x64` is not a canonical public target ID
- `native-x64` is not accepted on current CLI, manifest, or scaffold public surfaces
- the name remains only as historical context for the rebase docs and tests

- `RB-04` has rebased CLI parsing/help text onto the canonical target IDs and rejects the retired alias
- `RB-05` has rebased manifest validation, scaffold defaults, and manifest-facing examples onto the same canonical target IDs

## Consequences For The Next Rebase Tasks

- `RB-04` has rebased CLI target parsing and help text around the canonical target IDs.
- `RB-05` has rebased `[build].target` validation, scaffold defaults, and manifest examples around the same canonical IDs and retired the old `native-x64` public name.
- `RB-06` now emits adapter, artifact-family, and runtime-ABI metadata separately instead of overloading one target string with all of that meaning.
- `RB-06` also makes the current transition truth explicit: requested target lane and active emission adapter can differ while the backend is still Windows-bootstrap-backed.
- `RB-09` should scope the Windows x64 adapter as a real immediate target and current host/bootstrap lane without letting that lane define the whole architecture.

## Locked Result For `RB-03`

`RB-03` is satisfied when all of the following are true:

- this document exists and names the canonical public target IDs
- the naming policy clearly separates target IDs from adapter/toolchain/ABI metadata
- the historical `native-x64` story is explicitly documented as retired rather than kept as a public compatibility lane
- the handoff, rebase board, and backend contract all point at the same target taxonomy
