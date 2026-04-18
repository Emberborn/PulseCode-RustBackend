# AdenOS Target Direction

This document records the current AdenOS target direction used by the active planning spine.

It exists so Aden Lang has one explicit statement of what `adenos-x64` means after the Linux-backed direction was dropped.

## Core Direction

AdenOS is now planned as:

- its own operating-system target lane
- a AdenOS-owned platform/runtime surface
- a distinct target from generic `linux-x64`

That means AdenOS-specific kernel, loader, runtime-service, startup, filesystem, app-model, and publication decisions stay available to the project instead of being constrained by Linux-substrate assumptions.

## Target Meaning

The target split is now:

- `windows-x64`
  - Windows x64 target lane and current host/bootstrap execution lane
- `linux-x64`
  - generic Linux x64 target lane
- `adenos-x64`
  - AdenOS platform lane
  - distinct runtime/platform/kernel/loader contract

## AdenOS-Owned Platform Surface

`adenos-x64` remains distinct because AdenOS owns visible platform semantics such as:

- numbered-volume namespace such as `001:/`
- AdenOS path semantics
- AdenOS shell/session contract
- AdenOS-visible user/system layout
- AdenOS app index, identity, shortcut, and launcher model
- AdenOS compatibility policy for Linux apps and Windows apps
- AdenOS-facing service/control surfaces
- AdenOS package/install/update UX above the Linux substrate

Those are AdenOS target concerns and should remain owned by the AdenOS target contract itself.

## Planning Consequence For The Rebase

The rebase should now be read as:

- Windows x64 remains an immediate real target and the current host/bootstrap lane
- AdenOS remains an immediate target contract
- generic Linux product targeting is still later
- current Windows work must not erase the seams AdenOS, Linux, and macOS will need later

So the architecture must leave room for:

- one AdenOS platform target
- one generic Linux target
- one macOS target
- later implementation of each without another architecture rewrite

## Immediate Contract Consequence

Current requested-target AdenOS docs should now be interpreted as:

- AdenOS-visible runtime/service/startup/loading/publication contracts
- without claiming that the AdenOS adapter is already implemented today

## What This Does Not Claim Yet

This direction document does not claim that Aden Lang already has:

- a real Linux x64 adapter implementation
- a real AdenOS x64 adapter implementation
- a final AdenOS publication contract
- a final AdenOS startup/service ABI

It only changes the architectural truth those future contracts must fit.

## Locked Result

The planning spine is aligned with this direction only when:

- live rebase docs describe `adenos-x64` as its own target contract
- live rebase docs stop claiming AdenOS is Linux-backed
- live Windows-focused docs preserve the adapter/compiler boundaries needed for later AdenOS, Linux, and macOS work
- new agents can enter from the handoff without being told the outdated AdenOS story
