# com.pulse.io.Files

Kind: ``class``

Source: ``stdlib/src/com/pulse/io/Files.pulse``

## Summary

Runtime-backed file helper for the current text-based IO model.

## Declaration

```pulse
class Files
```

## Members

### ``public static String readString(String path)``

Reads the string payload stored at the supplied path.
Use this for runtime-backed file reads in the current text-only model.

### ``public static void writeString(String path, String value)``

Stores the supplied string payload at the given path.
Use this for runtime-backed file writes in the current text-only model.

### ``public static void appendString(String path, String value)``

Appends the supplied text to the payload at the given path.
Use this when extending a stored text file without replacing it.

### ``public static boolean exists(String path)``

Reports whether the supplied path exists in the runtime file index.
Use this before optional reads or writes that depend on prior existence.
