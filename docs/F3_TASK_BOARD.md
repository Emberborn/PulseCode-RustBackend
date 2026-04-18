# F3 Task Board: Retired as a Standalone Phase

Status legend: `Todo`, `In Progress`, `Blocked`, `Done (Locked)`.

## Status

As of 2026-03-12, the former standalone F3 validation/CI/performance board has been absorbed into `F1` and `F2`.

Reason:
- validation should land with the feature work it proves
- documentation quality and example validation should land with the docs system they protect
- deferring test/CI/perf work to a separate late phase would let parser-only or shallow-runtime features accumulate without the right locks

## New Ownership

Validation and CI work now lives in [F1_TASK_BOARD.md](/D:/Programming/codex/Aden Lang/docs/F1_TASK_BOARD.md):
- `F1-74`..`F1-82`
- gate `F1-G9`

Docs-quality and docs-validation work now lives in [F2_TASK_BOARD.md](/D:/Programming/codex/Aden Lang/docs/F2_TASK_BOARD.md):
- `F2-24`..`F2-29`
- gate `F2-G6`

## Redirected Scope

Former F3 areas are now handled as follows:
- parser/lexer/semantic/IR/backend/runtime/artifact/package/install validation:
  - `F1`
- executable fixtures, stress suites, benchmark corpus, CI topology, flaky-test policy, release-readiness gates:
  - `F1`
- docs-example conformance, docs maintenance automation, validation-system docs, and closure evidence:
  - `F2`

## Exit Rule

- No standalone `F3` execution remains.
- Phase F closes through `F1` and `F2` completion.
