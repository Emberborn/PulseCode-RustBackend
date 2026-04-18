# adk.project.ProjectLayout

Kind: ``class``

Source: ``stdlib/src/adk/project/ProjectLayout.aden``

## Summary

Value object that describes the core project layout roots used by privileged
authoring tools.

## Declaration

```aden
public final class ProjectLayout
```

## Members

### ``public ProjectLayout(String projectRoot, String mainAdenRoot, String mainResourcesRoot)``

Creates a project layout value with explicit roots.

### ``public static ProjectLayout defaults(String projectRoot)``

Creates a layout from project-relative defaults.

### ``public String projectRoot()``

Returns the project root.

### ``public String mainAdenRoot()``

Returns the main Aden source root.

### ``public String mainResourcesRoot()``

Returns the main resources root.

### ``public boolean equals(Object other)``

Compares two layout values.

### ``public int hashCode()``

Returns a stable value hash.

### ``public String toString()``

Returns a concise debug representation.
