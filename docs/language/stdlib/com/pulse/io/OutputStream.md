# com.pulse.io.OutputStream

Kind: ``class``

Source: ``stdlib/src/com/pulse/io/OutputStream.pulse``

## Summary

Sequential text output facade backed by the current file helpers.

## Declaration

```pulse
class OutputStream
```

## Members

### ``public OutputStream(String path)``

Creates an output stream bound to the supplied path.
Use this when file writes should be expressed as a stream object.

### ``public void write(String text)``

Replaces the full text payload for the bound path.
Use this for simple stream-style overwrite writes.

### ``public void append(String text)``

Appends text to the payload for the bound path.
Use this for simple stream-style append writes.
