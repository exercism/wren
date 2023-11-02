class PerfectNumbers {
  static classify(number) {
    if (number <= 0) {
      Fiber.abort("Classification is only possible for positive integers.")
    }

    var remaining = number
    var factors = 1
    var p = 2
    while (p * p <= remaining) {
      if (remaining % p == 0) {
        remaining = remaining / p
        var total = p + 1
        while (remaining % p == 0) {
          remaining = remaining / p
          total = total * p + 1
        }
        factors = factors * total
      }
      p = p + 1
    }
    if (remaining != 1) {
      factors = factors * (remaining + 1)
    }

    if (factors - number > number) {
      return "abundant"
    }
    if (factors - number < number) {
      return "deficient"
    }
    return "perfect"
  }
}
