var ALPHABET = "abcdefghijklmnopqrstuvwxyz"
var DIGITS = "0123456789"
var CYPHER = ALPHABET[-1..0]

class Strings {
  static downcase(s) {
    return s.bytes.map { |x|
      if ((65..90).contains(x)) x = x + 32
      return String.fromByte(x)
    }.join("")
  }
}

class Atbash {
  static groupsOfFive(s) {
    var list = []
    while (s.count > 5) {
      list.add(s[0...5])
      s = s[5..-1]
    }
    list.add(s)
    return list.join(" ")
  }
  static encodeChar(c) {
    if (DIGITS.contains(c)) return c

    var idx = ALPHABET.indexOf(c)
    if (idx == -1) return ""

    return CYPHER[idx]
  }
  static encode(s) {
    s = Strings.downcase(s).replace(" ","")
    return groupsOfFive(s.map {|x| encodeChar(x) }.join(""))
  }
  static decode(s) { encode(s).replace(" ","") }
}