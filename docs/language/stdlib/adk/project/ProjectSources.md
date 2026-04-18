# adk.project.ProjectSources

Kind: ``class``

Source: ``stdlib/src/adk/project/ProjectSources.aden``

## Summary

Immutable source and resource layout contract for one Aden project.

## Declaration

```aden
public final class ProjectSources
```

## Members

### ``public ProjectSources(``

Creates one explicit project source layout.

### ``public static ProjectSources defaults(String projectRoot)``

Returns the scaffold-style default source layout for one project root.

### ``public String mainAdenRoot()``

Returns the main Aden source root.

### ``public String mainResourcesRoot()``

Returns the main resources root.

### ``public String testAdenRoot()``

Returns the test Aden source root.

### ``public String testResourcesRoot()``

Returns the test resources root.

### ``public String apiAdenRoot()``

Returns the API Aden source root.

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
