# author.toolchain.ToolchainDiscoveryResultBridge

Kind: ``class``

Source: ``stdlib/src/author/toolchain/ToolchainDiscoveryResultBridge.pulse``

## Summary

Bridge serializer for toolchain discovery results.

## Declaration

```pulse
public final class ToolchainDiscoveryResultBridge
```

## Members

### ``public static String toBridgeText(ToolchainDiscoveryResult result)``

Renders one discovery result into the current bridge transport format.
Use this when Rust bootstrap code needs the Pulse-owned probe result as plain text.
