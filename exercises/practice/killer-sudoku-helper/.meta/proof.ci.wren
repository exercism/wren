class KillerSudokuHelper {
  static combinations(sum, size, exclude) {
    var digits = []
    for (digit in 1..9) {
      if (!exclude.contains(digit)) {
        digits.add(digit)
      }
    }

    var solutions = []

    var current = []

    var search

    search = Fn.new {|required, minIndex|
      if (size == current.count) {
        if (required == 0) {
          solutions.add(current.toList)
        }
        return
      }

      for (index in minIndex...digits.count) {
        var digit = digits[index]
        current.add(digit)
        search.call(required - digit, index + 1)
        current.removeAt(-1)
      }
    }

    search.call(sum, 0)
    return solutions
  }
}
