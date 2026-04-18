# author.project.ManifestPackage

Kind: ``class``

Source: ``stdlib/src/author/project/ManifestPackage.pulse``

## Summary

Immutable manifest package identity for privileged authoring flows.

## Declaration

```pulse
public final class ManifestPackage
```

## Members

### ``public ManifestPackage(String name, String version)``

Creates one manifest package identity.

### ``public String name()``

Returns the manifest package name.

### ``public String version()``

Returns the manifest package version.

### ``public boolean equals(Object other)``

Compares package identities by name and version.

### ``public int hashCode()``

Returns a stable package identity hash.

### ``public String toString()``

Returns a concise debug representation.
