class Transpose {
  construct new(lines) {
    _lines = lines
  }

  toString {
    if (_lines == "") {
      return ""
    }
    var lines = _lines.split("\n")
    var result = ""
    var skipped = 0
    var column = -1
    while (skipped != lines.count) {
      column = column + 1
      skipped = 0
      result = result + "\n"

      for (row in 0...(lines.count)) {
        if (column >= lines[row].count) {
          skipped = skipped + 1
          continue
        }
        while (skipped > 0) {
          result = result + " "
          skipped = skipped - 1
        }
        result = result + lines[row][column]
      }
    }
    return result[1...-1]
  }
}
