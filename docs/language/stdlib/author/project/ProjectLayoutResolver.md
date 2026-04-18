# author.project.ProjectLayoutResolver

Kind: ``class``

Source: ``stdlib/src/author/project/ProjectLayoutResolver.pulse``

## Summary

Resolves common project, source, resource, and test roots from the current manifest model.

## Declaration

```pulse
public final class ProjectLayoutResolver
```

## Members

### ``public ProjectLayoutResolver(String projectRoot)``

Creates one resolver bound to the supplied project root.

### ``public String projectRoot()``

Returns the resolver's project root.

### ``public ProjectLayout projectLayout(ProjectManifest manifest)``

Returns the public project layout view for the supplied manifest.

### ``public String mainPulseRoot(ProjectManifest manifest)``

Returns the main Pulse source root for the supplied manifest.

### ``public String mainResourcesRoot(ProjectManifest manifest)``

Returns the main resources root for the supplied manifest.

### ``public String testPulseRoot(ProjectManifest manifest)``

Returns the test Pulse source root for the supplied manifest.

### ``public String testResourcesRoot(ProjectManifest manifest)``

Returns the test resources root for the supplied manifest.

### ``public String apiPulseRoot(ProjectManifest manifest)``

Returns the API Pulse source root for the supplied manifest.

### ``public String apiResourcesRoot(ProjectManifest manifest)``

Returns the API resources root for the supplied manifest.

### ``public String docsRoot(ProjectManifest manifest)``

Returns the docs root for the supplied manifest.

### ``public String librariesRoot(ProjectManifest manifest)``

Returns the libraries root for the supplied manifest.

### ``public String entryPath(ProjectManifest manifest)``

Returns the absolute entry path for the supplied manifest.

### ``public BuildLayout buildLayout(ProjectManifest manifest)``

Returns the build-output layout for the supplied manifest.
