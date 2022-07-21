class ListOps {
  construct new() {
    _data = []
  }

  construct new(elements) {
    _data = elements[0..-1]
  }

  toList { _data[0..-1] }

  add(element) {
    _data.add(element)
  }

  /* the iterator protocol
   * https://wren.io/control-flow.html#the-iterator-protocol
   *
   * iterate(iterator)
   *  - determine the sequence of the "index" into the collection
   *  - first iteration, wren provides the null value, we return
   *    the first index
   *  - subsequent iterations, wren provides the previous value, 
   *    we return the next index
   *  - return false to end the iteration
   *
   * iteratorValue(iterator)
   *  - use the "index" value returned by `iterate` to provide
   *    a value from the collection
   *  - this is the `item` in `for (item in collection) {...}`
   */
  iterate(iterator) {
    if (iterator == null) {
      if (_data.isEmpty) return false
      return 0
    }
    if (iterator + 1 == _data.count) return false
    return iterator + 1
  }

  iteratorValue(iterator) {_data[iterator]}

  addAll(other) {
    for (element in other) {
      add(element)
    }
  }

  +(other) {
    var result = type.new(_data)
    result.addAll(other)
    return result
  }

  static concat(listOfLists) {
    var result = new()
    listOfLists.each {|list| result.addAll(list)}
    return result
  }

  where(predicate) {
    var result = type.new()
    for (elem in this) {
      if (predicate.call(elem)) {
        result.add(elem)
      }
    }
    return result
  }

  count {
    var c = 0
    for (elem in this) {
      c = c + 1
    }
    return c
  }

  map(transform) {
    var result = type.new()
    for (elem in this) {
      result.add(transform.call(elem))
    }
    return result
  }

  reduce(initial, callback) {
    var result = initial
    for (elem in this) {
      result = callback.call(result, elem)
    }
    return result
  }

  reverse() {
    var result = type.new()
    for (elem in this) {
      result = type.new([elem]) + result
    }
    return result
  }

  reduceRight(initial, callback) {
    var result = initial
    for (elem in reverse()) {
      result = callback.call(elem, result)
    }
    return result
  }
}
