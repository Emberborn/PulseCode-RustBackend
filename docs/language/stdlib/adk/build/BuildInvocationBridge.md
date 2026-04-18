# author.build.BuildInvocationBridge

Kind: ``class``

Source: ``stdlib/src/author/build/BuildInvocationBridge.aden``

## Summary

Machine-readable bridge formatting for BuildInvocation handoff back to the Rust bootstrap host.

## Declaration

```pulse
public final class BuildInvocationBridge
```

## Members

### ``public static String toBridgeText(BuildInvocation invocation)``

Renders one build invocation into a stable escaped key/value text format.
