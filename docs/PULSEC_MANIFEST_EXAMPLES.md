# PulseCode Manifest Example Matrix (D2-07)

This document provides reference `pulsec.toml` examples for the locked D2 manifest surface.

Primary schema reference:
- `docs/PULSEC_MANIFEST_V1.md`

Related command behavior:
- `docs/CLI_COMMAND_CONTRACT.md`
- `docs/PROJECT_LAYOUT_CONVENTIONS.md`

## Matrix

| Example | Use case | Key sections |
|---|---|---|
| App baseline | Single executable app project | `[package]`, `[sources]`, `[build]`, `[toolchain]`, `[package.metadata]` |
| Shared output app | App built as exe + runtime/library dll set | `[build].output_mode = "shared"`, `[build].output_entry` |
| Packaging-ready app | MSI/staged metadata-ready project | `[package.metadata]` required packaging keys |
| Workspace root | Multi-member project orchestration | `[workspace].members` |
| Layout override project | Custom source/build directories | `[sources]` + `[build]` directory override keys |

## 1) App baseline

```toml
[package]
name = "demo_app"
version = "1.0.0"

[sources]
main_pulse = "src/main/pulse"
main_resources = "src/main/resources"
test_pulse = "src/test/pulse"
test_resources = "src/test/resources"
api_pulse = "src/api/pulse"
api_resources = "src/api/resources"
docs = "docs"
libraries = "libraries"
entry = "app/main/Main.pulse"

[build]
profile = "release"
target = "native-x64"
packaging_mode = "staged"
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
wix = "C:/Program Files/WiX Toolset v6.0/bin/wix.exe"
signtool = "C:/Program Files (x86)/Windows Kits/10/bin/signtool.exe"

[package.metadata]
publisher = "Pulse Labs"
identifier = "com.pulse.demo_app"
install_scope = "per-user"
entrypoints = "app.main.Main"
icons = "src/main/resources/icon.ico"
assets = "src/main/resources"
license = "LICENSE"
readme = "README.md"
config = "src/main/resources/config"
data = "src/main/resources/data"
libraries = "build/distro/libraries"
signing_mode = "unsigned"
```

## 2) Split output app (exe + dll topology)

```toml
[package]
name = "split_demo"
version = "1.0.0"

[sources]
main_pulse = "src/main/pulse"
entry = "app/main/Main.pulse"

[build]
profile = "release"
target = "native-x64"
packaging_mode = "staged"
output_mode = "shared"
output_entry = "launcher"
runtime_debug_allocator = "off"
runtime_cycle_collector = "on"
```

## 3) Packaging-ready app (MSI metadata complete)

```toml
[package]
name = "package_demo"
version = "1.2.0"

[sources]
main_pulse = "src/main/pulse"
entry = "app/main/Main.pulse"

[build]
profile = "release"
target = "native-x64"
packaging_mode = "msi"
output_mode = "fat"
output_entry = "main"

[toolchain]
wix = "C:/Program Files/WiX Toolset v6.0/bin/wix.exe"
signtool = "C:/Program Files (x86)/Windows Kits/10/bin/signtool.exe"

[package.metadata]
publisher = "Pulse Labs"
identifier = "com.pulse.package_demo"
install_scope = "per-machine"
entrypoints = "app.main.Main"
icons = "src/main/resources/icon.ico"
assets = "src/main/resources"
license = "LICENSE"
readme = "README.md"
config = "src/main/resources/config"
data = "src/main/resources/data"
libraries = "build/distro/libraries"
signing_mode = "signtool"
signing_subject = "Pulse Labs"
signing_timestamp_url = "https://timestamp.example.invalid"
```

## 4) Workspace root manifest

```toml
[workspace]
members = "apps/core, apps/tools, libs/shared"
```

Each member path must point to a project containing its own `pulsec.toml`, and member manifests cannot define `[workspace]`.

## 5) Layout override project

```toml
[package]
name = "layout_demo"
version = "1.0.0"

[sources]
main_pulse = "code/main"
main_resources = "res/main"
test_pulse = "code/tests"
test_resources = "res/tests"
api_pulse = "api/main"
api_resources = "api/res"
docs = "documentation"
libraries = "deps"
entry = "app/core/Main.pulse"

[build]
profile = "debug"
target = "native-x64"
packaging_mode = "staged"
output_mode = "fat"
output_entry = "main"
asm_dir = "out/asm"
generated_dir = "out/generated"
assets_dir = "out/assets"
sanity_dir = "out/sanity"
tmp_dir = "out/tmp"
distro_dir = "out/distro"
```

## Alignment notes

- CLI/manifest lock tests live in `crates/pulsec-cli/tests/stage_locks_d.rs`.
- Parser/validation unit tests live in `crates/pulsec-cli/src/main.rs`.
- If schema keys evolve, update this matrix and `docs/PULSEC_MANIFEST_V1.md` in the same change.
