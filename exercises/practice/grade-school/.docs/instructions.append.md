# placeholder

## Sorting Strings in Wren

Wren is still a very young language:
there is functionality, perhaps common in another languages, that is not yet implemented.
One such thing is the ability to sort strings.

Wren's List `sort` method uses the `<` comparison explicitly.
`String` does not implement `<(_)`.

One of the challenges of this exercise is implementing a way to sort a list of strings.


## References:

- [`sort(), sort(comparer)`][list-sort] in List
- [List module's `sort` implementation][list-module]


[list-sort]: https://wren.io/modules/core/list.html#sort(),-sort(comparer)
[list-module]: https://github.com/wren-lang/wren/blob/4ffe2ed38b238ff410e70654cbe38883f7533d3f/src/vm/wren_core.wren#L326
