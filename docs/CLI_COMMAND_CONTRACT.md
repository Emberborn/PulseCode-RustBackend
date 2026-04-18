# Aden Lang CLI Command Contract

This document locks the public `adenc` command surface.

Rebase note (`RB-05`):

- canonical public target IDs now live in [TARGET_TAXONOMY_AND_NAMING.md](/D:/Programming/codex/Aden Lang/docs/TARGET_TAXONOMY_AND_NAMING.md)
- CLI target parsing/help text use `windows-x64`, `adenos-x64`, `linux-x64`, and `macos-arm64`
- manifest v1, scaffold defaults, and manifest-facing examples use the same canonical target IDs
- `native-x64` has been removed from the public CLI surface because Aden Lang is still unreleased

Windows adapter note (`RB-09`):

- `--linker` and `--assembler` are retained Windows x64 host/bootstrap adapter overrides
- they should not be read as target-neutral compiler guarantees for every future adapter

Packaging removal note (`RB-17.1`):

- compiler-owned packaging/install generation has been removed from `adenc`
- `adenc package` and all MSI/WiX/SignTool/staging flags are gone
- downstream packaging is external to the compiler

Windows freeze note (`RB-19`):

- `--linker` and `--assembler` are now the only retained Windows-only top-level CLI flags
- no Windows-only installer/signing/productization flags may re-enter `adenc` without reopening the rebase policy

## Top-level Commands

- `adenc new`
- `adenc check`
- `adenc build`
- `adenc test`
- `adenc help`
- `adenc version`

## Top-level Aliases

- `adenc --help` and `adenc -h` map to `adenc help`
- `adenc --version` and `adenc -V` map to `adenc version`

## Command Usage

- `adenc new <project-name> [--template <app|lib>] [--path <dir>]`
- `adenc check [<entry.aden>] [--project-root <dir>] [--source-root <dir>] [--strict-package|--friendly]`
- `adenc build [<entry.aden>] [--project-root <dir>] [--source-root <dir>] [--profile <debug|release>] [--target <windows-x64|adenos-x64|linux-x64|macos-arm64>] [--output-mode <fat|shared>] [--runtime-debug-allocator <on|off>] [--runtime-cycle-collector <on|off>] [--out-dir <dir>] [--linker <path>] [--assembler <path>]`
- `adenc test [--project-root <dir>] [--source-root <dir>] [--strict-package|--friendly]`

## Flag Naming Contract

- Common:
  - `--strict-package`
  - `--friendly`
  - `--source-root <dir>`
  - `--project-root <dir>`
- New-only:
  - `--template <app|lib>`
  - `--path <dir>`
- Build-only:
  - `--profile <debug|release>`
  - `--target <windows-x64|adenos-x64|linux-x64|macos-arm64>`
  - `--output-mode <fat|shared>`
  - `--runtime-debug-allocator <on|off>`
  - `--runtime-cycle-collector <on|off>`
  - `--out-dir <dir>`
  - `--linker <path>`
  - `--assembler <path>`

Removed packaging flags:

- `--packaging-mode`
- `--msi`
- `--wix`
- `--signtool`
- `--staging-dir`

Target note:

- the current public target IDs are `windows-x64`, `adenos-x64`, `linux-x64`, and `macos-arm64`
- `native-x64` is retired historical terminology only
- `macos-arm64` is currently taxonomy-visible and CLI-selectable, but still resolves through the Windows host/bootstrap adapter until a real macOS adapter exists

## Check Project-mode Behavior

- If `adenc.toml` is found, `check` resolves `[sources]` defaults when explicit CLI values are not provided.
- If root manifest declares `[workspace].members`, `check --project-root <workspace-root>` runs `check` across each member project and emits workspace summary lines.
- If no entry is passed and manifest entry is absent, `check` falls back to source-root discovery.
- `--strict-package` enforces package layout as an error.
- `--friendly` keeps package-layout mismatches as warnings while preserving deterministic success/failure summaries.

## Build Project-mode Behavior

- If `adenc.toml` is found, `build` resolves `[sources]` defaults when explicit CLI values are not provided.
- If root manifest declares `[workspace].members`, `build --project-root <workspace-root>` runs `build` across each member project and emits workspace summary lines.
- Profile selection precedence is CLI `--profile`, then manifest `[build].profile`, then default `release`.
- Output directory selection precedence is CLI `--out-dir`, then manifest `[build].out_dir`, then default:
  - manifest/profile mode: `<project>/build/distro/<profile>`
  - direct mode: `<root>/build`
- Build summary output reports profile, target, output mode, project mode, source root, and output directory deterministically.

## Build Artifacts

Build emits a resolved config artifact with schema `adenc.build.config.v1`:

- direct mode baseline: `build/build.config.plan.json`
- manifest `debug` profile: `build/distro/debug/<name>-<version>-build.config.plan.json`
- manifest `release` profile: `build/tmp/<name>-<version>-build.config.plan.json`

`native.plan.json` uses schema `adenc.native.plan.v1`.

Both `build.config.plan.json` and `native.plan.json` emit a `target_adapter` block that makes the adapter story explicit:

- requested public target lane
- active adapter lane
- resolution when requested target and active adapter differ
- active artifact family
- active runtime ABI family

`native.plan.json` also emits:

- `host_bootstrap_runtime`
  - schema `adenc.host_bootstrap.runtime.v1`
- `requested_target_runtime_service_abi` for `adenos-x64`
  - schema `adenc.adenos.runtime_service.v1`
- `runtime_ownership_model`
  - schema `adenc.runtime.ownership.rebase.v1`
- `artifact_contracts`
  - schema ids `adenc.windows_x64.artifact_contract.v1` and `adenc.adenos.artifact_contract.v1`
- `startup_loader_contracts`
  - schema ids `adenc.windows_x64.startup_loader_contract.v1` and `adenc.adenos.startup_loader_contract.v1`
- `requested_target_executable_loading_proof_target` for `adenos-x64`
  - schema `adenc.adenos.loading_proof_target.v1`

Output topology remains explicit:

- `fat` mode:
  - application executable
  - embedded runtime payload
- `shared` mode:
  - application executable
  - runtime library
  - runtime import library
  - runtime lookup metadata

## Shared-mode Publication

`adenc build --output-mode shared` publishes:

- `bin/` for the stamped executable plus launch metadata
- `lib/` for `adencore-<adenc-version>.dll` and `adencore-<adenc-version>.lib`
- `metadata/` only for debug-profile shared diagnostics

Shared-mode lookup metadata remains explicit through `bin/launch.txt` with schema `adenc.shared.launch.v1`.

## E3 Parity Baseline

- `--output-mode fat` and `--output-mode shared` select different publication/runtime topologies, not different language semantics for supported programs
- parity claims are validated side-by-side through the same fixture corpus
- evidence expectations stay tied to:
  - same fixture corpus
  - same supported program behavior expectations
  - same build/publication success expectations

## Test Command Behavior

- `adenc test [--project-root <dir>] [--source-root <dir>] [--strict-package|--friendly]`
- If root manifest declares `[workspace].members`, `test --project-root <workspace-root>` runs test discovery/execution across member projects and emits workspace summary lines.
- Discovery scans `<project>/src/test/aden` recursively for `*.aden`.

## Failure UX

- diagnostics are colorless and stable:
  - `error[<code>]: <message>`
  - `diag.code=<code>`
  - `hint: <next step>`
- common codes:
  - `PULSEC:E_USAGE`
  - `PULSEC:E_CHECK_FAILED`
  - `PULSEC:E_BUILD_FAILED`
  - `PULSEC:E_TEST_FAILED`

Removed packaging failure code:

- `PULSEC:E_PACKAGE_FAILED`

## Explicit Non-goals

- `adenc package` is not part of the public CLI anymore
- build output publication is still real
- installer generation, signing hooks, and package lifecycle orchestration are external-tool responsibilities

## Locked Proof Surface

- CLI unit tests in `crates/adenc-cli/src/cli/mod.rs`
- CLI lock tests in `crates/adenc-cli/tests/stage_locks_d.rs`
- rebase/handoff doc locks in `crates/adenc-cli/tests/stage_locks.rs`
