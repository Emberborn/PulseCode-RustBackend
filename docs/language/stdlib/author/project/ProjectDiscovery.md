# author.project.ProjectDiscovery

Kind: ``class``

Source: ``stdlib/src/author/project/ProjectDiscovery.pulse``

## Summary

Filesystem-backed project and workspace discovery helpers for privileged authoring flows.

## Declaration

```pulse
public final class ProjectDiscovery
```

## Members

### ``public static String findManifestPath(String startPath)``

Finds the nearest manifest path at or above the supplied start path, or null when none exists.

### ``public static String findProjectRoot(String startPath)``

Finds the nearest project root at or above the supplied start path, or null when no manifest exists.

### ``public static ProjectManifest loadManifest(String manifestPath)``

Loads one manifest file into the current author.project model surface.

### ``public static ProjectManifest findAndLoadManifest(String startPath)``

Finds and loads the nearest manifest at or above the supplied start path, or null when none exists.

### ``public static WorkspaceContext resolveWorkspaceContext(String startPath)``

Resolves one workspace context rooted at the nearest manifest above the supplied start path.

### ``public static List<String> resolveWorkspaceMemberProjectRoots(``

Resolves workspace member project roots against the filesystem-backed manifest contract.

### ``public static String discoverEntryPath(String sourceRoot)``

Discovers the entry file under the supplied source root using the current CLI policy.

### ``public static List<String> discoverPulseFiles(String rootPath)``

Discovers every Pulse source file under the supplied root in stable path order.

### ``public static List<String> discoverTestFiles(String testsRoot)``

Discovers every Pulse test file under the supplied tests root in stable path order.
