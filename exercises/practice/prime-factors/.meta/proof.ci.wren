class PrimeFactors {
  static factors(value) {
    var result = []
    var factor = 2
    while (value > 1) {
      if (value % factor == 0) {
        result.add(factor)
        value = value / factor
      } else {
        factor = factor + 1
      }
    }
    return result
  }
}
