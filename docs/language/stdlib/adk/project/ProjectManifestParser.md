# adk.project.ProjectManifestParser

Kind: ``class``

Source: ``stdlib/src/adk/project/ProjectManifestParser.aden``

## Summary

Parses the current Aden project-manifest text format into reusable authoring models.

## Declaration

```aden
public final class ProjectManifestParser
```

## Members

### ``public ProjectManifestParser(String projectRoot)``

Creates one parser bound to the supplied project root.

### ``public String projectRoot()``

Returns the parser's project root.

### ``public ProjectManifest parse(String text)``

Parses one manifest text payload into the current adk.project model subset.

### ``public static WorkspaceManifest parseWorkspaceMembers(String value)``

Parses the current comma-separated workspace-members value.

### ``public static List<String> resolveWorkspaceMemberRoots(``

Resolves workspace member roots against the supplied workspace root without touching the filesystem.
