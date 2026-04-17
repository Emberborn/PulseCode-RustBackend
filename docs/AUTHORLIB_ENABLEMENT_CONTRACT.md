# Authorlib Enablement Contract

`authorlib` is the privileged Pulse-owned library surface for compiler,
runtime, toolchain, build, OS, and other systems-level authoring work.

## Package Roots

- ordinary public stdlib lives under `pulse.*`
- privileged authoring surface lives under `author.*`

These roots are intentionally distinct:

- `pulse.*` is the default user-visible standard library
- `author.*` is elevated and must not be treated as ambient application API

## Enablement Rule

`author.*` imports follow an explicit opt-in rule for ordinary projects.

### Ordinary user projects

- `author.*` is disabled by default
- importing `author.*` without opt-in is a usage error

### Opted-in user projects

Enable `authorlib` in `pulsec.toml`:

```toml
[authorlib]
enabled = true
```

Once enabled, ordinary import rules apply for the shipped `author.*` surface.

### Compiler/runtime/toolchain builds

- `author.*` must always be available to product-owned compiler/runtime builds
- this availability is part of the bootstrap/self-sustained contract and is not
  optional for those builds

## Visibility and Tooling Policy

- `author.*` is privileged by package root and enablement, not by special
  syntax
- normal visibility modifiers still apply inside `author.*`
- user-facing tooling such as the later IDE should not surface `author.*`
  package completions, browse lists, or suggested imports unless the current
  project has opted in

## Current Seed Surface

The first real seeded package is:

- `author.project`

Current proof class:

- `author.project.ProjectLayout`

This exists to prove the root, import gating, docs generation, and stdlib
package ownership path before larger manifest/workspace/project logic moves
inward under `F1-97`.
