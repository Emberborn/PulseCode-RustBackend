# Build System Evolution Plan

This document captures the forward-compatible architecture for moving from `pulsec.toml` to a script-driven build DSL later, without rewriting executors.

## Design Targets

1. Keep artifact and layout contracts stable (`build/asm`, `build/generated`, `build/distro`, `build/assets`, `build/tmp`).
2. Keep command surface stable while allowing future Gradle-style task expansion.
3. Isolate config frontend (`toml` today, script DSL later) from task execution core.

## Layering

1. `CLI layer`
   - Parses commands/flags and resolves user intent.
2. `Config adapter layer`
   - Converts source config to normalized build model.
   - Current adapter: `pulsec.toml`.
   - Future adapter: script DSL.
3. `Task graph layer`
   - Task definitions, dependencies, ordering, and reusable execution graph.
4. `Executor layer`
   - Concrete build/test/doc and platform actions.
5. `Artifact contract layer`
   - Deterministic output locations and manifest/report schemas.

## Migration Principle

- Replace adapters, not executors.
- Script DSL should compile/resolve into the same normalized task graph inputs used by TOML.
- Existing lock tests should continue validating output/report/layout contracts across adapter changes.
