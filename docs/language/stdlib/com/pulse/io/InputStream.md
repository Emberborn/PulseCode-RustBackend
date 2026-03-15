# com.pulse.io.InputStream

Kind: ``class``

Source: ``stdlib/src/com/pulse/io/InputStream.pulse``

## Summary

Sequential text input facade backed by the current file helpers.

## Declaration

```pulse
class InputStream implements AutoCloseable
```

## Members

### ``public InputStream(String path)``

Creates an input stream bound to the supplied path.
Use this when file reads should be expressed as a stream object.

### ``public String readAll()``

Reads the full text payload for the bound path.
Use this for simple stream-style all-at-once reads.

### ``public void close()``

Closes the stream facade.
Use this for API compatibility; the current file-backed baseline does not hold a persistent native handle.
