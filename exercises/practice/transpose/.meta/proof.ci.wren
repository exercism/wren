class Transpose {
  construct new(lines) {
    _lines = lines
  }

  toString {
    var result = []
    var column = 0
    while (true) {
      var str = ""
      var skipped = 0
      for (row in 0...(_lines.count)) {
        if (column >= _lines[row].count) {
          skipped = skipped + 1
          continue
        }
        while (skipped > 0) {
          str = str + " "
          skipped = skipped - 1
        }
        str = str + _lines[row][column]
      }
      if (str == "") {
        break
      }
      result.add(str)
      column = column + 1
    }
    return result
  }
}
