# E1 Shared Build Guide

Status: Done (Locked)  
Date locked: 2026-03-12

## Purpose

This guide summarizes the locked user-facing contract for PulseCode shared native builds.

## Build Mode

- shared mode is selected with:
  - CLI: `--output-mode shared`
  - manifest: `[build].output_mode = "shared"`
- shared mode also requires:
  - `[build].output_entry`

Shared mode emits:
- application executable
- shared runtime library
- import library
- runtime lookup metadata

## Shared Artifact Set

Locked runtime artifact naming:
- runtime library:
  - `pulsecore-<pulsec-semver>.dll`
- import library:
  - `pulsecore-<pulsec-semver>.lib`

Locked build/runtime relationship:
- app executable links through the import library
- runtime loading policy is `peer_runtime_library`
- runtime lookup metadata is emitted through `launch.txt`

## Publication Layout

Manifest/profile shared builds publish:

- `build/distro/<profile>/bin`
  - `<name>-<version>.exe`
  - runtime payload/resources
  - `launch.txt`
- `build/distro/<profile>/lib`
  - `pulsecore-<pulsec-semver>.dll`
  - `pulsecore-<pulsec-semver>.lib`
- `build/distro/debug/metadata`
  - `*-build.config.plan.json`
  - `*-native.link.txt`
  - `*-native.plan.json`
  - `*-pulsec.ir.txt`
  - `stamp.txt`

Shared publication rules:
- `release` publishes `bin/` + `lib/` only
- `debug` publishes `bin/` + `lib/` + `metadata/`
- no `.pdb` sidecars are currently published

## Launch Lookup Contract

Published shared builds emit `bin/launch.txt` with:
- `schema=pulsec.shared.launch.v1`
- `mode=shared`
- `runtime_load=peer_runtime_library`
- `lookup_policy=relative-sibling-runtime`

Published build lookup target:
- `runtime_library=pulsecore-<pulsec-semver>.dll`
- `runtime_import_library=pulsecore-<pulsec-semver>.lib`

Staged package lookup target:
- `runtime_library=pulsecore-<pulsec-semver>.dll`
- `runtime_import_library=pulsecore-<pulsec-semver>.lib`

## Export / Import Policy

Executable side:
- imports are procedure-only
- runtime-private data tables are not imported

Runtime side:
- exports are procedure-only
- export visibility is `minimal_versioned_abi`
- runtime-private symbols such as `rt_*` and `pulsec_rt_obj_*` are not exported

## Hard-Fail Policy

Shared builds fail deterministically when:
- linker/shared artifact emission fails
- split runtime/app object emission is unavailable
- manifest shared mode is requested without `output_entry`

Locked failure rules:
- no fake runnable artifacts are published
- `native.link.txt` still records deterministic failure evidence
- shared link failure does not publish `.exe`, `.dll`, or `.lib`

## Representative Shared Fixtures

Locked shared executable evidence includes:
- `runtime_mix`
- `strict_stress_soak`
- `object_interface_mix`

## Related Specs

- [CLI_COMMAND_CONTRACT.md](/D:/Programming/codex/PulseCode/docs/CLI_COMMAND_CONTRACT.md)
- [SHARED_RUNTIME_ABI.md](/D:/Programming/codex/PulseCode/docs/SHARED_RUNTIME_ABI.md)
- [PROJECT_LAYOUT_CONVENTIONS.md](/D:/Programming/codex/PulseCode/docs/PROJECT_LAYOUT_CONVENTIONS.md)
- [PACKAGING_PIPELINE_CONTRACT.md](/D:/Programming/codex/PulseCode/docs/PACKAGING_PIPELINE_CONTRACT.md)
- [WINDOWS_TOOLCHAIN_MATRIX.md](/D:/Programming/codex/PulseCode/docs/WINDOWS_TOOLCHAIN_MATRIX.md)
