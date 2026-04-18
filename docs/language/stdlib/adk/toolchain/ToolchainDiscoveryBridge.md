# adk.toolchain.ToolchainDiscoveryBridge

Kind: ``class``

Source: ``stdlib/src/adk/toolchain/ToolchainDiscoveryBridge.aden``

## Summary

Bridge serializer for toolchain discovery plans.

## Declaration

```aden
public final class ToolchainDiscoveryBridge
```

## Members

### ``public static String toBridgeText(ToolchainDiscoveryPlan plan)``

Renders one discovery plan into the current bridge transport format.
Use this when Rust bootstrap code needs the Aden-owned probe graph as plain text.
