class Say {
  static say(number) {
    initialize_()
    return sayIt_(number)
  }

  static initialize_() {
    __smallNumbers = [
      "zero", "one", "two", "three", "four", "five", "six", "seven",
      "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen",
      "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"
    ]
    __tens = [
      "", "", "twenty", "thirty", "forty", "fifty", "sixty",
      "seventy", "eighty", "ninety"
    ]
  }

  static sayIt_(number) {
    if (number < 0)    Fiber.abort("input out of range")
    if (number < 20)   return __smallNumbers[number]
    if (number < 100)  return saySmall_(number)
    if (number < 1e3)  return sayCompound_(number, 100, "hundred")
    if (number < 1e6)  return sayCompound_(number, 1e3, "thousand")
    if (number < 1e9)  return sayCompound_(number, 1e6, "million")
    if (number < 1e12) return sayCompound_(number, 1e9, "billion")
    Fiber.abort("input out of range")
  }

  static saySmall_(number) {
    var ones = number % 10
    var tens = (number / 10).floor
    var result = __tens[tens]
    if (ones != 0) {
      result = result + "-" + __smallNumbers[ones]
    }
    return result
  }

  static sayCompound_(number, base, word) {
    var rem = number % base
    var quo = (number / base).floor
    var result = sayIt_(quo) + " " + word
    if (rem != 0) {
      result = result + " " + sayIt_(rem)
    }
    return result
  }
}
