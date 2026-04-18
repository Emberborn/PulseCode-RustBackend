# adk.project.AdklibConfig

Kind: ``class``

Source: ``stdlib/src/adk/project/AdklibConfig.aden``

## Summary

Immutable adklib enablement model for privileged project manifests.

## Declaration

```aden
public final class AdklibConfig
```

## Members

### ``public AdklibConfig(boolean enabled)``

Creates one adklib enablement value.

### ``public static AdklibConfig defaults()``

Returns the disabled adklib default.

### ``public boolean enabled()``

Reports whether adklib is enabled.

### ``public boolean equals(Object other)``

Compares adklib enablement values.

### ``public int hashCode()``

Returns a stable enablement hash.

### ``public String toString()``

Returns a concise debug representation.
