# E3 Fat vs Shared Parity Guide

Status: Done (Locked)  
Date locked: 2026-03-12

## Purpose

This guide summarizes the locked parity contract between PulseCode fat and shared native output modes.

## Supported Parity Surface

For supported programs, fat and shared modes must remain equivalent for:
- executable behavior
- runtime-heavy application behavior
- deterministic failure behavior
- debug/release publication intent
- staging/package expectations
- MSI install/repair/upgrade/uninstall flows

Locked parity fixture corpus:
- `runtime_mix`
- `object_interface_mix`
- `strict_stress_soak`

## Mode Selection

Mode selection is explicit:
- CLI:
  - `--output-mode fat`
  - `--output-mode shared`
- manifest:
  - `[build].output_mode = "fat"`
  - `[build].output_mode = "shared"`

Mode selection must not silently downgrade unsupported behavior.

## Intentional Non-Parity

The following differences are intentional and locked:

- fat publication is flat at `build/distro/<profile>`
- shared publication uses:
  - `build/distro/<profile>/bin`
  - `build/distro/<profile>/lib`
  - debug-only `build/distro/debug/metadata`
- shared outputs publish runtime lookup metadata through `launch.txt`
- shared staged/package/install payloads include runtime DLL payloads
- shared missing-runtime diagnostics are explicit and are not expected to match fat payload errors byte-for-byte

These are presentation/runtime-boundary differences, not behavior-parity failures.

## Debug / Release Rules

Fat mode:
- `release` publishes runnable payload only
- `debug` publishes runnable payload plus debug diagnostics at profile root

Shared mode:
- `release` publishes `bin/` + `lib/`
- `debug` publishes `bin/` + `lib/` + `metadata/`

Locked rule:
- debug-only diagnostics are allowed
- release output must remain runnable/publishable
- debug/release differences must be explicit and tested in both modes

## Packaging / Installer Rules

Both modes are supported publishable product targets.

Locked parity rules:
- both modes support staged package output
- both modes support MSI generation
- both modes remain runnable after install
- both modes have validated repair/upgrade/uninstall flows

Shared-only packaging additions:
- staged/package/install runtime DLL payloads
- import library in build/package staging outputs
- shared launch metadata describing runtime lookup resolution

## Regression Gate Strategy

Parity is locked by:
- side-by-side executable fixture runs
- runtime-heavy parity fixtures
- paired failure-path fixtures
- artifact and staging snapshot locks
- MSI/install lifecycle validation
- Windows matrix documentation + doc locks

## Related Specs

- [E3_PARITY_SUPPORT_MATRIX.md](/D:/Programming/codex/PulseCode/docs/E3_PARITY_SUPPORT_MATRIX.md)
- [E3_PARITY_EVIDENCE_STRATEGY.md](/D:/Programming/codex/PulseCode/docs/E3_PARITY_EVIDENCE_STRATEGY.md)
- [CLI_COMMAND_CONTRACT.md](/D:/Programming/codex/PulseCode/docs/CLI_COMMAND_CONTRACT.md)
- [PROJECT_LAYOUT_CONVENTIONS.md](/D:/Programming/codex/PulseCode/docs/PROJECT_LAYOUT_CONVENTIONS.md)
- [PACKAGING_PIPELINE_CONTRACT.md](/D:/Programming/codex/PulseCode/docs/PACKAGING_PIPELINE_CONTRACT.md)
- [WINDOWS_TOOLCHAIN_MATRIX.md](/D:/Programming/codex/PulseCode/docs/WINDOWS_TOOLCHAIN_MATRIX.md)
