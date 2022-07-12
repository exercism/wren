class Rational {
  construct new(numerator, denominator) {
    var gcd = Math.gcd(numerator.abs, denominator.abs)
    var m = denominator < 0 ? -1 : 1
    _num = m * numerator / gcd
    _den = m * denominator / gcd
  }

  numerator { _num }
  denominator { _den }

  toString { "%(numerator)/%(denominator)" }

  ==(other) {
    return numerator == other.numerator &&
           denominator == other.denominator
  }

  negated    { type.new(-numerator, denominator) }
  reciprocal { type.new(denominator, numerator) }
  abs        { type.new(numerator.abs, denominator) }

  +(other) {
    return type.new(
      numerator * other.denominator + denominator * other.numerator,
      denominator * other.denominator)
  }

  -(other) {
    return this + other.negated
  }

  *(other) {
    return type.new(
      numerator * other.numerator,
      denominator * other.denominator)
  }

  /(other) {
    return this * other.reciprocal
  }

  pow(power) {
    if (power >= 0) {
      return type.new(numerator.pow(power), denominator.pow(power))
    } else {
      return type.new(denominator.pow(-power), numerator.pow(-power))
    }
  }

  expreal(base) {
    return Math.nthroot(base.pow(numerator), denominator)
  }
}

class Math {
  static gcd(a, b) { b == 0 ? a : gcd(b, a % b) }
  static nthroot(num, root) { 1.exp.pow(num.log / root) }
}
