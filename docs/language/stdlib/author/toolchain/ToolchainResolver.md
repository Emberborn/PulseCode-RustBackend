# author.toolchain.ToolchainResolver

Kind: ``class``

Source: ``stdlib/src/author/toolchain/ToolchainResolver.pulse``

## Summary

Resolves effective toolchain configuration from manifest defaults and CLI-style overrides.

## Declaration

```pulse
public final class ToolchainResolver
```

## Members

### ``public static ToolchainConfig resolve(``

Returns the effective toolchain configuration where explicit overrides win over manifest values.

### ``public static ToolchainCandidatePlan planCandidates(``

Returns ordered linker/assembler candidate lists from host-provided discovery facts.

### ``public static ToolchainDiscoveryPlan planWindowsDiscovery()``

Returns the current Windows host-tool discovery graph that Rust should probe as a safety net.

### ``public static ToolchainCommandPlan planWindowsExecutableLinkCommand(``

Returns one Windows native executable link command shape.

### ``public static ToolchainCommandPlan planWindowsSharedRuntimeLinkCommand(``

Returns one Windows shared runtime-library link command shape.

### ``public static ToolchainCommandPlan planWindowsSharedAppLinkCommand(``

Returns one Windows shared-application executable link command shape.

### ``public static String renderResponseFileBody(List<String> arguments)``

Returns the quoted response-file body for the supplied ordered arguments.

### ``public static String responseFileArgument(String responseFilePath)``

Returns the command-line argument used to pass one response file to a Windows linker.

### ``public static ProcessEnvironment mergeEnvironment(``

Returns one inherited-environment plan merged with ordered overrides.

### ``public static ProcessPlan planResponseFileProcess(``

Returns one linker process plan that executes through one response file.

### ``public static ProcessPlan planWindowsMasmAssembleProcess(``

Returns one `ml64.exe` assemble process plan.
