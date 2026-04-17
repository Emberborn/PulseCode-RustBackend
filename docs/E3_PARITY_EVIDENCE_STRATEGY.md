# E3 Fat vs Shared Parity Evidence Strategy

Status: Done (Locked)  
Date locked: 2026-03-12

## Purpose

This document defines how E3 parity claims are proved.

No E3 parity claim is accepted from one mode alone.

Under `RB-18` rebase validation layering, this document is Windows x64 adapter evidence only. It does not prove PulseOS or Linux parity by proxy.

## Required Evidence Model

Every parity claim must be backed by side-by-side evidence from both `fat` and `shared` modes.

Required evidence categories:
- executable behavior comparison
- failure-path comparison
- artifact/publication comparison
- build/publication comparison

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
- build/link hard-fail policy must still be deterministic in both modes

## Artifact / Layout Comparison Rules

Artifact parity checks do not require identical directory shape.

They must instead prove:
- each mode publishes its documented runnable product
- profile-specific debug metadata rules are preserved
- intentional differences stay intentional and stable

Snapshot coverage should freeze:
- fat release/debug output shape
- shared release/debug output shape
- documented build/publication shape for both modes

## Build / Publication Comparison Rules

Build/publication parity checks must prove:

- `build` publishes a runnable product for both modes
- release/debug publication rules remain within the documented mode-specific expectations
- shared-only runtime payloads and lookup metadata remain explicit rather than implicit

## Test Adoption Rule

E3 parity work should be adopted into:
- executable fixture suites
- build/publication regression suites
- Windows matrix docs/validation

No new parity contract should live only in prose once executable coverage exists for that area.

## Related Specs

- [REBASE_VALIDATION_LAYERING.md](/D:/Programming/codex/PulseCode/docs/REBASE_VALIDATION_LAYERING.md)
- [E3_PARITY_SUPPORT_MATRIX.md](/D:/Programming/codex/PulseCode/docs/E3_PARITY_SUPPORT_MATRIX.md)
- [E3_TASK_BOARD.md](/D:/Programming/codex/PulseCode/docs/E3_TASK_BOARD.md)
- [CLI_COMMAND_CONTRACT.md](/D:/Programming/codex/PulseCode/docs/CLI_COMMAND_CONTRACT.md)
