# Contributing to the wren track

Firstly, thanks for helping to improve the track.

## Add a new exercise

- Get familiar with the [Building Exercism][building] docs, particularly:
    - [Add a Practice Exercise][add-practice]
    - [config.json][config]

- Use the `bin/create-exercise` script to bootstrap the new exercise.

- Edit the exercise's spec file: the canonical tests have been put there for reference.
    - If any of the canonical tests don't apply for wren, update the [`.meta/tests.toml`][tests-toml] file to exclude them

- Create the `.meta/proof.ci.wren` solution file that proves the exercise can be solved.
    - Use `scripts/ci $exercise_slug` to validate your proof.
    - Before you run that, you have to run `wrenc package.wren install` from the track root directory.
      If you don't, you'll see this:

      ```
      $ ./scripts/ci micro-blog
      Running micro-blog ...
      Could not load module 'wren-testie/testie'.
      at (script) (./micro-blog.spec.wren line 2)
      ```

      But then:
      ```
      $ wrenc package.wren install
       - installing wren-testie 0.3.0
       - [R] git clone -q https://github.com/joshgoebel/wren-testie.git wren_modules/wren-testie
       - [R] git checkout --detach 0.3.0
      HEAD is now at e6c7f7a version 0.3
       * 1 dependency(s). All good.

      $ ./scripts/ci micro-blog
      ...
      Tests:  💯 ✓ 12 passed, 12 total
      ```

- If the given instructions need to be modified, [append to the instructions][instr-append] to explain why the wren exercise deviates.

- If you decide to change the difficulty in config.json, we keep it sorted in a particular order:

    ```bash
    tmp=$(mktemp)
    jq '.exercises.practice = (
            .exercises.practice | sort_by(.difficulty, (.name | ascii_upcase))
        )
    ' config.json > "$tmp" && mv "$tmp" config.json
    ```

- Run a final validation check: `bin/configlet lint`

## Other contributions?

Please [use the forum][forum] to start about a conversation about how you wish to add your efforts.


[building]: https://exercism.org/docs/building
[add-practice]: https://exercism.org/docs/building/tracks/practice-exercises/add
[config]: https://exercism.org/docs/building/tracks/practice-exercises/add
[tests-toml]: https://exercism.org/docs/building/tracks/practice-exercises#h-file-meta-tests-toml
[instr-append]: https://exercism.org/docs/building/tracks/practice-exercises#h-file-docs-instructions-append-md
[forum]: https://forum.exercism.org/c/programming/wren/123
