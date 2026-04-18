# aden.io.Files

Kind: ``class``

Source: ``stdlib/src/aden/io/Files.aden``

## Summary

Runtime-backed file helper for the current text-based IO model.

## Declaration

```aden
public final class Files
```

## Members

### ``private static void ensureStores()``

Initializes the runtime-backed file stores on first use.
Use this before any helper that relies on the in-memory file index.

### ``private static boolean isPresent(String path)``

Reports whether the supplied path is currently marked present.
Use this to distinguish live files from deleted tombstones.

### ``private static boolean isPresentDirectory(String path)``

Reports whether the supplied path is currently marked as a directory.
Use this to distinguish directories from ordinary file payload paths.

### ``private static void ensureParentDirectories(String path)``

Ensures that every parent directory segment for the supplied path exists.
Use this to keep file operations coherent with the current in-memory directory model.

### ``private static void ensureWritableFilePath(String path)``

Panics when the supplied path currently names a directory instead of a writable file slot.
Use this to keep file-write helpers from silently corrupting the directory model.

### ``public static boolean createParentDirectories(String path)``

Creates every parent directory segment for the supplied path when absent.
Use this before file writes when higher-level code wants an explicit mkdirs-for-parent step.

### ``private static void addTrackedPath(ArrayList<String> paths, String path)``

Adds one path to the supplied registry when it is not already present.
Use this to keep the in-memory file and directory listings deterministic.

### ``private static void removeTrackedPath(ArrayList<String> paths, String path)``

Removes one path from the supplied registry when present.
Use this to keep the in-memory file and directory listings coherent after deletes or moves.

### ``private static void touchPath(String path)``

Records a fresh last-modified timestamp for the supplied path.
Use this whenever the current in-memory file model mutates that path.

### ``private static void addDistinctPath(ArrayList<String> paths, String path)``

Adds one path to an output list when it is not already present.
Use this while merging in-memory and host-backed filesystem views.

### ``private static List<String> splitLines(String text)``

Splits one newline-delimited text payload into line entries.
Use this for host-backed directory listings returned through the intrinsic bridge.

### ``private static List<String> listHostChildren(String directoryPath)``

Returns the current direct host child paths under the supplied directory.
Use this to merge the real host filesystem view into higher-level IO helpers.

### ``private static void appendRecursiveChildren(ArrayList<String> out, String directoryPath)``

Appends every discovered descendant under the supplied directory into the output list.
Use this to build recursive host-backed and in-memory listings through one merged traversal.

### ``public static String readString(String path)``

Reads the string payload stored at the supplied path.
Use this for runtime-backed file reads in the current text-only model.

### ``public static String readStringOrDefault(String path, String fallback)``

Reads the string payload stored at the supplied path, or the fallback when absent.
Use this when optional text reads should not require a prior existence check.

### ``public static void writeString(String path, String value)``

Stores the supplied string payload at the given path.
Use this for runtime-backed file writes in the current text-only model.

### ``public static void appendString(String path, String value)``

Appends the supplied text to the payload at the given path.
Use this when extending a stored text file without replacing it.

### ``public static boolean exists(String path)``

Reports whether the supplied path exists in the runtime file index.
Use this before optional reads or writes that depend on prior existence.

### ``public static int size(String path)``

Returns the current text length for the supplied file path.
Use this for practical file-size checks in the current text-file baseline.

### ``public static boolean isFile(String path)``

Reports whether the supplied path currently stores a file payload.
Use this for Java-like file-versus-directory checks in the current IO baseline.

### ``public static boolean isDirectory(String path)``

Reports whether the supplied path currently stores a directory marker.
Use this for Java-like directory checks in the current IO baseline.

### ``public static boolean isEmpty(String path)``

Reports whether the supplied file or directory currently has no payload or children.
Use this for simple workspace/resource guards in the current runtime-backed IO baseline.

### ``public static boolean createDirectory(String path)``

Creates one directory marker when absent and reports whether it was newly created.
Use this for explicit directory creation in the current in-memory IO baseline.

### ``public static boolean createFile(String path)``

Creates one empty file payload when absent and reports whether it was newly created.
Use this for Java-like create-new-file flows in the current text-file baseline.

### ``public static boolean createFileWithParents(String path)``

Creates one empty file payload after ensuring its parent directories exist.
Use this for self-host/resource-generation flows that should not require a separate parent mkdir step.

### ``public static boolean createDirectories(String path)``

Creates the full parent directory chain when absent and reports whether anything changed.
Use this for mkdirs-style flows in the current in-memory IO baseline.

### ``public static String createTempFile(String prefix, String extension)``

Creates one fresh temp file path under the current `tmp` tree and returns the created path.
Use this for compiler/resource scratch output in the current runtime-backed IO baseline.

### ``public static String createTempDirectory(String prefix)``

Creates one fresh temp directory path under the current `tmp` tree and returns the created path.
Use this for compiler/resource scratch directory setup in the current runtime-backed IO baseline.

### ``public static boolean delete(String path)``

Removes the supplied path from the runtime-backed file index when present.
Use this for Java-like delete flows in the current text-file baseline.

### ``public static long lastModified(String path)``

Returns the stored last-modified timestamp for the supplied path, or `0L` when absent.
Use this for practical metadata checks in the current in-memory IO baseline.

### ``public static boolean touch(String path)``

Updates the stored last-modified timestamp for the supplied path when it exists.
Use this for explicit metadata refreshes in the current in-memory IO baseline.

### ``public static boolean deleteRecursive(String path)``

Removes the supplied path and every tracked descendant currently stored under it.
Use this for simple recursive cleanup in the current in-memory IO baseline.

### ``public static boolean copy(String sourcePath, String destinationPath)``

Copies the current text payload from one path to another when the source exists.
Use this for simple file duplication in the current text-file baseline.

### ``public static boolean move(String sourcePath, String destinationPath)``

Moves the current text payload from one path to another when the source exists.
Use this for simple rename or relocate flows in the current text-file baseline.

### ``public static boolean copyRecursive(String sourcePath, String destinationPath)``

Copies the supplied file or directory subtree into the destination path when the source exists.
Use this for simple recursive workspace/resource duplication in the current in-memory IO baseline.

### ``public static boolean moveRecursive(String sourcePath, String destinationPath)``

Moves the supplied file or directory subtree into the destination path when the source exists.
Use this for simple recursive workspace/resource relocation in the current in-memory IO baseline.

### ``public static List<String> list(String directoryPath)``

Returns the direct child paths currently stored under the supplied directory.
Use this for practical directory-enumeration flows in the current in-memory IO baseline.

### ``public static List<String> listRelative(String directoryPath)``

Returns the direct child paths currently stored under the supplied directory as relative child paths.
Use this for rooted one-level directory scans without repeating the base prefix in each result.

### ``public static List<String> listRecursive(String directoryPath)``

Returns every tracked file and directory path currently stored under the supplied directory subtree.
Use this for simple recursive resource or source-tree discovery in the current in-memory IO baseline.

### ``public static List<String> listRelativeRecursive(String directoryPath)``

Returns every tracked file and directory path currently stored under the supplied directory subtree as relative child paths.
Use this for source/resource tree scans that should stay rooted to one workspace-relative base.

### ``public static List<String> listFilesRecursive(String directoryPath)``

Returns every tracked file path currently stored under the supplied directory subtree.
Use this for simple recursive file-only discovery in the current in-memory IO baseline.

### ``public static List<String> listRelativeFilesRecursive(String directoryPath)``

Returns every tracked file path currently stored under the supplied directory subtree as relative child paths.
Use this for source/resource file discovery without repeating the root prefix in every result.

### ``public static List<String> listDirectoriesRecursive(String directoryPath)``

Returns every tracked directory path currently stored under the supplied directory subtree.
Use this for simple recursive directory-only discovery in the current in-memory IO baseline.

### ``public static List<String> listRelativeDirectoriesRecursive(String directoryPath)``

Returns every tracked directory path currently stored under the supplied directory subtree as relative child paths.
Use this for rooted directory scans without repeating the base prefix in every result.

### ``public static List<String> listFiles(String directoryPath)``

Returns the direct child file paths currently stored under the supplied directory.
Use this for simple file-only enumeration in the current in-memory IO baseline.

### ``public static List<String> listRelativeFiles(String directoryPath)``

Returns the direct child file paths currently stored under the supplied directory as relative child paths.
Use this for rooted one-level file scans without repeating the base prefix in each result.

### ``public static List<String> listDirectories(String directoryPath)``

Returns the direct child directory paths currently stored under the supplied directory.
Use this for simple directory-only enumeration in the current in-memory IO baseline.

### ``public static List<String> listRelativeDirectories(String directoryPath)``

Returns the direct child directory paths currently stored under the supplied directory as relative child paths.
Use this for rooted one-level directory scans without repeating the base prefix in each result.

### ``public static List<String> readLines(String path)``

Reads the current text payload as newline-delimited lines.
Use this for simple line-oriented text processing in the current IO baseline.

### ``public static void writeLines(String path, List<String> lines)``

Replaces the current file payload with the supplied newline-delimited lines.
Use this for simple line-oriented writes in the current IO baseline.

### ``public static void appendLines(String path, List<String> lines)``

Appends the supplied lines to the current file payload using newline separators.
Use this for simple line-oriented append flows in the current IO baseline.

### ``private static String joinLines(List<String> lines)``

Joins one line collection into a newline-delimited string payload.
Use this inside the current text-file IO helpers.
