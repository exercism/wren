class Rectangles {
  construct new(lines) {
    _board = lines[0..-1]
  }

  count {
    var count = 0
    var vertices = find_vertices_

    for (top_left in vertices) {
      var right_of = vertices.where {|v| v.row == top_left.row && v.col > top_left.col}
      var below    = vertices.where {|v| v.col == top_left.col && v.row > top_left.row}

      for (top_right in right_of) {
        for (bottom_left in below) {
          var bottom_right = Coord.new(bottom_left.row, top_right.col)

          if (vertices.contains(bottom_right) && is_rectangle_(top_left, bottom_right)) {
            count = count + 1
          }
        }
      }
    }
    return count
  }

  find_vertices_ {
    var vertices = []
    for (i in (0..._board.count)) {
      var row = _board[i]
      for (j in (0...row.count)) {
        if (row[j] == "+") {
          vertices.add(Coord.new(i, j))
        }
      }
    }
    return vertices
  }

  is_rectangle_(tl, br) { 
    return is_horizontal_line_(tl.row, tl.col, br.col) &&
           is_horizontal_line_(br.row, tl.col, br.col) &&
           is_vertical_line_(tl.col, tl.row, br.row) &&
           is_vertical_line_(br.col, tl.row, br.row)
  }

  is_horizontal_line_(row, col1, col2) {
    return (col1..col2).map {|c| _board[row][c]}
                       .all {|ch| "+-".contains(ch)}
  }

  is_vertical_line_(col, row1, row2) {
    return (row1..row2).map {|r| _board[r][col]}
                       .all {|ch| "+|".contains(ch)}
  }
}

class Coord {
  construct new(row, col) {
    _row = row
    _col = col
  }
  row {_row}
  col {_col}
  ==(other) {type == other.type && row == other.row && col == other.col}
}
