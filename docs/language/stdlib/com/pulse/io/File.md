# com.pulse.io.File

Kind: ``class``

Source: ``stdlib/src/com/pulse/io/File.pulse``

## Summary

File-oriented facade for high-level text operations.

## Declaration

```pulse
class File
```

## Members

### ``public static String readAllText(String path)``

Reads the full text contents of the supplied path.
Use this for simple all-at-once text file reads.

### ``public static void writeAllText(String path, String text)``

Replaces the full text contents of the supplied path.
Use this for simple all-at-once text file writes.

### ``public static void appendText(String path, String text)``

Appends text to the supplied path.
Use this when extending an existing text file payload.

### ``public static boolean exists(String path)``

Reports whether the supplied path currently exists in the runtime file store.
Use this before optional reads or writes that depend on prior existence.
