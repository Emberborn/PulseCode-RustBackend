# Aden

Aden is a new general-purpose, object-oriented language with strong typing, automatic memory handling, packages/imports, and game-focused standard capabilities.

> **A note on language projects**
>
> Language projects are difficult, and most don't make it to self-hosting or self-sustaining.
> I wanted to acknowledge those efforts, because every attempt helped move things forward.

## Long-term Goal
Aden becomes fully standalone and self-hosted:
1. Aden compiler/runtime initially bootstrapped in Rust.
2. Aden compiler rewritten in Aden.
3. Aden toolchain ships as native binaries and installer packages.

## Phase 1 (Bootstrapping)
- `adenc-core`: lexer/parser/AST + semantic checks.
- `adenc`: CLI (`check`, `build`).
- Initial backend target: native executable via LLVM in later milestones.

## Current Status
This repository now includes:
- Modularized frontend (`lexer`, `parser`, `semantics`) in `adenc-core`.
- Method-body parsing + semantic type checking.
- Control flow (`if/while/for`) and loop control (`break/continue`).
- Operator typing and method call signature matching by argument types.
- CLI `check` command and test suite.

## Documentation
- `docs/IMPLEMENTATION_HANDOFF.md` (detailed implementation inventory)
- `docs/LANGUAGE_GUIDE.md` (how to use language today)
- `docs/STANDALONE_ROADMAP.md` (full standalone plan)
- `docs/CODEX_HANDOFF_PROMPT.md` (prompt pack for new Codex session)

## Quick Start
1. Install Rust (stable).
2. Create a source root like `examples/src/app/core/Main.aden` with:

```aden
package app.core;

import aden.lang.IO;

class Main {
    public static void main(String[] args) {
        IO.println("Aden online");
    }
}
```

3. Run:

```bash
cargo run -p adenc --bin aden -- check examples/src/app/core/Main.aden --strict-package --source-root examples/src
```

## Project Layout
- `crates/adenc-core`: language front-end core.
- `crates/adenc-cli`: command-line compiler driver.
- `docs/`: language and roadmap docs.

