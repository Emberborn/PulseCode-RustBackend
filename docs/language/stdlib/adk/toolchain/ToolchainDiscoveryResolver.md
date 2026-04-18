# adk.toolchain.ToolchainDiscoveryResolver

Kind: ``class``

Source: ``stdlib/src/adk/toolchain/ToolchainDiscoveryResolver.aden``

## Summary

Resolves Windows host-tool discovery and candidate-order policy.

## Declaration

```aden
public final class ToolchainDiscoveryResolver
```

## Members

### ``public static ToolchainCandidatePlan planCandidates(``

Returns ordered linker/assembler candidate lists from host-provided discovery facts.

### ``public static ToolchainDiscoveryPlan planWindowsDiscovery()``

Returns the current Windows host-tool discovery graph that Rust should probe as a safety net.

### ``public static ToolchainDiscoveryResult probeWindowsDiscovery(ToolchainDiscoveryPlan plan)``

Probes the current host filesystem for Windows toolchain paths described by one discovery plan.
