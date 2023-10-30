class AllYourBase {
  static rebase(inputBase, digits, outputBase) {
    if (inputBase < 2) {
      Fiber.abort("input base must be >= 2")
    }
    if (outputBase < 2) {
      Fiber.abort("output base must be >= 2")
    }

    var number = 0
    for (digit in digits) {
      if (digit < 0 || digit >= inputBase) {
        Fiber.abort("all digits must satisfy 0 <= d < input base")
      }
      number = number * inputBase + digit
    }

    var result = []
    while (number >= outputBase) {
      var digit = number % outputBase
      result.insert(0, digit)
      number = (number - digit) / outputBase
    }
    result.insert(0, number)
    return result
  }
}
