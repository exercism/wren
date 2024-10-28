class SumOfMultiples {
  static sum(factors, limit) {
    var total = 0
    for (multiple in 1...limit) {
      for (factor in factors) {
        if (multiple % factor == 0) {
          total = total + multiple
          break
        }
      }
    }
    return total
  }
}
