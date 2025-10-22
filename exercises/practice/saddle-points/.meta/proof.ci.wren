class Point {
  construct new(row, column) {
    _row = row
    _column = column
  }
  row { _row }
  column { _column }
}

class Matrix {
  construct new(values) {
    _values = values
  }

  saddlePoints() {
    var result = []
    if (_values.count == 0 || _values[0].count == 0) {
      return result
    }

    var m = _values.count
    var n = _values[0].count

    var tallest = []
    for (row in _values) {
      var best = row[0]
      for (entry in row) {
        if (best < entry) {
          best = entry
        }
      }
      tallest.add(best)
    }

    var shortest = []
    for (j in 0...n) {
      var best = _values[0][j]
      for (i in 0...m) {
        if (best > _values[i][j]) {
          best = _values[i][j]
        }
      }
      shortest.add(best)
    }

    for (i in 0...m) {
      for (j in 0...n) {
        if (_values[i][j] == tallest[i] && _values[i][j] == shortest[j]) {
          result.add(Point.new(i + 1, j + 1))
        }
      }
    }
    return result
  }
}
