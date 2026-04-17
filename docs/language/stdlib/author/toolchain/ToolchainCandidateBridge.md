# author.toolchain.ToolchainCandidateBridge

Kind: ``class``

Source: ``stdlib/src/author/toolchain/ToolchainCandidateBridge.pulse``

## Summary

Bridge serializer for toolchain candidate plans.

## Declaration

```pulse
public final class ToolchainCandidateBridge
```

## Members

### ``public static String toBridgeText(ToolchainCandidatePlan plan)``

Renders one candidate plan into the current bridge transport format.
Use this when Rust bootstrap code needs the Pulse-owned candidate ordering as plain text.
