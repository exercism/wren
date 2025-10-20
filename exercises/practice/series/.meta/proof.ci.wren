class Series {
  construct new(digits) {
    if (digits.count == 0) {
      Fiber.abort("series cannot be empty")
    }

    _digits = digits
  }

  slices(sliceLength) {
    if (sliceLength < 0) {
      Fiber.abort("slice length cannot be negative")
    }

    if (sliceLength == 0) {
      Fiber.abort("slice length cannot be zero")
    }

    if (sliceLength > _digits.count) {
      Fiber.abort("slice length cannot be greater than series length")
    }

    var list = []
    for (index in sliceLength.._digits.count) {
      list.add(_digits[(index - sliceLength)...index])
    }
    return list
  }
}
