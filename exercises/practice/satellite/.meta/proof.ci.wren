class Satellite {
  construct treeFromTraversals(preorder, inorder) {
    if (preorder.count != inorder.count) {
      Fiber.abort("traversals must have the same length")
    }

    if (Satellite.repeats_(preorder) || Satellite.repeats_(inorder)) {
      Fiber.abort("traversals must contain unique items")
    }

    if (preorder.count == 0) {
      _data = null
      return
    }

    _preorder = preorder
    _inorder = inorder

    _preorder_index = 0
    _inorder_index = 0
    _data = build_(null)
  }

  data {
    return _data
  }

  static repeats_(list) {
    var seen = {}
    for (entry in list) {
      if (seen.containsKey(entry)) {
        return true
      }
      seen[entry] = null
    }
    return false
  }

  build_(successor) {
    if (_inorder_index == _inorder.count || _preorder_index == _preorder.count || _inorder[_inorder_index] == successor) {
      return null
    }

    var data = _preorder[_preorder_index]
    _preorder_index = _preorder_index + 1
    var left = build_(data)
    if (_inorder_index == _inorder.count || _inorder[_inorder_index] != data) {
      Fiber.abort("traversals must have the same elements")
    }
    _inorder_index = _inorder_index + 1
    var right = build_(successor)
    return {
      "data": data,
      "left": left,
      "right": right
    }
  }
}
