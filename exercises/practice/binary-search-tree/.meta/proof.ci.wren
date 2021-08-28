class BinarySearchTree {
  construct new() {}

  construct with(item) {
    _value = item
  }

  construct withAll(items) {
    for (item in items) {
      insert(item)
    }
  }

  insert(item) {
    if (_value == null) {
      _value = item
    } else if (item <= _value) {
      if (_left == null) {
        _left = this.type.with(item)
      } else {
        _left.insert(item)
      }
    } else {
      if (_right == null) {
        _right = this.type.with(item)
      } else {
        _right.insert(item)
      }
    }
    return this
  }

  value {_value}

  data {
    return {
      "data": value,
      "left": (_left == null) ? null : _left.data,
      "right": (_right == null) ? null : _right.data
    }
  }

  // walk the tree and accumulate values
  sortedData { map {|node| node.value} }

  inorder(fn) {
    if (_left != null) _left.inorder(fn)
    fn.call(this)
    if (_right != null) _right.inorder(fn)
  }

  map(fn) {
    var values = []
    inorder {|node| values.add(fn.call(node))}
    return values
  }
}
