# author.project.WorkspaceManifest

Kind: ``class``

Source: ``stdlib/src/author/project/WorkspaceManifest.pulse``

## Summary

Immutable workspace-member model for privileged project manifests.

## Declaration

```pulse
public final class WorkspaceManifest
```

## Members

### ``public WorkspaceManifest(List<String> members)``

Creates one workspace model from the supplied member roots.

### ``public WorkspaceManifest()``

Creates an empty workspace model.

### ``public boolean isEmpty()``

Returns whether the workspace currently has any member roots.

### ``public int size()``

Returns the number of distinct workspace members.

### ``public String member(int index)``

Returns the member root at the supplied index.

### ``public List<String> members()``

Returns a stable copy of the current member roots.

### ``public WorkspaceManifest withMember(String member)``

Returns a copy with one additional member root when not already present.

### ``public boolean contains(String member)``

Reports whether the supplied member root exists in the workspace.

### ``public boolean equals(Object other)``

Compares workspace models by ordered distinct member roots.

### ``public int hashCode()``

Returns a stable workspace hash.

### ``public String toString()``

Returns a concise debug representation.
