var DELTAS = [
  [-1, -1],
  [-1, 0],
  [-1, 1],
  [1, 1],
  [1, 0],
  [1, -1],
  [0, 1],
  [0, -1],
]

class Grid {
  construct new(list) {
    _height = list.count
    // assumes all rows are equal width
    // special case: list might be empty
    _width = list.count > 0 ? list[0].count : 0
    _list = list.map {|x| x.bytes.map { |b| String.fromByte(b) }.toList }.toList
  }
  walkTransform(fn) {
    (0..._height).each { |y|
      (0..._width).each { |x|
        var data = fetch(x,y)
        var r = fn.call(x,y,data)
        if (r != null) set(x,y,r)
      }
    }
  }
  adjacentTo(x,y) {
    return DELTAS.map { |delta|
      var dy = delta[0]
      var dx = delta[1]
      return fetch(x + dx, y + dy)
    }.where {|x| x != null }
  }
  set(x,y,v) { _list[y][x] = v }
  fetch(x,y) {
    if (y<0 || y >= _height) return null
    if (x<0 || x >= _width) return null
    return _list[y][x]
  }
  toList { _list.map {|x| x.join("")}.toList }
}

var BOMB = "*"

class Minesweeper {
  static annotate(list) {
    var grid = Grid.new(list)
    grid.walkTransform() { |x,y,data|
      if (data==BOMB) return

      var count = grid.
        adjacentTo(x,y).
        where {|c| c==BOMB }.
        count

      return count == 0 ? " " : count.toString
    }
    return grid.toList
  }
}