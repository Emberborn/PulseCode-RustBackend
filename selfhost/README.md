# Pulse Selfhost Workspace

This workspace is the first real Pulse-side home for the compiler/runtime
programs that `F1-97` is bringing up.

Current members:

- `compiler0`
- `runtime0`

These are intentionally small scaffolds right now. The point is to keep the
future Pulse-owned compiler/runtime code in real Pulse projects that the
Rust-built `pulsec` can already `check`, `build`, and `test`.

Use the hidden Rust-bootstrap flag when you want the explicit provider-backed
selfhost path instead of the normal direct Rust compiler loop:

- `pulsec check --selfhost-provider --project-root selfhost`
- `pulsec build --selfhost-provider --project-root selfhost`
- `pulsec test --selfhost-provider --project-root selfhost`

This workspace is expected to grow in-place as the compiler/runtime program
lift continues.

Port structure rules are locked in:

- [docs/SELFHOST_PORTING_RULES.md](/G:/Programming/Rust/PulseCode/docs/SELFHOST_PORTING_RULES.md)
