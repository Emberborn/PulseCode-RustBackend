# adk.project.ProjectManifest

Kind: ``class``

Source: ``stdlib/src/adk/project/ProjectManifest.aden``

## Summary

Immutable manifest model that composes package identity, sources, build
layout, and adklib state.

## Declaration

```aden
public final class ProjectManifest
```

## Members

### ``public ProjectManifest(``

Creates one manifest value from explicit parts.

### ``public ProjectManifest(``

Creates one manifest value from explicit parts, including optional workspace and adklib models.

### ``public ProjectManifest(``

Creates one manifest value from explicit parts, including build and toolchain configuration models.

### ``public static ProjectManifest scaffold(String projectRoot, String packageName)``

Returns the scaffold-style default manifest model for one project root and package name.

### ``public ManifestPackage packageInfo()``

Returns the manifest package identity.

### ``public ProjectSources sources()``

Returns the project source layout.

### ``public BuildLayout build()``

Returns the build-output layout.

### ``public BuildConfig buildConfig()``

Returns the resolved build configuration.

### ``public WorkspaceManifest workspace()``

Returns the optional workspace model, or null when the project is not a workspace root.

### ``public AdklibConfig adklib()``

Returns the adklib configuration model.

### ``public ToolchainConfig toolchain()``

Returns the toolchain configuration model.

### ``public boolean adklibEnabled()``

Reports whether adklib is enabled for this manifest.

### ``public ProjectManifest withAdklibEnabled(boolean enabled)``

Returns a copy with adklib enablement changed.

### ``public ProjectManifest withWorkspace(WorkspaceManifest workspace)``

Returns a copy with the supplied workspace model.

### ``public boolean equals(Object other)``

Compares two manifest values.

### ``public int hashCode()``

Returns a stable manifest hash.

### ``public String toString()``

Returns a concise debug representation.
