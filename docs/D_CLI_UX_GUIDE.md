# Phase D CLI UX Guide

This guide summarizes the current user-facing workflow for `pulsec`.

Rebase note (`RB-05`):

- canonical public target IDs are `windows-x64`, `pulseos-x64`, `linux-x64`, and `macos-arm64`
- `pulsec new` and manifest examples use the same canonical target IDs
- `native-x64` is removed from the public CLI/manifest surface

Windows adapter note (`RB-09`):

- `--linker` and `--assembler` remain available because the current Windows x64 host/bootstrap adapter needs explicit tool overrides
- those flags describe retained Windows adapter support, not universal target-neutral workflow

Packaging removal note (`RB-17.1`):

- compiler-owned packaging/install generation has been removed
- `pulsec package` is gone
- MSI/WiX/SignTool workflows are external-tool responsibilities

Windows freeze note (`RB-19`):

- `--linker` and `--assembler` are the only retained Windows-only top-level CLI controls
- do not treat the current Windows lane as license to add installer/signing/productization flags back into `pulsec`

## Core Commands

- `pulsec new <name> [--template <app|lib>] [--path <dir>]`
- `pulsec check [<entry.pulse>] [--project-root <dir>] [--source-root <dir>] [--strict-package|--friendly]`
- `pulsec build [<entry.pulse>] [--project-root <dir>] [--source-root <dir>] [--profile <debug|release>] [--target <windows-x64|pulseos-x64|linux-x64|macos-arm64>] [--output-mode <fat|shared>] [--runtime-debug-allocator <on|off>] [--runtime-cycle-collector <on|off>] [--out-dir <dir>] [--linker <path>] [--assembler <path>]`
- `pulsec test [--project-root <dir>] [--source-root <dir>] [--strict-package|--friendly]`

## Recommended Flow

1. Create a project with `pulsec new`.
2. Set project metadata in `pulsec.toml`.
3. Run `pulsec check --project-root <project>`.
4. Run `pulsec build --project-root <project>`.
5. Run `pulsec test --project-root <project>`.
6. Use external packaging tools only if you actually need installer artifacts.

## Project-mode Defaults

- `pulsec.toml` is the primary project-mode entrypoint.
- Default source layout is Gradle-style:
  - `src/main/pulse`
  - `src/main/resources`
  - `src/test/pulse`
  - `src/test/resources`
  - `src/api/pulse`
  - `src/api/resources`
- Default build outputs are rooted under `build/`.

## Build Outputs

- release profile:
  - `build/distro/release/<name>-<version>.exe`
  - published runtime resources at `build/distro/release/...`
- debug profile:
  - `build/distro/debug/<name>-<version>.exe`
  - `build/distro/debug/<name>-<version>-build.config.plan.json`
  - `build/distro/debug/<name>-<version>-native.link.txt`
  - `build/distro/debug/<name>-<version>-native.plan.json`
  - `build/distro/debug/<name>-<version>-pulsec.ir.txt`
  - `build/distro/debug/stamp.txt`
- shared output mode:
  - `build/distro/<profile>/bin/...`
  - `build/distro/<profile>/lib/...`
  - `build/distro/debug/metadata/...` for debug-only shared diagnostics

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

## Related Specs

- [CLI_COMMAND_CONTRACT.md](/D:/Programming/codex/PulseCode/docs/CLI_COMMAND_CONTRACT.md)
- [PULSEC_MANIFEST_V1.md](/D:/Programming/codex/PulseCode/docs/PULSEC_MANIFEST_V1.md)
- [PULSEC_MANIFEST_EXAMPLES.md](/D:/Programming/codex/PulseCode/docs/PULSEC_MANIFEST_EXAMPLES.md)
- [WINDOWS_TOOLCHAIN_MATRIX.md](/D:/Programming/codex/PulseCode/docs/WINDOWS_TOOLCHAIN_MATRIX.md)
- [COMPILER_PACKAGING_REMOVAL.md](/D:/Programming/codex/PulseCode/docs/COMPILER_PACKAGING_REMOVAL.md)
