# pulse.io.Path

Kind: ``class``

Source: ``stdlib/src/pulse/io/Path.pulse``

## Summary

Path helper facade for simple path composition and inspection.

## Declaration

```pulse
public final class Path
```

## Members

### ``public static String separator()``

Returns the current path separator for the runtime-backed path model.
Use this when code needs the canonical separator without hardcoding it.

### ``public static String normalize(String value)``

Normalizes one path string to the current forward-slash baseline.
Use this before path composition or comparison in the current runtime model.

### ``public static String combine(String left, String right)``

Joins two path segments with a forward slash.
Use this for simple runtime path composition in the current path model.

### ``public static String resolve(String parent, String child)``

Resolves one child path against the supplied parent path.
Use this as the Java-like alias for simple path composition in the current runtime model.

### ``public static String fileName(String value)``

Returns the final path segment from the supplied path.
Use this for simple file-name inspection in the current path model.

### ``public static String parent(String value)``

Returns the parent path portion, or the empty string when no parent exists.
Use this for simple parent-path inspection in the current path model.

### ``public static String extension(String value)``

Returns the final extension without the dot, or the empty string when none exists.
Use this for simple suffix/extension routing in the current path model.

### ``public static boolean hasExtension(String value)``

Reports whether the supplied path currently ends with a file extension.
Use this for simple suffix-routing checks in the current path model.

### ``public static String stem(String value)``

Returns the file name without its final extension, or the full name when no extension exists.
Use this for simple stem extraction in the current path model.

### ``public static String resolveSibling(String value, String sibling)``

Resolves a sibling path against the parent of the supplied path.
Use this for rename/adjacent-file flows in the current path model.

### ``public static String changeFileName(String value, String fileName)``

Returns the supplied path with its final name segment replaced.
Use this for simple adjacent-artifact renaming without manual parent slicing.

### ``public static boolean isAbsolute(String value)``

Reports whether the supplied path is rooted at the current forward-slash baseline.
Use this for simple absolute-versus-relative path checks in the current runtime model.

### ``public static String root(String value)``

Returns the current root portion for the supplied path, or the empty string when relative.
Use this for simple rooted-path reporting in the current path model.

### ``public static String relativeTo(String base, String value)``

Returns the path relative to the supplied base when the base is a prefix, otherwise the normalized path.
Use this for simple resource-tree and workspace-relative reporting in the current path model.

### ``public static String changeExtension(String value, String extension)``

Returns the supplied path with its final extension replaced, added, or removed.
Use this for simple sibling-artifact naming in the current path model.

### ``public static List<String> parts(String value)``

Returns the normalized path split into non-empty segments.
Use this for resource-loading and tree-walking code that needs path components without manual slicing.

### ``public static String join(List<String> parts)``

Joins one list of path segments into the current normalized path form.
Use this when code already works in segment lists and needs a concrete path string.

### ``public static int depth(String value)``

Returns the number of non-empty path segments in the supplied path.
Use this for simple depth checks in the current path model.

### ``public static boolean startsWithPath(String base, String value)``

Reports whether the supplied path is equal to or nested under the supplied base path.
Use this for simple subtree containment checks in the current path model.

### ``public static boolean endsWithPath(String suffix, String value)``

Reports whether the supplied path is equal to or ends with the supplied suffix path at a segment boundary.
Use this for package/resource tail checks without relying on raw string suffix matching.

### ``public static String commonParent(String left, String right)``

Returns the deepest shared parent path between two supplied paths, or the empty string when none exists.
Use this for simple workspace/resource ancestry checks in the current path model.

### ``public static String childPath(String base, String value)``

Returns the descendant suffix under the supplied base path, or the empty string when equal or not nested.
Use this for resource-tree mapping without manual prefix math.
