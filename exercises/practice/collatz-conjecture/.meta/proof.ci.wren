class Collatz {
  static isEven(n) { n % 2 == 0 }
  static steps(n) {
    if (n <= 0) Fiber.abort("Only positive numbers are allowed")
    var steps = 0

    // If n is even, divide n by 2 to get n / 2. If n is
    // odd, multiply n by 3 and add 1 to get 3n + 1.
    while(n != 1) {
      n = isEven(n) ? n / 2 : n*3 + 1
      steps = steps + 1
    }
    return steps
  }
}
