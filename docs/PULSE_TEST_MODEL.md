# Aden-Side Test Model

## Purpose

This document defines the testing model for the Aden-authored compiler/runtime side.

Rust keeps the broad bring-up lock surface it already has today.
Aden-side testing should be narrower, cleaner, and more production-oriented.

## Test Families

Aden-side tests are split into two families:

1. Project and roadmap locks
2. Feature and behavior locks

## Project and Roadmap Locks

Keep these, but keep them narrow.

Use them only when project-management truth matters directly, for example:

- required docs trees exist
- the active board exists
- support-policy docs exist
- architecture contract docs exist

These are not the primary quality signal for the Aden compiler/runtime.

## Feature and Behavior Locks

These are the primary Aden-side testing surface.

They should lock:

- semantics
- runtime behavior
- stdlib contracts
- ABI expectations
- diagnostics
- failure modes

They should read like product behavior tests, not bring-up bookkeeping.

## Dual-Implementation Rule

During the Rust + Aden lockstep period:

- Rust-side tests continue to carry the broad board/roadmap/doc lock burden
- Aden-side tests focus on product behavior and regression protection
- both implementations are tested for regressions

The goal is not two copies of the same suite.
The goal is:

- broad closure proof remains on Rust while Rust is still the bootstrap implementation
- cleaner behavior-focused regression proof grows on the Aden side for the long-term compiler/runtime

## Preferred Aden-Side Tests

Prefer:

- behavior-oriented feature locks
- executable regression fixtures
- deterministic diagnostics and failure-path tests
- ABI and stdlib contract tests

## Initial Test Homes

The first concrete Aden-side feature-lock homes are:

- [crates/adenc-core/src/tests/prelude_contract.rs](/G:/Programming/Rust/Aden Lang/crates/adenc-core/src/tests/prelude_contract.rs)
- [crates/adenc-cli/tests/aden_feature_locks.rs](/G:/Programming/Rust/Aden Lang/crates/adenc-cli/tests/aden_feature_locks.rs)

These should grow as behavior-oriented regression homes.
They should not turn into replacements for the broad Rust-side board and roadmap lock spine.

Avoid turning the Aden-side suite into:

- a duplicate of the Rust board-lock suite
- a bring-up-era roadmap bookkeeping harness

## F1-97 Relevance

`F1-97` is the first task that needs this split explicitly because it starts the real self-host/self-sustained transition.

The exit condition is stronger than helper migration alone:

- the Aden compiler/runtime source must exist in Aden
- the Rust-built Aden compiler must be able to compile it
- Rust and Aden implementations must stay in lockstep afterward until the later Rust removal decision

That requires the Aden-side test model to be production-oriented from the beginning.
