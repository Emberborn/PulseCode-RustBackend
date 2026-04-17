# author.toolchain.ToolchainHostFilesystem

Kind: ``class``

Source: ``stdlib/src/author/toolchain/ToolchainHostFilesystem.pulse``

## Summary

Host-backed filesystem helpers used by toolchain execution while the backend is still bootstrapped.

## Declaration

```pulse
public final class ToolchainHostFilesystem
```

## Members

### ``public static String writeResponseFile(String responseFilePath, List<String> arguments)``

Renders and writes one response file on the real host filesystem.
Returns the normalized written path.
