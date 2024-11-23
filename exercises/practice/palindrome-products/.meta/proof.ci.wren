class PalindromeProducts {
  construct smallest(min, max) {
    if (min > max) {
      Fiber.abort("min must be <= max")
    }

    _value = max * max + 1
    _factors = []
    for (first in min..max) {
      for (second in first..max) {
        var product = first * second
        if (product > _value) {
          break
        }

        if (!PalindromeProducts.isPalindrome(product)) {
          continue
        }

        if (product < _value) {
          _value = product
          _factors = []
        }

        _factors.add([first, second])
      }
    }

    if (_factors.count == 0) {
      _value = null
    }
  }

  construct largest(min, max) {
    if (min > max) {
      Fiber.abort("min must be <= max")
    }

    _value = -1
    _factors = []
    for (second in max..min) {
      for (first in second..min) {
        var product = first * second
        if (product < _value) {
          break
        }

        if (!PalindromeProducts.isPalindrome(product)) {
          continue
        }

        if (product > _value) {
          _value = product
          _factors = []
        }

        _factors.add([first, second])
      }
    }

    if (_factors.count == 0) {
      _value = null
    }
  }

  value {_value}

  factors {_factors}

  static isPalindrome(num) {
    var str = num.toString
    return str == str[-1..0]
  }
}
