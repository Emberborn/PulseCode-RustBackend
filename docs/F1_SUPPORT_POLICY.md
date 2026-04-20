# F1 Support Policy

This document defines the policy buckets for Phase F1.

## Bucket Definitions

### Required By F1

Features in this bucket must not merely parse. They must have:

- parser support
- semantic support
- backend/runtime support where execution requires it
- docs
- fixture or conformance evidence

### Allowed To Defer In F1

Features in this bucket may stay out of scope for F1, but only if:

- the deferral is explicit
- diagnostics or docs make the boundary obvious
- no Java-close claim implies that the deferred feature already exists

### Pulse-Specific Intentional Differences

These features may remain different from Java in F1 as long as:

- the difference is documented
- the behavior is deterministic
- the docs do not oversell Java compatibility

## Required By F1

Current required F1 categories:

- close the core declaration/control-flow/expression gaps needed for mainstream Java-like application code
- choose and honestly implement the F1 generics baseline
- choose and honestly implement the F1 exception runtime model
- materially expand `com.pulse.lang`
- materially expand collections, io, math, time, and util baselines
- publish the F1 support matrix and signature-level docs
- land integrated validation across parser, semantics, backend/runtime, fixtures, packaging, and docs

Required feature families:

- enums
- array construction breadth
- foreach
- ternary
- bitwise/shift operator family
- `throw`
- the chosen `try`/`catch`/`finally` baseline
- `synchronized` statement/method baseline
- `Scanner`
- `Objects`
- practical `String` / `StringBuilder` utility hardening in support of the util baseline
- explicit concurrency/network policy
- explicit memory/publication policy for the shipped concurrency baseline

## Allowed To Defer In F1

Current explicit F1 deferrals:

- full Java reflection/invocation
- desktop UI families (`awt`, `swing`)
- method references if not chosen as part of the F1 baseline
- lambdas if not chosen as part of the F1 baseline
- concurrent collections beyond the explicitly chosen concurrency baseline
- higher-level executor/future depth beyond the explicitly chosen concurrency baseline
- URL/HTTP helper surface beyond the explicitly chosen networking baseline
- external native binding/library-artifact ecosystem work (Phase F-A)

## Pulse-Specific Intentional Differences

These remain allowed Pulse-specific differences in F1 if documented honestly:

- unsigned primitive and wrapper support
  - `ubyte`, `ushort`, `uint`, `ulong` and their wrapper classes are retained Pulse extensions, not part of the Java-close claim
  - docs and compatibility notes must call them out explicitly as Pulse-only surface
  - Java-close wording may describe the signed primitive/wrapper baseline, but it must not imply that unsigned types came from Java
- current native packaging/build model
- reflection-lite-only `Class`
- compile-time instantiated generics with erased runtime before the deeper collection-wide generic work lands
- any explicitly documented narrower Java-close subset chosen for exceptions

## Reserved But Not Yet Supported

The following must continue to be treated as fenced until they are actually implemented:

- `native`
- `strictfp`
- `transient`
- `volatile`
- `async`

## F1 Memory / Publication Baseline

The current F1 memory/publication contract is intentionally narrower than full Java:

- `synchronized`/monitor coordination is real
- `volatile` remains reserved and semantically rejected
- `final` fields are real as compile-time immutability after initialization, not as Java-style safe-publication guarantees
- `AtomicReference` is real for explicit shared-reference handoff/publication
- ordinary unsynchronized object-field publication across threads is not part of the currently claimed F1 baseline

Policy rule:

- docs and tests must distinguish real coordination semantics from broader Java-close memory-model promises
- unsupported visibility/order guarantees must remain fenced rather than implied

Policy rule:

- reserved keywords or modifiers do not count as partial support
- they count only when semantics/runtime behavior are real

## Closure Rule

At F1 closure:

- everything claimed as Java-close must be backed by the shipped implementation and evidence
- everything deferred must be clearly documented as deferred
- everything Pulse-specific must be called out as an intentional difference, not silent drift
