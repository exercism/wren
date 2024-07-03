class Series {
  construct new(series, span) {
    _span = span
    _digits = series.codePoints.map {|cp| cp - 48}.toList

    if (_span < 0) {
      Fiber.abort("span must not be negative")
    }
    if (_span > series.count) {
      Fiber.abort("span must be smaller than string length")
    }
    if (_digits.any {|d| d < 0 || d > 9}) {
      Fiber.abort("digits input must only contain digits")
    }
  }

  largestProduct {
    var indices = 0..(_digits.count - _span)
    var products = indices.map {|i| product_(_digits[i...(i + _span)])}
    return max_(products)
  }

  product_(list) { list.reduce(1) {|prod, num| prod * num} }
  max_(list) { list.reduce(0) {|max, prod| max.max(prod)} }
}
