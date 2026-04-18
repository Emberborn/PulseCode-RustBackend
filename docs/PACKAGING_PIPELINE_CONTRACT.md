# Aden Lang Packaging Pipeline Contract (Historical, Superseded by RB-17.1)

This document is retained as a historical archive of the old pre-rebase packaging plan.

It is not the live contract for current Aden Lang behavior.

Current truth:

- compiler-owned packaging/install/signing scope was removed in `RB-17.1`
- `adenc` now publishes build artifacts and plan metadata only
- downstream tools own MSI or other package generation if desired
- the live source of truth is [COMPILER_PACKAGING_REMOVAL.md](/D:/Programming/codex/Aden Lang/docs/COMPILER_PACKAGING_REMOVAL.md)
- any `adenc package`, `--msi`, `--wix`, `--signtool`, staging-tree, or `packaging_regressions` references below are archived historical material only

This document locks the packaging pipeline boundary between build output and future MSI generation.

## Contract Summary

1. `adenc build` emits runnable binaries under `build/distro/<profile>`.
2. `adenc package` assembles package inputs under `build/staging`.
3. Package reports/artifacts are emitted under `build/distro/package`.
4. MSI mode (`--msi` or `packaging_mode = "msi"`) validates metadata now and remains backend-stubbed until D4.

## Default Pathing

- Build output root:
  - `<project>/build/distro/<profile>` (manifest mode default)
  - or CLI/manifest override via `--out-dir` / `[build].out_dir`
- Default profile is `release` when no CLI or manifest profile is specified.
- Package staging root:
  - `<project>/build/staging`
- Package report/artifact root:
  - `<project>/build/distro/package`

`--staging-dir` remains supported and re-roots staging under the build workspace (or absolute path when provided).

## Stage Boundaries

| Stage | Input | Output | Notes |
|---|---|---|---|
| Compile/emit | source + manifest | deliverables in `build/distro/<profile>` | fat mode publishes a flat profile root; shared mode publishes `bin/` + `lib/` and debug `metadata/` |
| Package (staged mode) | build outputs + resources | staged payload in `build/staging` + report in `build/distro/package` | status `ready` |
| Package (msi mode) | staged payload + metadata | report in `build/distro/package` + deterministic not-implemented diagnostic | metadata is validated before stubbed MSI response |

## Deterministic Staging Layout (D3-02)

Package-ready contents are emitted under:
- `<project>/build/staging/`

Locked subtree:
- `staging/bin/`
  - `launch.txt`
  - `<main.exe>` when linker output exists
  - shared-mode staged runtime payload/resource contents copied from published shared `bin/`
- `staging/assets/`
  - copied runtime/package assets from build assets root
- `staging/icons/`
  - package icons (manifest metadata and/or resources)
- `staging/licenses/`
  - staged license payloads
- `staging/docs/`
  - staged readme/documentation payloads
- `staging/config/`
  - staged runtime configuration payloads
- `staging/data/`
  - staged data payloads
- `staging/metadata/`
  - `build.config.plan.json`
  - `native.plan.json`
  - `adenc.ir.txt`
- `staging/logs/`
  - `native.link.txt`
- `staging/obj/`
  - `main.obj`

## Payload Staging Rules (D3-03 / E1-12)

- Build resources are staged from `build/assets` into `build/staging/assets`.
- Shared-mode package staging also reuses the published shared executable payload from `build/distro/<profile>/bin`.
- Shared-mode staged `bin/launch.txt` uses schema `adenc.shared.launch.v1` and resolves the runtime from the same directory as the executable:
  - `runtime_library=adencore-<adenc-semver>.dll`
  - `runtime_import_library=adencore-<adenc-semver>.lib`
- Shared-mode staged `bin/launch.txt` also carries:
  - runtime ABI/object-model ABI compatibility fields
  - `mismatch_policy=deterministic-fail-fast`
  - `missing_runtime_policy=deterministic-fail-fast`
  - `missing_import_policy=deterministic-fail-fast`
  - required runtime procedure inventory via `required_runtime_imports=...`
- Packaging metadata paths are resolved from project root (or absolute when provided) and staged into deterministic buckets:
  - `icons` -> `build/staging/icons`
  - `license` -> `build/staging/licenses`
  - `readme` -> `build/staging/docs`
  - `config` -> `build/staging/config`
  - `data` -> `build/staging/data`
  - `libraries` -> `build/staging/bin`
- Conventional fallback discovery:
  - `README.md` / `README.txt` -> docs bucket (when `readme` is not set)
  - `LICENSE` / `LICENSE.txt` / `LICENSE.md` -> licenses bucket (when `license` is not set)
- Shared-mode package staging copies emitted runtime shared artifacts into `build/staging/bin` beside the staged executable so native loading works without a separate runtime folder.

## Fixture Reuse Gate (D3-04)

- Packaging reuses the same `src/test/aden` fixture corpus used by `adenc test`.
- When fixture tests exist, package flow compile-validates them before staging.
- Package fails deterministically if one or more fixture checks fail.
- Package report includes:
  - `tests_total`
  - `tests_failed`

## Reproducible Artifact Naming + Version Stamping (D3-05)

- Build and package outputs derive a deterministic stamp:
  - `<package-name>-<package-version>-<profile>`
  - defaults when package metadata is unavailable:
    - name: `unnamed`
    - version: `0.0.0`
- Build emits stamped runtime deliverables under:
  - release:
    - `build/distro/release/<name>-<version>.exe`
    - published runtime resources at `build/distro/release/...`
  - debug:
    - `build/distro/debug/<name>-<version>.exe`
    - `build/distro/debug/<name>-<version>-build.config.plan.json`
    - `build/distro/debug/<name>-<version>-native.link.txt`
    - `build/distro/debug/<name>-<version>-native.plan.json`
    - `build/distro/debug/<name>-<version>-adenc.ir.txt`
    - `build/distro/debug/stamp.txt`
- Shared-mode profile builds instead publish:
  - release:
    - `build/distro/release/bin/<name>-<version>.exe`
    - `build/distro/release/bin/...` published runtime resources
    - `build/distro/release/lib/adencore-<adenc-semver>.dll`
    - `build/distro/release/lib/adencore-<adenc-semver>.lib`
    - no debug metadata bucket and no published `.pdb` sidecars
  - debug:
    - `build/distro/debug/bin/<name>-<version>.exe`
    - `build/distro/debug/bin/...` published runtime resources
    - `build/distro/debug/lib/adencore-<adenc-semver>.dll`
    - `build/distro/debug/lib/adencore-<adenc-semver>.lib`
    - `build/distro/debug/metadata/<name>-<version>-build.config.plan.json`
    - `build/distro/debug/metadata/<name>-<version>-native.link.txt`
    - `build/distro/debug/metadata/<name>-<version>-native.plan.json`
    - `build/distro/debug/metadata/<name>-<version>-adenc.ir.txt`
    - `build/distro/debug/metadata/stamp.txt`
    - no published `.pdb` sidecars
- Release/debug internal metadata needed for staging/package handoff remains available under `build/tmp` and backend temp roots; `.obj` files are not published into distro outputs.
- Package emits:
  - canonical report: `build/distro/package/package.report.txt`
  - stamped copy: `build/distro/package/package.<stamp>.report.txt`
  - staged stamp metadata: `build/staging/metadata/artifact.stamp.txt`
- Package summary and report payload include:
  - `package_name`
  - `package_version`
  - `artifact_stamp`

## MSI Backend Boundary Lock (D4-01)

- MSI backend selection is locked to:
  - `WiX` CLI, version contract `v6`.
- WiX path resolution precedence:
  - CLI override: `--wix <path>`
  - manifest override: `[toolchain].wix`
  - env fallback: `PULSEC_WIX_CLI`
  - host discovery fallback (standard install locations / `wix.exe`)
- In MSI mode (`--msi` or `packaging_mode = "msi"`), package flow emits deterministic backend contract artifacts under:
  - `build/distro/package/msi.backend.contract.txt`
  - `build/distro/package/msi.template.stub.wxs`
- MSI report enrichment fields:
  - `msi_backend=wix`
  - `msi_upgrade_policy=in_place`
  - `msi_tool_status=<available|unavailable>`
  - `msi_tool_path=<resolved path or <none>>`
  - `msi_tool_version=<version or <unknown>>`
  - `msi_contract=<contract path>`
  - `msi_template_stub=<template path>`

## MSI Template Translation Lock (D4-02)

- MSI stub template generation now translates manifest/package metadata into deterministic WiX v4 XML scaffolding:
  - package metadata: name, version, publisher, identifier
  - install semantics: `install_scope` -> install root directory policy
  - shortcuts: deterministic shortcut target bucket based on install scope
  - entrypoints: full entrypoint list + deterministic primary entrypoint extraction
- Output artifacts remain:
  - `build/distro/package/msi.backend.contract.txt`
  - `build/distro/package/msi.template.stub.wxs`
- Contract now includes translated MSI fields:
  - `publisher`, `identifier`, `install_scope`
  - `install_root`, `shortcut_directory`
  - `entrypoints`, `primary_entrypoint`
  - `staged_executable`, deterministic `upgrade_code`

## MSI Artifact Generation Lock (D4-03)

- MSI flow now executes WiX build and emits:
  - `<project>/build/distro/package/<artifact-stamp>.msi`
  - `<project>/build/distro/package/msi.build.log.txt`
- `adenc package --msi` and `adenc build --msi` both use the same generation path.
- Deterministic outcomes:
  - Success: package summary/report status `ready` with `msi_output` path.
  - Failure: package summary/report status `failed` with `msi_error` and stable diagnostics (`PULSEC:E_PACKAGE_FAILED`).

## MSI Lifecycle Semantics Lock (D4-04)

- Install scope policy:
  - `per-user` -> `LocalAppDataFolder` install root, `DesktopFolder` shortcut bucket
  - `per-machine` -> `ProgramFiles64Folder` install root, `ProgramMenuFolder` shortcut bucket
- Upgrade semantics:
  - `upgrade_behavior=major_upgrade_replace_existing`
  - `downgrade_policy=blocked`
  - `upgrade_code` is deterministic and stable for the same `identifier + install_scope`
  - `product_code` is deterministic and changes when `version` changes
- Side-by-side policy:
  - `side_by_side_policy=forbid_same_identifier_same_scope`
  - `cross_scope_policy=allow_per_user_and_per_machine`
- Uninstall semantics:
  - `uninstall_behavior=remove_install_folder_and_shortcuts`
  - WiX template includes `MajorUpgrade` and `RemoveFolder` for uninstall cleanup intent

## MSI Validation Suite Lock (D4-05)

- Validation suite now covers supported Windows setups with available WiX/MSI tooling:
  - `wix msi validate` against generated `.msi`
  - silent per-user install
  - file placement check (`%LOCALAPPDATA%\<app>\main.exe`)
  - shortcut placement/removal check (`%USERPROFILE%\Desktop\<app>.lnk`)
  - silent uninstall
  - repair flow (`msiexec /fa`)
  - same-identity version upgrade flow (`0.1.0 -> 0.2.0`)
- Validation tests are environment-gated to run when real WiX tooling is present, while fake-WiX lock tests continue protecting command/report contracts.

## Release Signing Hook Lock (D4-06)

- Release packaging now emits deterministic signing artifacts under `build/distro/package`:
  - `signing.plan.txt`
  - `signing.log.txt` (only when a signing tool is invoked)
- SignTool path resolution precedence:
  - CLI override: `--signtool <path>`
  - manifest override: `[toolchain].signtool`
  - env fallback: `PULSEC_SIGNTOOL`
  - host discovery fallback (`signtool.exe`)
- Release package report fields now include:
  - `signing_status=<signed|unsigned|skipped|failed>`
  - `signing_backend=<none|signtool>`
  - `signing_policy=release_optional_unsigned_fallback`
  - `signing_reason=<deterministic reason>`
  - `signing_target=<artifact path or <none>>`
  - `signing_plan=<plan path>`
  - `signing_log=<log path or <none>>`
  - `signing_tool_status=<available|unavailable|not_requested>`
  - `signing_tool_path=<resolved path or <none>>`
  - `signing_tool_version=<version or <unknown>>`
- Signing policy:
  - default scaffold/manifest behavior is explicit `signing_mode=unsigned`
  - `signing_mode=signtool` attempts to sign the release artifact (`.msi` in MSI mode, `.exe` in staged mode)
  - missing signer identity or unavailable tool falls back to deterministic `unsigned`
  - SignTool execution failure is a deterministic package failure

## Failure Boundaries

- Build failure: `PULSEC:E_BUILD_FAILED` / `PULSEC:E_PACKAGE_FAILED` depending command path.
- Package metadata failure (MSI mode): `PULSEC:E_PACKAGE_FAILED`.
- MSI tool/make failure: `PULSEC:E_PACKAGE_FAILED` with generated package report + MSI build log path.

## Packaging Regression Suite Lock (D5-03)

- A dedicated regression suite now freezes packaging output shape and deterministic failure diagnostics across:
  - staged package snapshot shape
  - MSI build failure reporting
  - release signing failure reporting
- Regression assertions cover:
  - canonical staged subtree presence
  - package report schema/fields for ready and failed states
  - `artifact.stamp.txt` presence in staged metadata
  - `signing.plan.txt` presence and stable status/reason fields
  - `msi.build.log.txt` schema and stderr capture on WiX failure
  - `signing.log.txt` schema and stderr capture on SignTool failure

## E3 Packaging Parity Baseline

- Fat/shared packaging parity is judged by product outcome, not identical payload count.
- Both modes must stage and install a runnable product.
- Shared mode is allowed to carry additional runtime library payloads and shared launch metadata.
- These shared-only payload differences must remain documented, deterministic, and executable after staging/install.
- Staging parity rules are:
  - both modes stage `bin/`, `assets/`, `metadata/`, `logs/`, and `obj/`
  - fat stages its runnable executable and launch descriptor without shared runtime payloads
  - shared stages its runnable executable plus shared launch descriptor under `bin/` and runtime `.dll`/`.lib` payloads under `libraries/`
  - both modes keep the same staging product expectations for resource payloads and diagnostic metadata
- MSI install parity rules are:
  - fat installers must install a runnable executable plus staged runtime payload files
  - shared installers must install a runnable executable plus required shared runtime `.dll` payloads
  - post-install launch success is required in both modes
  - MSI template emission must enumerate staged executable/runtime payload files instead of installing only the main executable
- MSI lifecycle parity rules are:
  - fat and shared installers must both support repair of the installed executable
  - shared installers must also restore required runtime `.dll` payloads during repair
  - both modes must support same-identity version upgrade to a new runnable installed executable
  - both modes must remove the current installed executable and packaged payload files on uninstall
  - shared uninstall must also remove the installed runtime `.dll` payload

## Locked Tests

- `crates/adenc-cli/tests/stage_locks_d.rs`
  - `lock_d1_06_package_staged_baseline_is_deterministic`
  - `lock_d1_06_build_msi_and_package_msi_share_entrypoint_contract`
  - `lock_d3_01_packaging_uses_build_output_as_staging_root`
  - `lock_d3_02_package_layout_is_deterministic_for_app_template`
  - `lock_d3_02_package_layout_is_deterministic_for_lib_template`
  - `lock_d3_03_manifest_payloads_are_staged_into_windows_layout`
  - `lock_d3_04_package_reuses_test_fixture_corpus_as_gate`
  - `lock_d3_04_package_fails_when_fixture_tests_fail`
  - `lock_d3_05_build_emits_stamped_artifact_bundle`
  - `lock_d3_05_package_emits_stamped_report_and_stage_metadata`
  - `lock_d4_01_msi_backend_contract_emits_wix_boundary_and_template`
  - `lock_d4_02_msi_template_translates_manifest_metadata_and_layout_policy`
  - `lock_d4_03_package_msi_generates_artifact_with_wix_override`
  - `lock_d4_04_msi_lifecycle_contract_locks_upgrade_and_side_by_side_policy`
  - `lock_d4_05_real_msi_roundtrip_validates_and_uninstalls_when_tooling_is_available`
  - `lock_d4_05_real_msi_repair_and_upgrade_behave_predictably_when_tooling_is_available`
  - `lock_d4_06_release_package_surfaces_explicit_unsigned_policy`
  - `lock_d4_06_release_package_runs_signtool_hook_when_configured`
- `crates/adenc-cli/tests/packaging_regressions.rs`
  - `d5_03_staged_package_snapshot_is_stable_for_app_project`
  - `d5_03_msi_failure_emits_stable_report_and_build_log`
  - `d5_03_release_signing_failure_is_deterministic_and_logged`
