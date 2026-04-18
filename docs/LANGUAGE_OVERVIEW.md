# Language Overview (Draft)

## Design Goals
- Familiar Java-like OOP feel without being Java-compatible.
- Strong static types.
- Garbage-collected memory model.
- Package/import module system.
- Great ergonomics for general software and game logic.

## Syntax Direction
- No `fn` keyword.
- Members are Java-style methods and fields.
- Access modifiers: `public`, `private`, `protected`.
- Additional modifiers: `static`, `async`.
- Entry point style: `public static void main()` or `public static void main(String[] args)`.

## Sample
```aden
package game.core;

import com.aden.lang.System;

class Player {
    private String name;
    private int health;

    public Player(String name) {
        this.name = name;
        this.health = 100;
    }

    public void damage(int amount) {
        this.health = this.health - amount;
    }
}

class Main {
    public static void main(String[] args) {
        Player player = new Player("Nova");
        player.damage(10);
        System.out.println(player.health);
    }
}
```

## Planned Core Features
- `class`, `interface`, `enum`.
- Java-style methods, constructors, and visibility modifiers.
- `static` and `async` modifiers.
- Generics (after baseline stability).

Primitive set (current draft): byte, short, int, long, float, double, char, boolean, void, plus unsigned ubyte, ushort, uint, ulong. String remains capitalized.

