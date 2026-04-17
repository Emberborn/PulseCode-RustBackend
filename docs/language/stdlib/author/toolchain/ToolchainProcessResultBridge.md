# author.toolchain.ToolchainProcessResultBridge

Kind: ``class``

Source: ``stdlib/src/author/toolchain/ToolchainProcessResultBridge.pulse``

## Summary

Bridge serializer for toolchain process execution results.

## Declaration

```pulse
public final class ToolchainProcessResultBridge
```

## Members

### ``public static String toBridgeText(ProcessResult result)``

Renders one public process result into the current toolchain bridge transport format.
Use this when Rust bootstrap code needs the Pulse-owned process execution result as plain text.
