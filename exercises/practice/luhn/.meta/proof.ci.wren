class Lists {
  static reverse(list) { list[-1..0].toList }
  static groupsOf(size, c) {
    var itt = c.skip(0)
    var list = []
    while (itt.count > 0) {
      var g = itt.take(size).toList
      list.add(g)
      // pad with null
      while (g.count < size) g.add(null)
      itt = itt.skip(2)
    }
    return list
  }
}

var NUMBERS = "0123456789"

class Luhn {
  static valid(number) { Luhn.new(number).isValid }
  construct new(number) { _number = number.replace(" ","") }
  digits {  _number.map {|x| Num.fromString(x) }.toList }
  double(n) {
    n = n * 2
    if (n > 9) n = n - 9
    return n
  }
  hasNonDigits { _number.any { |x| !NUMBERS.contains(x)} }
  tooShort { _number.count <= 1 }
  isValid {
    if (tooShort) return false
    if (hasNonDigits) return false

    var sum = Lists.groupsOf(2,Lists.reverse(digits)).map { |group|
      var a = group[0]
      var b = group[1] || 0
      return a + double(b)
    }.reduce(0) { |sum,n| sum + n }
    return sum % 10 == 0
  }
}