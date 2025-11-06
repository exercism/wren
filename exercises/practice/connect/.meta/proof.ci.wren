// We (mis)use Range to represent a hashable (row, column) tuple.

var DIRECTIONS = [
  (-1..0), // above, left
  (-1..1), // above, right
  (0..-1), // left
  (0..1), // right
  (1..-1), // below, left
  (1..0), // below, right
]

class Connect {
  construct new(board) {
    _board = board
  }

  stone(cell) {
    return _board[cell.from][2 * cell.to + cell.from]
  }

  winner {
    var rows = _board.count
    var columns = (_board[0].count + 1) / 2

    // Represents the set of cells we have seen.
    var seen = {}

    // Cells newly known to be reachable from the bottom or right.
    var frontier = []

    var bottom = rows - 1
    for (column in 0...columns) {
      var cell = bottom..column
      if (stone(cell) == "O") {
        seen[cell] = null
        frontier.add(cell)
      }
    }

    var right = columns - 1
    for (row in 0...rows) {
      var cell = row..right
      if (stone(cell) == "X") {
        seen[cell] = null
        frontier.add(cell)
      }
    }

    var top = 0
    var left = 0
    while (frontier.count != 0) {
      var current_cell = frontier.removeAt(-1)
      var current_stone = stone(current_cell)
      if ((current_cell.from == top && current_stone == "O") || (current_cell.to == left && current_stone == "X")) {
        return current_stone
      }

      for (direction in DIRECTIONS) {
        var adjacent_cell = (current_cell.from + direction.from)..(current_cell.to + direction.to)
        if (adjacent_cell.from < 0 || adjacent_cell.from >= rows || adjacent_cell.to < 0 || adjacent_cell.to >= columns) {
          continue
        }

        var adjacent_stone = stone(adjacent_cell)
        if (adjacent_stone != current_stone || seen.containsKey(adjacent_cell)) {
          continue
        }

        seen[adjacent_cell] = null
        frontier.add(adjacent_cell)
      }
    }

    // No winner found
    return null
  }
}
