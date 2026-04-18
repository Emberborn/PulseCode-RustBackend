# Aden Lang Manifest Schema v1 (`adenc.toml`)

This document defines the current manifest schema.

Rebase note (`RB-05`):

- manifest v1 now accepts `windows-x64`, `adenos-x64`, `linux-x64`, and `macos-arm64`
- `native-x64` has been removed from the public manifest surface

Packaging removal note (`RB-17.1`):

- compiler-owned packaging metadata is removed
- `[build].packaging_mode`, `[toolchain].wix`, `[toolchain].signtool`, and `[package.metadata]` are not part of manifest v1

Primary example matrix:

- [PULSEC_MANIFEST_EXAMPLES.md](/D:/Programming/codex/Aden Lang/docs/PULSEC_MANIFEST_EXAMPLES.md)

## Required Fields

- package manifests: `[package].name` and `[package].version`
- workspace manifests: `[workspace].members`

## Supported Sections

- `[package]`
  - `name` (string)
  - `version` (string)
- `[sources]`
  - `root` (legacy compatibility alias; default `"src/main/aden"`)
  - `main_aden` (string, default `"src/main/aden"`)
  - `main_resources` (string, default `"src/main/resources"`)
  - `test_aden` (string, default `"src/test/aden"`)
  - `test_resources` (string, default `"src/test/resources"`)
  - `api_aden` (string, default `"src/api/aden"`)
  - `api_resources` (string, default `"src/api/resources"`)
  - `docs` (string, default `"docs"`)
  - `libraries` (string, default `"libraries"`)
  - `entry` (string, optional)
- `[build]`
  - `profile` (optional: `"debug"` or `"release"`)
  - `target` (string, optional: `"windows-x64"`, `"adenos-x64"`, `"linux-x64"`, or `"macos-arm64"`)
  - `output_mode` (optional: `"fat"` or `"shared"`; legacy aliases `"single_exe"` and `"exe_with_dlls"` are accepted)
  - `output_entry` (required when `output_mode = "shared"`)
  - `runtime_debug_allocator` (optional: `"on"` or `"off"`)
  - `runtime_cycle_collector` (optional: `"on"` or `"off"`)
  - `out_dir` (string, optional)
  - `asm_dir` (string, optional; default `"build/asm"`)
  - `generated_dir` (string, optional; default `"build/generated"`)
  - `assets_dir` (string, optional; default `"build/assets"`)
  - `sanity_dir` (string, optional; default `"build/sanity"`)
  - `tmp_dir` (string, optional; default `"build/tmp"`)
  - `distro_dir` (string, optional; default `"build/distro"`)
- `[toolchain]`
  - `linker` (string, optional)
  - `assembler` (string, optional)
- `[workspace]`
  - `members` (string, required for workspace mode; comma-separated member project paths)

## Validation Rules

- unknown sections are rejected
- unknown keys inside known sections are rejected
- duplicate keys inside a section are rejected
- non-quoted manifest values are rejected
- `[workspace].members` must resolve to at least one member path
- workspace member manifests cannot themselves declare `[workspace]`
- `[build].profile` must be `debug` or `release` when present
- `[build].target` must be one of `windows-x64`, `adenos-x64`, `linux-x64`, or `macos-arm64` when present
- `[build].output_mode` must be `fat` or `shared` when present; legacy aliases are canonicalized
- `[build].output_entry` is required when `[build].output_mode = "shared"`
- runtime toggle keys must be `on` or `off` when present
- `[package].name` must match `[A-Za-z0-9_-]+`
- `[package].version` must match semantic form `x.y.z`
- layout override keys in `[sources]` and `[build]` must be non-empty strings

## Example

```toml
[package]
name = "demo_app"
version = "1.0.0"

[sources]
main_aden = "src/main/aden"
main_resources = "src/main/resources"
test_aden = "src/test/aden"
test_resources = "src/test/resources"
api_aden = "src/api/aden"
api_resources = "src/api/resources"
docs = "docs"
libraries = "libraries"
entry = "app/main/Main.aden"

[build]
profile = "release"
target = "windows-x64"
output_mode = "fat"
output_entry = "main"
runtime_debug_allocator = "off"
runtime_cycle_collector = "on"
out_dir = "build/distro/release"
asm_dir = "build/asm"
generated_dir = "build/generated"
assets_dir = "build/assets"
sanity_dir = "build/sanity"
tmp_dir = "build/tmp"
distro_dir = "build/distro"

[toolchain]
linker = "C:/toolchain/link.exe"
assembler = "C:/toolchain/ml64.exe"
```

### Workspace Example

```toml
[workspace]
members = "apps/core, libs/util"
```

## Locked Proof Surface

- unit validation in `crates/adenc-cli/src/cli/mod.rs`
- CLI lock coverage in `crates/adenc-cli/tests/stage_locks_d.rs`
