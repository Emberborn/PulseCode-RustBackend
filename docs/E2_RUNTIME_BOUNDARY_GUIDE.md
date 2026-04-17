# E2 Runtime Boundary Guide

Status: Done (Locked)  
Date locked: 2026-03-12

## Purpose

This guide summarizes the locked runtime-ownership and ABI boundary for shared PulseCode builds.

## Rebase Note (`RB-11`)

The startup/import sequence documented below is current Windows x64 shared-mode evidence.

It is not the portable runtime intrinsic contract for all targets.

Portable-vs-adapter runtime partitioning now lives in:

- [RUNTIME_INTRINSICS_PARTITION.md](/D:/Programming/codex/PulseCode/docs/RUNTIME_INTRINSICS_PARTITION.md)
- [RUNTIME_INTRINSICS_ABI.md](/D:/Programming/codex/PulseCode/docs/RUNTIME_INTRINSICS_ABI.md)

## Ownership Boundary

Executable side owns:
- startup/bootstrap object
- user/class method objects
- published executable payload

Runtime library side owns:
- runtime-global metadata/state
- allocator, ARC, weak, container, trace, ABI, and scratch state
- runtime helper procedures

Locked rule:
- app codegen must not depend on runtime-private storage placement or import runtime-private data tables directly

## Shared ABI Surface

Executable imports are procedure-only.

Representative required runtime procedures:
- `pulsec_rt_init`
- `pulsec_rt_shutdown`
- `pulsec_rt_objectNew`
- `pulsec_rt_objectClassId`
- `pulsec_rt_arcRetain`
- `pulsec_rt_arcRelease`
- `pulsec_rt_dispatchNullReceiverPanic`
- `pulsec_rt_dispatchInvalidTypePanic`

Runtime exports are:
- procedure-only
- `minimal_versioned_abi`
- versioned by `pulsec_toolchain_semver`

Forbidden private export/import patterns:
- `rt_*`
- `pulsec_rt_obj_*`
- `pulsec_rt_class_*`

## Lowering Boundary

Shared-mode app lowering now resolves runtime-owned object metadata through ABI procedures instead of same-image table access.

Locked examples:
- virtual dispatch resolves receiver class id through `pulsec_rt_objectClassId`
- `instanceof` resolves class id through `pulsec_rt_objectClassId`
- checked reference casts resolve class id through `pulsec_rt_objectClassId`

## Init / Shutdown

Locked shared startup sequence:
- `mainCRTStartup`
- `pulsec_rt_init`
- app entry
- `pulsec_rt_shutdown`
- `ExitProcess`

Runtime init is:
- runtime-owned
- idempotent
- ABI compatibility checked before user code executes

## Mismatch / Failure Policy

Shared boundary mismatch behavior is deterministic fail-fast.

Locked diagnostics:
- `Runtime ABI mismatch`
- `Object model ABI mismatch`

Shared `launch.txt` publishes:
- runtime ABI schema/version
- object-model ABI schema/version
- `mismatch_policy=deterministic-fail-fast`
- `missing_runtime_policy=deterministic-fail-fast`
- `missing_import_policy=deterministic-fail-fast`
- `required_runtime_imports=...`

## Representative Evidence

Executable/shared evidence includes:
- `runtime_mix` in shared mode
- `object_interface_mix` in shared mode
- shared collections/runtime-state fixture
- shared null-dispatch failure fixture
- shared invalid-cast failure fixture
- shared ABI mismatch fixtures
- repeated shared `strict_stress_soak`

## Related Specs

- [SHARED_RUNTIME_ABI.md](/D:/Programming/codex/PulseCode/docs/SHARED_RUNTIME_ABI.md)
- [RUNTIME_OWNERSHIP_INVENTORY.md](/D:/Programming/codex/PulseCode/docs/RUNTIME_OWNERSHIP_INVENTORY.md)
- [RUNTIME_OWNERSHIP_POLICY.md](/D:/Programming/codex/PulseCode/docs/RUNTIME_OWNERSHIP_POLICY.md)
- [SHARED_RUNTIME_STATE_LAYOUT.md](/D:/Programming/codex/PulseCode/docs/SHARED_RUNTIME_STATE_LAYOUT.md)
- [CLI_COMMAND_CONTRACT.md](/D:/Programming/codex/PulseCode/docs/CLI_COMMAND_CONTRACT.md)
- [PACKAGING_PIPELINE_CONTRACT.md](/D:/Programming/codex/PulseCode/docs/PACKAGING_PIPELINE_CONTRACT.md)
