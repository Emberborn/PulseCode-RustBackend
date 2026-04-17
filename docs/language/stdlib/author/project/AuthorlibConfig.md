# author.project.AuthorlibConfig

Kind: ``class``

Source: ``stdlib/src/author/project/AuthorlibConfig.pulse``

## Summary

Immutable authorlib enablement model for privileged project manifests.

## Declaration

```pulse
public final class AuthorlibConfig
```

## Members

### ``public AuthorlibConfig(boolean enabled)``

Creates one authorlib enablement value.

### ``public static AuthorlibConfig defaults()``

Returns the disabled authorlib default.

### ``public boolean enabled()``

Reports whether authorlib is enabled.

### ``public boolean equals(Object other)``

Compares authorlib enablement values.

### ``public int hashCode()``

Returns a stable enablement hash.

### ``public String toString()``

Returns a concise debug representation.
