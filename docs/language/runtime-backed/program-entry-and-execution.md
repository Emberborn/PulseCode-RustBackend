# Program Entry And Execution

This page documents the runtime-backed execution rules for Aden programs.

## Main Entry

Supported entry signatures:

```aden
public static void main() {
}
```

or

```aden
public static void main(String[] args) {
}
```

Exactly one valid entry point is required for executable builds.

## Bootstrap

Current native execution goes through a runtime/bootstrap path before user code runs.
That startup path is runtime-backed, not just parser or semantic sugar.

High-level shape:

- process entry
- runtime init
- application entry
- runtime shutdown
- process exit

## Output Modes

Executable output currently supports:

- `fat`
- `shared`

Those modes affect native publication and runtime layout, but not the source-level `main` contract.

## `System` Runtime Baseline

The current runtime-backed `System` baseline includes:

- `System.out` as the standard output stream
- `System.err` as the standard error stream
- `System.currentTimeMillis()` for Unix epoch millisecond timestamps
- `System.nanoTime()` for monotonic elapsed-time measurement
- `System.exit(int)` for explicit process termination

Current intentional omissions:

- property lookup APIs such as `System.getProperty(...)`
- environment lookup APIs such as `System.getenv(...)`
- richer process APIs beyond explicit exit

Those omissions are deferred until later F1/F2 work instead of being implied by the current `System` baseline.

## Related

- [Constructors](../compiler-backed/constructors.md)
- [Object Lifetime And GC](./object-lifetime-and-gc.md)
