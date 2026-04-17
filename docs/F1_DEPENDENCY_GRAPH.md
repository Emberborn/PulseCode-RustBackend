# F1 Dependency Graph

This document groups the F1 execution order into dependency layers so implementation work can be batched instead of treated as 90+ isolated line items.

## Layer 0: Truth And Policy

These tasks define the baseline before feature growth:

- `F1-00` baseline audit
- `F1-01` gap matrix
- `F1-02` support policy
- `F1-03` staged dependency graph

These must stay ahead of implementation so the phase does not drift into syntax-only work.

## Layer 1: Frontend Surface Completion

These tasks unblock most later work:

- `F1-04` keyword/token audit
- `F1-05` char literal handling
- `F1-06` literal/token breadth
- `F1-07` token support for exception/resource/lambda/generic/annotation families
- `F1-08` invalid-token diagnostics
- `F1-09` declaration/type breadth
- `F1-10` enums
- `F1-11` generics baseline
- `F1-12` annotation breadth
- `F1-14` declaration/import breadth

## Layer 2: Semantic Model Lock

These tasks should move in parallel with or immediately after the frontend slice:

- `F1-13` modifier semantics/fences
- `F1-22` cast breadth
- `F1-26` promotion/operator semantics
- `F1-28` overload/conversion rules
- `F1-29` exception semantic model
- `F1-30` annotation semantics
- `F1-31` generic type checking
- `F1-32` flow analysis expansion
- `F1-33` visibility/inheritance/nested-type semantics

Critical branch decisions inside this layer:

- generics baseline
- exception runtime model
- modifier/concurrency fences

## Layer 3: Runtime / Backend Enablement

These tasks depend on the syntax/semantic choices above:

- `F1-15` `throw`
- `F1-16` `try` / `catch` / `finally`
- `F1-17` try-with-resources policy
- `F1-18` foreach
- `F1-19` assert policy
- `F1-20` synchronized statement policy
- `F1-21` ternary
- `F1-23` array creation breadth
- `F1-24` lambda policy/implementation
- `F1-25` method reference policy
- `F1-27` bitwise/shift operators
- `F1-34` IR expansion
- `F1-35` exception lowering/runtime model
- `F1-36` lowering for new statements/expressions
- `F1-37` runtime/ABI/intrinsic growth
- `F1-38` fat/shared compatibility coverage

## Layer 4: Stdlib Expansion

Stdlib work depends on the earlier syntax/runtime choices but can be grouped by family:

### Core Language Types

- `F1-39` through `F1-47`

### Collections

- `F1-48` through `F1-55`

### IO / Math / Time / Util

- `F1-56` through `F1-64`
- `F1-83` through `F1-85`

### Concurrency / Networking

- `F1-86` through `F1-95`

Important sequencing truth:

- util/concurrency/network should not start as implementation-first work until their policy tasks are fixed
- collection work should stay aligned with the selected generics baseline

## Layer 5: Integration And Evidence

These tasks become meaningful once the feature families above are landing:

- `F1-65` metadata/import/prelude wiring
- `F1-107A` Pulse-side feature/behavior lock model
- `F1-66` large multi-file fixtures
- `F1-67` stress/performance guards
- `F1-68` compatibility notes
- `F1-69` signature-level docs
- `F1-70` language reference
- `F1-71` semantic/executable conformance
- `F1-72` closure checklist and evidence index
- `F1-73` closure verification

## Layer 6: Validation / CI / Release Guardrails

These should land incrementally, not at the very end:

- `F1-74` coverage map
- `F1-75` validation layering policy
- `F1-76` CI topology
- `F1-77` lexer/parser conformance
- `F1-78` semantic conformance
- `F1-79` multi-file regression suites
- `F1-80` IR/backend/artifact validation
- `F1-81` executable/package/install/failure-path suites
- `F1-82` benchmark/stress/release gates

## Recommended Execution Batches

To keep momentum high, F1 should be executed in larger batches:

1. Policy lock batch
   - `F1-00` .. `F1-03`
2. Frontend/token/declaration batch
   - `F1-04` .. `F1-14`
3. Exception + expression + lowering batch
   - `F1-15` .. `F1-38`
4. Core stdlib batch
   - `F1-39` .. `F1-47`
5. Collections batch
   - `F1-48` .. `F1-55`
6. IO/math/time/util batch
   - `F1-56` .. `F1-64`, `F1-83` .. `F1-85`
7. Concurrency/network policy+implementation batch
   - `F1-86` .. `F1-95`
8. Integration/docs/validation closure batch
   - `F1-65` .. `F1-82`, `F1-107A`

## Planning Rule

If a task depends on a policy choice that is still fuzzy, do not implement it speculatively.
Make the policy explicit first, then implement against that locked contract.
