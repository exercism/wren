class Vector {
  construct new(x,y) {
    _x = x
    _y = y
  }
  x { _x }
  y { _y }
  toList { [_x, _y] }
  +(vec) {
    return Vector.new(_x + vec.x, _y + vec.y)
  }
}

var DIRECTIONS = ["north", "east", "south", "west"]
var VECTORS = {
  "north": Vector.new(0, 1),
  "south": Vector.new(0, -1),
  "east": Vector.new(1, 0),
  "west": Vector.new(-1,0)
}

class Robot {
  construct new() {
    _bearing = "north"
    _coords = Vector.new(0,0)
  }
  bearing { _bearing }
  coordinates { _coords.toList }
  place(opts) {
    if (! DIRECTIONS.contains(opts["direction"])) {
      Fiber.abort("Invalid input")
    }
    _bearing = opts["direction"]
    _coords = Vector.new(opts["x"], opts["y"])
  }
  advance { _coords = _coords + VECTORS[_bearing] }
  right {
    var i = DIRECTIONS.indexOf(_bearing)
    i = (i + 1) % 4
    _bearing = DIRECTIONS[i]
  }
  left {
    var i = DIRECTIONS.indexOf(_bearing)
    i = (i - 1) % 4
    _bearing = DIRECTIONS[i]
  }
  evaluate(instructions) { instructions.each { |x| execute(x) } }
  execute(cmd) {
    if (cmd=="A") {
      advance
    } else if (cmd == "R") {
      right
    } else if (cmd == "L") {
      left
    } else {
      Fiber.abort("Invalid input")
    }
  }
}
