# adk.project.ProjectLayoutResolver

Kind: ``class``

Source: ``stdlib/src/adk/project/ProjectLayoutResolver.aden``

## Summary

Resolves common project, source, resource, and test roots from the current manifest model.

## Declaration

```aden
public final class ProjectLayoutResolver
```

## Members

### ``public ProjectLayoutResolver(String projectRoot)``

Creates one resolver bound to the supplied project root.

### ``public String projectRoot()``

Returns the resolver's project root.

### ``public ProjectLayout projectLayout(ProjectManifest manifest)``

Returns the public project layout view for the supplied manifest.

### ``public String mainAdenRoot(ProjectManifest manifest)``

Returns the main Aden source root for the supplied manifest.

### ``public String mainResourcesRoot(ProjectManifest manifest)``

Returns the main resources root for the supplied manifest.

### ``public String testAdenRoot(ProjectManifest manifest)``

Returns the test Aden source root for the supplied manifest.

### ``public String testResourcesRoot(ProjectManifest manifest)``

Returns the test resources root for the supplied manifest.

### ``public String apiAdenRoot(ProjectManifest manifest)``

Returns the API Aden source root for the supplied manifest.

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
