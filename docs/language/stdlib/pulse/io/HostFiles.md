# pulse.io.HostFiles

Kind: ``class``

Source: ``stdlib/src/pulse/io/HostFiles.pulse``

## Summary

Public host-filesystem facade over the native intrinsic boundary.
Use this when code needs the real host filesystem instead of the runtime-backed `Files` overlay.

## Declaration

```pulse
public final class HostFiles
```

## Members

### ``public static String readAllText(String path)``

Reads the full host text payload at the supplied path.
Returns `null` when the host path is absent or unreadable through the current native backend.

### ``public static String readAllTextOrDefault(String path, String fallback)``

Reads the full host text payload at the supplied path, or the fallback when absent.
Use this for optional host reads that should not require a separate existence check.

### ``public static boolean writeAllText(String path, String text)``

Writes the supplied text payload onto the real host filesystem.
Parent directories are created when needed. Returns `true` when the native backend reports success.

### ``public static boolean exists(String path)``

Reports whether the supplied host path currently exists.
Use this for real host existence checks outside the runtime-backed `Files` overlay.

### ``public static boolean isFile(String path)``

Reports whether the supplied host path is a file.
Use this for real host file checks outside the runtime-backed `Files` overlay.

### ``public static boolean isDirectory(String path)``

Reports whether the supplied host path is a directory.
Use this for real host directory checks outside the runtime-backed `Files` overlay.

### ``public static boolean createDirectory(String path)``

Creates one host directory when absent and reports whether the native backend created it.
Returns `false` when the directory already exists or when creation fails.

### ``public static boolean createDirectories(String path)``

Creates the full host directory chain when absent and reports whether anything changed.
Use this for mkdirs-style host setup in tool, build, or user-facing code.

### ``public static boolean createParentDirectories(String path)``

Creates every host parent directory needed for the supplied path.
Returns `true` when any parent directory changed.

### ``public static List<String> listChildren(String directoryPath)``

Returns the direct child paths currently visible under the supplied host directory.
Use this for real host directory enumeration outside the runtime-backed `Files` overlay.
