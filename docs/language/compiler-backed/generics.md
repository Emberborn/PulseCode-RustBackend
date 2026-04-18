# Generics

This page documents the current F1 generics contract.

## Current F1 Contract

Pulse currently ships compile-time instantiated generics with an erased runtime.

That means:

- generic type parameters are supported on classes and interfaces
- generic type parameters are supported on methods
- type-use syntax such as `Box<String>` is supported in declarations and expressions
- generic arity is validated
- primitive generic arguments are rejected
- instantiated receiver/member typing is real at compile time
  - `Box<String>.get()` typechecks as `String`
  - `Box<String>.set(Object)` is rejected
  - simple generic method inference from call arguments is supported
- raw and instantiated forms of the same owner remain compatible through the current F1 erased model
- runtime lowering still erases instantiated generic owners and member storage to their raw/native shape

## Current Supported Forms

```pulse
class Box<T> {
    private T value;

    public void set(T value) {
        this.value = value;
    }

    public T get() {
        return this.value;
    }
}

class Main {
    public static <T> T id(T value) {
        return value;
    }

    public static void main() {
        Box<String> box = new Box();
        box.set("pulse");
        String text = box.get();
        String echoed = id(text);
    }
}
```

## Current Deliberate Limits

The shipped F1 contract is still narrower than full Java generics.

Not part of the current shipped F1 generics contract yet:

- bounds such as `<T extends X>`
- wildcards such as `List<?>` or `List<? extends X>`
- generic constructors
- runtime reified generics
- full Java generic applicability/inference rules
- collection-wide generic refactor

Those deeper semantic rules remain later work under the broader generic type-checking tasks.

## Runtime Shape

Current erasure rules:

- `Box<String>` lowers as raw `Box`
- generic field/method storage lowers through the erased native shape
- raw and instantiated forms of the same generic owner remain executable now without claiming reified runtime generics

## Related

- [Declarations And Modifiers](./declarations-and-modifiers.md)
- [Types And Conversions](./types-and-conversions.md)
