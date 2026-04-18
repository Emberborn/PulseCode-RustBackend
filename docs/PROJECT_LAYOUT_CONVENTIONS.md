# PulseCode Project Layout Conventions (D2-03)

Default project layout follows the Gradle-style structure below.

## Default layout

```text
<project-root>/
  pulsec.toml
  build/
    asm/
    generated/
    assets/
    sanity/
    tmp/
    distro/
      debug/
      release/
      libraries/
  src/
    main/
      pulse/
      resources/
    test/
      pulse/
      resources/
    api/
      pulse/
      resources/
  docs/
  libraries/
```

## Build output behavior

- Primary build output defaults to `build/distro/<profile>`.
- Build pipeline also materializes:
  - `build/asm` (generated `.asm` copies)
  - `build/generated` (generated `.obj` copies)
  - `build/assets` (resource copies)
  - `build/sanity` (backup copy of source tree used for build)
  - `build/tmp` (temporary workspace)
- Resource/payload staging copies directory contents into the destination bucket; it does not wrap them in an extra source-folder layer.
- `src/main/resources` is copied into `build/assets` as content-only files/directories, not under an extra `resources/` wrapper.
- For manifest/profile builds, those same resource contents are also published into `build/distro/<profile>` root so the runnable output includes its payload files/directories.
- `build/distro/release` is deliverable-only: stamped executable plus published resources.
- `build/distro/debug` includes the stamped executable/resources plus debug diagnostics (`*-build.config.plan.json`, `*-native.link.txt`, `*-native.plan.json`, `*-pulsec.ir.txt`, `stamp.txt`).
- Release/debug diagnostic internals that are not published to distro remain available under `build/tmp` for build/debug workflow support.
- Shared-mode profile builds use a nested runnable layout:
  - `build/distro/<profile>/bin`
    - stamped application executable
    - published runtime payload/resources
    - `launch.txt` shared runtime lookup descriptor for shared mode
  - `build/distro/<profile>/lib`
    - shared runtime library `pulsecore-<pulsec-semver>.dll`
    - shared import library `pulsecore-<pulsec-semver>.lib`
  - `build/distro/debug/metadata`
    - shared debug diagnostics (`*-build.config.plan.json`, `*-native.link.txt`, `*-native.plan.json`, `*-pulsec.ir.txt`, `stamp.txt`)
- Shared-mode profile roots do not publish the executable or runtime libraries flat at `build/distro/<profile>`; runnable payload lives under `bin` and shared native artifacts live under `lib`.
- Shared-mode profile publication rules are locked as:
  - `release`: runnable payload only (`bin/` + `lib/`), no debug metadata bucket
  - `debug`: same runnable payload shape plus `metadata/`
  - no `.pdb` or other sidecar symbol artifacts are currently published in either shared profile
- Shared-mode `bin/launch.txt` resolves runtime payloads by relative sibling location:
  - build output: `../lib/pulsecore-<pulsec-semver>.dll`

## Historical Packaging Note

Older pre-rebase docs may still mention `build/staging` or `build/distro/package` as part of the old compiler-owned packaging pipeline.

Those directories are no longer part of the live compiler contract after [COMPILER_PACKAGING_REMOVAL.md](/D:/Programming/codex/PulseCode/docs/COMPILER_PACKAGING_REMOVAL.md).

## E3 Parity Layout Rule

- Fat/shared parity does not require identical directory shape.
- Layout parity means each mode publishes its documented runnable product deterministically:
  - fat: flat profile runnable output
  - shared: `bin/` + `lib/` and debug `metadata/`
- Debug/release differences are only valid when they are profile-driven and explicitly documented for that mode.

## Manifest override keys

Use `[sources]` and `[build]` in `pulsec.toml`:

- `[sources]`
  - `main_pulse`
  - `main_resources`
  - `test_pulse`
  - `test_resources`
  - `api_pulse`
  - `api_resources`
  - `docs`
  - `libraries`
  - `entry`
- `[build]`
  - `profile`
  - `output_mode` (`fat` or `shared`; legacy aliases `single_exe` / `exe_with_dlls` are accepted)
  - `output_entry` (required when `output_mode = shared`)
  - `out_dir`
  - `asm_dir`
  - `generated_dir`
  - `assets_dir`
  - `sanity_dir`
  - `tmp_dir`
  - `distro_dir`

All override paths must be non-empty strings.
