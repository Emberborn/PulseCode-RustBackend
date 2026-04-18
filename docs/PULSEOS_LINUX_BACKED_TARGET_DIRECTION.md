# PulseOS Target Direction

This document records the current PulseOS target direction used by the active planning spine.

It exists so PulseCode has one explicit statement of what `pulseos-x64` means after the Linux-backed direction was dropped.

## Core Direction

PulseOS is now planned as:

- its own operating-system target lane
- a PulseOS-owned platform/runtime surface
- a distinct target from generic `linux-x64`

That means PulseOS-specific kernel, loader, runtime-service, startup, filesystem, app-model, and publication decisions stay available to the project instead of being constrained by Linux-substrate assumptions.

## Target Meaning

The target split is now:

- `windows-x64`
  - Windows x64 target lane and current host/bootstrap execution lane
- `linux-x64`
  - generic Linux x64 target lane
- `pulseos-x64`
  - PulseOS platform lane
  - distinct runtime/platform/kernel/loader contract

## PulseOS-Owned Platform Surface

`pulseos-x64` remains distinct because PulseOS owns visible platform semantics such as:

- numbered-volume namespace such as `001:/`
- PulseOS path semantics
- PulseOS shell/session contract
- PulseOS-visible user/system layout
- PulseOS app index, identity, shortcut, and launcher model
- PulseOS compatibility policy for Linux apps and Windows apps
- PulseOS-facing service/control surfaces
- PulseOS package/install/update UX above the Linux substrate

Those are PulseOS target concerns and should remain owned by the PulseOS target contract itself.

## Planning Consequence For The Rebase

The rebase should now be read as:

- Windows x64 remains an immediate real target and the current host/bootstrap lane
- PulseOS remains an immediate target contract
- generic Linux product targeting is still later
- current Windows work must not erase the seams PulseOS, Linux, and macOS will need later

So the architecture must leave room for:

- one PulseOS platform target
- one generic Linux target
- one macOS target
- later implementation of each without another architecture rewrite

## Immediate Contract Consequence

Current requested-target PulseOS docs should now be interpreted as:

- PulseOS-visible runtime/service/startup/loading/publication contracts
- without claiming that the PulseOS adapter is already implemented today

## What This Does Not Claim Yet

This direction document does not claim that PulseCode already has:

- a real Linux x64 adapter implementation
- a real PulseOS x64 adapter implementation
- a final PulseOS publication contract
- a final PulseOS startup/service ABI

It only changes the architectural truth those future contracts must fit.

## Locked Result

The planning spine is aligned with this direction only when:

- live rebase docs describe `pulseos-x64` as its own target contract
- live rebase docs stop claiming PulseOS is Linux-backed
- live Windows-focused docs preserve the adapter/compiler boundaries needed for later PulseOS, Linux, and macOS work
- new agents can enter from the handoff without being told the outdated PulseOS story
