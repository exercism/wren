class LinkedList {
  construct new() {
    _head = null
    _tail = null
  }

  count {
    var count = 0
    var current = _head
    while (current != null) {
      count = count + 1
      current = current.next
    }
    return count
  }

  push(data) {
    var node = Node.new(data)
    if (_tail == null) {
      _head = node
    } else {
      _tail.next = node
      node.prev = _tail
    }
    _tail = node
  }

  unshift(data) {
    var node = Node.new(data)
    if (_head == null) {
      _tail = node
    } else {
      _head.prev = node
      node.next = _head
    }
    _head = node
  }

  pop() { 
    var value = null
    if (_tail != null) {
      value = _tail.value
      if (_tail.prev == null) {
        _head = null
      } else {
        _tail.prev.next = null
      }
      _tail = _tail.prev
    }
    return value
  }

  shift() { 
    var value = null
    if (_head != null) {
      value = _head.value
      if (_head.next == null) {
        _tail = null
      } else {
        _head.next.prev = null
      }
      _head = _head.next
    }
    return value
  }

  delete(element) {
    var current = _head
    while (current != null && current.value != element) {
      current = current.next
    }
    if (current != null) {
      // a node with the specified value was found
      if (current.next == null) {
        _tail = current.prev
      } else {
        current.next.prev = current.prev
      }
      if (current.prev == null) {
        _head = current.next
      } else {
        current.prev.next = current.next
      }
    }
  }
}

class Node {
  construct new(value) {
    _value = value
    _next = null
    _prev = null
  }

  value {_value}
  next  {_next}
  prev  {_prev}
  next=(node) {_next = node}
  prev=(node) {_prev = node}
}
