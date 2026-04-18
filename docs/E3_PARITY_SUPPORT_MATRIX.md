# E3 Fat vs Shared Parity Support Matrix

Status: Done (Locked)  
Date locked: 2026-03-12

Historical scope note:

- packaging/install parity language below is retained as historical E3 closure context only
- current live compiler scope is build/output/runtime parity, not compiler-owned package/install behavior
- packaging removal policy is now defined by [COMPILER_PACKAGING_REMOVAL.md](/D:/Programming/codex/PulseCode/docs/COMPILER_PACKAGING_REMOVAL.md)

## Purpose

This document defines the supported parity surface between `fat` and `shared` native output modes.

Parity in E3 means:
- the same supported PulseCode program is expected to produce the same user-visible behavior in both modes
- output layout differences are allowed when they are required by the runtime/link model and documented here
- failure behavior may differ in immediate cause, but not in determinism or support policy

Parity in E3 does not mean:
- identical artifact directory shape
- identical launch metadata artifacts
- identical historical installer payload count

## Mode Summary

- `fat`
  - single native executable publication model
  - runtime payload is embedded into the executable output
- `shared`
  - native executable plus runtime library publication model
  - runtime payload is published as `pulsecore-<pulsec-semver>.dll`
  - app executable links through `pulsecore-<pulsec-semver>.lib`

Both modes are first-class product modes.

## Supported Parity Surface

The following behavior is in scope for parity claims:

- language/runtime execution for supported PulseCode applications
  - object construction
  - instance and static dispatch
  - interface dispatch
  - checked casts and `instanceof`
  - stdlib/runtime-backed collections
  - IO/string/runtime intrinsics already locked in C/E1/E2
- deterministic debug vs release publication rules
- deterministic historical staging/package behavior where relevant to archived E3 evidence
- deterministic failure policy for supported launch/build flows

Representative parity corpus:
- `runtime_mix`
- `object_interface_mix`
- `strict_stress_soak`

## Intentional Non-Parity

The following differences are intentional and do not count as parity failures:

- build output layout
  - `fat` profile output is flat at `build/distro/<profile>`
  - `shared` profile output is structured as `bin/` + `lib/` and debug `metadata/`
- launch metadata
  - `shared` publishes `bin/launch.txt`
  - `fat` does not need a sibling-runtime lookup descriptor
- runtime payload count
  - `fat` publishes an executable as the runnable product
  - `shared` publishes an executable plus required runtime library payload
- historical install payload count
  - shared historical installers included runtime library payloads in addition to the executable

## Debug / Release Rules

Locked debug/release expectations:

- `fat release`
  - runnable payload only
  - no debug diagnostics in distro output
- `fat debug`
  - runnable payload plus debug diagnostics at profile root
- `shared release`
  - runnable payload only under `bin/` + `lib/`
  - no `metadata/` bucket
- `shared debug`
  - runnable payload under `bin/` + `lib/`
  - debug diagnostics under `metadata/`

Debug/release publication differences are allowed only when they are profile-driven and documented.

## Historical Packaging / Install Expectations

The older E3 closure recorded packaging/install expectations that were valid before `RB-17.1`.

They are retained only as historical explanation for old closure evidence, not as current compiler commitments.

- both modes must remain runnable after `package` staging
- both modes must remain runnable after MSI install on supported hosts
- shared mode may stage/install additional runtime library payloads
- shared mode may include launch metadata that fat mode does not need

These payload-shape differences do not weaken the product guarantee:
- both packaged products must launch successfully
- both packaged products must preserve supported program behavior

## Failure Parity Baseline

Failure parity is judged by policy, not by forcing identical low-level causes.

Locked rules:
- both modes must fail deterministically when build/package/install prerequisites are missing
- product builds never silently degrade to fake runnable artifacts
- diagnostics must remain explicit about mode-specific causes
- shared-only boundary failures are allowed when they are inherent to shared publication, for example:
  - missing runtime library payload
  - runtime ABI mismatch
  - missing required runtime imports

## Out of Scope for E3

The following are not parity claims for E3:

- unsupported language/runtime features outside the already locked support surface
- byte-for-byte identical output directories
- identical artifact names between `fat` and `shared`
- third-party user-library distribution workflows planned for Phase F-A
- foreign native binding behavior planned for Phase F-A

## Related Specs

- [E1_SHARED_BUILD_GUIDE.md](/D:/Programming/codex/PulseCode/docs/E1_SHARED_BUILD_GUIDE.md)
- [E2_RUNTIME_BOUNDARY_GUIDE.md](/D:/Programming/codex/PulseCode/docs/E2_RUNTIME_BOUNDARY_GUIDE.md)
- [CLI_COMMAND_CONTRACT.md](/D:/Programming/codex/PulseCode/docs/CLI_COMMAND_CONTRACT.md)
- [PROJECT_LAYOUT_CONVENTIONS.md](/D:/Programming/codex/PulseCode/docs/PROJECT_LAYOUT_CONVENTIONS.md)
- [PACKAGING_PIPELINE_CONTRACT.md](/D:/Programming/codex/PulseCode/docs/PACKAGING_PIPELINE_CONTRACT.md)
