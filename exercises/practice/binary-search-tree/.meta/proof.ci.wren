class BinarySearchTree {
  construct new(item) {
    _value = item
    _left = null
    _right = null
  }

  construct addAll(items) {
    for (item in items) {
      insert(item)
    }
  }

  insert(item) {
    if (_value == null) {
      _value = item
    } else if (item <= _value) {
      if (_left == null) {
        _left = BinarySearchTree.new(item)
      } else {
        _left.insert(item)
      }
    } else {
      if (_right == null) {
        _right = BinarySearchTree.new(item)
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
