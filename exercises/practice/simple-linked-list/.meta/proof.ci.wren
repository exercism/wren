class Element {
  construct new(value) {
    _value = value
    _next = null
  }
  next=(node) { _next = node }
  next { _next }
  value { _value }
}

class LinkedList {
  construct new() { _head = null }
  construct new(list) {
    _head = null
    list.each {|x| add(Element.new(x)) }
  }
  isEmpty { _head == null }
  head { _head }
  count {
    var count = 0
    each { count = count + 1}
    return count
  }
  // defer to iterate for iteration
  each(fn) {
    for (v in this) fn.call(v)
  }
  toList {
    var list = []
    each { |v| list.add(v) }
    return list
  }
  add(node) {
    node.next = _head
    _head = node
  }
  reverse() {
    var next
    // keep track of our old list head
    var hd = _head
    // reset our own head to null
    _head = null
    while (hd) {
      next = hd.next
      hd.next = null
      add(hd)
      hd = next
    }
    return this
  }
  iterate(pos) {
    if (pos == null) return _head
    return pos.next
  }
  iteratorValue(pos) { pos.value }
}

