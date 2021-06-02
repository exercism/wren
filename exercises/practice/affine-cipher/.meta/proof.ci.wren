var NUMBERS = "0123456789"

class Strings {
    static downcase(s) {
        return s.bytes.map { |x|
            if ((65..90).contains(x)) x = x + 32
            return String.fromByte(x)
        }.join("")
    }
    static isNumber(s) { NUMBERS.contains(s) }
}

class Maths {
  static areCoprimes(a,b) {
    var min = a.min(b)

    for (i in min...1) {
      if (a % i == 0 && b % i == 0) {
        return false
      }
    }
    return true
  }

  static positiveModulo(a,b) { ((a % b) + b) % b }
  static findMMI(a, m) {
    var i = 1

    while (true) {
      i = i + 1

      if ((a * i - 1) % m == 0) {
        return i
      }
    }
  }
}

var ALPHABET = "abcdefghijklmnopqrstuvwxyz"

class AffineCipher {
  static encode(text, opts) {
    var i = 0
    var a = opts["a"]
    var b = opts["b"]
    guaranteeCoprime(a, ALPHABET.count)
    return pad5(code_(text) { |x| ((a*x) + b) % ALPHABET.count })
  }
  static decode(text, opts) {
    var a = opts["a"]
    var b = opts["b"]
    guaranteeCoprime(a, ALPHABET.count)
    var mmi = Maths.findMMI(a, ALPHABET.count)
    return code_(text) { |x| Maths.positiveModulo(mmi * (x - b), ALPHABET.count) }
  }
  static code_(text, fn) {
    var out = ""
    for (char in Strings.downcase(text)) {
      var e = transformChar(char,fn)
      if (e == null) continue

      out = out + e
    }
    return out
  }
   static guaranteeCoprime(a,m) {
    if (!Maths.areCoprimes(a, m)) {
      Fiber.abort("a and m must be coprime.")
    }
  }
  static transformChar(char, fn) {
      if (Strings.isNumber(char)) return char
      var x = ALPHABET.indexOf(char)
      if (x == -1) return null

      return ALPHABET[fn.call(x)]
  }
  static pad5(test) {
    var out = ""
    while (test.count >= 5) {
      out = out + test[0...5] + " "
      test = test[5..-1]
    }
    out = out + test
    return out.trim()
  }
}