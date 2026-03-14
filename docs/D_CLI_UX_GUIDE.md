# Phase D CLI UX Guide

This guide summarizes the locked user-facing workflow for `pulsec` after Phase D.

## Core Commands

- `pulsec new <name> [--template <app|lib>] [--path <dir>]`
- `pulsec check [<entry.pulse>] [--project-root <dir>] [--source-root <dir>] [--strict-package|--friendly]`
- `pulsec build [<entry.pulse>] [--project-root <dir>] [--source-root <dir>] [--profile <debug|release>] [--target <native-x64>] [--packaging-mode <staged|msi>] [--runtime-debug-allocator <on|off>] [--runtime-cycle-collector <on|off>] [--out-dir <dir>] [--linker <path>] [--assembler <path>] [--wix <path>] [--signtool <path>] [--msi]`
- `pulsec test [--project-root <dir>] [--source-root <dir>] [--strict-package|--friendly]`
- `pulsec package [<entry.pulse>] [--project-root <dir>] [--source-root <dir>] [--profile <debug|release>] [--target <native-x64>] [--packaging-mode <staged|msi>] [--runtime-debug-allocator <on|off>] [--runtime-cycle-collector <on|off>] [--out-dir <dir>] [--staging-dir <dir>] [--linker <path>] [--assembler <path>] [--wix <path>] [--signtool <path>] [--msi]`

## Recommended Flow

1. Create a project with `pulsec new`.
2. Set project metadata in `pulsec.toml`.
3. Run `pulsec check --project-root <project>`.
4. Run `pulsec build --project-root <project>`.
5. Run `pulsec test --project-root <project>`.
6. Run `pulsec package --project-root <project>`.

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

- native build outputs:
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
- staged packaging outputs:
  - `build/staging/...`
  - `build/distro/package/package.report.txt`
- MSI packaging outputs:
  - `build/distro/package/<artifact-stamp>.msi`
  - `build/distro/package/msi.build.log.txt`
  - `build/distro/package/msi.backend.contract.txt`
  - `build/distro/package/msi.template.stub.wxs`

## Signing UX

- default scaffold behavior is explicit unsigned packaging:
  - `[package.metadata].signing_mode = "unsigned"`
- to enable signing hooks:
  - set `[package.metadata].signing_mode = "signtool"`
  - set either `signing_certificate` or `signing_subject`
  - optionally set `signing_timestamp_url`
  - provide SignTool through `[toolchain].signtool` or `--signtool <path>`
- signing artifacts:
  - `build/distro/package/signing.plan.txt`
  - `build/distro/package/signing.log.txt` when the tool is invoked

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
  - `PULSEC:E_PACKAGE_FAILED`

## Related Specs

- [CLI_COMMAND_CONTRACT.md](/D:/Programming/codex/PulseCode/docs/CLI_COMMAND_CONTRACT.md)
- [PULSEC_MANIFEST_V1.md](/D:/Programming/codex/PulseCode/docs/PULSEC_MANIFEST_V1.md)
- [PULSEC_MANIFEST_EXAMPLES.md](/D:/Programming/codex/PulseCode/docs/PULSEC_MANIFEST_EXAMPLES.md)
- [PACKAGING_PIPELINE_CONTRACT.md](/D:/Programming/codex/PulseCode/docs/PACKAGING_PIPELINE_CONTRACT.md)
- [WINDOWS_TOOLCHAIN_MATRIX.md](/D:/Programming/codex/PulseCode/docs/WINDOWS_TOOLCHAIN_MATRIX.md)
