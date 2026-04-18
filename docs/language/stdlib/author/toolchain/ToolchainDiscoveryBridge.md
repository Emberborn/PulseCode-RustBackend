# author.toolchain.ToolchainDiscoveryBridge

Kind: ``class``

Source: ``stdlib/src/author/toolchain/ToolchainDiscoveryBridge.pulse``

## Summary

Bridge serializer for toolchain discovery plans.

## Declaration

```pulse
public final class ToolchainDiscoveryBridge
```

## Members

### ``public static String toBridgeText(ToolchainDiscoveryPlan plan)``

Renders one discovery plan into the current bridge transport format.
Use this when Rust bootstrap code needs the Pulse-owned probe graph as plain text.
