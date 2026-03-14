# E3 Fat vs Shared Parity Evidence Strategy

Status: Done (Locked)  
Date locked: 2026-03-12

## Purpose

This document defines how E3 parity claims are proved.

No E3 parity claim is accepted from one mode alone.

## Required Evidence Model

Every parity claim must be backed by side-by-side evidence from both `fat` and `shared` modes.

Required evidence categories:
- executable behavior comparison
- failure-path comparison
- artifact/publication comparison
- staging/package comparison
- install/lifecycle comparison

## Fixture Corpus Policy

Parity validation uses the same representative fixture corpus in both modes.

Baseline corpus:
- `runtime_mix`
- `object_interface_mix`
- `strict_stress_soak`

Additional parity fixtures may be added later, but no parity suite is allowed to silently substitute a different corpus for one mode.

## Behavior Comparison Rules

Behavior parity checks must:
- build the same fixture in both modes
- execute both outputs
- compare deterministic stdout/stderr and exit status for supported behavior

Allowed differences:
- artifact locations
- presence of shared-only runtime payloads
- shared-only launch metadata artifacts

Disallowed differences:
- behavior drift in supported runtime/language paths
- nondeterministic output differences across modes
- a passing result in one mode being used as a proxy for the other

## Failure Comparison Rules

Failure parity checks must compare:
- deterministic exit behavior
- deterministic diagnostics
- explicit mode-specific causes where required

Examples:
- shared missing-runtime failure may exist where fat has no equivalent payload lookup
- build/link/package hard-fail policy must still be deterministic in both modes

## Artifact / Layout Comparison Rules

Artifact parity checks do not require identical directory shape.

They must instead prove:
- each mode publishes its documented runnable product
- profile-specific debug metadata rules are preserved
- intentional differences stay intentional and stable

Snapshot coverage should freeze:
- fat release/debug output shape
- shared release/debug output shape
- staged output shape for both modes

## Packaging / Install Comparison Rules

Packaging/install parity checks must prove:
- `package` staging produces a runnable product for both modes
- MSI install preserves launch success for both modes
- repair/upgrade/uninstall semantics remain within the documented mode-specific expectations

## Test Adoption Rule

E3 parity work should be adopted into:
- executable fixture suites
- stage/package regression suites
- install validation suites
- Windows matrix docs/validation

No new parity contract should live only in prose once executable coverage exists for that area.

## Related Specs

- [E3_PARITY_SUPPORT_MATRIX.md](/D:/Programming/codex/PulseCode/docs/E3_PARITY_SUPPORT_MATRIX.md)
- [E3_TASK_BOARD.md](/D:/Programming/codex/PulseCode/docs/E3_TASK_BOARD.md)
- [CLI_COMMAND_CONTRACT.md](/D:/Programming/codex/PulseCode/docs/CLI_COMMAND_CONTRACT.md)
- [PACKAGING_PIPELINE_CONTRACT.md](/D:/Programming/codex/PulseCode/docs/PACKAGING_PIPELINE_CONTRACT.md)
