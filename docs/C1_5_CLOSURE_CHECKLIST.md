# C1.5 Closure Checklist

Date:
- 2026-03-10

Scope:
- Close C1.5 (M2 + M3) with implementation, validation, and documentation artifacts aligned.

## Required Artifacts

- ABI document:
  - `docs/RUNTIME_INTRINSICS_ABI.md`
- Stdlib API inventory:
  - `docs/STDLIB_API_INDEX.md`
- Stage/gate lock map:
  - `docs/STAGE_LOCK_TESTS.md`
- Windows toolchain matrix:
  - `docs/WINDOWS_TOOLCHAIN_MATRIX.md`
- Task board:
  - `docs/C1_5_TASK_BOARD.md`

## Validation Checklist

- [x] Runtime ABI coverage for M3 runtime-backed APIs is documented and locked.
- [x] Stdlib class inventory is published and grouped by package.
- [x] Strict stress fixture exists and verifies deterministic checksum output.
- [x] Windows toolchain matrix includes default discovery, explicit `--linker`, and `PULSEC_LINKER`.
- [x] Integration fixture suite is green:
  - `cargo test -p pulsec --test fixture_projects`
- [x] ABI lock tests are present and green:
  - `cargo test -p pulsec m3_14_`
- [x] Casting/literal conformance locks are present and split by intent:
  - success-path suite: `cargo test -p pulsec --test stage_locks_casting`
  - expected-failure suite: `cargo test -p pulsec --test stage_locks_casting_failures`
  - includes truncation casts for negative float/double values and boxed literal mapping (`Long a = 20`)

## Closure Commands

Run to verify closure status:

```powershell
cargo test -p pulsec m3_14_
cargo test -p pulsec --test fixture_projects
```

Optional stronger soak pass:

```powershell
$env:PULSEC_SOAK_ITERS=10
cargo test -p pulsec --test fixture_projects cli_build_executes_stress_soak_repeatedly -- --exact
Remove-Item Env:PULSEC_SOAK_ITERS
```

## Completion Statement

- C1.5 closure artifacts are now published.
- M3-18 doc gate requirements are satisfied by linked ABI/index/checklist artifacts.
