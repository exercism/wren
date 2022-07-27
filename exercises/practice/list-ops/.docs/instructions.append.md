# placeholder

## Implementing List operations

The goal of this exercise is to implement some of List methods yourself.
It's natural to use a List object in the backend to hold the data. 
Keep your hands off the List methods (like `where`, `map`, etc).

There are a some "primitive" List operations that are unavoidable, such as:

* slicing: `list[from..to]`
* adding: `list.add(item)`

## Iterator protocol

The list operations to implement are all about iterating in various ways.
Read about [the iterator protocol][iter].
Then you'll be able to do:

```wren
var list = ListOps.new([1, 2, 3, 4])
for (item in list) {
    do_something_with(item)
}
```

[iter]: https://wren.io/control-flow.html#the-iterator-protocol
