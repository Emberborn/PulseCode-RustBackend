# pulse.rt.Intrinsics

Kind: ``class``

Source: ``stdlib/src/pulse/rt/Intrinsics.pulse``

## Summary

Compiler/runtime intrinsic surface implemented by the native backend.

## Declaration

```pulse
final class Intrinsics
```

## Members

### ``public static String consoleReadLine()``

Reads the next console line from standard input.
Returns `null` when end-of-input is reached before any bytes are read.

### ``public static void consoleWrite(String value)``

Writes a string without a trailing newline.
Use this for low-level console text output from runtime-backed code.

### ``public static void consoleErrorWrite(String value)``

Writes a string to the standard error stream without a trailing newline.
Use this for low-level diagnostic text output from runtime-backed code.

### ``public static void consoleWriteLine(String value)``

Writes a string followed by a newline.
Use this for low-level line-oriented console output.

### ``public static void consoleErrorWriteLine(String value)``

Writes a string followed by a newline to the standard error stream.
Use this for low-level diagnostic line output.

### ``public static void panic(String message)``

Terminates execution with the supplied diagnostic message.
Use this for unrecoverable runtime failures.

### ``public static String stringConcat(String left, String right)``

Compatibility string concatenation entrypoint for older runtime-backed callers.
Prefer `String.concat(...)` or normal string `+` in new code.

### ``public static int stringLength(String value)``

Compatibility string length entrypoint for older runtime-backed callers.
Prefer `String.length()` in new code.

### ``public static String objectClassName(Object value)``

Returns the runtime class name for the supplied object reference.
Use this when stdlib code needs honest class identity without full reflection.

### ``public static int objectHashCode(Object value)``

Returns a stable identity-style hash for the supplied object reference.
Use this for the default Object hash contract.

### ``public static long arrayNew(int length)``

Allocates a new array handle for the supplied length.
Use this when creating runtime-backed arrays.

### ``public static int arrayLength(long handle)``

Returns the length of the runtime-backed array handle.
Use this before indexed reads or writes against array storage.

### ``public static int arrayGetInt(long handle, int index)``

Reads an integer from the runtime-backed array handle.
Use this for primitive array access through the backend.

### ``public static void arraySetInt(long handle, int index, int value)``

Writes an integer into the runtime-backed array handle.
Use this for primitive array mutation through the backend.

### ``public static long arrayGetLong(long handle, int index)``

Reads a long value from the runtime-backed array handle.
Use this when array storage must preserve full 64-bit runtime handles or numeric payloads.

### ``public static void arraySetLong(long handle, int index, long value)``

Writes a long value into the runtime-backed array handle.
Use this when array storage must preserve full 64-bit runtime handles or numeric payloads.

### ``public static String arrayGetString(long handle, int index)``

Reads a string from the runtime-backed array handle.
Use this for text array access through the backend.

### ``public static void arraySetString(long handle, int index, String value)``

Writes a string into the runtime-backed array handle.
Use this for text array mutation through the backend.

### ``public static long listNew()``

Allocates a new runtime-backed list handle.
Use this when creating list-backed collection storage.

### ``public static int listSize(long handle)``

Returns the number of entries stored in the runtime-backed list handle.
Use this for list sizing and bounds checks.

### ``public static int listKind(long handle)``

Returns the active lane kind for the runtime-backed list handle.
Use this when stdlib code must distinguish the current int versus string list lane.

### ``public static void listClear(long handle)``

Removes all entries from the runtime-backed list handle.
Use this when resetting list storage for reuse.

### ``public static void listAddInt(long handle, int value)``

Appends an integer to the runtime-backed list handle.
Use this for primitive list writes through the backend.

### ``public static void listAddString(long handle, String value)``

Appends a string to the runtime-backed list handle.
Use this for text list writes through the backend.

### ``public static int listGetInt(long handle, int index)``

Reads an integer from the runtime-backed list handle.
Use this for primitive list access through the backend.

### ``public static String listGetString(long handle, int index)``

Reads a string from the runtime-backed list handle.
Use this for text list access through the backend.

### ``public static long mapNew()``

Allocates a new runtime-backed map handle.
Use this when creating string-keyed map storage.

### ``public static int mapSize(long handle)``

Returns the number of entries stored in the runtime-backed map handle.
Use this for map sizing and emptiness checks.

### ``public static void mapClear(long handle)``

Removes all entries from the runtime-backed map handle.
Use this when resetting map storage for reuse.

### ``public static boolean mapContainsKey(long handle, String key)``

Reports whether the supplied key exists in the runtime-backed map handle.
Use this before optional map reads.

### ``public static void mapPut(long handle, String key, String value)``

Stores a string value under the supplied key in the runtime-backed map handle.
Use this for text-valued map writes.

### ``public static void mapPutInt(long handle, String key, int value)``

Stores an integer value under the supplied key in the runtime-backed map handle.
Use this for integer-valued map writes.

### ``public static String mapGet(long handle, String key)``

Reads a string value from the runtime-backed map handle.
Use this for text-valued map reads.

### ``public static int mapGetInt(long handle, String key)``

Reads an integer value from the runtime-backed map handle.
Use this for integer-valued map reads.

### ``public static boolean hostExists(String path)``

Reports whether the supplied host path currently exists on the real filesystem.
Use this when privileged authoring or host-backed IO must inspect files outside the in-memory store.

### ``public static boolean hostIsFile(String path)``

Reports whether the supplied host path currently names a regular file on the real filesystem.
Use this when privileged authoring or host-backed IO must distinguish files from directories.

### ``public static boolean hostIsDirectory(String path)``

Reports whether the supplied host path currently names a directory on the real filesystem.
Use this when privileged authoring or host-backed IO must distinguish directories from files.

### ``public static String hostReadAllText(String path)``

Reads the full text contents of one host file from the real filesystem.
Returns `null` when the path does not currently resolve to a readable file.

### ``public static String hostListChildren(String path)``

Lists the direct child names under one host directory as newline-delimited text.
Returns the empty string when the path is absent, unreadable, or not a directory.

### ``public static boolean hostCreateDirectory(String path)``

Creates one host directory on the real filesystem.
Returns `true` when the path already exists as a directory or was created successfully.

### ``public static boolean hostWriteAllText(String path, String value)``

Writes one full text payload to the supplied host file path on the real filesystem.
Returns `true` when the file write succeeds.

### ``public static boolean hostCopyFile(String sourcePath, String destinationPath)``

Copies one host file from the source path to the destination path on the real filesystem.
Returns `true` when the file copy succeeds.

### ``public static long hostLoadDynamicLibrary(String source)``

Opens one dynamic library through the current host loader and returns the raw native handle.
Returns `0` when the host loader cannot open the requested library.

### ``public static boolean hostFreeDynamicLibrary(long handle)``

Releases one raw dynamic library handle through the current host loader.
Returns `true` when the host loader reports success.

### ``public static long hostResolveDynamicSymbol(long libraryHandle, String symbolName)``

Resolves one exported symbol from the supplied dynamic library handle.
Returns `0` when the handle is invalid or the symbol is absent.

### ``public static long hostCallNative0(long functionAddress)``

Calls one raw native function pointer with zero host-ABI long/pointer arguments.
Returns the raw 64-bit result value from the foreign implementation.

### ``public static long hostCallNative1(long functionAddress, long arg0)``

Calls one raw native function pointer with one host-ABI long/pointer argument.
Returns the raw 64-bit result value from the foreign implementation.

### ``public static long hostCallNative2(long functionAddress, long arg0, long arg1)``

Calls one raw native function pointer with two host-ABI long/pointer arguments.
Returns the raw 64-bit result value from the foreign implementation.

### ``public static long hostCallNative3(long functionAddress, long arg0, long arg1, long arg2)``

Calls one raw native function pointer with three host-ABI long/pointer arguments.
Returns the raw 64-bit result value from the foreign implementation.

### ``public static long hostCallNative4(``

Calls one raw native function pointer with four host-ABI long/pointer arguments.
Returns the raw 64-bit result value from the foreign implementation.

### ``public static int hostRunShellProcess(String workingDirectory, String commandLine)``

Executes one Windows shell command line under the supplied working directory.
Returns the process exit code, or `-1` when launch fails before an exit code is available.
