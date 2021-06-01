class Number {
  static digits(n) { n.toString.bytes.map {|x| Num.fromString(String.fromByte(x)) }.toList }
  static isArmstrong(n) {
    var digits = digits(n)
    var sum = digits.reduce(0) { |acc, c |
      return acc + c.pow(digits.count)
    }
    return sum == n
  }
}