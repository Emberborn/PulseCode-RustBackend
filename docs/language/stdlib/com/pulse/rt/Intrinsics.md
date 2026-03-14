# com.pulse.rt.Intrinsics

Kind: ``class``

Source: ``stdlib/src/com/pulse/rt/Intrinsics.pulse``

## Summary

Compiler/runtime intrinsic surface implemented by the native backend.

## Declaration

```pulse
class Intrinsics
```

## Members

### ``public static void consoleWrite(String value)``

Writes a string without a trailing newline.
Use this for low-level console text output from runtime-backed code.

### ``public static void consoleWrite(int value)``

Writes an integer without a trailing newline.
Use this for low-level console numeric output from runtime-backed code.

### ``public static void consoleWrite(boolean value)``

Writes a boolean without a trailing newline.
Use this for low-level console boolean output from runtime-backed code.

### ``public static void consoleWriteLine(String value)``

Writes a string followed by a newline.
Use this for low-level line-oriented console output.

### ``public static void consoleWriteLine(int value)``

Writes an integer followed by a newline.
Use this for low-level line-oriented numeric console output.

### ``public static void consoleWriteLine(boolean value)``

Writes a boolean followed by a newline.
Use this for low-level line-oriented boolean console output.

### ``public static void panic(String message)``

Terminates execution with the supplied diagnostic message.
Use this for unrecoverable runtime failures.

### ``public static String stringConcat(String left, String right)``

Concatenates two strings and returns the combined result.
Use this when runtime-backed code needs immutable string composition.

### ``public static int stringLength(String value)``

Returns the character length of the supplied string.
Use this for runtime-backed string sizing.

### ``public static String intToString(int value)``

Converts an integer to its string form.
Use this when runtime-backed code needs numeric formatting.

### ``public static String booleanToString(boolean value)``

Converts a boolean to its string form.
Use this when runtime-backed code needs boolean formatting.

### ``public static int parseInt(String text)``

Parses text into an integer.
Use this for runtime-backed integer conversion.

### ``public static boolean parseBoolean(String text)``

Parses text into a boolean.
Use this for runtime-backed boolean conversion.

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
