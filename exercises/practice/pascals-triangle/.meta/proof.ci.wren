class PascalsTriangle {
  static rows(count) {
    var result = []
    if (count == 0) {
      return result
    }
    var previousRow = [1]
    result.add(previousRow)
    for (i in 1...count) {
      var row = []
      var previousNumber = 0
      for (number in previousRow) {
        row.add(previousNumber + number)
        previousNumber = number
      }
      row.add(1)
      result.add(row)
      previousRow = row
    }
    return result
  }
}
