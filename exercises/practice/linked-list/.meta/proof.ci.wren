class LinkedList {
  construct new() {
    _list = []
  }

  push(data) {
    _list.add(data)
  }

  pop() { 
    var returnObject = _list[-1] 
    _list.removeAt(-1)
    return returnObject
  }

  shift() { 
    var returnObject = _list[0] 
    _list.removeAt(0)
    return returnObject
  }

  unshift(data) { 
    _list.insert(0, data)
    return _list[0] 
  }

  count() {
    var objectCount = 0

    for (object in _list) {
      objectCount = objectCount + 1
    }

    return objectCount
  }

  delete(element) {
    _list.remove(element)
  }

}
