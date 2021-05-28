# Exercism Wren Track

[![configlet](https://github.com/exercism/wren/workflows/configlet/badge.svg)](https://github.com/exercism/wren/actions?query=workflow%3Aconfiglet)
[![wren / main](https://github.com/exercism/wren/workflows/wren%20/%20main/badge.svg)](https://github.com/exercism/wren/actions?query=workflow%3A%22wren+%2F+main%22)


**Exercism exercises in Wren**

This is the Wren track, one of the many tracks on [Exercism][web-exercism].
It holds all the _exercises_ that are currently implemented and available for students to complete.
The track currently consists only of _practice_ exercises at the moment (no concepts).
You can find this in the [`config.json`][file-config].


<!--
TODO: need CONTRIBUTING.md
## Tools

See [CONTRIBUTING.md][file-contributing] for a list of requirements to contribute to this track.
It also has a list of tools you can use, of which the `test` tool is one of them.
-->

## Running the test suite

**Prerequisites**

First we need to install dependencies:

```
wrenc package.wren install
```

**Running the tests**

```shell
./scripts/ci
```

This runs the tests for all sample solutions.

```shell
./scripts/ci hello-world
```

If the a single argument is passed, only _that_ exercise is tested.

### Maintainers

To update all the individual `package.wren` files in every exercise:

```
./script/update_testie.sh
```

### The Exercism Wren Stack

- Wren Exercises (this repo)
- [Wren Test Runner](https://github.com/exercism/wren-test-runner)
- [Wren Representer](https://github.com/exercism/wren-representer)
- Wren Analyzer - *nope, not yet.*
- [Wren CodeMirror Language Support](https://github.com/exercism/codemirror-lang-wren)
- [Wren Console](https://github.com/joshgoebel/wren-console) - Wren runtime environment
- [Wren Package](https://github.com/joshgoebel/wren-package) - dependency management
- [Wren Testie](https://github.com/joshgoebel/wren-testie) - exercise test suites


[web-exercism]: https://exercism.io
[file-config]: https://github.com/exercism/wren/blob/main/config.json
[file-contributing]: https://github.com/exercism/wren/blob/main/CONTRIBUTING.md
