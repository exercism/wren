class PythagoreanTriplet {
  static tripletsWithSum(n) {
    var result = []
    if (n < 2) {
      return result
    }
    var a = 0
    while (true) {
      a = a + 1
      var numerator = n * (n - 2 * a)
      var denominator = 2 * (n - a)
      var b = numerator / denominator
      if (b < a) {
        break
      }
      if (numerator % denominator != 0) {
        continue
      }
      var c = n - a - b
      result.add([a, b, c])
    }
    return result
  }
}
