# F-B Carry-Forward Tracker

## Purpose

This document tracks work that is consciously deferred to `F-B` instead of being forced immediately into the current active phase.

The rule is:

- from this point forward, planning should optimize for self-sustained completion rather than the older weaker "self-hosted is enough" wording
- if a feature can be pushed further toward self-sustained ownership now without distorting the current phase, it should be
- if pushing it all the way now would create disproportionate work, wrong sequencing, or premature architecture churn, it should be recorded here and carried into `F-B`

This reduces audit load later because `F-B` does not have to rediscover every partially deferred ownership/elevation gap from scratch.

## Carry-Forward Rules

- every intentional defer-to-`F-B` decision should add an entry here
- entries should be concrete and short
- each entry should say:
  - what is deferred
  - why it is being deferred now
  - what board/task currently owns the nearer-term work
  - what `F-B` is expected to audit or finish later
- this is not a dumping ground for vague ideas; only real deferred self-sustained work belongs here

## Current Entries

- 2026-04-14: structured diagnostics with optional flavor lines after `F1-97`
  - deferred:
    - a shared compiler/runtime diagnostic envelope that supports a short mood/flavor line ahead of the stable error payload
    - compiler error formatting that keeps machine-stable `Error:` / `Detail:` / `Expected:` / `Found:` / `Hint:` fields while allowing one short human-facing opener
    - internal panic/throw formatting rules that distinguish product fault from user-code/runtime fault while still allowing the same structured presentation
    - consolidation of parser-facing text handling onto reusable cursor-driven parsing helpers such as `aden.util.TextCursor` before broadening diagnostic personality work through parser code
  - why deferred now:
    - `F1-97` currently owns the inward migration of project/manifest/layout/tooling ownership into Aden, not a cross-cutting diagnostic UX pass
    - trying to inject tone into current parser/manifest work now would create churn in the wrong layer instead of landing the shared formatting path first
    - the feature should be done once through the real diagnostic envelope so it can stay coherent across compiler errors, internal panics, and later runtime failure presentation
  - current-lane owner:
    - `F1-97` should keep parser work aligned with reusable text/cursor infrastructure and record this explicitly at lane closeout
  - later expectation:
    - run a dedicated diagnostic-formatting pass after the current `F1-97` ownership slice is stable
    - define the flavor-line catalog centrally instead of hand-authoring prose at individual call sites
    - keep precision primary and treat the mood line as optional presentation on top of stable structured fields
    - preserve the intended tone of the opener; examples discussed during `F1-97` include:
      - `The compiler searched, but \`foo\` appears to be fictional.`
      - `The import wandered into the wilderness and did not return.`
      - `The type system is disappointed in this arrangement.`
      - `You have likely offended the string literal.`

- 2026-04-14: time ownership cleanup after `F1-113`
  - deferred:
    - adklib/runtime ownership audit for time ingress and higher-level time-source helpers once the post-`F1` inward-lift audit begins
    - any decision to elevate richer time-source composition helpers into `adklib` instead of leaving them in public `stdlib`
    - any zone/locale/pattern-engine expansion beyond the shipped UTC-style/no-time-zone baseline
  - why deferred now:
    - `F1-113` now owns and ships the honest current split: wall-clock `Clock` plus elapsed/process-relative `TimeSource`, both Aden-owned above the runtime ingress points `System.currentTimeMillis()` and `System.nanoTime()`
    - the remaining asks are no longer missing core behavior; they are ownership-placement and broader policy questions that should be answered alongside the full post-`F1` inward-lift audit instead of being guessed piecemeal mid-lane
    - forcing adklib placement decisions now would create architecture churn before the whole-codebase audit has classified the remaining inward-lift boundaries coherently
  - current-lane owner:
    - `F1-113` owns the practical time API/behavior closure only
  - `F-B` expectation:
    - audit whether any richer time-source helpers or runtime-ingress wrappers should move into `adklib`
    - confirm the defended boundary around runtime wall-clock/monotonic ingress
    - decide whether any broader time policy belongs in public `stdlib`, `adklib`, or later runtime-owned Aden code before the self-sustained transition

- 2026-04-14: secure randomness and secure UUID generation after `F1-112`
  - deferred:
    - a stronger non-secure PRNG algorithm upgrade beyond the current LCG core (for example PCG, XorShift, or an equivalent later-chosen replacement)
    - broader distribution helpers beyond the shipped uniform/Gaussian baseline (for example exponential, Poisson, and related higher-level samplers)
    - a real `SecureRandom` surface
    - OS/runtime entropy ingress and secure seeding policy
    - cryptographically honest UUID generation on top of secure randomness
    - any transition from the current deterministic/non-secure `UUID.randomUUID()` convenience path to a distinct secure UUID API
  - why deferred now:
    - `F1-112` now covers the deterministic pseudo-random closure needed for current self-sustained progress: corrected bounded/fractional behavior, unsigned and small-primitive lanes, Gaussian helpers, state-control helpers, current-array-model bulk helpers, and a fully Aden-owned non-secure UUID type/generator
    - the remaining follow-on work splits into two later buckets: deeper PRNG/distribution quality above the current deterministic baseline, and secure-random work at the OS/runtime entropy boundary
    - the secure-random side is not ordinary stdlib helper breadth; it is OS/runtime/entropy-boundary work that belongs later once the secure runtime service story is ready to be defined honestly
    - forcing security claims now would create architecture churn and fake guarantees instead of truthful self-sustained progress
  - current-lane owner:
    - `F1-112` owns the non-secure deterministic random/UUID surface only
  - `F-B` expectation:
    - audit whether the current LCG should be replaced with a stronger Aden-owned deterministic generator before the self-sustained transition
    - decide whether broader distribution helpers belong in `stdlib` or `adklib`
    - audit the secure entropy boundary, decide what belongs in `stdlib`, `adklib`, runtime Aden code, or defended host/adapter glue, and define the honest secure-random/secure-UUID split before the self-sustained transition claims full randomness ownership

- 2026-04-13: deeper post-baseline math fidelity after `F1-111`
  - deferred:
    - deeper numerical accuracy tuning for the current `Math` trig/log/exp approximations beyond the shipped advanced-helper slice
    - possible dedicated bit-level implementations for `ulp(float/double)` and `nextAfter(float/double)` if later parity/profiling work justifies replacing the current practical implementations
  - why deferred now:
    - `F1-111` already carries the practical primitive/floating closure, inverse/hyperbolic families, the current special-value/domain fidelity pass, and the advanced floating helper slice (`isNormal`, `getExponent`, `scalb`, `cbrt`, `expm1`, `log1p`, `IEEEremainder`, `rint`, `nextUp`, `nextDown`) needed for self-sustained readiness
    - the remaining asks are deeper implementation-quality upgrades rather than missing baseline or advanced math families
    - forcing them immediately is no longer the narrowest path to keep the board moving honestly
  - current-lane owner:
    - `F1-111` remains the nearer-term owner until the user chooses to lock that lane
  - `F-B` expectation:
    - audit whether those deeper floating/math refinements should be completed in Aden before the self-sustained transition, and finish any that still matter instead of leaving them as undocumented numeric debt

- 2026-04-13: final core string representation seam after `F1-63` string elevation
  - deferred:
    - the last private string representation primitives in [String.aden](/G:/Programming/Rust/Aden Lang/stdlib/src/com/aden/lang/String.aden):
      - `runtimeLength(String)`
      - `runtimeConcat(String, String)`
      - `runtimeCharAt(String, int)`
      - `runtimeFromChar(char)`
  - why deferred now:
    - higher-level string, builder, wrapper parse/format, and class-text behavior are already Aden-owned
    - what remains is the underlying string storage/index/char-bridge seam rather than ordinary stdlib behavior
    - forcing that deeper replacement now would turn `F1-63` into a representation/runtime-core project instead of finishing the util lane
  - current-lane owner:
    - `F1-63` still owns any remaining high-level text API growth above this seam
  - `F-B` expectation:
    - audit whether the underlying string core can be re-hosted in Aden/adklib/runtime-owned Aden code before the self-sustained transition, or explicitly defend it as a true host/adapter boundary if not

- 2026-04-10: deeper Aden-owned numeric/unsigned text+parse lifting in the `com.aden.lang.String` / wrapper area
  - deferred:
    - broader Aden-owned wrapper/string formatting and parse ownership beyond the stable current slice
    - specifically, unsigned wrapper parse/format lifting and some stricter-backend-sensitive string/text helper ownership that compiled on the targeted lane but destabilized the broader full backend verification lane
  - why deferred now:
    - the current F1 string hardening pass successfully shipped stable user-facing string/search/builder growth plus a small safe ownership lift, but pushing the deeper wrapper/string ownership transfer immediately caused broader backend-lane regressions that were disproportionate to force through in this slice
  - current-lane owner:
    - `F1-63` remains the nearer-term owner for practical `String` / `StringBuilder` growth
  - `F-B` expectation:
    - audit the remaining runtime-owned string/wrapper formatting and parsing helpers and finish the Rust-to-Aden ownership transfer only once the full backend/compiler lane can carry those methods honestly, not just the narrower targeted fixture path

## Reviewed And Kept In Current-Lane Work

- 2026-04-14: reassessment of completed stdlib/runtime-facing `F1` tasks before `F1-97`
  - reviewed:
    - `F1-39`..`F1-63`
    - `F1-83`..`F1-85`
    - `F1-104`
    - `F1-111`..`F1-113`
  - result:
    - no immediate reopen was required for those completed public-surface tasks
  - reason:
    - the current locked public `stdlib` surface is acceptable for the stronger self-sustained bar
    - the real remaining gap is not missing public API breadth in those already-locked tasks; it is the sharper placement of compiler/runtime/systems-facing helper surfaces into `adklib` instead of leaking them into public `stdlib`
  - current-lane owner:
    - `F1-97` now owns the first explicit `stdlib` vs `adklib` vs defended host-boundary split for compiler/resource/support utilities
  - later expectation:
    - `F1-113A` and `F-B` still own the whole-codebase inward-lift audit, but they should now start from a smaller reopen set because this reassessment kept the current public stdlib slice locked instead of reopening it speculatively

- 2026-04-13: backend regression-handling rule after `F1-63` string/collections repair
  - reviewed the recent two-day regression cycle caused by broad backend ARC/call-owner adjustments during string elevation
  - result: no `F-B` carry-forward entry was added
  - reason: this was not later self-sustained ownership debt; it was current-lane backend discipline debt and has to stay a live execution rule now
  - current-lane rule:
    - isolate an exact reproducer before changing backend/runtime/codegen ownership behavior
    - land the narrowest fix that makes that reproducer pass
    - then widen validation to neighboring exact tests, then lock lanes, then the full suite
  - current-lane owner:
    - active `F1` work, especially `F1-63` and any later task that touches backend/runtime ownership behavior

- 2026-04-10: `F1-60` / `F1-61` review
  - reviewed `com.aden.math.Math` and `com.aden.math.Random` against the new self-sustained rule
  - result: no `F-B` carry-forward entry was added
  - reason: the remaining gaps are still feature/fidelity breadth already tracked in `F1-111` and `F1-112` rather than later Rust-to-Aden ownership debt
  - current-lane owners:
    - `F1-111` for broader math closure, including unsigned-facing closure if/when pulled in there
    - `F1-112` for broader random closure, including unsigned variants and remaining policy/fidelity work

Add entries as soon as a real "good enough for now, finish for self-sustained later" decision is made.

## Expected Use During F-B

When `F-B` begins:

1. start with this tracker
2. merge it with the whole-program inventory in [FB_TASK_BOARD.md](/G:/Programming/Rust/Aden Lang/docs/FB_TASK_BOARD.md)
3. add anything newly discovered by the formal audit
4. convert the combined set into explicit `F-B` execution items
