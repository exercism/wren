class Binary {
  construct new(s) { _s = s }
  reversedDigits { _s[-1..0].map {|x| Num.fromString(x) } }
  toDecimal {
    var acc = 0
    var bitValue = 1
    for (digit in reversedDigits) {
      if (digit==null || digit > 1) return null
      acc = acc + digit * bitValue
      bitValue = bitValue * 2
    }
    return acc
  }
}