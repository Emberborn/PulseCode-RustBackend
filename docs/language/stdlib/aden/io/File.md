# aden.io.File

Kind: ``class``

Source: ``stdlib/src/aden/io/File.aden``

## Summary

File-oriented facade for high-level text operations.

## Declaration

```aden
public final class File
```

## Members

### ``public static InputStream openInputStream(String path)``

Opens an input stream bound to the supplied path.
Use this for high-level resource creation when the caller wants an explicit stream lifecycle object.

### ``public static InputStream openInputStream(String path, int startPosition)``

Opens an input stream bound to the supplied path and initial cursor position.
Use this for high-level resource creation when sequential reads should begin from a known offset.

### ``public static OutputStream openOutputStream(String path)``

Opens an output stream bound to the supplied path.
Use this for high-level resource creation when the caller wants an explicit output lifecycle object.

### ``public static OutputStream openOutputStream(String path, boolean appendMode)``

Opens an output stream bound to the supplied path with explicit append-mode policy.
Use this for high-level resource creation when writes should either append or overwrite deterministically.

### ``public static String readAllText(String path)``

Reads the full text contents of the supplied path.
Use this for simple all-at-once text file reads.

### ``public static String readAllTextOrDefault(String path, String fallback)``

Reads the full text contents of the supplied path, or the fallback when absent.
Use this for optional all-at-once text reads that should not require a prior existence check.

### ``public static void writeAllText(String path, String text)``

Replaces the full text contents of the supplied path.
Use this for simple all-at-once text file writes.

### ``public static void appendText(String path, String text)``

Appends text to the supplied path.
Use this when extending an existing text file payload.

### ``public static boolean exists(String path)``

Reports whether the supplied path currently exists in the runtime file store.
Use this before optional reads or writes that depend on prior existence.

### ``public static boolean isFile(String path)``

Reports whether the supplied path currently stores a file payload.
Use this for simple file-versus-directory checks on the high-level facade.

### ``public static boolean isDirectory(String path)``

Reports whether the supplied path currently stores a directory marker.
Use this for simple directory checks on the high-level facade.

### ``public static boolean isEmpty(String path)``

Reports whether the supplied file or directory currently has no payload or children.
Use this for high-level emptiness checks on the current text-file and directory baseline.

### ``public static int size(String path)``

Returns the current text length for the supplied file path.
Use this for high-level file-size checks in the current text-file baseline.

### ``public static long lastModified(String path)``

Returns the stored last-modified timestamp for the supplied path, or `0L` when absent.
Use this for high-level metadata checks in the current text-file baseline.

### ``public static String name(String path)``

Returns the final name segment from the supplied path.
Use this for high-level file-name inspection without calling `Path` directly.

### ``public static String parent(String path)``

Returns the parent path portion from the supplied path.
Use this for high-level parent-path inspection without calling `Path` directly.

### ``public static String extension(String path)``

Returns the final extension without the dot from the supplied path.
Use this for high-level suffix/extension routing without calling `Path` directly.

### ``public static String stem(String path)``

Returns the final file name without its extension from the supplied path.
Use this for high-level stem extraction without calling `Path` directly.

### ``public static boolean mkdir(String path)``

Creates one directory marker when absent and reports whether it was newly created.
Use this for high-level single-directory creation without calling `Files` directly.

### ``public static boolean mkdirs(String path)``

Creates the full directory chain when absent and reports whether anything changed.
Use this for high-level mkdirs-style flows without calling `Files` directly.

### ``public static boolean delete(String path)``

Removes the supplied path from the current runtime file store when present.
Use this for Java-like delete flows in the current text-file baseline.

### ``public static boolean deleteRecursive(String path)``

Removes the supplied path and every tracked descendant currently stored under it.
Use this for high-level recursive cleanup in the current IO baseline.

### ``public static boolean copy(String sourcePath, String destinationPath)``

Copies the current text payload from one path to another when the source exists.
Use this for simple file duplication in the current text-file baseline.

### ``public static boolean move(String sourcePath, String destinationPath)``

Moves the current text payload from one path to another when the source exists.
Use this for simple rename or relocate flows in the current text-file baseline.

### ``public static boolean copyRecursive(String sourcePath, String destinationPath)``

Copies the supplied file or directory subtree into the destination path when the source exists.
Use this for high-level recursive duplication in the current IO baseline.

### ``public static boolean moveRecursive(String sourcePath, String destinationPath)``

Moves the supplied file or directory subtree into the destination path when the source exists.
Use this for high-level recursive relocation in the current IO baseline.

### ``public static boolean create(String path)``

Creates one empty file payload when absent and reports whether it was newly created.
Use this for Java-like create-new-file flows on the high-level file facade.

### ``public static boolean createWithParents(String path)``

Creates one empty file payload after ensuring its parent directories exist.
Use this for high-level scratch/output creation without a separate parent mkdir step.

### ``public static boolean createParentDirectories(String path)``

Creates every parent directory segment for the supplied path when absent.
Use this for high-level output preparation without calling `Files` directly.

### ``public static boolean touch(String path)``

Updates the stored last-modified timestamp for the supplied path when it exists.
Use this for high-level metadata refreshes in the current IO baseline.

### ``public static String createTempFile(String prefix, String extension)``

Creates one fresh temp file path under the current `tmp` tree and returns the created path.
Use this for high-level scratch-file creation in the current runtime-backed IO baseline.

### ``public static String createTempDirectory(String prefix)``

Creates one fresh temp directory path under the current `tmp` tree and returns the created path.
Use this for high-level scratch-directory creation in the current runtime-backed IO baseline.

### ``public static List<String> readAllLines(String path)``

Reads the current text payload as newline-delimited lines.
Use this for simple line-oriented reads on the high-level file facade.

### ``public static void writeAllLines(String path, List<String> lines)``

Replaces the current file payload with the supplied lines.
Use this for simple line-oriented writes on the high-level file facade.

### ``public static void appendLines(String path, List<String> lines)``

Appends the supplied lines to the current file payload.
Use this for simple line-oriented append flows on the high-level file facade.

### ``public static List<String> list(String path)``

Returns the direct child paths currently stored under the supplied directory.
Use this for high-level directory-enumeration flows in the current IO baseline.

### ``public static List<String> listRelative(String path)``

Returns the direct child paths currently stored under the supplied directory as relative child paths.
Use this for high-level rooted one-level directory scans without repeating the base prefix in each result.

### ``public static List<String> listRecursive(String path)``

Returns every tracked file and directory path currently stored under the supplied directory subtree.
Use this for high-level recursive directory-enumeration flows in the current IO baseline.

### ``public static List<String> listRelativeRecursive(String path)``

Returns every tracked file and directory path currently stored under the supplied directory subtree as relative child paths.
Use this for high-level rooted tree scans without repeating the base prefix in each result.

### ``public static List<String> listFilesRecursive(String path)``

Returns every tracked file path currently stored under the supplied directory subtree.
Use this for high-level recursive file-only discovery in the current IO baseline.

### ``public static List<String> listRelativeFilesRecursive(String path)``

Returns every tracked file path currently stored under the supplied directory subtree as relative child paths.
Use this for high-level rooted file scans without repeating the base prefix in each result.

### ``public static List<String> listDirectoriesRecursive(String path)``

Returns every tracked directory path currently stored under the supplied directory subtree.
Use this for high-level recursive directory-only discovery in the current IO baseline.

### ``public static List<String> listRelativeDirectoriesRecursive(String path)``

Returns every tracked directory path currently stored under the supplied directory subtree as relative child paths.
Use this for high-level rooted directory scans without repeating the base prefix in each result.

### ``public static List<String> listFiles(String path)``

Returns the direct child file paths currently stored under the supplied directory.
Use this for high-level file-only enumeration in the current IO baseline.

### ``public static List<String> listRelativeFiles(String path)``

Returns the direct child file paths currently stored under the supplied directory as relative child paths.
Use this for high-level rooted one-level file scans without repeating the base prefix in each result.

### ``public static List<String> listDirectories(String path)``

Returns the direct child directory paths currently stored under the supplied directory.
Use this for high-level directory-only enumeration in the current IO baseline.

### ``public static List<String> listRelativeDirectories(String path)``

Returns the direct child directory paths currently stored under the supplied directory as relative child paths.
Use this for high-level rooted one-level directory scans without repeating the base prefix in each result.
