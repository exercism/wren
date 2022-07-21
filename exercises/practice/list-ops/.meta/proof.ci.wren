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

  // https://wren.io/control-flow.html#the-iterator-protocol
  iterate(iterator) {
    // first iteration, wren provides the null value
    if (iterator == null) {
      if (_data.isEmpty) {
        return false
      } else {
        return 0
      }
    } else {
      // subsequent iterations, wren provides the previous value
      iterator = iterator + 1
      if (iterator == _data.count) {
        return false
      } else {
        return iterator
      }
    }
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
