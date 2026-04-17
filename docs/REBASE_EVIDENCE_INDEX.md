# Rebase Evidence Index

Status: Closed  
Date updated: 2026-03-22

This document is the evidence index for the rebase closure package under `RB-21`.

It remains the published evidence bundle for the now-closed `RB-21` rebase package.

## Primary Board

- [REBASE_TAKS_BOARD.md](/D:/Programming/codex/PulseCode/docs/REBASE_TAKS_BOARD.md)

## Scope / Audit / Classification

- [REBASE_SCOPE_AND_RETURN_POLICY.md](/D:/Programming/codex/PulseCode/docs/REBASE_SCOPE_AND_RETURN_POLICY.md)
- [REBASE_WINDOWS_ASSUMPTION_INVENTORY.md](/D:/Programming/codex/PulseCode/docs/REBASE_WINDOWS_ASSUMPTION_INVENTORY.md)
- [REBASE_WINDOWS_ASSUMPTION_CLASSIFICATION.md](/D:/Programming/codex/PulseCode/docs/REBASE_WINDOWS_ASSUMPTION_CLASSIFICATION.md)

## Target Model / Planning Surface

- [TARGET_TAXONOMY_AND_NAMING.md](/D:/Programming/codex/PulseCode/docs/TARGET_TAXONOMY_AND_NAMING.md)
- [CLI_COMMAND_CONTRACT.md](/D:/Programming/codex/PulseCode/docs/CLI_COMMAND_CONTRACT.md)
- [D_CLI_UX_GUIDE.md](/D:/Programming/codex/PulseCode/docs/D_CLI_UX_GUIDE.md)
- [PULSEC_MANIFEST_V1.md](/D:/Programming/codex/PulseCode/docs/PULSEC_MANIFEST_V1.md)
- [PULSEC_MANIFEST_EXAMPLES.md](/D:/Programming/codex/PulseCode/docs/PULSEC_MANIFEST_EXAMPLES.md)
- [REBASE_PLANNING_SPINE_ALIGNMENT.md](/D:/Programming/codex/PulseCode/docs/REBASE_PLANNING_SPINE_ALIGNMENT.md)

## Backend Boundary / Adapter Contract

- [BACKEND_LAYER_ARCHITECTURE.md](/D:/Programming/codex/PulseCode/docs/BACKEND_LAYER_ARCHITECTURE.md)
- [BACKEND_ADAPTER_REGISTRY.md](/D:/Programming/codex/PulseCode/docs/BACKEND_ADAPTER_REGISTRY.md)
- [WINDOWS_X64_ADAPTER_SCOPE.md](/D:/Programming/codex/PulseCode/docs/WINDOWS_X64_ADAPTER_SCOPE.md)
- [WINDOWS_X64_SCOPE_FREEZE_POLICY.md](/D:/Programming/codex/PulseCode/docs/WINDOWS_X64_SCOPE_FREEZE_POLICY.md)
- [TARGET_NEUTRAL_PLANNING_BOUNDARY.md](/D:/Programming/codex/PulseCode/docs/TARGET_NEUTRAL_PLANNING_BOUNDARY.md)
- [NATIVE_BACKEND_CONTRACT.md](/D:/Programming/codex/PulseCode/docs/NATIVE_BACKEND_CONTRACT.md)

## Runtime / Artifact / Startup Contracts

- [RUNTIME_INTRINSICS_PARTITION.md](/D:/Programming/codex/PulseCode/docs/RUNTIME_INTRINSICS_PARTITION.md)
- [HOST_BOOTSTRAP_RUNTIME_CONTRACT.md](/D:/Programming/codex/PulseCode/docs/HOST_BOOTSTRAP_RUNTIME_CONTRACT.md)
- [PULSEOS_RUNTIME_SERVICE_ABI_SLICE.md](/D:/Programming/codex/PulseCode/docs/PULSEOS_RUNTIME_SERVICE_ABI_SLICE.md)
- [RUNTIME_OWNERSHIP_REBASE.md](/D:/Programming/codex/PulseCode/docs/RUNTIME_OWNERSHIP_REBASE.md)
- [TARGET_ARTIFACT_CONTRACT_SPLIT.md](/D:/Programming/codex/PulseCode/docs/TARGET_ARTIFACT_CONTRACT_SPLIT.md)
- [PULSEOS_STARTUP_LOADER_PUBLICATION_CONTRACT.md](/D:/Programming/codex/PulseCode/docs/PULSEOS_STARTUP_LOADER_PUBLICATION_CONTRACT.md)
- [PULSEOS_EXECUTABLE_LOADING_PROOF_TARGET.md](/D:/Programming/codex/PulseCode/docs/PULSEOS_EXECUTABLE_LOADING_PROOF_TARGET.md)
- [PULSEOS_LINUX_BACKED_TARGET_DIRECTION.md](/D:/Programming/codex/PulseCode/docs/PULSEOS_LINUX_BACKED_TARGET_DIRECTION.md)
- [COMPILER_PACKAGING_REMOVAL.md](/D:/Programming/codex/PulseCode/docs/COMPILER_PACKAGING_REMOVAL.md)

## Validation / Freeze / Closure

- [REBASE_VALIDATION_LAYERING.md](/D:/Programming/codex/PulseCode/docs/REBASE_VALIDATION_LAYERING.md)
- [WINDOWS_TOOLCHAIN_MATRIX.md](/D:/Programming/codex/PulseCode/docs/WINDOWS_TOOLCHAIN_MATRIX.md)
- [REBASE_CLOSURE_CHECKLIST.md](/D:/Programming/codex/PulseCode/docs/REBASE_CLOSURE_CHECKLIST.md)
- [CODEX_HANDOFF_PHASE_F.md](/D:/Programming/codex/PulseCode/docs/CODEX_HANDOFF_PHASE_F.md)
- [STANDALONE_ROADMAP.md](/D:/Programming/codex/PulseCode/docs/STANDALONE_ROADMAP.md)

## Lock / Regression Suites

- `cargo test -q -p pulsec --test stage_locks`
- `cargo test -q -p pulsec --test stage_locks_d`
- `cargo test -q -p pulsec rb_06_`
- `cargo test -q -p pulsec rb_07_`
- `cargo test -q -p pulsec rb_08_`
- `cargo test -q -p pulsec rb_09_`
- `cargo test -q -p pulsec rb_10_`
- `cargo test -q -p pulsec rb_11_`
- `cargo test -q -p pulsec rb_12_`
- `cargo test -q -p pulsec rb_13_`
- `cargo test -q -p pulsec rb_14_`
- `cargo test -q -p pulsec rb_15_`
- `cargo test -q -p pulsec rb_16_`
- `cargo test -q -p pulsec rb_17_`

## Review Gate

The closure package has cleared review.

The next active board is now:

- [F1_TASK_BOARD.md](/D:/Programming/codex/PulseCode/docs/F1_TASK_BOARD.md)
- active resume point: `F1-51`
