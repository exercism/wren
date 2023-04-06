# About Wren

Wren is a small, fast, class-based concurrent scripting language.   Think
Smalltalk in a Lua-sized package with a dash of Erlang and wrapped up in a
familiar, modern syntax.

- **Small.** The VM is under 4,000 semicolons of readable and lovingly-commented C.

- **Fast.** A smart, single-pass compiler produces tight, efficient bytecode.

- **Class-based.** Classes and objects are front and center.

- **Concurrent.** Lightweight fibers are built into the language.

- **Scripting.** Embeddable, no dependencies, a small standard library, and an easy-to-use C API.


### The VM

The heart of Wren is the VM.  The Wren Virtual Machine is the core of the language and executes all Wren source code. It is just a library, not a standalone application. It’s designed to be embedded in a larger host application.

You can find Wren embedded in such projects as:

* [TIC-80](https://tic80.com) - a fantasy computer for making, playing and sharing tiny games (similar to PICO8).
* [DOME](https://domeengine.com) - a cross-platform framework for making games.
* [luxe](https://luxeengine.com) - a cross-platform, rapid development game engine for making games.
* [Wren Console][wren-console] - a Wren REPL and CLI written largely in Wren itself.

You can even embed Wren inside your own projects.  For Exercism purposes the host application we'll be using is [Wren Console][wren-console] - allowing us to run and test our Wren scripts from the terminal.


### Why Wren?

Wren was originally created by [Bob Nystrom](http://journal.stuffwithstuff.com) of [Crafting Interpreters](http://craftinginterpreters.com) fame.  He has more than a few languages under his belt, but he explains specifically what led to the creation of Wren:

> There are a few scripting languages used for embedding in applications. Lua is the main one. TCL used to be. There’s also Guile, increasingly JavaScript, and some applications embed Python. I’m an ex-game developer, so when I think “scripting”, I tend to think “game scripting”.

> Lua is nice: it’s small, simple, and fast. But—and I don’t mean this as a criticism—it’s also weird if you’re used to languages like C++ and Java. The syntax is different. The semantics, especially the object model are unusual. Anyone can get used to 1-based indexing, but things like metatables really show that objects were bolted onto Lua after the fact.

> I think there’s room for a language as simple as Lua, but that feels natural to someone with an OOP background. Wren is my attempt at that.

### Trying it

You can [give it a quick try][try-it] inside your web browser (without  installing a thing). If you want to experiment with Wren wrapped up in a slick UI you might take a look at [Wren Playground][wren-playground].

[wren]: https://wren.io
[wren-console]: https://github.com/joshgoebel/wren-console
[wren-playground]: https://github.com/ninjascl/wren-playground
[try-it]: https://wren.io/try/
