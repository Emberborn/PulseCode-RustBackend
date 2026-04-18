# author.build.BuildLayout

Kind: ``class``

Source: ``stdlib/src/author/build/BuildLayout.aden``

## Summary

Immutable build-output layout contract for privileged authoring tools.

## Declaration

```pulse
public final class BuildLayout
```

## Members

### ``public BuildLayout(``

Creates one explicit build layout.

### ``public static BuildLayout defaults(String projectRoot)``

Returns the scaffold-style default build layout for one project root.

### ``public String buildRoot()``

Returns the build root.

### ``public String asmRoot()``

Returns the assembly-output root.

### ``public String generatedRoot()``

Returns the generated-object root.

### ``public String assetsRoot()``

Returns the copied-assets root.

### ``public String sanityRoot()``

Returns the sanity-copy root.

### ``public String tmpRoot()``

Returns the temporary working root.

### ``public String distroRoot()``

Returns the distribution root.

### ``public boolean equals(Object other)``

Compares two build layouts.

### ``public int hashCode()``

Returns a stable build-layout hash.

### ``public String toString()``

Returns a concise debug representation.
