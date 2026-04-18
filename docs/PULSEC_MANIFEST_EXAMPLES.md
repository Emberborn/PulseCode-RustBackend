# Aden Lang Manifest Example Matrix

This document provides reference `adenc.toml` examples for the current manifest surface.

Rebase note (`RB-05`):

- canonical public target IDs are `windows-x64`, `adenos-x64`, `linux-x64`, and `macos-arm64`
- the examples below are now rebased onto the canonical target taxonomy

Packaging removal note (`RB-17.1`):

- compiler-owned packaging metadata is removed from the manifest surface
- examples below intentionally omit `[package.metadata]`, `packaging_mode`, `wix`, and `signtool`

Primary schema reference:

- [PULSEC_MANIFEST_V1.md](/D:/Programming/codex/Aden Lang/docs/PULSEC_MANIFEST_V1.md)

## Matrix

| Example | Use case | Key sections |
|---|---|---|
| App baseline | Single executable app project | `[package]`, `[sources]`, `[build]`, `[toolchain]` |
| Shared output app | App built as exe + runtime/library set | `[build].output_mode = "shared"`, `[build].output_entry` |
| AdenOS requested-target app | Contract-planning request for AdenOS | `[build].target = "adenos-x64"` |
| macOS Apple Silicon requested-target app | Planned Darwin/Apple Silicon contract request | `[build].target = "macos-arm64"` |
| Workspace root | Multi-member project orchestration | `[workspace].members` |
| Layout override project | Custom source/build directories | `[sources]` + `[build]` directory override keys |

## 1) App Baseline

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
asm_dir = "build/asm"
generated_dir = "build/generated"
assets_dir = "build/assets"
sanity_dir = "build/sanity"
tmp_dir = "build/tmp"
distro_dir = "build/distro"

[toolchain]
linker = "C:/Program Files/Microsoft Visual Studio/link.exe"
assembler = "C:/Program Files/Microsoft Visual Studio/ml64.exe"
```

## 2) Shared Output App

```toml
[package]
name = "shared_demo"
version = "1.0.0"

[sources]
main_aden = "src/main/aden"
entry = "app/main/Main.aden"

[build]
profile = "release"
target = "windows-x64"
output_mode = "shared"
output_entry = "launcher"
runtime_debug_allocator = "off"
runtime_cycle_collector = "on"
```

## 3) AdenOS Requested-target App

```toml
[package]
name = "adenos_demo"
version = "1.0.0"

[sources]
main_aden = "src/main/aden"
entry = "app/main/Main.aden"

[build]
profile = "release"
target = "adenos-x64"
output_mode = "fat"
output_entry = "main"
runtime_debug_allocator = "off"
runtime_cycle_collector = "on"
```

## 4) macOS Apple Silicon Requested-target App

```toml
[package]
name = "macos_demo"
version = "1.0.0"

[sources]
main_aden = "src/main/aden"
entry = "app/main/Main.aden"

[build]
profile = "release"
target = "macos-arm64"
output_mode = "fat"
output_entry = "main"
runtime_debug_allocator = "off"
runtime_cycle_collector = "on"
```

## 5) Workspace Root Manifest

```toml
[workspace]
members = "apps/core, apps/tools, libs/shared"
```

Each member path must point to a project containing its own `adenc.toml`, and member manifests cannot define `[workspace]`.

## 6) Layout Override Project

```toml
[package]
name = "layout_demo"
version = "1.0.0"

[sources]
main_aden = "code/main"
main_resources = "res/main"
test_aden = "code/tests"
test_resources = "res/tests"
api_aden = "api/main"
api_resources = "api/res"
docs = "documentation"
libraries = "deps"
entry = "app/core/Main.aden"

[build]
profile = "debug"
target = "linux-x64"
output_mode = "fat"
output_entry = "main"
asm_dir = "out/asm"
generated_dir = "out/generated"
assets_dir = "out/assets"
sanity_dir = "out/sanity"
tmp_dir = "out/tmp"
distro_dir = "out/distro"
```

## Alignment Notes

- CLI/manifest lock tests live in `crates/adenc-cli/tests/stage_locks_d.rs`
- parser/validation unit tests live in `crates/adenc-cli/src/cli/mod.rs`
- if schema keys evolve, update this matrix and [PULSEC_MANIFEST_V1.md](/D:/Programming/codex/Aden Lang/docs/PULSEC_MANIFEST_V1.md) in the same change
