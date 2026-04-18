# Rebase Planning Spine Alignment

Status: Done (Locked)  
Date locked: 2026-03-22

This document is the source of truth for `RB-20` on [REBASE_TAKS_BOARD.md](/D:/Programming/codex/Aden Lang/docs/REBASE_TAKS_BOARD.md).

Its job is simple: make the live planning spine agree on the same architecture, the same active board, the same `F1` resume point, and the same stronger self-sustained-hosting destination.

## Purpose

`RB-20` exists so new agents do not re-litigate direction based on stale docs.

The rebase planning spine must agree on all of the following:

- the rebase board closes honestly before `F1` resumes
- the backend is now a target-adapter architecture
- Windows x64 remains a real target and the current host/bootstrap lane
- AdenOS remains the first requested-target contract stack below Windows execution
- Linux remains a later lane in the same model
- compiler-owned packaging is gone and frozen against re-entry
- the first `F1` return point after honest closure remains `F1-51`
- self-hosting is now framed as the transition mechanism toward self-sustained hosting, not the final strategic stop

## Live Planning Spine

The live planning spine is:

1. [REBASE_TAKS_BOARD.md](/D:/Programming/codex/Aden Lang/docs/REBASE_TAKS_BOARD.md)
2. [REBASE_SCOPE_AND_RETURN_POLICY.md](/D:/Programming/codex/Aden Lang/docs/REBASE_SCOPE_AND_RETURN_POLICY.md)
3. [CODEX_HANDOFF_PHASE_F.md](/D:/Programming/codex/Aden Lang/docs/CODEX_HANDOFF_PHASE_F.md)
4. [NATIVE_BACKEND_CONTRACT.md](/D:/Programming/codex/Aden Lang/docs/NATIVE_BACKEND_CONTRACT.md)
5. [STANDALONE_ROADMAP.md](/D:/Programming/codex/Aden Lang/docs/STANDALONE_ROADMAP.md)

These documents must tell the same story.

## Current Active Truth

With `RB-21` cleared, the planning spine now agrees on this active truth:

- active execution board: `F1_TASK_BOARD`
- active resume point: `F1-51`
- current state: the rebase closure package is published, reviewed, and closed
- latest closed board: `REBASE_TAKS_BOARD`
- first active `F1` return point: `F1-51`

## Review Gate Note

The requested code review after publication of the `RB-21` closure package has now cleared.

That means:

- the closure artifacts remain the published evidence bundle
- the next board is no longer merely eventual
- the rebase is handed back to `F1`
- the planning spine should now point to `F1-51`

## Alignment Rules

The planning spine is only aligned when:

- the handoff tells new agents that the rebase is closed and `F1` is active again
- the roadmap presents `F1` as the active lane again
- the backend contract records the rebase as closed rather than still pending
- the `F1-51` resume point is still named explicitly
- the cleared review gate is reflected in docs rather than buried in chat history

## Locked Result For `RB-20`

`RB-20` is satisfied when all of the following are true:

- this alignment document exists
- the board, handoff, roadmap, and backend contract all agree that the rebase is closed
- those same docs agree that `F1-51` is the active resume point after rebase closure
- none of those docs leave `RB-21` as the live next step after the review has already cleared
