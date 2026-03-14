# Runtime-Backed Language Docs

This directory is the canonical home for language-facing documentation about PulseCode features
whose behavior is primarily implemented by the runtime/native backend rather than by a stdlib
class alone.

Examples:
- memory/runtime behavior
- exception/runtime execution strategy
- concurrency/runtime semantics
- other language features that require explicit runtime support but do not map to one stdlib class
- entry/bootstrap behavior
- null and runtime type behavior
- object lifetime and GC

Non-language operational docs should remain outside `docs/language/`.
