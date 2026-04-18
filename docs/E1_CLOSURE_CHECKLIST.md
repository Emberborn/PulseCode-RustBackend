# E1 Closure Checklist

Status: Done (Locked)  
Date locked: 2026-03-12

## Scope

- E1 covers real shared-library native output for Aden Lang:
  - shared build mode contract
  - real `.dll` + import `.lib` emission
  - executable bootstrap/import wiring
  - distribution/publication layout
  - launch/runtime lookup metadata
  - fixture coverage and shared failure paths
  - Windows shared-build toolchain support matrix

## Required Gates

- [x] E1-G1 Shared build-mode contract stability
- [x] E1-G2 Real shared artifact emission correctness
- [x] E1-G3 Shared executable bootstrap correctness
- [x] E1-G4 Distribution/publication layout correctness + no-stub fake-artifact leakage
- [x] E1-G5 Shared-mode toolchain/environment coverage
- [x] E1-G6 Docs + closure artifact completeness

## Closure Artifacts

- [x] [E1_TASK_BOARD.md](/D:/Programming/codex/Aden Lang/docs/E1_TASK_BOARD.md)
- [x] [E1_SHARED_BUILD_GUIDE.md](/D:/Programming/codex/Aden Lang/docs/E1_SHARED_BUILD_GUIDE.md)
- [x] [E1_EVIDENCE_INDEX.md](/D:/Programming/codex/Aden Lang/docs/E1_EVIDENCE_INDEX.md)
- [x] [CLI_COMMAND_CONTRACT.md](/D:/Programming/codex/Aden Lang/docs/CLI_COMMAND_CONTRACT.md)
- [x] [SHARED_RUNTIME_ABI.md](/D:/Programming/codex/Aden Lang/docs/SHARED_RUNTIME_ABI.md)
- [x] [PROJECT_LAYOUT_CONVENTIONS.md](/D:/Programming/codex/Aden Lang/docs/PROJECT_LAYOUT_CONVENTIONS.md)
- [x] [COMPILER_PACKAGING_REMOVAL.md](/D:/Programming/codex/Aden Lang/docs/COMPILER_PACKAGING_REMOVAL.md)
- [x] [WINDOWS_TOOLCHAIN_MATRIX.md](/D:/Programming/codex/Aden Lang/docs/WINDOWS_TOOLCHAIN_MATRIX.md)

## Validation Commands

- `cargo test -q -p adenc --test fixture_projects`
- `cargo test -q -p adenc --test stage_locks_d`
- `cargo test -q -p adenc --test phase_d_cli`
- `cargo test -q -p adenc`

## Exit Decision

- E1 is closed.
- Tasks `E1-01`..`E1-21` and gates `E1-G1`..`E1-G6` are `Done (Locked)` in [E1_TASK_BOARD.md](/D:/Programming/codex/Aden Lang/docs/E1_TASK_BOARD.md).
