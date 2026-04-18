# Lexer And Literals

This page documents the current compiler-backed token and literal baseline that the Aden Lang frontend recognizes before later F1 semantic/runtime slices land.

## Keyword Baseline

The lexer currently recognizes these F1-planned Java-close keywords even where later semantic/runtime support is still staged:

- `enum`
- `throw`
- `try`
- `catch`
- `finally`
- `assert`
- `new`

Recognizing a keyword in the lexer does not by itself mean the full language feature is already executable. F1 keeps the token surface and the end-to-end feature surface documented separately.

## Literal Baseline

The current literal/token surface includes:

- decimal integer literals
- long literals with `L` / `l`
- float literals with `F` / `f`
- double literals with `D` / `d` or decimal-point form
- hexadecimal integer literals (`0x2A`)
- binary integer literals (`0b101010`)
- octal integer literals (`052`)
- numeric underscore separators (`1_000`, `3.14_15F`)
- string escapes:
  - `\\`
  - `\"`
  - `\'`
  - `\n`
  - `\r`
  - `\t`
  - `\b`
  - `\f`
  - `\0`
  - `\uXXXX`
- char literal tokenization with the same escape subset

## Char Baseline

The current F1 baseline now supports:

- char literal tokenization
- char literal use in declarations and method-call arguments
- standard char escapes via the compiler-backed lexer

Broader char semantics such as full promotion behavior, array-heavy usage, and later generic/collection interactions are still part of the wider F1 type/runtime work rather than being implied complete by this token baseline alone.

## Future Syntax Tokens

The lexer now also recognizes punctuation needed by later F1 syntax families:

- `->`
- `::`
- `...`

These tokens are recognized early so later syntax slices can build on a stable token contract instead of reworking the lexer repeatedly.

## Invalid Literal Diagnostics

The lexer now fails deterministically for invalid Java-like literal forms such as:

- invalid numeric underscore placement
- invalid binary/octal digits
- unterminated char literals
- empty or oversized char literals
- invalid escape sequences in strings/chars

Those diagnostics are intentionally locked so later F1 work does not regress into vague token failures.
