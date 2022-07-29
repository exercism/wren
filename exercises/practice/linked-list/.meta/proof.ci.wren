class LinkedList {
  construct new() {
    _value = null
    _next = null
    _prev = null
  }

  value {_value}
  value=(aValue) {_value = aValue}

  next {_next}
  next=(node) {_next = node}

  prev {_prev}
  prev=(node) {_prev = node}

  push(val) {
    if (value == null) {
      // initializing a new empty list
      value = val
      return
    }

    // walk to the tail
    var curr = this
    while (curr.next != null) {
      curr = curr.next
    }
    // and add a new node
    var node = type.new()
    node.value = val
    curr.next = node
    node.prev = curr
  }

  unshift(val) {
    if (value == null) {
      // initializing a new empty list
      value = val
      return
    }

    // create a new node and populate it with the current head info
    var node = type.new()
    node.value = this.value
    node.next = this.next
    if (node.next != null) {
      node.next.prev = node
    }
    // and "this" gets the new value and links to the new node
    value = val
    next = node
    node.prev = this
  }

  pop() {
    // walk to the tail
    var curr = this
    while (curr.next != null) {
      curr = curr.next
    }
    var val = curr.value
    if (curr.prev == null) {
      // this is the head
      curr.value = null
    } else {
      curr.prev.next = null
      curr.prev = null
    }
    return val
  }

  shift() {
    var val = value
    value = null
    if (next != null) {
      var second = next
      value = second.value
      next = second.next
      if (second.next != null) {
        second.next.prev = this
      }
      second.next = null
      second.prev = null
    }
    return val
  }

  delete(searchValue) {
    // special case: delete the head
    if (value == searchValue && prev == null) {
      shift()
      return
    }

    var curr = this
    while (curr.value != searchValue && curr.next != null) {
      curr = curr.next
    }
    if (curr.value != searchValue) {
      // searchValue not in the list
      return
    }
    if (curr.next != null) {
      curr.next.prev = curr.prev
    }
    if (curr.prev != null) {
      curr.prev.next = curr.next
    }
    curr.next = null
    curr.prev = null
  }

  iterate(iter) {
    if (iter == null) {
      if (value == null) return false
      return this
    }
    if (iter.next == null) return false
    return iter.next
  }
  iteratorValue(iter) {
    return iter
  }

  count {
    var count = 0
    for (node in this) {
      count = count + 1
    }
    return count
  }
}
