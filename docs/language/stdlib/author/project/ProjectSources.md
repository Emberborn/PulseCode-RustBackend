# author.project.ProjectSources

Kind: ``class``

Source: ``stdlib/src/author/project/ProjectSources.pulse``

## Summary

Immutable source and resource layout contract for one Pulse project.

## Declaration

```pulse
public final class ProjectSources
```

## Members

### ``public ProjectSources(``

Creates one explicit project source layout.

### ``public static ProjectSources defaults(String projectRoot)``

Returns the scaffold-style default source layout for one project root.

### ``public String mainPulseRoot()``

Returns the main Pulse source root.

### ``public String mainResourcesRoot()``

Returns the main resources root.

### ``public String testPulseRoot()``

Returns the test Pulse source root.

### ``public String testResourcesRoot()``

Returns the test resources root.

### ``public String apiPulseRoot()``

Returns the API Pulse source root.

### ``public String apiResourcesRoot()``

Returns the API resources root.

### ``public String docsRoot()``

Returns the docs root.

### ``public String librariesRoot()``

Returns the libraries root.

### ``public String entry()``

Returns the source-root-relative entry path.

### ``public boolean equals(Object other)``

Compares two project source layouts.

### ``public int hashCode()``

Returns a stable source-layout hash.

### ``public String toString()``

Returns a concise debug representation.
