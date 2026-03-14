# Program Entry And Execution

This page documents the runtime-backed execution rules for Pulse programs.

## Main Entry

Supported entry signatures:

```pulse
public static void main() {
}
```

or

```pulse
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

## Related

- [Constructors](../compiler-backed/constructors.md)
- [Object Lifetime And GC](./object-lifetime-and-gc.md)
