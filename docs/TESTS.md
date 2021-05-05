# Tests

Execute the tests with:

```bash
$ wren_cli exercise-name.spec.wren
```

For example for `hello-world`:

```bash
$ wren_cli hello-world.spec.wren
```

**TODO:** This might be nice, but we need some kind of tooling
since we likely can't live reload the code inside Wren CLI itself.

You can also run Jest in "watch" mode, which will re-run your tests
automatically when you save changes to the code or test module:

```bash
$ npm run watch
```

## Understanding Skip Tests

The skip method instructs the test suite to not run a test, this function could
be used also under the aliases: `it.skip(name, fn)` or `xit(name, fn)` or
`xtest(name, fn)`

- Why they are skipped ?

So as to enable users to concentrate on one test at a time and enable one by one
as they evolve the solution.

- How to enable them ?

A skipped test:

```js
// this test will be skipped and not run
it.skip("title cased phrases") {
    Assert.equal("PNG", Acronyms.parse("Portable Network Graphics"))
}
```

Simply change `it.skip` to `it.test`.

```js
it.test("title cased phrases") {
    Assert.equal("PNG", Acronyms.parse("Portable Network Graphics"))
}
```

## Making Your First Wren Module

Tests on this track load your implementation by importing it as a Wren module:
`import "./bob" for Bob`. There is no special syntax to export your
implementation. Just name your class `Bob` to match the import statements `for
Bob` and everything should just work.

```javascript
class Bob {
  static hey(message) {
    // Your solution to the exercise goes here
  }
}
```

You can find more information about modules in the
[Wren Modularity documentation][modularity].
To make it easier to get started, there is a _skeleton_ Wren file in the
directory for the first exercise.

[modularity]: https://wren.io/modularity.html