# IO Text And Encoding

This page documents the current runtime-backed IO payload model.

## Current `F1-58` Shipped Baseline

Aden Lang currently ships a text-first IO model.

That means:

- `com.aden.io.Files`, `File`, `InputStream`, and `OutputStream` operate on `String` payloads, not byte buffers
- the current runtime-backed file store is text-backed and keeps file contents in one string payload per path
- stream cursor operations such as `position()`, `seek(...)`, `rewind(...)`, `skip(...)`, `length()`, `truncate()`, and `size(...)` are defined in terms of the current text payload length, not a byte count
- line-oriented helpers such as `readLines()`, `writeLines(...)`, `appendLines(...)`, and `readLine()` are part of the shipped baseline

## Current Encoding Contract

The current shipped F1 encoding contract is intentionally narrow:

- Aden IO consumes and produces already-formed Aden `String` values
- there is no user-selectable charset API in the current baseline
- there is no explicit UTF-8 / UTF-16 / ASCII encode-decode surface yet
- the current runtime/file model therefore behaves as text storage and text cursor movement, not as a byte-oriented transcoding API

In practice, the current contract is:

- if code already has a `String`, current IO APIs can store, append, read, and stream that text deterministically
- if code needs a byte-level encoding choice or round-trip through a concrete charset, that is not yet part of the shipped F1 surface

## Current Line Behavior

The current line helpers are deterministic:

- `writeLines(...)` and `appendLines(...)` join logical lines with `\n`
- `readLines()` and `InputStream.readLine()` split on `\n`
- a preceding `\r` before `\n` is trimmed on read, so `\r\n` is treated as one logical line ending
- missing files return empty-line collections or the documented fallback paths instead of implying a binary read failure model

## Current Binary Boundary

Not part of the current shipped baseline:

- `byte[]` file reads or writes
- raw binary streams
- charset objects or encoding-selection APIs
- mixed text/binary stream mode switching
- explicit BOM handling

Those remain later work. The current F1 IO contract should be read as text-first and line-oriented unless a later task adds real binary/encoding breadth explicitly.

## Related

- [Program Entry And Execution](./program-entry-and-execution.md)
- [Exceptions And Failure](./exceptions-and-failure.md)
- [com.aden.io.File](../stdlib/com/aden/io/File.md)
- [com.aden.io.Files](../stdlib/com/aden/io/Files.md)
- [com.aden.io.InputStream](../stdlib/com/aden/io/InputStream.md)
- [com.aden.io.OutputStream](../stdlib/com/aden/io/OutputStream.md)
