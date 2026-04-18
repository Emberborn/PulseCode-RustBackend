# aden.util.StringTokenizer

Kind: ``class``

Source: ``stdlib/src/aden/util/StringTokenizer.aden``

## Summary

Lightweight delimiter-based tokenizer for practical pre-Scanner text parsing.

## Declaration

```aden
public final class StringTokenizer
```

## Members

### ``public StringTokenizer(String source, String delimiter)``

Creates a tokenizer over the supplied text using the supplied delimiter text.
Use this when code needs deterministic token stepping without pulling in `Scanner` yet.

### ``public boolean hasMoreTokens()``

Reports whether another token is available.
Use this before `nextToken()` when code wants explicit cursor checks.

### ``public String nextToken()``

Returns the next token using the current delimiter.
Use this for deterministic left-to-right token stepping.

### ``public String nextToken(String delimiter)``

Returns the next token using a replacement delimiter for this and subsequent calls.
Use this when token stepping needs to switch separators mid-stream.

### ``public String remainingText()``

Returns the remaining unconsumed text after the current cursor.
Use this when higher-level parsing wants to inspect the tail without consuming token-by-token.

### ``public int countTokens()``

Counts the remaining tokens from the current cursor without mutating tokenizer state.
Use this when code needs predictable token cardinality before consuming.
