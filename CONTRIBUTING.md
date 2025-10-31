# Contributing to the wren track

Firstly, thanks for helping to improve the track.

## Add a new exercise

- get familiar with the [Building Exercism][building] docs, particularly:
    - [Add a Practice Exercise][add-practice]
    - [config.json][config]

- use the `bin/create-exercise` script to bootstrap the new exercise.

- edit the exercise's spec file: the canonical tests have been put there for reference.
    - if any of the canonical tests don't apply for wren, update the [`.meta/tests.toml`][tests-toml] file to exclude them

- create the `.meta/proof.ci.wren` solution file that proves the exercise can be solved.
    - use `scripts/ci $exercise_slug` to validate your proof.

- if the given instructions need to be modified, [append to the instructions][instr-append] to explain why the wren exercise deviates.

- if you decide to change the difficulty in config.json, we keep it sorted in a particular order:

    ```bash
    tmp=$(mktemp)
    jq '.exercises.practice = (
            .exercises.practice | sort_by(.difficulty, (.name | ascii_upcase))
        )
    ' config.json > "$tmp" && mv "$tmp" config.json
    ```

- run a final validation check: `bin/configlet lint`

## Other contributions?

Please [use the forum][forum] to start about a conversation about how you wish to add your efforts.


[building]: https://exercism.org/docs/building
[add-practice]: https://exercism.org/docs/building/tracks/practice-exercises/add
[config]: https://exercism.org/docs/building/tracks/practice-exercises/add
[tests-toml]: https://exercism.org/docs/building/tracks/practice-exercises#h-file-meta-tests-toml
[instr-append]: https://exercism.org/docs/building/tracks/practice-exercises#h-file-docs-instructions-append-md
[forum]: https://forum.exercism.org/c/programming/wren/123
