class SpiralMatrix {
  construct new(size) {
    _matrix = Matrix2D.new(size, size)
    populate_()
  }

  populate_() {
    var x = 0
    var y = 0
    var dxs = Cycle.new([1, 0, -1, 0])
    var dys = Cycle.new([0, 1, 0, -1])
    var dx = dxs.next
    var dy = dys.next

    for (n in (0...(_matrix.height * _matrix.width))) {
      _matrix[y][x] = n + 1

      // turn
      if (x + dx < 0 || x + dx == _matrix.width ||
          y + dy < 0 || y + dy == _matrix.height ||
          _matrix[y + dy][x + dx] != null) {
        dx = dxs.next
        dy = dys.next
      }

      // advance
      x = x + dx
      y = y + dy
    }
  }

  toList { _matrix.toList }
}

// supporting classes

class Matrix2D {
  construct new(height, width) {
    _height = height
    _width = width
    _matrix = (0...height).reduce([]) {|m, i| m + [[null] * width]}
  }
  height { _height }
  width { _width }
  [index] { _matrix[index] }
  // returns a copy of the list
  toList { _matrix.map {|row| row[0..-1]}.toList }
}

class Cycle {
  construct new(items) {
    _items = items
    _index = -1
  }

  next {
    _index = (_index + 1) % _items.count
    return _items[_index]
  }
}
