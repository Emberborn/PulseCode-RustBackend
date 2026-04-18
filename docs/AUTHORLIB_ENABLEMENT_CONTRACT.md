# Adklib Enablement Contract

`adklib` is the privileged Aden-owned library surface for compiler,
runtime, toolchain, build, OS, and other systems-level authoring work.

## Package Roots

- ordinary public stdlib lives under `aden.*`
- privileged authoring surface lives under `adk.*`

These roots are intentionally distinct:

- `aden.*` is the default user-visible standard library
- `adk.*` is elevated and must not be treated as ambient application API

## Enablement Rule

`adk.*` imports follow an explicit opt-in rule for ordinary projects.

### Ordinary user projects

- `adk.*` is disabled by default
- importing `adk.*` without opt-in is a usage error

### Opted-in user projects

Enable `adklib` in `adenc.toml`:

```toml
[adklib]
enabled = true
```

Once enabled, ordinary import rules apply for the shipped `adk.*` surface.

### Compiler/runtime/toolchain builds

- `adk.*` must always be available to product-owned compiler/runtime builds
- this availability is part of the bootstrap/self-sustained contract and is not
  optional for those builds

## Visibility and Tooling Policy

- `adk.*` is privileged by package root and enablement, not by special
  syntax
- normal visibility modifiers still apply inside `adk.*`
- user-facing tooling such as the later IDE should not surface `adk.*`
  package completions, browse lists, or suggested imports unless the current
  project has opted in

## Current Seed Surface

The first real seeded package is:

- `adk.project`

Current proof class:

- `adk.project.ProjectLayout`

This exists to prove the root, import gating, docs generation, and stdlib
package ownership path before larger manifest/workspace/project logic moves
inward under `F1-97`.
