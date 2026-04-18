# adk.toolchain.ToolchainDiscoveryResultBridge

Kind: ``class``

Source: ``stdlib/src/adk/toolchain/ToolchainDiscoveryResultBridge.aden``

## Summary

Bridge serializer for toolchain discovery results.

## Declaration

```aden
public final class ToolchainDiscoveryResultBridge
```

## Members

### ``public static String toBridgeText(ToolchainDiscoveryResult result)``

Renders one discovery result into the current bridge transport format.
Use this when Rust bootstrap code needs the Aden-owned probe result as plain text.
