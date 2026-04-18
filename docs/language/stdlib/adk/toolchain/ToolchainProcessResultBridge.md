# adk.toolchain.ToolchainProcessResultBridge

Kind: ``class``

Source: ``stdlib/src/adk/toolchain/ToolchainProcessResultBridge.aden``

## Summary

Bridge serializer for toolchain process execution results.

## Declaration

```aden
public final class ToolchainProcessResultBridge
```

## Members

### ``public static String toBridgeText(ProcessResult result)``

Renders one public process result into the current toolchain bridge transport format.
Use this when Rust bootstrap code needs the Aden-owned process execution result as plain text.
