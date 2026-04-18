# adk.toolchain.ToolchainCandidateBridge

Kind: ``class``

Source: ``stdlib/src/adk/toolchain/ToolchainCandidateBridge.aden``

## Summary

Bridge serializer for toolchain candidate plans.

## Declaration

```aden
public final class ToolchainCandidateBridge
```

## Members

### ``public static String toBridgeText(ToolchainCandidatePlan plan)``

Renders one candidate plan into the current bridge transport format.
Use this when Rust bootstrap code needs the Aden-owned candidate ordering as plain text.
