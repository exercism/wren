class NthPrime {
  static prime(number) {
    if (number == 0) {
      Fiber.abort("there is no zeroth prime")
    }

    // Special case for the first two primes.
    if (number <= 2) {
      return number + 1
    }
    var remaining = number - 2

    // candidate is never a multiple of 2 or 3.
    var candidate = 5
    var step = 2
    while (true) {
      if (isPrime(candidate)) {
        remaining = remaining - 1
        if (remaining == 0) {
          return candidate
        }
      }
      candidate = candidate + step
      step = 6 - step
    }
  }

  // candidate must not be a multiple of 2 or 3.
  static isPrime(candidate) {
    var limit = candidate.sqrt

    var factor = 5
    var step = 2
    while (factor <= limit) {
      if (candidate % factor == 0) {
        return false
      }
      factor = factor + step
      step = 6 - step
    }
    return true
  }
}
