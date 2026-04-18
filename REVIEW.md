# Java Parity Review

Date: 2026-03-12

Purpose:
- list what is already done enough
- list what is already tracked but still not Java-hardened
- list what is not explicitly tracked yet
- list modern Java parity families through Java 25/26 so they can be audited explicitly
- give a recommended cutoff of `Before Self-Host` vs `After Self-Host`

Status legend:
- `Done`: real enough now for current F1 scope
- `Tracked`: already on the board/docs, but not finished
- `Not Explicitly Tracked`: should be called out before closure

Phase legend:
- `Before Self-Host`: needed to make the compiler/runtime rewrite into Aden realistic and maintainable
- `After Self-Host`: useful for Java parity, but not required to get the compiler/runtime fully expressed in Aden

## Summary

The project is on a viable path to self-hosting if the currently tracked F1 work is completed and the `Before Self-Host` items below are folded into the plan.

The project is not on a path to Java 25/26 parity by the end of Phase F alone. Phase F can provide a strong Java-close core plus the foundation to expand reliably after self-hosting, but not full modern-Java parity.

## Scope Of This Review

This review covers:
- core language syntax and semantics
- runtime model and core stdlib
- utility/concurrency/network/reflection ecosystem families
- notable modern Java language/platform additions through Java 25/26

It is intentionally broader than the current F1 board so you can decide what belongs:
- before self-host
- after self-host
- never / intentionally different

## Already Done Enough Now

These are not the current problem areas.

| Area | Status | Phase | Notes |
|---|---|---|---|
| package/import/static import core | Done | Before Self-Host | Real and already used across the repo |
| class/interface/core OOP baseline | Done | Before Self-Host | Real baseline exists |
| basic control flow (`if`, loops, `switch`, `break`, `continue`, `return`) | Done | Before Self-Host | Real and executable |
| native build/package/shared runtime base | Done | Before Self-Host | Strong enough as a platform base |
| Java-like `new Type(...)` object construction | Done | Before Self-Host | Hardened and old bare constructor syntax rejected |

## Already Tracked But Not Java-Hardened Yet

These are already on the board and should be treated as required closure work unless explicitly moved to `After Self-Host`.

| Area | Status | Phase | Current Tracking |
|---|---|---|---|
| enums | Tracked | Before Self-Host | `F1-10`, `F1-47`, `F1-69` |
| generics hardening | Tracked | Before Self-Host | `F1-11`, `F1-31`, `F1-49`, `F1-68` |
| annotation ownership and richer semantics | Tracked | Before Self-Host | `F1-12`, `F1-30`, `F-A`, `F2` |
| modifier/runtime semantics (`synchronized`, `volatile`, publication rules) | Tracked | Before Self-Host | `F1-13`, `F1-20`, `F1-86`, `F1-89`, `F1-93` |
| broader declaration/import/nested-type story | Tracked | Before Self-Host | `F1-14`, `F1-33` |
| `throw` / exception flow | Tracked | Before Self-Host | `F1-15`, `F1-16`, `F1-29`, `F1-35`, `F1-46` |
| try-with-resources and resource lifecycle | Tracked | Before Self-Host | `F1-17`, `F1-47`, `F1-57` |
| foreach and iteration contract | Tracked | Before Self-Host | `F1-18`, `F1-23`, `F1-53` |
| assert semantics | Tracked | Before Self-Host | `F1-19`, `F1-26`, `F1-46` |
| ternary typing/promotion rules | Tracked | Before Self-Host | `F1-21`, `F1-26`, `F1-28` |
| cast/conversion/promotion lattice | Tracked | Before Self-Host | `F1-22`, `F1-26`, `F1-28` |
| arrays beyond current subset | Tracked | Before Self-Host | `F1-23`, `F1-36` |
| lambdas | Tracked | After Self-Host or Before Self-Host if desired | `F1-24` currently points to `F2`; decide later |
| method references | Tracked | After Self-Host or Before Self-Host if desired | `F1-25` currently points to `F2`; decide later |
| bitwise/shift operators | Tracked | Before Self-Host | `F1-27` |
| flow/nullability over wider syntax | Tracked | Before Self-Host | `F1-32` |
| IR/backend/runtime expansion for new syntax | Tracked | Before Self-Host | `F1-34` to `F1-38` |
| `Object`, `Class`, `String`, `StringBuilder`, wrappers, throwable hardening | Tracked | Before Self-Host | `F1-39` to `F1-47`, `F1-101` |
| collections expansion | Tracked | Before Self-Host | `F1-48` to `F1-55` |
| IO/path/resource surface | Tracked | Before Self-Host | `F1-56` to `F1-59` |
| console input / stdin baseline | Tracked | Before Self-Host | `F1-104` |
| math/time expansion | Tracked | Before Self-Host | `F1-60` to `F1-62` |
| `util` family (`Objects`, `Arrays`, parsing helpers, `Scanner`) | Tracked | Before Self-Host | `F1-63`, `F1-83` to `F1-85` |
| logging helper baseline | Tracked | Before Self-Host | `F1-105` |
| concurrency/threading/atomics/networking policy and baseline | Tracked | Before Self-Host for threading/atomics, After Self-Host for networking | `F1-86` to `F1-95` |
| conformance/docs/closure evidence | Tracked | Before Self-Host | `F1-65` to `F1-82` |

## Not Explicitly Tracked Yet

These are the main Java parity items that are either only implicit inside broad tasks or not named clearly enough on the board today.

### Before Self-Host

These should be made explicit somewhere before the compiler/runtime rewrite is considered complete.

| Area | Status | Phase | Recommendation |
|---|---|---|---|
| interface inheritance via `interface A extends B` | Tracked | Before Self-Host | `F1-96` |
| interface member parity policy (`default`, `static`, `private` methods) | Tracked | Before Self-Host | `F1-96` |
| inner/local/anonymous class policy | Done | Before Self-Host | `F1-98`; policy is now explicit: these remain fenced until after self-host |
| switch expressions and `yield` policy | Tracked | Before Self-Host | `F1-99` |
| local variable type inference (`var`) policy | Tracked | Before Self-Host | `F1-100` |
| varargs call/applicability hardening | Tracked | Before Self-Host | `F1-100` plus `F1-28` |
| annotation metadata policy (`@Target`, `@Retention`, minimum metadata contract) | Tracked | Before Self-Host | `F1-102` |
| stack trace quality and source-location surface | Tracked | Before Self-Host | `F1-101` |
| compiler-host utility requirements | Tracked | Before Self-Host | `F1-97` |
| resource loading policy for compiler/runtime assets | Tracked | Before Self-Host | `F1-97` |

### Complete Broader Java Parity Inventory

These items are not all required before self-host, but they should be visible in one place for your audit.

#### Core language and declaration families

| Area | Status | Phase | Notes |
|---|---|---|---|
| interface inheritance | Tracked | Before Self-Host | `F1-96`; `interface A extends B` |
| interface `default` methods | Tracked | Before Self-Host | `F1-96` |
| interface `private` methods | Tracked | Before Self-Host | `F1-96` |
| interface `static` methods parity | Tracked | Before Self-Host | `F1-96` |
| inner classes | Tracked | After Self-Host | Fenced by the `F1-98` policy until after self-host |
| local classes | Tracked | After Self-Host | Fenced by the `F1-98` policy until after self-host |
| anonymous classes | Tracked | After Self-Host | Fenced by the `F1-98` policy until after self-host |
| records | Not Explicitly Tracked | After Self-Host | Modern Java |
| sealed classes/interfaces | Not Explicitly Tracked | After Self-Host | Modern Java |
| permits clauses | Not Explicitly Tracked | After Self-Host | Modern Java |
| package annotations / `package-info` | Not Explicitly Tracked | After Self-Host | |
| module system / `module-info` | Not Explicitly Tracked | After Self-Host | Large platform feature |

#### Statements, expressions, and typing

| Area | Status | Phase | Notes |
|---|---|---|---|
| switch expressions | Tracked | Before Self-Host | `F1-99`; useful compiler ergonomics |
| `yield` | Tracked | Before Self-Host | `F1-99`; comes with switch expressions |
| `var` locals | Tracked | Before Self-Host | `F1-100` |
| text blocks `\"\"\" ... \"\"\"` | Not Explicitly Tracked | After Self-Host | Convenience feature |
| string templates / interpolation parity | Not Explicitly Tracked | After Self-Host | Modern Java direction |
| pattern matching for `instanceof` | Not Explicitly Tracked | After Self-Host | Modern Java |
| record patterns | Not Explicitly Tracked | After Self-Host | Modern Java |
| switch pattern matching | Not Explicitly Tracked | After Self-Host | Modern Java |
| primitive patterns in `instanceof` / `switch` | Not Explicitly Tracked | After Self-Host | JDK 25/26 preview line |
| unnamed patterns / variables policy | Not Explicitly Tracked | After Self-Host | If desired later |

#### Annotations and metadata

| Area | Status | Phase | Notes |
|---|---|---|---|
| `@Target` / target metadata | Tracked | Before Self-Host | `F1-102`; important once annotation processing grows |
| `@Retention` / runtime vs source retention policy | Tracked | Before Self-Host | `F1-102` |
| repeatable annotations | Not Explicitly Tracked | After Self-Host | |
| inherited/documented/deprecated/functional-interface annotations | Not Explicitly Tracked | After Self-Host | |
| runtime annotation reflection policy | Not Explicitly Tracked | After Self-Host | Depends on reflection story |

#### Exceptions and diagnostics

| Area | Status | Phase | Notes |
|---|---|---|---|
| checked vs unchecked exception typing | Tracked | Before Self-Host | Already on board |
| cause chaining | Tracked | Before Self-Host | `F1-46`; part of the required pre-self-host throwable contract |
| suppressed exceptions | Not Explicitly Tracked | After Self-Host | Java-close exception ergonomics |
| stack trace API / formatting quality | Tracked | Before Self-Host | `F1-101`; important for compiler/runtime debugging |
| assertion enable/disable policy | Not Explicitly Tracked | After Self-Host | If Java-close runtime switches are desired |

#### Core stdlib and utility families

| Area | Status | Phase | Notes |
|---|---|---|---|
| `Objects` | Tracked | Before Self-Host | Already on board implicitly |
| `Arrays` helpers | Tracked | Before Self-Host | Already on board implicitly |
| `Optional` | Not Explicitly Tracked | After Self-Host | Intentionally off the current pre-self-host board; revisit later only if a strong post-self-host use case appears |
| logging helpers | Tracked | Before Self-Host | `F1-105` |
| regex (`Pattern`, `Matcher`) | Not Explicitly Tracked | After Self-Host | |
| formatting (`String.format`, `Formatter`) | Not Explicitly Tracked | After Self-Host | |
| locale/i18n/collation policy | Not Explicitly Tracked | After Self-Host | |
| `BigInteger` / `BigDecimal` | Not Explicitly Tracked | After Self-Host | |
| richer parsing/tokenizing helpers | Tracked | Before Self-Host | Compiler-host useful |
| resource loading helpers | Tracked | Before Self-Host | `F1-97`; compiler/runtime assets may need them |
| console input / stdin | Tracked | Before Self-Host | `F1-104`; useful for interactive apps and direct runtime verification |

#### Collections and stream ecosystem

| Area | Status | Phase | Notes |
|---|---|---|---|
| iterator parity and fail-fast policy | Tracked | Before Self-Host | Already on board |
| utility collection algorithms (`Collections`) | Tracked | Before Self-Host or After | Already broadly implied |
| stream API (`java.util.stream`) | Not Explicitly Tracked | After Self-Host | Major separate ecosystem |
| spliterators / stream plumbing | Not Explicitly Tracked | After Self-Host | |

#### IO, runtime, and platform

| Area | Status | Phase | Notes |
|---|---|---|---|
| binary/text encoding policy | Tracked | Before Self-Host | Already on board |
| NIO/channels/buffers/watch service | Not Explicitly Tracked | After Self-Host | |
| process API breadth | Not Explicitly Tracked | After Self-Host | |
| classpath/module-path style loading policy | Not Explicitly Tracked | After Self-Host | |
| serialization/cloning policy | Not Explicitly Tracked | After Self-Host | |

#### Concurrency and networking

| Area | Status | Phase | Notes |
|---|---|---|---|
| threads/runnables/monitors/atomics | Tracked | Before Self-Host | Already on board |
| structured concurrency | Not Explicitly Tracked | After Self-Host | JDK 25/26 line item |
| scoped values | Not Explicitly Tracked | After Self-Host | JDK 25 |
| virtual threads policy | Not Explicitly Tracked | After Self-Host | If desired later |
| higher-level executors/futures model | Tracked | Before Self-Host | Broadly implied by concurrency tasks, but worth landing before self-host to make compiler/runtime transition less painful |
| sockets-first networking | Tracked | After Self-Host | Board has policy task |
| HTTP client / HTTP/3 | Not Explicitly Tracked | After Self-Host | JDK 26 platform feature line |

#### Reflection and dynamic runtime

| Area | Status | Phase | Notes |
|---|---|---|---|
| reflection-lite `Class` | Tracked | Before Self-Host | Already on board |
| full reflection/invocation | Not Explicitly Tracked | After Self-Host | Intentionally deferred |
| class loading | Not Explicitly Tracked | After Self-Host | |
| dynamic proxies / method handles / invokedynamic-like surface | Not Explicitly Tracked | After Self-Host | |

#### Modern Java 25/26 specific parity items

These come from current OpenJDK 25/26 release feature sets and are included here so they do not stay invisible in your audit.

| Area | Status | Phase | Notes |
|---|---|---|---|
| Module Import Declarations | Not Explicitly Tracked | After Self-Host | JDK 25 |
| Compact Source Files and Instance Main Methods | Not Explicitly Tracked | After Self-Host | JDK 25 |
| Flexible Constructor Bodies | Not Explicitly Tracked | After Self-Host | JDK 25 |
| Primitive Types in Patterns / `instanceof` / `switch` | Not Explicitly Tracked | After Self-Host | JDK 25/26 preview line |
| Structured Concurrency | Not Explicitly Tracked | After Self-Host | JDK 25/26 preview line |
| Scoped Values | Not Explicitly Tracked | After Self-Host | JDK 25 |
| HTTP/3 client support | Not Explicitly Tracked | After Self-Host | JDK 26 |

Modern JDK 25/26 feature references used for this section:
- OpenJDK JDK 25 feature list: https://openjdk.org/projects/jdk/25/
- OpenJDK JDK 26 feature list: https://openjdk.org/projects/jdk/26/

### After Self-Host

These are good parity targets, but they do not need to block the Aden rewrite of the compiler/runtime.

| Area | Status | Phase | Recommendation |
|---|---|---|---|
| text blocks `\"\"\" ... \"\"\"` | Not Explicitly Tracked | After Self-Host | Add as a lexer/parser/string-literal parity task later |
| modern string templates / interpolation parity | Not Explicitly Tracked | After Self-Host | Decide later; not needed for self-host |
| records | Not Explicitly Tracked | After Self-Host | Add as a post-self-host declaration family |
| sealed classes/interfaces and `permits` | Not Explicitly Tracked | After Self-Host | Add later if Java 17+ parity is desired |
| pattern matching for `instanceof` | Not Explicitly Tracked | After Self-Host | Add later |
| pattern matching in `switch` | Not Explicitly Tracked | After Self-Host | Add later |
| module system (`module-info`) | Not Explicitly Tracked | After Self-Host | Keep out of F1/self-host scope |
| package annotations / `package-info` | Not Explicitly Tracked | After Self-Host | Add later if annotation model needs it |
| full reflection/invocation | Not Explicitly Tracked | After Self-Host | Already intentionally deferred by policy |
| class loading / dynamic proxies / method handles / `invokedynamic` style features | Not Explicitly Tracked | After Self-Host | Post-self-host only |
| stream API (`java.util.stream`) | Not Explicitly Tracked | After Self-Host | Separate large parity workstream later |
| regex (`Pattern`, `Matcher`) | Not Explicitly Tracked | After Self-Host | Add as util/text work later |
| formatting (`String.format`, `Formatter`) | Not Explicitly Tracked | After Self-Host | Add later |
| `BigInteger` / `BigDecimal` | Not Explicitly Tracked | After Self-Host | Add later if compiler/runtime needs them |
| richer time/date API beyond `Instant` / `Duration` | Not Explicitly Tracked | After Self-Host | Add later |
| serialization / cloning policy | Not Explicitly Tracked | After Self-Host | Decide explicitly later |
| NIO/channels/buffers/file watching | Not Explicitly Tracked | After Self-Host | Add later |
| higher-level networking (`URL`, `URI`, HTTP clients/servers) | Not Explicitly Tracked | After Self-Host | Sockets-first can remain enough earlier |
| desktop UI (`awt`, `swing`, or Aden-native UI`) | Not Explicitly Tracked | After Self-Host | Already intentionally deferred by policy |

## Self-Host Readiness Answer

### Is there enough Java by the end of F to express the compiler and runtime in Aden completely?

`Yes, if the tracked F1 work is actually completed and the "Before Self-Host" gaps above are handled explicitly.`

The compiler/runtime rewrite does not require full Java parity. It requires:
- stable object model and core OOP
- real exceptions or an intentionally strong enough failure model
- useful generics story
- usable collections/maps/strings/builders
- useful file/path/io/util helpers
- enough declaration/expression/operator coverage to write a large compiler cleanly
- enough docs/conformance to trust the language while rewriting core infrastructure

In practice, the biggest remaining blockers are not things like text blocks or records. They are:
- generics hardening
- arrays/collections/util maturity
- exception model hardening
- enough compiler-host helper APIs
- enough stdlib/runtime stability that the rewritten compiler is not fighting the language

That is achievable within Phase F, but only if the board is treated as a hard closure contract rather than a baseline inventory.

### Is there enough by the end of F to expand reliably toward Java 25/26 parity?

`Yes for foundation, no for completion.`

By the end of F, if completed well, the project can have:
- a strong Java-close core language
- a usable stdlib foundation
- a self-hosted compiler/runtime platform
- a clear compatibility matrix

That is enough to expand reliably after self-host.

It is not enough to claim near-term parity with Java 25/26 because modern Java includes large additional areas:
- records
- sealed types
- pattern matching
- text blocks
- module system
- stream ecosystem
- modern concurrency features
- deeper reflection/invocation and class-loading machinery

## Recommended Next Board/Doc Actions

1. Keep working the reopened F1 chain starting with `F1-23`, `F1-26`, and `F1-28`.
2. Treat the `After Self-Host` list as the seed backlog for post-self-host Java parity work.

## Second Sweep: Implied Rewrite Dependencies

Question:
- is there any compiler/runtime rewrite dependency left that is only implied?

Current answer:
- no major dependency family is still only implied
- the remaining pre-self-host compiler/runtime rewrite dependencies are now explicitly represented on the board through:
  - `F1-96` interface inheritance/member policy
  - `F1-97` compiler-host utility/resource-loading surface
  - `F1-98` inner/local/anonymous class policy
  - `F1-99` switch-expression / `yield` policy
  - `F1-100` local `var` / varargs applicability policy
  - `F1-101` exception diagnostics and stack-trace hardening
  - `F1-102` annotation metadata policy

Residual risk:
- additional sub-tasks may still be discovered while implementing those board items
- but they should now land as child work inside explicit tracked areas rather than emerging as whole missing dependency families
