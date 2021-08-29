# Tests

Execute the tests with:

```bash
$ wrenc exercise-name.spec.wren
```

For example for `hello-world`:

```bash
$ wrenc hello-world.spec.wren
```


## Understanding Skip Tests

The `skip` method instructs the test suite to not run a particular test.

- Why they are skipped ?

So as to enable users to concentrate on one test at a time and enable one by one
as they evolve the solution.

- How to enable them ?

A skipped test:

```js
// this test will be skipped and not run
skip.test("title cased phrases") {
    Expect.value(Acronyms.parse("Portable Network Graphics")).toEqual("PNG")
}
```

Simply change `skip.test` to `do.test`.

```js
// now the test will be run normally
do.test("title cased phrases") {
    Expect.value(Acronyms.parse("Portable Network Graphics")).toEqual("PNG")
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
directory for each exercise.

[modularity]: https://wren.io/modularity.html